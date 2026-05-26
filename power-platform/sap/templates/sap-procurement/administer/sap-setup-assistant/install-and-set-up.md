---
title: Install and set up the SAP Setup Assistant template for Power Platform
description: Learn how to install, set up, and deploy the SAP Setup Assistant template for Microsoft Power Platform.
author: menakakmsft
ms.author: menakakollu
contributors:
  - menakakmsft
  - ellenwehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 05/19/2026
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up the SAP Setup Assistant

As a Power Platform admin, you install, set up, and deploy the SAP Setup Assistant for your organization. This article covers the following steps:

## Step 1: Create connections

Cloud flows need specific connection references to work correctly. The solution includes these connection references, but you often need to set up connectors manually. You need to set up seven new connections for the SAP Setup Assistant app.

Create the connections before you import the solution. If you create the connections during import, you have to jump between browser windows.

1. Go to [Power Apps](https://make.preview.powerapps.com/).
1. Select the target environment where you want to install the SAP Setup Assistant.
1. Go to **Connections** and select **+ New Connection** to create the connections that aren't already set up in your target environment:

    - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365/)
    - [Office 365 Users connector](/connectors/office365users/)
    - [Power Apps for Makers connector](/connectors/powerappsforappmakers/)
    - [Power Automate Management](/connectors/flowmanagement/)
    - [Power Platform for Admins connector](/connectors/powerplatformforadmins/)
    - [Power Query Dataflows connector](/connectors/dataflows/)

  [Learn how to manage connections in canvas apps.](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 2: Install SAP Setup Assistant from Marketplace

Marketplace is a Microsoft digital storefront. To go through the Marketplace install process, take these steps:

1. Go to the [SAP Setup Assistant on Microsoft Marketplace](<https://aka.ms/AccessSAPSetupAssistantTemplate>) and select **Get it now**.
1. In the **Install SAP Setup Assistant** window in the [Power Platform admin center,](https://admin.powerplatform.microsoft.com/) select the developer environment that you prepared.
1. Agree to the *Terms and Privacy* statements when prompted.
1. Select **Install** to install one [solution](/power-platform/alm/solution-concepts-alm) in your environment:

    - **SAP Setup Assistant**
  
   The installation might take several minutes. Before proceeding with next step, find the **SAP Setup Assistant** from the list of apps and make sure the template is **Installed**.

## Step 3: Update connection references

The solution imports six connection references. To run the cloud flows, update each connection reference with the connections you created in step one.

1. Go to the solution, find the **Default Solution** in your environment, and open it.

   :::image type="content" source="media/power-apps-default-solution.png" alt-text="Image of Power Apps Default Solution.":::

1. Select **Connection References** from the list of objects in the left pane.
1. Select each connection reference from the list:
   - SAP Setup Assistant - Dataverse
   - SAP Setup Assistant - Office 365 Outlook
   - SAP Setup Assistant - Office 365 Users
   - SAP Setup Assistant - Power Apps for Makers
   - SAP Setup Assistant - Power Automate Management
   - SAP Setup Assistant - Power Platform for Admins
   - SAP Setup Assistant - Power Query Dataflows

     :::image type="content" source="media/connection-references-list-in-default-soultion.png" alt-text="Image of List of SAP Setup Assistant Connection References.":::

1. For each connection reference:
   - Select the connection reference.
   - Select the connection you created in step two from the **Connection** dropdown.
   - **Save** the changes.

     :::image type="content" source="media/update-connection-for-connection-reference.png" alt-text="Image of Updating the SAP Setup Assistant Connection Reference.":::

   - A pop-up prompts for confirmation. Select **Save changes**.

     :::image type="content" source="media/save-connection-in-connection-reference.png" alt-text="Image of Saving the SAP Setup Assistant Connection Reference.":::

## Step 4: Turn on cloud flows

Open the newly installed SAP Setup Assistant and verify that the eight cloud flows are set to the **On** status. If they're not, turn them **On**.

1. Select **Solutions** in the left pane.
1. Go to the **Managed** Solutions list, and select the **SAP Setup Assistant**.
1. Select **Cloud flows(8)** in the left pane.
1. Check the **Status** column.

   :::image type="content" source="media/cloud-flows-status-column.png" alt-text="Image of SAP Setup Assistant cloud flow status column.":::

1. Go into the cloud flows that have **Status**=*Off*.
1. Select **Turn on** on the command bar.

## Step 5 : Use the SAP Setup Assistant

You're now ready to use the **SAP Setup Assistant** canvas app, installed as part of the SAP Setup Assistant solution.

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the SAP Setup Assistant template.

Learn more about the [SAP Setup Assistant](./overview.md) solution.
