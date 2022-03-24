---
title: "Customer lockbox for Microsoft Power Platform (preview) | MicrosoftDocs"
description: This topic covers lockbox for Power Platform.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/11/2021
author: jimholtz
ms.author: miferlan
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Customer lockbox for Microsoft Power Platform (preview)

<!-- This topic should not go live until told to by PM -->

This article covers how to enable Customer Lockbox and how Lockbox requests are initiated, tracked, and stored for later reviews and audits. 

## Summary

You can configure Lockbox for your data sources within your tenant. For the duration of the preview, enabling Customer Lockbox will apply to all environments in the respective tenant. Global administrators and Power Platform administrators can configure the lockbox policy. 

More information: [Configure the lockbox policy](#configure-the-lockbox-policy).

> [!NOTE]
> For now, this capability can be enabled for your tenant by opening a [support case](get-help-support.md) and providing the details of your tenant ID. In the rare circumstances when Microsoft attempts to access customer data that's stored within Power Platform (i.e., Dataverse), a lockbox request is sent to the global administrators and Power Platform administrator for approval. More information: [Review a lockbox request](#review-a-lockbox-request). All updates to a customer lockbox request are recorded and made available to your organization as audit logs. More information: [Audit lockbox requests](#audit-lockbox-requests). 
> 
> Power Platform applications and services store customer data in several Azure storage technologies. When you turn on Lockbox for an environment, customer data associated with the respective environment is protected by the Lockbox policy, irrespective of the storage type.  
> 
> At this time, the applications and services Lockbox compliant are Power Apps, Power Automate, AI Builder and Dataverse (all storage types). 

## Workflow 

1. Your organization has an issue with Microsoft Power Platform, and opens a support request with Microsoft Support. Alternatively, a proactive notification is triggered and an internal incident is open to investigate and mitigate or fix the root cause. 

2. A Microsoft operator reviews the support request/incident and attempts to troubleshoot the issue by using standard tools and telemetry. If access to customer data is needed for further troubleshooting, Microsoft engineer triggers an internal approval process for access to customer data, irrespective of customer Lockbox policy is configured. 

3. In addition, a customer lockbox request is generated if the respective data store is associated with an environment protected according to the Lockbox policy configuration. An email notification is sent to the designated approvers (Global Admin and Power Platform Admin) about the pending data access request from Microsoft.  

   > [!IMPORTANT]
   > The Microsoft engineer won’t be able to proceed with their investigation until the Lockbox request is approved by the customer. This may cause delays in addressing the support ticket or prolonged outages. Make sure you are monitoring the email notifications and/or the Lockbox requests in Power Platform admin center and respond in a timely manner to avoid service interruptions.   

   :::image type="content" source="media/lockbox-request.png" alt-text="A sample lockbox request.":::

4. The approver signs into the Power Platform admin center and approves the request. If the request is rejected or it isn't approved within 12 hours, it expires, and no access is granted to the Microsoft engineer. 

5. After the approver from your organization approves the request, the Microsoft engineer obtains the elevated permissions that were initially requested and fixes your issue. Microsoft engineers have a set amount of time -  8 hours - to fix the issue, after which the access is automatically revoked. 

## Configure the lockbox policy

Global administrators or Power Platform administrators can create or update the lockbox policy in the Power Platform admin center. For the duration of the preview, the tenant level policy configuration will apply to all environments in the tenant. It may take up to 24h for all data sources and all environments to be fully protected with customer Lockbox. 

> [!NOTE]
> If your organization has a lockbox policy in place, every data access by Microsoft will be regulated and will require an explicit approval from the designated approvers in your organization.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select **Governance** > **Lockbox policy**.

3. Configure the lockbox policy.

:::image type="content" source="media/lockbox-turn-on.png" alt-text="Turn on the lockbox policy.":::

## Review a lockbox request

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select **Governance** > **Lockbox requests**.

3. Review the request details.

   |Field  |Description  |
   |---------|---------|
   |Support request ID     | The ID of the support ticket associated with the lockbox request. If the incident is generated by an internal alert, the value will be “Microsoft internal”.        |
   |Environment     | The display name of the environment in which data access is being requested.         |
   |Status     | The status of the lockbox request. <br /> <ul><li>**Action needed**: Pending approval from the customer</li><li>**Expired**: No approval received from the customer </li><li>**Approved**: Approved by the customer </li><li>**Denied**: Denied by the customer</li></ul>        |
   |Requested     | The time at which the Microsoft engineer requested access to customer's organization's data.         |
   |Request expiration     | The time by which the customer needs to approve the lockbox request. The status of the request will change to **Expired** if no approval is given by this time.         |
   |Access period     | The approximate length of time the requestor wants to access customer data. This is an estimate, and might change slightly.         |
   |Access expiration     | If access is granted, this is the time until which the Microsoft engineer has access to customer data. It's an estimate and might change slightly.         |

4. Select a lockbox request, and then select **Approve** or **Deny**.

   > [!div class="mx-imgBorder"] 
   > ![Approve or deny lockbox requests](media/lockbox-requests.png "Approve or deny lockbox requests")

> [!NOTE]
> The lockbox requests that have occurred in the past 28 days are displayed in the **Recent** table.
> 
> Once a request is approved, it cannot be revoked for the entire duration of the access period of 8 hours. 

## Audit lockbox requests

Actions related to accepting, denying or expiration of a lockbox request are recorded automatically in [Microsoft 365 Defender](https://security.microsoft.com/homepage).  

:::image type="content" source="media/lockbox-defender.png" alt-text="Microsoft 365 Defender page.":::

Among other information, audit traces include these fields for each Lockbox request: 

- Unique identifier for the request 
- Request creation time 
- Organization ID 
- User ID – unique identifier for the Microsoft operator performing the request 
- Request status 
- Associated support ticket ID 
- Request expiration time 
- Data access expiration time 
- Environment ID and name 
- Request justification 

The Microsoft 365 **Audit** tab allows admins to search for events associated with Lockbox sessions. Look at the **Power Platform Lockbox** category for Power Platform related Lockbox events. 

:::image type="content" source="media/lockbox-select-power-platform.png" alt-text="Select the Power Platform Lockbox category.":::

Admins can directly export the result set based in the filter criteria.

:::image type="content" source="media/lockbox-audit-search-results.png" alt-text="Lockbox audit search results.":::

## Exclusions

Lockbox requests aren't triggered in the following engineering support scenarios:

- Emergency scenarios that fall outside of standard operating procedures such as a major service outage that requires immediate attention to recover or restore services in unexpected or unpredictable cases. These “break glass” events are rare and, in most instances, do not require any access to customer data to resolve. 

- A Microsoft engineer accesses the underlying platform as part of troubleshooting and is inadvertently exposed to customer data. It is rare that such scenarios would result in access to meaningful quantities of customer data.  

Customer Lockbox requests are also not triggered by external legal demands for data. For details, see the discussion of [government requests for data](https://www.microsoft.com/trust-center/) on the Microsoft Trust Center. 

## Known issues

1. The consent process for creating a support instance is not integrated with Lockbox. Once the support instance is created after initial customer consent, support engineer will have access to the data stored in the support instance for troubleshooting purposes. 

2. Customer Lockbox Preview is not available in sovereign clouds at this time. 