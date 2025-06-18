---
title: Create alerts for your resources (preview)
description: Learn more about how to create alerts to monitor your resources in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/17/2025
ms.custom: NewPPAC
author: arjunmayur
ms.author: arjunmayur
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Create alerts for your resources (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Overview
Tenant and environment administrators in Power Platform Monitor can use alerts to track the operational health of their resources by setting custom thresholds and receive notifications when metrics of their resources passes those thresholds. Alerts can be created on any metrics in Monitor. The alert feature is only available in the Power Platform admin center.  

There are multiple use cases for Power Platform Monitor alerts:
1.	Center of enablement teams and administrators can use alerts to discover resources with more than their expected use. For example, an administrator can create an alert to let them know if apps in the default environment exceed 50 launches a day.
3.	Center of enablement teams can also use alerts to find resources with degraded health to engage their makers to fix
4.	For operations, they can create alerts to let them know if apps in their production environment are slow to open for end-users. 

### Definitions:
1.	Alert rules are alerts that admins create to monitor their resources. You can edit, delete, and turn an alert rule on or off. Alert rules can be placed on an environment or an individual resource 
2.	A triggered alert is when one or more of the resources that are being monitored by an alert rule passes the threshold defined by the administrator who configured the alert rule. You can click into the triggered alert to find what resource(s) triggered the alert rule, and recommendations for how to improve the resource(s) if it’s in a Managed Environment. 

### Pre-requisites
-	You must be a tenant administrator or an environment administrator to access Alerts 
-	Alerts can only be placed on a Managed Environment or a resource in a Managed Environment

## How to create an alert 
First, go to Monitor in PPAC and then click on “Alerts” in the left navigation:
[!INCLUDE [file-name](~/../)]

You can manage your existing alert rules in the “Alert rules” tab. Use the three dot menu to see options for editing or deleting your alert rule. Additionally, turn your alert rule on or off by using the toggle in the Status column.

Click on “+ Alert rule” to create your new alert rule
[!INCLUDE [file-name](~/../)]

In the panel, you’ll need to configure the following information:
1.	The name of your alert
2.	The product (Power Apps or Power Automate)
3.	The specific type (Canvas app or Model-driven app for Power Apps, or Cloud flow or Desktop flow for Power Automate)
4.	The scope of your alert. You can either place an alert on an environment to monitor all items of a specific type (e.g. All canvas apps in my production environment) or place it on an individual resource.
5.	Input the environment or resource ID that you would like to place your alert on
6.	Select the metric that you would like to create your custom threshold against. The available metrics that alerts support and what they mean can be found here: Power Apps metrics or Power Automate metrics
7.	Select an operator to define your threshold. The options are “Is Under”, “Is Over” or “Equals”
8.	Select the value to finalize defining your threshold
9.	Next, select the severity of the alert. 
10.	Finally, select which notification type you’d like this alert to have: Email or None. If you select Email, you and up to 4 other recipients that you enter will get an email when the alert is triggered. The email will come from PowerPlat-noreply@microsoft.com.  If you select None, you won’t get an email and will have to come back to Monitor to check in on the status of your alert. 
11.	Enter the email address of any recipient that you’d like to be notified when the alert is triggered

Once you’ve created your alert, it’ll do an on-demand evaluation and scan all the applicable resources under its scope. If you selected “Email” and any resource triggers the alert, you’ll get an email notifying you that your alert was triggered. 

[!INCLUDE [file-name](~/../)]

Clicking on “Go to Alert” will bring you to this page, where you can see information on the triggered alert and what resources triggered it:
[!INCLUDE [file-name](~/../)]
[!INCLUDE [file-name](~/../)]

You can click on any of the resources in this triggered alert to bring out a panel that shows timeseries information for all applicable metrics for that resource, and recommendations for how to improve the metric if it’s suboptimal.


### Notes:
-	You can have 25 alerts enabled at a time, but can create an unlimited amount of alerts. Consider deleting or disabling any existing alert if you’ve reached the maximum
-	Alerts are evaluated after new metrics are produced. Currently, all metrics are 24 hour aggregates, which means an alert rule in Monitor will be evaluated every 24 hours after the newest 24 hour aggregates are produced. The alert rule will also do an on demand evaluation upon its creation. 





