---
title: Microsoft Power Platform ISV Studio | Microsoft Docs
description: Learn how apps are managed and supported through the ISV Studio portal.
ms.date: 06/20/2023
ms.reviewer: jdaly
author: angela21k
ms.author: angelakim
suite: powerapps
ms.topic: overview
ms.subservice: developer
search.audienceType: 
  - developer
contributors: 
  - JimDaly
---

# Microsoft Power Platform ISV Studio

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

ISV Studio is designed to become the go-to Power Platform destination for Independent Software Vendors (ISV) to monitor and manage their applications. ISV Studio provides a consolidated cross tenant view of all the applications an ISV is distributing to customers.

:::image type="content" source="media/isv-studio-home-page.png" alt-text="Studio home page":::

> [!IMPORTANT]
>
> - ISV Studio is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

ISV Studio supports applications built on the Microsoft Dataverse that are published to and deployed through [AppSource](https://appsource.microsoft.com/). No telemetry is provided on side loaded solutions not deployed through AppSource.

The applications currently available on the Dataverse includes Power Apps and Dynamics 365 for Sales, Marketing, Service, and Talent. ISV Studio now provides telemetry features in finance and operations apps.

When end user installs an application from AppSource, a consent dialog is displayed requesting the user to acknowledge that contact, usage, and transactional information may be shared with the application provider. This information is used by the provider to support billing and other transactional activities and to enable telemetry in ISV Studio for the ISV to learn from and act on.

A customer can request that data not be shared with the provider, in which case Microsoft removes all data from that particular tenant within ISV Studio.

To access the public preview of ISV Studio, navigate your browser to [https://aka.ms/ISVStudio](https://aka.ms/ISVStudio/).

## Prerequisites

Prerequisites are different for Microsoft Dataverse and for finance and operations.

### For Microsoft Dataverse

The ISV must be associated with a Microsoft registered Partner organization [ISV] that has one or more supported apps published in [AppSource](https://appsource.microsoft.com/). Supported apps include model-driven apps created using Power Apps and Dynamics 365 apps such as Dynamics 365 Sales and Dynamics 365 Customer Service.

### For finance and operations

- For finance and operations apps, update the `SolutionID` in the descriptors with the `ProductId` of their offer in Partner Center. The `ProductId` of their offer can be found in the URL in Partner Center.
- Ask customers to install the latest solution with the above. They need to be on version `10.0.16` or above to see the telemetry feature in ISV Studio. More information: [ISV Studio solutions](/dynamics365/fin-ops-core/dev-itpro/dev-tools/isv-studio-solutions)

## Access to ISV Studio

When you have admin access, you can grant and remove read access for other users.

### Admin access

To access ISV Studio as an admin user, your Microsoft Entra ID account must be configured as a Publisher Owner in Partner Center. You can view the list of your Publisher Owners from the [Account Settings in Partner Center](/partner-center/partner-center-account-setup). With admin access, you're able to give more users read-only access to ISV Studio from the Studio directly.  

### Grant read access

To give users within your organization read-only access to the ISV Studio data, you must first be an admin user. Once you're an admin for your publisher account, use the following steps to give more users read-only access:

1. In ISV Studio, select **Settings** gear icon on the top right. Select **Manage access**.

   :::image type="content" source="media/isv-settings-panel.png" alt-text="Settings panel.":::

1. Search for a **Publisher account** in the organization. Select a user within your organization to give access. Select **Save**.

   :::image type="content" source="media/isv-user-management-dashboard.png" alt-text="User Management":::

   > [!NOTE]
   > You can only search and add users within your tenant/organization.

1. After you give access to the user, a confirmation email is sent to the user with access details.  

### Remove read access

You can follow the same steps to remove read-only access from a user to ISV Studio in the same window.

Continue reading the [App](app.md) and [Tenant](tenant.md) page articles listed below to learn about the capabilities of ISV Studio.

## How to provide feedback

Send an email to [ISVFeedback@microsoft.com](mailto:ISVFeedback@microsoft.com) with any feedback or questions. Your feedback is important for us to shape the experiences moving forward.

## In this Section

[Home page](home.md)  
[App page](app.md)  
[Tenant page](tenant.md)  
[AppSource checker](appsource-checker.md)  
[Connector Certification](connector-certification.md)  
[App usage analytics](usage-analytics.md)  
[Install failures](install-failure-analytics.md)  
[Auto app updates (preview)](auto-update.md)  
[Power Automate Embed Pay-as-you-go for ISVs (preview)](embed-analytics.md)

### See also

[Solution concepts](../../alm/solution-concepts-alm.md)<br />
[Publish your app on AppSource](../appsource/publish-app.md)
