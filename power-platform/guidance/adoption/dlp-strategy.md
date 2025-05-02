---
title: Implement a DLP strategy
description: Learn how to implement a data loss prevention strategy in Power Platform to prevent unintentional data exposure and protect organizational security.
#customer intent:As a Power Platform admin, I want to establish DLP policies so that I can prevent users from unintentionally exposing organizational data.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/01/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/01/2025
---

# Implement a DLP strategy

Data loss prevention (DLP) policies act as guardrails to help prevent users from unintentionally exposing organizational data and to protect information security in the tenant. DLP policies enforce rules for which connectors are enabled for each environment, and which connectors can be used together. Connectors are classified as either **business data only**, **no business data allowed**, or **blocked**. A connector in the business data only group can only be used with other connectors from that group in the same app or flow. Learn more in  [Data Loss Prevention (DLP) policies](../../admin/wp-data-loss-prevention.md).

Establishing your DLP policies goes hand in hand with your [environment strategy](environment-strategy.md).

## Quick facts

- [Data Loss Prevention (DLP) policies](../../admin/wp-data-loss-prevention.md) act as guardrails to help prevent users from unintentionally exposing data.
-	DLP policies can be scoped at the environment level and tenant level, offering flexibility to craft policies that are sensible and don't block high productivity.
-	Environment DLP policies can't override tenant-wide DLP policies.
-	If multiple policies are configured for one environment, the most restrictive policy applies to the combination of connectors.
-	By default, no DLP policies are implemented in the tenant.
-	Policies can't be applied at the user level, only at the environment or tenant level.
-	DLP policies are connector aware, but they don't control connections made using the connector. In other words, DLP policies can't determine whether the connector is used to connect to a development, test, or production environment.
-	PowerShell and admin connectors can manage policies.
-	Users of resources in environments can view policies that apply.

### Connector classification

Business and non-business classifications draw boundaries around what connectors can be used together in a given app or flow. Connectors can be classified across the following groups using DLP policies:

- **Business**: A given Power App or Power Automate resource can use one or more connectors from a business group. If a Power App or Power Automate resource uses a business connector, it can't use any non-business connector.
- **Non-business**: A given Power App or Power Automate resource can use one or more connectors from a non-business group. If a Power App or Power Automate resource uses a non-business connector, it can't use any business connector.
- **Blocked**: No Power App or Power Automate resource can use a connector from a blocked group. All Microsoft-owned premium connectors and third-party connectors (standard and premium) can be blocked. Microsoft-owned standard connectors and Common Data Service connectors can't be blocked.

> [!NOTE]
> The names "business" and "non-business" don't have any special meaning&mdash;they are simply labels. The grouping of the connectors themselves is of significance, not the name of the group they're placed in.

Learn more: [Connector classification](/power-platform/admin/dlp-connector-classification)

### Granular control

You can achieve more granular control by configuring [connector action control](/power-platform/admin/connector-action-control). Through action control, you can choose which actions on a connector are allowed or not allowed. This option is for blockable connectors that you have added to a DLP policy's non-business or business data group. Using it, you might allow makers to use the "read" actions but not the "modify" actions on the connector. Connectors get new actions when they're updated. You can set whether to allow or block new actions.

Another way to get more granular control is by configuring [connector endpoint filtering](/power-platform/admin/connector-endpoint-filtering). Endpoint filtering allows admins to govern which specific endpoints makers can connect to when building apps, flows, or chatbots. Connector endpoint filtering applies to six connectors: HTTP, HTTP with Microsoft Entra ID, HTTP Webhook, SQL Server, Azure Blob Storage, and SMTP. The rules only apply when a maker uses a static value to specify an endpoint.

Power Platform allows makers to create and share [custom connectors](/connectors/custom-connectors/). You can manage [custom connectors for tenant and environment level data loss prevention (DLP) policies](/power-platform/admin/dlp-custom-connector-parity). 

Specifically:

- Environment admins can use the Power Platform admin center to classify individual, custom connectors by name for environment-level data policies.
- Tenant admins can use the Power Platform admin center and PowerShell to classify custom connector by their Host URL endpoints using a pattern matching construct for tenant-level data policies.

### DLP for Copilot Studio

Data loss prevention (DLP) policies let you govern how agents connect and interact with data and services, within and outside your organization. Learn more in [Configure data loss prevention policies for agents](/microsoft-copilot-studio/admin-data-loss-prevention).

### DLP for desktop flows

