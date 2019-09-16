---
title: "Configure server-based authentication with Dynamics 365 for Customer Engagement apps (online) and SharePoint on-premises | MicrosoftDocs"
ms.custom: 
ms.date: 07/11/2019
ms.reviewer: 
ms.service: crm-online
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: article
applies_to: 
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
ms.assetid: d3fed784-942b-470d-b01a-ce3f2be3aa04
caps.latest.revision: 42
author: Mattp123
ms.author: matp
manager: kvivek
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# Configure server-based authentication with Dynamics 365 for Customer Engagement apps (online) and SharePoint on-premises

Server-based [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] integration for document management can  be used to connect [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises. When using server-based authentication, [Azure AD Domain Services](https://azure.microsoft.com/documentation/articles/active-directory-ds-overview/) is used as the trust broker and users do not need to sign in to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
<a name="perms"></a>   
## Permissions required  
[!INCLUDE[pn_Office_365](../includes/pn-office-365.md)]
  
- Office 365 Global Administrators membership - this is required for administrative-level access to the [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] subscription and to run the [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)][!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets.  
  
[!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps 
  
- **Run SharePoint Integration Wizard** privilege. This is required to run the Enable Server-based Authentication wizard in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  
  
     By default, the System Administrator security role has this permission.  
  
  [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises  
  
- Farm Administrators group membership - this is required to run most of the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server.  
  
<a name="setups2s"></a>   

## Set up server-to-server authentication with Dynamics 365 for Customer Engagement apps (online) and SharePoint on-premises  
 Follow the steps in the order provided to set up Customer Engagement apps with [!INCLUDE[pn_sharepoint_2013](../includes/pn-sharepoint-2013.md)] on-premises.  
  
> [!IMPORTANT]
> The steps described here must be completed in the order provided. If a task is not completed, such as a [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] command that returns an error message, the issue must be resolved before you continue to the next command, task, or step.  
  
  
### Verify prerequisites  
 Before you configure [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises for server-based authentication, the following prerequisites must be met:  
  
<a name="BKMK_SP_prereq"></a>   

#### SharePoint prerequisites  
  
- [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] (on-premises) with Service Pack 1 (SP1) or later version  
  
  > [!IMPORTANT]
  >  SharePoint Foundation 2013 versions aren’t supported for use with [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps document management.  
  
- Hotfix KB2883081 for SharePoint Foundation 2013 August 12, 2014 (Sts-x-none.msp). This hotfix is included with the [Office 2013 cumulative update for August 2014](https://support.microsoft.com/help/2989078/office-2013-cumulative-update-for-august-2014).  
  
  > [!IMPORTANT]
  >  The following updates are prerequisites to KB2883081 and may also be required.  
  >   
  > -   [http://support2.microsoft.com/kb/2768000](http://support2.microsoft.com/kb/2768000)  
  > -   [http://support.microsoft.com/kb/2767999](http://support.microsoft.com/kb/2767999)  
  > -   [http://support.microsoft.com/kb/2880963](http://support.microsoft.com/kb/2880963)  
  
- [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] configuration  
  
  - If you use [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)], for each [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm, only one [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps can be configured for server-based integration.  
  
  - [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website must be accessible via the Internet. A reverse proxy may also be required for [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] authentication. More information: [Configure a reverse proxy device for SharePoint Server 2013 hybrid](https://technet.microsoft.com/library/dn607304.aspx)  
  
  - [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website must be configured to use SSL (HTTPS) on TCP port 443 (no custom ports are supported) and the certificate must be issued by a public root Certificate Authority. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [SharePoint: About Secure Channel SSL certificates](https://technet.microsoft.com/library/b291ea58-cfda-48ec-92d7-5180cb7e9469#AboutSecureChannel)  
  
  - A reliable user property to use for claims-based authentication mapping between [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] and [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Selecting a claims mapping type](../admin/configure-server-based-authentication-sharepoint-on-premises.md#BKMK_selectclmmap)  
  
  - For document sharing, the SharePoint search service must be enabled. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create and configure a Search service application in SharePoint Server](https://technet.microsoft.com/library/gg502597.aspx)  
  
  - For document management functionality when using the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps mobile apps, the on-premises [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server must be available through the Internet.  
  
  
<a name="BKMK_otherPreq"></a>  
 
#### Other prerequisites  
  
- [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license. [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server-based authentication must have the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] service principal name (SPN) registered in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)]. To achieve this, at least one [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] user license is required. The [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license can derive from a single user license and typically comes from one of the following:  
  
  - A [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] subscription. Any [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] plan is sufficient even if the license isn’t assigned to a user.  
  
  - An [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] subscription that includes [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)]. For example, if you have [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] E3, you have the appropriate licensing even if the license isn’t assigned to a user.  
  
    For more information about these plans, see [Office 365: Select a plan](https://products.office.com/business/compare-office-365-for-business-plans) and [Compare SharePoint options](https://products.office.com/sharepoint/compare-sharepoint-plans)  
  
- The following software features are required to run the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets described in this topic.  
  
  -   [Microsoft Online Services Sign-In Assistant for IT Professionals Beta](http://www.microsoft.com/download/details.aspx?id=39267)  
  
  -   [MSOnlineExt](https://www.powershellgallery.com/packages/MSOnlineExt/)  
     -   To install the MSOnlineExt module, enter the following command from an administrator PowerShell session.
         `PS> Install-Module -Name "MSOnlineExt"`
  
  > [!IMPORTANT]
  >  At the time of this writing, there is an issue with the RTW version of Microsoft Online Services Sign-In Assistant for IT Professionals. Until the issue is resolved, we recommend that you use the Beta version. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Microsoft Azure Forums: Cannot install Azure Active Directory Module for Windows PowerShell. MOSSIA is not installed](https://social.msdn.microsoft.com/Forums/azure/en-US/46a38822-28a4-4abb-b747-96f7db2a2676/cannot-install-azure-active-directory-module-for-windows-powershell-mossia-is-not-installed?forum=WindowsAzureAD).  
  
- A suitable claims-based authentication mapping type to use for mapping identities between [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises. By default, email address is used. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Grant Microsoft Dynamics 365 for Customer Engagement apps permission to access SharePoint and configure the claims-based authentication mapping](../admin/configure-server-based-authentication-sharepoint-on-premises.md#BKMK_grantperm)  
  
### Update the SharePoint Server SPN in Azure Active Directory Domain Services  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
1. Prepare the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] session.  
  
    The following cmdlets enable the computer to receive remote commands and add [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] modules to the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] session. For more information about these cmdlets see [Windows PowerShell Core Cmdlets](https://technet.microsoft.com/library/hh849695.aspx).  
  
   ```  
  
   Enable-PSRemoting -force  
   New-PSSession  
   Import-Module MSOnline -force  
   Import-Module MSOnlineExtended -force  
   ```  
  
2. Connect to [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)].  
  
    When you run the Connect-MsolService command, you must provide a valid [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that has Office 365 Global Administrator membership for the [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license that is required.  
  
    For detailed information about each of the [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)][!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands listed here, see [Manage Azure AD using Windows PowerShell](https://msdn.microsoft.com/library/azure/jj151815.aspx)  
  
   ```  
   $msolcred = get-credential  
   connect-msolservice -credential $msolcred  
  
   ```  
  
3. Set the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] host name.  
  
    The value that you set for the variable *HostName* must be the complete host name of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection. The hostname must be derived from the site collection URL and is case sensitive. In this example, the site collection URL is *<https://SharePoint.constoso.com/sites/salesteam>*, so the hostname is *SharePoint.contoso.com*.  
  
   ```  
   $HostName = "SharePoint.contoso.com"  
  
   ```  
  
4. Get the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] object (tenant) id and [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] Service Principal Name (SPN).  
  
   ```  
   $SPOAppId = "00000003-0000-0ff1-ce00-000000000000"  
   $SPOContextId = (Get-MsolCompanyInformation).ObjectID  
   $SharePoint = Get-MsolServicePrincipal -AppPrincipalId $SPOAppId  
   $ServicePrincipalName = $SharePoint.ServicePrincipalNames  
   ```  
  
5. Set the [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] Service Principal Name (SPN) in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)].  
  
   ```  
  
   $ServicePrincipalName.Add("$SPOAppId/$HostName")   
   Set-MsolServicePrincipal -AppPrincipalId $SPOAppId -ServicePrincipalNames $ServicePrincipalName  
  
   ```  
  
   After these commands complete do not close the SharePoint 2013 Management Shell, and continue to the next step.  
  
### Update the SharePoint realm to match that of SharePoint Online  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run this [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] command.  
  
 The following command requires [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm administrator membership and sets the authentication realm of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises farm.  
  
> [!CAUTION]
>  Running this command changes the authentication realm of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises farm. For applications that use an existing security token service (STS), this may cause unexpected behavior with other applications that use access tokens. More information: [Set-SPAuthenticationRealm](https://technet.microsoft.com/library/jj219756.aspx).  
  
```  
  
Set-SPAuthenticationRealm -Realm $SPOContextId  
  
```  
  
### Create a trusted security token issuer for Azure Active Directory on SharePoint  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
 The following commands require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm administrator membership.  
  
 For detailed information about these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands, see [Use Windows PowerShell cmdlets to administer security in SharePoint 2013](https://technet.microsoft.com/library/ee890110.aspx).  
  
1. Enable the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] session to make changes to the security token service for the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm.  
  
   ```  
   $c = Get-SPSecurityTokenServiceConfig  
   $c.AllowMetadataOverHttp = $true  
   $c.AllowOAuthOverHttp= $true  
   $c.Update()  
  
   ```  
  
2. Set the metadata endpoint.  
  
   ```  
   $metadataEndpoint = "https://accounts.accesscontrol.windows.net/" + $SPOContextId + "/metadata/json/1"  
   $acsissuer = "00000001-0000-0000-c000-000000000000@" + $SPOContextId  
   $issuer = "00000007-0000-0000-c000-000000000000@" + $SPOContextId  
  
   ```  
  
3. Create the new token control service application proxy in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)].  
  
   ```  
   New-SPAzureAccessControlServiceApplicationProxy -Name "Internal" -MetadataServiceEndpointUri $metadataEndpoint -DefaultProxyGroup  
  
   ```  
  
   > [!NOTE]
   >  The `New- SPAzureAccessControlServiceApplicationProxy` command may return an error message indicating that an  application proxy with the same name already exists. If the named  application proxy already exists, you can ignore the error.  
  
4. Create the new token control service issuer in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises for [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)].  
  
   ```  
  
   $acs = New-SPTrustedSecurityTokenIssuer –Name "ACSInternal" –IsTrustBroker:$true –MetadataEndpoint $metadataEndpoint -RegisteredIssuerName $acsissuer  
  
   ```  
  
<a name="BKMK_grantperm"></a>   
### Grant Dynamics 365 for Customer Engagement apps permission to access SharePoint and configure the claims-based authentication mapping  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2013 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
 The following commands require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection administration membership.  
  
1. Register [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps with the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection.  
  
    Enter the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises site collection URL. In this example, *<https://sharepoint.contoso.com/sites/crm/>* is used.  
  
   > [!IMPORTANT]
   >  To complete this command, the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] App Management Service Application Proxy must exist and be running. For more information about how to start and configure the service, see the Configure the Subscription Settings and App Management service applications subtopic in [Configure an environment for apps for SharePoint (SharePoint 2013)](https://technet.microsoft.com/library/fp161236.aspx).  
  
   ```powershell  
  
   $site = Get-SPSite "https://sharepoint.contoso.com/sites/crm/"  
   Register-SPAppPrincipal -site $site.RootWeb -NameIdentifier $issuer -DisplayName "crm"  
  
   ```  
  
2. Grant [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps access to the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site. Replace *<https://sharepoint.contoso.com/sites/crm/>* with your [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site URL.  
  
   > [!NOTE]
   >  In the following example, the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps is granted permission to the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection by using the –Scope site collection parameter. The Scope parameter accepts the following options. Choose the scope that is most appropriate for your [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] configuration.  
   > 
   > - `site`. Grants the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps permission to the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website only. It doesn’t grant permission to any subsites under the named site.  
   >   - `sitecollection`. Grants the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps permission to all websites and subsites within the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection.  
   >   - `sitesubscription`. Grants the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps permission to all websites in the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm, including all site collections, websites, and subsites.  
  
   ```  
   $app = Get-SPAppPrincipal -NameIdentifier $issuer -Site "https://sharepoint.contoso.com/sites/crm/"  
   Set-SPAppPrincipalPermission -AppPrincipal $app -Site $site.Rootweb -Scope "sitecollection" -Right "FullControl"  
   ```  
  
3. Set the claims-based authentication mapping type.  
  
   > [!IMPORTANT]
   >  By default, the claims-based authentication mapping will use the user’s [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] email address and the user’s [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises **work email** address for mapping. When you use this, the user’s email addresses must match between the two systems. For more information, see [Selecting a claims-based authentication mapping type](../admin/configure-server-based-authentication-sharepoint-on-premises.md#BKMK_selectclmmap).  
  
   ```  
   $map1 = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress" -IncomingClaimTypeDisplayName "EmailAddress" -SameAsIncoming  
  
   ```  
  
### Run the Enable server-based SharePoint integration wizard  
 In the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps, follow these steps:  
  
1. [!INCLUDE[proc_settings_doc_management](../includes/proc-settings-doc-management.md)]  
  
2. In the **Document Management** area, click **Enable server-based SharePoint integration**.  
  
3. Review the information and then click **Next**.  
  
4. For the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] sites, click **On-premises**, and then **Next**.  
  
5. Enter the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises site collection URL, such as *<https://sharepoint.contoso.com/sites/crm>*. The site must be configured for SSL.  
  
6. Click **Next**.  
  
7. The validate sites section appears. If all sites are determined valid, click **Enable**. If one or more sites are determined invalid, see [Troubleshooting server-based authentication](../admin/troubleshooting-server-based-authentication.md).  
  
### Select the entities that you want to include in document management  
 By default, Account, Article, Lead, Product, Quote, and Sales Literature entities are included. You can add or remove the entities that will be used for document management with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] in **Document Management Settings** in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. [!INCLUDE[proc_settings_doc_management](../includes/proc-settings-doc-management.md)][!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Enable document management on entities](enable-sharepoint-document-management-specific-entities.md)  
  
<a name="addOneDrive"></a>   

## Add OneDrive for Business integration  
 After you complete [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server-based authentication configuration, you can also integrate [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. With [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps and [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] integration, [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps users can create and manage private documents using [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. Those documents can be accessed in [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps once the system administrator has enabled [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)].  
  
### Enable OneDrive for Business  
 On the Windows Server where [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] on-premises is running, open the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Management Shell and run the following commands:  
  
```  
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
 By default, the claims-based authentication mapping will use the user’s [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] email address and the user’s [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises work email address for mapping. Note that whatever claims-based authentication type you use, the values, such as email addresses, **must match** between [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] directory synchronization can help with this. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Deploy Office 365 Directory Synchronization (DirSync) in Microsoft Azure](https://technet.microsoft.com/library/dn635310.aspx). To use a different type of claims-based authentication mapping, see [Define custom claim mapping for SharePoint server-based integration](../developer/integration-dev/define-custom-claim-mapping-sharepoint-server-based-integration.md).
  
> [!IMPORTANT]
>  To enable the Work email property, [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises must have a User Profile Service Application configured and started. To enable a User Profile Service Application in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], see [Create, edit, or delete User Profile service applications in SharePoint Server 2013](https://technet.microsoft.com/library/ee721052.aspx). To make changes to a user property, such as Work email, see [Edit a user profile property](https://technet.microsoft.com/library/cc262327.aspx). For more information about the User Profile Service Application, see [Overview of the User Profile service application in SharePoint Server 2013](https://technet.microsoft.com/library/ee662538.aspx).  
  
### See also  
 [Troubleshooting server-based authentication](../admin/troubleshooting-server-based-authentication.md)   
 [Set up SharePoint integration with Microsoft Dynamics 365 for Customer Engagement](../admin/set-up-sharepoint-integration.md)
