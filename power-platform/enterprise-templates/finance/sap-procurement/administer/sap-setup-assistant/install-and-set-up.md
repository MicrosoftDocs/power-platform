---
title: Install and set up the SAP Setup Assistant template for Power Platform
description: Learn how to install, set up, and deploy the SAP Setup Assistant template for Microsoft Power Platform.
author: menakakmsft
ms.author: menakakmsft
contributors:
  - menakakmsft
  - ellenwehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 09/09/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up the SAP Setup Assistant

As a Power Platform admin, you install, set up, and deploy the SAP Setup Assistant for your organization. This article covers the following steps:

## Step 1: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be set up manually. You need to set up seven new connections for the SAP Setup Assistant app.

It's best to create the connections before you import the solution. If you create the connections during import, you have to jump back and forth between browser windows.

1. Sign in to [Power Apps.](https://make.preview.powerapps.com/)
2. Select the target environment where you want to install the SAP Setup Assistant
4. Go to **Connections** and select **+ New Connection** to create new connections for each of these connectors if they do not already exist:

    - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365outlook/)
    - [Office 365 Users connector](/connectors/office365users/)
    - [Power Apps for Makers connector](/connectors/powerappsforappmakers/)
    - [Power Automate Management](/connectors/flowmanagement/)
    - [Power Platform for Admins connector](/connectors/powerplatformforadmins/)
    - [Power Query Dataflows connector](/connectors/dataflows/)

  [Learn how to manage connections in canvas apps.](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 2: Install SAP Setup Assistant

You have one options for installing the SAP Setup Assistant:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the SAP Setup Assistant template.

### Install from AppSource

AppSource is a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [SAP Setup Assistant on AppSource](<https://aka.ms/AccessSAPSetupAssistantTemplate>) and select **Get it now**.

2. In the **Install SAP Setup Assistant** window in the [Power Platform admin center,](https://admin.powerplatform.microsoft.com/) select the developer environment that you prepared.
3. Agree to the *Terms and Privacy* statements when prompted.

4. Select **Install**. One [solution](/power-platform/alm/solution-concepts-alm) is installed in your environment:

    - **SAP Setup Assistant**
  
    Please note that the installtion could you take several minutes.Find the **SAP Setup Assistant** from the list of apps, make sure the template is **Installed** before proceeding with next steps.

    Go to the [SAP Setup Assistant overview article](./overview.md) to learn more about the solution.

## Step 3: Update Connection References

There are six connection references imported as part of the solution. Inorder for the cloud flows to run , you need to update the each connection reference with the connections created in the previous steps.

1. Go to the Solutions, find the **Default Solution** in your environment and open it.

   :::image type="content" source="media/power-apps-default-solution.png" alt-text="Image of Power Apps Default Solution.":::
   
3. Select **Connection References** from the list of the Objects in the left pane
4. Select each Connection References from the list:
   - SAP Setup Assistant - Dataverse
   - SAP Setup Assistant - Office 365 Outlook
   - SAP Setup Assistant - Office 365 Users
   - SAP Setup Assistant - Power Apps for Makers
   - SAP Setup Assistant - Power Automate Management
   - SAP Setup Assistant - Power Platform for Admins
   - SAP Setup Assistant - Power Query Dataflows
     
     :::image type="content" source="media/connection-references-list-in-default-soultion.png" alt-text="Image of List of SAP Setup Assistant Connection References.":::
     
5. For each connection :
   - Click on the Connection Reference
   - Select the Connection you have created in step 2 from the **Connection** dropdown
   - **Save** the changes

     :::image type="content" source="media/update-connection-for-connection-reference.png" alt-text="Image of Updating the SAP Setup Assistant Connection Reference.":::
   - Pop-up will be prompted for confirmation, select **Save changes**

     :::image type="content" source="media/save-connection-in-connection-reference.png" alt-text="Image of Saving the SAP Setup Assistant Connection Reference.":::

## Step 4: Turn on cloud flows
Open the newly installed SAP Setup Assistant and verify that the eight cloud flows are set to the **On** status.If they aren't turn them **On**

1. Select **Solutions** on the left pane
2. Go to the **Managed** Solutions list, Select the **SAP Setup Assistant**
3. Select **Cloud flows(8)** on the left pane
4. Check for the **Status** column

   :::image type="content" source="media/cloud-flows-status-column.png" alt-text="Image of Saving the SAP Setup Assistant Connection Reference.":::
   
6. Navigate into the cloud flows that have **Status**="Off"
7. Select **Turn on** on the command bar.
   
## Step 5 : Use the SAP Setup Assistant

**SAP Setup Assistant** is the canvas app, installed as part of the SAP Setup Assistant solution:

Once the install and setup steps are complete, the app is ready to share and use.
