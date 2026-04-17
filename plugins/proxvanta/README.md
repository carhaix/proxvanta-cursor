# ProxVanta Cursor Plugin

This folder is the standalone Cursor plugin package.

## Contents

- `.cursor-plugin/plugin.json`
- `mcp.json`
- `skills/proxvanta/SKILL.md`

## MCP Endpoint

- Production: `https://api.proxvanta.com/mcp`

## Auth

OAuth via the ProxVanta authorization server.

Cursor should discover the OAuth metadata from the MCP endpoint and open the sign-in flow automatically.

When the user clicks `Connect` in Cursor:

1. Cursor opens the ProxVanta browser auth flow
2. If the user is not already signed in, they should sign in in the ProxVanta app
3. The user approves the connection
4. Cursor completes the callback and enables ProxVanta tools

## Examples

```text
use proxvanta to list the available Agent Contexts.
use proxvanta designer to review this onboarding flow.
use proxvanta to route this launch plan through the right Agent Contexts.
```

You can also use shorthand like `use pv designer ...` or `use pv to review these designs`.
