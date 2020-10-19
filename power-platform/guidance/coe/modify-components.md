---
title: "Extend, customize, and modify components | MicrosoftDocs"
description: "Extend, customize, and modify components of the CoE Starter kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Extend, customize, and modify components

Before making any changes to the Center of Excellence (CoE) Starter Kit, follow the steps in [Extending the starter kit](setup.md#extending-the-starter-kit) and create a new unmanaged solution for your changes.

## Change the Welcome email to an Azure AD security group

If you'd prefer to use an Azure Active Directory (Azure AD) security group instead of a Microsoft 365 group for your makers, you can modify the Admin \| Welcome Email flow.  

> [!NOTE]
> Using an Azure AD security group will allow you to share apps with your maker security group. Currently, apps can't be shared with Microsoft 365 groups.

1. Go to [make.powerapps.com](<https://make.powerapps.com>), and set the current environment to the environment where the CoE solution is installed.

1. Select **Solutions** > **Center of Excellence**.

1. Select **Flow** from the filter option at the top.

1. Select the **Admin \| Welcome Email** flow, and then select **Edit** on the flow details page.

1. Update **Initialize Office 365 Group ID** by using your Azure AD group ID (you can rename the variable and action as well).

1. Remove the **List Group members** action.

1. In the same place, select **+ Add an action**, and then search for and insert **Get Group Members** from the Azure AD connector.

1. Set the **Group ID** to the _office365GroupID_ variable from dynamic content.

    ![Get group members](media/coe74.png "Get group members")

1. Select the **condition**, and then on the string expression, update **List_group_members** to **Get_group_members** in the body of the expression.

1. Open the **No** branch of the condition, and remove the **Add member to group** action.

1. In the same place, select **+ Add an action**, and then search for and insert **Add user to group** from the Azure AD connector.

1. Set the **Group ID** to the *office365GroupID* variable and the **User Id** to the *Maker* variable from dynamic content.

    ![Add user to group action](media/coe75.png "Add user to group action")

1. Select **Save**.

## Set up the template catalog and upload components

Open Template Catalog (canvas app), and edit the SharePoint connection to point to your new document library.

1. Browse to **Center of Excellence - Nurture Components solution**.

1. Select **Template Catalog**, and then select **Edit**.

1. Select **File** > **Save As** to create your own copy so that any updates to the starter kit won't erase your changes. Add your copy of the template catalog to your unmanaged solution.

1. Go back to your copy of the template catalog.

1. On the left pane, select the **Data** icon, and remove the reference to the SharePoint document library.

    ![Template Catalog setup - modify SharePoint connection](media/coe76.png "Template Catalog setup - modify SharePoint connection")

1. In the search bar under **Data sources**, enter **SharePoint**, select the SharePoint data source, and then select **Add a connection**.

    ![Template Catalog setup - add a SharePoint connection](media/coe77.png "Template Catalog setup - add a SharePoint connection")

1. Choose to connect directly, enter the URL of the library, and then select **Connect**.

1. Select the **AppTemplates** library, and then select **Connect**.

1. In the tree view on the left, select **Screen1**, and then select **HomeScreen** to repopulate the gallery.

Your template catalog is now ready.

![Template catalog](media/coe78.png "Template catalog")

<!--- Commenting this out until version 3.20041.19 is live so that these msapp files will work in production
### Controls provided in the Template Catalog app

The following three components are included to help you get started with the Template Catalog. You can download them from [GitHub](https://github.com/microsoft/powerapps-tools/raw/master/Administration/CoEStarterKit/Individual%20Components/CoE%20Components.zip).

All three components provide a style property that you can use to set the default look and feel for people who use the components; if you don't modify this property, the components will use the default theme for the app.

**Dual range slider**: This control lets the user get two values from an input range. The values can then be used to filter galleries or define limits within their app.

**Calendar control**: Similar to the dual range slider, this control lets user get a date or a date range. The dates can then be used to filter galleries or define limits within their apps.

**Header with navigation control**: This control allows users to have their header and navigation prebuilt for them. It helps you to streamline the look and feel across your organization.

In the *MenuList* property, the user must specify the screen names to use for navigation.

```
Table(
    {TextShown: "Home Screen", Screen: App.ActiveScreen},
    {TextShown: "Search", Screen: App.ActiveScreen},
    {TextShown: "Contact", Screen: App.ActiveScreen})
```
:::row:::
   :::column span="":::
      ![Header with navigation control component](media/coe79.png "Header with navigation control component")
   :::column-end:::
   :::column span="":::
      ![Dual range slider component](media/coe80.jpg "Dual range slider component")
   :::column-end:::
:::row-end:::
--->
