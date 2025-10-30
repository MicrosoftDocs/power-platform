---
title: Frequently asked questions about the Data Export integration
description: Frequently asked questions about the CoE Starter Kits integration with Data Export data.
author: manuelap-msft
manager: devkeydet
ms.component: pa-admin
ms.topic: faq
ms.date: 08/21/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Frequently asked questions about the Data Export integration

This article addresses common questions about the Data Export integration, including its setup, requirements, licensing, and functionality.

## How can I try out this feature?

First, enable the [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) feature in your tenant. Proceed with the CoE Starter Kit configuration only when you see inventory data files in your storage account. The initial data export can take up to five days.

[Download](https://aka.ms/CoEBYODLdownload) the version of the CoE Starter Kit that integrates with Data Export and use the [setup wizard](setup-core-components.md#set-up-the-inventory-components-by-using-the-setup-wizard) to configure the feature in your tenant. Your feedback is critical to this process. Post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION).

## Why is this feature in preview?

The [Data Export](/power-platform/admin/self-service-analytics) feature itself is currently in public preview. Using Data Export for the CoE Starter Kit is a fundamental change to the underlying architecture of the CoE Starter Kit. To help balance improvement with the potential impact on your existing CoE kit deployment, we're introducing this feature as a preview feature. If you're an early adopter and think this feature could be useful to you, try it out and help test the feature. We recommend that you don't depend on it yet, and first try it out in a dedicated test environment. Trying out this feature helps us validate that the feature meets your needs and that we're not introducing unintended side effects. Your feedback is critical to this process. Post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION).

## What are the requirements for using Data Export with the CoE Starter Kit?

To receive the data, you have to configure [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) in the Power Platform admin center first. This feature requires a user account with admin permissions for initial setup, and an Azure Storage account to store data. Before you can set up Data Export, you must also turn on [tenant-level analytics](/power-platform/admin/tenant-level-analytics).

For the CoE Starter Kit capabilities, you'll also need a [Power BI Premium](/power-bi/enterprise/service-premium-features) per user or per capacity workspace.

## What are the license requirements and costs for using Data Export with the CoE Starter Kit?

The identity setting up the CoE Starter Kit needs a Power Apps Per User and Power Automate Per User license, and either a Power BI Premium per user license or access to a Power BI Premium per capacity workspace. You'll also need an [Azure Datalake Gen 2 Storage Account](/azure/storage/common/storage-plan-manage-costs) to receive data from the Data Export feature.

## What permissions are required for the CoE Starter Kit to consume Data Export data?

The identity setting up the CoE Starter Kit needs Storage Data Reader permissions to the Azure Storage account that receives data from the Data Export feature. More information: [Assign an Azure role for access to blob data](/azure/storage/blobs/assign-azure-role-data-access?tabs=portal)

## Why do you recommend moving from using cloud flows to retrieve inventory to using Data Export?

The cloud flows that sync inventory to Dataverse consume a high number of API calls, and can hit throttling and scale limits if you have a large number of Power Platform resources (environments, apps, flows) in your tenant. These cloud flows work best for small to medium-sized tenants that have less than 10,000 apps and flows. The Data Export feature uses Power BI and Power Platform dataflows, which are powerful at transforming and handling large amounts of data. Once we've validated that this feature works as intended, using Data Export with the CoE Starter Kit will increase performance and scale.

> [!IMPORTANT]
> The CoE Starter Kit using Data Export for inventory is currently in experimental preview. We recommend you don't depend on it just yet, and first test it in a dedicated, test environment. Trying out this feature will help us validate that the feature meets your needs and that we're not introducing unintended side effects. Your feedback is critical to this process. Please post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION).

## Will the CoE Starter Kit still have inventory of resources not yet available in the Data Export feature?

Currently, the Data Export feature provides inventory on environments, apps, and cloud flows. For resources not yet available via Data Export (desktop flows, chatbots, solutions, AI Builder models, Power Pages websites), the CoE Starter Kit continues to use cloud flows to retrieve the inventory.

