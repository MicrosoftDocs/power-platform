---
title: CAE Title (preview)
description: Description goes here
author: ritesp
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/17/2023
search.audienceType: 
  - admin
---

# CAE title goes here (preview)

[This article is pre-release documentation and is subject to change.]

OAuth 2.0 for authentication traditionally rely on access token expiration to revoke a user account’s access to Modern cloud services. Let’s say an Azure Active Directory Administrator revokes a user account’s access, the user will still have access to resources until the access token expires, which for Power Platform by default, used to be up to an hour after the initial revocation event took place. 

With continuous access evaluation (CAE) integration with Power Platform, the user critical events and network location change is continuously evaluated by Power Platform services such as Dataverse and proactively terminates active user sessions and enforces tenant policy changes in near real time instead of relying on access token static/configured expiration. This is possible with CAE as user critical events and network location change signals are continuously available to Power Platform services such as Dataverse to evaluate a user condition continuously. 

When a CAE enabled and ready client such as UCI or any client makes a call to Power Platform such as Dataverse with an existing access token, the token is evaluated by the service near real time, and it is accepted or rejected by Dataverse enforcing client to re-authenticate again based on the signals from the Azure AD. CAE allows enforcement of user critical events and network location change near real time by Power Platform services such as Dataverse. 

> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]

## Key benefits

- **Mitigation of Insider threats**: An insider can export a valid access token outside your organization and can replay this token to gain the access to cloud services outside of your organization. With CAE, you will be able to enforce IP location policies near real time to prevent such access thereby blocking access to cloud services near real time. 

- **Data Exfiltration risks mitigation**: CAE helps in preventing data exfiltration through enforcement of IP location policies and user critical events near real time. 

- **Resiliency of Power Platform Services**: With CAE, clients will get long-lived tokens i.e., requiring fewer token refreshes thereby improving overall resiliency of the services. 

- **Unauthorized access to Power Platform Services**: A user account password has been compromised and Azure AD administrator can prevent/limit unauthorized access to Power Platform Services by resetting/changing user’s password or disabling user account near real time. 

- **Remove user’s access near real time**: An organization has obligations to instantly remove user access due to various reasons such as security threats, termination of employment, policy violations or legal/regulatory requirements. With CAE, Azure AD administrator can instantly disable user accounts thereby revoking the access to organizations resources in near real time. 

For Power Platform, continuous access evaluation is currently supported by Dataverse only and Microsoft is working additional Power Platform services and clients to support continuous access evaluation. 

 See [Continuous access evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#limitations) for the limitations of continuous access evaluation. 
 
## Scenarios supported by Power Platform 

Continuous access evaluation supports two types of events: 

- User Critical Events are the events which are related to user’s access to cloud resources. 
- Conditional Access policy evaluation occurs when a user should lose access to a resource based on an administrator-defined policy like IP location policy. 

User Critical events include: 

- User account is disabled/deleted. 
- Password is changed/reset. 
- User sessions are revoked. 
- Multifactor authentication is enabled for the user. 

Conditional Access policy evaluation occurs when the user account is no longer connecting from allowed IP location. 

## Power Platform clients supporting continuous access evaluation. 

Continuous access evaluation-enabled clients for Power Platform support a claim challenge, which is a redirect of a user session to Azure AD for reauthentication, when a cached user token is rejected by a continuous access evaluation-enabled Power Platform service such as Dataverse. Currently the customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) support CAE claims, and many more clients will be onboarded to CAE in future. 

For clients that don't support continuous access evaluation, the access token lifetime to Power Platform remains as one hour by default. 

 
