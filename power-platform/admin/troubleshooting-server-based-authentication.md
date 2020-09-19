---
title: "Troubleshooting server-based authentication   | MicrosoftDocs"
description: Troubleshooting server-based authentication
author: Mattp123
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: matp
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Troubleshooting server-based authentication

<a name="BKMK_tshoot_wizard"></a>   
## Troubleshooting the Enable server-based SharePoint Integration wizard  
 Review the error log for information about why the site doesn’t validate. To do this, click **Error Log** in the Enable Server-Based SharePoint Integration wizard after the validate sites stage is completed.  
  
 The enable server-based SharePoint integration validation check can return one of the following four types of failures.  
  
<a name="BKMK_failConn"></a>   
### Failed Connection  
 This failure indicates that the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server could not be accessed from where the validation check was run. Verify that the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] URL that you entered is correct and that you can access the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site and site collection by using a web browser from the computer where the Enable Server-Based SharePoint Integration wizard is running. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Troubleshooting hybrid environments (SharePoint)](https://technet.microsoft.com/library/dn518363.aspx)  
  
<a name="BKMK_failAuthen"></a>   
### Failed Authentication  
 This failure can occur when one or more of the server-based authentication configuration steps were not completed or did not complete successfully. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Set up SharePoint integration](../admin/set-up-sharepoint-integration.md)  
  
 This failure can also occur if an incorrect URL is entered in the Enable Server-Based SharePoint Integration wizard or if there is a problem with the digital certificate used for server authentication. Similarly, this failure can occur as a result of a SharePoint site rename when the URL is not updated in the corresponding SharePoint Site record. More information: [Users receive "You don't have permissions to view files in this location" message](troubleshoot-set-up-sharepoint-online.md#users-receive-you-dont-have-permissions-to-view-files-in-this-location-message)
  
<a name="BKMK_fail_Author"></a>   
### Failed authorization or 401 unauthorized error
 This failure can occur when the claims-based authentication types do not match. For example, in a hybrid deployment such as customer engagement apps to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises, when you use the default claims-based authentication mapping, the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] email address used by the user must match the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] user’s **Work email**. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Define custom claim mapping for SharePoint server-based integration](https://docs.microsoft.com/power-platform/admin/configure-server-based-authentication-sharepoint-on-premises) 
  
<a name="BKMK_SP_nosupp"></a>   
### SharePoint Version Not Supported  
 This failure indicates that the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] edition, version, required service pack, or required hotfix are missing. 
 
 
<a name="BKMK_TS_SP"></a>   
## Troubleshooting SharePoint  
 Issues that affect server-based authentication can also be recorded in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] logs and reports. For more information about how to view and troubleshoot [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] monitoring, see the following topics. [View reports and logs in SharePoint 2013](https://technet.microsoft.com/library/ee748651.aspx) and [Configure diagnostic logging in SharePoint 2013](https://technet.microsoft.com/library/ee748656.aspx)  
  
<a name="BKMK_known_CRMOn_SPop"></a>   
## Known issues with server-based authentication  
 This section describes the known issues that may occur when you set up or use customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server-based authentication.  
  
### Failed authentication is returned when validating a SharePoint site even though you have appropriate permission  
 Applies to: customer engagement apps with [!INCLUDE[pn_microsoft_sharepoint_online](../includes/pn-microsoft-sharepoint-online.md)], customer engagement apps with [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] on-premises.  
  
 This issue can occur when the claims-based authentication mapping that is used provides a situation where the claims type values don’t match between customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. For example, this issue can occur when the following items are true:  
  
- You use the default claims-based authentication mapping type, which for customer engagement apps to [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] server-based authentication uses the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] unique identifier.  
  
- The identities used for [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)], Dynamics 365 administrator, or [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] administrator don’t use the same [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)], therefore the [!INCLUDE[pn_Windows_Live_ID](../includes/pn-windows-live-id.md)] unique identifiers don’t match.  
  
