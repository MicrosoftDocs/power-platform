---
title: "Authenticating to Power Platform services | MicrosoftDocs"
description: Provides information about the security concepts in Microsoft Dataverse.
ms.date: 06/30/2020
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
  - "intro-internal"
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Authenticating to Power Platform services

> **Working notes**
>
> Explain in detail how users can authenticate to Power Platform/Dataverse.
>
> Link to Power BI whitepaper for the Power BI part

User authentication to the Power Platform services consists of a series of requests, responses, and redirects between the user's browser and the Power Platform service or the Azure services used by the Power Platform. That sequence describes the process of user authentication in Power Platform services, which follows the [Azure Active Directory's auth code](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow) grant flow. For more information about options for an organization's user authentication models (sign-in models), see [Choosing a sign-in model for Microsoft 365](https://www.microsoft.com/en-us/microsoft-365/blog/2014/05/13/choosing-a-sign-in-model-for-office-365/).

### End user authentication steps to the Power Platform

The user authentication sequence for the Power Platform services occurs as described in the following steps, which are illustrated in the image that follows.

1. A user initiates a connection to a Power Platform service from a browser, either by typing in the Power Platform address in the address bar or by selecting Sign in from a Power Platform service (e.g., Power Apps landing page.) The connection is established using TLS 1.2 and HTTPS. All subsequent communication between the browser and the Power Platform service uses HTTPS.
2. The Azure Traffic Manager checks the user's DNS record to determine the most appropriate (usually nearest) datacenter where the Power Platform service is deployed and responds to the DNS with the IP address of the WFE cluster to which the user should be sent.
3. WFE then redirects the user to the Microsoft Online Services login page.
4. After the user has been authenticated, the login page redirects the user to the previously determined nearest Power Platform service WFE cluster with an auth code.
5. The WFE cluster checks with the Azure AD service to obtain an Azure AD security token by using the auth code. When Azure AD returns the successful authentication of the user and returns an Azure AD security token, the WFE cluster consults the Power Platform Global Service, which maintains a list of tenants and their Power Platform back-end cluster locations and determines which Power Platform back-end service cluster contains the user's tenant. The WFE cluster then returns an application page to the user's browser with the session, access, and routing information required for its operation.
6. When the client's browser requires customer data, it will send requests to the back-end cluster address with the Azure AD access token in the Authorization header. The Power Platform back-end cluster reads the Azure AD access token and validates the signature to ensure that the identity for the request is valid. The Azure AD access token has a default lifetime of 1 hour, and to maintain the current session the user's browser will make periodic requests to renew the access token before it expires.

  ![End user authentication sequence.](./media/EndUserAuthSequence.png " End user authentication sequence to the Power Platform services with browser, Azure traffic Manager, Azure CDN, the Web Front end (WFE) Azure Active Directly, and the Power Platform back-end cluster.  Authentication to back-end data sources is separate.")

The user authentication sequence when a Power Platform service is embedded in SharePoint, Power BI, or Teams is slightly more complicated as these services perform some of the steps and some steps still remain with the Power Platform service.

Note that authentication to external data sources is a separate step from authentication to the service.  This topic is covered in the next section. 
### See also

[Add related articles]
