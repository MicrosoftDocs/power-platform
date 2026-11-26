---
title: Copilot Studio analytics agent over a Fabric semantic model
description: Build a Copilot Studio agent on the Microsoft Copilot harness that answers business questions with live DAX queries over a governed Fabric semantic model.
#customer intent: As a solution architect, I want a proven architecture for an analytics agent over a Fabric semantic model so that users get fast, trusted answers in Microsoft Copilot.
author: manuelap-msft
ms.author: chinmayk
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 11/26/2026
---

# Copilot Studio analytics agent over a Microsoft Fabric semantic model

This reference architecture shows how to build a Copilot Studio agent that answers business questions over a governed Microsoft Fabric or Power BI semantic model. The agent runs on the Microsoft Copilot harness, writes DAX queries at run time, and runs them read-only through the Power BI connector. Every figure in an answer comes from a live query result, and the agent corrects and retries a failed query before it responds. Use this pattern when you have a semantic model with stable, documented measures and your users need fast, consistently formatted answers with narrative commentary in Microsoft Copilot or Microsoft Teams.

Business analysts spend much of each reporting cycle extracting figures, comparing them with forecasts and targets, and writing commentary. An analytics agent can take on that repetitive work, as long as people trust the numbers it returns.

This architecture keeps the numbers trustworthy by separating responsibilities. The semantic model owns the business logic through governed measures. The agent owns the conversation: it interprets the question, composes a query that reuses those measures, and turns the results into a formatted answer. A person reviews and signs off every answer before it's shared further.

Compare this pattern with other ways to connect an agent to Fabric data in [Choose an architecture to connect Copilot Studio agents to Microsoft Fabric data](index.md).

> [!TIP]
> This article provides an example scenario and a generalized example architecture that show how to build an analytics agent with Copilot Studio over a Microsoft Fabric semantic model. You can adapt the architecture for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/06-reference-architecture-analytics-agent.png" alt-text="Diagram of a Copilot Studio agent that queries a Power BI semantic model through the Power BI connector, secured by Microsoft Entra ID." border="true" lightbox="media/06-reference-architecture-analytics-agent.png":::

## Workflow

1. **Ask.** A user asks a question in natural language in Microsoft Copilot or Teams, such as "How did sales volume in our priority markets compare with the forecast last month?"
1. **Interpret.** The agent identifies the metric, the comparison (actuals, forecast, target, or prior year), the scope (product, region, or channel), and the time window.
1. **Generate the query.** Guided by its instructions and the DAX query skill, the agent writes a DAX EVALUATE statement that reuses the governed measures in the semantic model.
1. **Run the query read-only.** The Power BI connector action *Run a query against a dataset* runs the query against the semantic model with the user's own identity and permissions, and returns the result rows.
1. **Self-correct.** If the query fails, for example because of a misnamed column or a data type mismatch, the agent reads the error, corrects the DAX query, and runs it again.
1. **Compose the answer.** The agent applies the output contract. It scales figures to the agreed unit, builds the results table, flags each variance, and drafts commentary from the query results only.
1. **Review.** The user reviews the answer and signs off before using it in reports or presentations.

## Components

| Component | Role in this architecture |
|---|---|
| Copilot Studio | Hosts the agent, its instructions, its skill, and its tools, and publishes the agent to Microsoft Copilot and Teams. |
| Microsoft Copilot harness | Runs the agent in an agentic loop so the agent can retry a failed query. Supports skills and long instructions. |
| Agent instructions | Define the agent's role, scope, tool usage, calculation rules, output format, and hard rules. |
| DAX query skill | Carries the semantic model schema, the DAX workflow, tested query patterns, and the target workspace and semantic model IDs. |
| Power BI connector | Runs a read-only DAX query against the semantic model through the *Run a query against a dataset* action and returns the rows. |
| Fabric semantic model | Provides a star schema, a marked date table, and a table of governed measures. Serves as the single source of truth for the agent and for Power BI reports. |
| Fabric workspace | Hosts the semantic model and controls workspace access. |
| Microsoft Entra ID | Authenticates each user. Security groups map users to workspace access and row-level security roles. |
| Microsoft Copilot and Teams | Give users the channels where they ask questions and receive answers. |

