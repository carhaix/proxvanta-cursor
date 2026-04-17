---
name: proxvanta
description: Use when the user wants Cursor to invoke ProxVanta as an MCP-backed app/tool surface, such as `use ProxVanta designer review this flow`, `use pv designer review this flow`, `use ProxVanta designer+growth-lead review this flow`, or `use pv designer+growth-lead review this flow`. Prefer ProxVanta operations like listing Agent Contexts and loading agent context over treating the text as plain English.
---

# ProxVanta

Use this skill when the user wants Cursor to invoke ProxVanta first, then carry out work with ProxVanta context loaded. Treat both `use ProxVanta ...` and `use pv ...` as valid invocation forms for the same MCP-backed tool surface.

This skill is for the packaged ProxVanta plugin surface in Cursor.

This packaged Cursor version is intentionally scoped to Agent Context loading and routing against the production MCP server. It does not depend on repo-local skills or external plugin instructions.

When the user names one or more Agent Contexts, call `proxvanta_use_agent_context` first and pass the raw selector through unchanged as `agentContextId`.

Preserve `+` for multiple Agent Contexts and `@2` or `@v2` for versions. Use
`proxvanta_start_prompt_session` for sticky thread context. Only fall back to `proxvanta_recommend_agent_context` if `proxvanta_use_agent_context` cannot resolve the
selector.
