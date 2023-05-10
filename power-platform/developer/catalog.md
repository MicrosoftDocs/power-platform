---
title: "Catalog components and templates"
description: "Use the catalog in Power Platform to managed shared components and templates so that administrators, application makers, and developers within an organization can leverage each others work."
author: samathur
ms.subservice: developer
ms.author: samathur
ms.date: 05/09/2023
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# Catalog components and templates

Organizations where Developers & Makers build and share components and templates get more value from the Power Platform. Just building is not enough. Sharing power platform artifacts at scale fosters communities and support groups to emerge, incubate and unlock value from diverse set of personnel in an organization.

Successful organizations adopt a *fusion teams* model whereby pro-developers, makers and admins all work together to help their fellow employees derive the highest value possible from the Power Platform.

The catalog in Power Platform enables developers and makers to:

- Crowd-source and find Power Platform templates and code components within their organization easily
- Find and install the latest and authoritative version of a Custom Connector, PCF control, or App & Flow templates among the sprawl of such components built and distributed across many environments
- Get started with templates that provide immediate value including those that connect to their enterprise systems & resources, and utilize organization's themes

For admins and line of business approvers, the catalog:

- Provides a central location, a *single source of truth*, to store and maintain power platform artifacts they can curate and control to accelerate value for Makers and Developers
- Enables approval workflows to enable usage of sanctioned components and templates where a high degree of care is required due to sensitive regulatory and statutory scenarios
- Provides management capabilities with settings and metadata

## Catalog process

<!-- Need to extract these points from the diagram somehow -->

### Create

### Submit

### Approve and Store

### Discover

### Acquire

## Terminology

These terms are important to understand when using the catalog:


|Term|Description|
|---------|---------|
|**Catalog Item**|The unit of interaction with the catalog is called an item. <br /><br /> - What is being submitted to or installed from the catalog. <br /><br /> - Typically, this will be a Dataverse solution or package deployer package. This can contain a fully built application or a template for a power app or flow or power platform code-first component such as a custom connector, PCF control. |
|**Catalog Publisher**|The owning entity of the Application. For example, this can be the human resources IT team or another Line of Business team.<br /><br /> - Comprises of a group of people in an organization that are responsible for managing it's lifecycle. <br /><br /> - Support and engineering contacts can be provided.<br /><br /> - Not to be confused with the Solution Publisher|
|**Submission** |The act of sharing an item involves submitting it to the catalog. This creates a *submission request* in the system.|
|**Submission Request**|The result of a submission. This can be approved or declined. If auto-approval is configured for the catalog no approval is required.|
|**Discovery**|Act of finding items within a catalog by authorized users.|
|**Acquisition**|Act of installing the item to a target environment by a developer.|

## Get started

To get started you need to complete the following:

1. [Install the Catalog Manager application](#install-the-catalog-manager-application)
1. [Configure the catalog](#configure-the-catalog): Configure catalog settings including metadata management and enabling auto-approvals
1. [Administer the catalog](#administer-the-catalog): Perform ongoing catalog administration including Approving new submissions, reviewing submission and install failures

## Install the Catalog Manager application

To start using the catalog, you need to install the **Catalog Manager**application from AppSource.

> [!NOTE]
> Most organizations will only need to install one catalog. While multiple catalogs within a tenant are supported they are for advanced departmental, data residency type scenarios and need to be evaluated in light of your business needs.

### Prerequisites

You must have the following security role assignment and your Dataverse environment must be above the minimum version.

- Security role: You must have the System administrator security role on the environment.
- A Dataverse environment with minimum DB version of `9.2.22122.00148`. You can check the Database version:

   - In the **Admin Center** > **Environment page** > **Version card**.
   - By using the [RetrieveVersion function](xref:Microsoft.Dynamics.CRM.RetrieveVersion) with your browser. Type <br />`https://<your org>.<your region code>.dynamics.com/api/data/v9.2/RetrieveVersion`<br /> in your browser address bar  and view the JSON returned.

### Installation instructions

Here are instructions to install the catalog:

1. Login into [appsource.microsoft.com](https://appsource.microsoft.com/) with your tenant credentials. Click this link:  [https://appsource.microsoft.com/product/dynamics-365/powerappssvc.catalogmanager-preview?flightCodes=dde212e5c66047c59bf2b346c419cef6](https://appsource.microsoft.com/product/dynamics-365/powerappssvc.catalogmanager-preview?flightCodes=dde212e5c66047c59bf2b346c419cef6)

   > [!NOTE]
   > The Catalog Manager application is not enabled for search in appsource at this time. You must use the link above to open it.

1. Click on **Get It Now** to acquire the **Catalog Manager** app. This will redirect you to the Power Platform Admin Center.

   You may be prompted to confirm your details before you are directed to the Admin center.

1. In the Admin Center, you will be asked to **Select an Environment** to install the **Catalog Manager** application.
1. After you agree to the legal terms and privacy statements, click **Install**.

This will request that the application be installed. It will take a few minutes to complete. 

After the installation is complete, the **Catalog Manager** app is available under Maker portal > Apps. Click **Play** to launch the **Catalog Manager** App.

#### Validating successful install of the Catalog Manager application

To verify that the Catalog Manager application installed successfully:

1. In the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/) > Select **Environments**.
1. Select the environment you chose to install the Catalog Manager application.
1. In the **Resources** card, click the **Dynamics 365 apps** link.
1. You should find the **Catalog Manager** app listed with a **Status** of **Installed**.

In [Power Apps](https://make.powerapps.com/), with the environment you selected, you should also be able to find the following solutions:
You should also be able to see the following solutions installed in the Environment where the Catalog Manager application was installed:

- Power Platform catalog service identities
- Power Platform catalog manager
## Configure the catalog

After you have installed the Catalog Manager application, in [Power Apps](https://make.powerapps.com/) locate the application and click **Play** to open the application.

### Configure catalog metadata

1. In the navigation pane, in the **Configuration** group at the bottom, select **Catalog Configuration**.
1. Select **Default Catalog Name** to open the **Catalog Configuration** form.

Here you can set the following configuration values which are particularly important when you have more than one catalog.

|Field  |Description  |
|---------|---------|
|**Catalog Name**|Type a descriptive name for the catalog.|
|**Description**|Type a brief description of the catalog.|
|**Help Link**|Type a URL to a resource for your organization that contains your documentation about using the catalog.|
|**Image**|Upload an image to easily identify the catalog.|

In the **Catalog Configuration** card on the right side, there are two choices you can apply

#### Enable Auto Approval

This is the setting for the entire catalog.

Organizations can take a stance of approved by default or impose an approval process for submissions.

Auto-approval can be enabled at two levels:

- **Catalog as a whole** – This setting. This is to enable the scenario where every submission is auto-approved regardless of publisher.  
- **Publisher** : Navigate to **Catalog Publishers** in Catalog Manager App and turn on for individual Catalog publishers. Use this when there is a trusted group for which no approval is required.

If you choose to enable auto approval for the entire catalog, settings at the publisher level will not apply.

Even with auto-approval, submission requests that get auto-approved can are available to be viewed within the Catalog Manager app. They can be viewed under **Requests** using the **All Approval Request**view. More information: [Approve & Reject submission requests](#approve--reject-submission-requests)


#### Enable Unmanaged Solutions

This setting is enabled by default. You must enable this setting if you want to use the deployment mode of **Template**. More information: TODO x-ref Submission >Deployment 

You can choose to allow disallow sharing of unmanaged solutions via the catalog. 
<!-- Why would someone want to do this? -->

## Administer the catalog

Administering the catalog includes the following:

- [Setup Users](#setup-users)
- [Approve & Reject submission requests](#approve--reject-submission-requests)
- [Review Install history](#review-install-history)
- [Review Catalog Items](#review-catalog-items)
- [Review errors in submission requests](#review-errors-in-submission-requests)
- [Review errors in install requests](#review-errors-in-install-requests)

### Setup Users

The Catalog Manager application provides the following security roles you can associate to users, AAD groups, and modern teams:


|Role |Description  |
|---------|---------|
|Catalog Submitter|Users with this role can submit items to the catalog.|
|Catalog Read-Only Member|Users with this role can discover and install items from the catalog  |
|Catalog Approver  |Users with this role can approve submissions to the catalog. Please note these can be users from your central IT department or Line of Business that your organization wants to empower to participate in the Approvals process.|
|Catalog Administrator|Users with this role can administer the catalog.|

More information: [Assign a security role to a user](../admin/assign-security-roles.md) and [Manage the security roles of a team](../admin/manage-teams.md#manage-the-security-roles-of-a-team).

### Approve & Reject submission requests

Environment admins and users with the Catalog Approver role can review new submissions and approve or decline requests. If global auto-approval or publisher level auto-approval is turned on then there's no requirement for manual review and approval. More information: [Enable Auto Approval](#enable-auto-approval)

In the **Approvals** section of the navigation pane, select **Requests**.
This list has 16 views:

- **Abandoned Approval Requests**
- **Active Approval Requests** (Default)
- **All Approval Request**
- **Approved Approval Request**
- **Completed Approval Requests**
- **Draft Approval Requests**
- **Draft or Failed Validation**
- **Failed Pre-Validation**
- **Functional Validation inProgress & Waiting for Test Cases**
- **In Progress Approval request**
- **Inactive Approval Requests**
- **My Approval Request**
- **Need Follow-Up**
- **New Approval Request**
- **Rejected Approval Requests**
- **Waiting for submitter response**

Using the **Active Approval Requests** view, open a request and select **Resolve Request** in the menu.

- Select **Reject Request**to decline the request. The request will be archived and publisher, item and asset will not be created.
- Click **Complete Request** to approve. Upon approval, Publisher, Item and Assets be created. The request will be archived and moved to **Inactive** status.


### Review Install history

In the **Deployment History** section of the navigation pane, select **Install History** to view a list of installations that were requested from the catalog.

This list has 2 views:

- **Active Install Histories**(Default)
- **Inactive Install Histories**

### Review Catalog Items

In the **Catalog** section of the navigation pane, select **Catalog Items** to view a list of catalog items that are available in the catalog

This list has 5 views:

- **Active Catalog Items**
- **Catalog Items - Publisher View**
- **Inactive Applications** An inactive item can be reactivated, but a deleted item cannot be reinstated. Disabled items do not feature in discovery and list command response.
- **Pending Approval**
- **Published** (Default) This shows the most recent version of the item.

These view show the following columns:


|Column|Description|
|---------|---------|
|**Name (Publishers)** |Name of the publisher|
|**Name**|Display Name|
|**Catalog Item Id**|Id provided by publisher|
|**Engineering Contact**|The engineering contact|
|**Status Reason**|The reason for the status of the item. Options: <br /> - **Active**<br /> - **Published**<br /> - **Pending Approval**<br /> - **Inactive**<br /> - **Rejected**|
|**Modified On**|When the item was last modified.|
|**Modified By**|Who last modified the item.|

This list can also be be viewed using the [pac catalog list](cli/reference/catalog.md#pac-catalog-list) command. More information: //TODO

#### Review Catalog publishers

In the **Catalog** section of the navigation pane, select **Catalog Publishers** to view a list of publishers associated to catalog items.

This list has 2 views:

- **Active Publishers**
- **Inactive Publishers**


Catalog publishers have the following columns:

|Display Name|Description|
|-----|-----|
|**Allow Auto-Approval**|Both the publisher and the app must allow auto-approvals in order for the app's approval requests to look for auto-approval policies.|
|**Azure Publisher Id**| //TODO|   
|**Description**|A description of the publisher|
|**Last Sync Date**|Date last synced with TPS / PES|
|**Name**|The name of the publisher.|
|**Publisher Type**|Choices:<br /> - **FirstParty**<br /> - **ThirdParty**<br /> - **Tenant**<br /> - **Partner**|
|**Pushed Date**|Date the reocord was pushed to TPS\PES|
|**Subscription Id**|Azure Subscription ID where Items should be Posted|
|**Publisher ID**|This is the GUID of the ID used by the integration systems|
|**Owner**|Owner Id|
|**Status Reason**|Reason for the status of the Publisher<br />Choices:<br /> - **Active**<br /> - **Published**<br /> - **Pending Approval**<br /> - **Inactive**<br /> - **TPS Disabled**|


#### Review packages and solutions of items in catalog

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

//TODO: Is this Catalog Assets or Package Assets? I couldn't figure out what table is behind this

### Review errors in submission requests

In the **Approvals** section of the navigation pane, select **Failed Pre-Validation** to view a lis of errors associated to a submission in the Catalog Manager application.

1. Click on the request name that you want to investigate.
1. In the **Timeline** card you can find the exception in the **Notes**.

:::image type="content" source="media/failed-pre-validation-exception-ui.png" alt-text="The exception in the notes of the Timeline card.":::


After fixing the submission, trigger the submit again from PAC CLI. You will see a new request that can be approved.

### Review errors in install requests

In the **Deployment History** section of the navigation pane, select **Install History** to view a list of errors associated to an install. 

Click on the failed request name to get more information.

//TODO I don't see failed request names



## Frequently asked questions (FAQ)

The following are frequently asked questions related to catalog in Power Platform.

### When would I need to create more than one catalogs?

While most organizations are likely to leverage just one catalog, it is possible to create more than one catalogs for distinct audiences. These include segregation of data concerns from a geography, departmental, business group (subsidiary) or other reasons.

### Is there a license required to use the Catalog?

For the public preview, the catalog feature is available to be used without any licensing. For GA, the catalog feature will require the catalog to be setup in a managed environment.



