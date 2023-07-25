---
title: Integrate continuous access evaluation (preview)
description: Learn how to use continous access evaluation in Microsoft Power Platform to enforce changes to user access and tenant policy in near real-time.
ms.date: 07/25/2023
ms.topic: how-to
author: ritesp
ms.author: ritesp
ms.reviewer: sericks
ms.component: pa-admin
ms.subservice: admin
search.audienceType: 
  - admin
ms.custom: bap-template
---

# Integrate continuous access evaluation (preview)

[This article is prerelease documentation and is subject to change.]

OAuth 2.0 authentication traditionally relies on access token expiration to revoke a user's access to modern cloud services. Users whose access rights have been terminated still have access to resources until the access token expires&mdash;for Power Platform, as long as an hour, by default. With continuous access evaluation, however, Power Platform services such as Dataverse continuously evaluate a user's [critical events](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#critical-event-evaluation) and network location changes. They proactively terminate active user sessions, or require reauthentication, and enforce tenant policy changes in near&ndash;real-time instead of waiting for an access token to expire.

> [!IMPORTANT]
> [!INCLUDE [preview](../includes/cc-preview-features-definition.md)]

## Key benefits

Integrating continuous access evaluation in your Power Platform solutions offers several key benefits.

- **Mitigate insider and data exfiltration threats**: An employee can export a valid access token and replay it to gain access to cloud services from outside of your organization. With continuous access evaluation, you can enforce IP location policies and monitor user-critical events in near&ndash;real-time to mitigate the risk of external access and exfiltration of data.

- **Make Power Platform services more resilient**: With continuous access evaluation, clients get long-lived tokens. Fewer token refreshes improve the overall resiliency of the services.

- **Prevent unauthorized access to Power Platform services**: When a user account password is compromised, the Azure AD administrator can reset it or disable the account in near&ndash;real-time to prevent unauthorized access to Power Platform services.

- **Remove user access in near&ndash;real-time**: An organization has obligations to instantly remove user access due to various reasons, such as security threats, termination of employment, policy violations, or legal requirements. With continuous access evaluation, the Azure AD administrator can instantly disable user accounts, thereby revoking the access to organizations resources in near real time.

For Power Platform, continuous access evaluation is currently supported by Dataverse only. Microsoft is working with other Power Platform services and clients to support continuous access evaluation.

 See [Continuous access evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#limitations) for the limitations of continuous access evaluation.

## Scenarios supported by Power Platform

Continuous access evaluation supports two types of events:

- User [critical events](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#critical-event-evaluation) are the events that are related to a user's access to cloud resources.
- [Conditional access policy](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#conditional-access-policy-evaluation) evaluation occurs when a user should lose access to a resource, based on an administrator-defined policy, such as IP location policy.

User critical events include:

- User account is disabled or deleted.
- Password is changed or reset.
- User sessions are revoked.
- Multifactor authentication is enabled for the user.

Conditional access policy evaluation occurs when the user account is no longer connecting from allowed IP locations.

## Power Platform clients supporting continuous access evaluation

Continuous access evaluation-enabled clients for Power Platform support a claim challenge. A claim challenge is a redirect of a user's session to Azure AD for reauthentication when a cached, user token is rejected by a continuous access evaluation-enabled Power Platform service, such as Dataverse. Currently the customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) support continuous access evaluation claims. More clients are planned to onboard to continuous access evaluation in the future.

For clients that don't support continuous access evaluation, the access token lifetime remains the same as configured or set to the default value.

To enable continuous access evaluation on your Power Platform Dataverse environment, reach out to your Microsoft contact  or Microsoft Support.
