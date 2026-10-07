---
title: Copilot Managed Runtime licensing FAQ (preview)
description: Get answers to common questions about licensing and billing for building and running apps with Microsoft Copilot Managed Runtime, including Copilot Credits and Power Apps Premium.
author: dileepsinghmicrosoft
ms.author: dileeps
ms.reviewer: ellenwehrle
ms.date: 10/06/2026
ms.topic: faq
ms.subservice: admin
ms.collection: bap-ai-copilot
ms.custom: copilot-managed-runtime
ai-usage: ai-assisted
search.audienceType:
  - admin
---

# Copilot Managed Runtime licensing FAQ (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Microsoft Copilot Managed Runtime hosts internal line-of-business apps that comply with your organization's governance policies from the moment they're created. This article answers common questions about the licenses and Copilot Credits that makers, developers, and users need to build and run these apps, and about where administrators manage the related costs.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

<!-- SME review (Austin): confirm the licensing details in this article against the latest product guidance before publishing. -->

## Licensing at a glance

Copilot Managed Runtime licenses building an app separately from running it. The license or credits that cover building an app don't cover running it, and the reverse is also true.

| Activity | Who | What's required | Where admins manage costs |
|---|---|---|---|
| Build an app in Cowork | Maker | A Microsoft Copilot license and Copilot Credits billed through the maker's Cowork spending policy | Microsoft 365 admin center |
| Build an app in Copilot Studio | Maker | Copilot Credits billed through existing Copilot Studio billing for the environment | Power Platform admin center |
| Build an app with the Copilot Managed Runtime CLI | Developer | No license enforcement for development activities, except running the app locally | Not applicable |
| Run an app, including running it locally with the CLI | User or developer | A Power Apps Premium license or Copilot Credits | Microsoft 365 admin center |

## General

### Do admins need to buy or turn on anything for Copilot Managed Runtime to be available in the tenant?