## How does the CoE Starter Kit consume data from the Data Export feature?

There are two mechanisms the CoE Starter Kit uses to consume data from the Data Export feature:

- [Power BI dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) are used to transform the data for Power BI. These dataflows prepare all the data provided by the Data Export feature ready for reporting. The Power BI dashboard is then based on the data prepared by the Power BI dataflows.
- [Power Platform dataflows](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365) are used to transform the data and write a small amount of data back to existing Dataverse tables used by the CoE Starter Kit apps and flows. These dataflows merge and summarize data so only data needed by the admin and governance processes of the CoE Starter Kit is written back to the Dataverse. For example, instead of storing the entire usage data in Dataverse, only the last launched date of an app is stored in Dataverse.

## Can I migrate from using cloud flows to retrieve inventory to using Data Export?

Yes, migrating from cloud flows to Data Export will be a seamless process. Use the [Setup Wizard](setup-core-components.md#set-up-the-inventory-components-by-using-the-setup-wizard) to change your data source for the CoE Starter Kit to Data Export, and continue configuring the inventory components using the Setup Wizard. However, we suggest you don't upgrade just yet, and instead try this feature out in a test environment first.

## What will happen to my existing data when I upgrade?

The CoE Starter Kit's inventory is based on unique identifiers (GUIDs). App, flow, and environment metadata is stored in Dataverse tables, and each app, flow, and environment has a unique identifier that is used as the key to the row in the table. This GUID is the same if the inventory is retrieved with cloud flows, and if the inventory is retrieved with Data Export. 

If you switch from using cloud flows to using Data Export, the dataflows recognize existing rows via their GUID, and update those rows and add new records if the GUID doesn't yet exist. There won't be a duplication of rows.

## Will I still need to install the Audit Log solution to get app usage?

No, the Data Export contains app and flow usage information. The Audit Log solution setup is no longer required, if you are using Data Export as a mechanism to retrieve inventory and telemetry.

## What will happen to custom columns that I've created as part of customizations, if they aren't part of data from datalake?

The Power BI dashboard has been updated to depend on the Azure storage account, instead of Dataverse tables. If you're using your custom columns in the Power BI dashboard, you'll have to bring them into the new Power BI dashboard and append them to the new dataset.

If you're only using the custom columns in apps and flows, there's no change required as these columns aren't updated by the dataflow. Data in them persists.

## Will I see any data changes between what is coming from Data Export and what already exists?

Data integrity between moving from cloud flows to retrieve inventory to using Data Export to retrieve inventory is kept through the unique identifiers (GUIDs) of each resource (environment, app, flow). The dataflows recognize existing rows through their GUID and update those rows, and add new records if the GUID doesn't yet exist. There won't be a duplication of rows.

## Will all apps and flows in the CoE Starter Kit continue to work (for example, inactivity notifications, compliance process, identifying orphaned resources)?

Yes, there will be no change in functionality.

## Will there be two versions of the CoE kit or will the version using cloud flows go away?

There will be only one version of the CoE Starter Kit that supports both mechanisms to gather inventory and telemetry. Using the setup wizard, you decide which mechanism and the wizard will then guide you through the configuration steps required, based on your choice. You can also upgrade and move from using cloud flows to using Data Export by simply changing the inventory data source in the setup wizard. We don't have plans to remove the cloud flow inventory mechanism.

## I want to try out this feature, but have more questions or have found a bug

If you have more questions about the CoE Starter Kit using Data Export, [raise a question on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION). If you've tried out the CoE Starter Kit using Data Export and found a bug, please [raise an issue on GitHub](https://aka.ms/coe-starter-kit-issues).

## Known limitations

- Unpublished cloud flows (flows imported in a managed solution that have never been turned on) and cloud flows triggered from canvas apps with no actions, other than a response, aren't returned through the Data Export feature. They aren't part of the inventory.
- Component Libraries aren't returned through the Data Export feature. They aren't part of the inventory.
- Apps and flows in the legacy environment are assigned to the default environment. That's because the legacy and default environment have the same GUID.
