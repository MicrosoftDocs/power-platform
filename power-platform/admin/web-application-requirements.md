---
title: "Web application requirements  | MicrosoftDocs"
description: Web application requirements
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/06/2021
ms.subservice: admin
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

This section lists the hardware and software requirements for model-driven apps and mobile device client applications.  

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

- Bandwidth greater than 50 KBps (400 kbps)  
- Latency under 150 ms  

Notice that these values are recommendations and don’t guarantee satisfactory performance. The recommended values are based on systems using out-of-the box forms that aren’t customized. If you significantly customize the out-of-box forms, we recommend that you test the form response to understand bandwidth needs. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Verify network capacity and throughput for clients](verify-network-capacity-throughput-clients.md)  

## Supported web browsers  

The web application can run in any of the following web browsers running on the specified operating systems:  

- Microsoft Edge (latest publicly-released version) running on Windows 10, Window 8.1, Windows 8, Windows 7 

- Mozilla Firefox (latest publicly-released version) running on Windows 10, Windows 8.1, Windows 8, or Windows 7  

- [!INCLUDE[tn_Google_Chrome](../includes/tn-google-chrome.md)]
  - [!INCLUDE[tn_Google_Chrome](../includes/tn-google-chrome.md)] (latest publicly-released version) running on Windows 10, Windows 8.1, Windows 8, Windows 7
  - Google Chrome (latest publicly-released version) running on the two latest publicly-release Mac OS versions 

- [!INCLUDE[tn_Apple_Safari](../includes/tn-apple-safari.md)] (latest publicly-released version) running on the two latest publicly-release Mac OS versions, or [Apple iPad](/dynamics365/mobile-app/support-phones-tablets)  

To find the latest release for these web browsers, visit the software manufacturer’s website.  

> [!IMPORTANT]
> - Using plug-ins or other third-party extensions in your browser can increase load times on pages with lists of data.  
> - Mozilla Firefox ESR (Extended Support Release) versions aren’t supported.  

## Support for Microsoft Internet Explorer and Microsoft Edge Legacy 

Internet Explorer and Microsoft Edge Legacy support has ended.  We recommend that you switch to Microsoft Edge (based on Chromium). See [Support end for Internet Explorer](support-end-internet-explorer.md) for more details on the support ending for Internet Explorer and Microsoft Edge Legacy with model-driven apps. 

## Support for older browser versions

Starting with 2021 Wave 2, users on older browser versions will see the following warning message.  This will be updated with each release to ensure user performance and allow the product to take advantage of newest browser capabilities for a better experience. 

:::image type="content" source="media/run-modern-browser-error.png" alt-text="Run modern browser error message.":::

You can avoid this by moving to a newer version browser: 

- Microsoft Edge (based on Chromium) version 83 or greater 
- Chrome version 83 or greater 
- Firefox version 76 or greater 

## Supported versions of Office  
To use model-driven apps and customer engagement apps (such as Dynamics 365 Sales and Customer Service) with [!INCLUDE[pn_MS_Office](../includes/pn-ms-office.md)] integration features, such as Export to Excel and Mail Merge, you must have one of the following [!INCLUDE[pn_MS_Office](../includes/pn-ms-office.md)] versions on the computer that is running the web application:  

- Microsoft 365
- Office 2016
- Office 2013
- Office 2010

[!INCLUDE[cc_Office365PlanRequirement](../includes/cc-office365planrequirement.md)]

## Printing reports  
The Reporting Services[!INCLUDE[pn_ms_ActiveX_long](../includes/pn-ms-activex-long.md)] control is required to print reports. If you try to print a report and the control isn’t installed, you’ll be prompted to install it. The installer package is named RSClientPrint.cab and can found on the [!INCLUDE[pn_SQL_Server_Reporting](../includes/pn-sql-server-reporting.md)] server at \<drive>:\Program files\Microsoft SQL Server\\<MSSQL\>\Reporting Services\ReportServer\bin.  

## Transport Layer Security (TLS) requirement
Web browsers and other client applications that use Transport Layer Security (TLS) versions earlier than TLS 1.2 won't be able to connect to their [!INCLUDE [pn-crm-online-shortest](../includes/pn-crm-online-shortest.md)] environments and the admin center. 

For more information, see this blog post: [TLS 1.2 support at Microsoft](https://blogs.microsoft.com/microsoftsecure/2017/06/20/tls-1-2-support-at-microsoft/)

### See also  
 [Supported web browsers and mobile devices](../admin/supported-web-browsers-and-mobile-devices.md)   



[!INCLUDE[footer-include](../includes/footer-banner.md)]