---
title: "ALM Accelerator for Power Platform User Setup | MicrosoftDocs"
description: "Configuring user permissions to access the ALM Accelerator for Power Platform App and Pipelines."
author: mikefactorial
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: v-mikeochs
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# ALM Accelerator for Power Platform User Setup (Preview)

> [!NOTE]
> ALM Accelerator for Power Platform is currently in public preview. Please see Issues currently tagged as [vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the Roadmap to be completed prior to general availability. While in Public Preview it can be expected that there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the Public Preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

The AA4PP App is intended to be used by makers to increase productivity while developing solutions in Power Platform. Below are instructions for the setup of a maker's user account in Dataverse and Azure DevOps.

## Dataverse User Setup

So users can access resources in Dataverse when running the AA4PP app they need to be assigned the appropriate roles. The recommended way to assign roles is to create a Group Team in Dataverse to which all of your makers will be added and assign the appropriate role(s) to the team. Set up a group team as follows and you'll be able to manage your makers using Azure AD by adding and removing them from a Group.

1. Navigate to <https://admin.powerplatform.microsoft.com/>
1. **Select the Environment** in which the user exists
1. **Select See all under Teams** under the Access section
   ![Select See all under Teams](media/setup-almacceleratorpowerplatform-users/image-20210709143811208.png)
1. Select Create Team
   ![Select Create Team](media/setup-almacceleratorpowerplatform-users/image-20210709144020206.png)
1. Enter a **Team name, Business unit, Administrator and Select AAD Security Group as the Team type and Select a Membership Type and Select Next**.
   ![Enter New Teams Details](media/setup-almacceleratorpowerplatform-users/image-20210709145337373.png)
1. On the Manage security roles page, select the **ALM Power App Access** and **Basic User** role and **select Save**.

   ![Manage Security Roles](media/setup-almacceleratorpowerplatform-users/image-20210709150149120.png)

## Azure DevOps User Setup

For users to use the service connection from the ALM Accelerator App the Service Connections must provide **User** permissions to all users who should have access to the Service Connections. Update Permissions as follows for environments that user's should be able to access from the App, for example, Development environment(s):

1. Select the **Service Connection** to be **shared with users** from the **Service Connections** list.
   ![Select the Service Connection](media/almacceleratorpowerplatform-components/image-20210401084558807.png)
1. Select the **3 dots** in the top-right corner and Select **Security**.
   ![Select Security](media/almacceleratorpowerplatform-components/image-20210401084807231.png)
1. Select the **Group or User** you want to provide User permissions to in the Dropdown.
1. Select the **User** **Role** and Select **Add**
   ![Select the Group, User and Role](media/setup-almacceleratorpowerplatform/SetServiceConnectionPermissions.png)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
