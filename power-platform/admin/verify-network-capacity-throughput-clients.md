---
title: "Verify network capacity and throughput for clients  | MicrosoftDocs"
description: Verify network capacity and throughput for clients
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
# Verify network capacity and throughput for clients

The primary characteristics of a network that affect the performance of customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), or [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)], are *bandwidth* and *latency*.  
  
-   Bandwidth is the width or capacity of a specific communications channel.  
  
-   Latency is the time required for a signal to travel from one point on a network to another, and is a fixed cost between two points.  
  
One of the main causes of poor performance of customer engagement apps is the latency of the network over which the clients connect to the organization. Lower latencies (measured in milliseconds) generally provide better levels of performance.  
  
Notice that, even if the latency of a network connection is low, bandwidth can become a performance degradation factor if there are many resources sharing the network connection, for example, to download large files or send and receive email.  
  
Networks with high bandwidth don't guarantee low latency. For example, a network path traversing a satellite link often has high latency, even though throughput is very high. It's common for a network round trip traversing a satellite link to have five or more seconds of latency. An application designed to send a request, wait for a reply, send another request, wait for another reply, and so on, will wait at least five seconds for each packet exchange, regardless of the speed of the server.  
  
## How to check latency  
 Customer engagement apps includes a basic diagnostic tool that analyzes the client-to-organization connectivity and produces a report. To run the Diagnostics tool, follow these steps.  
  
1. On the user's computer or device, start a web browser, and sign in to an organization.  
  
2. Enter the following URL, *<https://myorg.crm.dynamics.com/tools/diagnostics/diag.aspx>*, where *myorg.crm.dynamics.com* is the URL of your organization.  
  
3. Click **Run**.  
  
The report displays a table with test and benchmark information. Of particular importance is the **Latency Test** row value. This value is an average of twenty individual test runs. Generally, the lower the number, the better the performance of the client. Although users may receive a satisfactory experience by using connections with more latency, for best application performance we recommend that the value be 150 ms (milliseconds) or less.  
  
## Best practices for improving application performance  
  
- Maximize how quickly your forms load. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Optimize form performance](https://docs.microsoft.com/powerapps/maker/model-driven-apps/optimize-form-performance)  
  
- Make sure you aren't using legacy form rendering, which can make forms take significantly longer to load. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [System Settings dialog box - General tab](system-settings-dialog-box-general-tab.md)  
  
### See also  
 [Performance tuning and optimization](../admin/performance-tuning-and-optimization.md)   
