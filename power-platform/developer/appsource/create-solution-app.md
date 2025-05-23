---
title: "Step 2: Create a managed solution for your app (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "Learn about how to create a managed solution for your app to include all the components. This is required for publishing an app to Appsource." # 115-145 characters including spaces. This abstract displays in the search result.
ms.date: 04/03/2023
ms.reviewer: pehecke
ms.topic: how-to
author: angela21k
ms.author: angelakim
ms.subservice: developer
search.audienceType: 
  - developer
---
# Step 2: Create a managed solution for your app

Create a managed solution to include all the components for your app. You might find these topics helpful as you plan and create a managed solution to package your app components:

- [Solution concepts](/power-platform/alm/solution-concepts-alm)
- [Create a solution](/power-apps/maker/data-platform/create-solution)

You can also work with solutions using code: [Create, export, or import an unmanaged solution](/power-platform/alm/solution-api#create-export-or-import-an-unmanaged-solution)

## Display name and description of your solution

While creating a solution to package your app components, make sure you provide appropriate values in the **Display Name** and **Description** columns for your new solution that you want to be displayed to your customers.

:::image type="content" source="media/appsource-new-solution.png" alt-text="Create a solution":::

The **Display Name** and **Description** values for a solution are displayed to the customers in the **Dynamics 365 Administration Center** portal.

:::image type="content" source="media/appsource-solution-names.png" alt-text="Solutions":::

## Export the solution

Proceed with exporting the solution from the environment. When exporting the solution, choose to export as a managed solution. More information: [Export solutions](/power-apps/maker/data-platform/export-solutions)

## Supporting data for your solution

If your solution requires supporting or demo data:
1. Create supporting/demo data in your test environment.
2. Use the [Configuration Migration tool](../../admin/manage-configuration-data.md) to create a schema to include your supporting/demo data.
3. Save the schema file so that you can reuse it later to update the data in case your demo data changes.
4. Use the schema to export the data. Ensure that you provide a meaningful name to your export file. The data is exported and as a .zip file.

For detailed information about using the Configuration Migration tool to create a schema and export your data, see [Create a schema to export configuration data](../../admin/create-schema-export-configuration-data.md)

## At the end of this step

You will now have a managed solution file (example: *SampleSolution.zip*) and optionally a demo data file (example: *SampleData.zip*) for your app.

**Optional licensing information:** If you wish to add licensing information to your solution, see [Appendix: Add licensing information to your solution](appendix-add-license-information-to-your-solution.md)

> [!div class="nextstepaction"]
> [Step 3: Create an AppSource package for your app](create-package-app.md)
