---
title: "Set up a pay-as-you-go plan | MicrosoftDocs"
description: Follow these steps to set up pay-as-you-go billing with an Azure subscription You can do so in the Power Platform admin center or within Power Apps.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/02/2021
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

In order to set up pay-as-you-go billing for an environment, you first need an active Azure subscription that you can link to that environment. You can do so in the Power Platform admin center or within Power Apps.

## Who can set it up?

The following table describes the permissions of who can create a [billing policy](pay-as-you-go-overview.md#what-is-a-billing-policy) in order to link an environment to an Azure subscription. These permissions apply to both the Power Apps and Power Platform admin center experiences.

| **Role**  | **Create a billing policy?** | **Edit a billing policy?**   | **Link environments to a billing policy?**   |
|--------|----------|-------|-----|
| Environment admin    | Yes  | Yes, for billing policies the admin created | Yes, for billing policies the admin created and for environments in which they are admins |
| Power Platform admin | Yes  | Yes, for all billing policies in the tenant | Yes, for all environments in the tenant  |
| Global admin         | Yes  | Yes, for all billing policies in the tenant | Yes, for all environments in the tenant   |
| D365 Admin           | Yes  | Yes, for all billing policies in the tenant | Yes, for all environments in the tenant    |

## Get started

1. Procure or create an Azure subscription you can use. 

   If you don't already have an Azure subscription in your tenant, work through the standard process in your organization to obtain one or create a new one [here.](https://azure.microsoft.com/free/) You'll need to have permissions to create new resources and register resource providers in the subscription (or have the ability to work with an Azure subscription owner or contributor who can register resource providers). For more information, go to [Azure subscriptions.](https://go.microsoft.com/fwlink/?linkid=2174703)

2. Enable the Power Platform account feature in the Azure portal. (Note that this is temporary and will be automated in the future.)

   1. Sign in to the Azure portal and start the Cloud Shell.

      :::image type="content" source="media/pay-as-you-go-azure-start-cloud-shell.png" alt-text="Start the Cloud Shell in Azure Portal":::

      Azure Cloud Shell
      :::image type="content" source="media/pay-as-you-go-azure-cloud-shell.png" alt-text="Azure Cloud Shell in Azure Portal":::

   2. Enter the following command in the Azure Cloud Shell to register the Power Platform resource provider. (Remove the { } in the subscriptionId parameter):

      ```azurecli
      az provider register -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```

       The above command will run asynchronously and may take a few minutes to complete. You can check whether the command has completed by running:

      ```Azure CLI
      az provider show -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```
  
      Alternatively, in PowerShell you can use the following commands to register the resource provider:

      ```powershell
      Select-AzSubscription <Subscription ID>
      Register-AzResourceProvider -ProviderNamespace Microsoft.PowerPlatform

      ```

       The above command will run asynchronously and may take a few minutes to complete. You can check whether the command has completed by running:

      ```PowerShell
      Get-AzResourceProvider -ProviderNamespace Microsoft.PowerPlatform
      ```
    
Your Azure subscription is now set up to use Power Platform pay-as-you-go.

## Link an Azure subscription to an environment 

Pay-as-you-go can be set up via the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or within [Power Apps](https://make.powerapps.com/). Pay-as-you-go is available for **production** and **sandbox** environments.

### In the Power Platform admin center

Follow these steps to create a billing policy, link environments to it, and add Azure subscription details for billing:

1. Navigate to https://admin.powerplatform.microsoft.com/azurebilling.

   This page will show you a list of previously created billing policies and allow you to create a new one. Select **New billing policy**.

   :::image type="content" source="media/pay-as-you-go-select-billing-policy.png" alt-text="Select New billing policy":::

2. Provide a name for your new billing policy, and then select **Next**.

   :::image type="content" source="media/pay-as-you-go-billing-policy-name.png" alt-text="Name the new billing policy":::

3. Add Azure subscription details.

   1. Choose the Azure subscription you'd like to bill from the drop-down list, which will show all the Azure subscriptions in your tenant. Note that you must have permissions to create resources in the subscription you choose, otherwise you'll see an error in a later step. Most commonly, this means that you need to have an owner or contributor role for the subscription. If you don't see a subscription you expect to be listed, or if you receive a permission error at any point, contact the owner of that subscription and ensure you have the right permissions.

   2. Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription, you'll need to create one in the [Azure portal](https://portal.azure.com) before proceeding. To learn more about Azure resources, go to [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview)

   3. Specify a region by choosing from the list of available regions. Note that any environments you add to the billing policy in the following step can only be in this region.

   4. Select **Next**.

      :::image type="content" source="media/pay-as-you-go-billing-policy-azure-details.png" alt-text="Select Next to bill to Azure":::

4. Choose environments to link to the new billing policy.

   1. Select one or more environments from the list of environments, then select **Add to policy** at the top of the screen. These environments will then appear on the **Added to policy** list. Select **Next** to continue.

      > [!NOTE]
      > An environment can only be linked to one billing policy at a time. If you attempt to add an environment to your new policy that has already been linked to another policy, you'll receive a message asking you to confirm that you'd like to change which billing policy that environment is linked to.

   2. The list of environments will be filtered to only show the environments whose region matches the region that was selected in the prior step.

      As of public preview (November 1, 2021), only production or sandbox environments are available to add to billing policies. Trial environments, developer environments, Dataverse for Teams environments, and default environments cannot be added.

      :::image type="content" source="media/pay-as-you-go-available-environments.png" alt-text="Available environments to add billing policy":::

      Environments with policy added
      :::image type="content" source="media/pay-as-you-go-environments with-billing-policy.png" alt-text="Environments with policy added":::

5. Review and confirm.

   Review and confirm the options, then select **Create billing policy**. The billing policy will now appear in the list of billing policies shown on [http://admin.powerplatform.com/azurebilling.](http://admin.powerplatform.com/azurebilling)

   :::image type="content" source="media/pay-as-you-go-review-create-billing-policy.png" alt-text="Review and create the billing policy":::

   List of billing policies
   :::image type="content" source="media/pay-as-you-go-billing-policy-list.png" alt-text="List of billing policies":::

6. Optional: View the billing policy's Power Platform account resource in the Azure Portal.

   When a billing policy is created, a corresponding Power Platform account resource is created in the Azure subscription that's specified by the billing policy. All Azure meters for Power Platform products will be billed to this resource. To view this resource, navigate to the [Azure portal](https://portal.azure.com), and selecte the subscription and resource group you specified when you created the billing policy. Select **View hidden types** above the resource list. You'll see a Power Platform account resource with the same name as the billing policy you created.

   You can optionally tag this resource just like you would any other Azure resource.

   In the Azure portal
   :::image type="content" source="media/pay-as-you-go-view-billing-policy-in-azure.png" alt-text="Billing policies in Azure Portal":::

### In Power Apps 

You can set up pay-as-you-go for your environment right from your app's setting for both canvas and model-driven apps, without needing to go to the admin center. Once set up, you can easily add new environments to the same Azure subscription in the Power Platform admin center.

1. Sign in to [Power Apps](https://make.powerapps.com/) and navigate to **Apps**. Select your app, and then select **Settings**. Make sure that you have the right environment selected.

   :::image type="content" source="media/pay-as-you-go-powerapps-settings.png" alt-text="Sign in to Power Apps and select Apps > Settings":::

   If pay-as-you-go is already enabled for an environment via the Power Platform admin center, you'll see the following experience. You can opt your app out of using an Azure subscription by turning the toggle off in the app settings. Once turned off, users will need Power Apps user licenses to access the app. You can turn it back on at any time. You can also view and edit the subscription details by selecting **Edit pay-as-you-go billing**, which will direct you to the Power Platform admin center.

   > [!NOTE]
   > If app passes are already available for this environment, they are ignored and not consumed. Instead, Azure subscription is used for accessing the apps.

   :::image type="content" source="media/pay-as-you-go-powerapps-edit.png" alt-text="Select Edit pay-as-you-go billing":::

   If pay-as-you-go is not enabled for an environment and you have the right permissions (shared under the **Billing policy** section), you'll see the following experience and can easily set up pay-as-you-go using the steps below.

2. Select **Set up pay-as-you-go** to connect your Azure subscription to this environment.

   > [!NOTE]
   > Connecting an Azure subscription to an environment turns on pay-as-you-go billing for all apps within that environment.

   :::image type="content" source="media/pay-as-you-go-powerapps-setup.png" alt-text="Select Set up pay-as-you-go billing":::

3. Enter a billing policy name and your Azure subscription details. Once entered, select **Connect subscription** to complete the setup.
   
      1. Choose the Azure subscription you'd like to bill from the drop-down list, which will show all the Azure subscriptions in your tenant. Note that you must have permissions to create resources in the subscription you choose, otherwise you'll see an error in a later step. Most commonly, this means that you need to have an owner or contributor role for the subscription. If you don't see a subscription you expect to be listed, or if you receive a permission error at any point, contact the owner of that subscription and ensure you have the right permissions.

   2. Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription, you'll need to create one in the [Azure portal](https://portal.azure.com) before proceeding. To learn more about Azure resources, go to [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview)

   3. If you don't have an Azure subscription, procure one within your organization or create a new one.

   Enter billing policy name
   :::image type="content" source="media/pay-as-you-go-powerapps-billing-policy-name.png" alt-text="Enter billing policy name":::

   Enter Azure subscription details
   :::image type="content" source="media/pay-as-you-go-powerapps-connect-subscription.png" alt-text="Select Connect subscription":::

4. Once an Azure subscription is successfully linked to your environment, you'll land back on the app settings page and see the following experience. 

   :::image type="content" source="media/pay-as-you-go-powerapps-app-settings.png" alt-text="App settings page after Azure subscription is linked":::

   If you have app passes available for your environment and still want to set up pay-as-you-go, you can use Steps 2–4 to set it up. Once pay-as-you-go is set up, app passes are not consumed.

   :::image type="content" source="media/pay-as-you-go-powerapps-per-app-license.png" alt-text="Enable Per-app-licenses":::

## Turning off pay-as-you-go 

You can turn off pay-as-you-go for an environment at any time by doing either of the following:

1. Remove the environment from a billing policy by going to the Power Platform admin center > **Billing policies** page and editing the billing policy.

**OR**

2. Delete the environment's billing policy.

   As soon as you take either action above, the environment will cease to be pay-as-you-go and will go back to functioning as a regular environment. Any usage that was already incurred up to this point will be billed to your Azure subscription, but no further usage will be charged.

   > [!NOTE]
   > Deleting the billing policy in the Power Platform admin center will not automatically delete its corresponding Power Platform account resource. You can delete this resource in the Azure portal.

## Next step

[Preview: View usage and billing information](pay-as-you-go-usage-costs.md)





[!INCLUDE[footer-include](../includes/footer-banner.md)]
