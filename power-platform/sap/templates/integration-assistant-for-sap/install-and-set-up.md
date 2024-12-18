---
title: Install and set up Integration assistant for SAP® solutions
description: Learn how to Install and set up Integration assistant for SAP® solutions.
author: microsoft-dustin
ms.author: drasener
contributors:
  - hidasa
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
  - EllenWehrle
  - MartinPankraz
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 12/11/2024
ms.service: power-platform
ms.subservice: sap
# Customer intent: As an administrator, I want to learn how to access, install, and set up the Integration assistant for SAP® solutions.
---

# Install and set up **Integration assistant for SAP® solutions**
To install and set up **Integration assistant for SAP® solutions**, follow the steps outlined in this article.
Step 1: Review prerequisites
Review the requirements, identify opportunities, and develop a plan of action that suits your organization's needs.

## Confirm licensing
-	Microsoft 365 Business or Enterprise plan with Teams
-	Copilot Studio (free license that must be assigned to your developers)
-	Copilot Studio message capacity

## Step 1: Set up environments and data policies

To successfully install and manage **Integration assistant for SAP® solutions**, confirm these resources and practices are in place.
- **Administrators**—Be sure admins with the necessary privileges are available to coordinate to assign licensing and create environments. You need:
    - A Microsoft Entra ID global or tenant user administrator to assign Copilot Studio and Power Automate licensing.
    - A Power Platform Administrator to create environments and assign Copilot Studio message capacity.
    - For more information, see [Microsoft Power Platform admin](/power-platform/admin).
- **Environments**—Follow [application lifecycle management (ALM)](/power-platform/alm) best practices in [creating and managing environments](/power-platform/admin/create-environment). Also consider:
    - A Power Platform environment is set up with a Dataverse database.
    - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment.
    - For more information, see [Environments overview](/power-platform/admin/environments-overview).
- **Data loss prevention policies**—Ensure the environment has access to the connectors used by **Integration assistant for SAP® solutions**:
    - [SAP ERP Connector](/connectors/saperp/).
    - For more information, see [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention).
- **Allocate environment capacity**—**Integration assistant for SAP® solutions** requires Copilot Studio message capacity in the production environment where the agent is deployed.

    1.	Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
    2.	Expand **Resources** on the left pane and select **Capacity**.
    3.	Select **Add-ons**.
    4.	Select **Assign to an environment**.
    5.	Search for the environment where the solution, **Integration assistant for SAP® solutions**, will be deployed.
    6.	Allocate **Microsoft Copilot Studio messages** to the environment.
        _For more information, see Copilot Studio messages and capacity management._

## Step 2: Create connections (optional)
Cloud flows need connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.
The installation requires you to set up two new connections. It's best to create connections before importing the solution to make the import smoother. If you create the connections during import, you must jump between browser windows.
To create the connections in advance, take these steps:
1.	Go to [Power Apps](https://make.powerapps.com/).
2.	Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:
    - [SAP ERP Connector](/connectors/saperp/).

## Step 3: Install solution files

### Download and manually install solution files
You can download either managed or unmanaged solution files from [GitHub](https://aka.ms/agents/integration-assistant-for-sap/github) to manually install into your prepared environment according to your organization's requirements.
1.	Download the managed or unmanaged solution files:
    - [Managed](https://aka.ms/agents/integration-assistant-for-sap/managed)
    - [Unmanaged](https://aka.ms/agents/integration-assistant-for-sap/unmanaged)
2.	Go to [Power Apps](https://make.powerapps.com/) and select the environment you prepared for the solution.
3.	Select **Solutions** on the left pane.
4.	Select **Import solution**.
5.	Browse for and select the **mpa_IntegrationAssistantForSAPsolutions** file downloaded in the previous step.
6.	Select **Next**.
7.	Review the Details and confirm Enable Plugin steps and flows included in the solutions remains checked, and then select **Next**.
8.	For each of the connections listed, select the existing connection created in the previous step. If you didn't create the connections in advance, create them now.
9.	Select **Import** to start the solution import process for the **Integration assistant for SAP® solutions**. Once the import is complete, you receive a notification.

For more information, see [Solution concepts](/power-platform/alm/solution-concepts-alm).

## Step 4: Publish to Teams
1.	In Copilot Studio, select the same environment where you previously installed the solution file for **Integration assistant for SAP® solutions**.
2.	Select **Agents** to review the list of agents in this environment.
3.	Open ****Integration assistant for SAP® solutions****.
4.	Select **Publish** to publish the current agent configuration so it can be deployed to channels.
5.	Select **Channels** and then select **Microsoft Teams**.

    
    > **Note**
    >
    > **Integration assistant for SAP® solutions** is designed for a Microsoft Teams experience, and the default authentication has been configured to **Authenticate with Microsoft**. For more information, see [Add user authentication to topics](/microsoft-copilot-studio/advanced-end-user-authentication).
    

6.	Select **Turn on Teams** to add the Microsoft Teams channel.
7.	Select **Edit details**. Review the information and make any desired changes to the icon, descriptions, and developer information for **Integration assistant for SAP® solutions**. When finished, select **Save**.
8.	Select **Availability options**. **Integration assistant for SAP® solutions** can be shared in several ways, including share via link, deploy to the Teams app store, or distribute as a custom app file. Choose your deployment method.
9.	If deploying to the Teams app store, you must also decide how broadly to share **Integration assistant for SAP® solutions**.
    - **a.** Select **Show to everyone in my org** to deploy **Integration assistant for SAP® solutions** to everyone in your organization, which submits the agent in the Microsoft Teams admin center for approval by Global Administrators and Teams Administrators. After approval, it appears in the **Built for my org** area of the Teams app catalog. For more information, see [Manage your apps in the Microsoft Teams admin center](/microsoftteams/manage-apps).
    - **b.** Select **Show to my teammates and shared users** to deploy **Integration assistant for SAP® solutions** to a more limited audience. Here, you can select both security groups and individual users. When finished with selections, select **Share** to save changes to the agent permissions.

For more information, see [Connect and configure an agent for Microsoft Teams](/microsoft-copilot-studio/publication-add-bot-to-microsoft-teams).
