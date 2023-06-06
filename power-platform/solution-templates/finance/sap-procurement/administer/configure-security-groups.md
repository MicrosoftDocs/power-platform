---
title: Configure security groups (preview)
description: Learn how to set up security groups for enterprise-scale solutions on Microsoft Power Platform.
author: tverhasselt
ms.author: thoverh
contributors:
  - jongilman88
  - microsoft-george
  - robinsonshields
  - EllenWehrle
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 06/05/2023
ms.custom: bap-template
---

# Set up access control lists in Azure Active Directory (preview)

[This article is prerelease documentation and is subject to change.]

Users only need access to the apps and flows that align to their departmental function. You can create Azure Active Directory (AD) security groups based on business processes and assign team members to the appropriate groups. The security groups help you to control user access to the apps and visibility to the various components within the apps.

## Create Azure Active Directory security groups

The following deployment model illustrates how users can be assigned to different Azure AD security groups based on department function.

### Admin security group

Set up one or more administrators to a SAP Procurement Admin team.

### Functional security groups

The security groups can align to specific business processes. Assign all of the users who participate in the procure-to-pay process to one or more of the three different user teams.

- Vendor management team
- Purchase requisitions team
- Purchase orders team

This model is used throughout the rest of this document to show intent but your configuration may differ based upon your requirements.

More information:

- [Azure Active Directory groups and group membership](/azure/active-directory/fundamentals/concept-learn-about-groups)
- [Teams (including group teams)](/power-platform/admin/wp-security-cds#teams-including-group-teams)

## Create Dataverse group teams

The [menu items](apply-seed-data.md#manage-menu-options) visible to users in the canvas apps are managed by admins directly in the SAP Administrator app. Access and visibility to those menu items is controlled by [Dataverse group team](/power-platform/admin/manage-group-teams) membership. Dataverse group team membership is governed by the associated [AAD security group](#create-azure-active-directory-security-groups) and ensures one of two options:

- Users have visibility and access to the appropriate menu items in the canvas apps when they are added to the security group.
- Users lose visibility and access when they are removed from the security group.

Additionally, menu visibility drives the _drill through_ behavior on certain fields in the canvas apps. For example, if a user is not part of the purchase orders team, then they can only view the associated purchase order number to the requisition in the SAP Requisition Management app. They can't drill through to see all the purchase order details.

More information:

- [Work with Azure Active Directory group teams](/power-apps/developer/data-platform/aad-group-team)

### Get started managing teams

1. Sign in to the  [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Go to **Environments** and select the environment that contains the solutions.
1. Go to **Settings** > **Users** + **permissions** > **Teams**
1. Select **+ Create Team**
1. Complete the required fields. For _Team type_, select **AAD Security Group**. You will also be required to complete _Group name_ and _Membership type_.
1. Search for the example security group previously created in AAD and associate it to the newly created _group team_.
1. Assign security roles to teams that correspond to team functions.

### Security role guidance

The following table provides guidance for assigning security roles:

| Dataverse Team Name | SAP Template User | SAP Template Administrator | Basic User
| ----------- | ----------- | ----------- | ----------- |
| Vendor Management Team | X | | X |
| Purchase Requisitions Team | X | | X |
| Purchase Orders Team | X | | X |
| Admin Team |  | X | X |

> [!NOTE]
>
> - Users are added or removed to a group team based on their membership to the linked AAD security group.
> - Access to Dataverse data is governed by team membership with access levels differentiated between SAP integration user and SAP integration admin security role assignments to the teams.
> - The Dataverse group team setup in the Power Platform admin center can also be seen in the SAP Admin app for reference.

More information:

- [Manage group teams](/power-platform/admin/manage-group-teams)
- [Security roles and privileges](/power-platform/admin/security-roles-privileges)

## Share access to the apps and flows

Share access to the apps and flows using the example AAD security groups created. By sharing the apps with the appropriate security group, members will get access to only those apps.

Share the flows with _Run only privileges_ so users have access to embedded flows and the SAP ERP, Dataverse, and Office 365 connector user services use the triggering user's credentials.

> [!WARNING]
> Failure to change the **Read Only privileges** of the flows will prevent the connector services from passing user credentials. Sharing of Dataverse and Office 365 connections should be limited.

### Steps to share apps

1. Go to the individual apps in the Power Apps portal.
1. Select the **Share** option.
1. Search for and select the appropriate _security group_ that contains the members that need to access that app.
1. Click **Share**. You can also choose whether or not to include an email invitation (not required).

### Steps to share flows

1. Go to the individual cloud flows in the Power Apps portal.
1. Go to _Run only users_ section and select **Edit**.
1. Invite _system users_ and _teams_ by searching for and selecting the AAD security groups that need access to the flow according to the Power Apps that that team needs to use.
1. For all three _connections used_, select the **Provided by run-only end user** option.
1. Click **Save**.

### Sharing summary

The table provides a mapping summary of what components need to be assigned or shared according to the example AAD security group teams.

| Component                         | Type       | Vendor Management Team | Purchase Requisitions Team | Purchase Orders Team |  Administrator Team   |
|-----------------------------------|------------|------------------------|----------------------------|----------------------| ----------------------|
| SAP Vendor Management             | app |            X           |                            |                      |                       |
| SAP Purchase Requisitions         | app |                        |               X            |                      |                       |
| SAP Purchase Orders               | app |            X           |                            |           X          |                       |
| SAP Accelerator Administrator     | app |            X           |                            |                      |           X           |
| ReadVendor                        | flow |            X           |               X            |           X          |                       |
| ReadVendorList                    | flow |            X           |               X            |           X          |                       |
| CreateVendor                      | flow |            X           |                            |                      |                       |
| UpdateVendor                      | flow |            X           |                            |                      |                       |
| ReadGLAccount                     | flow |            X           |                            |                      |                       |
| ReadGLAccountList                 | flow |            X           |                            |                      |                       |
| ReadRequisition                   | flow |                        |               X            |                      |                       |
| ReadRequisitionList               | flow |            X           |               X            |                      |                       |
| ConvertRequisitionToPurchaseOrder | flow |                        |               X            |                      |                       |
| ReadMaterial                      | flow |                        |               X            |           X          |                       |
| ReadMaterialList                  | flow |                        |               X            |           X          |                       |
| ReadPurchaseOrder                 | flow |                        |                            |           X          |                       |
| ReadPurchaseOrderList             | flow |            X           |                            |           X          |                       |
| CreatePurchaseOrder               | flow |                        |                            |           X          |                       |
| UpdatePurchaseOrder               | flow |                        |                            |           X          |                       |
| CreateGoodsReceipt                | flow |                        |                            |           X          |                       |
| ApprovePurchaseOrder              | flow |                        |                            |           X          |                       |

More information:

- [Share Canvas App](/power-apps/maker/canvas-apps/share-app)
- [Share Model App](/power-apps/maker/model-driven-apps/share-model-driven-app)
- [Share Cloud Flows](/power-automate/create-team-flows)

## Next steps

- [Apply seed data](apply-seed-data.md)
- [Monitor errors](monitor-errors.md)

### See also

- [Overview](../overview.md)
- [Get started](get-started.md)
