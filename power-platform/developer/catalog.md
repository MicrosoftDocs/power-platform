---
title: "Catalog in Power Platform (preview)"
description: "Use the catalog in Power Platform to managed shared components and templates so that administrators, application makers, and developers within an organization can use each other's work."
author: samathur
ms.subservice: developer
ms.author: samathur
ms.date: 05/26/2023
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
---
# Catalog in Power Platform (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Organizations where developers and makers build and share components and templates get more value from Power Platform. Just building isn't enough. Sharing Power Platform artifacts at scale fosters communities and support groups to emerge, incubate and unlock value from diverse set of personnel in an organization.

Successful organizations adopt a *fusion teams* model where pro-developers, makers and admins all work together to help their fellow employees derive the highest value possible from Power Platform. Fusion teams can reuse components and templates.

*Components* include things like:

- Custom connectors
- Power Apps component framework controls
- Power Automate flows
- Canvas apps
- Model-driven apps

*Templates* are items that represent an advanced starting point for components. Templates connect to their enterprise systems & resources, and utilize organization's themes

In a large organization, there may be many components and templates distributed amongst many environments.

The catalog in Power Platform enables developers and makers to:

- Crowd-source and find Power Platform templates and code components within their organization easily
- Find and install the latest and authoritative version of a component
- Get started with templates that provide immediate value

For administrators and line of business approvers, the catalog:

- Provides a central location, a *single source of truth*, to store and maintain power platform artifacts they can curate and control to accelerate value for Makers and Developers
- Enables approval workflows to enable usage of sanctioned components and templates where a high degree of care is required due to sensitive regulatory and statutory scenarios
- Provides management capabilities with settings and metadata

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - While not required for preview, when this feature is generally available, it'll require the use of Managed Environment capabilities. More information: [Managed Environments overview](../admin/managed-environment-overview.md)
> - Currently, the catalog cannot be utilized in an environment that utilizes customer managed keys. More information: [Manage your customer-managed encryption key (preview)](../admin/customer-managed-key.md)

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
|**Catalog Item**|The unit of interaction with the catalog is called an item. <br />- An item is what is being submitted to or installed from the catalog. <br /> - Typically, an item is a Dataverse solution or package deployer package. An item can contain a fully built application or a template for a power app or flow or power platform code-first component such as a custom connector, PCF control. |
|**Catalog Publisher**|The owning entity of the Application. For example, the publisher can be the human resources IT team or another Line of Business team.<br /> - A group of people in an organization that are responsible for managing its lifecycle. <br /> - Support and engineering contacts can be provided.<br /> - Not to be confused with the Solution Publisher|
|**Submission** |The act of sharing an item involves submitting it to the catalog. This act creates a *submission request* in the system.|
|**Submission Request**|The result of a submission. This request can be approved or declined. When auto approval is configured for the catalog, no approval is required.|
|**Discovery**|Act of finding items within a catalog by authorized users.|
|**Acquisition**|Act of installing the item to a target environment by a developer.|

## Get started

To get started, you need to complete the following tasks:

