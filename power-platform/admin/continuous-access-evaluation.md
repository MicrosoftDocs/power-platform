---
title: Continuous access evaluation (preview)
description: Learn how continuous access evaluation in Microsoft Power Platform enforces changes to user access and tenant policy in near real time.
ms.date: 05/09/2025
ms.topic: overview
author: ritesp
ms.author: ritesp
ms.reviewer: sericks
ms.component: pa-admin
ms.subservice: admin
search.audienceType: 
  - admin
ms.custom: bap-template
contributors:
  - alaug 
---

# Continuous access evaluation (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[This article is prerelease documentation and is subject to change.]

OAuth 2.0 authentication traditionally relies on access token expiration to revoke a user's access to modern cloud services. Users whose access rights have been terminated still have access to resources until the access token expires&mdash;for Power Platform, as long as an hour, by default. With continuous access evaluation, however, Power Platform services such as Dataverse continuously evaluate a user's [critical events](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#critical-event-evaluation) and network location changes. They proactively terminate active user sessions, or require reauthentication, and enforce tenant policy changes in near real time instead of waiting for an access token to expire.

> [!IMPORTANT]
> [!INCLUDE [preview](../includes/cc-preview-features-definition.md)]

## Key benefits

Integrating continuous access evaluation in your Power Platform solutions offers several key benefits.

- **Mitigate insider and data exfiltration threats**: An employee can export a valid access token and replay it to gain access to cloud services from outside of your organization. With continuous access evaluation, you can enforce IP location policies and monitor user-critical events in near real time to mitigate the risk of external access and exfiltration of data.

- **Make Power Platform services more resilient**: With continuous access evaluation, clients get long-lived tokens. Fewer token refreshes improve the overall resiliency of the services.

- **Prevent unauthorized access to Power Platform services**: When a user account password is compromised, the Microsoft Entra administrator can reset it or disable the account in near real time to prevent unauthorized access to Power Platform services.

- **Remove user access in near real time**: Organizations have an obligation to instantly remove a user's access because of security threats, termination of employment, policy violations, or legal requirements. With continuous access evaluation, the Microsoft Entra administrator can instantly disable user accounts and revoke access to organization resources in near real time.

## Limitations

For Power Platform, only Dataverse supports continuous access evaluation. Microsoft is working to add support to other Power Platform services and clients.

[Learn about other limitations of continuous access evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#limitations).

## Supported events

Continuous access evaluation supports two types of events:

- [User-critical events](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#critical-event-evaluation) are events that are related to a user's access to cloud resources:

  - User account is disabled or deleted.
  - Password is changed or reset.
  - User sessions are revoked.
  - Multifactor authentication is allowed for the user.

- [Conditional access policy](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#conditional-access-policy-evaluation) evaluation occurs when a user should lose access to a resource based on an administrator-defined policy, such as when the user is no longer connecting from allowed IP locations.

## Supported Power Platform clients

Power Platform clients that allow continuous access evaluation support *claim challenges*. A claim challenge is a redirect of a user's session to Microsoft Entra ID reauthentication when a continuous access evaluation-enabled service like Dataverse rejects a cached user token. Dynamics 365 Sales, Customer Service, Field Service, Marketing, Project Service Automation, and Power Apps support continuous access evaluation claims. Power Apps canvas apps don't support continous access evaluation in embedded experiences. 

For clients that don't support continuous access evaluation, the access token lifetime remains the same as configured or set to the default value.

To allow continuous access evaluation in your Power Platform Dataverse environment, reach out to your Microsoft contact or Microsoft Support.
