---
title: "Configure server-based authentication with SharePoint on-premises | MicrosoftDocs"
description: Configure server-based authentication with SharePoint on-premises
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/08/2022
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
---
# Configure server-based authentication with SharePoint on-premises

<!-- legacy procedure -->

Server-based [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] integration for document management can  be used to connect customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises. When using server-based authentication, [Microsoft Entra Domain Services](/azure/active-directory-domain-services/overview) is used as the trust broker and users do not need to sign in to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
## Permissions required

The following memberships and privileges are required to enable SharePoint document management.

- [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global admin membership - this is required for:
  - Administrative-level access to the [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] subscription.
  - Running Enable Server-based Authentication wizard. 
  - Running the [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)][!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets.  
  
- Power Apps **Run SharePoint Integration Wizard** privilege. This is required to run the Enable Server-based Authentication wizard.  
  
     By default, the System Administrator security role has this privilege.  
  
- For  [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises integration, SharePoint Farm Administrators group membership. This is required to run most of the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server.  
  
<a name="setups2s"></a>   

## Set up server-to-server authentication with SharePoint on-premises  
 Follow the steps in the order provided to set up customer engagement apps with [!INCLUDE[pn_sharepoint_2013](../includes/pn-sharepoint-2013.md)] on-premises.  
  
> [!IMPORTANT]
> The steps described here must be completed in the order provided. If a task is not completed, such as a [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] command that returns an error message, the issue must be resolved before you continue to the next command, task, or step.  
  
  
### Verify prerequisites

Before you configure customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises for server-based authentication, the following prerequisites must be met:  
  
<a name="BKMK_SP_prereq"></a>   

#### SharePoint prerequisites  
  
- [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] (on-premises) with Service Pack 1 (SP1) or later version  
  
  > [!IMPORTANT]
  >  SharePoint Foundation 2013 versions aren't supported for use with customer engagement apps document management.  
  
- Install the April 2019 Cumulative Update (CU) for the SharePoint 2013 product family. This April 2019 CU includes all SharePoint 2013 fixes (including all SharePoint 2013 security fixes) released since SP1. The April 2019 CU does not include SP1. You need to install SP1 before installing the April 2019 CU. More information: [KB4464514 SharePoint Server 2013 April 2019 CU](https://support.microsoft.com/help/4464514/april-9-2019-cumulative-update-for-sharepoint-enterprise-server-2013-k) 

- [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] configuration  
  
  - If you use [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)], for each [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm, only one customer engagement app can be configured for server-based integration.  
  
  - [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website must be accessible via the Internet. A reverse proxy may also be required for [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] authentication. More information: [Configure a reverse proxy device for SharePoint Server 2013 hybrid](/SharePoint/hybrid/configure-a-reverse-proxy-device-for-sharepoint-server-hybrid)  
  
  - [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website must be configured to use SSL (HTTPS) on TCP port 443 (no custom ports are supported) and the certificate must be issued by a public root Certificate Authority. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [SharePoint: About Secure Channel SSL certificates](/SharePoint/hybrid/plan-connectivity-from-office-365-to-sharepoint-server#AboutSecureChannel)  
  
  - A reliable user property to use for claims-based authentication mapping between [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] and customer engagement apps. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Selecting a claims mapping type](../admin/configure-server-based-authentication-sharepoint-on-premises.md#BKMK_selectclmmap)  
  
  - For document sharing, the SharePoint search service must be enabled. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create and configure a Search service application in SharePoint Server](/SharePoint/search/create-and-configure-a-search-service-application)  
  
  - For document management functionality when using the Dynamics 365 mobile apps, the on-premises [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server must be available through the Internet.  
  
#### Other prerequisites  
  
- [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license. Customer engagement apps to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server-based authentication must have the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] service principal name (SPN) registered in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)]. To achieve this, at least one [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] user license is required. The [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license can derive from a single user license and typically comes from one of the following:  
  
  - A [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] subscription. Any [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] plan is sufficient even if the license isn't assigned to a user.  
  
  - An [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] subscription that includes [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)]. For example, if you have [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] E3, you have the appropriate licensing even if the license isn't assigned to a user.  
  
    For more information about these plans, see [Find the right solution for you](https://products.office.com/business/compare-office-365-for-business-plans) and [Compare SharePoint options](https://products.office.com/sharepoint/compare-sharepoint-plans)  
  
- The following software features are required to run the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets described in this topic.  
  
  -   Microsoft Online Services Sign-In Assistant for IT Professionals Beta  
  
  -   [MSOnlineExt](https://www.powershellgallery.com/packages/MSOnlineExt/)  
     -   To install the MSOnlineExt module, enter the following command from an administrator PowerShell session.
         `PS> Install-Module -Name "MSOnlineExt"`
  
  > [!IMPORTANT]
  >  At the time of this writing, there is an issue with the RTW version of Microsoft Online Services Sign-In Assistant for IT Professionals. Until the issue is resolved, we recommend that you use the Beta version. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Microsoft Azure Forums: Cannot install Microsoft Entra Module for Windows PowerShell. MOSSIA is not installed](https://social.msdn.microsoft.com/Forums/azure/46a38822-28a4-4abb-b747-96f7db2a2676/cannot-install-azure-active-directory-module-for-windows-powershell-mossia-is-not-installed?forum=WindowsAzureAD).  
  
- A suitable claims-based authentication mapping type to use for mapping identities between customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises. By default, email address is used. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Grant customer engagement apps permission to access SharePoint and configure the claims-based authentication mapping](#grant-customer-engagement-apps-permission-to-access-sharepoint-and-configure-the-claims-based-authentication-mapping)  
  
### Update the SharePoint Server SPN in Microsoft Entra Domain Services  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
1. Prepare the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] session.  
  
    The following cmdlets enable the computer to receive remote commands and add [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] modules to the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] session. For more information about these cmdlets see [Windows PowerShell Core Cmdlets](/powershell/module/microsoft.powershell.core/).  
  
   ```powershell
   Enable-PSRemoting -force  
   New-PSSession  
   Import-Module MSOnline -force  
   Import-Module MSOnlineExtended -force  
   ```  
  
2. Connect to [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)].  
  
    When you run the Connect-MsolService command, you must provide a valid [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that has Global admin membership for the [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license that is required.  
  
    For detailed information about each of the [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)][!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands listed here, see [Manage Microsoft Entra using Windows PowerShell](/previous-versions/azure/jj151815(v=azure.100))  
  
   ```powershell
   $msolcred = get-credential  
   connect-msolservice -credential $msolcred  
   ```  
  
3. Set the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] host name.  
  
    The value that you set for the variable *HostName* must be the complete host name of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection. The hostname must be derived from the site collection URL and is case sensitive. In this example, the site collection URL is `<https://SharePoint.constoso.com/sites/salesteam>`, so the hostname is *SharePoint.contoso.com*.  
  
   ```powershell
   $HostName = "SharePoint.contoso.com"  
   ```  
  
4. Get the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] object (tenant) id and [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] Service Principal Name (SPN).  
  
   ```powershell
   $SPOAppId = "00000003-0000-0ff1-ce00-000000000000"  
   $SPOContextId = (Get-MsolCompanyInformation).ObjectID  
   $SharePoint = Get-MsolServicePrincipal -AppPrincipalId $SPOAppId  
   $ServicePrincipalName = $SharePoint.ServicePrincipalNames  
   ```  
  
5. Set the [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] Service Principal Name (SPN) in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)].  
  
   ```powershell
   $ServicePrincipalName.Add("$SPOAppId/$HostName")   
   Set-MsolServicePrincipal -AppPrincipalId $SPOAppId -ServicePrincipalNames $ServicePrincipalName  
   ```  
  
   After these commands complete do not close the SharePoint 2013 Management Shell, and continue to the next step.  
  
### Update the SharePoint realm to match that of SharePoint Online  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run this [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] command.  
  
 The following command requires [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm administrator membership and sets the authentication realm of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises farm.  
  
> [!CAUTION]
>  Running this command changes the authentication realm of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises farm. For applications that use an existing security token service (STS), this may cause unexpected behavior with other applications that use access tokens. More information: [Set-SPAuthenticationRealm](/powershell/module/sharepoint-server/Set-SPAuthenticationRealm).  
  
```powershell
Set-SPAuthenticationRealm -Realm $SPOContextId  
```  
  
### Create a trusted security token issuer for Microsoft Entra ID on SharePoint  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
 The following commands require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm administrator membership.  
  
 For detailed information about these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands, see [Use Windows PowerShell cmdlets to administer security in SharePoint 2013](/powershell/module/sharepoint-server/).  
  
1. Enable the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] session to make changes to the security token service for the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm.  
  
   ```powershell
   $c = Get-SPSecurityTokenServiceConfig  
   $c.AllowMetadataOverHttp = $true  
   $c.AllowOAuthOverHttp= $true  
   $c.Update()  
   ```  
  
2. Set the metadata endpoint.  
  
   ```powershell
   $metadataEndpoint = "https://accounts.accesscontrol.windows.net/" + $SPOContextId + "/metadata/json/1"  
   $acsissuer = "00000001-0000-0000-c000-000000000000@" + $SPOContextId  
   $issuer = "00000007-0000-0000-c000-000000000000@" + $SPOContextId  
   ```  
  
3. Create the new token control service application proxy in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)].  
  
   ```powershell
   New-SPAzureAccessControlServiceApplicationProxy -Name "Internal" -MetadataServiceEndpointUri $metadataEndpoint -DefaultProxyGroup  
   ```  
  
   > [!NOTE]
   >  The `New- SPAzureAccessControlServiceApplicationProxy` command may return an error message indicating that an  application proxy with the same name already exists. If the named  application proxy already exists, you can ignore the error.  
  
