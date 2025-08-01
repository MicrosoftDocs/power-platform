---
title: Configure server-based authentication with SharePoint on-premises
description: Configure server-based authentication with SharePoint on-premises
author: adrianorth 
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/15/2025
ms.subservice: admin
ms.author: aorth
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-ga-nochange
---
# Configure server-based authentication with SharePoint on-premises

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- legacy procedure -->

Server-based [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] integration for document management is used to connect customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises. When using server-based authentication, [Microsoft Entra Domain Services](/azure/active-directory-domain-services/overview) is used as the trust broker and users don't need to sign in to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
## Permissions required

The following memberships and privileges are required to enable SharePoint document management.

- [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global admin membership is required for:
  - Administrative-level access to the [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] subscription.
  - Running Enable Server-based Authentication wizard. 
  - Running the [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)][!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets.  
  
- Power Apps **Run SharePoint Integration Wizard** privilege allows the Enable Server-based Authentication wizard.  
  
     By default, the System Administrator security role has this privilege.  
  
- For  [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises integration, SharePoint Farm Administrators group membership is required to run most of the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server.  
  
<a name="setups2s"></a>   

## Set up server-to-server authentication with SharePoint on-premises  
Follow the steps, in the order provided, to set up customer engagement apps with SharePoint 2016 on-premises.  
  
> [!IMPORTANT]
> The steps described here must be completed in the order provided. If a task isn't completed, such as a [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] command that returns an error message, the issue must be resolved before you continue to the next command, task, or step.  
   
### Verify prerequisites

Before you configure customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises for server-based authentication, the following prerequisites must be met:  
  
<a name="BKMK_SP_prereq"></a>   

#### SharePoint prerequisites  
  
- SharePoint 2016 (on-premises) with Service Pack 1 (SP1) or later version.

- Install the May 2025 Cumulative Update (CU) for the SharePoint 2016 product family. This May 2025 CU includes all SharePoint 2016 fixes&mdash;including all SharePoint 2016 security fixes&mdash;released since SP1. The May 2025 CU doesn't include SP1. You need to install SP1 before installing the May 2025 CU. Learn more in [Download Security Update for Microsoft SharePoint Enterprise Server 2016 (KB5002722) from Official Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=108177) and for 2019, go to [Download Security Update for Microsoft SharePoint Server 2019 Core (KB5002708) from Official Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=108171).

- [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] configuration: 
  
  - If you use SharePoint 2016, for each [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm, only one customer engagement app can be configured for server-based integration.  
  
  - [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website must be accessible via the Internet. A reverse proxy may also be required for [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] authentication. Learn more in [Configure a reverse proxy device for SharePoint Server 2016 hybrid](/SharePoint/hybrid/configure-a-reverse-proxy-device-for-sharepoint-server-hybrid).
  
  - [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website must be configured to use SSL (HTTPS) on TCP port 443 (no custom ports are supported) and use a public root, Certificate Authority-issued certificate. Learn more in [SharePoint: About Secure Channel SSL certificates](/SharePoint/hybrid/plan-connectivity-from-office-365-to-sharepoint-server#AboutSecureChannel).
  
  - A reliable user property to use for claims-based authentication mapping between [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] and customer engagement apps. Learn more in [Selecting a claims mapping type](../admin/configure-server-based-authentication-sharepoint-on-premises.md#BKMK_selectclmmap).  
  
  - For document sharing, the SharePoint search service must be enabled. Learn more in [Create and configure a Search service application in SharePoint Server](/SharePoint/search/create-and-configure-a-search-service-application).
  
  - For document management functionality when using the Dynamics 365 mobile apps, the on-premises [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server must be available through the Internet.  
  
#### Other prerequisites  
  
- [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license. Customer engagement apps to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server-based authentication must have the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] service principal name (SPN) registered in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)]. To achieve access, at least one [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] user license is required. The [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license can derive from a single user license and typically comes from one of the following:  
  
  - A [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] subscription. Any [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] plan is sufficient even if the license isn't assigned to a user.  
  
  - An [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] subscription that includes [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)]. For example, if you have [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] E3, you have the appropriate licensing even if the license isn't assigned to a user.  
  
    For more information about these plans, go to [Find the right solution for you](https://products.office.com/business/compare-office-365-for-business-plans) and [Compare SharePoint options](https://products.office.com/sharepoint/compare-sharepoint-plans).
  
- The following software features are required to run the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets described in this article.

  **Microsoft.Graph**
  
  To install the Microsoft.Graph module, enter the following command from an administrator PowerShell session. 

  ```powershell
  $currentMaxFunctionCount =
      $ExecutionContext.SessionState.PSVariable.Get("MaximumFunctionCount").Value
     
  # Set execution policy to RemoteSigned for this session
  if ((Get-ExecutionPolicy -Scope Process) -ne "RemoteSigned") {
      Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
  }
   
  # Update MaximumFunctionCount if needed
  if ($currentMaxFunctionCount -lt 32768) {
      $ExecutionContext.SessionState.PSVariable.Set("MaximumFunctionCount", 32768)
  }
   
  # Install and import required modules
  if (-not (Get-Module -ListAvailable -Name "Microsoft.Graph")) {
      $Params = @{
          Name = "Microsoft.Graph"
          Scope = CurrentUser
      }
      Install-Module @Params -Force
  }
  
  $Params = @{
      Name = "Microsoft.Graph"
      Function = @("Connect-MgGraph", "Get-MgOrganization")
  }
  Import-Module @Params
   
  if (-not (Get-Module -ListAvailable -Name "Microsoft.Graph.Identity.DirectoryManagement")) {
      $Params = @{
          Name = "Microsoft.Graph.Identity.DirectoryManagement"
          Scope = CurrentUser
      }
      Install-Module @Params -Force
  }
  
  $Params = @{
      Name = "Microsoft.Graph.Identity.DirectoryManagement"
      Function = @("Get-MgServicePrincipal", "Update-MgServicePrincipal")
  }
  Import-Module @Params
  ```  

- A suitable claims-based authentication mapping type to use for mapping identities between customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises. By default, email address is used. Learn more in [Grant customer engagement apps permission to access SharePoint and configure the claims-based authentication mapping](#grant-customer-engagement-apps-permission-to-access-sharepoint-and-configure-the-claims-based-authentication-mapping). 
  
### Update the SharePoint Server SPN in Microsoft Entra Domain Services  

On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2016 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
    
1. Connect to [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)].  

   When you run the Connect-MgGraph command, you must provide a valid [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] that has global admin membership for the [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] license that's required.  
  
   For detailed information about each of the [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)][!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands listed here, go to [Manage Microsoft Entra using Windows PowerShell](/previous-versions/azure/jj151815(v=azure.100)).
  
   ```powershell
   Connect-MgGraph -Scopes "Directory.ReadWrite.All", "Application.ReadWrite.All"  
   ```  

1. Set the SharePoint host URL.  
  
   The value that you set for the variable **HostNameUrl** must be the complete host name URL of the SharePoint site collection. The hostname must be derived from the site collection URL and is case sensitive. In this example, the site collection URL is `https://SharePoint.constoso.com/sites/salesteam`, so the hostname URL is `https://SharePoint.contoso.com`.

   > [!IMPORTANT]
   > If there are multiple sites, run the following command for each site.
 
   ```powershell
   # Generate Service Principal Name
   # Note: If there are multiple sites, and the host is the same, no action is needed.
   #       If the host is different, each site needs to be configured to add the 
   #       host to the service principal.
   $uri = [System.Uri]"https://SharePoint.constoso.com/sites/salesteam"
   $hostName = $uri.Host
   $baseUrl = "$($uri.Scheme)://$hostName"
   $servicePrincipalName = $baseUrl
   ```  
  
1. Get the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] object (tenant) ID and [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] Service Principal Name (SPN).  
  
   ```powershell
   # SharePoint Online App ID
   $SPOAppId = "00000003-0000-0ff1-ce00-000000000000"
   
   # Retrieve SharePoint Online Service Principal
   $SharePoint = Get-MgServicePrincipal -Filter "AppId eq '$SPOAppId'"

   $UpdatedServicePrincipalNames = $SharePoint.ServicePrincipalNames |
       Where-Object { $_ -ne $servicePrincipalName }
   $UpdatedServicePrincipalNames += $servicePrincipalName
   ```
   
1. Get the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] object (tenant) ID and [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] Service Principal Name (SPN).  
  
   ```powershell
   $maxRetries = 5
   $retryDelay = 5 # seconds 
   
   for ($retry = 1; $retry -le $maxRetries; $retry++) {
       try {
           $Params = @{
    	         ServicePrincipalId = $SharePoint.Id
    			     ServicePrincipalNames = $UpdatedServicePrincipalNames
    		   }
    		   Update-MgServicePrincipal @Params
    		   Write-Host "Service Principal Names updated successfully."
    		   break
    	 }
    	 catch {
    		   if ($_.Exception.Message -match "Directory_ConcurrencyViolation" -and
               $retry -lt $maxRetries) {
    			     Write-Host "Concurrency violation detected. (Attempt $retry of $maxRetries)"
    			     Start-Sleep -Seconds $retryDelay
      		 }
      		 else {
        			 Write-Host "Failed to update Service Principal Names. Error: $_"
    		    	 exit 1
           }
       }
   }
   ```  
  
After these commands complete, don't close the SharePoint 2016 Management Shell. Continue to the next step.  
  
### Update the SharePoint realm to match that of SharePoint Online  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2016 Management Shell, run this [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] command.  
  
 The following command requires [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm administrator membership and sets the authentication realm of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises farm.  
  
> [!CAUTION]
>  Running this command changes the authentication realm of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises farm. For applications that use an existing security token service (STS), this command may cause unexpected behavior with other applications that use access tokens. Learn more in [Set-SPAuthenticationRealm](/powershell/module/sharepoint-server/Set-SPAuthenticationRealm).  
  
```powershell
# SPOContextId is the tenant ID for the dynamics 365 tenant. It is used to identify the tenant in Azure AD and SharePoint Online.
$SPOContextId = "<tenantId>"
Set-SPAuthenticationRealm -Realm $SPOContextId
```  
  
### Create a trusted security token issuer for Microsoft Entra ID on SharePoint  
 On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2016 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
 The following commands require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm administrator membership.  
  
 For detailed information about these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands, go to [Use Windows PowerShell cmdlets to administer security in SharePoint 2016](/powershell/module/sharepoint-server/).  
  
1. Enable the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] session to make changes to the security token service for the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm.  
  
   ```powershell
   $c = Get-SPSecurityTokenServiceConfig  
   $c.AllowMetadataOverHttp = $true  
   $c.AllowOAuthOverHttp= $true  
   $c.Update()  
   ```  
  
2. Set the metadata endpoint.  
  
   ```powershell
   $metadataEndpoint = 
       "https://login.microsoftonline.com/common/.well-known/openid-configuration"  
   $oboissuer = "https://sts.windows.net/*/" 
   $issuer = "00000007-0000-0000-c000-000000000000@" + $SPOContextId  
   ```  
  
3. Create the new token control service application proxy in [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)].  
  
   ```powershell
   $existingIssuer = Get-SPTrustedSecurityTokenIssuer "D365Obo"
   if ($existingIssuer) {
       $Params = @{
           Identity = $existingIssuer
           IsTrustBroker = $true
           MetadataEndpoint = $metadataEndpoint
           RegisteredIssuerName = $oboissuer
       }
       Set-SPTrustedSecurityTokenIssuer @Params
   } else {
       $Params = @{
           Name = "D365Obo"
           IsTrustBroker = $true
           MetadataEndpoint = $metadataEndpoint
           RegisteredIssuerName = $oboissuer
       }
       $obo = New-SPTrustedSecurityTokenIssuer @Params
   }
   ```  
  
### Grant customer engagement apps permission to access SharePoint and configure the claims-based authentication mapping

On the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server, in the SharePoint 2016 Management Shell, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands in the order given.  
  
The following commands require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection administration membership.  
  
1. Register customer engagement apps with the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection.  
  
    Enter the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises site collection URL. In this example, `<https://sharepoint.contoso.com/sites/crm/>` is used.  
    
   ```powershell
   $site = Get-SPSite "https://sharepoint.contoso.com/sites/crm/"
   $Params = @{
       site = $site.RootWeb
       NameIdentifier = $issuer
       DisplayName = "crmobo"
   }
   Register-SPAppPrincipal @Params
   ```  
  
2. Grant customer engagement apps access to the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site. Replace `<https://sharepoint.contoso.com/sites/crm/>` with your [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site URL.  
  
   > [!NOTE]
   >  In the following example, the customer engagement app is granted permission to the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection by using the –Scope site collection parameter. The Scope parameter accepts the following options. Choose the scope that is most appropriate for your [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] configuration.  
   > 
   > - `site`. Grants the customer engagement apps permission to the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] website only. It doesn't grant permission to any subsites under the named site.  
   >   - `sitecollection`. Grants the customer engagement apps permission to all websites and subsites within the specified [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection.  
   >   - `sitesubscription`. Grants the customer engagement apps permission to all websites in the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] farm, including all site collections, websites, and subsites.  

   > [!Important]
   > If there are multiple sites, run the script for each site.

   ```powershell
   $Params = @{
       NameIdentifier = $issuer
       Site = "https://sharepoint.contoso.com/sites/crm/"
   }
   $app = Get-SPAppPrincipal @Params
   
   $Params = @{
       AppPrincipal = $app
       Site = $site.Rootweb
       Scope = "sitecollection"
       Right = "FullControl"
   }
   Set-SPAppPrincipalPermission @Params
   ```  
  
3. Set the claims-based authentication mapping type.  
  
   > [!IMPORTANT]
   >  By default, the claims-based authentication mapping uses the user's [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] email address and the user's [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises **work email** address for mapping. When you use claims-based authentication mapping, the user's email addresses must match between the two systems. Learn more in [Selecting a claims-based authentication mapping type](../admin/configure-server-based-authentication-sharepoint-on-premises.md#BKMK_selectclmmap).  
  
   ```powershell
   $Params = @{
       IncomingClaimType = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"
       IncomingClaimTypeDisplayName = "EmailAddress"
   }
   $map1 = New-SPClaimTypeMapping @Params -SameAsIncoming
   ```  
  
### Run the Enable server-based SharePoint integration wizard

Follow these steps:  
  
1. Verify that you have the appropriate permission to run the wizard. Learn more in [Permissions required](#permissions-required).

1. [!INCLUDE[proc_settings_doc_management](../includes/proc-settings-doc-management.md)]  
  
1. In the **Document Management** area, click **Enable server-based SharePoint integration**.  
  
1. Review the information and then click **Next**.  
  
1. For the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] sites, click **On-premises**, and then **Next**.  
  
1. Enter the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises site collection URL, such as *<https://sharepoint.contoso.com/sites/crm>*. The site must be configured for SSL.  
  
1. Click **Next**.  
  
1. The validate sites section appears. If all sites are determined valid, click **Enable**. If one or more sites are determined invalid, go to [Troubleshooting server-based authentication](../admin/troubleshooting-server-based-authentication.md).  
  
### Select the entities that you want to include in document management  

By default, Account, Article, Lead, Product, Quote, and Sales Literature entities are included. You can add or remove the entities used for document management with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] in **Document Management Settings**. Go to **Settings** > **Document Management**. Learn more in [Enable document management on entities](enable-sharepoint-document-management-specific-entities.md). 
  
<a name="addOneDrive"></a>   

## Add OneDrive for Business integration  
 After you complete customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises server-based authentication configuration, you can also integrate [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. With customer engagement apps and [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] integration, users can create and manage private documents using [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. Those documents can be accessed after the system administrator enables [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)].  
  
### Enable OneDrive for Business  
 On the Windows Server where [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] on-premises is running, open the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Management Shell and run the following commands:  
  
```powershell
Add-Pssnapin *  

# Access WellKnown App principal  
[Microsoft.SharePoint.Administration.SPWebService]::ContentService.WellKnownAppPrincipals  
  
# Create WellKnown App principal  
$ClientId = "00000007-0000-0000-c000-000000000000"  
$PermissionXml = @"
<AppPermissionRequests AllowAppOnlyPolicy="true">
    <AppPermissionRequest Scope="http://sharepoint/content/tenant" Right="FullControl" />
    <AppPermissionRequest Scope="http://sharepoint/social/tenant" Right="Read" />
    <AppPermissionRequest Scope="http://sharepoint/search" Right="QueryAsUserIgnoreAppPrincipal" />
</AppPermissionRequests>
"@

$wellKnownApp = New-Object `
    -TypeName "Microsoft.SharePoint.Administration.SPWellKnownAppPrincipal" `
    -ArgumentList ($ClientId, $PermissionXml)  
  
$wellKnownApp.Update()    
```  
  
<a name="BKMK_selectclmmap"></a>   

## Selecting a claims-based authentication mapping type  
 By default, the claims-based authentication mapping uses the user's [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] email address and the user's [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises work email address for mapping. Whatever claims-based authentication type you use, the values, such as email addresses, **must match** between customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] directory synchronization helps email addresses match. Learn more in [Deploy Microsoft 365 Directory Synchronization in Microsoft Azure](/microsoft-365/enterprise/deploy-microsoft-365-directory-synchronization-dirsync-in-microsoft-azure). To use a different type of claims-based authentication mapping, go to [Define custom claim mapping for SharePoint server-based integration](/dynamics365/customerengagement/on-premises/developer/integration-dev/define-custom-claim-mapping-sharepoint-server-based-integration?view=op-9-1&preserve-view=true).
  
> [!IMPORTANT]
>  To enable the Work email property, [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises must have a User Profile Service Application configured and started. To enable a User Profile Service Application in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], go to [Create, edit, or delete User Profile service applications in SharePoint Server 2016](/SharePoint/install/create-a-user-profile-service-application). To make changes to a user property, such as Work email, go to [Edit a user profile property](/SharePoint/administration/add-edit-or-delete-custom-properties-for-a-user-profile). For more information about the User Profile Service Application, go to [Overview of the User Profile service application in SharePoint Server 2016](/SharePoint/install/user-profile-service-overview).  
  
### Related content
- [Troubleshooting server-based authentication](../admin/troubleshooting-server-based-authentication.md)   
- [Set up SharePoint integration with customer engagement apps](../admin/set-up-sharepoint-integration.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
