---
title: Responding to Data Subject Rights (DSR) requests for Power Apps customer data
description: Walkthough of how to respond to Data Subject Rights (DSR) requests for Power Apps customer data to support privacy compliance.
author: sericks007
ms.reviewer: paulliew
ms.component: pa-admin
ms.topic: overview
ms.date: 12/09/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
- royshea 
---

# Responding to Data Subject Rights (DSR) requests for Power Apps customer data

## Introduction to DSR Requests

[!INCLUDE [gdpr-intro](~/../shared-content/shared/privacy-includes/gdpr-intro.md)]

This article provides examples of steps you can take to support privacy compliance when using Power Apps, Power Automate, and Microsoft Dataverse. You'll learn how to use Microsoft products, services, and administrative tools to help controller customers find, access, and act on personal data in the Microsoft cloud in response to DSR requests.

The following actions are covered in this article:

* **Discover** — Use search and discovery tools to more easily find customer data that may be the subject of a DSR request. Once potentially responsive documents are collected, you can perform one or more of the following DSR actions to respond to the request. Alternatively, you may determine that the request doesn't meet your organization's guidelines for responding to DSR requests.

* **Access** — Retrieve personal data that resides in the Microsoft cloud and, if requested, make a copy of that data available to the data subject.

* **Rectify** — Make changes or implement other requested actions on the personal data, where applicable.

* **Restrict** — Restrict the processing of personal data, either by removing licenses for various online services or turning off the desired services where possible. You can also remove data from the Microsoft cloud and retain it on-premises or at another location.

* **Delete** — Permanently remove personal data that resides in the Microsoft cloud.

* **Export** — Provide an electronic copy (in a machine-readable format) of personal data to the data subject.

## Discover
The first step in responding to a DSR request is to find the personal data that is the subject of the request. This first step&mdash;finding and reviewing the personal data at issue&mdash;will help you determine whether a DSR request meets your organization's requirements for honoring or declining a DSR request. For example, after finding and reviewing the personal data at issue, you may determine the request doesn't meet your organization's requirements because doing so may adversely affect the rights and freedoms of others.

### Step 1: Find personal data for the user in Power Apps
Below is a summary of the types of Power Apps resources that contain personal data for a specific user.

Resources containing personal data |    Purpose
--- | ---
Environment |    An environment is a space to store, manage, and share your organization's business data, apps, and flows. [Learn more](./environments-overview.md)
Environment permissions    | Users are assigned to environments roles to be granted maker and administrative privileges within an environment. [Learn more](./environments-overview.md)
Canvas app / Custom page   | Cross-platform business apps that can be built from a power of a blank canvas and connected to over 200 data sources. [Learn more](/powerapps/maker/)
Canvas-app permissions    | Canvas apps can be shared with users within an organization. [Learn more](/powerapps/maker/canvas-apps/share-app)
Connection    | Used by connectors and allow for connectivity to APIs, systems, databases, etc. [Learn more](/powerapps/maker/canvas-apps/add-manage-connections)
Connection permissions    | Certain types of connections can be shared with users within an organization. [Learn more](/powerapps/maker/canvas-apps/share-app-resources)
Custom connector    | Custom connectors that a user has created to provide access to a data source not offered through one of the Power Apps standard connectors. [Learn more](/powerapps/maker/canvas-apps/register-custom-api)
Custom-connector permissions    | Custom connectors can be shared with users within an organization. [Learn more](/powerapps/maker/canvas-apps/share-app-resources)
Power Apps user and user-app settings    | Power Apps stores several user preferences and settings that are used to deliver the Power Apps runtime and portal experiences.
Power Apps notifications    | Power Apps sends several types of notifications to users including when an app is shared with them and when a Dataverse export operation has completed.
Gateway    | Gateways are on-premises data gateways that can be installed by a user to transfer data quickly and securely between Power Apps and a data source that isn't in the cloud. [Learn more](/powerapps/maker/canvas-apps/gateway-reference)
Gateway permissions    | Gateways can be shared with users within an organization. [Learn more](/powerapps/maker/canvas-apps/share-app-resources)
Model-driven apps and model-driven app permissions    | Model-driven app design is a component-focused approach to app development. Model-driven apps and their user access permissions are stored as data within the Dataverse database.  [Learn more](/powerapps/maker/model-driven-apps/model-driven-app-overview)

Power Apps offers the following experiences to find personal data for a specific user:

