---
title: "Tutorial: Automate solution deployment using GitHub Actions for Microsoft Power Platform | Microsoft Docs"
description: "In this tutorial, learn how to automate solution export and deployment using GitHub Actions for Microsoft Power Platform."
author: marcelbf
ms.author: marcelbf
ms.subservice: alm
ms.date: 10/14/2020
ms.reviewer: pehecke
ms.topic: tutorial
search.audienceType: 
  - maker
ms.custom: sfi-image-nochange
---

# Tutorial: Automate solution deployment using GitHub Actions for Microsoft Power Platform

In this tutorial, you will learn how to:

> [!div class="checklist"]
> * Create a new GitHub repository
> * Create two GitHub workflows using GitHub Actions for Microsoft Power Platform

 The workflows can automatically export your app (as an unmanaged solution) from a development environment, generate a build artifact (managed solution), and deploy the app into your production environment. This tutorial uses the [ALMLab solution](https://github.com/microsoft/powerplatform-actions-lab/blob/main/solutions/ALMLab_1_0_0_1.zip) you built and the environments you set up in previous tutorials.

Related tutorials: [Get started](github-actions-start.md), and [Build a model-driven app](github-actions-build.md).

## Create a GitHub Account

1. Go to https://github.com and click **Sign up** or **Start a free trial** (or sign in if you have an existing account).

    ![Create account](../media/github-actions-tutorial/gh-lab-2.20.png "Create account")

2. After you have created your account, create a repository by selecting **Create repository** or **New**.

    ![Create a repository](../media/github-actions-tutorial/gh-lab-2.30.png "Create a repository")

    You might see the following alternative landing screen:

    ![Create a new repository](../media/github-actions-tutorial/gh-lab-2.35.png "Create a new repository")

3. Create your new repository and name it 'poweractionslab'. Make sure you select **Add a README file** to initiate the repo and choose **Create repository**.

    ![Initiate repo.](../media/github-actions-tutorial/gh-lab-2.40.png "Initiate repo")

### Creating a new secret for Service Principal Authentication
1. Navigate to your repository and click **Settings**, then expand **Secrets**, and then and click **Actions**.

2. On the *Secrets* page, name the secret 'PowerPlatformSPN'. Use the client secret from the application registration created in Microsoft Entra and enter it into the **Value** field, and then select **Add secret**. The client secret will be referenced in the YML files used to define the GitHub workflows later in this lab.

    ![Create the service principal secret](../media/github-actions-tutorial/spn-secret-setup.gif "Create the service principal secret")

    The client secret is now securely stored as a GitHub secret.



## Create a workflow to export and unpack the solution file to a new branch

1. click on **Actions** and click **set up a workflow yourself** or click Configure in the *Simple workflow* box under the *suggested for this repository* section.

    ![Setup workflow.](../media/github-actions-tutorial/gh-lab-2.80.gif "Setup workflow")

2. This will start a new YAML file with a basic workflow to help you get started with GitHub actions.

    ![Sample YML file](../media/github-actions-tutorial/gh-lab-2.90.png "Sample YML file")

3. Delete the pre-created content, paste the content from the [export-and-branch-solution-with-spn-auth.yml](https://github.com/microsoft/powerplatform-actions-lab/blob/main/sample-workflows/export-and-branch-solution-with-spn-auth.yml) file, and then rename the file to 'export-and-branch-solution'.yml.

    ![Rename and replace content.](../media/github-actions-tutorial/gh-lab-2.100.png "Rename and replace content")

4. Update `<ENVIRONMENTURL>` with the URL for the development environment you want to export from (for example: `https://poweractionsdev.crm.dynamics.com`).

5. Update `<APPID>` and `<TENANT ID>` with your values. 

    * If you are using credentials, paste the [export-and-branch-solution.yml](https://github.com/microsoft/powerplatform-actions-lab/blob/main/sample-workflows/export-and-branch-solution.yml) file instead of the *export-and-branch-solution-with-spn-auth.yml* file contents. Update `<USERNAME>` with the username you are using to connect to the environment.  

        ![Rename and replace content](../media/github-actions-tutorial/gh-lab-2.100a.png "Rename and replace content")

    > [!TIP]
    > If you are not familiar with GitHub Actions and want to learn more check out the official documentation at https://docs.github.com/en/actions. 

6. You are now ready to commit your changes. Select **Start commit**, type **Create export yml** in the title field, and then add a description (optional). Next, click **Commit new file**.

    ![Start commit.](../media/github-actions-tutorial/gh-lab-2.130.gif "Start commit")

Congratulations, you have just created your first GitHub workflow using the following actions:

- **Who Am I**: Ensures that you can successfully connect to the environment you are exporting from.
- **Export Solution**: Exports the solution file from your development environment.
- **Unpack Solution**: The solution file that is exported from the server is a compressed (zip) file with consolidated configuration files. These initial files are not suitable for source code management as they are not structured to make it feasible for source code management systems to properly do differencing on the files and capture the changes you want to commit to source control. You need to 'unpack' the solution files to make them suitable for source control storage and processing.
- **Branch Solution**: Creates a new branch to store the exported solution.

## Test the export and unpack workflow

1. Next, test that the workflow runs. Navigate to **Actions**, **Run workflow**, and choose **Run workflow**. If you have a different solution name than 'ALMLab' then change the value here but leave the other values as is. 

    ![Run workflow.](../media/github-actions-tutorial/gh-lab-2.150.png "Run workflow")

2. After 5–10 seconds the workflow will start, and you can select the running workflow to monitor progress.

    ![Click to view workflow.](../media/github-actions-tutorial/gh-lab-2.160.png "Click to view workflow")

    ![Select adn view workflow.](../media/github-actions-tutorial/gh-lab-2.165.png "Select and view workflow")

3. After the workflow has completed, validate that a new branch has been created with the solution unpacked to the solutions/ALMLab folder. **Navigate to the *Code* tab** and **expand the *branches* drop-down**.

4. Select the branch that was created by the action.

5. Validate that the solutions/ALMLab folder has been created in the new branch and then create a Pull request to merge the changes into the main branch. **Click *Contribute*** and in the flyout **click *Open Pull request***.

6. On the *Open a Pull request* screen, add a title and description, as desired, then **click *Create pull request.***

7. The screen will update showing the newly create pull request. As the pull request is created confirmation will be provided showing that our branch has no conflict with the main branch. This confirmation means that the changes can be merged into the main branch automatically. **Click *Merge pull request***  and then **click *Confirm merge***. Optionally, click delete branch to clean up the now defunct branch.

    ![View branches](../media/github-actions-tutorial/gh-lab-2.170.gif "Open pull request for new branch and merge to default branch")

8. Navigate back to the default (main) branch and validate the solution is now available there as well.

## Create a reusable workflow to generate a build artifact and import to production

In this section, we will create an additional workflow that:
- Creates a managed solution and publishes it as a GitHub artifact
- Imports the build artifact into the production environment

1. Navigate to **Actions** and select **New workflow**.

    ![Create new workflow.](../media/github-actions-tutorial/gh-lab-2.230.png "Create new workflow")

2. Chose **setup a workflow yourself**.

    ![Set up a workflow.](../media/github-actions-tutorial/gh-lab-2.240.png "Set up a workflow")

3. Rename the title of the workflow to 'release-solution-to-prod-with-inputs' and copy the content from the [release-solution-to-prod-with-inputs.yml](https://github.com/microsoft/powerplatform-actions-lab/blob/main/sample-workflows/release-solution-to-prod-with-inputs.yml) file and paste it into the **Edit new file** screen.

    ![Rename and paste code.](../media/github-actions-tutorial/gh-lab-2.250.png "Rename, and paste code")

4. Commit the changes. Choose **Start commit** and then add a title and description (optional). Next, select **Commit new file**.

    ![Commit changes.](../media/github-actions-tutorial/gh-lab-2.270.png "Commit changes")

## Call the reusable workflow on the release event

In this section, we will call the reusable workflow on the [release event](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#release).

1. Navigate to **Actions** and select **New workflow**.

    ![Create new workflow.](../media/github-actions-tutorial/gh-lab-2.230.png "Create new workflow")

2. Choose **setup a workflow yourself**.

    ![Set up a workflow.](../media/github-actions-tutorial/gh-lab-2.240.png "Set up a workflow")

3. Rename the title of the workflow to 'release-action-call' and copy the content from the [release-action-call.yml](https://github.com/microsoft/powerplatform-actions-lab/blob/main/sample-workflows/release-action-call.yml) file and paste it into the **Edit new file** screen.

    ![Rename and paste code.](../media/github-actions-tutorial/gh-lab-2.251.png "Rename and paste code")

4. Update the following variables in the new workflow file:
    - Update `<BUILD_ENVIRONMENT>` with the URL for the build environment you are using to generate the managed solution. For example: `https://poweractionsbuild.crm.dynamics.com`.
    - Update `<PROD_ENVIRONMENT>` with the URL for the production environment you are deploying to. For example: https://poweractionsprod.crm.dynamics.com.
    - Update `<APP_ID>` with the Application (Client) ID that can be found in the [App registrations blade of the Microsoft Azure Portal](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade) by clicking into the registration created previously in this tutorial.
    - Update `<TENANT_ID>` with the Directory (tenant) ID that can be found in the [App registrations blade of the Microsoft Azure Portal](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade) by clicking into the registration created previously in this tutorial.

5. Commit the changes. Choose **Start commit** and then add a title (optional) and description (optional). Next, select **Commit new file**.

    ![Commit changes.](../media/github-actions-tutorial/gh-lab-2.270b.png "Commit changes")


## Test the release to production workflow

You are now ready to test the last workflow. This workflow is triggered when a new release is deployed to production.

1. Navigate to **Releases**.

    ![Navigate to releases.](../media/github-actions-tutorial/gh-lab-2.280.gif "Navigate to releases")

2. Select **Draft a new release**.

3. Add a release tag, a title, and choose **Publish release**.

4. Select **Actions** to view the running workflow.

    ![Select to view workflow.](../media/github-actions-tutorial/gh-lab-2.310.png "Select to view workflow")

5. Choose the running workflow to view the actions as they run.

    ![View workflow.](../media/github-actions-tutorial/gh-lab-2.320.png "View workflow")

6. Wait for each action to complete.

    ![View branch.](../media/github-actions-tutorial/gh-lab-2.330.png "View branch")

7. After the workflow has completed, log into your production environment and validate that the solution has been deployed as a managed solution.

## Deploy the update and review changes before production release

We will now test the end-to-end process and then see how we can view and validate changes to an app before it is deployed to production.

1. Navigate to the ALMLab solution in your development environment and choose **Edit** or click the solutions display name.

    ![Edit solution.](../media/github-actions-tutorial/gh-lab-2.350.png "Edit solution")

2. Select and view the **Time off Request** table.

    ![View the table.](../media/github-actions-tutorial/gh-lab-2.360.png "View the table")

3. Click **+ Add column** and create the new column as shown in the figure below.

    ![Add column.](../media/github-actions-tutorial/gh-lab-2.370.png "Add column")

    **Updated Field values**:**

    - **Display name**: Approved
    - **Data type**: Yes/No

4. Click **Done**.

5. Click **Save Table**
    ![Add column.](../media/github-actions-tutorial/gh-lab-2.370b.png "Add column")

6. Navigate back to your GitHub repositories **Actions** tab, choose **Run workflow**, and select the **Run workflow** button.

    ![Run the workflow.](../media/github-actions-tutorial/gh-lab-2.390.png "Run the workflow")

7. After 5–10 seconds, the workflow will start and you can click on the running workflow to monitor its progress.

    ![Select workflow.](../media/github-actions-tutorial/gh-lab-2.400.png "Select workflow")

    ![View the workflow.](../media/github-actions-tutorial/gh-lab-2.405.png "View the workflow")

8. After the workflow completes, navigate to the new branch by selecting **Code** and then **Branches**.

    ![Navigate to branch.](../media/github-actions-tutorial/gh-lab-2.410.png "Navigate to branch")

9. Select the branch that was created by the expand **contribute** and click **Open pull request**.

10. Add a title (optional) and then click **Create pull request**.

11. After the content updates, click the **Files changed** tab.

12. Notice that the changes to the solution are highlighted in green to indicate that this section of the file was added when compared to the same file in the main branch.

13. Navigate back to the **Conversation** tab. Select **Pull requests** and then select the pull request previously created.

14. On the **Pull request** page, select **Squash and merge** to merge the updated solution file into your main branch, optionally delete that is now merged into main.

     ![Open pull request for new branch, view changes and merge to default branch](../media/github-actions-tutorial/gh-lab-2.420.gif "Open pull request for new branch, view changes and merge to default branch")

15. Follow the steps in the [Test the release to production workflow](#test-the-release-to-production-workflow) section to create a new release and validate that the updated solution has been deployed to your production environment.

Congratulations, you have successfully setup a sample CI/CD workflow using GitHub actions!

### See Also

[Automate your workflow from idea to production](https://github.com/features/actions)


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
