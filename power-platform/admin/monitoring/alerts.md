---
title: Create alerts for your resources (preview)
description: Learn more about how to create alerts to monitor your resources in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/10/2025
author: arjunmayur
ms.author: arjunmayur
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Create alerts for your resources (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Tenant and environment admins in Power Platform use _alerts_ to track the operational health of their resources. Admins set up custom thresholds and get notifications when metrics for their resources pass specific thresholds. Create alerts on any metrics in the Monitor area of the Power Platform admin center.

Keep the following principles in mind:

-	Alerts are evaluated after new metrics are produced. Currently, all metrics are 24-hour aggregates, which means an alert rule in the **Monitor** area is evaluated every 24 hours after the newest 24 hour aggregates are produced. An alert rule does an on-demand evaluation upon its creation.
- Alert rules are alerts that admins create to monitor their resources. You can edit, delete, and turn an alert rule on or off. Alert rules can be placed on an environment and a specific resource.
- A _triggered alert_ is when one or more of the resources that are being monitored by an alert rule pass specific thresholds defined by the admin who configured the alert rule. You can select the triggered alert to learn what resources triggered the alert rule, and get recommendations for how to improve the resources if it’s in a managed environment. 

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## When to use alerts
- Teams and admins use alerts to find resources that are used more than expected. For example, an admin creates an alert to know if apps in the default environment exceed 50 launches a day.
- Teams use alerts to find resources with degraded health, and work with their makers to fix issues.
- For operations, admins create alerts to know if apps in their production environment are slow to open for users.

## Prerequisites
-	You must be a tenant administrator or an environment administrator to access alerts. 
-	Alerts can only be placed on a managed environment.
-	You must be using the [new and improved Power Platform admin center](../new-admin-center.md).

## Create an alert 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Monitor**.
1. In the **Monitor** pane, select **Alerts**. The **Alerts** page is displayed.
    > [!Note]
    > Manage your existing alert rules in the **Alert rules** tab. Use the **More user actions** icon to see options for editing or deleting your alert rule. Turn your alert rule on or off by using the toggle in the **Status** column.
1. Select **+ Alert rule** to create your new alert rule. The **New alert rule** pane is displayed.
1. In the **Alert rule name** field, enter the name of your alert.
1. In the **Product** list, select the product you want to monitor with the alert, **Power Apps** or **Power Automate**.
1. In the **Product type** list, select what you're going to monitor with the alert. For example, select **Canvas app** or **Model-driven app** for Power Apps, or **Cloud flow** or **Desktop flow** for Power Automate.
1. In the **Scope** list, select **Environment** to monitor all items of a specific type&mdash;such as all canvas apps in my production environment.
1. In the **Id** field, select the environment that you want to monitor with an alert.
1. In the **Metric** list, select the metric that you would like to create your custom threshold against. The available metrics that alerts support and what they mean can be found in [Metrics and recommendations for Power Apps](monitor-power-apps.md) and [Metrics and recommendations for Power Automate](monitor-power-automate.md).
1. In the **Operator** list, select an operator to define your threshold. The options are **Is Under**, **Is Over**, or **Equals**.
1. In the **Select value** list, use the arrow icons to increase or decrease the value.
1. In the **Severity** list, select **Low**, **Medium**, or **High**.
1. In the **Notification type** list, select which notification type you’d like this alert to have: **None** or **Email**.
    - If you select **None**, you won’t get an email and will have to come back to the Monitor area of the admin center to check on the status of your alert.
    - If you select **Email**, you and up to four other recipients&mdash;that you specify in the **Recipient(s)** field&mdash;will get an email when the alert is triggered. The email comes from `PowerPlat-noreply@microsoft.com`.
1. Select **Save**.

After you’ve created your alert, the system does an on-demand evaluation and scans all the applicable resources under its scope.

## When an alert is triggered
If you selected to receive email notifications when any resource triggers an alert, you get an email notification sent to you.

:::image type="content" source="media/alert-email.png" alt-text="If you selected to receive email notifications when any resource triggers an alert, you get an email notification sent to you." lightbox="media/alert-email.png":::

In the email notification, select **Go to Alert** to open a Power Platform page listing the triggered alerts, where you can see information on the triggered alert and what resources triggered it. When you select any of the resources in the triggered alert, a pane is displayed that shows time series information for all applicable metrics for that resource, and recommendations for how to improve the metric if it’s suboptimal.

## Predefined Alerts from Microsoft 

### Overview
Predefined alerts exist in Power Platform Monitor to help IT, Operations, and Center of Excellence teams find high-use apps, flows, and agents with degraded health. These provide the most value to customers that haven’t adopted custom alerts to monitor health for their organizations’ health metric thresholds. 

### What are Predefined Alerts?
Predefined alerts are created and defined by Microsoft to highlight resources with sub-optimal health. They have a tenant wide scope, so they monitor all resources of a specific type in your tenant. They are enabled by default, require no set up to start using them, and cannot be edited. Predefined alerts encourage customization; not only do they help users identify high-use resources with suboptimal operational health, they also help introduce and familiarize users with the concept of custom alerts. Consider creating a custom alert on some of these resources to proactively monitor them against custom thresholds that you’ve defined. 

The table below details what predefined alerts are supported today:
| Product | Predefined Alert |
| ------- | ------- | 
| Canvas apps | Availability of high-use canvas apps is under 90% |
| Model-driven apps | Availability of high-use model-driven apps is under 90% |
| Cloud flows | High-use cloud flows have a success rate under 90% |
| Desktop flows | High-use desktop flows have a success rate under 90% |
| Agents | High-use agents have a success rate under 90% |

### High-use Thresholds
Predefined alerts are intended to highlight high-use resources in your tenant that are performing sub-optimally. Consequently, these alerts filter out resources that have a low session or run count so that you only see relevant resources under your purview. The thresholds for each supported product type are in the table below and cannot be changed. 

| Product | Usage Threshold |
| ------- | ------- | 
| Canvas apps | Recent app launches >= 100 |
| Model-driven apps | Recent app launches >= 100 |
| Cloud flows | Daily run count >= 150 |
| Desktop flows | Daily run count >= 100 |
| Agents | Recent agent sessions >= 200 |

### How It Works
Go to admin.powerplatform.microsoft.com and navigate to the Monitor Overview page. Once on the page, you’ll see two cards:
:::image type="content" source="media/monitor-overview-page.jpg" alt-text="Monitor overview page that displays two cards. One summarizes the state of your triggered custom alerts, the other summarizes the state of your triggered predefined alerts." lightbox="media/monitor-overview-page.jpg":::

The “Triggered custom alerts” card on the left shows you the state of your triggered custom alerts in your tenant. These are alerts that you have defined. The visual in this card breaks down your triggered custom alerts by severity level, and the “Top priorities” section below calls out which of your alerts have triggered most recently. Clicking on those alerts will bring you to the triggered alert experience for that custom alert. 

The “Triggered alerts for high-use items” card on the right shows you which of the predefined alerts have triggered. Similarly, the visual at the top of the card shows a breakdown of the predefined alerts by product type. Clicking into one of the alerts in the “Top alerts from Microsoft section” will bring you this experience:
:::image type="content" source="media/triggered-predefined-alert.jpg" alt-text="Image that shows the triggered predefined alert experience." lightbox="media/triggered-predefined-alert.jpg":::

As an example, here you can see all the high-use cloud flows in your tenant that have triggered this alert, regardless of whether the flow is a managed environment or not. Like the custom triggered alert experience, clicking on a specific flow in this list will bring out a panel that shows you how each metric for that flow has trended over time. 
:::image type="content" source="media/monitor-resource-panel.jpg" alt-text="Monitor resource panel that shows metrics and how they've trended over time for a given resource." lightbox="media/monitor-resource-panel.jpg":::

You can also see a list of your predefined alerts and view their details in the Alerts section of Monitor. Click on Alerts and scroll to the bottom of the page to view the predefined alerts. 
:::image type="content" source="media/predefined-alert-list.jpg" alt-text="This image shows predefined alerts listed alongside your custom alerts under Alert Rules in the Alerts section of Monitor" lightbox="media/predefined-alert-list.jpg":::


Clicking on the three dots next to the alert and then on “Details” will bring out a panel that shows how the predefined alert has been configured. As a reminder, these alerts cannot be edited or deleted. 
:::image type="content" source="media/predefined-alert-details.jpg" alt-text="This image shows how if you click on details on a predefined alert in the Alert rules page, it'll bring out a panel that shows you details on how this alert is defined." lightbox="media/predefined-alert-list.jpg":::

## Frequently asked questions (FAQs)

### What’s the difference between an alert rule and a triggered alert?
An _alert rule_ is a monitoring rule you configure, including the scope, metric, threshold, severity, and notification.                                                                                                                                               
A _triggered alert_ is an instance when one or more resources meet the rule’s condition. For example, the **Is under 90% for app open success rate** condition is met.

### Who can create and manage alerts?
You must be a **Tenant administrator** or an **Environment administrator** to create and manage alerts.

### What environments are supported?
All environment types, such as production, sandbox, trial, and developer environment types are supported, but they must be a Managed Environment. You select the environment in the **ID** field after setting the **Scope** field to **Environment**. 

### Where do I manage my created alerts?
Go to Power Platform admin center and select **Monitor > Alerts** and manage existing rules on the **Alert rules** tab.

### What is the Last Run column in the Alert rules tab?
The data in this column informs you the last time the alert rule ran. Alerts should run every 24 hours, so the values in this column should change accordingly. 

### Does the severity level affect how alerts are processed?
The **Severity**, such as **Low**, **Medium**, ir **High** is a classification label for triage and reporting. It doesn't change evaluation frequency or email notification behavior. 

### Do alerts work on the default environment?
Yes, **if** your default environment is a **Managed Environment**. Alerts are only supported in Managed Environments. 

### Can I disable predefined alerts?
At the moment, predefined alerts cannot be disabled. We expect to support this capability soon.

### Where can I view triggered predefined alerts?
Triggered predefined alerts are visible on the Monitor Overview page under the “Triggered alerts for high-use items” card and in the Alerts section at the bottom of the Alert rules page. You can also find triggered predefined alert notifications in the triggered alerts section of the Monitor Alerts page. 

### What should I do if a predefined alert is triggered?
Review the affected resources and consider creating custom alerts for those items to proactively monitor them against thresholds that matter to your organization and be notified via email when it triggers. 

### Do predefined alerts send email notifications?
No, predefined alerts do not send any notification. You need to come into Monitor to view if any of them triggered.

### Can I customize predefined alerts?
No, these alerts are preconfigured by Microsoft. For customization, create custom alerts. 

### Any tips or best practices?
Yes! Follow these best practices:

- **Start small**: Create a few high-value rules first, such as performance-open times, error rates, usage spikes.
- **Name consistently**: Use clear names like **Prod – Canvas apps – Availability < 90**.
- **Set appropriate severity**: Use **High** for production-impacting metrics and **Medium** or **Low** for trend monitoring.
- **Manage the 50-rule limit**: Delete obsolete rules.
- **Validate email routing**: Ensure recipients can receive emails from **PowerPlat-noreply@microsoft.com**.
- **Monitor the 24‑hour cadence**: Expect daily evaluation; it’s not real-time.

### How many alert rules can be turned on at one time?
A tenant can have 50 alert rules turned on at one time. However, you can create an unlimited number of alert rules. Consider deleting or turning off any existing alert rule if you’ve reached the maximum.



