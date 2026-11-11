---
title: Metrics and recommendations for Copilot Studio
description: Learn more about the metrics and recommendations for Copilot Studio.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 11/05/2026
author: arjunmayur
ms.author: arjunmayur
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
  - arjunmayur
  - trdehove
---


# Metrics and recommendations for Copilot Studio

Copilot Studio operational health metrics are available in the Power Platform admin center.

## View Copilot Studio metrics

 1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
 1. In the navigation pane, select **Monitor**.
 1. In the **Monitor** pane, under **Products**, select **Copilot Studio**.

    The **Copilot Studio** page displays the metrics for conversational and autonomous agents created in Copilot Studio. For agents that use GitHub Copilot, Copilot Studio uses AI to review each completed session and assign it a single outcome, such as resolved, escalated, or abandoned. Monitor then uses that outcome to decide whether the session counts as a success or a failure. The AI analysis runs after the session ends, so metrics for these agents can appear in Monitor up to 48 hours after usage.
    
## Copilot Studio metrics and recommendations

### Metric definitions

| Type | Metric | Definition | Support |
|---|---|---|---|
| Agents | Agent session success rate| A percentage that describes how often an autonomous agent is able to successfully execute its task, or how often a conversational agent's session was successfully resolved. | Generally available |
| Agents | Recent agent sessions | The number of distinct user sessions in an agent in one day. A session begins when a user opens the agent and ends after a period of inactivity or when the agent is closed. |  Generally available |

### Session outcome mapping

The following table shows how Monitor counts each session outcome for agents that use GitHub Copilot.

| Session outcome | What it means | Agent session success rate | Recent agent sessions |
|---|---|---|---|
| **Resolved – confirmed** | The user confirmed that their need was met. | ✅ Success | Counted |
| **Resolved – implied** | The user's need appears to be met, even though the user didn't explicitly confirm it. | ✅ Success | Counted |
| **Escalated – system intended** | The agent handed off the session because of an escalation rule the maker configured. The agent did what it was designed to do. | ✅ Success | Counted |
| **Escalated – user requested** | The user asked to talk to a person. | ❌ Failure | Counted |
| **Escalated – system unintended** | The session was escalated because the agent, or a tool or flow it called, failed. | ❌ Failure | Counted |
| **Unresolved – agent failure** | The agent said it couldn't help with the request. | ❌ Failure | Counted |
| **Unresolved – user rejected** | The user rejected the agent's answer. | ❌ Failure | Counted |
| **Unresolved – incomplete** | The session ended with the user's need still open. | ❌ Failure | Counted |
| **Abandoned** | The user stopped responding before the session ended. | ❌ Failure | Counted |
| **Unengaged** | The user never sent a message to the agent, so there's no outcome. | Excluded | Not counted |
| **Not analyzed** | No outcome could be determined. For example, the session was too large to analyze, it was skipped because of analysis capacity limits, or the analysis didn't return a valid result. | Excluded | Not counted |

### How the success rate is calculated

Monitor calculates the success rate only from sessions that have an outcome:

**Agent session success rate** = successful sessions ÷ (successful sessions + failed sessions)

> [!NOTE]
> - Each session is counted once.
> - This mapping applies to conversational sessions for agents that use GitHub Copilot. Autonomous agents continue to report success based on whether each run completed its task.

### Tips for improving your success rate
- **Many "Unresolved" or "Escalated – user requested" outcomes:** Check that the agent has the knowledge sources and instructions it needs to answer common questions.
- **Many "Escalated – system unintended" outcomes:** Look for failing tools, connectors, or flows that the agent calls.
- **Many "Abandoned" outcomes:** Review session transcripts to see where users drop off, for example after long responses or repeated clarifying questions.
