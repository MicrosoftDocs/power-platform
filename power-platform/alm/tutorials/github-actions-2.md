---
title: "Tutorial: Automate solution deployment using GitHub Actions | Microsoft Docs"
description: "In this 3rd of a 3-part tutorial, learn how to automate solution deployment using GitHub Actions."
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

# Tutorial: Automate solution deployment using GitHub Actions (Preview)

In this hands-on lab, you will create a new repo and create two GitHub workflows using GitHub actions for the Power Platform. The workflows can automatically export your app (as an unmanaged solution)  from a development environment, generate a build artifact (managed solution) and deploy the app into production. The lab uses the **ALMLab.zip solution** you built in the ** module 1** and the environments you set up in **module 0**. 

If you are already familiar with the concept of multiple environments as well as how to use solutions to package your app, then you can safely skip the first two modules, and simply download and use the sample ALMLab solution available [here](https://github.com/microsoft/powerplatform-actions-lab/blob/main/solutions/ALMLab_1_0_0_1.zip) throughout this lab. 

## Create a GitHub Account
2.	Go to github.com and click ‘create account’ (or sign in if you have an existing account)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![Create account](../media/gh-lab-2.20.png "Create account")

3.	After you have created your account – create a repository by selecting 'Create repository'

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![Create repo](../media/gh-lab-2.30.png "Create repo")

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Note: You might see the following alternative landing screen: 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![Create repo](../media/gh-lab-2.35.png "Create repo") 

4.	Create your new repository and name it ‘poweractionslab’, make sure you select ‘Add a README file to initiate the repo and click ‘Create repository’

![Initiate](../media/gh-lab-2.40.png "Initiate")

### Create a new secret to be used by the GitHub actions
5.	Navigate to the repo from the link in the import wizard and select ‘Settings’ and navigate to ‘Secrets’ and click ‘New secret’

![Create secret](../media/gh-lab-2.50.png "Create secret")

6.	On the secrets page, name the secret ‘password’, type the password for the username you are using to connect to the Power Platform in the ‘Value’ and click ‘Add secret’. The password will be referenced in the yml files used to define the GitHub workflows later in this lab. 

![Create secret](../media/gh-lab-2.60.png "Create secret")

NOTE: In the preview, only username + password is supported. Support for Service Principals (Application User) will be available later in the fall 2020
7.	The password is now securely stored as a GitHub Secret

![Create secret](../media/gh-lab-2.70.png "Create secret")


## Create a workflow to export and unpack solution file to a new branch
8.	Next, click on ‘Actions’ and ‘set up a workflow yourself’

![Setup workflow](../media/gh-lab-2.80.png "Setup workflow")

9.	This will start a new YML file with a basic workflow to help you get started with GitHub actions. 

![Sample yml ](../media/gh-lab-2.90.png "Sample yml")


10.	Delete the pre-created content and paste the content from the ‘export-and-branch-solution.yml’ file in the Actions lab and rename the file to ‘export-and-branch-solution’

![Rename and replace content](../media/gh-lab-2.100.png "Rename and replace content")

11.	Update <ENVIRONMENTURL> with the url for the development environment you want to export from (for example https://poweractionsdev.crm.dynamics.com 
12.	Update <USERNAME> with the username you are using to connect to the environment
13.	You are now ready to commit your changes. Click ‘Start commit’, type ‘Create export yml’ in the title and add a description (optional). Next, click ‘Commit new file’

![Start commit](../media/gh-lab-2.130.png "Start commit")

14.	Congratulations – you have now created your first GitHub workflow, using the following actions:
- Who Am I: Ensures that you can successfully connect to the environment you are exporting from
- Export Solution: Exports the solution file from your development environment
- Unpack Solution: The solution file that is exported from the server is a zip file with consolidated configuration files.  These initial files are not suitable for source code management as they are not structured to make it feasible for source code management systems to properly do differencing on the files and capture the changes you want to commit to source control.  You need to ‘unpack’ the solution files to make them suitable for source control storage and processing.
•	Branch Solution: Creates a new branch to store the exported solution

## Test ‘export and unpack’ workflow
15.	Next, test that the workflow runs. Navigate to ‘Actions’ – ‘Run workflow’ and click ‘Run workflow’.

![Run workflow](../media/gh-lab-2.150.png "Run workflow")

16.	After 5 – 10 seconds the workflow will start, and you can click on the running workflow to monitor progress

![Click to view workflow](../media/gh-lab-2.160.png "Click to view workflow")

![View workflow](../media/gh-lab-2.165.png "View workflow")

17.	When the workflow is complete, validate that a new branch has been created with the solution unpacked to the solutions/ALMLab folder. Select ‘Code’ and then ‘Branches’

![View branches](../media/gh-lab-2.170.png "View branches")
 
18.	Select the branch that was created by the action

![Select branch](../media/gh-lab-2.180.png "Select branch")

19.	Validate that the solutions/ALMLab folder has been created in the new branch and then create a Pull request to merge the changes into the main branch. Click ‘Pull request’

![Create PR from branch](../media/gh-lab-2.190.png "Create PR from branch")

20.	In the ‘Open a Pull request’ screen, add a title and description (optional) and click ‘Create pull request’

![Open PR](../media/gh-lab-2.200.png "Open PR")

21.	The next screen showing the pull request, will confirm that branch has no conflict with the main branch and that the changes can be merged into the main branch automatically. Select ‘Squash and merge’  and then ‘Confirm squash and merge’

![Squash and merge](../media/gh-lab-2.210.png "Squash and merge")
 
22.	Navigate back to the main branch and validate the solution is now available there as well

## Create a workflow to generate build artifact and import to production
In this section, we will create an additional workflow that:
- Creates a managed solution and publishes it as a GitHub artifact
- Imports the build artifact into production

23.	Navigate to ‘Actions’ and select ‘New workflow’

![Create new workflow](../media/gh-lab-2.230.png "Create new workflow")

24.	Chose ‘setup a workflow yourself’ 

![DIY](../media/gh-lab-2.240.png "DIY")

25.	Rename the title of the workflow to ‘release-solution-to-prod’ and copy the content from the release-solution-to-prod.yml available from the Actions lab [here](https://github.com/microsoft/powerplatform-actions-lab/blob/main/sample-workflows/release-solution-to-prod.yml) and paste it into the ‘Edit new file’ screen. 

![Rename and paste](../media/gh-lab-2.250.png "Rename and paste")

26.	Update the following variables:
- Update <BUILDENVIRONMENTURL> with the url for the build environment you are using to generate the managed solution. 
For example https://poweractionsbuild.crm.dynamics.com
- Update <PRODUCTIONENVIRONMENTURL> with the url for the production environment you are deploying to. For example https://poweractionsbuild.crm.dynamics.com
•	Update <USERNAME> with the username you are using to connect to the environments

27.	Commit the changes. Click ‘start commit, add a title and description (optional). Next, click ‘Commit new file’

![Commit changes](../media/gh-lab-2.270.png "Commit changes")

## Test ‘release to prod’ workflow
You are now ready to test the last workflow. This workflow is triggered when a new release is 

28.	Navigate to ‘Releases’

![Navigate to releases](../media/gh-lab-2.280.png "Navigate to releases")

29.	Click ‘Draft a new release’

![Draft new release](../media/gh-lab-2.290.png "Draft new release")

30.	Add a ‘release tag’, a ‘title’ and click ‘Publish release’

![Create release](../media/gh-lab-2.300.png "Create release")
 
31.	Click on ‘Actions’ to view the running workflow

![Click to view workflow](../media/gh-lab-2.310.png "Click to view workflow")

32.	Click on the running workflow to view the actions as they run

![View workflow](../media/gh-lab-2.320.png "View workflow")

33.	Wait for each action to complete

![View branch](../media/gh-lab-2.330.png "View branch")

34.	Once the workflow has completed, log into your production environment and validate that the solution has been deployed as a managed solution. 

## Deploy update to an app and review changes before releasing. 
We will now test the end-to-end process and then see how we can view and validate changes to an app before it is deployed to production.

35.	Navigate to the ALMLab solution in your development environment and click ‘Edit’ 

![Edit solution](../media/gh-lab-2.350.png "Edit solution")
 
36.	Open the ‘Time off Request’ entity

![Open Time off entity](../media/gh-lab-2.360.png "Open Time off entity")

37.	Select ‘Add field’ and create the new field as outlined below:

![Add field](../media/gh-lab-2.370.png "Add field")

38.	Click ‘Done’

39.	Next, go back to your GitHub repo and navigate to ‘Actions’ – ‘Run workflow’ and click ‘Run workflow’. 

![Run workflow](../media/gh-lab-2.390.png "Run workflow")

40.	After 5 – 10 seconds the workflow will start and you can click on the running workflow to monitor progress

![Select workflow](../media/gh-lab-2.400.png "Select workflow")

![View workflow](../media/gh-lab-2.405.png "View workflow")

41.	When the workflow is complete, navigate to the new branch by selecting ‘Code’ and then ‘Branches’

![Navigate to branch](../media/gh-lab-2.410.png "Navigate to branch")

42.	Select the branch that was created by the workflow and click ‘New pull request’

![Create PR from branch](../media/gh-lab-2.420.png "Create PR from branch")

43.	Click ‘Pull request’ on the next screen

![Create PR from branch](../media/gh-lab-2.430.png "Create PR from branch")

44.	Add a title and then click ‘Create pull request’

![Create PR](../media/gh-lab-2.440.png "Create PR")

45.	In the Pull request screen, click the ‘Files changed’ tab

![Files changed](../media/gh-lab-2.450.png "Files changes")

46.	Notice that the change to the solution is highlighted in green to indicate that this section of the file was added when compared to the same file in the main branch. 

![View updates](../media/gh-lab-2.460.png "View updates")

47.	Navigate back to the pull request. Click on ‘Pull requests’ and then select the pull request.

![Select PR](../media/gh-lab-2.470.png "Select PR")

48.	In the ‘Pull request’ screen, select ‘Squash and merge’ to merge the updated solution file into your main branch. 

![Squash and merge](../media/gh-lab-2.480.png "Squash and merge")

49.	Follow step 28 – 34 to create a new release and validate that the updated solution has been deployed to your production environment

Congratulations, you have successfully setup a sample CI/CD workflow using GitHub actions!