- **Website access**: [Power Apps site](https://make.powerapps.com) and [Microsoft 365 Service Trust Portal](https://servicetrust.microsoft.com/)
- **PowerShell access**: Power Apps cmdlets (for [app creators](./powerapps-powershell.md) and [administrators](./powerapps-powershell.md)) and [On-premises gateway cmdlets](/data-integration/gateway/service-gateway-high-availability-clusters)

For detailed steps on how you can use these experiences to find personal data for a specific user for each of these types of resources, see [Responding to Data Subject Rights (DSR) requests to export Power Apps customer data](powerapps-privacy-export-dsr.md).

After you find the data, you can then perform the specific action to satisfy the request by the data subject.

### Step 2: Find personal data for the user in Power Automate
Power Apps licenses always include Power Automate capabilities. In addition to being included in Power Apps licenses, Power Automate is also available as a standalone service.

For guidance on how to discover personal data stored by the Power Automate service, see [Responding to Data Subject Requests for Power Automate](/power-automate/gdpr-dsr-summary).

> [!IMPORTANT]
> It's recommended that admins complete this step for a Power Apps user.

### Step 3: Find personal data for the user in Microsoft Copilot Studio
Power Apps capabilities build upon Microsoft Copilot Studio.  Microsoft Copilot Studio is also available as a standalone service.

For guidance on how to discover personal data stored by the Microsoft Copilot Studio service, see [Responding to Data Subject Requests for Microsoft Copilot Studio](/power-virtual-agents/personal-data-summary).

> [!IMPORTANT]
> It's recommended that admins complete this step for a Power Apps user.

### Step 4: Find personal data for the user in the Microsoft 365 admin center
Some feedback mechanisms in Power Apps are integrated with the Microsoft 365 admin center.

For guidance on how to discover feedback data stored by the Microsoft 365 admin center, see [How can I see my user's feedback?](/microsoft-365/admin/misc/feedback-user-control#how-can-i-see-my-users-feedback). A [Microsoft Entra user administrator](/entra/identity/role-based-access-control/permissions-reference#user-administrator) is able to manage this data within the Microsoft 365 admin center without the need for Microsoft 365 or Office licenses.

> [!IMPORTANT]
> It's recommended that admins complete this step for a Power Apps user.

### Step 5: Find personal data for the user in environments of Dataverse
Certain Power Apps licenses, including the Power Apps Developer Plan, give the ability for users within your organization to create environments of Dataverse and to create and build apps on Dataverse. The Power Apps Developer Plan is a free license that allows users to try out Dataverse in an individual environment. See the [Power Apps Pricing](https://powerapps.microsoft.com/pricing/) page for which capabilities are included in each Power Apps license.

For guidance on how to discover personal data stored by Dataverse, see [Responding to Data Subject Rights (DSR) requests for customer data in Dataverse](dataverse-privacy-dsr-guide.md).

> [!IMPORTANT]
> It's recommended that admins complete this step for a Power Apps user.

## Rectify
If a data subject asks you to rectify the personal data that resides in your organization's data, you and your organization must determine whether it's appropriate to honor the request. Rectifying data may include editing, redacting, or removing personal data from a document or other type of item.

You can use Microsoft Entra to manage the identities (personal data) of your users within Power Apps. Enterprise customers can manage DSR rectify requests by using the limited editing features within a given Microsoft service. As a data processor, Microsoft does not offer the ability to correct system-generated logs, because they reflect factual activities and constitute a historical record of events within Microsoft services.

## Restrict
Data subjects may request that you restrict processing of their personal data.  We provide both pre-existing application programming interfaces (APIs) and user interfaces (UIs).  These experiences provide the enterprise customer's Power Platform admin the capability to manage such DSRs through a combination of data export and data deletion. A customer may request:

* Export an electronic copy of the personal data of the user, including:

    - account(s)
    - system-generated logs
    - associated logs

* Delete the account and associated data residing within Microsoft systems.

## Export
The "right of data portability" allows a data subject to request a copy of their personal data in an electronic format (that's a "structured, commonly used, machine read-able and interoperable format") that may be transmitted to another data controller.

See [Responding to Data Subject Rights (DSR) requests to export Power Apps customer data](powerapps-privacy-export-dsr.md) for details.

## Delete
The "right to erasure" by the removal of personal data from an organization's customer data is a key privacy protection. Removing personal data includes system-generated logs but not audit-log information.

Power Apps allows users to build line-of-business applications that are a critical part of your organization's day-to-day operations. When a user leaves your organization, you will need to manually review and determine whether to delete certain data and resources that they have created. Other customer data will be automatically deleted whenever the user's account is deleted from Microsoft Entra ID.

See [Responding to Data Subject Rights (DSR) requests to delete Power Apps customer data](powerapps-privacy-delete-dsr.md) for details.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
