---
title: "Securely access customer data using Customer Lockbox in Power Platform (preview) | MicrosoftDocs"
description: This topic covers information on how customers can review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/02/2022
author: mihaelablendea
ms.author: mihaelab
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Securely access customer data using Customer Lockbox in Power Platform (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Most operations, support, and troubleshooting performed by Microsoft personnel (including sub-processors) do not require access to customer data. With Power Platform Customer Lockbox, we provide an interface for the customers to review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. It is used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft.

This article covers how to enable Customer Lockbox and how lockbox requests are initiated, tracked, and stored for later reviews and audits. 

> [!IMPORTANT]
> - Customer Lockbox for Power Platform is available in preview at no cost. When this feature becomes generally available, there will be a cost associated with environments protected with Customer Lockbox.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Summary

You can enable Customer Lockbox for your data sources within your tenant. For the duration of the preview, enabling Customer Lockbox will apply to all environments in the respective tenant. Global administrators and Power Platform administrators can enable the lockbox policy. 

More information: [Enable the lockbox policy](#enable-the-lockbox-policy).

In the rare occasion when Microsoft attempts to access customer data that's stored within Power Platform (i.e., Dataverse), a lockbox request is sent to the Global administrators and Power Platform administrators for approval. More information: [Review a lockbox request](#review-a-lockbox-request). 
 
All updates to a lockbox request are recorded and made available to your organization as audit logs. More information: [Audit lockbox requests](#audit-lockbox-requests). 
 
Power Platform applications and services store customer data in several Azure storage technologies. When you turn on Customer Lockbox for an environment, customer data associated with the respective environment is protected by the lockbox policy, irrespective of the storage type.  
 
> [!NOTE]
> Currently, the applications and services where lockbox policy is going to be enforced once enabled are Power Apps (including AI Builder, Power Apps portals), Power Automate, and Dataverse.

## Workflow 

1. Your organization has an issue with Microsoft Power Platform and opens a support request with Microsoft Support. Alternatively, Microsoft proactively identifies a problem (for example, a proactive notification is triggered) and a Microsoft-initiated event is opened to investigate and mitigate or fix the root cause. 

2. A Microsoft operator reviews the support request/event and attempts to troubleshoot the issue by using standard tools and telemetry. If access to customer data is needed for further troubleshooting, a Microsoft engineer triggers an internal approval process for access to customer data, irrespective of lockbox policy being enabled or not.

3. In addition, a lockbox request is generated if the respective data store is associated with an environment protected according to the lockbox policy enablement. An email notification is sent to the designated approvers (Global administrators and Power Platform administrators) about the pending data access request from Microsoft.  

   > [!IMPORTANT]
   > The Microsoft engineer won’t be able to proceed with their investigation until the lockbox request is approved by the customer. This could cause delays in addressing the support ticket or prolonged outages. Make sure you monitor email notifications and/or lockbox requests in the Power Platform admin center and respond in a timely manner to avoid service interruptions.   

   :::image type="content" source="media/lockbox-request.png" alt-text="A sample lockbox request.":::

4. The approver signs into the Power Platform admin center and approves the request. If the request is rejected or not approved within 4 days, it expires, and no access is granted to the Microsoft engineer. 

5. After the approver from your organization approves the request, the Microsoft engineer obtains the elevated permissions that were initially requested and fixes your issue. Microsoft engineers have a set amount of time - 8 hours - to fix the issue, after which access is automatically revoked. 

## Enable the lockbox policy

Global administrators or Power Platform administrators can create or update the lockbox policy in the Power Platform admin center. For the duration of the preview, enabling the tenant level policy will apply to all environments in the tenant. It may take up to 24 hours for all data sources and all environments to be implemented with Customer Lockbox. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select **Policies** > **Lockbox policy (preview)**.

3. Set **Lockbox policy (preview)** to **On**.

   :::image type="content" source="media/lockbox-turn-on.png" alt-text="Turn on the lockbox policy.":::

## Review a lockbox request

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select **Policies** > **Customer Lockbox (preview)**.

3. Review the request details.

   |Field  |Description  |
   |---------|---------|
   |Support request ID     | The ID of the support ticket associated with the lockbox request. If the request is a result of Microsoft-initiated internal alert, the value will be “Microsoft initiated”.|
   |Environment     | The display name of the environment in which data access is being requested.         |
   |Status     | The status of the lockbox request. <br /> <ul><li>**Action needed**: Pending approval from the customer</li><li>**Expired**: No approval received from the customer </li><li>**Approved**: Approved by the customer </li><li>**Denied**: Denied by the customer</li></ul>        |
   |Requested     | The time at which the Microsoft engineer requested access to customer data in customer’s environment.      |
   |Request expiration     | The time by which the customer needs to approve the lockbox request. The status of the request will change to **Expired** if no approval is given by this time.         |
   |Access period     | The length of time the requestor wants to access customer data. This value is by default 8 hours and can't be changed.         |
   |Access expiration     | If access is granted, this is the time until which the Microsoft engineer has access to customer data.   |

4. Select a lockbox request, and then select **Approve** or **Deny**.

   > [!div class="mx-imgBorder"] 
   > ![Approve or deny lockbox requests](media/lockbox-requests.png "Approve or deny lockbox requests")

   > [!NOTE]
   > The lockbox requests that have occurred in the past 28 days are displayed in the **Recent** table.
   > 
   > Once a request is approved, it cannot be revoked for the entire duration of the access period of 8 hours. 

## Audit lockbox requests

Actions related to accepting, denying, or expiration of a lockbox request are recorded automatically in [Microsoft 365 Defender](https://security.microsoft.com/homepage).  

:::image type="content" source="media/lockbox-defender.png" alt-text="Microsoft 365 Defender page.":::

Audit traces include these and other fields for each lockbox request: 

- Unique identifier for the request 
- Request creation time 
- Organization ID 
- User ID – unique identifier for the Microsoft operator performing the request 
- Request status 
- Associated support ticket ID 
- Request expiration time 
- Data access expiration time 
- Environment ID 
- Request justification 

The Microsoft 365 **Audit** tab allows admins to search for events associated with lockbox sessions. View the **Power Platform Lockbox** category for Power Platform related lockbox events. 

:::image type="content" source="media/lockbox-select-power-platform.png" alt-text="Select the Power Platform lockbox category.":::

Admins can directly export the result set based on the filter criteria.

:::image type="content" source="media/lockbox-audit-search-results.png" alt-text="Lockbox audit search results.":::

## Exclusions

Lockbox requests aren't triggered in the following engineering support scenarios:

- Emergency scenarios that fall outside of standard operating procedures, such as a major service outage that requires immediate attention to recover or restore services in unexpected or unpredictable cases. These “break glass” events are rare and, in most instances, do not require any access to customer data to resolve. 

- A Microsoft engineer accesses the underlying platform as part of troubleshooting and is inadvertently exposed to customer data. It is rare that such scenarios would result in access to meaningful quantities of customer data.  

Customer Lockbox requests are also not triggered by external legal demands for data. For details, see the discussion of government requests for data in the [Microsoft Trust Center](https://www.microsoft.com/trust-center/). 

## Known issues

- The consent process for creating a support instance and support user access isn't integrated with Customer Lockbox. Once the support instance is created after initial customer consent, a support engineer with support user permissions will have access to the data stored in the support instance for troubleshooting purposes. 

- Customer Lockbox Preview is not available in sovereign clouds at this time. 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
