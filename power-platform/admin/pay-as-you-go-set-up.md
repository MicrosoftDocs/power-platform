---
title: "Preview: Set up pay-as-you-go | MicrosoftDocs"
description: About setting up pay-as-you-go.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/26/2021
ms.subservice: admin
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Preview: Set up pay-as-you-go

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

## Who can set it up?

The following table describes the permissions of who can create a billing policy to link an environment to the Azure subscription. These permissions apply to both the Power Apps and the Power Platform admin center experience.

| **Role**  | **Create a billing policy** | **Edit a billing policy**   | **Link environments to a billing policy**   |
|--------|----------|-------|-----|
| Environment admin    | Yes  | Yes for billing policies the admin created | Yes for billing policies the admin created and for environments they are Environment admins for. |
| Power Platform admin | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant  |
| Global admin         | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant   |
| D365 Admin           | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant    |



## How to set up pay-as-you-go for an environment

1. Procure or create an Azure subscription you can use

   If you do not already have an Azure subscription in your tenant, please work through the standard process in your organization to obtain one or create a new one [here](https://azure.microsoft.com/free/). You will need to have permissions to create new resources and register resource providers in the subscription (or have the ability to work with an Azure subscription owner or contributor who can register resource providers). Learn more about [Azure subscriptions](https://go.microsoft.com/fwlink/?linkid=2174703).

2. Enable the Power Platform Account feature in the Azure portal. Note that this is temporary and will be automated. Here's how:

   1. Sign in to the Azure portal and start the Cloud Shell.

      :::image type="content" source="media/pay-as-you-go-azure-start-cloud-shell.png" alt-text="Start the Cloud Shell in Azure Portal":::

      Azure Cloud Shell
      :::image type="content" source="media/pay-as-you-go-azure-cloud-shell.png" alt-text="Azure Cloud Shell in Azure Portal":::

   2. Enter the following command in the Azure Cloud Shell to enable the Purchase via Azure feature (remove the { } in the subscriptionId parameter):

      ```PowerShell
      az feature register --namespace Microsoft.PowerPlatform --name accountPreview --subscription {subscriptionId}
      ```
      
      The above command will run asynchronously and may take a few minutes to complete. You can check the status of whether the command is completed by running:

      ```PowerShell
      az feature show --namespace Microsoft.PowerPlatform --name accountPreview --subscription {subscriptionId}
      ```
   3. Enter the following command in the Azure Cloud Shell to register the Power Platform resource provider the { } in the subscriptionId parameter):

      ```PowerShell
      az provider register -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```

      Note that the above command will run asynchronously and may take a few minutes to complete. You can check the status of whether the command is completed by running:

      ```PowerShell
      az provider show -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```
      
Now your Azure subscription is set up to use Power Platform pay as you go.

## Step by step experience to link Azure subscription to an environment 