4. Create the new token control service issuer in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises for [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)].  
  
   ```powershell
   $acs = New-SPTrustedSecurityTokenIssuer –Name "ACSInternal" –IsTrustBroker:$true –MetadataEndpoint $metadataEndpoint -RegisteredIssuerName $acsissuer  
   ```  
  
### Grant customer engagement apps permission to access SharePoint and configure the claims-based authentication mapping

On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
The following commands require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection administration membership.  
  
1. Register customer engagement apps with the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection.  
  
    Enter the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises site collection URL. In this example, *<https://sharepoint.contoso.com/sites/crm/>* is used.  
  
   > [!IMPORTANT]
   >  To complete this command, the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] App Management Service Application Proxy must exist and be running. For more information about how to start and configure the service, see the Configure the Subscription Settings and App Management service applications subtopic in [Configure an environment for apps for SharePoint (SharePoint 2013)](/SharePoint/administration/configure-an-environment-for-apps-for-sharepoint).  
  
   ```powershell  
   $site = Get-SPSite "https://sharepoint.contoso.com/sites/crm/"  
   Register-SPAppPrincipal -site $site.RootWeb -NameIdentifier $issuer -DisplayName "crm"  
   ```  
  
2. Grant customer engagement apps access to the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site. Replace *<https://sharepoint.contoso.com/sites/crm/>* with your [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site URL.  
  
   > [!NOTE]
   >  In the following example, the customer engagement app is granted permission to the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection by using the –Scope site collection parameter. The Scope parameter accepts the following options. Choose the scope that is most appropriate for your [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] configuration.  
   > 
   > - `site`. Grants the customer engagement apps permission to the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website only. It doesn't grant permission to any subsites under the named site.  
   >   - `sitecollection`. Grants the customer engagement apps permission to all websites and subsites within the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection.  
   >   - `sitesubscription`. Grants the customer engagement apps permission to all websites in the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm, including all site collections, websites, and subsites.  
  
   ```powershell
   $app = Get-SPAppPrincipal -NameIdentifier $issuer -Site "https://sharepoint.contoso.com/sites/crm/"  
   Set-SPAppPrincipalPermission -AppPrincipal $app -Site $site.Rootweb -Scope "sitecollection" -Right "FullControl"  
   ```  
  
