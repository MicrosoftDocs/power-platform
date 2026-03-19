---
title: What's free vs. what's premium in Power Automate
description: Understand what your Microsoft 365 license includes for Power Automate and when you need a Premium or Process license.
author: matow
ms.author: matow
ms.reviewer:
ms.topic: conceptual
ms.date: 03/19/2026
ms.subservice: cloud-flow
---

# What's free vs. what's premium in Power Automate

A plain-language guide to what your Microsoft 365 license includes and when you need to pay more.

## Quick reference

| Capability | M365 included | Premium ($15/user/mo) | Process ($150/flow/mo) |
|---|---|---|---|
| **Daily action limit** | 6,000 | 40,000 | 250,000 |
| **Standard connectors** (SharePoint, Outlook, Teams, OneDrive, Excel, Forms, Planner, Approvals) | Yes | Yes | Yes |
| **Premium connectors** (SQL Server, Dataverse, HTTP with Azure AD, Salesforce, SAP, ServiceNow, and similar) | No | Yes | Yes |
| **Custom connectors** | No | Yes | Yes |
| **On-premises data gateway** | No | Yes | Yes |
| **AI Builder credits** (legacy) | Limited | 5K seeded to tenant pool (removed Nov 2026) | 5K seeded to tenant pool (removed Nov 2026) |
| **Copilot Credits** (for agents) | No | Via Copilot Studio pack or pay-as-you-go | Via Copilot Studio pack or pay-as-you-go |
| **Desktop flows (attended RPA)** | No | Yes | Yes |
| **Unattended desktop flows** | No | No | Yes (with add-on) |
| **Per-flow licensing** (no per-user license needed for runners) | No | No | Yes |

