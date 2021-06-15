---
title: Preview: Hybrid Modern Authentication for Exchange on-premises | Microsoft Docs
description: Learn about connecting mailboxes hosted on Exchange on-premises Hybrid Modern Authentication to Dynamics 365.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/15/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Preview: Hybrid Modern Authentication (HMA) for Exchange on-premises

Dynamics 365 can now connect to mailboxes hosted on Exchange on-premises using Hybrid Modern Authentication (HMA). Server-side synchronization will authenticate against Azure Active Directory (Azure AD) using a certificate you provide and stored securely in Azure Key Vault. You will need to establish an application registration secured by a client secret to enable Dynamics 365 to access to the certificate in Key Vault. Once Dynamics 365 is able to retrieve the certificate, the certificate will be then used to authenticate as a specific app and access the Exchange on-premise resource. 

## Supported Exchange versions

HMA will only be available from Microsoft Exchange 2013 (CU19+) or Microsoft Exchange 2016 (CU8+). See [Announcing Hybrid Modern Authentication for Exchange On-Premises](https://techcommunity.microsoft.com/t5/exchange-team-blog/announcing-hybrid-modern-authentication-for-exchange-on-premises/ba-p/607476).

## Prerequisites

To deploy HMA with Dynamics 365, you'll need to meet the following requirements.

### HMA must be enabled on Exchange using Azure AD pass through

Review the following documents:

- [Exchange Server hybrid deployments](/exchange/exchange-hybrid)
- [Hybrid Configuration wizard](/exchange/hybrid-configuration-wizard)
- [What is Azure AD Connect?](/azure/active-directory/hybrid/whatis-azure-ad-connect)
- [Deploy Azure AD Pass-through Authentication](/azure/active-directory/hybrid/how-to-connect-pta-quick-start)
- [Enabling Hybrid Modern Authentication](/microsoft-365/enterprise/configure-exchange-server-for-hybrid-modern-authentication?view=o365-worldwide)
 
### A certificate is required for this authentication scheme 

You must provide a valid certificate to configure server-side sync for HMA. It can be generated directly in Key Vault or through your company's process for generating and uploading a certificate to Key Vault.

### You need a Key Vault location 