3. Set the claims-based authentication mapping type.  
  
   > [!IMPORTANT]
   >  By default, the claims-based authentication mapping will use the user's [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] email address and the user's [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises **work email** address for mapping. When you use this, the user's email addresses must match between the two systems. For more information, see [Selecting a claims-based authentication mapping type](../admin/configure-server-based-authentication-sharepoint-on-premises.md#BKMK_selectclmmap).  
  
   ```powershell
   $map1 = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress" -IncomingClaimTypeDisplayName "EmailAddress" -SameAsIncoming  
   ```  
  
### Run the Enable server-based SharePoint integration wizard

Follow these steps:  
  
1. Verify that you have the appropriate permission to run the wizard. More information: [Permissions required](#permissions-required)

1. [!INCLUDE[proc_settings_doc_management](../includes/proc-settings-doc-management.md)]  
  
1. In the **Document Management** area, click **Enable server-based SharePoint integration**.  
  
1. Review the information and then click **Next**.  
  
1. For the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] sites, click **On-premises**, and then **Next**.  
  
1. Enter the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises site collection URL, such as *<https://sharepoint.contoso.com/sites/crm>*. The site must be configured for SSL.  
  
1. Click **Next**.  
  
1. The validate sites section appears. If all sites are determined valid, click **Enable**. If one or more sites are determined invalid, see [Troubleshooting server-based authentication](../admin/troubleshooting-server-based-authentication.md).  
  
### Select the entities that you want to include in document management  

By default, Account, Article, Lead, Product, Quote, and Sales Literature entities are included. You can add or remove the entities that will be used for document management with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] in **Document Management Settings**. Go to **Settings** > **Document Management**. More information:  [Enable document management on entities](enable-sharepoint-document-management-specific-entities.md)  
  
