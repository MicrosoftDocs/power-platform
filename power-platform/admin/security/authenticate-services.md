---
title: Authenticating to Power Platform services
description: Learn how Power Platform authenticates users.
ms.date: 02/14/2022
ms.service: power-platform
ms.topic: how-to
ms.collection: get-started
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom:
  - "admin-security"
  - sfi-image-nochange
---
# Authenticating to Power Platform services

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Platform authentication involves a sequence of requests, responses, and redirects between the user's browser and Power Platform or Azure services. The sequence follows the [Microsoft Entra auth code grant flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow). For more information about user authentication models, see [Choosing a sign-in model for Microsoft 365](https://www.microsoft.com/microsoft-365/blog/2014/05/13/choosing-a-sign-in-model-for-office-365/).

## Power Platform authentication sequence

The authentication sequence is illustrated in the diagram that follows.

1. The user initiates a connection to a Power Platform service from a browser. The user may enter the service address in the address bar or select **Sign in** on a Power Platform service page. The connection is established using TLS 1.2 and HTTPS. All subsequent communication between the browser and the Power Platform service uses HTTPS.
1. The Azure Traffic Manager checks the browser's DNS record to determine the most appropriate (usually nearest) datacenter where the Power Platform service is deployed. The traffic manager returns the IP address of the web front-end cluster to which the user should be sent.
1. The web front-end cluster redirects the user to the Microsoft Online Services sign-in page for authentication.
1. The sign-in page redirects the authenticated user back to the web front-end cluster with a Microsoft Entra auth code.
1. The web front-end cluster uses the auth code to obtain a security token from the Microsoft Entra service.
1. The web front-end cluster consults the Power Platform global back-end service to determine which back-end service cluster contains the user's tenant.
1. The web front-end cluster returns an application page to the user's browser with required session, access, and routing information.
1. The browser sends customer data requests to the back-end cluster with the Microsoft Entra access token included in the authorization header. The back-end cluster reads the access token and validates the signature to make sure the identity for the request is valid. The access token has a default lifetime of one hour. To maintain the session, the browser makes periodic requests to renew the access token before it expires.

When a Power Platform service is embedded in SharePoint, Power BI, or Teams, the authentication sequence is slightly different. That's because these services perform some of the steps themselves.

> [!NOTE]
> Authentication to external data sources is a separate step from authentication to the service. For more information, see [Connect to data sources](connect-data-sources.md).

:::image type="content" source="./media/EndUserAuthSequence.png" alt-text="A diagram of the Power Platform user authentication sequence.":::

### Related articles

[Security in Microsoft Power Platform](./overview.md)
[Connecting and authenticating to data sources](./connect-data-sources.md)  
[Data storage in Power Platform](./data-storage.md)  
[Power Platform security FAQs](./faqs.md)  

### See also

- [Microsoft Entra auth code grant flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow)
- [Choosing a sign-in model for Microsoft 365](https://www.microsoft.com/microsoft-365/blog/2014/05/13/choosing-a-sign-in-model-for-office-365/)
