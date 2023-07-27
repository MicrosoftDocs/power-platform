---
title: Setting up Application Insights with cloud flow telemetry
description: Description here.
services: powerapps
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/27/2023
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
- rakrish
---

# Setting up Application Insights with cloud flow telemetry

You can learn more about the different Azure Application Insights features and how they could be leveraged to monitor your telemetry in [Application Insights Overview dashboard](/azure/azure-monitor/app/overview-dashboard).

Power Automate telemetry flows into two tables on Application Insights. All the downstream alerting and monitoring capabilities in Power Automate data are in these two tables in Application Insights.

- The **Requests** table contains *cloud flow runs*.
- The **Dependencies** table contains *cloud flow triggers* and*cloud flow actions*.

This section focuses on how the existing features within Application Insights could be leveraged to create monitoring and alerting capabilities for your automations.

Select the Application Insights instance from the Azure portal homepage.

It is recommended that you bookmark the selected Application Insights link.

## Monitor cloud flow executions

1.  Select **Metrics** from the navigation pane.
1.  Select **Server requests** from the **Metric** filter. Adjust the time period filter in the top-right of the page, as needed.
1.  To filter cloud flow executions for a specific environment, select **Add filter**, and then select your environment ID from the **Property** field.
![A screenshot of a computer Description automatically generated with medium confidence](media/image2.jpeg)

3.  For further filtering cloud flow executions to a specific flow or a set of flows, you simply need to add more filters. You can click on **Add filter**, and then select **Operation name** from the property field and select the flow(s) you want to monitor.

![A screenshot of a computer Description automatically generated with medium confidence](media/image3.jpeg)

These Operation Name field maps to the flow identifier you see from the Power Automate portal. If you need to find the flow id of any cloud flow, select the cloud flow from the Power Automate portal and the highlighted part- alphanumeric part that follows the word *flows*.

![A picture containing text  screenshot  software  web page Description automatically generated](media/image4.jpeg)

4.  Similarly, you can continue adding more filters as depending on the scenario. For the most popular scenarios, you can pin those dashboards as favorites. You can also drill into specific error or alerting directly from this screen as well

![A screenshot of a computer Description automatically generated with medium confidence](media/image5.jpeg)

2. **Monitoring cloud flow triggers and actions**

<!-- -->

1.  Select **Metrics** from the left navigation and select **Dependency calls** from the **Metric** filter

![A screen shot of a computer Description automatically generated with medium confidence](media/image6.jpeg)

2.  Similar to cloud flow runs, you can filter for environment id to filter for specific environments

![A screen shot of a computer Description automatically generated with medium confidence](media/image7.jpeg)

3.  Click on **Add filter** and select **Signal Category** from the **Property** filter. Now select **Cloud flow triggers** or **Cloud flow actions** to filter for triggers and actions respectively

![A screen shot of a computer Description automatically generated with medium confidence](media/image8.jpeg)

4.  Click on **Add filter** and select **ResourceId** to select triggers and actions for specific flows. Within the dependencies table, the column ResourceId maps to the flowId

![A screenshot of a computer Description automatically generated with medium confidence](media/image9.jpeg)

5.  Click on **Add filter** and select **Operation Name** from the property filter to specify the names of specific actions or triggers if you want to further distill down. These are the same as the display names of triggers and actions of the cloud flow you would see in the Power Automate designer

![A screenshot of a computer Description automatically generated](media/image10.jpeg)

These dashboards can also be pinned as favorites for quick reference from the same screen.

3. **Creating alerts for cloud flow run failures**

AppInsights provides a set of robust out-of-the-box alerting capabilities that can be leveraged for getting on automation failures.

**Cloud flow runs** are mapped to Requests table, and hence fall into **Server Requests** signal name. Therefore, any alerts that refer to **Failed requests** directly map to cloud flow run error.

**Cloud flow triggers** and **cloud flow actions** are mapped to the **Dependency calls** signal name. Hence, any alerts that refer to **Dependency call failures** map to action or trigger errors.

To set up an alert for a cloud flow run failure, perform the following steps

1.  Select **Alerts** from the left navigation and click on **Create-&gt; Alert rule**

![A screenshot of a computer Description automatically generated with medium confidence](media/image11.jpeg)

2.  Select **Dependency calls** for alerting on triggers and actions. If you want to alert on only failures, select **Dependency call failures**.

Similarly, select **Server Requests** for cloud flow runs. If you want to alert only on run failures, select **Failed requests**

![A screenshot of a computer Description automatically generated](media/image12.jpeg)

