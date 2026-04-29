---
name: agent-context-session
description: Start a sticky ProxVanta Agent Context session for the current Cursor thread.
---

Use this command when the user wants a named Agent Context to stay active for the thread.

Examples:
- `/agent-context-session software-engineer`
- `/agent-context-session product-manager`

Call `proxvanta_start_prompt_session` with:
- `agentContextId`: the named Agent Context exactly as provided by the user

After starting the session, confirm that the Agent Context session is active for the current thread.