> [!NOTE]
> **M365 included** means your existing Microsoft 365 license (E3, E5, Business Basic/Standard/Premium, and similar) already covers this. No additional purchase needed. For the latest pricing, see [Power Automate pricing](https://powerautomate.microsoft.com/pricing/).

## How to tell if you need Premium

**You need Premium if your flow uses any of these:**

- SQL Server
- Dataverse (outside of a Dynamics 365 or Power Apps context. See [Frequently asked questions](#frequently-asked-questions) later in this article)
- HTTP with Azure AD
- Adobe Sign / Adobe Acrobat
- Salesforce
- SAP
- Oracle
- ServiceNow
- DocuSign
- Any custom connector your organization built
- On-premises data gateway
- Desktop flows (Power Automate Desktop attended runs)

**You're fine with M365 if ALL your connectors are in this list:**

SharePoint, Outlook (Office 365), Microsoft Teams, OneDrive, OneDrive for Business, Excel Online, Microsoft Forms, Planner, Approvals, Notifications, RSS, Schedule (Recurrence), HTTP (non-Azure AD), Mail, Office 365 Users, Office 365 Groups, MSN Weather, and other Standard connectors.

> [!TIP]
> Not sure? Open your flow in the designer. Each action shows its connector icon. Hover over it. If the tooltip says "Premium" or shows a diamond icon, that connector requires a Premium or Process license.

## Frequently asked questions

### "I got a 'Premium required' error. What do I do?"

Check which action in your flow triggered the error. The error message usually names the connector. Your options:

1. **Replace it with a Standard connector** if possible. For example, if you're using HTTP with Azure AD just to call a Microsoft API, check if there's a dedicated Standard connector for that service (like the Office 365 Users connector).
1. **Start a trial.** You can activate a 90-day Premium trial from the error screen to unblock yourself while you evaluate.
1. **Ask your admin** to assign you a Premium license if your work requires it.

> [!TIP]
> For a full walkthrough of this error, see [DirectApiAuthorizationRequired](error-reference.md#directapiauthorizationrequired) in the error code reference.

### "Does the person who RUNS the flow need a license, or the person who MADE it?"

The license that determines a flow's capacity depends on how the flow is triggered -- not on whose connections are used in the flow.

The key rules:

- **Automated or scheduled flows:** The **flow owner's** license is used. The flow owner is the person listed as the owner in flow properties (usually the creator). It doesn't matter who created the connections.
- **Manual (instant) trigger flows:** The **person who triggers** the flow needs the license. Each user who selects "Run" must have the appropriate license.
- **Flows triggered by Power Apps:** The flow uses the **app's license context**. If the app has a Premium license (per-app plan or the user running the app has Premium), the flow is covered.
- **Flows triggered by Dynamics 365:** Flows running within a Dynamics 365 context use the Dynamics 365 license. Dataverse connectors are covered.
- **Process license flows:** The per-flow Process license ($150/flow/mo) applies regardless of who runs the flow. No per-user license is needed for runners.

> [!IMPORTANT]
> Licensing is independent from whose connections are used in the flow. A flow can use connections created by multiple people, but only the owner's license (for automated/scheduled flows) or the triggering user's license (for instant flows) determines capacity.

### "What about scheduled flows?"

Scheduled flows (flows that run on a timer, such as every day or every hour) use the **flow owner's license** by default. The flow owner is the person listed as the owner in flow properties (usually the creator).

There's one exception: if a scheduled flow is **manually associated to a Power App** (the maker explicitly links the flow to an app in the app's settings), the flow uses the app's license context instead. This means a scheduled flow CAN be covered by an app license, but only if someone specifically set up that association.

### "What are Copilot credits and why should I care?"

AI features in Power Automate use **two separate credit currencies**:

1. **AI Builder credits** (legacy, being phased out) -- used by AI Builder actions in classic cloud flows and Power Apps. Your tenant gets a shared pool from Premium licenses (5,000 credits/license) or AI Builder add-ons (1M credits/add-on). These seeded credits are **being removed November 1, 2026**.

1. **Copilot Credits** (new) -- required for Copilot Studio agents and agent flows. Also used as overflow when AI Builder credits run out in classic flows. Sourced from Copilot Studio prepaid packs or pay-as-you-go. New customers can no longer purchase AI Builder add-ons and must use Copilot Credits instead.

**Which credits does my flow use?**

- **Classic cloud flows** (AI Builder actions, Copilot in the designer, AI-generated expressions): AI Builder credits first. If those are exhausted, falls back to Copilot Credits.
- **Agent flows**: Always Copilot Credits. When you convert a classic flow to an agent flow, it switches to Copilot Credits only.

**How to check your balance:**

- **AI Builder credits**: **Power Platform admin center** > **Licensing** > **Capacity add-ons** > **Summary** tab.
- **Copilot Credits**: See [Copilot Studio licensing](/microsoft-copilot-studio/requirements-licensing-subscriptions).

> [!IMPORTANT]
> AI Builder seeded credits from Premium licenses are being removed November 1, 2026. Plan to transition to Copilot Credits. For more details, see [AI Builder credit management](/ai-builder/credit-management) and [Message-based licensing](/ai-builder/message-management).

### "My flow worked yesterday but now says Premium. What happened?"

Common causes:

1. **Your trial expired.** Premium trials last 90 days. Check your license status (see [Where to check your license](#where-to-check-your-license) later in this article).
1. **An admin changed DLP policies.** Data Loss Prevention policies can block certain connectors. Ask your admin if policies changed recently.
1. **A connection expired.** If the connection owner's license changed or expired, flows using their connections may be affected.
1. **The connector was reclassified.** Rarely, a connector moves from Standard to Premium. Microsoft communicates these changes in advance.

Check your license status first (see the following section). If your license looks correct, contact your Power Platform admin.

## Where to check your license

### For individual users

1. Go to [make.powerautomate.com](https://make.powerautomate.com).
1. Select the **gear icon** (Settings) in the top-right corner.
1. Select **View my licenses** or **View account**.
1. Your current plan and trial status are listed here.

### For admins

1. Go to [admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com).
1. Navigate to **Resources** > **Capacity** to see tenant-wide license allocation.
1. Navigate to **Billing** > **Licenses** to see assigned vs. available licenses.
1. Use **Environments** > **[your environment]** > **Users** to see per-user license assignments.

## See also

- [Cloud flow error code reference](error-reference.md)
- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
- [Power Automate licensing overview](/power-platform/admin/power-automate-licensing/types)
- [Power Automate pricing](https://powerautomate.microsoft.com/pricing/)
- [Power Automate limits and configuration](/power-automate/limits-and-config)
