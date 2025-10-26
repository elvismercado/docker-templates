# Cloudflare Tunnel

- https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/
- https://dash.cloudflare.com/one (Zero Trust dashboard)

## Prerequisites

- Domain nameservers on Cloudflare (for auto DNS record creation)
- Cloudflared container running with a valid `TUNNEL_TOKEN`
- Both containers on the same Docker network

No port forwarding or public IP needed on the host.

```
                         Cloudflare Edge (HTTPS)
  Browser ──────────────────► example.com
                                  │
                            ┌─────▼──────┐
                            │  Cloudflare │
                            │   Network   │
                            └─────┬──────┘
                      Encrypted tunnel (QUIC/HTTP2)
                                  │
           ┌──────────────────────▼───────────────────────┐
           │  Docker Host                                 │
           │                                              │
           │  ┌──────────────┐    HTTP    ┌────────────┐  │
           │  │  cloudflared │──────────► │   myapp    │  │
           │  │  (tunnel)    │            │   :8080    │  │
           │  └──────────────┘            └────────────┘  │
           │          docker network (shared)              │
           └──────────────────────────────────────────────┘
```

## Routing a Domain to a Docker App

Cloudflared reaches apps via Docker's internal DNS — use the **container name** as hostname.

1. Zero Trust > **Networks** > **Connectors** > select tunnel > **Public Hostname** > **Add a public hostname**
2. Configure:
   - **Subdomain**: *(leave empty for root domain)*
   - **Domain**: `example.com`
   - **Type**: `HTTP`
   - **URL**: `containername:port` (e.g., `dashy:8080`)
3. Save — Cloudflare auto-creates a CNAME DNS record (requires domain nameservers on Cloudflare)

HTTPS is handled at Cloudflare's edge. The tunnel uses HTTP internally — no certs needed on the origin.

For HTTPS origins (self-signed certs), use **Type**: `HTTPS` and enable **No TLS Verify** under Additional application settings > TLS.

## Networking

### Same Compose Stack

If cloudflared and the app share a compose network, the container name resolves automatically:

```
┌─────────── docker network ────────────┐
│                                       │
│  cloudflared ──► myapp:8080           │
│       (DNS resolves container name)   │
│                                       │
└───────────────────────────────────────┘
```

Service URL in dashboard: `myapp:8080`

The app's `ports:` mapping is optional — only needed for direct host access, not for tunnel routing.

### Cross-Stack

```
┌── cloudflared network ──┐   ┌── app-network ──────────┐
│                         │   │                         │
│  cloudflared ───────────┼──►│  myapp:8080             │
│                         │   │                         │
└─────────────────────────┘   └─────────────────────────┘
         (member of both networks)
```

If the app is in a different compose stack, add its network as external to cloudflared:

```yaml
networks:
  default:
    name: ${CONTAINER_NAME:-cloudflared}
    ipam:
      config:
        - subnet: ${SUBNET:-10.42.0.0/24}
  app-network:
    external: true

services:
  cloudflared:
    networks:
      - default
      - app-network
```

## Metrics (Optional)

The compose file has commented-out `TUNNEL_METRICS` and `METRICS_PORT` vars. Uncomment to expose:

- `/ready` — 200 when tunnel is connected, 503 otherwise (use with Uptime Kuma, etc.)
- `/metrics` — Prometheus-format metrics (scrape with Prometheus/Grafana)
