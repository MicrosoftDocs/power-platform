---
title: "Catalog components and templates (Preview)"
description: "Use the catalog in Power Platform to managed shared components and templates so that administrators, application makers, and developers within an organization can use each other's work."
author: samathur
ms.subservice: developer
ms.author: samathur
ms.date: 05/17/2023
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# Catalog components and templates (Preview)

[!INCLUDE [cc-preview-features-expect-changes](../includes/cc-preview-features-expect-changes.md)]

Organizations where developers & makers build and share components and templates get more value from the Power Platform. Just building isn't enough. Sharing power platform artifacts at scale fosters communities and support groups to emerge, incubate and unlock value from diverse set of personnel in an organization.

Successful organizations adopt a *fusion teams* model where pro-developers, makers and admins all work together to help their fellow employees derive the highest value possible from the Power Platform. Fusion teams can reuse components and templates.

*Components* include things like:

- Custom Connectors
- Power Platform Component Framework (PCF) controls
- Power Automate flows
- Canvas apps
- Model-driven apps

*Templates* are items that represent an advanced starting point for components. Templates connect to their enterprise systems & resources, and utilize organization's themes

In a large organization, there may be many components and template distributed amongst many environments.

The catalog in Power Platform enables developers and makers to:

- Crowd-source and find Power Platform templates and code components within their organization easily
- Find and install the latest and authoritative version of a component
- Get started with templates that provide immediate value

For administrators and line of business approvers, the catalog:

- Provides a central location, a *single source of truth*, to store and maintain power platform artifacts they can curate and control to accelerate value for Makers and Developers
- Enables approval workflows to enable usage of sanctioned components and templates where a high degree of care is required due to sensitive regulatory and statutory scenarios
- Provides management capabilities with settings and metadata

## Catalog process

This diagram describes the process of using catalog in Power Platform.

:::image type="content" source="media/catalog in power platform process.png" alt-text="Catalog process":::


### Create

Makers and developers can create solutions and templates with useful configuration points. With these configuration points, users can easily configure all the solution components in a solution or create from a template.

### Submit

Makers and developers can submit solutions and templates to the catalog so that they can help their colleagues solve business problems.

### Approve and Store

Admins and LOB approvers can review and approve solutions and templates to be shared with the organization, so that catalog content is governed.

### Discover

Makers and developers can discover solutions and templates from their colleagues in the catalog, so that they can more quickly solve business problems.

### Acquire

Makers and developers can easily acquire solutions and templates from the catalog by providing connections and configuration


## Terminology

These terms are important to understand when using the catalog:


|Term|Description|
|---------|---------|
|**Catalog Item**|The unit of interaction with the catalog is called an item. <br /><br /> - What is being submitted to or installed from the catalog. <br /><br /> - Typically, an item is a Dataverse solution or package deployer package. An item can contain a fully built application or a template for a power app or flow or power platform code-first component such as a custom connector, PCF control. |
|**Catalog Publisher**|The owning entity of the Application. For example, the publisher can be the human resources IT team or another Line of Business team.<br /><br /> - A group of people in an organization that are responsible for managing its lifecycle. <br /><br /> - Support and engineering contacts can be provided.<br /><br /> - Not to be confused with the Solution Publisher|
|**Submission** |The act of sharing an item involves submitting it to the catalog. This act creates a *submission request* in the system.|
|**Submission Request**|The result of a submission. This request can be approved or declined. When auto approval is configured for the catalog, no approval is required.|
|**Discovery**|Act of finding items within a catalog by authorized users.|
|**Acquisition**|Act of installing the item to a target environment by a developer.|

## Get started

To get started, you need to complete the following tasks:

