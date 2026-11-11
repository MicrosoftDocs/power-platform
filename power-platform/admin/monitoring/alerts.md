---
title: Create alerts for your resources
description: Learn more about how to create alerts to track and monitor the operational health of your resources in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 11/10/2026
author: arjunmayur
ms.author: arjunmayur
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---

# Create alerts for your resources

Tenant and environment admins in Power Platform use _alerts_ to track the operational health of their resources. Admins set up custom thresholds and get notifications when metrics for their resources pass specific thresholds. Create alerts on any metrics in the **Monitor** area of the Power Platform admin center.

Keep the following principles in mind:

-	Alerts are evaluated after new metrics are produced. By default, all metrics are 24-hour aggregates, which means an alert rule with a 24 hour **Data review period** in the **Monitor** area is evaluated every 24 hours after the newest 24-hour aggregates are produced. However, you can also create an alert rule with a 1 hour **Data review period**. This enables an hourly aggregation on the resource's metric the alert rule is configured with. Alert rules with a 24 hour **Data review period** do an on-demand evaluation upon their creation.
- Alert rules are alerts that admins create to monitor their resources. You can edit, delete, and turn an alert rule on or off. You can place alert rules on an environment and a specific resource.
- A _triggered alert_ occurs when one or more of the resources that an alert rule monitors pass specific thresholds that the admin defines when configuring the alert rule. You can select the triggered alert to learn what resources triggered the alert rule, and get recommendations for how to improve the resources if it's in a managed environment. 

## When to use alerts
- Teams and admins use alerts to find resources that are used more than expected. For example, an admin creates an alert to know if apps in the default environment exceed 50 launches a day.
- Teams use alerts to find resources with degraded health, and work with their makers to fix issues.
- For operations, admins create alerts to know if apps in their production environment are slow to open for users.

## Prerequisites
-	You must be a tenant administrator or an environment administrator to access alerts. 
-	You can only place alerts on a managed environment.
-	You must be using the [new and improved Power Platform admin center](/power-platform/admin/new-admin-center).

## Create an alert on an environment
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Monitor**.
1. In the **Monitor** pane, select **Alerts**. The **Alerts** page is displayed.

    > [!NOTE]
    > Manage your existing alert rules in the **Alert rules** tab. Use the **More user actions** icon to see options for editing or deleting your alert rule. Turn your alert rule on or off by using the toggle in the **Status** column.

1. Select **+ Alert rule** to create your new alert rule. The **New alert rule** pane is displayed.
1. In the **Alert rule name** field, enter the name of your alert.
1. In the **Product** list, select the product you want to monitor with the alert, **Power Apps**, **Power Automate**, or **Copilot Studio**.
1. In the **Product type** list, select what you're going to monitor with the alert. For example, select **Canvas app** or **Model-driven app** for Power Apps.
1. In the **Scope** list, select **Environment** to monitor all items of a specific type&mdash;such as all canvas apps in your production environment. Then, select the environment.
1. In the **Metric** list, select the metric that you want to create your custom threshold against. For more information about the available metrics, see [Metrics and recommendations for Power Apps](monitor-power-apps.md), [Metrics and recommendations for Power Automate](monitor-power-automate.md), and [Metrics and recommendations for Copilot Studio](monitor-copilot-studio.md).
1. In the **Operator** list, select an operator to define your threshold. The options are **Is Under**, **Is Over**, or **Equals**.
1. In the **Select value** list, use the arrow icons to increase or decrease the value.
1. In the **Severity** list, select **Low**, **Medium**, or **High**.
1. In the **Notification type** list, select which notification type you'd like this alert to have.
   
    - If you select **None**, you don't get an email and need to return to the **Monitor** area of the admin center to check on the status of your alert.
    - If you select **Email**, you and up to four other recipients&mdash;that you specify in the **Recipient(s)** field&mdash;get an email when the alert is triggered. The email comes from `PowerPlat-noreply@microsoft.com`.
      
1. Select **Save**.

## Create an alert on a resource
You can create an alert to monitor a specific resource, such as a specific canvas app, by using the following steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Monitor**.
1. In the **Monitor** pane, select the product where your resource is located. For example, if you select **Power Apps**, you see a list of canvas apps for which you can create alerts.
1. Find your resource, and select it to open a resource pane, which has more detailed metric information.
1. In the upper-right corner of the pane, you see a link labeled **+ New alert rule** if the resource is in a managed environment.
   
    :::image type="content" source="media/new-resource-alert.png" alt-text="Select the '+ New Alert Rule' link." lightbox="media/new-resource-alert.png":::
   
