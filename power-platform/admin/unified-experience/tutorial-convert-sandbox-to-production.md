---
title: "Tutorial: Convert a sandbox environment to production for Dynamics 365 finance and operations apps"
description: "Comprehensive guide for administrators to convert Dynamics 365 finance and operations sandbox environments to production environments using Power Platform admin center."
author: laneswenka
ms.topic: overview
ms.date: 11/06/2025
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks

---

# Tutorial: Convert a sandbox environment to production for Dynamics 365 finance and operations apps

This tutorial provides step-by-step guidance for administrators on how to convert a sandbox environment to a production environment within the Power Platform admin center. This lifecycle operation is essential for supporting business usage and go-live scenarios.

## Purpose and scenario

Use the conversion process when your organization is ready to transition from preproduction testing to live operations. Use sandbox environments to validate configurations, code, and integrations before performing this conversion as part of your formal go-live process.

- **Why convert?**
  - To upgrade the environment's disaster recovery capabilities and reliability for business usage.
  - To simulate and validate go-live processes, deployment checklists, and IT readiness.

## Operation procedure

### 1. Prepare for conversion

- Review all outstanding environment tasks, final configuration steps, or code deployments in the sandbox environment.
- Communicate the expected downtime window to all relevant business and technical stakeholders.
- Confirm production licensing and deployment readiness for business use.

### 2. Convert through the Power Platform admin center

1. **Sign in:** Access the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. **Locate environment:** In the left navigation, select **Manage**, then in the **Manage** pane, select **Environments**. In the **Environments** page, select the sandbox environment to convert to production.
1. **Initiate conversion:** In the action bar across the top of the page, select the **Convert to Production** button.
1. **Acknowledge downtime:** Carefully read downtime warnings and confirm acceptance. Once acknowledged, the operation begins.
1. **Monitor progress:** Use the admin center to track conversion status. The environment is inaccessible during the conversion window (up to two hours).

## Post-conversion checklist

- Validate successful conversion in the admin center (environment type is now **Production**).
- Perform smoke tests or regression testing to ensure no disruption to application functionality, integrations, or data flows.
- Review environment monitoring, backup schedules, and security policies now applicable for production workloads.
- Inform organizational stakeholders that go-live or business usage may proceed.

## Supplemental notes

- **Rollback:** This procedure is bidirectional; reverting a production environment back to sandbox follows the same steps as above.
- **Customizations:** Existing customizations, X++ code, and Dataverse solutions are preserved. No reinstallation or redeployment is required.
- **Timing:** Allow for variable timing (up to two hours). Actual conversion duration depends on tenant load and regional capacity at the time of conversion.

