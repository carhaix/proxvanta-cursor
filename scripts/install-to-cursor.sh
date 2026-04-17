#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CURSOR_DIR="${HOME}/.cursor"
CURSOR_PLUGIN_DIR="${CURSOR_DIR}/plugins/local/ProxVanta"
MCP_FILE="${CURSOR_DIR}/mcp.json"
TMP_FILE="$(mktemp)"

mkdir -p "${CURSOR_DIR}" "$(dirname "${CURSOR_PLUGIN_DIR}")"
rm -rf "${CURSOR_PLUGIN_DIR}"
mkdir -p "${CURSOR_PLUGIN_DIR}"

cp -R \
  "${REPO_ROOT}/.cursor-plugin" \
  "${REPO_ROOT}/assets" \
  "${REPO_ROOT}/commands" \
  "${REPO_ROOT}/skills" \
  "${REPO_ROOT}/mcp.json" \
  "${CURSOR_PLUGIN_DIR}/"

if [ -f "${MCP_FILE}" ] && command -v jq >/dev/null 2>&1; then
  jq '
    .mcpServers = (.mcpServers // {}) |
    del(.mcpServers.proxvanta) |
    .mcpServers.ProxVanta = {
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
    "ProxVanta": {
      "type": "streamable_http",
      "url": "https://api.proxvanta.com/mcp"
    }
  }
}
JSON
fi

cat <<'MSG'
Installed ProxVanta for Cursor.

This script installed:
- MCP server config in ~/.cursor/mcp.json
- Cursor plugin bundle in ~/.cursor/plugins/local/ProxVanta

Next:
1. Restart Cursor.
2. Complete the ProxVanta sign-in flow if Cursor prompts you.
3. Try /list-agent-contexts or: use ProxVanta list the available Agent Contexts.
MSG
