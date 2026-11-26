---
title: Evaluate analytical agents with golden prompts
description: Learn how to evaluate analytical agents with an output contract, golden prompts, and hard accuracy gates, and how to rerun tests after every change.
#customer intent: As an agent maker, I want a repeatable way to evaluate an analytical agent so that I can prove its figures are accurate before and after every change.
author: manuelap-msft
ms.author: chinmayk
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: concept-article
ms.date: 11/26/2026
---

# Evaluate analytical agents with an output contract and golden prompts

When an agent answers questions with numbers, exact numerical accuracy matters more than similarity score. Evaluate analytical agents in two parts. First, define an output contract that specifies what every answer must look like. Then build a test set of golden prompts with exact expected answers drawn from a source of truth. Set mandatory pass criteria for numerical accuracy and hallucination, track a small set of supporting metrics, and rerun the full test set after every change to instructions, skills, model, or harness. Use the same contract and test set to compare architectures consistently and base your assessment on measured results rather than impressions.

## Define an output contract

An output contract is a written specification of what every answer must contain and in what order. It gives the agent a fixed target, gives reviewers a checklist, and lets you directly compare answers from different architectures or models. Agree on the contract with business stakeholders before you build the agent.

The following example shows an output contract for a sales volume analytics agent that a finance team uses. Every answer starts with a results table, with the subtotal row first and the remaining rows sorted by actuals, from largest to smallest. Figures are shown in thousands.

| Column | Content |
|---|---|
| Label | Row being described: group, category, region, product, or channel |
| Actuals (k) | Actual volume in thousands |
| Forecast (k), Target (k), Prior Year (k) | Benchmark volumes in thousands |
| vs Forecast (k) and vs Forecast % | Variance to forecast, absolute and percentage |
| vs Target (k) and vs Target % | Variance to target, absolute and percentage |
| YoY (k) and YoY % | Year-over-year variance, absolute and percentage |

The contract also specifies the following requirements for content outside the table:

- A header line and insight bullets for each section.
- A status for each variance: beat (green), miss (red), or flat (yellow, within plus or minus 2%).
- A fixed commentary order, from portfolio to category to region (priority markets first) to channel.
- A closing summary scorecard, a standard disclaimer, and an offer of follow-up analysis.
- Scope rules: sales volume only, read-only, and a defined language variant and tone.

### State the units

Make the unit convention part of the contract and repeat it in the agent instructions. If queries return raw units and the contract requires values in thousands, include a single instruction such as "Divide every figure by 1,000 and show it as k." This instruction helps prevent errors that are easy to miss during review.

## Build a golden-prompt pack

A golden prompt is a known-good question with an exact expected answer that you can use as a regression test. Get the expected answers from the source of truth, such as the governed semantic model or the reconciled Power BI report, not from a previous agent run.

Include golden prompts for each type of question your users ask. The following question types illustrate the sales volume example:

| ID | Prompt theme | What it tests |
|---|---|---|
| G1 | Month-end analysis | The full output contract across portfolio, category, region, and channel |
| G2 | Regions that beat target | Filtering and ranking against a benchmark |
| G3 | Year-to-date growers and decliners by product | Year-to-date measures and ranking at product level |
| G4 | A region with a persistent decline | Reasoning across several periods and identifying drivers |
| G5 | New versus existing products | Use of a product flag and a segment comparison |
| G6 | Executive commentary in under 200 words | A concise narrative grounded in queried figures |
| S1–S2 | Numeric sentinels | Exact figures with a known answer, to catch silent drift |
| R1 | An out-of-scope request | A correct refusal instead of an invented answer |

Include at least one prompt where the correct answer is "the data isn't available," such as a request for a year-over-year comparison for a product with no prior-year data. Verify that the agent states that the data isn't available instead of estimating.

## Set gates and metrics

Set two mandatory pass criteria: 100% numerical accuracy and a 0% hallucination rate. An agent that fails either criterion isn't ready for use, regardless of how well-written its commentary is. Also track the following supporting metrics:

