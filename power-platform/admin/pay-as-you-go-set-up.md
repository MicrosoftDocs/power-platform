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

This article explains how to set up pay-as-you-go for an enviornment. In order to set up pay-as-you-go, you need an active Azure subscription which you can link to your enviornment. You can do so both in Power Platform Admin Center and Power Apps.

## Who can set it up?

The following table describes the permissions of who can create a [billing policy](pay-as-you-go-overview.md#what-is-a-billing-policy) to link an environment to the Azure subscription. These permissions apply to both the Power Apps and the Power Platform admin center experience.

| **Role**  | **Create a billing policy** | **Edit a billing policy**   | **Link environments to a billing policy**   |
|--------|----------|-------|-----|
| Environment admin    | Yes  | Yes for billing policies the admin created | Yes for billing policies the admin created and for environments they are Environment admins for. |
| Power Platform admin | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant  |
| Global admin         | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant   |
| D365 Admin           | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant    |

## Get started

1. Procure or create an Azure subscription you can use.

   If you do not already have an Azure subscription in your tenant, work through the standard process in your organization to obtain one or create a new one [here](https://azure.microsoft.com/free/). You will need to have permissions to create new resources and register resource providers in the subscription (or have the ability to work with an Azure subscription owner or contributor who can register resource providers). See [Azure subscriptions](https://go.microsoft.com/fwlink/?linkid=2174703).

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
   3. Enter the following command in the Azure Cloud Shell to register the Power Platform resource provider - the { } in the subscriptionId parameter):

      ```PowerShell
      az provider register -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```

      Note that the above command will run asynchronously and may take a few minutes to complete. You can check the status of whether the command is completed by running:

      ```PowerShell
      az provider show -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```
      
Now your Azure subscription is set up to use Power Platform pay as you go.

## Link an Azure subscription to an environment 

Pay-as-you-go can be set up via the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or [Power Apps](https://make.powerapps.com/). Pay-as-you-go is available for **Production** and **Sandbox** enviornments.

### In the Power Platform Admin Center

Follow these steps to create a billing policy, link environments to it, and add Azure subscription details for billing.

1. Navigate to https://admin.powerplatform.microsoft.com/azurebilling

   This page will show you a list of previously created billing policies and allow you to create a new one. Select **New billing policy**.

   :::image type="content" source="media/pay-as-you-go-select-billing-policy.png" alt-text="Select New billing policy":::

2. Provide a name for your new billing policy, and then select **Next**.

   :::image type="content" source="media/pay-as-you-go-billing-policy-name.png" alt-text="Select New billing policy":::

3. Add Azure subscription details.

   1. Choose the Azure subscription you would like to bill to from the Azure subscription drop-down list. The drop-down list will show the Azure subscriptions in your tenant for which you have permissions to create resources and register resource providers (aka "RPs"). Most commonly this will mean that you have an owner or contributor role for the subscription. If you don't see a subscription you expect to be listed, contact the owner of that subscription and ensure you have permissions.

   2. Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription you will need to create one in the Azure portal (https://portal.azure.com) before proceeding. To learn more about Azure resources, see [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview)

   3. Specify a region. Choose from the list of available regions. Note that any environments you add to the billing policy in the following step can only be in this region.

   4. Select **Next**.

      :::image type="content" source="media/pay-as-you-go-billing-policy-azure-details.png" alt-text="Select New billing policy":::

4. Choose environments to link to the new billing policy.

   1. Select one or more environments from the list of environments then select **Add to policy** at the top of the screen. These environments will then appear on the **Added to policy** list. Select **Next** to continue.

      > [!NOTE]
      > An environment can be linked to only one billing policy at a time. So if you attempt to add an environment to your new policy that has already been linked to another policy, you will receive a warning message asking you to confirm you would like to change which billing policy that environment is linked to.

   2. The list of environments will be filtered to only show environments whose region matches the region that was selected in the prior step.

      As of Public Preview (11/01/21), only environments of the type production or sandbox are available to add to billing policies. Trial environments, developer environments, Dataverse for Teams environments and default environments cannot be added.

      :::image type="content" source="media/pay-as-you-go-available-environments.png" alt-text="Available environments to add billing policy":::

      Environments with policy added.
      :::image type="content" source="media/pay-as-you-go-environments with-billing-policy.png" alt-text="Environments with policy added":::

5. Review and confirm.

   Review and confirm the options, then select **Create billing policy**. The billing policy will now appear in the list of billing policies shown on [http://admin.powerplatform.com/azurebilling](http://admin.powerplatform.com/azurebilling).

   :::image type="content" source="media/pay-as-you-go-review-create-billing-policy.png" alt-text="Review and create the billing policy":::

   List of billing policies
   :::image type="content" source="media/pay-as-you-go-billing-policy-list.png" alt-text="List of billing policies":::

6. Optional: View the billing policy's Power Platform account resource in the Azure Portal.

   When a billing policy is created, a corresponding Power Platform account resource is created in the Azure subscription that is specified by the billing policy. All Azure meters for Power Platform products will be billed to this resource. To view this resource, navigate to the Azure portal (https://portal.azure.com), and selecte the subscription and resource group you specified when you created the billing policy. Select **View hidden types** above the resource list. You'll see a Power Platform account resource which has the same name as the billing policy you created.

   You can optionally tag this resource just like you would any other Azure resource.

   In the Azure portal
   :::image type="content" source="media/pay-as-you-go-view-billing-policy-in-azure.png" alt-text="Billing policies in Azure Portal":::

### In Power Apps 

You can set up pay-as-you-go for your environment right from your app's setting for both canvas apps and model-driven apps without needing to go to the admin center. Once set up, you can easily add new environments to the same Azure subscription in the Power Platform admin center.

1. Sign into [Power Apps](https://make.powerapps.com/) and navigate to **Apps**. Select your app, and then select **Settings**. Make sure that that you have the right environment selected.

   :::image type="content" source="media/pay-as-you-go-powerapps-settings.png" alt-text="In Power Apps sign in and select Apps > Settings":::

   If pay-as-you-go is already enabled for an environment via the Power Platform admin center, then you'll see the following experience. You can opt your app out of using an Azure subscription by turning the toggle off in the app settings. Once turned off, users will need Power Apps user licenses to access the app. You can turn it on anytime. You can also view and edit the subscription details by selecting **Edit pay-as-you-go billing** which will direct you to the Power Platform admin center.

   > [!NOTE]
   > If app passes are already available for this environment, they are ignored and not consumed. Instead, Azure subscription is used for accessing the apps.

   :::image type="content" source="media/pay-as-you-go-powerapps-edit.png" alt-text="Select Edit pay-as-you-go billing":::

   If pay-as-you-go is not enabled for an environment and you have the right permissions (shared under the **Billing Policy** section), you'll see the following experience and can easily set up pay-as-you-go using the steps below.

2. Select **Set up pay-as-you-go** to connect your Azure subscription to this environment.

   > [!NOTE]
   > Connecting an Azure subscription to an environment turns on pay-as-you-go billing for all apps within that environment.

   :::image type="content" source="media/pay-as-you-go-powerapps-setup.png" alt-text="Select Set up pay-as-you-go billing":::

3. Enter a billing policy name and your Azure subscription details. Once entered, select **Connect subscription** to complete the set up.

   Choose the Azure subscription you would like to bill to from the Azure subscription drop-down list. The drop-down list will show the Azure subscriptions in your tenant for which you have permissions to create resources and register resource providers (aka "RPs"). Most commonly this will mean that you have an owner or contributor role for the subscription. If you don't see a subscription you expect to be listed, contact the owner of that subscription and ensure you have permissions.

   Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription you will need to create one in the Azure portal (https://portal.azure.com) before proceeding. To learn more about Azure resources, see [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview)

   If you don't have an Azure subscription, procure one within your organization or create a new one.

   Enter billing policy name
   :::image type="content" source="media/pay-as-you-go-powerapps-billing-policy-name.png" alt-text="Select Set up pay-as-you-go billing":::

   Enter Azure subscription details
   :::image type="content" source="media/pay-as-you-go-powerapps-connect-subscription.png" alt-text="Select Connect subscription":::

4. Once an Azure subscription is successfully linked to your environment, you will land back on the app settings page and will see the following experience. 

   :::image type="content" source="media/pay-as-you-go-powerapps-app-settings.png" alt-text="Select Connect subscription":::

   If you have app passes available for your environment and still want to set up pay-as-you-go, you use the Steps 2-4 to set it up. Once pay-as-you-go is set up, app passes are not consumed.
      **image is missing here. Can we add from the doc?**

## Turning off pay-as-you-go 

You can turn off pay-as-you-go for an environment at any time by doing either of the following. As soon as you turn off pay-as-you-go, your enviornment will go back to functioning as a regular enviornment and usage will no longer be charged against the Azure subscription.

1. Remove the environment from a billing policy by going to the Power Platform admin center > **Billing Policies** page and editing the billing policy.

**OR**

2. Delete the environment's billing policy.

   As soon as you take either action above, the environment will cease to be a pay-as-you-go environment and will go back to functioning as a regular environment. Any usage that was already incurred up to the point the action was taken will be billed to Azure, but no further usage beyond that point will be billed.

   > [!NOTE]
   > Deleting the billing policy in the Power Platform admin center will not automatically delete its corresponding Power Platform account resource in the Azure portal. You can delete this resource in the Azure portal.

## Next step

[Preview: View usage and billing information](pay-as-you-go-usage-costs.md)

### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]