Pay-as-you-go can be set up via [Power Apps](https://make.powerapps.com/) or the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

### In the Power Platform Admin Center

Here are the steps to create a billing policy, link environments to it, and add Azure subscription details for billing.

**STEP 1:** Navigate to https://admin.powerplatform.microsoft.com/azurebilling

   This page will show you a list of previously created billing policies and allow you to create a new one. **Select New billing policy**.

   :::image type="content" source="media/pay-as-you-go-select-billing-policy.png" alt-text="Select New billing policy":::

**STEP 2:** Provide a name for your new billing policy, then select **Next**.

   :::image type="content" source="media/pay-as-you-go-billing-policy-name.png" alt-text="Select New billing policy":::

**STEP 3:** Add Azure subscription details

   1. Choose the Azure subscription you would like to bill to from the Azure subscription drop down list. The drop down list will show the Azure subscriptions in your tenant for which you have permissions to create resources and register resource providers (aka "RPs"). Most commonly this will mean that you have an owner or contributor role for the subscription. If you don't see a subscription you expect listed, please contact the owner of that subscription and ensure you have permissions.

   2. Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription you will need to create one in the Aure portal (portal.azure.com) before proceeding. Learn more about Azure resources here.

   3. Specify a region. Choose from the list of available regions. Note that any environments you add to the billing policy in the following step can only be in this region.

   4. Select "Next".

      :::image type="content" source="media/pay-as-you-go-billing-policy-azure-details.png" alt-text="Select New billing policy":::

**STEP 4:** Choose environments to link to the new billing policy

   1. Select one or more environments from the list of environments then click "Add to policy" at the top of the screen. These environments will then appear on the "Added to policy" list. Click "Next" to continue.

      NOTE: An environment can be linked to only one billing policy at a time. So if you attempt to add an environment to your new policy that has already been linked to another policy, you will receive a warning message asking you to confirm you would like to change which billing policy that environment is linked to.

   2. The list of environments will be filtered to only show environments whose region matches the region that was selected in the prior step.

      As of Public Preview (11/01/21) only environments of the type Production or Sandbox are available to add to billing policies. Trial environments, developer environments, Dataverse for Teams environments and Default environments cannot be added.

      :::image type="content" source="media/pay-as-you-go-available-environments.png" alt-text="Available environments to add billing policy":::

      Environments with policy added.
      :::image type="content" source="media/pay-as-you-go-environments with-billing-policy.png" alt-text="Environments with policy added":::

**STEP 5:** Review and confirm

   Review and confirm the options, then select **Create billing policy**. The billing policy will now appear in the list of billing policies shown on [http://admin.powerplatform.com/azurebilling](http://tip.admin.powerplatform.com/azurebilling).

   :::image type="content" source="media/pay-as-you-go-review-create-billing-policy.png" alt-text="Review and create the billing policy":::

   List of billing policies
   :::image type="content" source="media/pay-as-you-go-billing-policy-list.png" alt-text="List of billing policies":::

**STEP 6 - OPTIONAL:** View the billing policy's Power Platform account resource in the Azure Portal

   When a billing policy is created, a corresponding Power Platform account resource is created in the Azure subscription that is specified by the billing policy. All Azure meters for Power Platform products will be billed to this resource. To view this resource, navigate to the Azure portal (portal.azure.com), selected the subscription and resource group which you specific when you created the billing policy. Click "View hidden types" above the resource list. You will see a Power Platform account resource which has the same name as the billing policy you created.

   You can optionally tag this resource just like you would any other Azure resource.

   In the Azure portal
   :::image type="content" source="media/pay-as-you-go-view-billing-policy-in-azure.png" alt-text="Billing policies in Azure Portal":::

### In Power Apps 

You can set up pay-as-you-go for your environment right from your app's setting for both canvas apps and model apps without needing to go to the admin center. Once set up, you can easily add new environments to the same Azure subscription in the Power Platform admin center.

**STEP 1:** Sign into [Power Apps](https://make.powerapps.com/) and navigate to "Apps". Select your app and click on "Settings". Make sure that that you have the right environment selected.

   :::image type="content" source="media/pay-as-you-go-powerapps-settings.png" alt-text="In Power Apps sign in and select Apps > Settings":::

   If pay-as-you-go is already enabled for an environment via Power Platform admin center, then you will see the following experience. You can opt your app out of using Azure subscription by turning off the toggle. Once turned off, users will need Power Apps user licenses to access the app. You can turn it on anytime. You can also view and edit the subscription details by clicking on "Edit pay-as-you-go billing" which will direct you to the Power Platform admin center.

   Note: If app passes are already available for this environment, they are ignored and not consumed. Instead, Azure subscription is used for accessing the apps.

   :::image type="content" source="media/pay-as-you-go-powerapps-edit.png" alt-text="Select Edit pay-as-you-go billing":::

   If pay-as-you-go is not enabled for an environment and you have the right permissions (shared under billing policy section), you will see the following experience and can easily set up pay-as-you-go using the steps below.

**STEP 2:** Select "Set up pay-as-you-go" to connect your Azure subscription to this environment.

   Note: Connecting Azure subscription to an environment turns on pay-as-you-go billing for all apps within that environment.

   :::image type="content" source="media/pay-as-you-go-powerapps-setup.png" alt-text="Select Set up pay-as-you-go billing":::

**STEP 3:** Enter a billing policy name and your Azure subscription details. Once entered, select **Connect subscription** to complete the set up.

   Choose the Azure subscription you would like to bill to from the Azure subscription drop down list. The drop-down list will show the Azure subscriptions in your tenant for which you have permissions to create resources and register resource providers (aka "RPs"). Most commonly this will mean that you have an owner or contributor role for the subscription. If you don't see a subscription you expect, please contact the owner of that subscription, and ensure you have permissions.

   Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription you will need to create one in the Aure portal (portal.azure.com) before proceeding. Learn more about Azure resources here.

   If you don't have an Azure subscription, procure one within your organization or create a new one.

   Enter billing policy name
   :::image type="content" source="media/pay-as-you-go-powerapps-billing-policy-name.png" alt-text="Select Set up pay-as-you-go billing":::

   Enter Azure subscription details
   :::image type="content" source="media/pay-as-you-go-powerapps-connect-subscription.png" alt-text="Select Connect subscription":::

**STEP 4:** Once Azure subscription is successfully linked to your environment, you will land back on the app settings screen and will see the following experience. Check out \[Add link to Step 6 above\] to see how to view the Power Platform resource in Azure.

   :::image type="content" source="media/pay-as-you-go-powerapps-app-settings.png" alt-text="Select Connect subscription":::

   If you have app passes available for your environment and still want to set up pay-as-you-go, you use the steps 2-4 to set it up. Once pay-as-you-go is set up, app passes are not consumed.

### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]