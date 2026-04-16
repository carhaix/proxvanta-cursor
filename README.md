# ProxVanta For Cursor

This repo exists to get ProxVanta working in Cursor.

## Quick Start

1. Install ProxVanta into Cursor:

```bash
bash scripts/install-to-cursor.sh
```

2. Restart Cursor.

3. In Cursor, click `Connect` when ProxVanta shows `Needs authentication`.

4. Cursor opens the ProxVanta sign-in and approval flow in your browser.

5. If you are not already signed in, sign in on `app.proxvanta.com`, then approve the connection.

6. Return to Cursor after the browser flow completes.

7. Then try:

```text
Use ProxVanta to list the available Agent Contexts.
```

## Commands

```bash
# Install the ProxVanta MCP server into Cursor
bash scripts/install-to-cursor.sh

# Optional: confirm the Cursor MCP config was written
cat ~/.cursor/mcp.json
```

## MCP Endpoints

- Production: `https://api.proxvanta.com/mcp`

## Examples

```text
Use ProxVanta to list the available Agent Contexts.
Use ProxVanta designer to review this onboarding flow.
Use ProxVanta growth-lead to find monetization opportunities in this pricing page.
Use ProxVanta to route this launch plan through the right Agent Contexts.
```

## Files

- `scripts/install-to-cursor.sh`: installs ProxVanta into `~/.cursor/mcp.json`
- `plugins/proxvanta`: standalone Cursor plugin package for production

## OAuth

This Cursor package is OAuth-first.

Cursor should discover the ProxVanta MCP OAuth metadata from `https://api.proxvanta.com/mcp` and open the sign-in flow automatically.

The expected connect flow is:

1. Cursor reaches `https://api.proxvanta.com/mcp`
2. ProxVanta advertises MCP OAuth metadata
3. Cursor opens the browser
4. The browser is redirected into the ProxVanta app auth flow
5. If the user is not logged in, they sign in first
6. The user approves the MCP connection
7. Cursor completes the OAuth callback and enables ProxVanta tools

If you intentionally need a non-OAuth fallback for another client or local debugging, that should be documented separately from this Cursor package.