Power Automate allows you to create and enforce DLP policies that classify desktop flow modules and individual module actions as business, non-business, or blocked. This categorization prevents makers from combining modules and actions from different categories into a desktop flow or between a cloud flow and the desktop flows it uses. Learn more in [Data loss prevention policies for desktop flows](/power-automate/prevent-data-loss#data-loss-prevention-for-desktop-flows).

## Strategies for creating DLP policies

As an administrator taking over an environment or starting to support use of Power Platform, DLP policies should be one of the first things you set up. With a base set of policies in place, you can then focus on handling exceptions and creating targeted DLP policies that implement these exceptions once approved.

We recommend the following starting point for DLP policies for **shared user and team productivity environments**:

- Create a policy spanning all environments except selected ones (for example, your production environments), keep the available connectors in this policy limited to Microsoft 365 and other standard microservices, and block access to everything else. This policy applies to the default environment, and to training environments you have for running internal training events. Additionally, this policy also applies to any new environments that are created.
- Create appropriate and more permissive DLP policies for your [shared user and team productivity environments](environment-strategy.md). These policies could allow makers to use connectors like Azure services in addition to the Microsoft 365 services. The connectors available in these environments depend on your organization, and where your organization stores business data.

We recommend the following starting point for DLP policies for **production (business unit and project) environments**:

- Exclude those environments from shared user and team productivity policies.
- Work with the business unit and project to establish which connectors and connector combinations they use and create a tenant policy to include the selected environments only.
- Use environment policies to categorize custom connectors as business-data only, as necessary.

We also recommend to:

- Create a minimal number of policies per environment. There's no strict hierarchy between tenant and environment policies. At design and runtime, all policies that are applicable to the environment in which the app or flow resides are evaluated together to decide whether the resource is in compliance or in violation of DLP policies. [Multiple DLP policies](/power-platform/admin/dlp-combined-effect-multiple-policies) applied to one environment will fragment your connector space in complicated ways and might make it difficult to understand issues your makers are facing.  
- Centrally manage DLP policies using tenant level policies, and use environment policies only to categorize custom connectors or in exception cases.  

With a base strategy in place, plan how to handle exceptions. You can: 

- Deny the request.
- Add the connector to the default DLP policy.
- Add the environments to the All Except list for the global default DLP and create a use case-specific DLP policy with the exception included.

## Example: Contoso's DLP strategy

Let's look at how Contoso Corporation, our sample organization for this guidance, set up their DLP policies. The setup of their DLP policies ties in closely with their [environment strategy](environment-strategy.md).

Contoso admins want to support user and team productivity scenarios, business applications, and Center of Excellence (CoE) activity management.

The environment and DLP strategy that Contoso admins apply includes:

1. A tenant-wide restrictive DLP policy that applies to all environments in the tenant except some specific environments that they exclude from the policy scope. Admins intend to keep the available connectors in this policy limited to Microsoft 365 and other standard micro-services by blocking access to everything else. This policy also applies to the default environment.

1. Contoso admins create another shared environment for users to create apps for user and team productivity use cases. This environment has an associated tenant-level DLP policy that isn't as risk-averse as a default policy and allows makers to use connectors like Azure services in addition to the Microsoft 365 services. Because this environment isn't the default environment, admins actively control the environment maker list for it. This strategy takes a tiered approach to shared user and team productivity environment and associated DLP settings. 

1. Business units create development, test, and production environments for their tax and audit subsidiaries across various countries and regions to build line-of-business applications. Access for environment makers is carefully managed, and appropriate first- and third-party connectors are made available using tenant-level DLP policies in consultation with business unit stakeholders.

1. Similarly, development, test, and production environments are created for Central IT to develop and roll out relevant applications. These business application scenarios typically have a well-defined set of connectors that need to be available for makers, testers, and users in these environments. Access to these connectors is managed using a dedicated tenant-level policy.

1. Contoso also has a special purpose environment dedicated to their Center of Excellence activities. In Contoso, the DLP policy for the special purpose environment remains high touch given the experimental nature of the theory teams book. In this case, tenant admins delegate DLP management for this environment directly to a trusted environment admin of the CoE team and exclude it from all tenant-level policies. This environment is managed only by the environment-level DLP policy, which is an exception rather than the rule at Contoso.

As expected, any new environments that are created in Contoso map to the original all-environments policy.

This setup of tenant-centric DLP policies doesn't prevent environment admins from coming up with their own environment-level DLP policies, if they want to introduce more restrictions or to classify custom connectors.

:::image type="content" source="media/dlp-strategy_.png" alt-text="Diagram illustrating Contoso's environment and DLP strategy." lightbox="media/dlp-strategy_.png" :::

## Set up data policies

1. Create your policy in the [Power Platform admin center](https://aka.ms/ppac). Learn more in [Manage data policies](../../admin/prevent-data-loss.md).

1. Use the [DLP SDK](../../admin/data-loss-prevention-sdk.md) to add custom connectors to a DLP policy.

## Clearly communicate your organization's DLP policies to makers

Set up a [SharePoint site or a wiki](wiki-community.md) that clearly communicates:

- Tenant-level and key environment-level (for example, default environment, trial environment) DLP policies enforced in the organization, inclusive of lists of connectors classified as business, non-business, and blocked.
- Your admin group's email ID so makers can contact them for exception scenarios. For example, admins can help makers comply by editing an existing DLP policy, moving the solution to a different environment, creating a new environment and a new DLP policy, and moving the maker and resource to this new environment.

Also clearly [communicate your organization's environment strategy](environment-strategy.md#communicate-your-environment-strategy-to-your-organization) to makers.

## Next steps

Review the detailed articles in this series to further enhance your security posture:

- [Detect threats to your organization](threat-detection.md)
- [Establish data protection and privacy controls](data-protection.md)
- [Configure identity and access management](conditional-access.md)
- [Meet compliance requirements](compliance.md)
- [Secure the default environment](secure-default-environment.md)

[!INCLUDE [guidance-adoption-security-review-checklist](../../includes/guidance-adoption-security-review-checklist.md)]

