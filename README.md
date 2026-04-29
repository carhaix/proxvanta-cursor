# <img src="https://www.proxvanta.com/brand/proxvanta-icon-64px-clipped.png" alt="ProxVanta Logo" style="width: 1em; height: 1em; vertical-align: -0.12em;" /> ProxVanta For Cursor

[Website](https://www.proxvanta.com) | [App](https://app.proxvanta.com)

Install ProxVanta into Cursor today so you can get working on your teams shared contexts and workflows.

You will need a ProxVanta account before connecting ProxVanta to Cursor ([it's free!](https://app.proxvanta.com)).

## Quick Start

1. Install ProxVanta into Cursor:

```bash
bash scripts/install-to-cursor.sh
```

2. Confirm the Cursor plugin bundle was installed:

```bash
find ~/.cursor/plugins/local/ProxVanta -maxdepth 2 -type f | sort
```

3. Restart Cursor.

4. In Cursor, click `Connect` when ProxVanta shows `Needs authentication`.

5. Cursor opens the ProxVanta sign-in and approval flow in your browser.

6. If you are not already signed in, sign in on `app.proxvanta.com`, then approve the connection.

7. Return to Cursor after the browser flow completes.

ProxVanta is provided by the plugin bundle, so the installer does not add a separate `~/.cursor/mcp.json` server entry (avoids duplicate MCP entries).

## Commands

After connecting ProxVanta in Cursor, you can use:

```text
# list the Agent Contexts available to your team
/list-agent-contexts

# use one Agent Context for a focused task
/agent-context designer review this onboarding flow

# keep one Agent Context active for the current thread
/agent-context-session software-engineer

# team agent contexts up to tackle complex problems
/agent-context product-manager+designer+growth-lead+software-engineer review this onboarding flow and improve it so that we see less people dropping off

# test out new updates to your context before pushing changes out to the team
/agent-context designer@2 review these designs, do they align with the new styleguide?
```

## Skills

After connecting ProxVanta in Cursor, you can also use:

```text
# list the Agent Contexts available to your team
use ProxVanta list the available Agent Contexts.

# use one Agent Context for a focused task
use ProxVanta designer to review this onboarding flow.

# keep one Agent Context active for the current thread
use ProxVanta software-engineer in this thread for follow-up implementation work.

# team agent contexts up to tackle complex problems
use ProxVanta product-manager+designer+growth-lead+software-engineer review this onboarding flow and improve it so that we see less people dropping off.

# test out new updates to your context before pushing changes out to the team
use ProxVanta designer@2 review these designs, do they align with the new styleguide?

# use shorthand if you prefer a shorter invocation
use pv software-engineer explain this auth change.
```

You can also use shorthand like `use pv designer ...` or `use pv review these designs`.
