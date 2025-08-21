---
title: CoE Starter Kit - Frequently asked questions
description: Learn how to set up, import solutions, and configure environment variables for a smooth Microsoft CoE Starter Kit experience.
author: manuelap-msft
ms.component: pa-admin
ms.topic: faq
ms.date: 08/21/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---

# CoE Starter Kit - Frequently asked questions

This article answers frequently asked questions (FAQs) and provides tips on setting up and using the Microsoft CoE Starter Kit.

## Install a solution in a production environment

1. Go to [make.powerapps.com](https://make.powerapps.com).
1. Go to your CoE environment. In this example image, you're importing to the environment named **Contoso CoE**.

   :::image type="content" source="media/coe6.png" alt-text="Screenshot that shows the Power Apps maker portal environment with the example environment highlighted from the Environments menu." lightbox="media/coe6.png":::

1. On the left pane, select **Solutions**.
1. Select **Import**, then select **Browse**.
1. Select the solution from the CoE Starter Kit download.
1. Establish connections to activate your solution. If you create a new connection, select **Refresh**. Your import progress remains intact.
   :::image type="content" source="media/msi-import.png" alt-text="Screenshot that shows the Import a solution pane opened from the Solutions navigation menu." lightbox="media/msi-import.png":::
1. Update environment variable values. These environment variables store application and flow configuration data specific to your organization or environment. By setting the value once per environment, it appears across all necessary flows and applications within that environment.
   :::image type="content" source="media/msi-envvar.png" alt-text="Screenshot that shows the Environment variables section of the Import a solution pane. Here you can add a value for the Power Automate Environment Variable." lightbox="media/msi-envvar.png":::
1. Select **Import**.

## Set flow run-only users properties

1. Remove [Update the Center of Excellence (CoE) Starter Kit](after-setup.md) for all flows.
1. Go to the **Details** page, then select the **Run only users** edit button.
   :::image type="content" source="media/tips-flow2.png" alt-text="Screenshot that shows the location of the Edit link on the Run only users card." lightbox="media/tips-flow2.png":::
1. View all the connections in the child flow. For each one except Microsoft Dataverse, change the value to **Use this connection (userPrincipalName\@company.com)**. For Microsoft Dataverse, leave the value blank.
   :::image type="content" source="media/tips-flow1.png" alt-text="Screenshot that shows the Manage run-only permissions pane with the Use this connection option highlighted under a connection." lightbox="media/tips-flow1.png":::
1. If there's no connection for any of the connectors, go to **Data** > **Connections**, and create one for the connector.
1. After you update all run-only users, you can enable the child flow.

## Find a user's security roles in an environment

To find a user's security roles in an environment, use the product UX:

1. Go to [Power Platform admin center environments](https://admin.powerplatform.microsoft.com/environments).
1. Select your environment.
1. Go to **Settings** on your navigation bar.
   :::image type="content" source="media/find-SR-1.png" alt-text="Screenshot that shows where the Settings menu is located in an environment." lightbox="media/find-SR-1.png":::
1. From **Users + Permissions**, select **Users**.
   :::image type="content" source="media/find-SR-2.png" alt-text="Screenshot that shows where the Users option is located under the Users + permissions menu." lightbox="media/find-SR-2.png":::
1. Find the user and select their name to view their properties. You see their security roles under the **Roles** section.

## Import a flow

Occasionally, you might deploy a one-time flow to address specific issues. When you make these flows available, the first step is to import them.

Import your flows:

1. Go to [make.powerautomate.com](https://make.powerautomate.com/)
1. Select your target environment. For this example, choose your CoE Environment.
1. Select **My flows** > **Import** > **Import Package (Legacy)**
   :::image type="content" source="media/import-flow-1.png" alt-text="Screenshot that shows where to import a flow from the My flows navigation menu." lightbox="media/import-flow-1.png":::
1. Select and upload your flow.
   :::image type="content" source="media/import-flow-2.png" alt-text="Screenshot that shows the Import package prompt." lightbox="media/import-flow-2.png":::
1. Create any needed connections, then select **Import**.
   :::image type="content" source="media/import-flow-3.png" alt-text="Screenshot that shows the Import Setup section of a resource with an email address in it." lightbox="media/import-flow-3.png":::
1. Select **Open flow** to view.
   :::image type="content" source="media/import-flow-4.png" alt-text="Screenshot that shows where the Open flow link is located." lightbox="media/import-flow-4.png":::
1. Return to the previous view to see package details.
   :::image type="content" source="media/import-flow-5.png" alt-text="Screnshot that shows where the back button icon is located." lightbox="media/import-flow-5.png":::
1. Turn on your flow.
   :::image type="content" source="media/import-flow-6.png" alt-text="Screenshot that shows where the Turn on selection is located in the navigation bar of the Audit logs flow." lightbox="media/import-flow-6.png":::

## Set up CoE for a subset of environments

You might want to monitor and govern only certain environments by using the CoE Starter Kit. For example, you might set up the CoE Starter Kit for individual business units managing their own smaller Centers of Excellence, or you might include your Dynamics 365 environments in the CoE Starter Kit processes.

You can selectively enable CoE Starter Kit processes for specific environments:

> [!IMPORTANT]
> A starter kit process isn't a security feature and doesn't implement data privacy or row-level security. The process is solely intended to facilitate the monitoring and management of environments for organizational units.

1. After you import the **Core** components and before you turn on flows, set the value of the **is All Environments Inventory** environment variable to **No**. Learn more in [Update environment variables](#update-environment-variables).
1. Continue with the [Set up inventory components](setup-core-components.md) and turn on all inventory flows.
1. Wait for the first inventory run of **Admin | Sync Template v3** to complete. All environments in the tenant are added as excluded from inventory.
   :::image type="content" source="media/tips-Opt-In-Envt1.png" alt-text="Screenshot that shows the location of the Environment Excused from Inventory page from the Environments menu." lightbox="media/tips-Opt-In-Envt1.png":::
1. Add the environments you want to monitor and manage to the inventory by selecting **No** for the **Excuse From Inventory** configuration.
   :::image type="content" source="media/tips-Opt-In-Envt2.png" alt-text="Screenshot that highlights the Excuse From Inventory configuration set to No." lightbox="media/tips-Opt-In-Envt2.png":::
1. Wait for the next inventory run to complete. The run automatically picks up and monitors inventory for the selected environments.

## Run a full inventory

To reduce API calls, the inventory flows don't update all objects with every sync flow. The flows only update objects modified since the last inventory.

> [!NOTE]
> Inventory flows don't check each object every day to see if its modified date is more recent than the date in inventory.

Inventory flow actions:

1. Gets all objects. For example, the flow calls [Get Apps as Admin](/connectors/powerappsforadmins/#get-apps-as-admin).
1. Filters the returned list of objects to get objects where the modified date is greater than seven days old (configurable via **InventoryFilter_DaysToLookBack**).
1. Checks each object in the filtered result to see if its current modified date is more recent than the inventory date.
1. Updates these objects with the more recent _modified by_ date.

If you turn off your sync flows for longer than seven days, you can only get the inventory updates you missed by modifying the **InventoryFilter_DaysToLookBack** environment variable. Learn more in [Update environment variables](#update-environment-variables).

To fully update your entire inventory again, change the **Full inventory** environment variable:

1. Set the value of the **Full inventory** environment variable to **Yes**. Learn more in [Update environment variables](#update-environment-variables).
1. Run the **Admin | Sync Template v4 (Driver)** flow.
1. Wait until the flow finishes running.
1. Set the **Full inventory** environment variable to **No**.

## Update inventory for a selected app or flow

### Force inventory on objects

To reduce API calls, the inventory flows don't update all objects with each synchronization run. Instead, the flows only update objects modified since the last inventory. However, if you want to force the inventory for an individual object, use the **Inventory Me** flag. All objects have this flag.

Here's an example of how to set this flag by using Cloud Flow objects.

1. Go to [Power Apps](https://make.powerapps.com) and select your CoE environment.
1. Open the **Power Platform Admin View** app.
1. Select **Flows**.
1. Select the flow for which you want to force inventory from the view.
1. Select **Settings**.
1. Change the **Inventory Me** flag to **Yes**.

When you set this flag to **Yes**, the next inventory run updates the object, even if it isn't recently modified. The flag then resets to **No**.

### Force inventory on cloud flow action details

We gather details about the flow actions in a long running flow called **Admin | Sync Template v3 (Flow Action Details)**.

To force inventory to run for your flow, use the **Inventory My FlowActionDetails** flag.

1. Go to [Power Apps](https://make.powerapps.com) and select your CoE environment.
1. Open the **Power Platform Admin View** app.
1. Select **Flows**.
1. Select the flow for which you want to force flow action detail inventory from the view.
1. Select **Settings**.
1. Change the **Inventory My FlowActionDetails** flag to **Yes**.

## Update environment variables

### Limitations for environment variables

The following limitations apply when updating environment variables:

- You can't update the values for environment variables from within the imported solution.
- Always add or update the current value, not the default value, as the default value is overwritten when you install an upgrade.
- You can't update Azure Key Vault secret environment variables by using the CoE Admin Command Center. Instead, update them via the **Default Solution**.

### Update CoE Starter kit specific environment variables

To update environment variables used in the kit, use the [CoE Admin Command Center](core-components.md#coe-admin-command-center):

1. Go to [Power Apps](https://make.powerapps.com) and select your CoE environment.
1. Open the **CoE Admin Command Center** app.
1. Select the **Environment Variables** screen.
1. Select an environment variable to update, then select **Edit** from the navigation bar.

### Ensure flows that use environment variables aren't cached

At times, Power Automate caches old values for environment variables. If you don't see the expected behavior after changing an environment variable, restart the impacted flows after setting the environment variable.

1. Go to [Power Automate](https://make.powerautomate.com).
1. On the left pane, select **Solutions**.
1. Select the **Default Solution**, and change the filter to show **Environment variables**.
1. Select a variable that you want to update and select its overflow menu to choose **Advanced** > **Show dependencies**.
1. Look at the **Used by** tab and the **Object type** process.
   :::image type="content" source="media/env-var-reset-2.png" alt-text="Screenshot that shows the Used by tab and Object type section of a dependency." lightbox="media/env-var-reset-2.png":::
1. Turn off all these flows and then turn them back on.

### Environment variables outside the kit

If you aren't using the [CoE Admin Command Center](core-components.md#coe-admin-command-center) app, you can update environment variables outside the kit. You can update environment variables directly in the environment. Updating through the environment is the only way to update Azure Key Vault secret environment variables.

1. Go to [Power Automate](https://make.powerautomate.com).
1. On the left pane, select **Solutions**.
1. Select the **Default Solution**, and change the filter to show **Environment variables**.
1. Select a variable that you want to update, and then configure its **Current Value**.
1. If you're updating an Azure Key Vault secret environment variable, enter the following information:
   - **Azure Subscription ID**: The Azure subscription ID associated with the key vault.
   - **Resource Group Name**: The Azure resource group where the key vault that contains the secret is located.
   - **Azure Key Vault Name**: The name of the key vault that contains the secret.
   - **Secret Name**: The name of the secret located in Azure Key Vault.

> [!TIP]
> You can find the subscription ID, resource group name, and key vault name on the Azure portal **Overview** page of the key vault. You can find the secret name on the key vault page in the Azure portal by selecting **Settings** > **Secrets**.

## Update connection references

1. Go to [Power Automate](https://make.powerautomate.com).
1. On the left pane, select **Solutions**.
1. Select the **Default Solution**, and change the filter to show **Connection References**.
1. Select a connection reference.
1. Set the value by selecting an existing connection from the dropdown or by creating a new connection.
1. Select **Save** and confirm you want to save the changes.

## Monitor and customize emails

The solution stores all emails sent as part of the CoE Starter Kit in the **Customized Emails** table. To customize the emails, you don't need to modify the flows or apps that send the emails. Instead, you can use the [CoE Admin Command Center](core-components.md#coe-admin-command-center) app.

1. Go to [Power Apps](https://make.powerapps.com), and then select your CoE environment.
1. Open the **CoE Admin Command Center** app.
1. Select **Customized Emails**.
1. Select the email you want to customize, then select **Edit**.
1. By default, all emails are provided in English. You can add localized versions of the email by selecting **Add language**.
   :::image type="content" source="media/commandcenter-customize-email.png" alt-text="Screenshot showing the Customized Emails page of the Power Apps CoE Admin Command Center." lightbox="media/commandcenter-customize-email.png":::

## Share an app from a production environment

1. Go to [Power Apps](https://make.powerapps.com) and select your CoE environment.
1. On the app that you want to share, select the overflow menu **...** > **Share**.
   
1. Select the Dataverse security role. The CoE Starter Kit provides three security roles:
    - **Power Platform Admin SR** for sharing an app with admins
    - **Power Platform Maker SR** for sharing an app with your makers
    - **Power Platform User SR** for sharing an app with users

1. Select **Share**.

## Get a Power Apps URL from a production environment

1. Go to [Power Apps](https://make.powerapps.com) and select your CoE environment.
1. Select **Apps**.
1. Select the app that has the URL you need.
1. Select the overflow menu **...** > **Details**.
1. Select the **Web link**.

## Handle backend throttling during inventory runs

Some users might encounter throttling by the product backends, such as updating records in Dataverse, during their inventory process. This throttling results in 429 errors. To address this issue, use an environment variable that adds a delay at the beginning of each individual inventory action. This delay prevents actions from running concurrently. While this approach mitigates concurrency issues, it might prolong the inventory process.

To use this environment variable, change `DelayObjectInventory` to **Yes**.

Learn more in [How to update environment variables](#update-environment-variables).

## Cross tenant connection identities

In the Power Platform Admin View app, you can see where we highlight cross tenant connection identities. How do we configure what is considered cross tenant?

:::image type="content" source="media/coe-cross-tenant-connection-reference.png" alt-text="Screenshot that shows Cross Tenant Connection References page from the Connection Identities navigation menu in the Power Platform Admin View." lightbox="media/coe-cross-tenant-connection-reference.png":::

### How to configure a local connection identity

By default, only the host domain of the identity running the inventory flows is a _local_ identity. To configure this identity, use the **Host Domains** environment variable.

Enter any hosts you want to add as a comma-separated string.

:::image type="content" source="media/coe-cross-tenant-connection-reference2.png" alt-text="Screenshot that shows the Configure Environment Variable pane from a selected environment variable name." lightbox="media/coe-cross-tenant-connection-reference2.png":::

Learn more in [How to update environment variables](#update-environment-variables).

### How to update data to respect configured local tenants

> [!TIP]
> Changing the Host Domains environment variable doesn't retroactively update old data in tables. Since this setting change is infrequent, the solution doesn't regularly compare it to avoid extra API calls. You need to update this environment variable manually.

You can update this variable manually with custom flows, the Excel add-in, or through plugins. The underlying logic is consistent across these methods, so choose the method that best suits your needs.

For this example, use the Excel Add-In. It's ideal because of its speed and minimal API impact.

1. Go to the **Connection Reference Identity** table and select **Edit data in Excel**.
   :::image type="content" source="media/coe-cross-tenant-connection-reference3.png" alt-text="Screenshot of where to choose the Edit data in Excel option in the Edit menu bar." lightbox="media/coe-cross-tenant-connection-reference3.png":::
1. Select **Enable Editing**.
   :::image type="content" source="media/coe-cross-tenant-connection-reference4.png" alt-text="Screenshot that shows where to select the Enable Editing button." lightbox="media/coe-cross-tenant-connection-reference4.png":::
1. Select **Accept and Continue**, if prompted, then sign in as your CoE Admin identity.
   :::image type="content" source="media/coe-cross-tenant-connection-reference5.png" alt-text="Screenshot that shows where to select the Accept and Continue button." lightbox="media/coe-cross-tenant-connection-reference5.png":::

1. Filter the **accountName** field by the domain you added to the **Host Domains** environment variable.
   :::image type="content" source="media/coe-cross-tenant-connection-reference6.png" alt-text="Screenshot showing filtered results by domain name." lightbox="media/coe-cross-tenant-connection-reference6.png":::

1. Set the **NoneOrCrossTenantIdentity** field to **No**.
   :::image type="content" source="media/coe-cross-tenant-connection-reference7.png" alt-text="Screenshot showing where to change the NoneOrCrossTenantIdentity field." lightbox="media/coe-cross-tenant-connection-reference7.png":::

1. Remove the filters and publish.
   :::image type="content" source="media/coe-cross-tenant-connection-reference8.png" alt-text="Screenshot that highlights the Publish button." lightbox="media/coe-cross-tenant-connection-reference8.png":::

## How to activate Business Process Flows

Occasionally, users encounter disabled Business Process Flows (BPFs) within the kit due to installation issues.

To use features that rely on these BPFs, you can activate them manually:

1. Browse to the solution with the BPFs and select to view **Processes**.
1. Find BPFs that are turned off and select a name to open.
   :::image type="content" source="media/coe-bpf-turnon1.png" alt-text="Screenshot that shows where to find the status of a process." lightbox="media/coe-bpf-turnon1.png":::

1. Select **Activate** to turn on the BPF.
   :::image type="content" source="media/coe-bpf-turnon2.png" alt-text="Screenshot that shows location of the Activate button on the navigation bar of a flow view." lightbox="media/coe-bpf-turnon2.png":::

## Which license should I assign to the user running the CoE Starter Kit flows?

Before installing the CoE Starter Kit, the user must have a Power Automate Per User license, or the flows must be covered with a Per Flow license.

Often, you need a combination of these licenses to run the CoE Starter Kit successfully. The specific combination depends on factors such as the number of resources (apps, flows, environments) in your tenant, your number of makers, and how frequently new resources are created and modified.

Different Power Automate license types have different API limits and enforcements. If your license type isn't sufficient, the flow might be throttled or run for an extended period.

This guide helps you determine which license to select:

  1. Understand the [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations).
  1. Start by assigning a Power Automate Per user license and turn on all required flows. Monitor the flows with **CLEANUP**, **Sync Template (Flows)**, and **Sync Template (Apps)** in the name. These options might consume a high number of API requests. You can use [action analytics](https://powerautomate.microsoft.com/blog/introduction-action-usage-analytics-in-power-automate/) to monitor the API requests of these flows.
  1. If the flow runs too many actions, [Change the owner of a cloud flow](/power-automate/change-cloud-flow-owner) to a different account with a Power Automate Per User license. This step balances the API requests.
  1. If the flow continues to execute too many actions, consider assigning a [Types of Power Automate licenses](/power-platform/admin/power-automate-licensing/types#standalone-plans) plan to it. This action allocates capacity and API requests specifically for the flow.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
