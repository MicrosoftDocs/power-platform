---
title: "Power Platform Lockbox | MicrosoftDocs"
description: Power Platform Lockbox 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/28/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Power Platform Lockbox 

Power Platform Lockbox provides an interface for customers to review and approve or reject customer data access requests. It is used in cases where a Microsoft engineer needs to access customer data during a support request.

This article covers how Power Platform Lockbox requests are initiated, tracked, and stored for later reviews and audits.

## Things to note

Be aware of the following regarding Power Platform Lockbox.

- We only protect Data Flex Pro databases.
- There are emergency scenarios where Power Platform Lockbox can be circumvented. See [Exclusions](#exclusions).
- Users can act upon requests for environments they don't have access to.
- For Private Preview: Copying an environment with data protected with Power Platform Lockbox to another environment results in the data in the environment copied to no longer being protected with Power Platform Lockbox.

## Workflow

1. Your organization has an issue with Power Platform requiring opening a support request with Microsoft Support.

2. A Microsoft support engineer reviews the service request and determines a need to access the organization's tenant to repair the issue.

3. The Microsoft support engineer logs into the Power Platform Lockbox request tool and makes a data access request that includes the organization's tenant name, service request number, and the estimated time the engineer needs access to the data.

4. After a Microsoft Support manager approves the request, Power Platform Lockbox sends the designated approver at your organization an email notification about the pending access request from Microsoft.

   [screenshot needed]

   Anyone who is assigned the Power Platform Lockbox access approver admin role in the Power Platform admin center can approve Power Platform Lockbox requests.

5. The approver signs in to the Power Platform admin center and approves the request. This step triggers the creation of an audit record available by searching the audit log. For more information, see Auditing Customer Lockbox requests.

   If you reject the request or don't approve the request within 12 hours, the request expires and no access is granted to the Microsoft engineer.

> [!IMPORTANT]
> Microsoft does not include any links in Power Platform Lockbox email notifications requiring you to sign in to the Power Platform admin center.

6. After the approver from your organization approves the request, the Microsoft engineer receives the approval message, logs into the tenant, and fixes the customer's issue. Microsoft engineers have the requested duration to fix the issue after which the access is automatically revoked.

   > [!NOTE]
   > All actions performed by a Microsoft engineer are logged in the audit log. You can search for and review these audit records.

## Turn Power Platform Lockbox request on or off

1. Sign in to the Power Platform admin center. 

2. Select **Lockbox policy**.

3. Specify settings.
   
   |Setting  |Description  |
   |---------|---------|
   |All Power BI workspaces     |  Select this to... [need info]       |
   |Environments with a database     | Select this to... [need info]. The following options are then displayed: <br />**All environments** [need info] <br /> **Some environments** [need info]      |

   > [!div class="mx-imgBorder"] 
   > ![Turn Lockbox on or off](media/lockbox-turn-on.png "Turn Lockbox on or off")

## Approve or deny a Power Platform Lockbox request

1. Sign in to the Power Platform admin center. 

2. Select **Help + Support** > **Lockbox requests**.

3. Review the request details.

   |Field  |Description  |
   |---------|---------|
   |Support request ID     |         |
   |Environment     |         |
   |Status     |         |
   |Requested     |         |
   |Request expiration     |         |
   |Access period     |         |
   |Access expiration     |         |
   |Admin     |         |

3. Select a Lockbox request, and then choose **Approve** or **Deny**.
   > [!div class="mx-imgBorder"] 
   > ![Approve or deny Lockbox requests](media/lockbox-requests.png "Approve or deny Lockbox requests")

## Auditing Power Platform Lockbox requests

Audit records that correspond to Lockbox requests are logged in SQL audit logs. You can access these logs by using **Export Analytics Data**. Actions related to a accepting or denying a Lockbox request and actions performed by Microsoft engineers (when access requests are approved) are also logged in the SQL audit logs. You can search for and review these audit records.

[screenshot of example SQL audit log data]

To export SQL audit logs to my organization's [Azure data lake](https://docs.microsoft.com/azure/architecture/data-guide/scenarios/data-lake):

1. Sign in to the Power Platform admin center. 

2. Select **Export Analytics Data (preview)**

3. Select **Select analytics data** > **SQL audit logs**.

   > [!div class="mx-imgBorder"] 
   > ![Export SQL audit logs](media/lockbox-data-export-sql-audit-logs.png "Export SQL audit logs")

4. Enter Data Lake details, and then select **Create**.

   |Field  |Description  |
   |---------|---------|
   |Subscription     |         |
   |Resource group     |         |
   |Storage account     |         |

   > [!div class="mx-imgBorder"] 
   > ![Enter Data Lake details](media/lockbox-enter-data-lake-details.png "Enter Data Lake details")

Your export will appear in the list under the **Data Lake** tab.

> [!div class="mx-imgBorder"] 
> ![Data export list](media/lockbox-data-export-success.png "Data export list")

## Exclusions

Power Platform Lockbox requests aren't triggered in the following engineering support scenarios:

- A Microsoft engineer needs to do an activity that falls outside of standard operating procedures. For example, to recover or restore services in unexpected or unpredictable scenarios.

- A Microsoft engineer accesses the Power Platform as part of troubleshooting and inadvertently has access to customer data. For example, 

  [need info]

- If the support engineer can't troubleshoot the issue by using standard tools and telemetry, the next step is to request elevated permissions by using a Just-In-Time (JIT) access service. This request can be from the original support engineer. Or, it can be from a different engineer because the problem is escalated.

After the access request is submitted by the Azure Engineer, Just-In-Time service evaluates the request taking into account factors such as:

The scope of the resource
Whether the requester is an isolated identity or using multi-factor authentication
Permissions levels
Based on the JIT rule, this request may also include an approval from Internal Microsoft Approvers. For example, the approver might be the Customer support lead or the DevOps Manager.

When the request requires direct access to customer data, a Customer Lockbox request is initiated. For example, remote desktop access to a customer's virtual machine.

The request is now in a Customer Notified state, waiting for the customer's approval before granting access.

At the customer organization, the user who has the Owner role for the Azure subscription receives an email from Microsoft, to notify them about the pending access request. For Customer Lockbox requests, this person is the designated approver.

Example email:














If you have an issue that requires Microsoft support to access your data, you can use Power Platform Lockbox to approve or reject data access requests from Microsoft. With Lockbox, you can:
1. Create data-access polices
2. Approve or reject data access requests

## Create and enable Lockbox policies

Tenant admins can create or update the Lockbox policies,

To enable Lockbox policy, tenant admins need to login to the admin portal and enable Lockbox policy for all environments or for some environments.





> [!NOTE]
> If you enable the Lockbox feature for your organization, every data access by Microsoft will be regulated and will require an explicit approval from the designated approver in your organization​