<a name="addOneDrive"></a>   

## Add OneDrive for Business integration  
 After you complete customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server-based authentication configuration, you can also integrate [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. With customer engagement apps and [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] integration, users can create and manage private documents using [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. Those documents can be accessed in once the system administrator has enabled [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)].  
  
### Enable OneDrive for Business  
 On the Windows Server where [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] on-premises is running, open the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Management Shell and run the following commands:  
  
```powershell
Add-Pssnapin *  
# Access WellKnown App principal  
[Microsoft.SharePoint.Administration.SPWebService]::ContentService.WellKnownAppPrincipals  
  
# Create WellKnown App principal  
$ClientId = "00000007-0000-0000-c000-000000000000"  
$PermissionXml = "<AppPermissionRequests AllowAppOnlyPolicy=""true""><AppPermissionRequest Scope=""http://sharepoint/content/tenant"" Right=""FullControl"" /><AppPermissionRequest Scope=""http://sharepoint/social/tenant"" Right=""Read"" /><AppPermissionRequest Scope=""http://sharepoint/search"" Right=""QueryAsUserIgnoreAppPrincipal"" /></AppPermissionRequests>"  
  
$wellKnownApp= New-Object -TypeName "Microsoft.SharePoint.Administration.SPWellKnownAppPrincipal" -ArgumentList ($ClientId, $PermissionXml)  
  
$wellKnownApp.Update()  
  
```  
  
<a name="BKMK_selectclmmap"></a>   

## Selecting a claims-based authentication mapping type  
 By default, the claims-based authentication mapping will use the user's [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] email address and the user's [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises work email address for mapping. Note that whatever claims-based authentication type you use, the values, such as email addresses, **must match** between customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] directory synchronization can help with this. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Deploy Microsoft 365 Directory Synchronization in Microsoft Azure](/microsoft-365/enterprise/deploy-microsoft-365-directory-synchronization-dirsync-in-microsoft-azure). To use a different type of claims-based authentication mapping, see [Define custom claim mapping for SharePoint server-based integration]().
  
> [!IMPORTANT]
>  To enable the Work email property, [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises must have a User Profile Service Application configured and started. To enable a User Profile Service Application in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], see [Create, edit, or delete User Profile service applications in SharePoint Server 2013](/SharePoint/install/create-a-user-profile-service-application). To make changes to a user property, such as Work email, see [Edit a user profile property](/SharePoint/administration/add-edit-or-delete-custom-properties-for-a-user-profile). For more information about the User Profile Service Application, see [Overview of the User Profile service application in SharePoint Server 2013](/SharePoint/install/user-profile-service-overview).  
  
### See also  
 [Troubleshooting server-based authentication](../admin/troubleshooting-server-based-authentication.md)   
 [Set up SharePoint integration with customer engagement apps](../admin/set-up-sharepoint-integration.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]