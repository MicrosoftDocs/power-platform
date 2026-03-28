---
title: Get started setting up the governance components
description: Prerequisites and instructions for setting up the governance components of the CoE Starter Kit.
author: manuelap-msft
ms.component: pa-admin
ms.topic: get-started
ms.date: 08/21/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
---
# Before setting up the governance components

This article will provide you with prerequisite steps to perform before setting up the governance components of the CoE Starter Kit.

>[!IMPORTANT]
>Complete the instructions in [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) before continuing with the setup here. This article assumes you have your environment set up and are signed in with the correct identity.

## Set up Microsoft Power Automate Approvals

Many flows in the solution use the built-in approval actions of Power Automate, and therefore require it to be installed in the environment.

If you're installing the solution in a new environment or one in which approvals haven't been used in the past, the approval tables must be initialized before you can install the solution. 

1. Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com/environments) and open your CoE environment.

1. Click **Dynamics 365 apps** located in the Resources section. 
 
1. From the toolbar, click **Install app**.

1. Pick **Microsoft Flow Approvals** and click **Next**.

1. Agree to the terms of service and then click **Install**.

    > [!NOTE]
    > The installation process can take up to ten minutes to run. You can hit **Refresh** to check the status.

1. Go to [Power Apps](https://make.powerapps.com), select **Solutions** on the left side panel, and you should now see two new Flow Approvals solutions. Note that the presence of these solutions was the point of this step, and the way you know it succeeded.


## Import the governance components solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

    >[!IMPORTANT]
    > Extract the zip file after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components in addition to the non–solution-aware components that make up the CoE Starter Kit.

1. Import the solution: Use the CenterOfExcellenceAuditComponents_x_x_x_xx_managed.zip solution file from the download when [installing the solution in your production environment](faq.md#install-a-solution-in-a-production-environment).

1. Leave all environment variables blank on import.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
