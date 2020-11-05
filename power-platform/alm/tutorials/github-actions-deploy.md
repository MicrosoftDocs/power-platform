---
title: "Tutorial: Automate solution deployment using GitHub Actions for Microsoft Power Platform | Microsoft Docs"
description: "In this tutorial, learn how to automate solution export and deployment using GitHub Actions for Microsoft Power Platform."
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

# Tutorial: Automate solution deployment using GitHub Actions for Microsoft Power Platform (Preview)
[This topic is pre-release documentation and is subject to change.]

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

3. Create your new repository and name it ‘poweractionslab’. Make sure you select **Add a README file** to initiate the repo and choose **Create repository**.

    ![Initiate repo](../media/github-actions-tutorial/gh-lab-2.40.png "Initiate repo")

### Create a new secret to be used by GitHub Actions

1. Navigate to the repo from the link in the import wizard and select **Settings**, navigate to **Secrets**, and then click **New secret**.

    ![New secret](../media/github-actions-tutorial/gh-lab-2.50.png "New secret")

2. On the secrets page, name the secret ‘password’. Type the password for the username you are using to connect to Power Platform into the **Value** field and select **Add secret**. The password will be referenced in the YML files used to define the GitHub workflows later in this lab.

    ![Create secret](../media/github-actions-tutorial/gh-lab-2.60.png "Create secret")

    > [!NOTE]
    > In the preview release, only username + password is supported. Support for service principals (application user) will be available later in Fall 2020.

    The password is now securely stored as a GitHub secret.

    ![Stored secret](../media/github-actions-tutorial/gh-lab-2.70.png "Stored secret")

## Create a workflow to export and unpack the solution file to a new branch

1. Select **Actions** and then **set up a workflow yourself**.

    ![Setup workflow](../media/github-actions-tutorial/gh-lab-2.80.png "Setup workflow")

    This will start a new YML file with a basic workflow to help you get started with GitHub Actions.

    ![Sample YML file](../media/github-actions-tutorial/gh-lab-2.90.png "Sample YML file")

