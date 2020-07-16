---
title: "Sign in to Dynamics 365 and Office apps  | MicrosoftDocs"
description: Sign in to Dynamics 365 and Office apps 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/16/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Sign in to Dynamics 365 and Office apps

There are multiple ways to sign in and access your Dynamics 365 and Office apps.  
  
> [!TIP]
> Admins: Be sure to share this information with your end users.  
> 
> You can troubleshoot issues with signing in to Dynamics 365 apps using the Support and Recovery Assistant for Microsoft 365. For more information, see the blog [New diagnostic scenario for web sign-in](https://community.dynamics.com/crm/b/dynamicscrmsupportblog/archive/2016/11/15/new-diagnostic-scenario-for-web-sign-in).  
  
<a name="BKMK_PortalSignIn"></a>   

## Signing in to https://office.com  
For admins and end users, when you sign in to https://office.com, you will see a page with Office tiles. The tiles that appear depend on what licenses you have. For example, if you have licenses for Office and Dynamics 365 apps, you'll see tiles for Office apps like [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)], [!INCLUDE[pn_onedrive](../includes/pn-onedrive.md)], and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], as well as a tile for Dynamics 365 apps.  

> [!div class="mx-imgBorder"] 
> ![Office tile page](../admin/media/office-365-welcome-page.png "Office tile page")  
  
 Select the Dynamics 365 apps tile to go to the Dynamics 365 home page.   
  
 If you're a system administrator, you'll see an **Admin** tile. Select this tile to get to the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], where you can see your service health, manage users, manage licenses, and more for all the online services associated with your account.  
  
 ![Admin tile](../admin/media/admin-tile-office-365-welcome-page.png "Admin tile")  
  
 From there, you can get to the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)]. Select **Show all** > **All admin centers** > **Dynamics 365**.  
  
 ![Dynamics 365 apps option in the Admin center drop-down list](../admin/media/click-admin-centers-dynamics-365.png "Dynamics 365 apps option in the Admin center drop-down list")  
  
 For other ways to access Dynamics 365 and Office apps, see [Quickly navigate with the Office app launcher and the Dynamics 365 home page](../admin/quickly-navigate-office-365-app-launcher.md).  
  
<!-- 
<a name="BKMK_DirectAdminCenter"></a>   

## Direct sign in to the Dynamics 365 Administration Center  
 Some Dynamics 365 admin or Microsoft 365 admin roles might be unable to access the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)] after signing in to https://admin.microsoft.com. Use the following steps to directly navigate to the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)] and manage your environment.  
  
1. Go to https://port.\<region>.dynamics.com/G/instances/instancePicker.aspx  
  
    Replace \<region> with the region identifier or use one of the links below.  
  
   |Region identifier|URL|  
   |-----------------------|---------|  
   |**crm** for North America (NAM)|[https://port.crm.dynamics.com/G/instances/instancePicker.aspx](https://port.crm.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm2** for South America (LATAM/SAM)|[https://port.crm2.dynamics.com/G/instances/instancePicker.aspx](https://port.crm2.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm3** for Canada (CAN)|[https://port.crm3.dynamics.com/G/instances/instancePicker.aspx](https://port.crm3.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm4** for Europe, Middle East, Africa (EMEA)|[https://port.crm4.dynamics.com/G/instances/instancePicker.aspx](https://port.crm4.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm5** for Asia Pacific (APAC)|[https://port.crm5.dynamics.com/G/instances/instancePicker.aspx](https://port.crm5.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm6** for Oceania (OCE)|[https://port.crm6.dynamics.com/G/instances/instancePicker.aspx](https://port.crm6.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm7** for Japan (JPN)|[https://port.crm7.dynamics.com/G/instances/instancePicker.aspx](https://port.crm7.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm8** for India (IND)|[https://port.crm8.dynamics.com/G/instances/instancePicker.aspx](https://port.crm8.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm11** for United Kingdom (UK)|[https://port.crm11.dynamics.com/G/instances/instancePicker.aspx](https://port.crm11.dynamics.com/G/instances/instancePicker.aspx)|  
   |**crm12** for France (FRA)|[https://port.crm12.dynamics.com/G/instances/instancePicker.aspx](https://port.crm12.dynamics.com/G/instances/instancePicker.aspx)| 
   |**crm15** for United Arab Emirates (UAE)|[https://port.crm15.dynamics.com/G/instances/instancePicker.aspx](https://port.crm15.dynamics.com/G/instances/instancePicker.aspx)|
  
    For Germany (DEU), use the following: https://port.crm.microsoftdynamics.de/g/instances.instancepicker.aspx.  
  
2. Sign in with your admin credentials.  
  
<a name="BKMK_DirectHomePage"></a>   
-->

## Direct sign in to the Dynamics 365 home page  
**Your business apps are moving**

In the future, the home for all of your business applications across Dynamics and the Power Platform will move to the apps page on [office.com](https://office.com/apps). This will help ensure that your end-users have a single spot to find all of their apps across the Microsoft ecosystem. Once the apps on the Dynamics home page have
moved to [office.com](https://office.com/apps), we will provide a banner redirecting users to their new home.

After October 1, 2020, when users navigate to https://home.dynamics.com, they will be redirected to https://www.office.com/apps with a deep link to their business applications.

<a name="BKMK_directsignin"></a>   

<!-- 
## Direct sign in to Dynamics 365 apps 
 To directly sign in to the Dynamics 365 service, use:  
  
 https://\<organization>.crm.dynamics.com  
  
> [!NOTE]
>  For other regions, replace .crm with:  
>   
> -   .crm2 for South America (LATAM/SAM)  
> -   .crm3 for Canada (CAN)  
> -   .crm4 for Europe, Middle East, Africa (EMEA)  
> -   .crm5 for Asia Pacific (APAC)  
> -   .crm6 for Oceania (OCE)  
> -   .crm7 for Japan (JPN)  
> -   .crm8 for India (IND)  
> -   .crm9 for United States of America Government  
> -   .crm11 for United Kingdom (UK)  
> -   .crm12 for France (FRA)
- .crm15 for United Arab Emirates (UAE)
  
 For Germany (DEU), use the following: [https://\<organization>.crm.microsoftdynamics.de](https://<organization>.crm.microsoftdynamics.de).  
  
 Your user name depends on whether your organization uses the standard [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] domain (for example, username@contoso.onmicrosoft.com) or you have a custom domain (for example, username@contoso.com).  
  
 Administrators can provide the URL and sign-in information.  
-->
### See also  
 [Quickly navigate with the Office app launcher and the Dynamics 365 home page](../admin/quickly-navigate-office-365-app-launcher.md)   


