---
title: "Web application requirements  | MicrosoftDocs"
description: Web application requirements
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Web application requirements

<a name="CRMappandMobileReqs"></a> 
This section lists the hardware and software requirements for model-driven apps and mobile device client applications.  

<a name="webapp_hw_req"></a>   
## Web application hardware requirements  
 The following table lists the minimum and recommended hardware requirements for the web application.  

|Component|Minimum|Recommended|  
|---------------|-------------|-----------------|  
|Processor|1.9 gigahertz (GHz)  x86- or x64-bit dual core processor with SSE2 instruction set|3.3 gigahertz (GHz) or faster 64-bit dual core processor with SSE2 instruction set|  
|Memory|2-GB RAM|4-GB RAM or more|  
|Display|Super VGA with a resolution of 1024 x 768|Super VGA with a resolution of 1024 x 768|  

Running model-driven apps on a computer that has less than the recommended requirements may result in inadequate performance. Additionally, satisfactory performance may be experienced running systems that use a different hardware configuration than those published here—for example, a system with a modern quad-core processor, lower clock speed, and more RAM.  

 **Network requirements**  

 Model-driven apps are designed to work best over networks that have the following elements:  

-   Bandwidth greater than 50 KBps (400 kbps)  

-   Latency under 150 ms  

Notice that these values are recommendations and don’t guarantee satisfactory performance. The recommended values are based on systems using out-of-the box forms that aren’t customized. If you significantly customize the out-of-box forms, we recommend that you test the form response to understand bandwidth needs. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Verify network capacity and throughput for clients](verify-network-capacity-throughput-clients.md)  


## Supported versions of Internet Explorer and Microsoft Edge  
 The following table describes the [!INCLUDE[pn_ms_Windows_short](../includes/pn-ms-windows-short.md)] and [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)] or [!INCLUDE[pn_microsoft_edge](../includes/pn-microsoft-edge.md)] versions supported for use with the web application.  


| Windows version | Internet Explorer 10 | Internet Explorer 11<sup>2</sup> | Microsoft Edge |
|-----------------------------------------------------------------------------|-----------------------------------------------|-----------------------------------------------------------|-----------------------------------------------------------------|
|           Windows 10      |           Not supported<sup>1</sup>           |                         Supported                         |                            Supported                            |
|          Windows 8.1       |           Not supported<sup>1</sup>           |                         Supported                         |                          Not supported                          |
|             Windows 8           |                   Not supported                    |                 Not supported<sup>1</sup>                 |                          Not supported                          |
|            Windows 7          |                   Not supported                |                         Supported                         |                          Not supported                          |

 <sup>1</sup> This version of [!INCLUDE[pn_ms_Windows_short](../includes/pn-ms-windows-short.md)] doesn’t support the version of [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Internet Explorer 11 – FAQ for IT Pros](https://technet.microsoft.com/library/dn268945.aspx)  <br/>
<sup>2</sup> Check requirements for individual apps, such as [Customer Service Hub application requirements](https://docs.microsoft.com/dynamics365/customer-service/customer-service-hub-user-guide-basics). <br/>

> [!IMPORTANT]
>  Although you may be able to use [!INCLUDE[pn_IE_8](../includes/pn-ie-8.md)], [!INCLUDE[pn_IE_9](../includes/pn-ie-9.md)], or an [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)] and [!INCLUDE[pn_ms_Windows_short](../includes/pn-ms-windows-short.md)] combination that is not supported in the previous table, those web browsers are not recommended and are not supported with this version of customer engagement apps.  
> 
>  Using plug-ins or other third-party extensions in your browser can increase load times on pages with lists of data.  

## Supported non-Internet Explorer web browsers  
 The web application can run in any of the following web browsers running on the specified operating systems:  

- Mozilla Firefox (latest publicly-released version) running on Windows 10, Windows 8.1, Windows 8, or Windows 7  

- [!INCLUDE[tn_Google_Chrome](../includes/tn-google-chrome.md)]
  - [!INCLUDE[tn_Google_Chrome](../includes/tn-google-chrome.md)] (latest publicly-released version) running on Windows 10, Windows 8.1, Windows 8, Windows 7, or [Google Nexus](https://docs.microsoft.com/dynamics365/mobile-app/support-phones-tablets) tablet 
  - Google Chrome (latest publicly-released version) running on the two latest publicly-release Mac OS versions 

- [!INCLUDE[tn_Apple_Safari](../includes/tn-apple-safari.md)] (latest publicly-released version) running on the two latest publicly-release Mac OS versions, or [Apple iPad](https://docs.microsoft.com/dynamics365/mobile-app/support-phones-tablets)  

To find the latest release for these web browsers, visit the software manufacturer’s website.  

> [!IMPORTANT]
> - Using plug-ins or other third-party extensions in your browser can increase load times on pages with lists of data.  
> - Mozilla Firefox ESR (Extended Support Release) versions aren’t supported.  

## Supported versions of Office  
 To use customer engagement apps (such as Dynamics 365 Sales and Customer Service) with [!INCLUDE[pn_MS_Office](../includes/pn-ms-office.md)] integration features, such as Export to Excel and Mail Merge, you must have one of the following [!INCLUDE[pn_MS_Office](../includes/pn-ms-office.md)] versions on the computer that is running the web application:  

- [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)]  

- [!INCLUDE[pn_microsoft_office_2016](../includes/pn-microsoft-office-2016.md)]  

- [!INCLUDE[pn_ms_office_2013_long](../includes/pn-ms-office-2013-long.md)]  

- [!INCLUDE[pn_Microsoft_Office_2010](../includes/pn-microsoft-office-2010.md)]  

[!INCLUDE[cc_Office365PlanRequirement](../includes/cc-office365planrequirement.md)]

<a name="BKMK_PrintRepots"></a>   
## Printing reports  
 The Reporting Services[!INCLUDE[pn_ms_ActiveX_long](../includes/pn-ms-activex-long.md)] control is required to print reports. If you try to print a report and the control isn’t installed, you’ll be prompted to install it. The installer package is named RSClientPrint.cab and can found on the [!INCLUDE[pn_SQL_Server_Reporting](../includes/pn-sql-server-reporting.md)] server at \<drive>:\Program files\Microsoft SQL Server\\<MSSQL\>\Reporting Services\ReportServer\bin.  

<a name="BKMK_TLS"></a> 
## Transport Layer Security (TLS) requirement
Web browsers and other client applications that use Transport Layer Security (TLS) versions earlier than TLS 1.2 won't be able to connect to their [!INCLUDE [pn-crm-online-shortest](../includes/pn-crm-online-shortest.md)] environments and the admin center. 

For more information, see these blog posts: 
- [Updates coming to connection security](https://blogs.msdn.microsoft.com/crm/2017/09/28/updates-coming-to-dynamics-365-customer-engagement-connection-security/)
- [TLS 1.2 support at Microsoft](https://blogs.microsoft.com/microsoftsecure/2017/06/20/tls-1-2-support-at-microsoft/)

### See also  
 [Supported web browsers and mobile devices](../admin/supported-web-browsers-and-mobile-devices.md)   

