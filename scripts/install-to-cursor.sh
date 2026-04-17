#!/usr/bin/env bash

set -euo pipefail

CURSOR_DIR="${HOME}/.cursor"
MCP_FILE="${CURSOR_DIR}/mcp.json"
TMP_FILE="$(mktemp)"

mkdir -p "${CURSOR_DIR}"

if [ -f "${MCP_FILE}" ] && command -v jq >/dev/null 2>&1; then
  jq '
    .mcpServers = (.mcpServers // {}) |
    .mcpServers.proxvanta = {
      "type": "streamable_http",
      "url": "https://api.proxvanta.com/mcp"
    }
  ' "${MCP_FILE}" > "${TMP_FILE}"
  mv "${TMP_FILE}" "${MCP_FILE}"
elif [ -f "${MCP_FILE}" ]; then
  echo "Error: ${MCP_FILE} already exists and jq is not installed."
  echo "Install jq and rerun this script so it can safely merge the ProxVanta server entry."
  exit 1
else
  cat > "${MCP_FILE}" <<'JSON'
{
  "mcpServers": {
    "proxvanta": {
      "type": "streamable_http",
      "url": "https://api.proxvanta.com/mcp"
    }
  }
}
JSON
fi

cat <<'EOF'
Installed ProxVanta for Cursor.

Next:
1. Restart Cursor.
2. Complete the ProxVanta sign-in flow if Cursor prompts you.
3. Ask Cursor:
   Use ProxVanta to list the available Agent Contexts.
   Use pv to list the available Agent Contexts.
EOF
