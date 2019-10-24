---
title: "Controlling access to Common Data Service | MicrosoftDocs"
description: Provides information about how you can control access to Common Data Service using Azure AD.
ms.custom: ""
ms.date: 10/07/2019
ms.reviewer: "jimholtz"
ms.service: power-platform
ms.topic: "article"
ms.assetid: 83200632-a36b-4401-ba41-952e5b43f939
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Controlling access to Common Data Service

Common Data Service relies on Azure Active Directory (Azure AD) for authentication. This means that you can leverage the full functionality of Azure AD to manage and restrict access to users. This includes using Conditional Access Policies and other premium features of Azure AD. Developers can also register applications with Azure AD and [use the oAuth2](/powerapps/developer/common-data-service/authenticate-oauth) authorization framework to allow their code to access the platform APIs.

External users from other Azure AD tenants can be added as Business Guests in your Azure AD. They can be configured to work with some limitations with model-driven apps. Business Guests are not supported currently for canvas apps and Microsoft Flow. Other external users beyond the capability of Business Guests, including Azure B2C is not currently supported.

### See also
[Governance consideration](governance-considerations.md)<br/>
[What is Common Data Service?](/powerapps/maker/common-data-service/data-platform-intro)<br/>
[Security concepts in Common Data Service](wp-security-cds.md)<br/>
[Developers: Authentication with Common Data Service web services](/powerapps/developer/common-data-service/authentication)<br/>
[Create users and assign security roles](create-users-assign-online-security-roles.md)