3.  Select the threshold for monitoring errors and the frequency with which you want to check for errors.

![A screenshot of a computer Description automatically generated with medium confidence](media/image13.jpeg)

You can combine multiple conditions into a single alert by clicking on **Add condition** and repeating the previous step

4.  If an action group is not already created, create a specific action group. You can learn more about action groups [here](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/action-groups).

<img src="media/image14.jpg" style="width:5.15318in;height:2.56558in" alt="A screenshot of a computer Description automatically generated with low confidence" />

5.  Specify the notification type you want to configure for this alert

<img src="media/image15.jpg" style="width:4.85838in;height:1.76428in" alt="A screenshot of a computer Description automatically generated with medium confidence" />

6.  Specify the action you want to perform once this alert is fired. You can use a webhook to trigger a Power Automate flow to do more advanced notifications via Teams or Slack or other communication channels enabled by the connector ecosystem.

![A picture containing text  screenshot  software  computer icon Description automatically generated](media/image16.jpeg)

Review and finish creation of the action group

7.  Configure the severity of the alert and provide an appropriate name

<img src="media/image17.jpg" style="width:4.97306in;height:3.30528in" alt="A screenshot of a computer Description automatically generated with medium confidence" />

Review and finish setting up the alert

4. **Creating a custom alert**

Out of the box alerts help you track errors at the Appinsights instance level. But if you want to restrict the alerting for a specific environment or a specific set of flows or even a specific set of actions, you can easily do that.

In step **ii** of the above alert creation wizard, click on **Custom log search**

![A screenshot of a computer Description automatically generated with medium confidence](media/image18.jpeg)

From the next screen, provide any custom query you want to search on.

Here are some of the sample queries you can leverage.

1. **Filtering for a specific cloud flow's failures**. (replace the bolded values with your specific values)

let myEnvironmentId = **'9bfb7347-1726-4575-9bb3-e4e7158f1b4d**';

let myFlowId = **'2175bb6c-d8f8-404a-b020-191496ad941a**';

requests

\| where timestamp &gt; ago(**1d**)

\| where customDimensions \['resourceProvider'\] == 'Cloud Flow'

\| where customDimensions \['signalCategory'\] == 'Cloud flow runs'

\| where customDimensions \['environmentId'\] == myEnvironmentId

\| where customDimensions \['resourceId'\] == myFlowId

\| where success == false

2. **Filtering for a specific cloud trigger's failures**. (replace the bolded values with your specific values)

let myEnvironmentId = **'9bfb7347-1726-4575-9bb3-e4e7158f1b4d**';

let myTriggerName = **'When\_a\_new\_channel\_message\_is\_added**';

dependencies

\| where timestamp &gt; ago(**1d**)

\| where customDimensions\['resourceProvider'\] == 'Cloud Flow'

\| where customDimensions\['signalCategory'\] == 'Cloud flow triggers'

\| where customDimensions\['environmentId'\] == myEnvironmentId

\| where name == myTriggerName

\| where success == false

3. **Filtering for a specific cloud action's failures**. (replace the bolded values with your specific values)

let myEnvironmentId = **'9bfb7347-1726-4575-9bb3-e4e7158f1b4d**';

let myActionName = **'Delete\_a\_row'**;

dependencies

\| where timestamp &gt; ago(**1d**)

\| where customDimensions\['resourceProvider'\] == 'Cloud Flow'

\| where customDimensions\['signalCategory'\] == 'Cloud flow actions'

\| where customDimensions\['environmentId'\] == myEnvironmentId

\| where name == myActionName

\| where success == false

As described in step iii from above, you can combine multiple such custom queries into a single alert per your requirements.

5. **Custom debugging of logs**

Since all the raw telemetry is now flowing into Application Insights, customers can leverage the Log Analytics in AppInsights to perform custom debugging or diagnostics per business needs.

**Cloud flow runs data** will be available on the **Requests** table

**Cloud flow triggers and actions** data will be available on the **Dependencies** table

![A screenshot of a computer Description automatically generated with medium confidence](media/image19.jpeg)

Within these tables, **Custom Dimensions** column contain most of the metadata required for detailed debugging of cloud flows, including environment id, flow id, action names etc

You can learn more about the log analytics capabilities offered by Azure Application Insights [here](https://microsoft-my.sharepoint.com/personal/rakrish_microsoft_com/Documents/Flow/Planning/You%20can%20learn%20more%20about%20the%20log%20analytics%20capabilities%20offered%20by%20Azure%20Application%20Insights%20here.).
