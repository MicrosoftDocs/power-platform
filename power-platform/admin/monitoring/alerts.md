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

:::image type="content" source="media/alert-email.png" alt-text="If you selected to receive email notifications when any resource triggers an alert, you get an email notification sent to you.." lightbox="media/alert-email.png":::

In the email notification, select **Go to Alert** to open a Power Platform page listing the triggered alerts, where you can see information on the triggered alert and what resources triggered it. When you select any of the resources in the triggered alert, a pane is displayed that shows time series information for all applicable metrics for that resource, and recommendations for how to improve the metric if it’s suboptimal.

### Maximum number of alert rules turned on at one time
A tenant can have 50 alert rules turned on at one time. However, you can create an unlimited number of alert rules. Consider deleting or turning off any existing alert rule if you’ve reached the maximum.

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

### Any tips or best practices?
Yes! Follow these best practices:

- **Start small**: Create a few high-value rules first, such as performance-open times, error rates, usage spikes.
- **Name consistently**: Use clear names like **Prod – Canvas apps – Availability < 90**.
- **Set appropriate severity**: Use **High** for production-impacting metrics and **Medium** or **Low** for trend monitoring.
- **Manage the 50-rule limit**: Delete obsolete rules.
- **Validate email routing**: Ensure recipients can receive emails from **PowerPlat-noreply@microsoft.com**.
- **Monitor the 24‑hour cadence**: Expect daily evaluation; it’s not real-time.




