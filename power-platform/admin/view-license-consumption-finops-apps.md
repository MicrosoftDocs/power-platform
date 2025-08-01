---
title: View license consumption for finance and operations apps 
description: Learn how to view your organization's Power Apps license consumption for finance and operations apps. 
author: amiyapatr-zz
ms.date: 09/25/2024
ms.reviewer: sericks
ms.topic: how-to
ms.subservice:
ms.author: ampatra
search.audienceType: 
 - admin
ms.custom:
  - bap-template
  - sfi-image-nochange
---

# View license consumption for finance and operations apps

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->


You can use the **Licenses** page in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to see how different user licenses are consumed in your finance and operations environments. With this information, you can get answers to questions like:

- What types of finance and operations licenses do you have available for your tenant?
- How many licenses have been assigned to users?
- How many roles have been assigned to users in different finance and operations environments, and what licenses are needed based on their role assignment?
- Are extra licenses needed based on role assignments in your tenant?


## Summary tab

To see a summary of license usage:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. From **Billing**, select **Licenses**.
1. Select the **Summary** tab.
1. Select **Finance and operations** from the **Product** list.

### User license level summary

The **User license level summary** section provides a summary count of user licenses available, assigned, and required for the tenant for finance and operations environments.

> [!IMPORTANT]
> Device license aren't included in the count of licenses available, assigned, or required for the tenant for finance and operations environments.

| Information | Description |
| ------- | ----------- |
| User license level | Type of finance and operations license available, or required by the tenant. |
| Available seats | Number of seats for a user license level available for the tenant. |
| Assigned seats | Number of users who are assigned licenses. |
| Required seats | Number of users who need licenses based on role assignment in finance and operations environments. |
| License utilization status | This status is calculated by comparing the number of roles assigned versus the number of licenses available |

You can view the individual licenses mapped to a license level, and the number of seats available for the individual license by selecting the number in the **Available seats** for a specific user license level.

### Drill-down view

Select the specific **User license level** to see a list, and more details of users who are required to have the selected license.

| Information | Description |
| ------- | ----------- |
| Email/User ID | List of users who need a selected user license type. For guest users, user IDs are displayed. |
| Environment | Name of the environment in which the user has been assigned a role. |
| Security role | Name of the security role assigned to the user. |
| Role license | The role license mapped to the security role. |
| Required license | Mapped user license level for the role license. |
| Assigned license | The license assigned to the user. |

The following is a screenshot of the **Licenses** page displaying **User license level**.

You can filter the view using **Environment, Security role, Role license** and **Assigned license** filters.

Select an **Email/User ID** to view the details of all roles assigned to the selected user across all finance and operations environments in the tenant. This view also provides recommendations on what licenses should be assigned to the user based on the user's assigned roles. This can be seen in the following image.

   :::image type="content" source="media/view-license-consumption-finops-apps.png" alt-text="View User license level summary" lightbox="media/view-license-consumption-finops-apps.png":::

## Download

To download the license usage information, select **Export to CSV** in the **Summary** tab to start download process. After a .csv file is generated, you can download the same file again within five days without having to start a new download.

   :::image type="content" source="media/view-license-consumption-finops-apps-download.png" alt-text="Download license summary" lightbox="media/view-license-consumption-finops-apps-download.png":::