1. Select the **+ New alert rule** link to create an alert. The admin center autofills the information for **Product**, **Product type**, **Scope**, **Environment**, and **Resource** so you can create an alert on that specific resource.
1. Provide the **Alert rule name**, **Metric**, **Operator**, **Threshold Value**, **Severity**, and **Notification type** as documented in [Create an alert on an environment](#create-an-alert-on-an-environment).
1. For resource-scoped alerts, you can configure a **Data review period**, which specifies how far back the alert evaluates data. The options for the data review period are:
    - **24 hours**: The alert looks at data from the last 24 hours.
    - **1 hour**: The alert looks at data from the last hour and enables hourly aggregation for the metric.
   
   In the resource panel of the item, you can view charts for both 24-hour and 1-hour aggregations on an item's metric if an alert was configured with the 1-hour data review period on that metric for that app. For example, if you configured an alert with a 1-hour data review period on an app's **Time to Interactive** metric, you could see 24-hour and 1-hour aggregations on the chart for the **Time to Interactive** metric for that app. Use the **Review period** list above the chart to switch between views.
   
   > [!NOTE]
   > Currently, the **Data review period** is in preview and is only available for code apps.
   
1. Select **Save**.

After you create your alert, the system runs an on-demand evaluation and scans all the applicable resources under its scope.

## Monitor critical resources with low-latency alerts (preview)

Use low-latency alerts to evaluate supported resource metrics every hour instead of waiting for the daily evaluation. These alerts can help you detect issues sooner on mission-critical applications and other resources.

For example, you can create a low-latency alert for a production cloud flow to check whether its **Success rate** falls below 95%. The rule evaluates each hour after new hourly metrics are produced and can fire when the condition is met.

### How low-latency alerts work

By default, Monitor metrics refresh every 24 hours, and alerts evaluate those metrics after the new 24-hour aggregates are produced. When you create a low-latency alert with **Data review period** set to **1 Hour**, Monitor enables hourly aggregation for the selected metric on the selected resource. The rule evaluates after new hourly metrics are produced and can fire each hour if its condition is met.

Hourly aggregation applies only to that resource and metric. It doesn't enable hourly aggregation for every metric on the resource. The product list page and the metric summary on the left side of the resource pane continue to show 24-hour aggregates.

Hourly alert rules do not perform an on-demand evaluation when it's created since new hourly data isn't available.

> [!NOTE]
> Low-latency alerts use an hourly refresh and evaluation schedule. They aren't real-time alerts.

### Requirements and limits

- Meet the existing [alert prerequisites](#prerequisites), including the admin permissions and managed environment requirements for custom alerts.
- Use **Resource** scope. Low-latency alerts aren't available for environment-scoped rules.
- Select a supported product and metric. Supported metrics have a symbol next to them in the **Metric** selector.
- Each tenant can configure up to 10 low-latency alerts. Reserve these alerts for mission-critical applications and resources.
- You can configure only one low-latency alert per resource per metric. For example, you can't create two low-latency rules for the same app's **App open success rate**, even if their thresholds or severities differ.

### Supported products and metrics

| Product | Supported metrics |
| --- | --- |
| Canvas apps | Time to interactive, App open success rate, Data request success rate, Data request latency |
| Code apps | Time to interactive, App open success rate, Data request success rate, Data request latency |
| Model-driven apps | App open success rate |
| Cloud flows | Success rate |
| Agents | Agent session success rate |

### Create a low-latency alert

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Go to **Monitor**, select the relevant product, and select the resource to open its resource pane.
1. In the upper-right corner of the resource pane, select **+ New alert rule**. This option is available for resources in managed environments.
1. In the alert configuration panel, confirm the prepopulated **Product** and **Product type**. Ensure **Scope** is **Resource**, and verify that the correct **Environment** and **Resource** are selected.
1. Enter an **Alert rule name**. In **Metric**, select a supported metric, identified by the symbol next to it. Ensure a low-latency alert doesn't already exist for this resource and metric, and that the tenant hasn't reached the limit of 10 low-latency alerts.
1. In **Data review period**, select **1 Hour**.
1. Configure the **Operator** and threshold for the alert condition, choose the **Severity**, and select the **Notification type**. For details about these settings, see [Create an alert on a resource](#create-an-alert-on-a-resource).
1. Select **Save**.

Creating the alert enables hourly aggregation for the selected metric on the selected resource. Other metrics on the resource continue to use their existing aggregation settings.

### View hourly metrics and triggered alerts

After you create a low-latency alert, use the resource's chart to view hourly data for the metric you selected:

1. In **Monitor**, open the relevant product and select the resource.
1. In the resource pane, select the metric or chart associated with the low-latency alert.
1. Set **Review period** to **1 hour** to view the metric's hourly time series. The only available chart time range for this review period is **24 hours**.
1. If the low-latency alert fired within the selected time range, a banner appears and indicates that it fired during the time range selected above the timeseries.

The alert's **Data review period** controls the data aggregation and scheduled evaluation cadence for the rule. The chart's **Review period** controls the aggregation shown in the chart. The chart time range controls how much history is displayed: for a **1 hour** review period, the chart displays **24 hours** of history.

The product list page and the metric summary on the left side of the resource pane still show 24-hour aggregates, even when you're viewing an hourly chart.

> [!NOTE]
> A banner that indicates an alert fired within the selected time range doesn't, by itself, mean the alert is currently firing, that the issue is unresolved, or that the resource is experiencing an outage now.

## When an alert triggers
If you select to receive email notifications when any resource triggers an alert, you get an email notification.

:::image type="content" source="media/alert-email.png" alt-text="Screenshot of an email notification showing a triggered alert with a Go to Alert button." lightbox="media/alert-email.png":::

In the email notification, select **Go to Alert** to open a Power Platform page listing the triggered alerts. You can see information on the triggered alert and what resources triggered it. When you select any of the resources in the triggered alert, a pane is displayed that shows time series information for all applicable metrics for that resource, and recommendations for how to improve the metric if it's suboptimal.


## Route alert notifications to any connector-backed destination (preview)

Use the **When an alert fires** trigger on the **Power Platform for Admins V2** connector to route custom alert notifications through Power Automate to any supported connector-backed destination. Bring alerts into the tools your team already uses: post to a Microsoft Teams channel, create Azure DevOps work items, or start a workflow with another connector, such as ServiceNow.

Instead of relying on an inbox to coordinate a response, use the triggered alert's details to decide where to send the notification and what information to include. You can route all received alerts to one destination or use conditions to send different alerts to different destinations.

For example, suppose your organization uses a business-critical production canvas app in a Managed Environment. A custom alert rule with **High** severity detects when the app open success rate falls below 95 percent. When that alert fires, your flow can post the alert and affected resource details to an operations team's Teams channel. A separate branch within the same flow can create Azure DevOps work items for **Medium** and **Low** severity alerts received from other rules.

> [!IMPORTANT]
> The **When an alert fires** trigger and its **Power Platform for Admins V2** connection currently require a tenant-admin account. Environment-admin support for this trigger is coming soon. Tenant and environment admins can continue to create ordinary alerts.

### Prerequisites

Before you begin, ensure you have:

- A tenant-admin account to authenticate the **Power Platform for Admins V2** trigger connection.
- A custom alert rule for an environment or resource in a Managed Environment, or permission to create one. Custom alerts are available only in Managed Environments.
- Access to create a Power Automate cloud flow and the connections required for your chosen destinations. 

> [!NOTE]
> Predefined alert rules and alerts configured with a 1-hour data review period can't be opted into the **When an alert fires** trigger at this time. 

### Step 1: Configure the custom alert rule

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) as a tenant admin.
1. Go to **Monitor** > **Alerts**.
1. Create a custom alert rule. Follow the steps to [create an alert on an environment](#create-an-alert-on-an-environment) or [create an alert on a resource](#create-an-alert-on-a-resource), as appropriate.
1. Select the **Product**, **Product type**, and **Scope**, including the environment or resource to monitor. Configure the metric, operator, threshold, and severity. For the example, select the canvas app's app open success rate, set **Operator** to **Is Under**, enter **95** for the threshold, and set **Severity** to **High**.
2. Select **24 hours** under **Data review period**
1. In the **Notification type** dropdown, select one of these options:

   - **Connector**: Opts the alert rule into connector notifications. The **When an alert fires** trigger listens to the rule and starts the flow when the alert fires.
   - **Email and connector**: Sends an email to the specified recipients and also opts the rule into connector notifications, so the trigger starts the flow when the alert fires.

1. If you selected **Email and connector**, specify the email recipients in **Recipient(s)**.
1. Select **Save**.

### Step 2: Create and configure the flow

1. Sign in to Power Automate and create an automated cloud flow.
1. Select the **When an alert fires** trigger in the **Power Platform for Admins V2** connector.
1. Create or select a connection authenticated with your tenant-admin account.

> [!NOTE]
> By default, the trigger listens to all custom alert rules within the connected account's scope that use **Connector** or **Email and connector** notifications. It isn't bound to the rule you just created. To act on only some of those alerts, add conditions after the trigger using information such as severity or alert rule ID.

### Step 3: Route notifications to your destination

You can route the received alert to any supported connector-backed destination. You don't need to add severity filtering; the severity-based routing example later in this section is one optional pattern.

1. Add the appropriate connector action after the trigger. For example, choose an action to post a message to a Teams channel, create an Azure DevOps work item, or create a record in another connected service.
1. Configure the action's connection and destination settings, such as the target team and channel or the project where a work item belongs.
1. Use the trigger's dynamic content to populate the destination action. Include the alert name, identifiers, severity, and affected resource details that help the receiving team investigate. The **Triggered alert body** section describes the available information.
1. If the flow should handle only a specific rule, add a condition using its alert rule ID before the notification action. Otherwise, actions can apply to all opted-in rules within the connected account's scope, or to the subset selected by any other conditions you add.
1. Save the flow and turn it on.

### Step 4: Verify the notification

1. After the flow is on, check for a new firing of a custom alert rule configured for **Connector** or **Email and connector** notifications.
1. Open the flow's run history in Power Automate. Review the trigger, any condition results, and the destination action to confirm that the alert followed the intended route.
1. Check the destination. Confirm that the delivered notification matches the alert rule and triggered alert occurrence, and contains the context your team needs. If you selected **Email and connector**, also check the specified recipients' email notifications.

Creating an alert rule starts an on-demand evaluation, so the rule might have fired before you created or turned on the flow. Validate the flow with a new firing after it is on.

Routing notifications through Power Automate doesn't change the rule's evaluation cadence or how frequently metrics are collected.

### Triggered alert body

Use information from the triggered alert body in conditions, messages, and work items. The following table describes the available fields using readable labels. For affected resources, keep each resource's identifier, metric value, and environment together so the receiving team can identify where the issue occurred.

| Field | Description |
| --- | --- |
| `alertId` | Identifier of the individual triggered alert occurrence. Use it to distinguish separate firings of the same rule.|
| `alertRuleId` | Identifier of the alert rule. Use it to filter notifications to a specific rule. |
| `severity` | Severity assigned to the alert. You can optionally use it to route notifications. |
| `monitorCondition` | Monitor condition reported for the alert. |
| `firedDateTime` | Time when the alert fired. |
| `productType` | Product type associated with the alert. |
| `subProductType` | Sub product type associated with the alert. |
| `scope` | Scope monitored by the alert rule. |
| `metric` | Metric evaluated by the alert rule. |
| `metricUnit` | Unit used for the metric. |
| `operator` | Comparison operator used to evaluate the metric against the threshold. |
| `threshold` | Threshold configured in the alert rule. |
| `dataReviewPeriod` | Period of metric data reviewed when evaluating the alert. |
| `affectedResourceCount` | Number of resources affected by the triggered alert. |
| `affectedResource` | Identifiers of the affected resources. Each resource ID corresponds to that resource's metric value and environment. |
| `metricValues` | Metric value reported for each affected resource, paired with that resource's ID and environment. |
| `environmentId` | Environment identifier or context for each affected resource, paired with that resource's ID and metric value. |
| `tenantId` | Identifier of the tenant associated with the alert. |

### Example: Route alerts by severity

This optional example sends high-severity alerts to Teams and creates Azure DevOps work items for medium- and low-severity alerts. It applies only to the custom alerts received by the trigger: rules within the connected account's scope that use **Connector** or **Email and connector** notifications. Severity conditions control routing in this example; they aren't required to configure or use the trigger.

1. Start with the **When an alert fires** trigger and tenant-admin connection configured in Step 2.
1. If you want to process only one rule, add a condition using its alert rule ID before the routing actions. Otherwise, continue with all opted-in rules within the connected account's scope.
1. Add a **Condition** action that checks whether the alert's severity is **High**, using the trigger's dynamic content.
1. In the **Yes** branch, add a Microsoft Teams action that posts a message to a channel. Configure the Teams connection and select the target team and channel.
1. Populate the Teams message with the alert name, alert rule ID, triggered alert ID, severity, fired time, and relevant metric and threshold information. Include the affected resources with their corresponding metric values and environments.
1. In the **No** branch of the severity condition, add an Azure DevOps action to create a work item. Configure the Azure DevOps connection, organization, project, and work item type.
1. Map alert information to the work item's title and description. For example, include the severity and the alert rule ID, triggered alert ID, fired time, metric, threshold, and affected resource details in the description.
1. Save the flow and turn it on.
1. Verify each configured route when a relevant new alert fires. For a **High** severity alert, check the flow's run history and the Teams message. For a **Medium** or **Low** severity alert, check the run history and the Azure DevOps work item. Confirm that the rule and triggered alert identifiers match in each destination.


## Predefined alerts from Microsoft 

### Overview
Power Platform includes predefined alerts to help IT, operations, and center of excellence teams find high-use apps, flows, and agents with degraded health. Predefined alerts provide the most value to customers who didn't adopt custom alerts to monitor their organization's health.

### What are predefined alerts?
Microsoft creates and defines predefined alerts to highlight resources with suboptimal health. They have a tenant-wide scope, so they monitor all resources of a specific type in your tenant. They're turned on by default, require no set up to start using them, and can't be edited. Predefined alerts encourage customization; not only do they help users identify high-use resources with suboptimal operational health, they also help introduce and familiarize users with the concept of custom alerts. Consider creating a custom alert on some of these resources to proactively monitor them against custom thresholds that you define. 

The following table details what predefined alerts are supported today.

| Product | Predefined alert |
| ------- | ------- | 
| Canvas apps | Availability of high-use canvas apps is under 90%. |
| Model-driven apps | Availability of high-use model-driven apps is under 90%. |
| Cloud flows | High-use cloud flows have a success rate under 90%. |
| Desktop flows | High-use desktop flows have a success rate under 90%. |
| Agents | High-use agents have a success rate under 90%. |

### High-use thresholds
Predefined alerts highlight high-use resources in your tenant that perform suboptimally. These alerts filter out resources with a low session or run count so that you only see relevant resources. The thresholds for each supported product type are in the following table and can't be changed. 

| Product | Usage threshold |
| ------- | ------- | 
| Canvas apps | Recent app launches are greater than or equal to 100. |
| Model-driven apps | Recent app launches are greater than or equal to 100. |
| Cloud flows | Daily run count is greater than or equal to 150. |
| Desktop flows | Daily run count is greater than or equal to 100. |
| Agents | Recent agent sessions are greater than or equal to 200. |

### How it works
Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and navigate to the **Monitor** > **Overview** page. On the page, you see two cards.

:::image type="content" source="media/monitor-overview-page.jpg" alt-text="Screenshot of the Monitor overview page displaying two cards summarizing custom and predefined alerts." lightbox="media/monitor-overview-page.jpg":::

The **Triggered custom alerts** card shows you the state of your triggered custom alerts in your tenant. These alerts are ones that you define. The visual in this card breaks down your triggered custom alerts by severity level, and the **Top priorities** section below calls out which of your alerts triggered most recently. Select one of those custom alerts to see which items triggered it. 

The **Triggered alerts for high-use items** card on the right shows you which of your predefined alerts triggered. Similarly, the visual at the top of the card shows a breakdown of triggered predefined alerts by product type. Select one of the alerts in the **Top alerts from Microsoft** section to view which resources triggered that predefined alert. For example, you can select the **High-use cloud flows have a success rate under 90%** predefined alert and see all the high-use cloud flows in your tenant that triggered this alert, regardless of whether the flow is in a managed environment or not. Like the triggered custom alert experience, selecting a specific flow in that list displays a pane that shows you how each metric for that flow has trended over time. 

You can also see a list of your predefined alerts and view their details in the **Alerts** section of **Monitor**. Select **Alerts** and scroll to the bottom of the page to view the predefined alerts. Microsoft authors predefined alerts. 

Selecting the three dots next to the predefined alert and then **Details** displays a pane that shows how it has been configured. You can't edit or delete these alerts. 

:::image type="content" source="media/predefined-alert-details.jpg" alt-text="Screenshot of the predefined alert details pane showing the alert configuration." lightbox="media/predefined-alert-details.jpg":::

## Frequently asked questions (FAQs)

### What's the difference between an alert rule and a triggered alert?
An _alert rule_ is a monitoring rule you configure, including the scope, metric, threshold, severity, and notification.                             

A _triggered alert_ is an instance when one or more resources meet the rule's condition. For example, the **Is under 90% for app open success rate** condition is met.

### Who can create and manage alerts?
You must be a **Tenant administrator** or an **Environment administrator** to create and manage alerts.

### How many alert rules can I create?
You can create up to 10 alert rules with a 1-hour data review period and up to 50 alert rules with a 24-hour data review period for a total of up to 60 alert rules. Hourly alert rules that are turned off still count towards the limit of 10, so delete hourly alert rules that you aren't using. Alert rules with a 24-hour data review period that are turned off don't count towards the alert rule limit.

### What environments are supported?
All environment types, such as production, sandbox, trial, and developer environment types are supported, but they must be a managed environment. You select the environment in the **ID** field after setting the **Scope** field to **Environment**. 

### Where do I manage my created alerts?
Go to Power Platform admin center and select **Monitor** > **Alerts** and manage existing rules on the **Alert rules** tab.

### What is the Last Run column in the Alert rules tab?
The data in this column shows when the alert rule last ran. Alerts run every 24 hours, so the values in this column should change accordingly. 

### Does the severity level affect how alerts are processed?
The **Severity**, such as **Low**, **Medium**, or **High** is a classification label for triage and reporting. It doesn't change evaluation frequency or email notification behavior. 

### Do alerts work on the default environment?
Yes, **if** your default environment is a **managed environment**. Managed environments are the only environments that support alerts. 

### Can I disable predefined alerts?
At the moment, you can't disable predefined alerts. Support for this capability is coming soon.

### Where can I view triggered predefined alerts?
You can view triggered predefined alerts on the **Monitor Overview** page under the **Triggered alerts for high-use items** card and in the **Alerts** section at the bottom of the **Alert rules** page. You can also find triggered predefined alert notifications in the **triggered alerts** section of the **Monitor Alerts** page. 

### What should I do if a predefined alert is triggered?
Review the affected resources and consider creating custom alerts for those items to proactively monitor them against thresholds that matter to your organization and be notified via email when it triggers. 

### Do predefined alerts send email notifications?
No, predefined alerts don't send any notification. You need to go into **Monitor** to view if any of them triggered.

### Can I customize predefined alerts?
No, Microsoft preconfigures these alerts. For customization, create custom alerts. 

### Can I create alerts to monitor *Time to Interactive* or *Time to Full load* on specific screens for canvas or code apps?
No, when you create an alert on a canvas or code app and select **Time to Interactive (TTI)** or **Time to Full load (TTFL)** as the metric, it only monitors the TTI or TTFL of the *start screen* for that app. You cannot select a specific screen of an app when configuring an alert. 

### I created an hourly alert rule, why can't I see any data or alert triggering right after? 
The first check runs after the first full hour, once there's at least one data point.

### Why are there gaps in the hourly chart? 
An hour with no activity has no data point. 

### Will I get an email every hour while the problem lasts? 
You get an email as soon as a low-latency alert fires, then a reminder every 4 hours while the issue continues. Reminders stop when the issue resolves or after 7 days, whichever comes first. If the issue comes back after it resolves, you get a new email.

### Can I see more than 24 hours, or export hourly data?
No, the hourly chart covers the last 24 hours only and Monitor's data export feature only covers daily metric aggregates. 

### Can hourly alerts be opted into the 'When an alert fires' trigger on the Power Platform for Admins V2 Connector? 
At the moment, no, only alerts that have a 24-hour data review period can be opted in. We expect to support this functionality for hourly alerts by January 2027.

### Any tips or best practices?
Yes! Follow these best practices:

- **Start small**: Create a few high-value rules first, such as performance-open times, error rates, usage spikes.
- **Name consistently**: Use clear names like **Prod – Canvas apps – Availability < 90**.
- **Set appropriate severity**: Use **High** for production-impacting metrics and **Medium** or **Low** for trend monitoring.
- **Manage the 60-rule limit**: Delete obsolete rules.
- **Validate email routing**: Ensure recipients can receive emails from **PowerPlat-noreply@microsoft.com**, **microsoft-noreply@microsoft.com** and **azure-noreply@microsoft**. 
- **Monitor the 24‑hour or 1 hour cadence**: Expect daily or hourly evaluation; it's not real-time.
