---
title: "Common Data Service analytics   | MicrosoftDocs"
description: Common Data Service analytics 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/12/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Common Data Service analytics 

We've improved how you view metrics for your organization. You no longer need to install or update a solution. Instead, you can view Customer Data Service analytics right from the Power Platform Admin center to quickly view adoption ad user metrics for your organization. 

Admins with the following roles can view Customer Data Service analytics:
- Office 365 global admins
- Dynamics 365 service admins
- Power Platform service admins
- Environment admins

 **Key highlights**  

- **Deprecating the solution**: Organization Insights, available as a preferred solution from [AppSource](https://appsource.microsoft.com/product/dynamics-365/mscrm.04931187-431c-415d-8777-f7f482ba8095?tab=Overview), will no longer be supported or available for use in future releases.  

- **Deprecating Organization Insights dashboard**: This dashboard will be removed from Common Data Service in future releases. 

- **Monitor adoption and use**: Identify your most active users, the number and types of operations they’re performing, number of pages requests, most-used entities, workflows, plug-ins, and more, over a period of time as you work toward your adoption goals.  

- **Manage storage and performance**: Monitor storage quotas, storage use, and top tables by size to optimize performance.  

- **Troubleshoot effectively**: Drill down into the details of your top failing workflows and API calls to quickly diagnose and troubleshoot errors.

<a name="BKMK_InstallSolution"></a>   

## View Common Data Service analytics  
It's simple. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select **analytics** > **Common Data Service**.

<a name="BKMK_Home"></a>   

## Home (default)  
 ![Customer Data Service analytics Home Section](./media/organization-insights-home-section.png "Customer Data Service analytics Home Section")  

### About this dashboard  
 This is the default dashboard that provides information on the number of active Common Data Service users, storage usage, the most active workflows, and more.  

### What's included in this dashboard  

|Chart element |Description |
|-----------|------------|
|           Active Users            |                         Number of active users (unique users) who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`.                          |
|             API Calls             |                                            Number of API calls that were made by the Customer Data Service environment for the selected time period.                                            |
|            API Pass Rate             |                        This chart shows the API pass rate as percentage of total API calls that were made in the Customer Data Service environment over the specified time.                        |
|           Executions            |                                        This chart shows how many plug-ins have been executed in the Customer Data Service environment over the specified time.                                        |
|            Total Operations             |                         This chart shows how many operations (create, update, deletes, reads) have occurred in the Customer Data Service environment over the specified time.                         |
| Most Active Users Performing Operations | List of most active users who performed an operation that caused a `Create`, `Update`, `Read`, or `Delete` SDK call in the [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] environment over the selected time period. |
|        Top Plug-ins by Failures         |                                            This chart shows top 10 most failing plug-in in the Customer Data Service environment over the specified time.                                             |

<a name="BKMK_ActiveUsage"></a>   

## Active Users  
 ![Customer Data Service analytics Active Usage Section](./media/organization-insights-active-usage-section.png "Customer Data Service analytics Active Usage Section")  

### About this dashboard  
 Use this dashboard to find out how many [!INCLUDE[pn_dyn_365](../includes/pn-dyn-365.md)] users there are, how many licenses are in use, what custom entities are used most frequently, and more.  

### What's included in this dashboard  

|Chart element  | Description  |ChartID|
|----|-----|-----|
|             Total Active Users              |                            Total number of active users (unique users) who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`.                            | 4555801D-0EAF-4100-891C-DB34400AB102 |
|             Most Used  Entities             |                                                            Ten Entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`.                                                             | F6F2B9FD-FCA8-427A-9A0D-CAC619A3EE74 |
|             Total Page Requests             | The number of page load requests for forms, dashboards, and reports. This is the count of requests received by the [!INCLUDE[pn_dyn_365](../includes/pn-dyn-365.md)] server. Pages that are cached while browsing won't be counted. | D0401D82-6E7F-4B84-8D86-825D72C68EE6 |
|              Total Operations               |                         This chart shows how many operations (create, update, deletes, reads) have occurred in the Customer Data Service environment for the selected time period.                         | B13D7ED8-06BE-4B0E-B314-A16A84099F1E |
| Active Users Performing Specific Operations |                       Total number of active users (unique users) over time who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`.                       | 35699BD6-6E49-463D-9DC0-4E968750778F |
|                Active Users                 |                 Number of active users (unique users) in your environment who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update` over time.                  | 9725801D-0EAF-4100-891C-DB34400AB102 |
|   Most Active Users Performing Operations   |                        List of  most active users (unique users) over time who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`.                        | B173E5EC-195E-4803-B79A-2B1C2704BCB7 |
|          Most Used Custom Entities          |                                                       List of custom entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`.                                                       | 5FD1EF3F-64C4-429C-83BC-95F0AD44B761 |
|           Most Used OOB Entities            |                                                     List of out-of-box entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`.                                                     | 46A47AF1-325D-4A00-9F7E-6059D5AAB722 |
|          Usage Active Users by OS           |                                                                                           The number of active users by operating system.                                                                                           | F37D4DEC-28E2-438A-977F-DD3F96203559 |
|         Active Users by Device Type         |                                                                                             The number of active users by device type.                                                                                              | 43771A31-6350-489C-AABD-F7EBB93320C4 |
|           Active Users by Browser           |                                                                                               The number of active users by browser.                                                                                                | 1259D071-A06D-4B3F-8D32-DCD39670F6FD |
|       Active Users by Security Roles        |                                                                                            The number of active users by security roles.                                                                                            | 09062EF4-4195-4256-B84B-68E9CA3C737D |
|           Users by Business Unit            |                                                                                            The number of active users by business unit.                                                                                             | 8B701B71-092E-4FCF-A9E3-A005EE865921 |
|         Number of Creates by Entity         |                                    How many create operations are performed by the selected user in the Customer Data Service environment for the selected time period.                                    | 3AC63F0D-4661-4F19-9B31-DB5616187A88 |
|         Number of Updates by Entity         |                         How many update operations are performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                         | C215FC98-BF5D-4AAB-BB0A-24E9F2A4F939 |
|          Number of Reads by Entity          |                          How many read operations are performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                          | 3DE3E899-4BCF-482B-8896-657D0C8FCAE7 |
|         Number of Deletes by Entity         |                         How many delete operations are performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                         | 8F92215B-C55D-451F-A546-48E1456E7056 |
|         Total Operations Over Time          |                                        The total operations performed by the selected user in the Customer Data Service environment over the selected time period.                                         | 9AD78421-6D33-4463-8C17-B9C4DF52592D |
|         Total Operations by Entity          |                              The total operations performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                              | 045F5B81-CF47-4819-A4F9-AE366565C591 |
|          Active Users by Entities           |                                                                            Show the active users distributed over different entities (refreshed hourly)                                                                             | 2C569F70-7FA8-4C2E-AFCE-E6126ED2CC52 |
|           Active Users by Client            |                                                                                   The active users distributed by client type (refreshed hourly)                                                                                    | 4D6F71A8-1710-4B0B-9D7A-9590BECE611C |
|   Active Users Using More than One Client   |                                                      The number of active users using more than one client, distributed over different client combinations (refreshed hourly)                                                       | 149EFCC8-D336-4F51-A293-E173728EC587 |

> [!NOTE]
> **Retrieve** and **RetrieveMultiple** SDK calls are reported as **Reads**.  

### Update frequency  
 Active usage chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|Total Active Users|1 hour|  
|Most Used Entities|1 hour|  
|Most Active Users (Reads)|1 hour|  
|Total API Calls|1 hour|  
|Total Page Requests|1 hour|  
|Most Active Users (Changes)|1 hour|  
|Total Operations|1 hour|  
|Active Users Performing Specific Operations|1 hour|  
|Active Users|1 hour|  
|Most Active Users Performing Operations|1 hour|  
|Most Used Custom Entities|1 hour|  
|Most Used OOB Entities|1 hour|  

<!--
## Users - Mode of Access
 ![Customer Data Service analytics Active Usage Section](./media/organization-insights-users-access-mode.png "Customer Data Service analytics Active Usage Section")  

### About this dashboard  
[JimHoltz: this is a cut and paste of Active Users section and needs review.]

Use this dashboard to find out how many [!INCLUDE[pn_dyn_365](../includes/pn-dyn-365.md)] users there are, how many licenses are in use, what custom entities are used most frequently, and more.  

### What's included in this dashboard  

|Chart element  | Description  |ChartID|
|----|-----|-----|
|             Total Active Users              |                            Total number of active users (unique users) who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`.                            | 4555801D-0EAF-4100-891C-DB34400AB102 |
|             Most Used  Entities             |                                                            Ten Entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`.                                                             | F6F2B9FD-FCA8-427A-9A0D-CAC619A3EE74 |
|             Total Page Requests             | The number of page load requests for forms, dashboards, and reports. This is the count of requests received by the [!INCLUDE[pn_dyn_365](../includes/pn-dyn-365.md)] server. Pages that are cached while browsing won't be counted. | D0401D82-6E7F-4B84-8D86-825D72C68EE6 |
|              Total Operations               |                         This chart shows how many operations (create, update, deletes, reads) have occurred in the Customer Data Service environment for the selected time period.                         | B13D7ED8-06BE-4B0E-B314-A16A84099F1E |
| Active Users Performing Specific Operations |                       Total number of active users (unique users) over time who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`.                       | 35699BD6-6E49-463D-9DC0-4E968750778F |
|                Active Users                 |                 Number of active users (unique users) in your environment who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update` over time.                  | 9725801D-0EAF-4100-891C-DB34400AB102 |
|   Most Active Users Performing Operations   |                        List of  most active users (unique users) over time who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`.                        | B173E5EC-195E-4803-B79A-2B1C2704BCB7 |
|          Most Used Custom Entities          |                                                       List of custom entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`.                                                       | 5FD1EF3F-64C4-429C-83BC-95F0AD44B761 |
|           Most Used OOB Entities            |                                                     List of out-of-box entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`.                                                     | 46A47AF1-325D-4A00-9F7E-6059D5AAB722 |
|          Usage Active Users by OS           |                                                                                           The number of active users by operating system.                                                                                           | F37D4DEC-28E2-438A-977F-DD3F96203559 |
|         Active Users by Device Type         |                                                                                             The number of active users by device type.                                                                                              | 43771A31-6350-489C-AABD-F7EBB93320C4 |
|           Active Users by Browser           |                                                                                               The number of active users by browser.                                                                                                | 1259D071-A06D-4B3F-8D32-DCD39670F6FD |
|       Active Users by Security Roles        |                                                                                            The number of active users by security roles.                                                                                            | 09062EF4-4195-4256-B84B-68E9CA3C737D |
|           Users by Business Unit            |                                                                                            The number of active users by business unit.                                                                                             | 8B701B71-092E-4FCF-A9E3-A005EE865921 |
|         Number of Creates by Entity         |                                    How many create operations are performed by the selected user in the Customer Data Service environment for the selected time period.                                    | 3AC63F0D-4661-4F19-9B31-DB5616187A88 |
|         Number of Updates by Entity         |                         How many update operations are performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                         | C215FC98-BF5D-4AAB-BB0A-24E9F2A4F939 |
|          Number of Reads by Entity          |                          How many read operations are performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                          | 3DE3E899-4BCF-482B-8896-657D0C8FCAE7 |
|         Number of Deletes by Entity         |                         How many delete operations are performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                         | 8F92215B-C55D-451F-A546-48E1456E7056 |
|         Total Operations Over Time          |                                        The total operations performed by the selected user in the Customer Data Service environment over the selected time period.                                         | 9AD78421-6D33-4463-8C17-B9C4DF52592D |
|         Total Operations by Entity          |                              The total operations performed on different entities by the selected user in the Customer Data Service environment for the selected time period.                              | 045F5B81-CF47-4819-A4F9-AE366565C591 |
|          Active Users by Entities           |                                                                            Show the active users distributed over different entities (refreshed hourly)                                                                             | 2C569F70-7FA8-4C2E-AFCE-E6126ED2CC52 |
|           Active Users by Client            |                                                                                   The active users distributed by client type (refreshed hourly)                                                                                    | 4D6F71A8-1710-4B0B-9D7A-9590BECE611C |
|   Active Users Using More than One Client   |                                                      The number of active users using more than one client, distributed over different client combinations (refreshed hourly)                                                       | 149EFCC8-D336-4F51-A293-E173728EC587 |

> [!NOTE]
> **Retrieve** and **RetrieveMultiple** SDK calls are reported as **Reads**.  

### Update frequency  
 Active usage chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|Total Active Users|1 hour|  
|Most Used Entities|1 hour|  
|Most Active Users (Reads)|1 hour|  
|Total API Calls|1 hour|  
|Total Page Requests|1 hour|  
|Most Active Users (Changes)|1 hour|  
|Total Operations|1 hour|  
|Active Users Performing Specific Operations|1 hour|  
|Active Users|1 hour|  
|Most Active Users Performing Operations|1 hour|  
|Most Used Custom Entities|1 hour|  
|Most Used OOB Entities|1 hour|  
-->
<!--
## Content Usage
 ![Customer Data Service analytics Active Usage Section](./media/organization-insights-content-usage.png "Customer Data Service analytics Active Usage Section")  

### About this dashboard  
[JimHoltz: this is a cut and paste of Active Users section and needs review.]

Use this dashboard to find out how many [!INCLUDE[pn_dyn_365](../includes/pn-dyn-365.md)] users there are, how many licenses are in use, what custom entities are used most frequently, and more.  

### What's included in this dashboard  

|Chart element  | Description  |ChartID|
|----|-----|-----|
| [need info]    | [need info]  | [need info] |

> [!NOTE]
> **Retrieve** and **RetrieveMultiple** SDK calls are reported as **Reads**.  

### Update frequency  
 Active usage chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|Total Active Users|1 hour|  
|Most Used Entities|1 hour|  
|Most Active Users (Reads)|1 hour|  
|Total API Calls|1 hour|  
|Total Page Requests|1 hour|  
|Most Active Users (Changes)|1 hour|  
|Total Operations|1 hour|  
|Active Users Performing Specific Operations|1 hour|  
|Active Users|1 hour|  
|Most Active Users Performing Operations|1 hour|  
|Most Used Custom Entities|1 hour|  
|Most Used OOB Entities|1 hour|  
-->

<a name="BKMK_SystemJobs"></a>   

## System Jobs  
 ![Customer Data Service analytics System Jobs Section](./media/organization-insights-system-jobs-section.png "Customer Data Service analytics System Jobs Section")  

### About this dashboard  
 Use this dashboard to monitor and troubleshoot workflows.  

### What's included in this dashboard  

|Chart element  | Description  |ChartID|
|----|-----|-----|
|      Workflow Executions      |                                 This chart shows how many workflows have been executed in the Customer Data Service environment over the specified time.                                  | 3555801D-0EAF-4100-891C-DB34400AB102 |
|     System Jobs Pass Rate     |               This chart shows the system job’s pass rate as percentage of system jobs that were executed in the Customer Data Service environment over the specified time.               | 1355801D-0EAF-4100-891C-DB34400AB102 |
| System Jobs Throughput/Minute |                        This chart shows the average system jobs that have been executed per hour in the Customer Data Service environment over the specified time.                        | 090F51C1-7DBA-42BA-B031-FB1C0999EE28 |
|    Executions and Backlog     |                        This chart shows the number of executions and the backlog for system jobs in the Customer Data Service environment over the specified time.                        | 9D941442-759D-4C29-8348-ADCA2810A602 |
|     Most Active Workflows     |                                     This chart shows top 10 most executed workflows in the Customer Data Service environment over the specified time.                                     | 7128FF54-B377-4236-ACFF-EEDF696461AA |
|   Top Workflows by Failures   | This chart shows top 10 most failing workflows in the Customer Data Service environment over the specified time. Click on a workflow to see the failures and their number of occurrences. | 7A7C0FEE-A7BB-4C14-AF2A-76AC00350F82 |

### Update frequency  
 System jobs chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|Workflow Executions|1 hour|  
|System Jobs Pass Rate|1 hour|  
|System Jobs Throughput / Hour|1 hour|  
|Most Active Workflows|1 hour|  
|System Jobs Executions and Backlog|1 hour|  
|Top Workflows by Failures|1 hour|  

<a name="BKMK_Plugins"></a>   

## Plug-ins  
 ![Customer Data Service analytics Plugins Section](./media/organization-insights-plugins-section.png "Customer Data Service analytics Plugins Section")  

### About this dashboard  
 Use this dashboard to monitor and troubleshoot plug-ins.  

### What's included in this dashboard  

|Chart element  | Description  |ChartID|
|----|-----|-----|
|      Plug-in Success Rate      | This chart shows the plug-in pass rate as percentage of total plug-in executions that were executed in the Customer Data Service environment over the specified time. | 190F51C1-7DBA-42BA-B031-FB1C0999EE28 |
|       Plug-in Executions       |                        This chart shows how many plug-ins have been executed in the Customer Data Service environment over the specified time.                        | D48FF5C9-BFC9-4E1C-9215-E76FDBFF282E |
| Average Plug-in Execution Time |                This chart shows average time taken to successfully execute a plug-in in the Customer Data Service environment over the specified time.                | A4094693-8638-44B5-83B1-B7EC8C8BFFF6 |
|      Most Active Plug-ins      |                           This chart shows top 10 most executed plug-ins in the Customer Data Service environment over the specified time.                            | E505BCFC-5B13-4190-842C-E47622BF0A40 |
|    Top Plug-ins by Failures    |                            This chart shows top 10 most failing plug-ins in the Customer Data Service environment over the specified time.                            | 1193CFAC-E8CF-48E9-9A22-A56AAFC1159C |

### Update frequency  
 Plug-ins chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|Plug-in Success Rate|1 hour|  
|Most Active Plug-ins|1 hour|  
|Plug-in Executions|1 hour|  
|Average Plug-in Execution Time|1 hour|  
|Top Plug-ins by Failures|1 hour|  

<a name="BKMK_APICallStats"></a>   

## API Call Statistics  
 ![Customer Data Service analytics API Call Statistics Section](./media/organization-insights-api-call-statistics-section.png "Customer Data Service analytics API Call Statistics Section")  

### About this dashboard  
 Use this dashboard to monitor and troubleshoot API calls.  

### What's included in this dashboard  

|Chart element  | Description  |ChartID|
|----|-----|-----|
|  API Success Rate   | This chart shows the API success rate as percentage of total API calls that were made in the Customer Data Service environment over the specified time. | 5555801D-0EAF-4100-891C-DB34400AB102 |
| Top API by Failures |                       This chart shows top 10 failing API calls in the Customer Data Service environment over the specified time.                       | CCB98704-6E3F-4302-AC96-0A4E286061FA |
|   Total API Calls   |              This chart shows how many API calls have been made in total in the Customer Data Service environment over the specified time.              | 9555801D-0EAF-4100-891C-DB34400AB102 |
|    Most Used API    |                           This chart shows top 10 most executed API calls in the Customer Data Service environment database.                            | C898F79D-D3D0-4894-B2E4-E94AC854007A |
|      API Calls      |             This chart shows how many API calls have been made over time in the Customer Data Service environment over the specified time.              | 4C7B6699-9C07-478C-9C17-AF0D17160734 |

### Update frequency  
 API Call Statistics chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|API Success Rate|1 hour|  
|Top API by Failures|1 hour|  
|Most Used API|1 hour|  
|Total API Calls|1 hour|  
|API Calls|1 hour|  

<a name="BKMK_MailboxUsage"></a>   

## Mailbox Usage  
 ![Customer Data Service analytics Mailbox Usage Section](./media/organization-insights-mailbox-usage-section.png "Customer Data Service analytics Mailbox Usage Section")  

### About this dashboard  

 Use this dashboard to monitor email mailbox usage.  

### What's included in this dashboard  

|Chart element  | Description  |ChartID|
|----|-----|-----|
|         Mailbox Details by GEO         | This chart shows mailbox details like:<br /><br /> -   the number of server-side synch configured mailboxes<br />-   the number of server-side synch enabled mailboxes<br />-   the number of server-side synch Appointments, Contacts, and Tasks enabled mailboxes<br />-   the number of server-side synch incoming enabled mailboxes<br />-   the number of server-side synch outgoing enabled mailboxes categorized by the geo location the mailbox is hosted in | F90E2120-58B6-4D8B-B913-ADABE7EA4833 |
|        Mailboxes by Server Type        |                                                                                                                                                                                                      This chart shows the mailbox distribution by server type.                                                                                                                                                                                                       | AFBB2C1B-6405-4D6C-8D21-D808F796405A |
|  Active Email Server Profiles by Geo   |                                                                                                                                                                          This chart shows active server-side synch enabled mailboxes distributed over the geo location they are hosted in.                                                                                                                                                                           | AE33B341-752B-4AC3-98F7-FC11EA8B5DE5 |
|  Mailboxes by Exchange Configuration   |                                                                                                                                                                   This chart shows the number of mailboxes categorized by their [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] configuration.                                                                                                                                                                   | 1AF79B4C-0F75-403B-973A-573E0FDF775E |
| Number of Mailbox Configuration Errors |                                                                                                                                                                           This chart shows the number of mailboxes configuration errors which occurred over the user-selected time frame.                                                                                                                                                                            | DDFE9E31-41D9-4453-87EE-87A5C6D124F6 |
|             Mailbox Usage              |                                                                                                                                                                                 This chart shows the number of server-side synch mailboxes over the time range selected by the user.                                                                                                                                                                                 | 9E5E51CE-9C47-40E4-9862-B8D17D58E0EC |
|      Number of Outlook Mailboxes       |                                                                                                                                                               This chart shows the number of [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] mailboxes configured for the organization.                                                                                                                                                                | BE94BA93-637E-4DEA-B8C6-50DFE57846B6 |
| Number of Active Email Server Profiles |                                                                                                                                                                                This chart shows the number of active email server profiles for the time range configured by the user.                                                                                                                                                                                | 522D6D36-FDFE-4CF4-9086-93BAA8628425 |

### Update frequency  
 Mailbox Usage chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|Mailbox Details by Geo|30 minutes average|  
|Active Email Server Profiles by Geo|5 minutes average|  
|Mailboxes by Server Type|5 minutes average|  
|Mailbox Usage|5 minutes average|  
|Number of Mailbox Configuration Errors|30 minutes average|  
|Number of Active Email Server Profiles|5 minutes average|  
|Number of Outlook Mailboxes|15 minutes average|  
|Mailboxes by Exchange Configuration|5 minutes average|  

<a name="BKMK_Storage"></a>   

## Storage  
For storage information, see [Common Data Service storage capacity](capacity-storage.md).

## Download  
 ![Customer Data Service analytics Download Section](./media/organization-insights-download-section.png "Customer Data Service analytics Download Section")  

### About this command  
 Use this command to download the data selected for the date range selected as an Excel spreadsheet.  

### What's included  

|Download | Description  |
|----|-----|
| Active users by device type  | List of active users by device type used to access [!INCLUDE [pn-dyn-365](../includes/pn-dyn-365.md)] (refreshed hourly)  |
| Active users by business unit  | List of active users by their business unit (refreshed hourly)   |
| Active users by security role  | List of active users by their security roles (refreshed hourly)  |
| Active users by client  | List of active users, by client type used to access [!INCLUDE [pn-dyn-365](../includes/pn-dyn-365.md)] (refreshed hourly) |
| Active users by entities | List of active users distributed by entity (refreshed hourly)   |
| Most active users performing operations | List of  most active users (unique users) over time who performed an operation that caused one of these SDK calls: `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update`. |
| Most used custom entities |  List of custom entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`. |
| Most used OOB entities  |  List of out-of-box entities which had the most `Retrieve`, `Retrieve Multiple`, `Delete`, `Create`, and `Update SDK Calls`. |
| Most active workflows | List of top 10 most executed workflows in the Customer Data Service environment over the specified time.   |
| Most active plug-ins | List of top 10 most executed plug-ins in the Customer Data Service environment over the specified time.  |
| Most used API  | List of top 10 most executed API calls in the Customer Data Service environment database.   |
| Active D365 Plan Users by Application | List of workload usage by users with D365 Plan (aka bundle) licenses for the past 30 days. Users with standalone app licenses do not show up in this report.    |


### Update frequency  
 Download chart data is updated as follows.  

|Chart|Update frequency|  
|-----------|----------------------|  
|Most Active Users Performing Operations|1 hour|  
|Most Used Custom Entities|1 hour|  
|Most Used OOB Entities|1 hour|  

<a name="BKMK_ViewData"></a>   

## View data for different time ranges  
 You can adjust the time range for the data presented in the dashboards charts. After selecting the From and To range, click the **Play** button (![Customer Data Service analytics Calendar Play button](./media/organization-insights-calendar-play-button.png "Customer Data Service analytics Calendar Play button")) to refresh your data.  

 ![Select the date range for your data](./media/organization-insights-calendar-control.png "Select the date range for your data")  

 Consider the following about the Customer Data Service analytics calendar:  

- The Calendar control is not available for the  Storage dashboard and not applicable to any storage related chart as only the latest information is shown for those charts.  

- Default time range is shown for the past 48 hours.  

- Data is only shown for the applied time range.  

- Data is available from the time of release of the solution in AppSource, and will be retained for 30 days.  

- Data is shown for time series at an hourly aggregation interval.  

- The data shown for a hourly aggregation interval represents the whole hour. For example, if the number of active users at 2:00 PM is 5, there were 5 active users between 1:00 and 2:00 PM.  

  ![Customer Data Service analytics active users chart](./media/organization-insights-active-users-chart.PNG "Customer Data Service analytics active users chart") 