1. [Install the **Catalog Manager** application](#install-the-catalog-manager-application)
1. [Configure the catalog](#configure-the-catalog): Configure catalog settings including metadata management and enabling auto approvals
1. [Administer the catalog)](administer-catalog.md): Perform ongoing catalog administration including: approving new submissions, reviewing submission and install failures

## Install the **Catalog Manager** application

To start using the catalog, you need to install the **Catalog Manager** application from AppSource.

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

1. Sign-in into [appsource.microsoft.com](https://appsource.microsoft.com/) with your tenant credentials.
1. Select this link:  [https://appsource.microsoft.com/product/dynamics-365/powerappssvc.catalogmanager-preview?flightCodes=dde212e5c66047c59bf2b346c419cef6](https://appsource.microsoft.com/product/dynamics-365/powerappssvc.catalogmanager-preview?flightCodes=dde212e5c66047c59bf2b346c419cef6)

   > [!NOTE]
   > The **Catalog Manager** application is not enabled for search in appsource at this time. You must use the link above to open it.

1. Select on **Get It Now** to acquire the ****Catalog Manager**** app. This button will redirect you to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

   You may be prompted to confirm your details before you're directed to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), you're asked to **Select an Environment** to install the ****Catalog Manager**** application.
1. After you agree to the legal terms and privacy statements, select **Install**.

This process requests that the application be installed. It takes a few minutes to complete.

After the installation is complete, the ****Catalog Manager****app is available in [Power Apps](https://make.powerapps.com/) > **Apps**. Select **Play** to launch the ****Catalog Manager**** App.

#### Validating successful install of the **Catalog Manager** application

To verify that the **Catalog Manager** application installed successfully:

1. In the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/) > Select **Environments**.
1. Select the environment you chose to install the ****Catalog Manager**** application.
1. In the **Resources** card, select the **Dynamics 365 apps** link.
1. You should find the ****Catalog Manager**** app listed with a **Status** of **Installed**.

In [Power Apps](https://make.powerapps.com/), with the environment you selected, you should also be able to find the following solutions:

- Power Platform catalog service identities
- Power Platform catalog manager

#### How the applications will appear in your environment

These apps will appear in two places:

> [!NOTE]
> You will also see an app named **Package Management View** in the environment. This app is reserved for future use.

- In [Power Apps](https://make.powerapps.com/), select **Apps**

   :::image type="content" source="../media/PowerCatalogApps_Maker.png" alt-text="Power Apps Maker App List":::

- In the **Unified Interface apps** view:

   :::image type="content" source="../media/PowerCatalogApps_UCI.png" alt-text="Power Apps Unified Client Applications View":::

   More information: [About Unified Interface for model-driven apps in Power Apps](../admin/about-unified-interface.md)

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

In the **Catalog Configuration** card on the right side, there are two choices you can apply:

- **Enable Auto Approval**
- **Enable Unmanaged Solutions**.

#### Enable Auto Approval

This setting is for the entire catalog. Organizations can take a stance of *approved by default* or impose an approval process for submissions.

Auto approval can be enabled at two levels:

|Level|Description  |
|---------|---------|
|**Catalog**|Set auto approval once on the catalog so that every submission is auto approved regardless of publisher.  |
|**Publisher** |Navigate to **Catalog Publishers** in the ****Catalog Manager**** application and turn on auto approval for individual catalog publishers. Use this publisher level auto approval when there's a trusted group for which no approval is required, but others require approval.|

> [!NOTE]
> If you choose to enable auto approval for the entire catalog, settings at the publisher level will not apply.

Even with auto approval, submission requests that get auto approved are available to be viewed within the ****Catalog Manager**** app. They can be viewed under **Requests** using the **All Approval Request** view. More information: [Approve & Reject submission requests](administer-catalog.md#approve-and-reject-submission-requests)

#### Enable Unmanaged Solutions

This capability is reserved for future use. More details of what components are supported in deployment type of Template will be shared in the future.

## Next steps

Learn how to administer the catalog.

> [!div class="nextstepaction"]
> [Administer the catalog](administer-catalog.md)<br/>

Learn how to view, submit, and install catalog items.

> [!div class="nextstepaction"]
> [View, submit, and install catalog items](submit-catalog-items.md)<br/>

Ask questions or contact the project team on GitHub.

> [!div class="nextstepaction"]
> [github.com/microsoft/PowerPlatform-Catalog](https://github.com/microsoft/PowerPlatform-Catalog)<br/>

## Frequently asked questions (FAQ)

The following are frequently asked questions related to catalog in Power Platform. If you have questions you haven't found in the documentation, please use the **Feedback** section at the bottom of this page. Click on the **This page** button. You'll need to have a GitHub account to provide feedback.

### Q: When would I need to create more than one catalog?

While most organizations are likely to use just one catalog, it's possible to create more than one catalog for distinct audiences. These include segregation of data concerns from a geography, departmental, business group (subsidiary) or other reasons.

### Q: Is there a license required to use the catalog?

For the public preview, the catalog feature is available to be used without any licensing. While not required for the preview, when this feature is generally available it requires the use of Managed Environment capabilities. More information: [Managed Environments overview](../admin/managed-environment-overview.md)

### Q: Where do I provide feedback on catalog

You can reach the team and community using the Power Catalog for Pro dev on GitHub here: [https://github.com/microsoft/PowerPlatform-Catalog](https://github.com/microsoft/PowerPlatform-Catalog)

### See also

[Administer the catalog (Preview)](administer-catalog.md)<br />
[View, submit, and install catalog items  (Preview)](submit-catalog-items.md)
