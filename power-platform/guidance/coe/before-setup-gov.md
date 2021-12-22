---
title: "Set up the CoE Starter Kit | MicrosoftDocs"
description: "Prerequisites and instructions for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2021
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Before setting up the Governance components

This article will provide you with pre-requisites before setting up the Governance components of the CoE Starter Kit.

>[!IMPORTANT]
> Get started by completing the **[Get started](setup.md)** and **[Setup Inventory](setup-core-components.md)** instructions. This article assumes you have your environment setup, and are logged in with the correct identity.

## Initialize flow approval tables in your environment

Many flows in the solution use the built-in Approval actions of Power Automate and therefore require it having been installed on the environment.

If you are installing the solution in a new environment, or one in which Approvals have not been used in the past, then the Approval tables must be initialized before you can install the solution. The easiest way to do this is to create a "dummy" approval flow.

1. Go to [flow.microsoft.com](https://flow.microsoft.com) and select your CoE environment.

1. Select **+ New** > **Instant (From Blank)**.

1. Pick **manually trigger a flow** as the trigger, and enter *Admin \| Dummy Approval Flow* as the name.

   ![Build an instant flow.](media/coe14.png "Build an instant flow")

1. Select **+ New Step** to add an approval action to the flow, and then search for and select **Create an approval**.

1. Select a dummy title, and enter your email address under **Assigned To**.

   ![Approval flow.](media/coe16.png "Approval flow")

1. In the upper-right corner, select **Test**, and then select **I'll perform the trigger action**.

1. Select **Save & Test**  

1. Select **Run Flow**  

    > [!NOTE]
    > This flow can take up to ten minutes to run initially. After it runs, you can delete the flow because it won't be needed anymore.

1. Select **Solutions** on the left side panel, and you should now see two new Flow Approvals solutions. Note that the presence of these solutions was the point of this step, and the way you know it succeeded.

   ![Flow Approval solutions.](media/coe17.png "Flow Approval solutions")

## Import the Governance components solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

    >[!IMPORTANT]
    > **Extract the zip file** after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components as well as non-solution aware components that make up the CoE Starter Kit.

1. Import the solution
    1. If [Installing to Production Environment](faq.md#installing-a-solution-in-a-production-environment) – use the solution file from the download called  CenterOfExcellenceAuditComponents_x_x_x_xx_managed.zip.
    1. If [Installing to Dataverse for Teams Environment](faq.md#installing-a-solution-in-a-dataverse-for-teams-environment) – use the solution file from the download called  CenterOfExcellenceAuditComponents_x_x_x_xx_managed.zip.

1. Leave all environment variables blank on import.

## Turn on child flows

There are several child flows which will need to be turned on in this order:

- HELPER – CloudFlowOperations
- HELPER – CanvasAppOperations
- HELPER – ObjectOperations

If you get an error turning on the flow, you may need to set the [run only user properties](faq.md#set-flow-run-only-users-properties) of the flow.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
