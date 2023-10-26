---
title: Configure security groups
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
ms.topic: how-to
ms.date: 10/26/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Set up access control lists in Microsoft Entra ID

Users only need access to the apps and flows that align to their departmental function. You can create Microsoft Entra ID (Azure AD) security groups based on business processes and assign team members to the appropriate groups. The security groups control user access to the apps and visibility to the various components within the apps.

## Create Entra ID security groups

The following deployment model illustrates how you assign users to different Entra ID (Azure AD) security groups based on their departmental function.

### Admin security group

Set up one or more administrators to an SAP Procurement Admin team.

### Functional security groups

The security groups can align to specific business processes. Assign all of the users who participate in the procure-to-pay process to one or more of the six different user teams:

- Vendor management
- Purchase requisitions
- Purchase orders
- Vendor goods receipts
- Vendor invoice
- Vendor payments

This model is used throughout the rest of this document to show intent but your configuration may differ based upon your requirements.

More information:

- [Learn about groups and access rights in Microsoft Entra](/entra/fundamentals/concept-learn-about-groups)
- [Teams (including group teams)](/power-platform/admin/wp-security-cds#teams-including-group-teams)

## Create Dataverse group teams

Admins manage the [menu items](apply-seed-data.md#manage-menu-options) visible to users in the canvas apps directly in the SAP Administrator app. [Dataverse group team](/power-platform/admin/manage-group-teams) membership controls access and visibility to the menu items. Entra ID (Azure AD) security groups govern Dataverse group team membership and ensure one of two options:

- Users have visibility and access to appropriate menu items in the canvas apps when they are added to one or more security groups.
- Users lose visibility and access when they are removed from a security group.

Additionally, menu visibility drives the _drill through_ behavior on certain fields in the canvas apps. For example, if a user is not part of the purchase orders team, then they can only view the associated purchase order number to the requisition in the SAP Requisition Management app. They can't drill through to see all the purchase order details.

More information: [Work with Microsoft Entra ID group teams](/power-apps/developer/data-platform/aad-group-team)

### Get started managing teams

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Go to **Environments** and select the environment that contains the solutions.
1. Go to **Settings** > **Users** + **permissions** > **Teams**.
1. Select **+ Create Team**.
1. Complete the required fields. For _Team type_, select **Entra ID (Azure AD) Security Group**. You'll also be required to complete _Group name_ and _Membership type_.
1. Search for the example security group previously created in Entra ID (Azure AD) and associate it to the newly created _group team_.
1. Assign security roles to teams that correspond to team functions.

### Security role guidance

The following table provides guidance for assigning security roles:

| Dataverse Team Name | SAP Template User | SAP Template Administrator | Basic User
| ----------- | ----------- | ----------- | ----------- |
| Vendor management | X | | X |
| Purchase requisitions  | X | | X |
| Purchase orders  | X | | X |
| Vendor goods receipt  | X | | X |
| Vendor invoice  | X | | X |
| Vendor payments | X | | X|
| Admin |  | X | X |

> [!NOTE]
>
> - Users are added to or removed from a group team based on their membership to the linked Entra ID security group.
> - Access to Dataverse data is governed by team membership with access levels differentiated between SAP integration user and SAP integration admin security role assignments to the teams.
> - The Dataverse group team setup in the Power Platform admin center can also be seen in the SAP Admin app for reference.

More information:

- [Manage group teams](/power-platform/admin/manage-group-teams)
- [Security roles and privileges](/power-platform/admin/security-roles-privileges)

## Share access to the apps and flows

Security group members can only access apps and flows that are shared with them. Use the security groups model as an example to help you set up security groups for your organization.

Share the flows with _Run only privileges_ so users have access to embedded flows and the SAP ERP, Dataverse, and Office 365 connector user services use the triggering user's credentials.

> [!WARNING]
> Failure to change the **Read Only** privileges of the flows will prevent the connector services from passing user credentials. Sharing of Dataverse and Office 365 connections should be limited.

### Steps to share apps

1. Go to the individual apps in Power Apps.
1. Select the **Share** option.
1. Search for and select the appropriate _security group_ that contains the members who need to access that app.
1. Select **Share**. You can also choose whether or not to include an email invitation (not required).

### Steps to share flows

1. Go to the individual cloud flows in Power Apps.
1. Go to the _Run only users_ section and select **Edit**.
1. Invite _system users_ and _teams_ by searching for and selecting the Entra ID (Azure AD) security groups that need access to the flow according to the Power Apps that that team needs to use.
1. For all three _connections used_, select the **Provided by run-only end user** option.
1. Select **Save**.

### Sharing summary

This table provides a mapping summary of what components need to be assigned or shared according to the example Entra ID (Azure AD) security group teams.

|             Component             | Type | Vendor management team | Purchase requisitions team | Purchase orders team | Vendor goods receipt team | Vendor invoice team | Vendor payments team | Admin team |
|:---------------------------------:|:----:|:----------------------:|:--------------------------:|:--------------------:|:-------------------------:|:-------------------:|:--------------------:|:------------------:|
| SAP Vendor Management             |  app |            X           |                            |                      |                           |                     |                      |                    |
| SAP Purchase Requisitions         |  app |                        |              X             |                      |                           |                     |                      |                    |
| SAP Purchase Orders               |  app |                        |                            |           X          |                           |                     |                      |                    |
| SAP Goods Receipts                |  app |                        |                            |                      |             X             |                     |                      |                    |
| SAP Vendor Invoice                |  app |                        |                            |                      |                           |          X          |                      |                    |
| SAP Vendor Payments               |  app |                        |                            |                      |                           |                     |           X          |                    |
| SAP Template Administrator        |  app |                        |                            |                      |                           |                     |                      |          X         |
| ApprovePurchaseOrder              | flow |                        |                            |           X          |                           |                     |                      |                    |
| ApproveVendorInvoice              | flow |                        |                            |                      |                           |          X          |                      |                    |
| ConvertRequisitionToPurchaseOrder | flow |                        |                            |           X          |                           |                     |                      |                    |
| CreateGoodsReceipt                | flow |                        |                            |                      |             X             |                     |                      |                    |
| CreatePurchaseOrder               | flow |                        |                            |           X          |                           |                     |                      |                    |
| CreateRequisition                 | flow |                        |              X             |                      |                           |                     |                      |                    |
| CreateVendor                      | flow |            X           |                            |                      |                           |                     |                      |                    |
| CreateVendorInvoice               | flow |                        |                            |                      |                           |          X          |                      |                    |
| ReadGLAccount                     | flow |            X           |                            |                      |                           |          X          |           X          |                    |
| ReadGLAccountList                 | flow |            X           |                            |                      |                           |          X          |           X          |                    |
| ReadGoodsReceipt                  | flow |            X           |                            |           X          |             X             |                     |                      |                    |
| ReadGoodsReceiptList              | flow |            X           |                            |           X          |             X             |                     |                      |                    |
| ReadMaterial                      | flow |            X           |              X             |           X          |             X             |          X          |           X          |                    |
| ReadMaterialList                  | flow |            X           |              X             |           X          |             X             |          X          |           X          |                    |
| ReadPurchaseOrder                 | flow |            X           |                            |           X          |             X             |          X          |                      |                    |
| ReadPurchaseOrderList             | flow |            X           |                            |           X          |             X             |          X          |                      |                    |
| ReadRequisition                   | flow |            X           |              X             |           X          |                           |                     |                      |                    |
| ReadRequisitionList               | flow |            X           |              X             |           X          |                           |                     |                      |                    |
| ReadVendor                        | flow |            X           |              X             |           X          |             X             |          X          |           X          |                    |
| ReadVendorInvoice                 | flow |            X           |                            |           X          |                           |          X          |           X          |                    |
| ReadVendorInvoiceList             | flow |            X           |                            |           X          |                           |          X          |           X          |                    |
| ReadVendorList                    | flow |            X           |              X             |           X          |             X             |          X          |           X          |                    |
| ReadVendorPayment                 | flow |            X           |                            |           X          |                           |                     |           X          |                    |
| ReadVendorPaymentList             | flow |            X           |                            |           X          |                           |                     |           X          |                    |
| ReverseVendorInvoice              | flow |                        |                            |           X          |                           |                     |                      |                    |
| UpdatePurchaseOrder               | flow |                        |                            |           X          |                           |                     |                      |                    |
| UpdateVendor                      | flow |            X           |                            |                      |                           |                     |                      |                    |
| UpdateVendorInvoice               | flow |                        |                            |                      |                           |          X          |                      |                    |
|                                   |      |                        |                            |                      |                           |                     |                      |                    |

More information:

- [Share Canvas App](/power-apps/maker/canvas-apps/share-app)
- [Share Model App](/power-apps/maker/model-driven-apps/share-model-driven-app)
- [Share Cloud Flows](/power-automate/create-team-flows)

### Next steps

[Apply seed data](apply-seed-data.md)

### See also

[Get started with the SAP Procurement template](get-started.md)