| Metric | Definition |
|---|---|
| Numerical accuracy | Every figure matches the source of truth exactly. |
| Hallucination rate | The share of answers that contain any figure or claim not supported by a query result. |
| Driver identification recall | The share of true drivers (region, category, channel) the agent identifies. |
| Format conformance | Adherence to the output contract, including table layout, status rules, and section order. |
| Scope adherence | The agent stays in scope, stays read-only, and refuses out-of-scope requests. |
| Commentary quality | Clarity, causal reasoning, and tone, judged by business reviewers. |

Use Copilot Studio's built-in evaluation methods, such as meaning comparison and general quality grading, to check commentary and formatting. Also pair them with exact numeric comparison against the source of truth for every figure.

## Test where your users work

Behavior in the Copilot Studio test pane can differ from behavior in a published channel. Make the published channel the final test environment:

- Finish every test cycle in the channel your users work in, like Microsoft Copilot Chat.
- Sign in as representative end users, not as developers. Developer permissions rarely match business-user permissions.
- Measure response times in the published channel, not in the test pane.
- Rerun the full pack after any change to instructions, skills, model, harness, or semantic model.

## Example: act on the results

Suppose a build passes five of six golden prompts with exact line-item accuracy across group, category, region, product, channel, and new-product splits. It declines to calculate year-over-year variance where no prior-year data exists, and it refuses the out-of-scope request.

Suppose the only failure is an incorrect subtotal: the line items are correct, but the agent calculates the subtotal separately and returns a value that doesn't match their sum. Instruct the agent to calculate subtotals by summing verified line items and verify that each subtotal matches that sum before answering. This approach doesn't require an extra query. Rerun the full test set to confirm that the instruction resolves the error without introducing new errors.

## Balance speed and depth

More detailed analysis can take longer. Balance response time and analytical depth rather than expecting one configuration to suit every question.

- **Two instruction variants:** A speed-optimized variant asks the agent to use as few queries as possible—ideally one consolidated query—and to keep the answer tight. A detailed variant produces full tables for month-end analysis, where completeness matters more than speed. Evaluate each variant against the test pack.
- **Model routing by complexity:** A fast general-purpose model handles most questions well. Use a stronger reasoning model for complex, multistep analysis.
- **Design for model change:** Model availability changes faster than agent designs. Write prompts that don't depend on a specific model's name or behavior, and keep the test set ready to run. Treat every model change as a release that must meet the pass criteria again.

## Troubleshoot common issues

| Symptom | Likely cause | What to do |
|---|---|---|
| The query returns an HTTP 400 error. | A misnamed column, an unquoted name with spaces, or a comparison between text and a number. | Document exact names and data types in the skill or instructions, reuse governed measures, and let the agent correct and retry. |
| The first query fails at setup. | A wrong workspace ID, missing permissions, or the execute-queries tenant setting isn't enabled. | Copy the IDs from the semantic model URL and follow the setup checklist. |
| Figures are off by a factor of 1,000. | The query returns values in different units than the contract shows. | State the unit convention in the model documentation and the instructions. |
| Long conversations stop responding. | The conversation context grows too large. | Use consolidated queries and concise answers, and start a new conversation for a new topic. |
| An answer in the published channel differs from the test pane. | Channel behavior differs from the test environment. | Test in the published channel as an end user, and enforce the rule that every figure comes from a live query. |
| Business users can't use the agent, but developers can. | Permissions differ between the two groups. | Check workspace, semantic model, and row-level security assignments, and test with real end-user personas. |
| Power BI prompts users to sign in. | The connector runs with each user's identity. | This behavior is by design. Cover the one-time sign-in in user onboarding. |

## Contributors

*Microsoft maintains this article. The following contributors wrote this article.*

Principal author:

- [Chinmay Kodaganur](https://www.linkedin.com/in/chinmay-kodaganur/), Product Manager II

## Related resources

- [Choose an architecture to connect Copilot Studio agents to Microsoft Fabric data](index.md)
- [Prepare a semantic model for AI agents](semantic-model-ai-agents.md)
- [Copilot Studio analytics agent over a Microsoft Fabric semantic model](copilot-studio-fabric-analytics-agent.md)