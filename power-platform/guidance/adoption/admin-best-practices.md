---
title: "Admin and governance best practices - Microsoft Power Platform | MicrosoftDocs"
description: "Discover admin and governance best practices for Microsoft Power Platform."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Admin and governance best practices

What sets Microsoft Power Platform apart from other low-code options already in use in your organization (through Excel or Access) or other shadow IT, point-solution SaaS providers, is that everything is governed and authenticated through Azure Active Directory (Azure AD)—you need to sign in with your work or school Azure AD account in order to use this service. This means that as an admin, you have full visibility of everything your makers and users do—it's governable, automatable, auditable, and manageable by default.

In this section, we'll explore some best practices to follow when establishing admin and governance for Microsoft Power Platform.

:::row:::
   :::column span="":::
      <img src="media/i_tools.svg" alt="Manage icon" width="80"/><br><br>**Manage** <br /> 

> [!div class="checklist"]
> * [Designate the Microsoft Power Platform admin role](pp-admin.md)
> * [Manage users](https://docs.microsoft.com/power-platform/admin/create-users-assign-online-security-roles)
> * [Plan and manage license and capacity](capacity-and-licenses.md)
> * [Establish an environment strategy](environment-strategy.md)
> * [Manage Microsoft Dataverse for Teams environments](teams-environment-strategy.md)
   :::column-end:::
   :::column span="":::
      <img src="media/i_protect.svg" alt="Secure icon" width="80"/><br><br>**Secure**

> [!div class="checklist"]
> * [Establish tenant and environment level DLP Policies](dlp-strategy.md)
> * [Set up Azure AD conditional access](conditional-access.md)
> * [Enable cross-tenant isolation](https://docs.microsoft.com/power-platform/admin/cross-tenant-restrictions)
   :::column-end:::
   :::column span="":::
      <img src="media/i_alert.svg" alt="Overview icon" width="80"/><br><br>**Monitor & Alert**

> [!div class="checklist"]
> * [Report on resource usage](resource-usage.md)
> * [Track user access](access-usage.md)
> * [Monitor Microsoft Dataverse usage](cds-usage.md)
> * [Monitor new connectors](new-connectors.md)
> * [Set up sharing alerts and mitigations](sharing-alerts.md)
> * Don't start from scratch, take advantage of the [CoE Starter Kit](../coe/starter-kit.md)
   :::column-end:::
:::row-end:::

## Related resources

[Microsoft Power Platform admin guide](/power-platform/admin/admin-documentation)<Br>
[Microsoft Power Apps and Power Automate Admin Whitepaper](https://aka.ms/powerappsadminwhitepaper)
