---
title: Monitor licenses and capacity
description: Learn how to track Power Platform license consumption and storage capacity to maintain compliance and manage costs effectively.
#customer intent: As a Power Platform admin, I want to monitor Power Platform license consumption so that I can ensure compliance and manage costs effectively.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/12/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/28/2025
---

# Monitor licenses and capacity

Effective capacity and license monitoring in Power Platform helps you maintain optimal performance, ensure compliance, and manage costs. This article explains key aspects to monitor and offers recommendations to help you manage your Power Platform environment effectively.

## Monitor license consumption

Use the [Billing page](/power-platform/admin/view-license-consumption-issues) in the Power Platform admin center to monitor your organization's Power Platform license consumption and identify environments with potential licensing issues.

Find answers to questions like these:

- How many Power Apps licenses are purchased?
- How many of those Power Apps licenses are assigned to users?
- What types of licenses are being used to launch apps?
- What licenses are being used to execute flows?
- How many users are actively consuming Power Apps or Power Automate licenses in a specific environment?
- Who are the users actively consuming Power Apps or Power Automate licenses?
- Are there users in an environment who need standalone Power Apps or Power Automate licenses?
- Which flows are out of compliance?

As an administrator, you should:

- Monitor the allocation of licenses to users and applications. Make sure you have the correct number of licenses and that they're assigned appropriately to avoid any compliance issues and to manage costs effectively.
- Regularly review the list of flows requiring licensing attention.
- Regularly review the [Intelligent recommendations page](/power-platform/admin/get-recommendations-licensing), which provides recommendations about who in your organization would benefit from having a Power Apps premium license.

## Monitor storage capacity add-ons

Capacity monitoring involves tracking the usage of various resources in your Power Platform environment, such as storage, API calls, and database capacity.

- [Dataverse capacity](/power-platform/admin/capacity-storage): Monitor storage consumption across your environments. Track Dataverse database, file, and log storage usage to identify any potential overuse and to plan for more capacity if needed. Regularly check the capacity of your Dataverse databases to ensure they're not nearing their limits, which could affect the performance of your applications.
- [API Calls](/power-platform/admin/analytics-common-data-service#api-call-statistics): Track the number of API calls made by your solutions and users. Monitoring API usage helps in identifying any unusual spikes or patterns that could indicate performance issues or potential abuse.

As an administrator, you should:

- Review what happens when you [exceed storage capacity entitlements](/power-platform/admin/capacity-storage#changes-for-exceeding-storage-capacity-entitlements).
- Use the [environment capacity management and alerting](/power-platform/guidance/coe/capacity-alerting) feature of the [CoE Starter Kit](/power-platform/guidance/coe/starter-kit) to monitor capacity consumption in the tenant, configure approved limits, and receive alerts when an environment is near or over its approved capacity.
- Regularly check the capacity available to ensure users can create new environments.
- Check the top storage used by environments to stay aware of the highest-consuming ones.
- Check database, file, and log charts for unexpected usage spikes in individual environments.
- Check capacity add-ons such as Power Apps app passes, flow per business processes, portal page views, portal sign-ins, or AI Builder credits, and assign that capacity to specific environments.
