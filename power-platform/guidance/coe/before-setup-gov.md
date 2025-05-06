---
title: "Get started setting up the governance components | MicrosoftDocs"
description: "Prerequisites and instructions for setting up the governance components of the CoE Starter Kit."
author: manuelap-msft

ms.component: pa-admin
ms.topic: get-started
ms.date: 01/24/2022
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Before setting up the governance components

This article will provide you with prerequisite steps to perform before setting up the governance components of the CoE Starter Kit.

>[!IMPORTANT]
>Complete the instructions in [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) before continuing with the setup here. This article assumes you have your environment set up and are signed in with the correct identity.

## Initialize flow approval tables in your environment

Many flows in the solution use the built-in approval actions of Power Automate, and therefore require it to be installed in the environment.

If you're installing the solution in a new environment or one in which approvals haven't been used in the past, the approval tables must be initialized before you can install the solution. The easiest way to do this is to create a "dummy" approval flow.

1. Go to [Power Automate](https://make.powerautomate.com) and select your CoE environment.

1. Select **+ Create**. 
 
1. Select **Instant cloud flow**.

1. Pick **manually trigger a flow** as the trigger, and enter **Admin \| Dummy Approval Flow** as the name.

   ![Build an instant flow.](media/coe14.png "Build an instant flow")

1. Select **+ New Step** to add an approval action to the flow, and then search for and select **Create an approval**.

1. Select a dummy title, and enter your email address under **Assigned to**.

   ![Approval flow.](media/coe16.png "Approval flow")

1. In the upper-right corner, select **Test**, and then select **I'll perform the trigger action**.

1. Select **Save & Test**.

1. Select **Run Flow**.

    > [!NOTE]
    > This flow can take up to ten minutes to run initially. After it runs, you can delete the flow because it won't be needed anymore.

1. Select **Solutions** on the left side panel, and you should now see two new Flow Approvals solutions. Note that the presence of these solutions was the point of this step, and the way you know it succeeded.

   ![Flow Approval solutions.](media/coe17.png "Flow Approval solutions")

## Import the governance components solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

    >[!IMPORTANT]
    > Extract the zip file after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components in addition to the non–solution-aware components that make up the CoE Starter Kit.

1. Import the solution: Use the CenterOfExcellenceAuditComponents_x_x_x_xx_managed.zip solution file from the download when [installing the solution in your production environment](faq.md#installing-a-solution-in-a-production-environment).

1. Leave all environment variables blank on import.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
