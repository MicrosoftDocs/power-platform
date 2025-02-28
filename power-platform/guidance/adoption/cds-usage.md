---
title: "Use Microsoft Dataverse usage reports | MicrosoftDocs"
description: "The Microsoft Dataverse analytics in the Power Platform admin center will provide details about Dataverse usage in the selected environment."
author: manuelap-msft

ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/28/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Monitor licenses and capacity

Effective capacity and license monitoring in Power Platform helps you maintain optimal performance, ensure compliance, and manage costs. This article outlines the key aspects to monitor and provides recommendations to help you stay on top of your Power Platform environment.

## Monitor license consumption

Use the [Billing page](/power-platform/admin/view-license-consumption-issues) in the Power Platform admin center to monitor the consumption of your organization's Power Platform licenses and easily spot environments that might have licensing issues. Get answers to questions like these:

- How many Power Apps licenses are purchased?
- How many of those Power Apps licenses are assigned to users?
- What types of licenses are being used to launch apps?
- What licenses are being used to execute flows?
- How many users are actively consuming Power Apps or Power Automate licenses in a specific environment?
- Who are the users actively consuming Power Apps or Power Automate licenses?
- Are there users in my environment who need standalone Power Apps or Power Automate licenses?
- Which flows are out of compliance?

As an administrator, you should

- Monitor the allocation of licenses to users and applications. Ensure that you have the correct number of licenses and that they are assigned appropriately. This helps in avoiding any compliance issues and managing costs effectively.
- Regularly review the list of flows requiring licensing attention.
- Regularly review the [Intelligent recommendations page](/power-platform/admin/get-recommendations-licensing), which provides you with recommendations about who in your organization would benefit from having a Power Apps premium license.

## Monitor storage capacity add-ons

Capacity monitoring involves tracking the usage of various resources within your Power Platform environment, such as storage, API calls, and database capacity.

- [Dataverse capacity](/power-platform/admin/capacity-storage): Keep an eye on the storage consumption across your environments. Monitor the usage of Dataverse database, file, and log storage. This helps in identifying any potential overuse and planning for additional capacity if needed. Regularly check the capacity of your Dataverse databases. Ensure that your databases are not nearing their limits, which could impact the performance of your applications.
- [API Calls](/power-platform/admin/analytics-common-data-service#api-call-statistics): Track the number of API calls made by your solutions and users. Monitoring API usage helps in identifying any unusual spikes or patterns that could indicate performance issues or potential abuse.

As an administrator, you should:

- Review what happens when you [exceed storage capacity entitlements](/power-platform/admin/capacity-storage#changes-for-exceeding-storage-capacity-entitlements).
- Use the [environment capacity management and alerting](/power-platform/guidance/coe/capacity-alerting) feature of the [CoE Starter Kit](/power-platform/guidance/coe/starter-kit) to monitor capacity consumption in the tenant, configure approved limits, and receive alerts when an environment is close to or over their approved capacity.
- Regularly check the capacity available to ensure new environments can be created by users in your tenant.
- Review the top storage used by environments to ensure you are aware of your top consuming environments.
- Look for any unexpected spikes in usage using the database, file, and log charts for individual environments.
- Review capacity add-ons such as Power Apps app passes, flow per business processes, portal page views, portal sign-ins, or AI Builder credits, and assign that capacity to specific environments.