2. Delete the pre-created content, paste the content from the [export-and-branch-solution.yml](https://github.com/microsoft/powerplatform-actions-lab/blob/main/sample-workflows/export-and-branch-solution.yml) file, and then rename the file to ‘export-and-branch-solution’.yml.

    ![Rename and replace content](../media/github-actions-tutorial/gh-lab-2.100.png "Rename and replace content")

3. Update `<ENVIRONMENTURL>` with the URL for the development environment you want to export from (for example: https://poweractionsdev.crm.dynamics.com).

4. Update `<USERNAME>` with the username you are using to connect to the environment.

5. You are now ready to commit your changes. Select **Start commit**, type **Create export yml** in the title field, and then add a description (optional). Next, click **Commit new file**.

    ![Start commit](../media/github-actions-tutorial/gh-lab-2.130.png "Start commit")

Congratulations, you have just created your first GitHub workflow using the following actions:

- **Who Am I**: Ensures that you can successfully connect to the environment you are exporting from.
- **Export Solution**: Exports the solution file from your development environment.
- **Unpack Solution**: The solution file that is exported from the server is a compressed (zip) file with consolidated configuration files. These initial files are not suitable for source code management as they are not structured to make it feasible for source code management systems to properly do differencing on the files and capture the changes you want to commit to source control. You need to ‘unpack’ the solution files to make them suitable for source control storage and processing.
- **Branch Solution**: Creates a new branch to store the exported solution.

## Test the export and unpack workflow

1. Next, test that the workflow runs. Navigate to **Actions**, **Run workflow**, and choose **Run workflow**.

    ![Run workflow](../media/github-actions-tutorial/gh-lab-2.150.png "Run workflow")

2. After 5–10 seconds the workflow will start, and you can select the running workflow to monitor progress.

    ![Click to view workflow](../media/github-actions-tutorial/gh-lab-2.160.png "Click to view workflow")

    ![Select adn view workflow](../media/github-actions-tutorial/gh-lab-2.165.png "Select and view workflow")

3. After the workflow has completed, validate that a new branch has been created with the solution unpacked to the solutions/ALMLab folder. Select **Code** and then **Branches**.

    ![View branches](../media/github-actions-tutorial/gh-lab-2.170.png "View branches")
 
4. Select the branch that was created by the action.

    ![Select branch](../media/github-actions-tutorial/gh-lab-2.180.png "Select branch")

5. Validate that the solutions/ALMLab folder has been created in the new branch and then create a pull request to merge the changes into the main branch. Click **Pull request**.

    ![Create PR from branch](../media/github-actions-tutorial/gh-lab-2.190.png "Create PR from branch")

6. In the **Open a pull request** form, add a title and description (optional), and then choose **Create pull request**.

    ![Open a pull request](../media/github-actions-tutorial/gh-lab-2.200.png "Open a pull request")

7. You are then presented with the pull request summary. Confirm that the branch has no conflicts with the main branch and that the changes can be merged into the main branch automatically. Select **Squash and merge** and then **Confirm squash and merge**.

    ![Squash and merge](../media/github-actions-tutorial/gh-lab-2.210.png "Squash and merge")
 
8. Navigate back to the main branch and validate the solution is now available there as well.

## Create a workflow to generate a build artifact and import to production

In this section, we will create an additional workflow that:
- Creates a managed solution and publishes it as a GitHub artifact
- Imports the build artifact into the production environment

1. Navigate to **Actions** and select **New workflow**.

    ![Create new workflow](../media/github-actions-tutorial/gh-lab-2.230.png "Create new workflow")

2. Chose **setup a workflow yourself**. 

    ![Set up a workflow](../media/github-actions-tutorial/gh-lab-2.240.png "Set up a workflow")

3. Rename the title of the workflow to ‘release-solution-to-prod’ and copy the content from the [release-solution-to-prod.yml](https://github.com/microsoft/powerplatform-actions-lab/blob/main/sample-workflows/release-solution-to-prod.yml) file and paste it into the **Edit new file** screen.

    ![Rename and paste code](../media/github-actions-tutorial/gh-lab-2.250.png "Rename and paste code")

4. Update the following variables in the new workflow file:
    - Update `<BUILDENVIRONMENTURL>` with the URL for the build environment you are using to generate the managed solution. For example: https://poweractionsbuild.crm.dynamics.com.
    - Update `<PRODUCTIONENVIRONMENTURL>` with the URL for the production environment you are deploying to. For example: https://poweractionsbuild.crm.dynamics.com.
    - Update `<USERNAME>` with the username you are using to connect to the environments.

5. Commit the changes. Choose **Start commit** and then add a title and description (optional). Next, select **Commit new file**.

![Commit changes](../media/github-actions-tutorial/gh-lab-2.270.png "Commit changes")

## Test the release to production workflow

You are now ready to test the last workflow. This workflow is triggered when a new release is deployed to production.

1. Navigate to **Releases**.

    ![Navigate to releases](../media/github-actions-tutorial/gh-lab-2.280.png "Navigate to releases")

2. Select **Draft a new release**.

    ![Draft a new release](../media/github-actions-tutorial/gh-lab-2.290.png "Draft a new release")

3. Add a release tag, a title, and choose **Publish release**.

    ![Create release](../media/github-actions-tutorial/gh-lab-2.300.png "Create release")
 
4. Select **Actions** to view the running workflow.

    ![Select to view workflow](../media/github-actions-tutorial/gh-lab-2.310.png "Select to view workflow")

5. Choose the running workflow to view the actions as they run.

    ![View workflow](../media/github-actions-tutorial/gh-lab-2.320.png "View workflow")

6. Wait for each action to complete.

    ![View branch](../media/github-actions-tutorial/gh-lab-2.330.png "View branch")

7. After the workflow has completed, log into your production environment and validate that the solution has been deployed as a managed solution.

## Deploy the update and review changes before production release

We will now test the end-to-end process and then see how we can view and validate changes to an app before it is deployed to production.

1. Navigate to the ALMLab solution in your development environment and choose **Edit**.

    ![Edit solution](../media/github-actions-tutorial/gh-lab-2.350.png "Edit solution")
 
2. Select and view the **Time off Request** entity.

    ![View the entity](../media/github-actions-tutorial/gh-lab-2.360.png "View the entity")

3. Select **Add field** and create the new field as shown in the figure below.

    ![Add field](../media/github-actions-tutorial/gh-lab-2.370.png "Add field")

4. Select **Done**.

5. Navigate back to your GitHub repo to **Actions**, choose **Run workflow**, and select the **Run workflow** button.

    ![Run the workflow](../media/github-actions-tutorial/gh-lab-2.390.png "Run the workflow")

6. After 5–10 seconds, the workflow will start and you can click on the running workflow to monitor its progress.

    ![Select workflow](../media/github-actions-tutorial/gh-lab-2.400.png "Select workflow")

    ![View the workflow](../media/github-actions-tutorial/gh-lab-2.405.png "View the workflow")

7. After the workflow completes, navigate to the new branch by selecting **Code** and then **Branches**.

    ![Navigate to branch](../media/github-actions-tutorial/gh-lab-2.410.png "Navigate to branch")

8. Select the branch that was created by the workflow and choose **New pull request**.

    ![Create a pull request](../media/github-actions-tutorial/gh-lab-2.420.png "Create a pull request")

9. Select **Pull request** on the next page.

    ![New pull request](../media/github-actions-tutorial/gh-lab-2.430.png "New pull request")

10. Add a title and then choose **Create pull request**.

    ![Create pull request](../media/github-actions-tutorial/gh-lab-2.440.png "Create pull request")

11. On the pull request page, select the **Files changed** tab.

    ![Files changed](../media/github-actions-tutorial/gh-lab-2.450.png "Files changes")

12. Notice that the changes to the solution are highlighted in green to indicate that this section of the file was added when compared to the same file in the main branch.

    ![View updates](../media/github-actions-tutorial/gh-lab-2.460.png "View updates")

13. Navigate back to the pull request. Select **Pull requests** and then select the pull request previously created.

    ![Select pull request](../media/github-actions-tutorial/gh-lab-2.470.png "Select pull request")

14. On the **Pull request** page, select **Squash and merge** to merge the updated solution file into your main branch.

    ![Squash and then merge](../media/github-actions-tutorial/gh-lab-2.480.png "Squash and then merge")

15. Follow the steps in the [Test the release to production workflow](#test-the-release-to-production-workflow) section to create a new release and validate that the updated solution has been deployed to your production environment.

Congratulations, you have successfully setup a sample CI/CD workflow using GitHub actions!

### See Also

[Automate your workflow from idea to production](https://github.com/features/actions)