No. All eligible tenants in the commercial cloud get Copilot Managed Runtime automatically, with no separate installation step. Each app creation path has its own enablement default. For example, Copilot Studio app creation is on by default, while CLI app creation is off by default. For details, see [Enable Copilot Managed Runtime for your tenant](/microsoft-365/admin/manage/apps/#enable-copilot-managed-runtime-for-your-tenant).

### Are build costs and runtime costs billed together?

No. Building apps consumes Copilot Credits and follows the spending policies and credit allocations you configure in the product where the app is created. Runtime usage is billed per user, and administrators configure separate spending policies and credit allocations for it in the Microsoft 365 admin center.

### Can the same prepaid Copilot Credits cover both Power Platform and Microsoft 365 experiences?

Yes. Prepaid Copilot Credit capacity packs can be used by experiences managed in both the Power Platform admin center and the Microsoft 365 admin center. Capacity allocated to Power Platform environments or consumed by Copilot Studio reduces the prepaid capacity available to supported Microsoft 365 experiences, such as Cowork and Work IQ. Review capacity in both admin centers. For more information, see [Coordinate capacity across admin centers](manage-usage-github-copilot-harness.md#coordinate-capacity-across-admin-centers).

## Building apps

### What do makers need to build an app in Cowork?

Makers need a Microsoft Copilot license, but the subscription doesn't include Cowork usage. Cowork consumption is billed separately through Copilot Credits. Administrators must also turn on usage-based billing and include the maker in a spending policy that selects Cowork. During preview, building apps in Cowork is available only in tenants onboarded to the [Microsoft Copilot Frontier Program](/microsoft-365/admin/manage/get-started-frontier).

### What do makers need to build an app in Copilot Studio?

Apps built in Copilot Studio are powered by the GitHub Copilot harness and consume Copilot Credits through existing Copilot Studio billing for the environment. Manage these costs in the Power Platform admin center, the same way you manage costs for agents powered by the GitHub Copilot harness. For more information, see [Manage costs for agents powered by the GitHub Copilot harness](manage-usage-github-copilot-harness.md).

### Does building an app in Copilot Studio consume credits before the app is published?

Yes. Billable activity starts during creation, not only after publication. It includes natural-language authoring, testing, and evaluation.

### Do developers who use the Copilot Managed Runtime CLI need a license?

Licensing is enforced only when a developer runs an app locally with the CLI. Other CLI development activities, such as creating, building, and deploying an app, don't enforce licensing. To run an app locally, developers need the same Power Apps Premium license or Copilot Credits that users need to run apps.

### Do makers need a Power Apps Premium license because their personal developer environment is a managed environment?

No. Personal developer environments created for Copilot Managed Runtime are managed environments, but autoclaim doesn't apply to makers who use them only to create apps hosted on Copilot Managed Runtime, and no premium license is required in this case.

If makers also build Power Apps, Power Automate flows, or Copilot Studio agents in the same personal developer environment, autoclaim applies, and the maker might need a premium license. For more information, see [Environment routing for Copilot Managed Runtime](default-environment-routing-copilot-managed-runtime.md) and [Licensing requirements for managed environments](managed-environment-licensing.md).

## Running apps

### What license do users need to run an app?

Users need one of the following:

- **Power Apps Premium license**: Covers app operations without consuming Copilot Credits, subject to the applicable Power Platform request limits.
- **Managed application Copilot Credits**: Credits are charged each time the app launches and for each billable API call. Each API call consumes 0.1 Copilot Credits.

These requirements apply to users running apps and to developers running apps locally with the CLI.

### What counts as a billable API call?

Copilot Managed Runtime measures hosting, running, and managing apps in API calls. Each billable API call consumes 0.1 Copilot Credits. The following operations each count as one API call:

- **App launch**: Each time a user opens the app.
- **Connector call**: Each successful call the app makes to a connector or to an external data service that the app calls natively.
- **Dataverse call**: Each call the app makes to Dataverse natively.

The following activity doesn't count as a Copilot Managed Runtime API call:

- **Failed calls**: Only successful operations are metered. An API call that returns an error isn't billed.
- **Separately billed services**: Calls to services that have their own Copilot Credit charges, such as Work IQ APIs and agents, aren't counted again as Copilot Managed Runtime API calls.
- **Internal runtime telemetry**: Telemetry that the platform collects doesn't increment the consumption meter.

<!-- SME review (Austin): The July Managed Apps Runtime Licensing Spec also counts each static asset loaded at launch as an API call, and a successful publish that triggers a build as one API call. Confirm whether these still apply under the October Copilot Credits Guide before documenting them. -->

### How can I estimate the cost of running an app?

Estimate the number of billable API calls the app makes, and multiply by 0.1 Copilot Credits. For example, if a user opens an app once and the app makes nine successful connector calls, the session uses 10 API calls, or 1 Copilot Credit.

To estimate monthly consumption for an app, multiply the expected API calls per session by the expected number of sessions per month. Usage by users with a Power Apps Premium license doesn't consume Copilot Credits until it exceeds the applicable Power Platform request limits.

For the authoritative metric and rate, see the [Copilot Credits Guide](https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/bade/documents/products-and-services/en-us/ai/Copilot-Credits-Guide.pdf).

### Why don't I see Copilot Credit consumption for some users?

Users with a Power Apps Premium license run apps without consuming Copilot Credits, so their usage doesn't appear as Copilot Credit consumption. Their app operations are still measured in API calls. If these users exceed the applicable Power Platform request limits, usage above the limits is billed through Copilot Credits.

### Do users need a Microsoft 365 Copilot license to run an app?

No. A user's runtime eligibility is based on a Power Apps Premium license or Copilot Credits. Runtime entitlement is separate from the requirements and charges for creating the app, even when the app was created in Cowork.

### Does a Power Apps Premium license cover everything an app does at runtime?

A Power Apps Premium license covers app operations without consuming Copilot Credits, with the following exceptions:

- The app uses separately billed services, such as Work IQ APIs.
- Usage exceeds the applicable [Power Platform request limits](api-request-limits-allocations.md) for Power Apps Premium.

The runtime entitlement doesn't change how building the app is billed.

### What happens when a user doesn't have enough credits to run an app?

During preview, users who rely on Copilot Credits and don't meet the credit requirements receive a warning and can continue to use the app without charge. Access is blocked when the user reaches either of the following limits, whichever occurs first:

- The user completes 20 app operations.
- The user uses the app for five minutes.

Users covered by a Power Apps Premium license aren't subject to these credit requirements.

### Does sharing an app give recipients a license to run it?

No. Sharing grants access to the app, but each recipient still needs a Power Apps Premium license or Copilot Credits to run it. Recipients also need the appropriate permissions and connections for the app's underlying data.

## Managing costs

### What do administrators need to set up so users can run apps with Copilot Credits?

Before users who don't have a Power Apps Premium license can run apps, complete the following setup in the [Microsoft 365 admin center](https://admin.microsoft.com):

1. Turn on usage-based billing for Copilot Credits.
1. Create a spending policy for managed applications, and include the users or groups who run apps.
1. Set credit allocations and per-user limits as needed.

Copilot Credits are pooled at the tenant level. Runtime spending policies are separate from the policies that cover building apps, so a user who can build an app in Cowork or Copilot Studio also needs runtime coverage to run it. For more information, see [Usage-based billing and cost management for Copilot Credits](/microsoft-365/copilot/usage-based-billing-overview-copilot-credits).

### Where do administrators manage the costs of building apps?

It depends on where the app is created:

- **Cowork**: Manage build costs per user through Cowork spending policies in the Microsoft 365 admin center.
- **Copilot Studio**: Manage build costs per environment in the Power Platform admin center. Use Copilot Credit allocations, the **Draw from the available capacity in my tenant** setting, and agent-level limits. For more information, see [Manage Copilot Credits and capacity for Copilot Studio](manage-copilot-studio-copilot-credits-capacity.md).

### Where do administrators allocate credits and monitor runtime consumption?

In the [Microsoft 365 admin center](https://admin.microsoft.com), go to **Copilot** > **Cost management**. You can configure spending policies for managed applications, select covered users, groups, and services, set policy-level and per-user limits, and monitor consumption. For more information, see [Usage-based billing and cost management for Copilot Credits](/microsoft-365/copilot/usage-based-billing-overview-copilot-credits).

### Does the environment-based billing model for Copilot Studio agents apply to apps built in Copilot Studio?

Only for building them. Build billing for apps created in Copilot Studio is managed per environment in the Power Platform admin center. Runtime usage billed through Copilot Credits is managed per user in the Microsoft 365 admin center. The environment-based billing model for Copilot Studio agent runtime doesn't apply to app runtime.

### How can administrators limit who builds apps and how much they consume?

Combine access controls with cost controls:

- Control which app creation paths are available and who can use them. For example, scope Copilot Studio app creation to a security group. For more information, see [Enable Copilot Managed Runtime for your tenant](/microsoft-365/admin/manage/apps/#enable-copilot-managed-runtime-for-your-tenant).
- Use environment routing rules to control which makers get a personal developer environment. For more information, see [Environment routing for Copilot Managed Runtime](default-environment-routing-copilot-managed-runtime.md).
- Configure spending policies and per-user limits in the Microsoft 365 admin center, and environment allocations and agent limits in the Power Platform admin center.

## Related information

- [Copilot Managed Runtime overview and key concepts for admins (preview)](/microsoft-365/admin/manage/apps/)
- [FAQ about Microsoft Copilot Managed Runtime (preview)](/microsoft-365/admin/manage/apps/faq-about-apps)
- [Copilot Managed Runtime SDK overview (preview)](/microsoft-365/managed-apps/developer/)
- [Environment routing for Copilot Managed Runtime](default-environment-routing-copilot-managed-runtime.md)
- [Manage costs for agents powered by the GitHub Copilot harness](manage-usage-github-copilot-harness.md)
- [Power Apps licensing FAQs](powerapps-licensing-faq.md)
