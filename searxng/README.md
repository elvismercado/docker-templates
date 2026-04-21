- https://docs.searxng.org/admin/installation-docker.html
- https://github.com/searxng/searxng/tree/master/container

## Setup

1. Ensure the config directory exists at your `VOLUMES_BASE/CONTAINER_NAME` path
2. Place `settings.yml`, `limiter.toml`, and `favicons.toml` in the config directory
3. Set `SEARXNG_SECRET` in `.env` to a random string — this overrides `server.secret_key` in `settings.yml`
4. Start the container

## Notes

- The valkey URL is set via the `SEARXNG_VALKEY_URL` compose env var using `CONTAINER_NAME_VALKEY` — no hardcoded URL in `settings.yml`
- `settings.yml` uses the `valkey:` config key (renamed from `redis:` upstream) with `url: false` — the compose env var provides the actual URL
- SearXNG runs as uid 977 internally; `FORCE_OWNERSHIP=true` (default) fixes volume permissions automatically
- Config file updates are detected: if the upstream template is newer, a `.new` file is placed alongside for manual merge
