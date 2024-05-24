---
title: "Administer the catalog (preview)"
description: "Learn how to administer the catalog for Power Platform after you have finished installing it. Administering the catalog involves setting up users, approving or rejecting submission requests, and other work related to tracking catalog items."
author: derekkwanpm
ms.author: derekkwan
ms.date: 05/23/2024
ms.reviewer: jdaly
ms.topic: article
ms.subservice: developer
search.audienceType:
- developer
contributors:
- JimDaly
---
# Administer the catalog (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Administering the catalog includes the following tasks:

- [Setup the catalog](#setup-the-catalog)
- [Approve and reject submission requests](#approve-and-reject-submission-requests)
- [Review install history](#review-install-history)
- [Review catalog items](#review-catalog-items)
- [Review errors in submission requests](#review-errors-in-submission-requests)
- [Review errors in install requests](#review-errors-in-install-requests)
- [Edit user access](#edit-user-access)

## Access controls 

The Catalog has a separate set of access controls from Power Platform. This means makers in a given environment do not automatically get permissions to publish and acquire items from the Catalog. There are four access roles: 

1. Catalog Submitter: Users with this role can submit items to the catalog. 
2. Catalog Read-Only Member: Users with this role can discover and install items from the catalog 
3. Catalog Approver: Users with this role can approve submissions to the catalog. Catalog approvers can be users from your central IT department or Line of Business that your organization wants to empower to participate in the approvals process. 
4. Catalog Administrator: Users with this role can administer the catalog. 

Any environment that has a Catalog will see these roles inside of Power Platform Admin Center, and can be [assigned to groups or individuals](https://learn.microsoft.com/en-us/power-platform/admin/security-roles-privileges) just like any other roles. 

Power Platform admins and system customizers will already have full access to the Catalog. However, **do not** use assign these roles for generally managing catalog access, and instead use one of the roles from above. 

## Setup the catalog

Before you can administer the catalog, you must install and configure it. Most organizations will be fine with just one catalog in their tenant (all environments in a tenant can install catalog items from a single catalog). But some orgs may want to have different catalogs for geos, departments, etc. The choice is yours. 

To set up a catalog, go to the [Power Platform Admin Center (PPAC)](https://learn.microsoft.com/en-us/power-platform/admin/admin-documentation) for your tenant, and look for the "Catalogs" page under "Resources":

[Catalog PPAC admin](power-platform/developer/media/admin_catalog.png)

Clicking "New catalog" in the top menu or in the page itself will bring up a setup wizard

1. Step 1 (Setup)
   2. Name - enter a name for the catalog
   3. Language - set the language for your users of the catalog
   4. Description - add some details that will help others understand what this catalog is for
   5. Region - what region this catalog is for, which will filter the available environments
   6. Environment - which environment in your tenant you want the catalog to be installed for (ensure some environments have been set up for you to select)
   7. Status - uncheck this box if you want the catalog inactive after setting up
2. Step 2 (Catalog administrators)
   1. Select up to 10 AAD groups who can administer the catalog (ensure you have created some AAD groups for your users). 
3. Step 3 (Approvers)
   1. By default, catalog item submissions must be approved by an aprover or admin. Check the box if you want your tenant to allow submissions to be auto-approved.
   2. Select up to 10 AAD groups who can approve catalog items before they are submitted into the catalog (see below for how to approve catalog items)
4. Step 4 (Submitters)
   1. Select up to 10 AAD groups who can submit catalog items to the catalog
5. Step 5 (Consumers)
   1. Select up to 10 AAD groups who can view and install catalog items from the catalog
6. Step 6 (Categories)
   1. Select which business categories you would like to allow makers to use when submitting catalog items. These categories will also show up in the filters for the discover page to help makers find the catalog items they want. You can also add your own business categories as well.
7. Step 7 (Review)
   1. This last step summarizes everything you just set up. If everything looks good, you can click the "terms and conditions" link to review the T&Cs, and if agreeable, just check the box and click "Create catalog" to finish setup
  
You can add more catalogs to your tenant at any time by going through this wizard again and selecting a different environment to create a new catalog. 

After the process is complete, you can access the Power Platform Catalog Manager from the same Catalogs screen under Resources in PPAC, or in the Apps screen inside of Power Apps. The Power Platform Catalog Manager is where you can perform all your administrative tasks. The below sections are all performed inside the Power Platform Catalog Manager.

## Approve and reject submission requests

Environment admins and users with the Catalog Approver role can review new submissions and approve or decline requests. If global auto approval or publisher level auto approval is turned on, then there's no requirement for manual review and approval. More information: [Enable Auto Approval](catalog.md#enable-auto-approval)

In the **Approvals** section of the navigation pane, select **Requests**.
This list has 16 views. The most important ones are:

|View |Description  |
|---------|---------|
|**Active Approval Requests** (Default)|Use this view to review submission requests pending approval|
|**All Approval Request**|Use this view to review all requests across all statuses|
|**Failed Pre-Validation**|Use this view to identify requests where a submitter has sent a request but it isn't available in the **Active Approval Requests** view. This view can help with troubleshooting such scenarios.|
|**Approved Approval Request**|Use this view to review previously approved requests|

Using the **Active Approval Requests** view, open a request and select **Resolve Request** in the menu.

- Select **Reject Request** to decline the request. The request is archived and publisher, item and asset aren't created.
- Select **Complete Request** to approve. Upon approval, Publisher, Item and Assets be created. The request is archived to **Inactive** status.

## Review install history

In the **Deployment History** section of the navigation pane, select **Install History** to view a list of installations that were requested from the catalog.

This list has two views:

- **Active Install Histories** (Default)
- **Inactive Install Histories**

## Review catalog items

In the **Catalog** section of the navigation pane, select **Catalog Items** to view a list of catalog items that are available in the catalog

This list has five views:

- **Active Catalog Items**
- **Catalog Items - Publisher View**
- **Inactive Applications** An inactive item can be reactivated, but a deleted item can't be reinstated. Disabled items don't feature in discovery and list command response.
- **Pending Approval**
- **Published** (Default) This view shows the most recent version of the item.

These views show the following columns:

|Column|Description|
|---------|---------|
|**Name (Publishers)** |Name of the publisher|
|**Name**|Display Name|
|**Catalog Item Id**|ID provided by publisher|
|**Engineering Contact**|The engineering contact|
|**Status Reason**|The reason for the status of the item. Options: <br /> - **Active**<br /> - **Published**<br /> - **Pending Approval**<br /> - **Inactive**<br /> - **Rejected**|
|**Modified On**|When the item was last modified|
|**Modified By**|Who last modified the item|

You can also view this data using the [pac catalog list](cli/reference/catalog.md#pac-catalog-list) command. More information: [View items in the catalog](submit-catalog-items.md#view-items-in-the-catalog)

### Review catalog publishers

In the **Catalog** section of the navigation pane, select **Catalog Publishers** to view a list of publishers associated to catalog items.

This list has two views:

- **Active Publishers**
- **Inactive Publishers**

Catalog publishers have the following default columns:

|Display Name|Description|
|-----|-----|
|**Name**|The name of the publisher.|
|**Publisher ID**|ID provided by item submitter|
|**Description**|A description of the publisher|
|**Status Reason**|Reason for the status of the Publisher<br />Choices:<br /> - **Active**<br /> - **Published**<br /> - **Pending Approval**<br /> - **Inactive**<br />|
|**Allow Auto-Approval**|By enabling auto approval at the Publisher level, future submissions from this publisher are auto approved. Admins can use this strategy in scenarios where there's a trusted party within their organization that they trust implicitly and don't require approvals from. Also, auto approval can be turned on globally across all publishers here. More information: [Enable Auto Approval](catalog.md#enable-auto-approval)

### Review packages and solutions of items in catalog

In the **Catalog** section of the navigation pane, select **Packages Assets** to view a list of underlying artifacts associated to a catalog item that includes the package and solution details.

This list 8 views:

- **Active Packages Assets**
- **Inactive Packages**
- **Packages Assets**
- **Packages Assets - Available**
- **Packages Assets - Not Available**
- **Packages Assets - Pending Approval**
- **Packages Assets - Published** (Default)
- **Packages Assets in Submission**

The following table describes selected fields that can be included in the form:

The following information is available about the **Package**:

|Field |Description|
|---------|---------|
|**UniqueName**|Package Unique Name|
|**Version**|Package Version|
|**Status Reason**|Current Status Choices:<br /> - **Pending Approval**<br /> - **Published**<br /> - **Rejected**<br />|
|**Package ID**|Package Identifier|
|**Locale Identifier (LCID)**|Identifier for localized package|
|**Localized Name**|Name in localized language|
|**Description**|Description in localized language|
|**Notes**|Timeline section has notes with details for actions on asset|
|**Revision Of**|This field is populated when a new approval request contains a reference to an existing package version that has previously been made available|
|**Modified On**|Date last modified|
|**Modified By**|Modified By User|
|**Created On**|Date created|

#### Package and content information

|Field |Description|
|---------|---------|
|**Package File**|Package Deployer package file comprised of catalog item contents|
|**Package Manifest File**|Package Manifest file (.json)|
|**Contained Solutions and Components**|This information is for reference only and being revised. A planned update will enable a streamlined view of this data|

## Review errors in submission requests

In the **Approvals** section of the navigation pane, select **Failed Pre-Validation** to view a list of errors associated to a submission in the **Catalog Manager** application.

1. Select on the request name that you want to investigate.
1. In the **Timeline** card, you can find the exception in the **Notes**.

   :::image type="content" source="media/failed-pre-validation-exception-ui.png" alt-text="The exception in the notes of the Timeline card.":::

After fixing the submission, trigger the submit again from PAC CLI. You see a new request that can be approved.

## Review errors in install requests

In the **Deployment History** section of the navigation pane, select **Install History** to view a list of errors associated to an install.

Select on the failed request name to get more information.

## Edit user access

After the catalog is set up, you may want to add, edit, or remove user access. This can be done in PPAC for any environment where you have setup the catalog. You will see a new set of roles in the security roles list"

![Catalog security roles](power-platform/developer/media/catalog-roles.png)

More information: [Assign a security role to a user](../admin/assign-security-roles.md) and [Manage the security roles of a team](../admin/manage-teams.md#manage-the-security-roles-of-a-team).

### See also

[Catalog in Power Platform (Preview)](catalog.md)<br />
[View, submit, and install catalog items  (Preview)](submit-catalog-items.md)
