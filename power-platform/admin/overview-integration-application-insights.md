---
title: Overview of integration with Application Insights | Microsoft Docs
description: About integration with Application Insights
services: powerapps
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/08/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Overview of integration with Application Insights

Application Insights a part of the Azure monitoring eco-system, is widely used within the enterprise landscape for monitoring and diagnostics. Data from a specific org/environment that is already collected will be pushed to your own Application Insights instance. The data is stored in Log Analytics by Application Insights and visualized in Performance and Failures panels under the Investigate menu. The data is exported to your Application Insights instance in the standard schema defined by Application Insights. The support, developer and admin persona can leverage this feature to triage and resolve issues.

## What telemetry and which tables are being populated in the Application Insights? 

|Telemetry type  |Application Insights table name  |
|---------|---------|
|UCI page loads      | Page views        |
|UCI outbound network requests     | Dependency        |
|Dataverse API incoming calls     | Request        |
|Plugin executions     | Dependency        |
|SDK executions (Retrieve, RetrieveMultiple, FetchXml transformation, etc.)     | Dependency        |
|Exceptions during execution of plugin and SDK calls     | Exceptions        |

Application Insights has a wide range of features that will help you to leverage this data.

- Create a dashboard for a birds-eye view of the health of your org
- Proactive monitoring using Smart Detection.
- Setting up alerts for important scenarios based on your org.
- Visualize and track common navigation patterns from a usage perspective. This will help understand if a user always clicks on a specific tab first, before navigating back to the main tab and closing the form. It could for example indicate that a field should be positioned on the first tab, instead of another tab. This will save the user time every time they open this record.
- Custom queries to troubleshoot performance and errors by using the Logs panel under the Monitoring menu.

Example: List top 10 records for formloads in the pageviews table 
pageViews
```
take 100
```

## Overview panel in Application Insights

App insights provides different views. The Overview panel shows a summary of the key diagnostic metrics of your app and is a gateway to the other features of the portal. You can drill into metrics for more details. See sample below.

> [!div class="mx-imgBorder"] 
> ![Application Insights Overview panel](media/application-insights-overview.png "Application Insights Overview panel")

## Performance  panel in Application Insights

To open the Performance panel, either click the Server Response Time graph in the Overview panel or select Performance under the Investigate menu. Application Insights allows you to view data for both, server side and browser. By identifying those operations with the longest duration, you can diagnose potential problems.

The Performance panel shows the count and average duration of each operation for the application. You can use this information to identify those operations that most impact users

Under the server section, the most frequently called API's and what the latency looks like are listed. 

> [!div class="mx-imgBorder"] 
> ![Application Insights Performance panel](media/application-insights-performance.png "Application Insights Performance panel")

Calls with higher number of calls and higher duration are potential items for investigation. In the above example, the POST /XRMServices/2011/Organization.svc/web has a high number of calls and a high duration.  Similarly, the GET /api/data/v9.0/accounts has a relatively higher duration. 

Selecting one of the operations will also show you details on top 3 dependencies and time taken. You could see more details by selecting the Dependencies tab. 

If you toggle to the Browser view, you will see data on which pages are being hit most frequently in the environment and what the latency for each of these. You will see metrics including session counts and the dependencies associated with the different operations. For example, clicking on the Accounts operation will provide requests made to the account entity.

> [!div class="mx-imgBorder"] 
> ![Application Insights Performance panel for account](media/application-insights-performance-account.png "Application Insights Performance panel for account")

You could drill into a specific sample to see where time is spent on the particular operation. 

> [!div class="mx-imgBorder"] 
> ![Application Insights Performance transaction details](media/application-insights-performance-transaction-details.png "Application Insights Performance transaction details")

Reference to Application Insights documentation for performance issues

## Failures panel in Application Insights

To open the Failures panel either select Failures under the Investigate menu or click the Failed requests graph.

> [!div class="mx-imgBorder"] 
> ![Application Insights failures](media/application-insights-failures.png "Application Insights failures")

The exceptions table in Application Insights powers the Failure panel. It shows the count of failed requests and the number of users affected for each operation for the application. You can see error details for the operations, dependencies, on the errors for both server and browser.  Failures related to CRUD specific http methods (GET, POST, PUT, DELETE) used in the API operations are available here. This can be used to identify those failures that most impact users. For example, you can see below that the GET/api/data/v9.0/GetClientMetaData operation has a high number of failures and users. Selecting this operation shows further information about this operation in the right panel.  

> [!div class="mx-imgBorder"] 
> ![Application Insights failure dependencies](media/application-insights-failures-dependencies.png "Application Insights failure dependencies")

You can also see the failures related to the dependencies including summary view of the common response codes mapped to failures.

> [!div class="mx-imgBorder"] 
> ![Application Insights failures details](media/application-insights-failures-details.png "Application Insights failures details")

You can drill into the details of the step where the bottleneck occurred.

> [!div class="mx-imgBorder"] 
> ![Application Insights logs query](media/application-insights-logs-query.png "Application Insights log query")

Reference to using Application Insights to find application run-time exceptions.

## Querying the data in Application Insights?  

In Application Insights, go to the the Logs panel under Monitoring menu.

> [!div class="mx-imgBorder"] 
> ![Application Insights logs query](media/application-insights-logs-query.png "Application Insights log query")

**Common Fields**: All the tables populated in Application insights have these common fields.

- **cloud_RoleInstance**: For events emitted as a part of this effort, this field will be set to “CDS Data Export” to ensure they can be identified vs other events in the same Application Insights instance.
- **operation_Id**: This links together all the operations in a single interaction. One way to get all related events to a failing event 
union requests, dependencies, pageViews
|where operation_Id == “<insert id here>”
- **session_Id**  : This uniquely identifies all activities in a single user session. The session value is reset when a user opens a new tab, hits F5/refresh, closes and reopens the mobile app.
- **user_Id, user_AuthenticatedId**: These are both currently set to the Azure Active Directory id of the user. 
- **client_IP**: This field is always populated to 0.0.0.0 by Application Insights for GDPR compliance. The IP address provided is used to populate the client_City, client_StateOrProvince, client_CountryOrRegion fields.
- **client_Type**: The value here is “Browser” if the logs are coming from UCI and its “Server” if logs are coming from Dataverse. Note that the userAgent can be found in the ‘requests’ table under customDimensions when available.

Since the Application Insights schema is fixed, and this feature pushed data into Application Insights as an export process, the customDimensions fields in Application Insights is used to add properties. 




