---
title: View license consumption for finance and operations apps in Power Platform admin center (preview)
description: Learn how to view your organization's Power Apps license consumption for finance and operations apps. 
author: KendalBond007
ms.date: 07/19/2023
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice:
ms.author: ampatra
ms.custom: bap-template
search.audienceType: 
 - admin
---

# View license consumption for finance and operations apps in Power Platform admin center (preview)

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can use the **Licenses (preview)** page in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to see how different user licenses are consumed in your finance and operations environments. With this information, you can get answers to questions like:

- What types of finance and operations licenses do you have available for your tenant?
- How many licenses have been assigned to users?
- How many roles have been assigned to users in different finance and operations environments, and what licenses are needed based on their role assignment?
- Are there additional licenses needed base on role assignments in your tenant?

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Overview tab

To see and overview of license usage:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/)
1. From **Billing (preview)** select **Licences (preview)**.
1. Select the **Overview** tab.
1. Select **Finance and operations** from the **Product** list.

### User license level overview

The **User license level overview** section provides a summary count of user licenses available, assigned, and required for the tenant for finance and operations environments.

| Information | Description |
| ------- | ----------- |
| User license level | Type of finance and operations license available, or required by the tenant. |
| Available seats | Number of seats for a user license level available for the tenant. |
| Assigned seats | Number of users assigned who are also assigned licenses. |
| Required seats | Number of users who need licenses based on role assignment in finance and operations environments. |
| License utilization status | This status is calculated by comparing the number of roles assigned versus the number of licenses available |

You can view the individual licenses mapped to license level and the number of seats available for the individual license by selecting the number in the **Available seats** for a specific user license level.

### Drill down view


