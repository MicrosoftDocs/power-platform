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
# Extend, customize, and modify components

Before making any changes to the Center of Excellence (CoE) Starter Kit, follow the steps under [Extending the Starter Kit](setup.md#extending-the-starter-kit) and create a new unmanaged solution for your changes.

## Change the Welcome email from Office 365 Groups to an Azure AD security group

If you'd prefer to use an Azure Active Directory (Azure AD) security group instead of an Office 365 group<!--Instance of the service is lowercase; service name ("Office 365 Groups") is uppercase.--> for your makers, you can modify the *Admin \| Welcome Email* flow.  

>[!NOTE]
>Using an Azure AD security group will allow you to share apps with your maker security group. Currently, apps can't be shared with Office 365 Groups.

1. Go to [make.powerapps.com](<https://make.powerapps.com>) and set the current environment to the environment where the CoE solution is installed.

1. Select **Solutions** > **Center of Excellence**.

1. Select **Flow** from the filter option at the top.

1. Select the **Admin \| Welcome Email** flow, and then select **Edit** on the flow Details page.

1. Update **Initialize Office 365 Group ID** with your Azure AD group ID (you can rename the variable and action as well).

1. Remove the **List Group members** action.

1. In the same place, select **+ Add an action**, and then search for and insert **Get Group Members** from the Azure AD connector.

1. Set the **Group ID** to the **office365GroupID** variable from dynamic content.<Br> ![Get group members](media/coe74.png "Get group members")

1. Select the **condition** and on the string expression in the value on the left<!--note from editor: What does this mean? -->. Update *List_group_members* to *Get_group_members* in the body of the expression. The expression should look like the highlighted area below. ![Update the flow condition](media/coe75.png "Update the flow condition")

1. Open the **No** branch of the condition to remove the **Add member to group** action.

1. In the same place, select **+ Add an action**, and then search for and insert **Add user to group** from the Azure AD connector. 
1. Set the **Group ID** to the **office365GroupID** variable and the **User Id** to Maker (from dynamic content).<!--note from editor: This graphic is used twice in a row.--> ![Add user to group action](media/coe75.png "Add user to group action")

1. Select **Save**.

## Set up the Template Catalog and upload components

Open the Template Catalog (canvas app) and edit the SharePoint connection to point to your new document library.

1. Browse to the *Center of Excellence - Nurture solution solution.*
1. Select Template Catalog, and then select **Edit**.
1. Select **File** > **Save As** to create your own copy so that updates to the starter kit don't erase your changes. Add your copy of the Template Catalog to your unmanaged solution.
1. Go back to your copy of the Template Catalog.
1. Select **data** on the left, and remove the reference to the SharePoint document library shown.<br> ![Template Catalog setup SharePoint connection](media/coe76.png "Template Catalog setup SharePoint connection")

1. In the search bar under **Data sources**, enter **SharePoint**, select the SharePoint data source shown, and then select **Add a connection**.<!-- note from editor: The alt text shouldn't be the same as for the previous image.--><br>![Template Catalog setup SharePoint connection](media/coe77.png)

1. Choose to connect directly, enter the URL of the library, and then select **Connect**.

1. Select the AppTemplates library, and then select **Connect**.

1. In the tree view on the left, select **Screen1**, and then select **HomeScreen** to repopulate the gallery.

Your template catalog is now ready
![Template Catalog](media/coe78.png "Template Catalog")

### Controls provided
<!--note from editor: This lost me. Are we still talking about the Template Catalog? When I look at the contents of the zip file, I don't see anything that's described below except the Calendar Control. I can't with this. %%% -->
We are providing you with three components to get started, download them from [GitHub](https://github.com/microsoft/powerapps-tools/raw/master/Administration/CoEStarterKit/Individual%20Components/CoE%20Starter%20Components.zip). Here is
description of them. The demo app included in the Template Catalog list shows all three in action.

All three components provide a Style Property which allows you to set default look and feel for people that use the components, otherwise they default to the app theme.

*Dual Range Slider*: This control let's user get two values from an input range. The values can then be used to filter galleries, or define limits, within their
appli

*Calendar Control*: Similar to the Dual Range Slider, this control let's user get a date, or a date range. The date(s) can then be used to filter galleries,
or define limits, within their applications

*Header with Navigation Control:* This control allows users to have their header and navigation pre-built for them, and not have to re-do. It helps you to streamline the look and feel across your organization.

The user must specify in the *MenuList* property, the Screen Names for
navigation

```
Table(
    {TextShown: "Home Screen", Screen: App.ActiveScreen},
    {TextShown: "Search", Screen: App.ActiveScreen},
    {TextShown: "Contact", Screen: App.ActiveScreen})
```

:::row:::
   :::column span="":::
      ![Component Example](media/coe79.png)
   :::column-end:::
   :::column span="":::
      ![Component Example](media/coe80.jpg)
   :::column-end:::
:::row-end:::
