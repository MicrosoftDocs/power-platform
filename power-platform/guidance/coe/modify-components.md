---
title: "Non-solution aware | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Extend, customize and modify components o

## Change Welcome Email from Office 365 Group to Azure AD Security Group

If you would prefer to use an Azure AD Security Group instead of an Office 365
Group for your makers, the **Admin \| Welcome Email** Flow needs amending.  
Note: Using an Azure AD Security Group will allow you to share apps with this
your maker security group. Currently, apps can not be shared with Office 365
Groups

1. Go to <https://make.powerapps.com> and set the current Environment to the
    same Environment where the Center of Excellence solution is installed

1. Select **Solutions** \> **Center of Excellence**

1. Select Flow from the Filter option at the top

1. Select the ellipse (…) menu of Admin \| Welcome Email and \> **Edit**

1. Update the "**Initialize Office 365 Group ID**" with your Azure AD Group ID (you can rename the variable and action as well) ![A screenshot of a cell phone Description automatically generated](media/d89cbdb76af279cb4a283575b6a14067.png)

1. Remove the List Group members action underneath

1. In the same place, select + Add an action, search for and insert "**GetvGroup Members**" from the Azure AD connector. Set the Group ID to the office365GroupID variable from dynamic content. ![A screenshot of a cell phone Description automatically generated](media/fa59d4f7cd4f42b19edf583e32b77bbb.png)

1. Click on the **condition** and on the string expression in the left hand value. Update 'List_group_members' to 'Get_group_members' in the body of the expression – the expression should look like the highlighted below. ![A screenshot of a cell phone Description automatically generated](media/5f14e4315489330753629ad57f53690f.png)

1. Open the No branch of the condition and remove the **Add member to group** action

1. In the same place, select + Add an action, search for and insert "**Add user to group**" from the Azure AD connector. Set the Group ID to the office365GroupID variable and the User Id to Maker (from Dynamic Content)  ![A screenshot of a cell phone Description automatically generated](media/fba82c482ebad5d39a594c1d433866f9.png)

1. Save the Flow