## Scenario details

Use this architecture when analysts need repeatable comparisons and draft commentary based on governed business measures. The following finance scenario illustrates the pattern, with potential use cases for other teams that have similar reporting needs.

### Example scenario

Consider a finance team that spends much of each month on sales volume analysis. Before each reporting deadline, analysts extract volume data by hand. They compare actuals with the latest forecast, the budget target, and the prior year. They trace each variance by product category, region, and sales channel, and write commentary for leadership. This work is repetitive, and its quality depends on who does it.

By using this architecture, analysts ask volume questions in Microsoft Copilot and get a standard results table, variance explanations, and draft commentary to review and sign off. The agent is read-only, reports sales volume only, and declines questions outside that scope.

Source data can stay in an existing data platform and be loaded into Microsoft Fabric. A single semantic model serves both the Power BI reports and the agent, so when an analyst checks an agent answer against a report, both use the same definitions.

Because each question needs only a direct query against governed measures, typical questions return in seconds rather than minutes. Test the agent against a set of known good prompts. The agent should return exact line-item figures, decline to calculate year-over-year variance when no prior-year data exists, and refuse out-of-scope requests.

### Potential use cases

- **Finance:** Variance analysis against forecast, budget, and prior year, with draft month-end commentary.
- **Sales operations:** Bookings and volume performance by region, product, and channel.
- **Supply chain:** Shipments and inventory compared with planned targets.
- **Retail:** Store, category, and promotion performance over time.
- **Workforce analytics:** Headcount and attrition compared with planned targets, secured with row-level security.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../../includes/pp-arch-ppwa-link.md)]

### Reliability

- **Put the business logic in the model.** Governed measures let the engine do the math, so the agent reads one trusted value instead of recreating the calculation.
- **Abstract volatile codes.** If forecast scenario codes change every reporting cycle, expose them through measures or pivoted columns so queries keep working.
- **Self-correct instead of failing.** The Microsoft Copilot harness lets the agent read a query error, correct the DAX query, and retry within the same turn.
- **Check totals.** Have the agent calculate subtotals from verified line items and check that each subtotal matches the sum of its line items before responding.
- **Test where users work.** Behavior in the test pane can differ from the published channel. Finish every test cycle in the published channel.

### Security

- **End user identity:** The Power BI connector uses each user's identity to query only the data they have permission to access in the semantic model. Users sign in to Power BI the first time they use the agent.
- **Least privilege:** Grant Viewer access to the workspace and Read and Build permissions on the semantic model. Don't give agent users Contributor, Member, or Admin roles because those roles bypass row-level security. Build permission also lets users create their own reports. Confirm that this capability is appropriate for your users.
- **Read-only tools:** Add only the *Run a query against a dataset* action. Don't add actions that write to or refresh the dataset.
- **Row-level security:** Before you make the agent available to a wider audience, create Microsoft Entra security groups for each group of users with the same access requirements, define row-level security roles on the semantic model, assign the security groups to the roles, and grant the groups Viewer access to the workspace and Read and Build permissions on the semantic model.
- **Representative personas:** Developer access rarely matches business-user access. Before rollout, test access and answers with accounts that represent your users' roles and permissions.

### Operational Excellence

- **Portable assets:** Keep the workspace and semantic model IDs in a single configuration block in the skill, and refer to the model by its structure, not by tenant. Build and test against a copy of the model that uses synthetic data, and run the same assets in production. This approach lets you develop and test without sharing production data.
- **Separate behavior from knowledge:** Keep behavior in the instructions and model knowledge in the skill. Reuse the same skill for other agents that use the same model.
- **Regression testing:** Rerun the full evaluation pack after any change to the instructions, the skill, the model, or the semantic model. Learn more in [Evaluate analytical agents with an output contract and golden prompts](evaluate-analytical-agents.md).

### Performance Efficiency

