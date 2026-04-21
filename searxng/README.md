- https://docs.searxng.org/admin/installation-docker.html
- https://github.com/searxng/searxng/tree/master/container

## Setup

1. Ensure the config directory exists at your `VOLUMES_BASE/CONTAINER_NAME` path
2. Place `settings.yml`, `limiter.toml`, and `favicons.toml` in the config directory
3. Set `secret_key` in `settings.yml` to a random string — the entrypoint only auto-generates one if `settings.yml` doesn't exist
4. Start the container

## Notes

- The `redis.url` in `settings.yml` is hardcoded to `redis://searxng-valkey:6379/0` — if you change `CONTAINER_NAME_VALKEY`, update `settings.yml` to match
- SearXNG runs as uid 977 internally; `FORCE_OWNERSHIP=true` (default) fixes volume permissions automatically
- Config file updates are detected: if the upstream template is newer, a `.new` file is placed alongside for manual merge
