---
title: Manage the SAP Supplier Self Service template for Power Platform
description: Learn how to manage the SAP Supplier Self Service template for Microsoft Power Platform.
author: sandhangitms
contributor:
  - EllenWehrle
ms.author: sandhan
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/14/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started managing the SAP Supplier Self Service solution

You can set up your suppliers and users so they have access to your SAP Supplier Self Service site and you can activate a copilot chat bot to assist users on the site.

## Set up suppliers and users

The SAP Supplier Self Service template is set up to save the Supplier's SAP ID in *Account Table* in Dataverse. You want to set up your account information first and then associate users with each account. Take these steps to get started:

1. Open the [**Power Pages Management**](/power-pages/configure/portal-management-app) model-driven app.
1. Go to the **Account** page.
1. Set up each existing account record. Be sure to add the Supplier's SAP ID to **Supplier Number (SAP)** in the Account Information card.

Once all the accounts are set up, portal users can be set up and related to each Account record.

[Learn more about how to set up portal users.](/power-pages/security/external-access)

:::image type="content" source="media/manage/suppliers-users-setup.png" alt-text="Screenshot of setting up Suppliers with SAP IDs and the associated users with each Supplier account.":::

## Activate a chat bot

You can activate a chat bot to provide site demos and assist suppliers on the site. Take these steps to get started:

1. Open [Microsoft Copilot Studio](https://copilotstudio.preview.microsoft.com).
1. Select your environment and select **Copilots** to see a list of copilots.
1. Select **Supplier Bot**.
1. Open **Settings** select **Copilot details** and then **Advanced**.
1. In *Metadata*, copy the schema ID displayed in **Schema name**.

:::image type="content" source="media/manage/schema-name.png" alt-text="Screenshot of where to find Schema name in the Advanced section of Copilot details in Microsoft Copilot Studio.":::

Now that you have copied the schema name, you'll need to go to Power Pages to set the bot up. Take these steps to get started:

1. Open [Power Pages design studio](https://make.powerpages.microsoft.com/).
1. Select **Data**.
1. Search for and select **Site Component** to see a table.
1. Select the **Component Type** column in the table.
1. Choose the **filter icon** and enter **Bot Consumer**.
1. Select **Apply**.

   :::image type="content" source="media/manage/component-type-filter.png" alt-text="Screenshot of selecting the Component Type column and choosing the filter to enter Bot Consumer in Power Pages design studio.":::

1. Choose *Existing Site* data row and select **Edit row using form**. This opens a new tab that displays the bot's information.

    :::image type="content" source="media/manage/edit-row-form.png" alt-text="Screenshot of selecting a data row and then selecting Edit row using form on the Site Component page in Power Pages design studio.":::

1. In the *Content* section, update the `botschemaname` schema ID previously copied in Microsoft Copilot Studio.

    :::image type="content" source="media/manage/bot-schema-id.png" alt-text="Screenshot of where to paste the Schema ID on the Bot Consumer page in Power Pages design studio.":::
1. Sync your site and reload so a new bot will load onto your site.
