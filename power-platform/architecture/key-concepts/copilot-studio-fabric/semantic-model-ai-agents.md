---
title: Prepare a semantic model for AI agents
description: Learn how to prepare a Power BI or Microsoft Fabric semantic model so that AI agents return accurate, fast, and secure answers, with a readiness checklist.
#customer intent: As a data modeler, I want to prepare a semantic model for AI agents so that agents that query it return accurate and consistent figures.
author: manuelap-msft
ms.author: chinmayk
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: concept-article
ms.date: 11/26/2026
---

# Prepare a semantic model for AI agents

The semantic model is the most important factor in the accuracy, speed, and cost of an agent that answers questions over Microsoft Fabric or Power BI data. An agent architecture built on a star schema, with governed measures, a marked date table, and documented names, helps agents return more accurate answers and respond faster. Prompt tuning can't compensate for a model that leaves the agent guessing. This article explains how to prepare a semantic model before you build an agent, and ends with a readiness checklist you can use with your data team.

## Why the model matters

Every agent architecture over Fabric data, whether a Fabric data agent writes the queries or your own Copilot Studio agent does, queries the same semantic model. When the business logic lives in the model, the agent reads a trusted value. When it doesn't, the agent must reproduce the logic in every query, which increases the risk of incorrect results.

Use the same semantic model for both your Power BI reports and your agent so both use the same definitions. When a user questions a number in an agent's answer, you can compare it with the report and trace it to the underlying measure.

:::image type="content" source="media/01-semantic-model-data-flow.png" alt-text="Diagram showing data flowing from a source platform into Fabric, a star-schema semantic model, and a measures table read by the agent and reports." lightbox="media/01-semantic-model-data-flow.png" border="true":::

## Use a star schema with a measures table

A conventional star schema works well for agents. Keep one fact table, a small set of descriptive dimensions, a marked date table, and a dedicated table that holds the governed measures.

The following example shows an illustrative sales volume model. Use it as a pattern and adapt the names to your own data.

| Table | Contents | Guidance for agent builders |
|---|---|---|
| fact_sales_volume | period, scenario, product_key, region_key, channel_key, amount, plus pivoted scenario columns: Actuals, Forecast, Target, Prior Year | Query the pivoted columns or the measures, never the raw scenario code. |
| dim_product | category, subcategory, model, new_product_flag | Use the flag to compare new and existing products. |
| dim_region | 'sales region', country, 'country cluster' | Quote names that contain spaces exactly. |
| dim_channel | channel, subchannel, customer_group | Drives the channel commentary. |
| dim_date | Marked date table | Required for time intelligence such as SAMEPERIODLASTYEAR. |
| _Measures | Governed DAX measures | The agent's first choice for every figure. |

### Star schema or flattened table?

An agent doesn't require a single flattened table with prejoined data, pivoted scenarios, and precalculated variances. A star schema with governed measures is sufficient for most scenarios.  Flattening is an option, not a prerequisite.

Start with basic model preparation: add a dedicated, marked date table, hide surrogate keys, and add a description to every measure. Defer preaggregation until your evaluation shows that the model, rather than the instructions or the harness, limits accuracy or speed.

## Put the business logic in governed measures

Define a measure for every benchmark and variance the business uses. In the sales volume example, the base measures cover Actuals, Forecast, Target, and Volume, with Prior Year derived through SAMEPERIODLASTYEAR. Build on these measures to calculate variances against forecast, target, and prior year, expressed as both absolute values and percentages. Include year-to-date and month-to-date variants.

```dax
Actuals = IFERROR ( CALCULATE ( SUM ( fact_sales_volume[Actuals] ) ), 0 )
Prior Year = CALCULATE ( [Volume], SAMEPERIODLASTYEAR ( dim_date[Date] ) )
vs Target % = IFERROR ( DIVIDE ( [vs Target], [Target] ), 0 )
```

Governed measures provide the following benefits:

- The engine performs the calculations, and the agent retrieves a single governed value, reducing accuracy errors.
- Shorter queries reduce response time and token use.
- Aggregated results stay well within connector row limits.
- Reports, the agent, and the evaluation pack share a single source of truth.

## Abstract volatile source codes

Source systems often use scenario codes that change over time. For example, a forecast code might change every month. Any query that filters on a raw code silently stops returning the right data at the next forecast cycle.

Give the agent one rule: never filter on the raw code. Instead, expose each scenario through a stable pivoted column or a measure.

| Raw code (example) | Pivoted column | Meaning |
|---|---|---|
| ACT | Actuals | Actual volumes |
| PY_RESTATED | Prior Year | Restated prior-year volumes |
| FC_2026_09 | Forecast | Current forecast (code changes each cycle) |
| FC_2026_10_DRAFT | Forecast Proposed | Proposed next forecast |
| BUD_2026 | Target | Budget target |

## Document names, data types, and units

When an agent writes its own queries, incorrect names and mismatched naming and data types can cause errors. Document the model in a form you can paste into agent instructions or a skill. For example:

- Exact table and column names, including spaces and capitalization.
- The data type of every column the agent might filter or group on, so the agent never compares text with a number.
- A list of measures with descriptions of what each measure calculates.
- Codes and columns the agent must never use.
- The unit convention.

State the unit convention explicitly. If the model stores raw units but your reports display them in thousands, document this convention in both the model documentation and the agent instructions. For example, "Divide every figure by 1,000 and show it as k." A mismatch between the units a query returns and the units an answer displays is an easy mistake to miss and a damaging one to ship.

## Prepare security before the pilot widens

Agents that query the model through the Power BI connector use each user's identity, so the model's security controls also apply to the agent. Before you build:

- Enable the **Semantic Model Execute Queries REST API** tenant setting for the security group that uses the agent.
- Plan to grant **Read** and **Build** on the semantic model and **Viewer** on the workspace. Don't assign agent users the **Contributor**, **Member**, or **Admin** roles because these roles bypass row-level security.
- Before making the agent available beyond a pilot group, define row-level security roles and assign Microsoft Entra security groups to those roles.

## Readiness checklist

Use this checklist with your data team before agent work begins.

| Check | Why it matters |
|---|---|
| A marked date table exists and is related to the fact table. | Time intelligence measures, such as prior year through SAMEPERIODLASTYEAR, depend on it. |
| Every benchmark and variance the business uses exists as a measure. | The agent reads governed values instead of re-creating the math. |
| Every measure has a description. | Descriptions guide both the agent and human reviewers to the right measure. |
| Surrogate keys and technical columns are hidden. | The agent is less likely to group or filter on meaningless columns. |
| Exact table and column names, including spaces and data types, are documented. | Naming and type mismatches cause most query errors on direct-query architectures. |
| Volatile source codes are abstracted behind measures or pivoted columns. | Queries keep working when codes change each cycle. |
| The unit convention is documented. | Answers display figures in the unit users expect. |
| Key figures reconcile with the Power BI report, for example a group year-to-date total. | Evaluation needs a trusted baseline. |
| Query permissions and the execute-queries tenant setting are in place. | Direct-query architectures fail at setup without them. |
| Row-level security roles are defined where a wider rollout is planned. | User identity flows through to the data on connector-based architectures. |

## Next step

Put your prepared model to work in an analytics agent. Explore a reference architecture with live DAX queries, query recovery, and formatted answers for users to review.

> [!div class="nextstepaction"]
> [Build an analytics agent over a Fabric semantic model](copilot-studio-fabric-analytics-agent.md)

## Contributors

*Microsoft maintains this article. The following contributors wrote this article.*

Principal author:

- [Chinmay Kodaganur](https://www.linkedin.com/in/chinmay-kodaganur/), Product Manager II

## Related resources

- [Choose an architecture to connect Copilot Studio agents to Microsoft Fabric data](index.md)
- [Evaluate analytical agents with an output contract and golden prompts](evaluate-analytical-agents.md)
