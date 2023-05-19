---
title: Continuous access evaluation integration with Power Platform (preview)
description: Description goes here.
author: ritesp
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/19/2023
search.audienceType: 
  - admin
---

# Continuous access evaluation integration with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

OAuth 2.0 for authentication traditionally relies on access token expiration to revoke a user's access to modern cloud services. Suppose an Azure Active Directory (Azure AD) administrator revokes a user's access. The user will still have access to resources until the access token expires, which for Power Platform, used to be up to an hour, by default, after the initial revocation event took place. 

With continuous access evaluation integration in Power Platform, a user's [critical events](#scenarios-supported-by-power-platform) and network location changes are continuously evaluated by Power Platform services, such as Dataverse. Power Platform services proactively terminate active user sessions and enforce tenant policy changes in near real time, instead of relying on access token expiration. With continuous access evaluation, as users' critical events and network location changes signals are continuously available to Power Platform services to evaluate a user condition continuously. 

> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]

## Key benefits

- **Mitigation of insider threats**: An insider can export a valid access token outside your organization and can replay this token to gain access to cloud services outside of your organization. With continuous access evaluation, you can enforce IP location policies near real time to prevent such access.

- **Data exfiltration risks mitigation**: Continuous access evaluation helps prevent data exfiltration through enforcement of IP location policies and user critical events near real time. 

- **Resiliency of Power Platform services**: With continuous access evaluation, clients get long-lived tokens, which requires less token refreshes. This improves overall resiliency of the services. 

- **Unauthorized access to Power Platform services**: When a user account password has been compromised, the Azure AD administrator can limit unauthorized access to Power Platform services by resetting or changing the user’s password or by disabling the user account near real time. 

- **Remove user’s access near real time**: An organization has obligations to instantly remove user access due to various reasons, such as security threats, termination of employment, policy violations, or legal requirements. With continuous access evaluation, the Azure AD administrator can instantly disable user accounts, thereby revoking the access to organizations resources in near real time. 

For Power Platform, continuous access evaluation is currently supported by Dataverse only. Microsoft is working with other Power Platform services and clients to support continuous access evaluation. 

 See [Continuous access evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#limitations) for the limitations of continuous access evaluation. 
 
## Scenarios supported by Power Platform 

Continuous access evaluation supports two types of events: 

- User critical events are the events that are related to a user’s access to cloud resources. 
- Conditional access policy evaluation occurs when a user should lose access to a resource, based on an administrator-defined policy, such as IP location policy. 

User critical events include: 

- User account is disabled or deleted. 
- Password is changed or reset. 
- User sessions are revoked. 
- Multifactor authentication is enabled for the user. 

Conditional access policy evaluation occurs when the user account is no longer connecting from allowed IP locations. 

## Power Platform clients supporting continuous access evaluation

Continuous access evaluation-enabled clients for Power Platform support a claim challenge, which is a redirect of a user's session to Azure AD for reauthentication when a cached user token is rejected by a continuous access evaluation-enabled Power Platform service, such as Dataverse. Currently the customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) support CAE claims, and many more clients will be onboarded to CAE in the future. 

For clients that don't support continuous access evaluation, the access token lifetime to Power Platform remains as one hour, by default. 

 
