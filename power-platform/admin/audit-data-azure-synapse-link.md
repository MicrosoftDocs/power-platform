---
title: Access audit data with Azure Synapse Link and Power BI
description: Configure Azure Synapse Link to access Microsoft Dataverse audit tables and then use Power BI for deep insights.
ms.component: pa-admin
ms.topic: how-to
ms.date: 01/29/2024
author: paulliew 
ms.subservice: admin
ms.author: paulliew 
ms.reviewer: matp 
search.audienceType: 
  - admin
---
# Access audit data using Azure Synapse Link and Power BI

Customers who use Synapse Link for Dataverse can export audit logs easily to meet the external and internal auditing, compliance, security, and governance policies that are common to many enterprises.

Microsoft Dataverse auditing is supported on all custom and most customizable tables and columns. Audit logs are stored in Dataverse and consume log storage capacity. If you have Azure resources in the same region as the Dataverse environment, you can export audit logs to Azure Data Lake Storage Gen2 using Synapse Link for Dataverse and query the audit logs using Azure Synapse Analytics.

## Prerequisites

- An Azure subscription with admin permissions to create resource groups, workspace, and other Azure assets. More information: [Create an Azure Synapse Link for Dataverse with your Azure Synapse Workspace](/power-apps/maker/data-platform/azure-synapse-link-synapse#prerequisites)
- Dataverse requirements:
  - You must have the Dataverse system administrator security role.
  - The environment must be a Managed Environment. More information: [Enable Managed Environments](managed-environment-enable.md).
- Power BI.

## Tasks to complete

Here are the high-level steps for creating the link in Azure:

1. [Create n Azure Synapse Link](#create-n-azure-synapse-link)
   1. Create a resource group.
   1. Create an Azure Data Lake Storage Gen2 account with hierarchical directory enabled.
   1. Create a Synapse workspace.
   1. Create an Apache Spark pool for the Synapse workspace. 
   1. To enable your app maker the ability to create an Azure Synapse Link for Dataverse, grant storage account and synapse workspace permissions to the Power Platform maker.
1. [Connect Dataverse audit table to Synapse workspace](#connect-dataverse-audit-table-to-synapse-workspace)
   1. Verify the auditing table’s sync status.
1. [Create reports and dashboards using Power BI](#create-reports-and-dashboards-using-power-bi).

## Create n Azure Synapse Link
<!-- start here-->
1.	Sign in to Azure portal (https://portal.azure.com/ ).
2.	Create a Resource group (https://learn.microsoft.com/azure/azure-resource-manager/management/manage-resource-groups-portal#create-resource-groups ).
3.	Create a Storage account (https://learn.microsoft.com/azure/storage/common/storage-account-create?tabs=azure-portal )
Under the Project details:
a.	Select the Subscription that the Resource group was created from.
b.	Select the Resource group that you just created from above.
c.	Enter a Storage account name.
Click the Advanced tab and enable the Hierarchical Namespace option.



## Connect Dataverse audit table to Synapse workspace
 


## Create reports and dashboards using Power BI

