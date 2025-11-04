---
title: "Tutorial: Convert a Sandbox Environment to Production for Dynamics 365 finance and operations apps"
description: "Comprehensive guide for administrators to convert Dynamics 365 Finance and Operations Sandbox environments to Production environments using Power Platform admin center."
author: laneswenka
ms.topic: overview
ms.date: 09/30/2025
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks
---

# Tutorial: Convert a Sandbox Environment to Production

This tutorial provides step-by-step guidance for administrators on how to convert a Sandbox environment to a Production environment within the Power Platform admin center. This lifecycle operation is essential for enabling business usage and supporting go-live scenarios.

## Purpose and Scenario

Converting a Sandbox to Production is primarily used when an organization is ready to transition from pre-production testing to live operations. Customers often utilize Sandbox environments to validate configurations, code, and integrations before performing this conversion as part of their formal go-live process.

- **Why convert?**
  - To upgrade the environment's disaster recovery capabilities and reliability for business usage.
  - To simulate and validate go-live processes, deployment checklists, and IT readiness.

## Operation Procedure

### 1. Prepare for Conversion

- Review all outstanding environment tasks, final configuration steps, or code deployments in Sandbox.
- Communicate the expected downtime window to all relevant business and technical stakeholders.
- Confirm production licensing and deployment readiness for business use.

### 2. Convert via Power Platform Admin Center

1. **Sign In:** Access the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. **Locate Environment:** In the left navigation, select **Manage** and then select **Environments**. From the list, choose the Sandbox environment to be converted.
3. **Initiate Conversion:** In the action bar across the top of the screen, click the **Convert to Production** button.
4. **Acknowledge Downtime:** Carefully read downtime warnings and confirm acceptance. Once acknowledged, the operation will queue and begin.
5. **Monitor Progress:** Use the admin center to track conversion status. The environment will be inaccessible during the conversion window (up to two hours).

## Post-Conversion Checklist

- Validate successful conversion in the admin center (environment type will now be **Production**).
- Perform smoke tests or light regression testing to ensure no disruption to application functionality, integrations, or data flows.
- Review environment monitoring, backup schedules, and security policies now applicable for production workloads.
- Inform organizational stakeholders that go-live or business usage may proceed.

## Additional Notes

- **Rollback:** This procedure is bi-directional; reverting a Production environment back to Sandbox follows the same steps as above.
- **Customizations:** Existing customizations, X++ code, and Dataverse solutions are preserved—no reinstallation or redeployment is required.
- **Timing:** Allow for variable timing (up to two hours). Actual conversion duration depends on tenant load and regional capacity at the time of conversion.

