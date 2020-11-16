---
title: "Tutorial: Build a model-driven app for deployment using GitHub Actions for Microsoft Power Platform | Microsoft Docs"
description: "In this tutorial, build a Microsoft Dataverse model-driven app for later deployment using GitHub Actions for Microsoft Power Platform."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: jstrauss
ms.custom: ""
ms.date: 10/14/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "tutorial"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
#Customer intent: As a developer, I want to use GitHub Actions so that my solution builds and deployment will be automated.
---

# Tutorial: Build a model-driven app for deployment using GitHub Actions for Microsoft Power Platform

In this tutorial, you will be creating a simple model-driven app to deploy using GitHub Actions for Microsoft Power Platform in the next tutorial.

> [!div class="checklist"]
> * Create a model-driven app

In the next tutorial, you will learn how to:

> [!div class="checklist"]
> * Export and deploy your app using application lifecycle management (ALM) automation

## Build a model-driven app

Follow the steps below to build a model-driven app.

1. In your browser, navigate to https://make.powerapps.com and sign in with your credentials.  Click the environment selector dropdown in the header and select your development environment.

    ![Select environment](../media/github-actions-tutorial/gh-lab-1.10.png "Select environment")

2. Click the **Solutions** area in the left navigation, and then click the **New solution** button to create a new solution.

    ![New solution](../media/github-actions-tutorial/gh-lab-1.20.png "New solution")
 
3. In the side panel that appears, enter a name for the application and click the dropdown for the publisher, and then click the **Add Publisher** option.

    > [!NOTE]
    > The solution publisher specifies who developed the app, so you should always create a solution publisher name that is meaningful. Furthermore, the solution publisher includes a prefix, which helps you distinguish system components or components introduced by others and is also a mechanism to help avoid naming collisions. This allows for solutions from different publishers to be installed in an environment with minimal conflicts.

    ![Create solution](../media/github-actions-tutorial/gh-lab-1.30.png "Create solution")

4. A new window will be displayed.  If a window does not open, check your browser's popup blocker settings.  For the purposes of this lab, enter 'ALMLab' for the display name, name, and prefix, and then choose **Save and Close**.

    ![Create publisher](../media/github-actions-tutorial/gh-lab-1.40.png "Create publisher")

5. On the new solution panel, select the publisher that you just created, give the application a version number, and select **Create** to create a new unmanaged solution in the environment.

    ![New unmanaged solution](../media/github-actions-tutorial/gh-lab-1.50.png "New unmanaged solution")

6. In the solutions list, select the solution you just created and click the **Edit** button.

    ![Edit solution](../media/github-actions-tutorial/gh-lab-1.60.png "Edit solution")

7. Your new solution will be empty, and you need to add components to it. In this tutorial we will create a custom entity.  Click the **New** dropdown from the top navigation and then select **Entity**.

    ![New entity](../media/github-actions-tutorial/gh-lab-1.70.png "New entity")

8. Enter a display name and plural name for the entity. The system will fill out the entity name and other fields for you. Click **Create** to create the entity.

    ![Create entity](../media/github-actions-tutorial/gh-lab-1.80.png "Create entity")

9. Once your entity is created, select the solution name again to go back to the solution view to add another component.

10. Click the **New** dropdown, then **App**, and **Model-driven app**.

    ![New app](../media/github-actions-tutorial/gh-lab-1.100.png "New app")

11. Enter an application name, and then click the **Done** button.

    ![Enter app name](../media/github-actions-tutorial/gh-lab-1.110.png "Enter app name")

12. In the application designer, click the **Site Map** to edit it.

    ![Open sitemap](../media/github-actions-tutorial/gh-lab-1.120.png "Open sitemap")

13. In the sitemap editor, select **New Subarea** to get its current properties.

    ![Edit sitemap](../media/github-actions-tutorial/gh-lab-1.130.png "Edit sitemap")

14.	Select the **Entity** dropdown and select your custom entity to add to the sitemap.

    ![Add entity](../media/github-actions-tutorial/gh-lab-1.140.png "Add entity")

15.	Click **Save**, **Publish**, and then **Save And Close** to go back to the application designer.

    ![Save sitemap](../media/github-actions-tutorial/gh-lab-1.150.png "Save sitemap")

16.	Click **Save**, and then **Validate** to validate the application.

    ![Save and validate](../media/github-actions-tutorial/gh-lab-1.160.png "Save and validate")

17.	You should see one warning. View the warning, select **Publish**, and then **Play**.

    ![View warning and play](../media/github-actions-tutorial/gh-lab-1.170.png "View warning and play")

18.	You should now see how the application you just built looks.  You can use the application and close its tab when you are satisfied.

    ![View app](../media/github-actions-tutorial/gh-lab-1.180.png "View app")

> [!div class="nextstepaction"]
> [Next steps](./github-actions-deploy.md)

### See Also

[Automate your workflow from idea to production](https://github.com/features/actions)