### “Private key not found” error message returned when you run the CertificateReconfiguration.ps1 Windows PowerShell script  
 *This content also applies to the on-premises version.*
  
 This issue can occur when there are two self-signed certificates located in the local certificate store that have the same subject name.  
  
 Notice that this issue should only occur when you use a self-signed certificate. Self-signed certificates should not be used in production environments.  
  
 To resolve this issue, remove the certificates with the same subject name that you don’t need using the Certificate Manager MMC snap-in and note the following.  
  
> [!IMPORTANT]
>  It can take up to 24 hours before the SharePoint cache will begin using the new certificate. To use the certificate now, follow the steps here to replace the certificate information in customer engagement apps.  
>   
>  To resolve this issue by following the steps in this article, the existing certificate cannot be expired.  
  
#### Replace a certificate that has the same subject name  
  
1. Use an existing or create a new and self-signed certificate. The subject name must be unique to any certificate subject names that are registered in the local certificate store.  
  
2. Run the following [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] script against the existing certificate, or the certificate that you created in the previous step. This script will add a new certificate in customer engagement apps, which will then be replaced in a later step. <!-- For more information about the CertificateReconfiguration.ps1[!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] script see, [Prepare Microsoft Customer Engagement server for server-based authentication](Configure%20server-based%20authentication%20with%20Microsoft%20Dynamics%20365%20\(on-premises\)%20and%20SharePoint%20on-premises.md#BKMK_prepare_CRM).  -->
  
```powershell
   CertificateReconfiguration.ps1 -certificateFile <Private certificate file (.pfx)> -password <private-certificate-password> -updateCrm -certificateType AlternativeS2STokenIssuer -serviceAccount <serviceAccount> -storeFindType FindBySubjectDistinguishedName  
   ```  
  
3. Remove the AlternativeS2STokenIssuer type certificate from the configuration database. To do this, run these [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] commands.  
  
 ```powershell
   Add-PSSnapin Microsoft.Crm.PowerShell   
   $Certificates = Get-CrmCertificate;   
   $alternativecertificate = "";   
   foreach($cert in $Certificates)   
   {    if($cert.CertificateType -eq "AlternativeS2STokenIssuer") { $alternativecertificate = $cert;}   }   
  
   Remove-CrmCertificate -Certificate $alternativecertificate  
   ```  
  
### You receive “The remote server returned an error: (400) Bad Request” and “Register-SPAppPrincipal: The requested service, '<http://wgwitsp:32843/46fbdd1305a643379b47d761334f6134/AppMng.svc>' could not be activated” error messages  
 Applies to: [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises versions used with customer engagement apps.  
  
 The remote server returned an error: (400) Bad Request error message can occur after the certificate installation, such as when you run the CertificateReconfiguration.Ps1 script.  
  
 The Register-SPAppPrincipal: The requested service, '<http://wgwitsp:32843/46fbdd1305a643379b47d761334f6134/AppMng.svc>' could not be activated error message can occur when you grant permission to access [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] by running the Register-SPAppPrincipal command.  
  
 To resolve both of these errors after they occur, restart the web server where the web application is installed. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Start or Stop the Web Server (IIS 8)](https://technet.microsoft.com/library/jj635851.aspx)  
  
### “Something went wrong while interaction with SharePoint” error message received  
 Applies to: All versions when used with [!INCLUDE[pn_microsoft_sharepoint_online](../includes/pn-microsoft-sharepoint-online.md)]  
  
 This error can be returned to the user who doesn’t have site permissions or the user has had permissions removed from the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site where document management is enabled. Currently, this is a known issue with [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] where the error message that is displayed to the user doesn’t indicate that the user’s permissions are not sufficient to access the site.  
  
### See also  
[Troubleshoot SharePoint Online integration](troubleshoot-set-up-sharepoint-online.md) <br />
 [Permissions required for document management tasks](../admin/permissions-required-document-management-tasks.md)
