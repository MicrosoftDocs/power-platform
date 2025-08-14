---
title: Install and set up Account assistant for SAP solutions
description: Learn how to install and set up Account assistant for SAP solutions so you can translate business-oriented goals into actionable SAP NetWeaver tasks.
author: ryanb58
ms.author: tbrazelton
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
ms.topic: how-to
ms.date: 02/11/2025
ms.service: power-platform
ms.subservice: sap
# Customer intent: As an administrator, I want to learn how to access, install, and set up the Account assistant for SAP solutions.
---

# Install and set up Account assistant for SAP solutions

To install and set up **Account assistant for SAP solutions**, be sure you review the prerequisites before you get started. Once you have all the requirements, follow the steps outlined in this article to install and set up the agent.

## Prerequisites

- [Microsoft 365 Business or Enterprise plan with Teams](/office365/servicedescriptions/teams-service-description)
- [Copilot Studio](/microsoft-copilot-studio/requirements-licensing-subscriptions) (free license that must be assigned to your developers)
- [Copilot Studio message capacity](/microsoft-copilot-studio/requirements-messages-management)
- [Power Automate Premium or per flow plan](/power-platform/admin/power-automate-licensing/types?tabs=power-automate-premium%2Cpower-automate-process%2Cconnector-types)
- [Microsoft Power Platform and SAP integration](/power-platform/sap/connect/connect-power-platform-and-sap)

## Step 1: Set up environments and data policies

To successfully install and manage **Account assistant for SAP solutions**, confirm these resources and practices are in place.

- **Administrators**: Be sure admins with the necessary privileges are available to coordinate to assign licensing and create environments. You need:
  - A Microsoft Entra ID global or tenant user administrator to assign Copilot Studio and Power Automate licensing.
  - A [Power Platform Administrator](/power-platform/admin) to create environments and assign Copilot Studio message capacity.
- **Environments**: Follow [application lifecycle management (ALM)](/power-platform/alm) best practices in [creating and managing environments](/power-platform/admin/create-environment). Also consider:
  - A Power Platform environment is set up with a Dataverse database.
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment.
  - For more information, see [Environments overview](/power-platform/admin/environments-overview).
- **Data loss prevention policies**: Ensure the environment has access to the connectors used by **Account assistant for SAP solutions**:
  - [Microsoft Teams connector](/connectors/teams/).
  - [SAP ERP Connector](/connectors/saperp/).
  - For more information, see [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention).
- **Allocate environment capacity**—**Account assistant for SAP solutions** requires Copilot Studio message capacity in the production environment where the agent is deployed.

    1. Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
    1. Expand **Resources** on the left pane and select **Capacity**.
    1. Select **Add-ons**.
    1. Select **Assign to an environment**.
    1. Search for the environment where the solution, **Account assistant for SAP solutions**, will be deployed.
    1. Allocate **Microsoft Copilot Studio messages** to the environment.
        _For more information, see Copilot Studio messages and capacity management._

## Step 2: Create connections (optional)

Cloud flows need connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.
The installation requires you to set up two new connections. It's best to create connections before importing the solution to make the import smoother. If you create the connections during import, you must jump between browser windows.
To create the connections in advance, take these steps:

1. Go to [Power Apps](https://make.powerapps.com/).
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:
    - [Microsoft Teams Connector](/connectors/teams/).
    - [SAP ERP Connector](/connectors/saperp/).

## Step 3: Install solution files

You can download either managed or unmanaged solution files from [GitHub](https://aka.ms/agents/account-assistant-for-sap/github) to manually install into your prepared environment according to your organization's requirements. Skip this step if you previously installed from Microsoft AppSource:

1. Download the managed or unmanaged solution files:
    - [Managed](https://aka.ms/agents/account-assistant-for-sap/managed)
    - [Unmanaged](https://aka.ms/agents/account-assistant-for-sap/unmanaged)
1. Go to [Power Apps](https://make.powerapps.com/) and select the environment you prepared for the solution.
1. Select **Solutions** on the left pane.
1. Select **Import solution**.
1. Browse for and select the **mpa_AccountAssistantForSAPsolutions** file downloaded in the previous step.
1. Select **Next**.
1. Review the Details and confirm _Enable Plugin steps and flows_ included in the solutions remains checked, and then select **Next**.
1. For each of the connections listed, select the existing connection created in the previous step. If you didn't create the connections in advance, create them now.
1. Select **Import** to start the solution import process for the **Account assistant for SAP solutions**. Once the import is complete, you receive a notification.

Learn more: [Solution concepts](/power-platform/alm/solution-concepts-alm).

## Step 4: Publish to Teams

1. In Copilot Studio, select the same environment where you previously installed the solution file for **Account assistant for SAP solutions**.
1. Select **Agents** to review the list of agents in this environment.
1. Open ****Account assistant for SAP solutions****.
1. Select **Publish** to publish the current agent configuration so it can be deployed to channels.
1. Select **Channels** and then select **Microsoft Teams**.
1. Select **Turn on Teams** to add the Microsoft Teams channel.
1. Select **Edit details**. Review the information and make any desired changes to the icon, descriptions, and developer information for Account assistant for SAP solutions. When finished, select **Save**.
1. Select **Availability options**. Account assistant for SAP solutions can be shared in several ways, including _share via link_, _deploy to the Teams app store_, or _distribute as a custom app file_. Choose your deployment method.
1. If deploying to the Teams app store, you must also decide how broadly to share **Account assistant for SAP solutions**.
    - Select **Show to everyone in my org** to deploy _Account assistant for SAP solutions_ to everyone in your organization, which submits the agent in the Microsoft Teams admin center for approval by Global Administrators and Teams Administrators. After approval, it appears in the _Built for my org_ area of the Teams app catalog. Learn more:[Manage your apps in the Microsoft Teams admin center](/microsoftteams/manage-apps).
    - Select **Show to my teammates and shared users** to deploy Account assistant for SAP solutions to a more limited audience. Here, you can select both _security groups_ and _individual users_. When finished with selections, select **Share** to save changes to the agent permissions.

> [!NOTE]
> Account assistant for SAP solutions is designed for a Microsoft Teams experience, and the default authentication has been configured to **Authenticate with Microsoft**. Learn more: [Add user authentication to topics](/microsoft-copilot-studio/advanced-end-user-authentication).

Learn more: [Connect and configure an agent for Microsoft Teams](/microsoft-copilot-studio/publication-add-bot-to-microsoft-teams).
