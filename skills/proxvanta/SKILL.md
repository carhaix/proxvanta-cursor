---
name: proxvanta
description: Use ProxVanta to load Agent Contexts from the connected MCP server. Use when the user asks for ProxVanta directly, names an Agent Context, or wants sticky ProxVanta context in the current thread.
---

# ProxVanta

## When to use

- When the user says `use ProxVanta ...` or `use pv ...`
- When the user names one or more ProxVanta Agent Contexts
- When the user wants ProxVanta context loaded into the current thread
- When the user wants to list available Agent Contexts before choosing one

## Instructions

1. Treat `ProxVanta` and `pv` as the same plugin surface.
2. If the user wants to browse available contexts, call `proxvanta.agent-contexts.list`.
3. If the user names an Agent Context and provides a task, call `proxvanta.agent-contexts.use`.
4. Pass the Agent Context selector through unchanged as `agentContextId`.
5. Preserve `+` for multiple Agent Contexts and `@2` or `@v2` for versions.
6. If the user wants sticky context for the current thread, call `proxvanta.agent-contexts.start-session`.
7. Only use `proxvanta.agent-contexts.recommend` when the user does not know which Agent Context to use or the provided selector cannot be resolved.
8. Prefer ProxVanta MCP operations over treating the request as plain English when the user clearly intends to use ProxVanta.
