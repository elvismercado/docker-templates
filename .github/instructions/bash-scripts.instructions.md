---
applyTo: "**/*.sh"
description: "Bash script conventions for setup/teardown scripts"
---

## Bash Script Conventions
- Use `set -euo pipefail` at the top
- Number steps with `echo "Step N/TOTAL: Description..."` and section-separator comments
- Every step must be idempotent — check for existing state before acting, skip with a message if already done
- Configuration block at top must mirror between companion scripts (setup.sh ↔ teardown.sh)
- Build COMPOSE_CMD the same way in every script that needs it (env-file + base + prod + conditional custom override)
- Destructive operations require confirmation prompts and default to the safe option
- Avoid steps with host-wide side effects that are difficult to revert (e.g., writing /etc/docker/daemon.json, restarting system services). Keep script scope to the service's own directory tree, .env, and Docker resources (networks, containers).
