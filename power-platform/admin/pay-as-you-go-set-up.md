---
title: Set up a pay-as-you-go plan 
description: Follow these steps to set up pay-as-you-go plans with an Azure subscription. You can do so in the Power Platform admin center or within Power Apps.
author: amiyapatr-zz
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/27/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: ampatra 
ms.reviewer: sericks
contributors:
  - ShawnNandiMSFT
search.audienceType: 
  - admin
---
# Set up pay-as-you-go 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

In order to set up pay-as-you-go billing for an environment, you first need an active Azure subscription that you can link to that environment. You can do so in the Power Platform admin center or within Power Apps.

## Who can set it up?

The following table describes the permissions of who can create a [billing policy](pay-as-you-go-overview.md#what-is-a-billing-plan) in order to link an environment to an Azure subscription. These permissions apply to both the Power Apps and Power Platform admin center experiences.

| **Role**  | **Create a billing policy?** | **Edit a billing policy?**   | **Link environments to a billing policy?**   |
|--------|----------|-------|-----|
| Environment admin    | Yes  | Yes, for billing policies the admin created. | Yes, for billing policies the admin created and for environments in which they're admins. |
| Power Platform admin | Yes  | Yes, for all billing policies in the tenant. | Yes, for all environments in the tenant.  |
| Global admin         | Yes  | Yes, for all billing policies in the tenant. | Yes, for all environments in the tenant.   |
| Dynamics 365 admin           | Yes  | Yes, for all billing policies in the tenant. | Yes, for all environments in the tenant.    |

## Procure or create an Azure subscription

If you don't already have an Azure subscription in your tenant, work through the standard process in your organization to obtain one or create a new one at the [Azure account](https://azure.microsoft.com/free/) site. You need to have permissions to create new resources and register resource providers in the subscription&mdash;or have the ability to work with another user who has these permissions. Most users have these permissions if they're owners of or contributors to the subscription. For more information, contact your Azure administrator or see [Azure subscriptions](https://go.microsoft.com/fwlink/?linkid=2174703).
   
## Link an Azure subscription to an environment 

Pay-as-you-go can be set up via the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or within [Power Apps](https://make.powerapps.com/). Pay-as-you-go is available for **production** and **sandbox** environments.

## Create a billing plan

To create a [billing plan](pay-as-you-go-overview.md), link [environments](environments-overview.md) to it, and add Azure subscription details for billing, complete the following steps depending on whether you're using the new admin center or the classic admin center.

# [New admin center](#tab/new)

1. In the navigation pane, select **Licensing**.
1. In the **Licensing** pane, select **Pay-as-you-go plans**. The **Billing plans** page is displayed.

1. Select **New billing plan**. The **New billing plan** pane is displayed.

1. Select **Azure subscription**.

1. In the **Name** field, provide a name for your new billing plan.

1. From the **Azure subscription** dropdown list, select the Azure subscription you'd like to bill. This list shows all the Azure subscriptions in your tenant for which you have sufficient permissions. If you don't see a subscription that you expect to be listed, or if you receive a permission error at any point, contact the owner of that subscription or your Azure administrator and ensure you have the right permissions as outlined. Learn more at [Procure or create an Azure subscription](#procure-or-create-an-azure-subscription).

1. From the **Resource group** dropdown list, specify a resource group with that subscription. The Power Platform account resource&mdash;that's associated with this billing plan&mdash;is created in this resource group. If there are no resource groups in the specified subscription, you need to create one in the [Azure portal](https://portal.azure.com) before proceeding. To learn more about Azure resources, go to [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview)

1. From the **Power Platform products** dropdown list, select the Power Platform product for which the corresponding meters are applied to in the billing plan.

1. Select **Next**.

1. In the **Select environments** pane, in the **Region** list, select your region. Then the list of environments in that region is displayed.

1. Select the environment you want to add to the billing plan.

1. Select **Save**. 

# [Classic admin center](#tab/classic)

1. In the navigation pane, select **Billing** > **Billing plans**. The **Billing plans** page is displayed.

1. Select **New billing plan**. The **New billing plan** pane is displayed.

1. Select **Azure subscription**.

1. In the **Name** field, provide a name for your new billing plan.

1. From the **Azure subscription** dropdown list, select the Azure subscription you'd like to bill. This list shows all the Azure subscriptions in your tenant for which you have sufficient permissions. If you don't see a subscription that you expect to be listed, or if you receive a permission error at any point, contact the owner of that subscription or your Azure administrator and ensure you have the right permissions as outlined. Learn more at [Procure or create an Azure subscription](#procure-or-create-an-azure-subscription).

1. From the **Resource group** dropdown list, specify a resource group with that subscription. The Power Platform account resource&mdash;that's associated with this billing plan&mdash;is created in this resource group. If there are no resource groups in the specified subscription, you need to create one in the [Azure portal](https://portal.azure.com) before proceeding. To learn more about Azure resources, go to [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview)

1. From the **Power Platform products** dropdown list, select the Power Platform product for which the corresponding meters are applied to in the billing plan.

1. Select **Next**.

1. In the **Select environments** pane, in the **Region** list, select your region. Then the list of environments in that region is displayed.

1. Select the environment you want to add to the billing plan.

1. Select **Save**. 

---
## Create billing plan for Microsoft 365 Copilot Chat
Microsoft 365 users without a paid Copilot license can now access and use Copilot agents by using a pay-as-you-go meter. Setting up a billing plan for Microsoft Copilot agents differs slightly from the standard billing plan setup process.

# [New admin center](#tab/new)

1. In the navigation pane, select **Licensing**.

1. In the **Licensing** pane, select **Pay-as-you-go plans**. The **Billing plans** page is displayed.

1. Select **New billing plan**. The **New billing plan** pane is displayed.

1. Select **Microsoft 365 Copilot Chat**.

1. In the **Name** field, provide a name for your new billing plan.

1. From the **Azure subscription** dropdown list, select the Azure subscription you'd like to bill. This list shows all the Azure subscriptions in your tenant for which you have sufficient permissions.

    If you don't see a subscription that you expect to be listed, or if you receive a permission error at any point, contact the owner of that subscription or your Azure administrator to ensure you have the right permissions, as outlined. Learn more at [Procure or create an Azure subscription](#procure-or-create-an-azure-subscription).

1. From the **Resource group** dropdown list, specify a resource group with that subscription. The Power Platform account resource&mdash;that's associated with this billing plan&mdash;is created in this resource group.

    If there are no resource groups in the specified subscription, you must create one in the [Azure portal](https://portal.azure.com) before proceeding. Learn more about Azure resources in [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview).

1. Select **Save**.

When a billing plan is created, a new environment named **Microsoft 365 Copilot Chat** is automatically provisioned and linked to the newly created billing plan. Copilot consumption reporting is accessible through this environment. If a new billing plan is created for **Microsoft 365 Copilot Chat** and an environment already exists, it's automatically linked to the new billing plan.

# [Classic admin center](#tab/classic)

1. In the navigation pane, select **Billing** > **Billing plans**. The **Billing plans** page is displayed.

1. Select **New billing plan**. The **New billing plan** pane is displayed.

1. Select **Microsoft 365 Copilot Chat**.

1. In the **Name** field, provide a name for your new billing plan.

1. From the **Azure subscription** dropdown list, select the Azure subscription you'd like to bill. This list shows all the Azure subscriptions in your tenant for which you have sufficient permissions.

    If you don't see a subscription that you expect to be listed, or if you receive a permission error at any point, contact the owner of that subscription or your Azure administrator to ensure you have the right permissions, as outlined. Learn more at [Procure or create an Azure subscription](#procure-or-create-an-azure-subscription).

1. From the **Resource group** dropdown list, specify a resource group with that subscription. The Power Platform account resource&mdash;that's associated with this billing plan&mdash;is created in this resource group.

    If there are no resource groups in the specified subscription, you must create one in the [Azure portal](https://portal.azure.com) before proceeding. Learn more about Azure resources in [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview).

1. Select **Save**.

When a billing plan is created, a new environment named **Microsoft 365 Copilot Chat** is automatically provisioned and linked to the newly created billing plan. Copilot consumption reporting is accessible through this environment. If a new billing plan is created for **Microsoft 365 Copilot Chat** and an environment already exists, it's automatically linked to the new billing plan.

---

## List of billing plans

### View the billing plan's Power Platform account resource in the Azure portal

When a billing plan is created, a corresponding Power Platform account resource is created in the Azure subscription that's specified by the billing plan. All Azure meters for Power Platform products are billed to this resource. To view this resource, navigate to the [Azure portal](https://portal.azure.com), and select the subscription and resource group you specified when you created the billing plan. Select **View hidden types** above the resource list. You see a Power Platform account resource with the same name as the billing plan you created.

You can optionally tag this resource just like you would any other Azure resource.

In the Azure portal:

:::image type="content" source="media/pay-as-you-go-view-billing-policy-in-azure.png" alt-text="Billing policies in Azure Portal":::

### Set up pay-as-you-go for your environment from your app's setting

You can set up pay-as-you-go for your environment right from your app's setting for both canvas and model-driven apps, without needing to go to the admin center. Once set up, you can easily add new environments to the same Azure subscription in the Power Platform admin center.

1. Sign in to [Power Apps](https://make.powerapps.com/) and navigate to **Apps**. Select your app, and then select **Settings**. Make sure that you have the right environment selected.

   :::image type="content" source="media/pay-as-you-go-powerapps-settings.png" alt-text="Sign in to Power Apps and select Apps > Settings":::

   If pay-as-you-go is already turned on for an environment through the Power Platform admin center, you see the following experience. You can opt your app out of using an Azure subscription by turning off the toggle in the app settings. Once off, users need Power Apps user licenses to access the app. You can turn it back on at any time. You can also view and edit the subscription details by selecting **Edit pay-as-you-go billing**, which directs you to the Power Platform admin center.

   > [!NOTE]
   > If app passes are already available for this environment, they're ignored and not consumed. Instead, Azure subscription is used for accessing the apps.

   :::image type="content" source="media/pay-as-you-go-powerapps-edit.png" alt-text="Select Edit pay-as-you-go billing":::

   If pay-as-you-go isn't turned on for an environment and you have the right permissions (shared under the **Billing plan** section), you see the following experience and can easily set up pay-as-you-go using the steps below.

2. Select **Set up pay-as-you-go** to connect your Azure subscription to this environment.

   > [!NOTE]
   > Connecting an Azure subscription to an environment turns on pay-as-you-go billing for all apps within that environment.

   :::image type="content" source="media/pay-as-you-go-powerapps-setup.png" alt-text="Select Set up pay-as-you-go billing":::

3. Enter a billing plan name and your Azure subscription details. Once entered, select **Connect subscription** to complete the setup.
   
      1. Choose the Azure subscription you'd like to bill from the dropdown list, which shows all the Azure subscriptions in your tenant that you have sufficient permissions for. If you don't see a subscription you expect to be listed, or if you receive a permission error at any point, contact the owner of that subscription or your Azure administrator and ensure you have the right permissions as outlined in [Procure or create an Azure subscription](#procure-or-create-an-azure-subscription).

   2. Specify a resource group with that subscription. The Power Platform account resource&mdash;that's associated with this billing policy&mdash;is created in this resource group. If there are no resource groups in the specified subscription, you need to create one in the [Azure portal](https://portal.azure.com) before proceeding. To learn more about Azure resources, go to [What is Azure Resource Manager?](/azure/azure-resource-manager/management/overview)

   3. If you don't have an Azure subscription, procure one within your organization or create a new one.

   Enter billing policy name
   :::image type="content" source="media/pay-as-you-go-powerapps-billing-policy-name.png" alt-text="Enter billing policy name":::

   Enter Azure subscription details
   :::image type="content" source="media/pay-as-you-go-powerapps-connect-subscription.png" alt-text="Select Connect subscription":::

4. Once an Azure subscription is successfully linked to your environment, you'll land back on the app settings page and see the following experience. 

   :::image type="content" source="media/pay-as-you-go-powerapps-app-settings.png" alt-text="App settings page after Azure subscription is linked":::

   If you have app passes available for your environment and still want to set up pay-as-you-go, you can use Steps 2–4 to set it up. Once pay-as-you-go is set up, app passes aren't consumed.

   :::image type="content" source="media/pay-as-you-go-powerapps-per-app-license.png" alt-text="Enable per-app-licenses":::

## Turn off pay-as-you-go 

You can turn off pay-as-you-go for an environment at any time by doing either of the following:

- Remove the environment from a billing policy by going to the **Power Platform admin center** > **Billing policies** page and editing the billing policy.

**OR**

- Delete the environment's billing policy.

As soon as you take either action above, the environment ceases to be pay-as-you-go and goes back to functioning as a regular environment. Any usage that was already incurred up to this point is billed to your Azure subscription, but no further usage is charged.

> [!NOTE]
> Deleting the billing policy in the Power Platform admin center doesn't automatically delete its corresponding Power Platform account resource. You can delete this resource in the Azure portal.

## Next step

[View usage and billing information](pay-as-you-go-usage-costs.md)





[!INCLUDE[footer-include](../includes/footer-banner.md)]