- **Consolidate queries:** One `SUMMARIZECOLUMNS` query that returns everything an answer needs is faster than several small queries, and uses fewer tokens.
- **Aggregate in the model:** Measures return aggregated results, which keeps result sets well within connector row limits.
- **Match the instructions to the job:** Maintain two versions of the agent instructions: one optimized for speed for everyday questions and a detailed version for month-end analysis, where completeness matters more than speed.
- **Choose the model by question complexity:** A fast general-purpose model handles most questions well. Use a stronger reasoning model for complex, multistep analysis. Keep prompts independent of any model name, and rerun your evaluation when you change models.

### Experience Optimization

- **Consistent answers:** Define an output contract (the table layout, row order, units, status indicators, commentary order, and disclaimer) and apply it to every answer.
- **Recommended surface:** Recommend Microsoft Copilot Chat as the primary surface, and keep Microsoft 365 apps up to date.
- **Onboarding:** Explain that users need to sign in to Power BI the first time they use the agent, and give them example questions to get started.

## Responsible AI

- **Human in the loop:** The agent drafts commentary and a person signs off. The agent never publishes output to executives or systems of record.
- **Grounded answers:** Every figure comes from a live query result. If data isn't available, the agent states what's missing instead of estimating a value. For example, a new product might have no prior-year data.
- **Clear scope:** The agent refuses out-of-scope requests and includes a disclaimer that the output is a draft for review.

## Deploy this scenario

Follow these steps to build the agent. Each step assumes the semantic model meets the readiness criteria in [Prepare a semantic model for AI agents](semantic-model-ai-agents.md).