1. [Install the **Catalog Manager** application](#install-the-catalog-manager-application)
1. [Configure the catalog](#configure-the-catalog): Configure catalog settings including metadata management and enabling auto approvals
1. [Administer the catalog](#administer-the-catalog): Perform ongoing catalog administration including Approving new submissions, reviewing submission and install failures

## Install the **Catalog Manager** application

To start using the catalog, you need to install the ****Catalog Manager** application from AppSource.

> [!NOTE]
> Most organizations will only need to install one catalog. While multiple catalogs within a tenant are supported they are for advanced departmental, data residency type scenarios and need to be evaluated in light of your business needs.

### Prerequisites

You must have the following security role assignment and your Dataverse environment must be above the minimum version.

- Security role: You must have the System administrator security role on the environment.
- A Dataverse environment with minimum DB version of `9.2.22122.00148`. You can check the Database version:

   - In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) > **Environment page** > **Version card**.
   - By using the [RetrieveVersion function](xref:Microsoft.Dynamics.CRM.RetrieveVersion) with your browser. Type <br />`https://<your org>.<your region code>.dynamics.com/api/data/v9.2/RetrieveVersion`<br /> in your browser address bar  and view the JSON returned.

### Installation instructions

Here are instructions to install the catalog:

1. Sign-in into [appsource.microsoft.com](https://appsource.microsoft.com/) with your tenant credentials. Select this link:  [https://appsource.microsoft.com/product/dynamics-365/powerappssvc.catalogmanager-preview?flightCodes=dde212e5c66047c59bf2b346c419cef6](https://appsource.microsoft.com/product/dynamics-365/powerappssvc.catalogmanager-preview?flightCodes=dde212e5c66047c59bf2b346c419cef6)

   > [!NOTE]
   > The **Catalog Manager** application is not enabled for search in appsource at this time. You must use the link above to open it.

1. Select on **Get It Now** to acquire the ****Catalog Manager**** app. This button will redirect you to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

   You may be prompted to confirm your details before you're directed to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), you're asked to **Select an Environment** to install the ****Catalog Manager**** application.
1. After you agree to the legal terms and privacy statements, select **Install**.

This process requests that the application be installed. It takes a few minutes to complete.

After the installation is complete, the ****Catalog Manager**** app is available in [Power Apps](https://make.powerapps.com/) > **Apps**. Select **Play** to launch the ****Catalog Manager**** App.

#### Validating successful install of the **Catalog Manager** application

To verify that the **Catalog Manager** application installed successfully:

1. In the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/) > Select **Environments**.
1. Select the environment you chose to install the ****Catalog Manager**** application.
1. In the **Resources** card, select the **Dynamics 365 apps** link.
1. You should find the ****Catalog Manager**** app listed with a **Status** of **Installed**.

In [Power Apps](https://make.powerapps.com/), with the environment you selected, you should also be able to find the following solutions:

- Power Platform catalog service identities
- Power Platform catalog manager


## Configure the catalog

After you have installed the ****Catalog Manager**** application, in [Power Apps](https://make.powerapps.com/), locate the application and select **Play** to open the application.

### Configure catalog metadata

1. In the navigation pane, in the **Configuration** group at the bottom, select **Catalog Configuration**.
1. Select **Default Catalog Name** to open the **Catalog Configuration** form.

Here you can set the following configuration values that are important when you have more than one catalog.

|Field  |Description  |
|---------|---------|
|**Catalog Name**|Type a descriptive name for the catalog.|
|**Description**|Type a brief description of the catalog.|
|**Help Link**|Type a URL to a resource for your organization that contains your documentation about using the catalog.|
|**Image**|Upload an image to easily identify the catalog.|

In the **Catalog Configuration** card on the right side, there are two choices you can apply: **Enable Auto Approval** and **Enable Unmanaged Solutions**.

#### Enable Auto Approval

This setting is for the entire catalog.

Organizations can take a stance of *approved by default* or impose an approval process for submissions.

Auto approval can be enabled at two levels:


|Level|Description  |
|---------|---------|
|**Catalog**|Set auto approval once on the catalog so that every submission is auto approved regardless of publisher.  |
|**Publisher** |Navigate to **Catalog Publishers** in the ****Catalog Manager**** application and turn on auto approval for individual catalog publishers. Use this publisher level auto approval when there's a trusted group for which no approval is required, but others require approval.|


> [!NOTE]
> If you choose to enable auto approval for the entire catalog, settings at the publisher level will not apply.

Even with auto approval, submission requests that get auto approved are available to be viewed within the ****Catalog Manager**** app. They can be viewed under **Requests** using the **All Approval Request** view. More information: [Approve & Reject submission requests](#approve--reject-submission-requests)


#### Enable Unmanaged Solutions

This setting is enabled by default. You must enable this setting if you want to use the deployment mode of **Template**.
 <!-- More information: TODO x-ref Submission >Deployment  //TODO: I don't find any target section in the submit-catalog-items.md file for 'Deployment'. -->

You can choose to disallow sharing of unmanaged solutions via the catalog.
<!--//TODO: Why would someone want to do this? -->

## Administer the catalog

Administering the catalog includes the following tasks:

- [Setup Users](#setup-users)
- [Approve & Reject submission requests](#approve--reject-submission-requests)
- [Review Install history](#review-install-history)
- [Review Catalog Items](#review-catalog-items)
- [Review errors in submission requests](#review-errors-in-submission-requests)
- [Review errors in install requests](#review-errors-in-install-requests)

### Setup Users

The **Catalog Manager** application includes the following security roles you can associate to users, Microsoft Azure Active Directory groups, and modern teams:


|Role |Description  |
|---------|---------|
|**Catalog Submitter**|Users with this role can submit items to the catalog.|
|**Catalog Read-Only Member**|Users with this role can discover and install items from the catalog  |
|**Catalog Approver**  |Users with this role can approve submissions to the catalog. Catalog approvers can be users from your central IT department or Line of Business that your organization wants to empower to participate in the approvals process.|
|**Catalog Administrator**|Users with this role can administer the catalog.|

More information: [Assign a security role to a user](../admin/assign-security-roles.md) and [Manage the security roles of a team](../admin/manage-teams.md#manage-the-security-roles-of-a-team).

### Approve & Reject submission requests

Environment admins and users with the Catalog Approver role can review new submissions and approve or decline requests. If global auto approval or publisher level auto approval is turned on, then there's no requirement for manual review and approval. More information: [Enable Auto Approval](#enable-auto-approval)

In the **Approvals** section of the navigation pane, select **Requests**.
This list has 16 views. The most important ones are:

|View |Description  |
|---------|---------|
|**Active Approval Requests** (Default)|Use this view to review submission requests pending approval|
|**All Approval Request**|Use this view to review all requests across all statuses|
|**Failed Pre-Validation**|Use this view to identify requests where a submitter has sent a request but it is not available in the Active Approval requests. This can help with troubleshooting such scenarios.|
|**Approved Approval Request**|Use this view to review previously approved requests|

<!--
There are many other views that can be leveraged as well for different needs you may have.
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
-->

Using the **Active Approval Requests** view, open a request and select **Resolve Request** in the menu.

- Select **Reject Request** to decline the request. The request is archived and publisher, item and asset aren't created.
- Select **Complete Request** to approve. Upon approval, Publisher, Item and Assets be created. The request is archived to **Inactive** status.


### Review Install history

In the **Deployment History** section of the navigation pane, select **Install History** to view a list of installations that were requested from the catalog.

This list has two views:

- **Active Install Histories** (Default)
- **Inactive Install Histories**

### Review Catalog Items

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

#### Review Catalog publishers

In the **Catalog** section of the navigation pane, select **Catalog Publishers** to view a list of publishers associated to catalog items.

This list has two views:

- **Active Publishers**
- **Inactive Publishers**


Catalog publishers have the following columns:

|Display Name|Description|
|-----|-----|
|**Allow Auto-Approval**|Both the publisher and the app must allow auto approvals in order for the app's approval requests to look for auto approval policies.|
|**Azure Publisher Id**| //TODO|   
|**Description**|A description of the publisher|
|**Last Sync Date**|Date last synced with TPS / PES|
|**Name**|The name of the publisher.|
|**Publisher Type**|Choices:<br /> - **FirstParty**<br /> - **ThirdParty**<br /> - **Tenant**<br /> - **Partner**|
|**Pushed Date**|Date the record was pushed to TPS\PES|
|**Subscription Id**|Azure Subscription ID where Items should be Posted|
|**Publisher ID**|The GUID of the ID used by the integration systems|
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

The following table describes selected fields that can be included in the form:

<!--
|Field |Description|
|---------|---------|
|**Allow Package Code Execution**|If **Allow Package Code Execution** is set to true, a deployment package can execute code during deployment.|
|**Available**|Indicates availability of the said version for consumption. Many versions can be available however only one shows (usually the latest) as Published|
|**Catalog Item Cross Reference**|Connects to the common catalog item record regardless of revision.|
|**CRM Working Package Drop Path**|The location where the package file has been dropped for working|
|**CrmMaxVersion**|Compatibility information|
|**CrmMinVersion**|Compatibility information|
|**DefaultPackageLocaleId**|//TODO|
|**EndDateUtc**|//TODO|
|**InstanceConfigurationUrl**|//TODO|
|**Last Sync Date**|//TODO|
|**LearnMoreUrl**|URL accessible to tenant users where they can learn more|
|**Name**|//TODO|
|**Owner**|//TODO|
|**Package Manifest File Name**|         |
|**Package Manifest Uri**|URI to the package manifest.|
|**Package Uri**|//TODO|
|**ProviderName**|//TODO|
|**Pushed Date**|//TODO|
|**Revision Of**|This field is populated when a new approval request contains a reference to an existing package version that has previously been made available|
|**StartDateUtc**|//TODO|
|**Status Reason**|Choices:<br /> - **Pending Approval**<br /> - **Published**<br /> - **Rejected**<br /> - **Available**<br /> - **Inactive**|
|**SupportedCountries**|//TODO|
|**TPS ID**|//TODO|
|**UniqueName**|//TODO|
|**Version**|//TODO|

-->

New table under construction

Package Information
|Field |Description|
|---------|---------|
|**UniqueName**|//TODO|
|**Version**|//TODO|
|**Status Reason**|Choices:<br /> - **Pending Approval**<br /> - **Published**<br /> - **Rejected**<br /> - 
|**Package ID**|//TODO|
|**Locale Identifier (LCID)**|Identifier for localized package|
|**Localized Name**|Name in localized language|
|**Description**|Description in localized language|
|**Notes**|Timeline section has notes with details for actions on asset|
|**Revision Of**|This field is populated when a new approval request contains a reference to an existing package version that has previously been made available|
|**Modified On**|Date last modified|
|**Modified By**|Modified By User|
|**Created On**|Date created|

Information including the Package File, the Package Manifest and contained solutions and components is also available under the Package and Contents area. 

### Review errors in submission requests

In the **Approvals** section of the navigation pane, select **Failed Pre-Validation** to view a list of errors associated to a submission in the **Catalog Manager** application.

1. Select on the request name that you want to investigate.
1. In the **Timeline** card, you can find the exception in the **Notes**.

   :::image type="content" source="media/failed-pre-validation-exception-ui.png" alt-text="The exception in the notes of the Timeline card.":::


After fixing the submission, trigger the submit again from PAC CLI. You see a new request that can be approved.

### Review errors in install requests

In the **Deployment History** section of the navigation pane, select **Install History** to view a list of errors associated to an install. 

Select on the failed request name to get more information.

//TODO I don't see failed request names



## Frequently asked questions (FAQ)

The following are frequently asked questions related to catalog in Power Platform.

### When would I need to create more than one catalog?

While most organizations are likely to use just one catalog, it's possible to create more than one catalog for distinct audiences. These include segregation of data concerns from a geography, departmental, business group (subsidiary) or other reasons.

### Is there a license required to use the Catalog?

For the public preview, the catalog feature is available to be used without any licensing. For GA, the catalog feature requires the catalog to be set up in a managed environment.



