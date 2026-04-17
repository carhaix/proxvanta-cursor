Use a named ProxVanta Agent Context for a concrete task.

Use this command when the user provides an Agent Context name and a task.

Examples:
- `/agent-context designer review this onboarding flow`
- `/agent-context engineer explain this auth change`
- `/agent-context growth-lead find monetization opportunities in this pricing page`

Call `proxvanta_use_agent_context` with:
- `agentContextId`: the named Agent Context exactly as provided by the user
- `prompt`: the remaining task text

If the user only gives an Agent Context name and no task, ask for the task or use `proxvanta_get_agent_context` if the intent is to load reusable context only.