1. **Publish the semantic model** to a Fabric workspace. Check the measures, the marked date table, and the relationships before you build the agent.
1. **Enable the tenant setting** *Semantic Model Execute Queries REST API* for the security group that uses the agent. A Fabric administrator completes this step.
1. **Grant permissions.** Give agent users Read and Build permissions on the semantic model and Viewer access to the workspace. Workspace Viewer access alone isn't sufficient to run queries.
1. **Capture the IDs.** Open the semantic model in the browser and copy the workspace ID (the segment after `/groups/`) and the semantic model ID (the segment after `/datasets/`).
1. **Create the agent** in Copilot Studio on the Microsoft Copilot harness.
1. **Add the tool** *Power BI – Run a query against a dataset*. Add only this read-only action. Don't add actions that refresh a dataset or add rows.
1. **Configure the tool inputs.** Set the query text to *Dynamically fill with AI* so the agent writes the DAX query at run time. Supply the workspace and semantic model IDs from the skill's configuration block.
1. **Add the agent instructions**, as described in [Agent instructions](#agent-instructions).
1. **Upload the DAX query skill** and update the target IDs in its configuration block. Learn more in [DAX query skill](#dax-query-skill).
1. **Select the model** for the agent. Learn more in [Performance Efficiency](#performance-efficiency).
1. **Test** with your evaluation prompts, first in the test pane and then in the published channel, signed in as representative end users.

### Agent instructions

Write rule-based instructions. Explicit rules, structured steps, and strict output standards produce more accurate answers than general guidance. Keep the instructions focused on behavior. Keep information about the model in the skill so the instructions and the skill are easier to maintain.

| Heading | What to include |
|---|---|
| Role | Who the agent serves and what it does and doesn't do. Emphasize that it's read-only and limited to the agreed subject area. |
| Data query action | Which tool to call, which inputs to use, and the rule that every figure must come from a live query result. |
| Data model | A short pointer to the skill, plus any critical naming rules, such as never filtering on raw scenario codes. |
| How to build the right query | The steps from question to DAX, with example query shapes: ROW, SUMMARIZECOLUMNS, CALCULATETABLE, TOPN or ORDER BY, and year-to-date filters. |
| Calculation rules | Unit scaling (for example, divide by 1,000 and show as k), status thresholds (for example, flat within ±2%), and how to derive subtotals. |
| Reasoning process | Compare every line with each benchmark. Prioritize the largest contributors and priority markets, and separate structural drivers from temporary factors. |
| Output format | The results table, section header lines, insight bullets, commentary order, summary scorecard, disclaimer, and follow-up offer. |
| Persistence | Continue until the question is fully answered. On a failed query, correct the DAX and retry rather than stop. |
| Hard rules | Never estimate. Never calculate year-over-year variance without prior-year data. Refuse out-of-scope requests. Never write data. |
| Tone | The language variant and register your audience expects, such as concise executive language. |

The following skeleton shows the shape of a complete instruction set. Replace the text in angle brackets with your own content.

```agent-prompt
## Role
You're the <team> sales volume analytics agent. You answer volume questions
read-only. You never write data and never report revenue or margin.

## Data query action
Use the tool "Run a query against a dataset" for every figure. Every figure
must come from a live query result. Never estimate.

## Calculation rules
Divide every figure by 1,000 and show it in thousands. Flat = within +/-2%.
Add up the verified line items to get each subtotal, and then check the totals.

## Output format
Results table (subtotal first, then rows by actuals, descending), header line,
insights, commentary from portfolio to category to region to channel,
summary scorecard, disclaimer, and follow-up offer.

## Persistence
If a query fails, read the error message, correct the DAX query, and retry.

## Hard rules
Never estimate. Never calculate year-over-year variance without prior-year data.
Refuse out-of-scope requests.
```

### DAX query skill

The skill provides the information that the agent needs to write correct DAX queries for your model. Upload the skill file once so the agent can reuse it across conversations. A good skill has four parts:

- **Frontmatter:** A short name and a description that tells the agent when to use the skill.
- **Configuration block:** The workspace ID and semantic model ID, placed near the top. Retargeting the agent from a development tenant to a production tenant becomes a two-line change.
- **Model schema and DAX workflow:** Tables, exact column names and data types, measures and their descriptions, codes to avoid, and the unit convention. Then the workflow: parse the question, map it to governed measures, choose the DAX query structure, resolve dynamic sets (such as a list of priority markets), and validate the result.
- **Query patterns:** Tested `EVALUATE` examples for each common question type, written against the governed measures.

```markdown
---
name: <domain>-query
description: "Query the <model name> semantic model to answer ANY <domain>
  question. Use for figures, variances, rankings, and trends."
---

## Model schema
Fact and dimension tables, exact column names and types, measures with
descriptions, codes to avoid, unit convention.

## DAX workflow
1. Parse the question (metric, benchmark, scope, time window).
2. Bind to governed measures.
3. Choose the DAX shape.
4. Resolve dynamic sets (for example, priority markets).
5. Validate the result. If there's an error, fix it and retry.

## Query patterns
ROW for single values, SUMMARIZECOLUMNS for breakdowns, CALCULATETABLE for
filtered sets, TOPN or ORDER BY for rankings, and filters for year to date.
```

### Guardrails for valid DAX queries

Most query errors come from mismatched names and data types. Add these guardrails to the agent instructions and the skill:

- Name every table and column exactly as it appears in the model, and quote names that contain spaces, such as 'sales region'.
- State data types, and never compare a text column with a number.
- Reuse governed measures instead of recreating calculations in the query.
- Never filter on raw scenario codes. Use the pivoted scenario columns or the measures.
- Use one consolidated `SUMMARIZECOLUMNS` query instead of many small ones.
- On a failed query, read the error, correct the DAX query, and retry. Never fall back to an estimate.

## Next step

Evaluate your analytics agent before rollout. Learn how to define an output contract, build golden prompts, and test accuracy, response time, and security in the published channel.

> [!div class="nextstepaction"]
> [Evaluate analytical agents with an output contract and golden prompts](evaluate-analytical-agents.md)
## Contributors

*Microsoft maintains this article. The following contributors wrote this article.*

Principal author:

- [Chinmay Kodaganur](https://www.linkedin.com/in/chinmay-kodaganur/), Product Manager II

## Related resources

- [Choose an architecture to connect Copilot Studio agents to Microsoft Fabric data](index.md)
- [Prepare a semantic model for AI agents](semantic-model-ai-agents.md)
- [Copilot Studio documentation](/microsoft-copilot-studio/)
- [Power BI connector reference](/connectors/powerbi/)
- [Execute queries REST API for semantic models](/rest/api/power-bi/datasets/execute-queries)
