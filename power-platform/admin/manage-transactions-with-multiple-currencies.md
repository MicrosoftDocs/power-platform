---
title: "Manage transactions with multiple currencies  | MicrosoftDocs"
description: Manage transactions with multiple currencies
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage transactions with multiple currencies

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Currencies determine the prices for products in the product catalog and the cost of transactions, such as sales orders. If your customers are spread across geographies, add their currencies to manage your transactions. Add the currencies that are most appropriate for your current and future business needs.  

> [!NOTE]
> If your environment is a [Microsoft Dataverse environment](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro), you are in the Power Platform admin center, and you select the **Currencies** page (**Environments** > [select environment] > **Settings** > **Business** > **Currencies**), the page will be blank. This is because setting a currency is not supported in Dataverse environments.

## Add a currency 

1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  

    Check your security role  

   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Business**.

4. Select **Currencies**.  

5. Select **New**.  

6. Fill in the information, as required.  


   |          Field          |                                                                                                                                                                                                                                                                                                                                                                            Description                                                                                                                                                                                                                                                                                                                                                                            |
   |-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   |    **Currency Type**    | - **System** - Select this option if you want to use the currencies available in customer engagement apps (such as Dynamics 365 Sales and Customer Service). To search for a currency,  select the **Lookup** button ![Lookup button](../admin/media/lookup-button-4.png "Lookup button") next to **Currency Code**. When you select a currency code, **Currency Name** and **Currency Symbol** are automatically added for the selected currency.<br />- **Custom** - Select this option if you want to add a currency that's not available in customer engagement apps. In this case, you must manually enter the values for **Currency Code**, **Currency Precision**, **Currency Name**, **Currency Symbol**, and **Currency Conversion**. |
   |    **Currency Code**    |                                                                                                                                                                                                                                                                                                                                            Short form for the currency. For example, **USD** for United States Dollar.                                                                                                                                                                                                                                                                                                                                            |
   | **Currency Precision**  |                                                                                                                                                                                  Type the number of decimals that you want to use for the currency.  You can add a value between 0 and 4. **Note:**  If you've set a precision value in the **System Settings** dialog box, that value will appear here. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [System Settings dialog box - General tab](system-settings-dialog-box-general-tab.md).                                                                                                                                                                                  |
   |    **Currency Name**    |                                                                                                                                                                                                                                         If you selected a currency code from the list of available currencies in customer engagement apps, the currency name for the selected code is displayed here. If you selected **Custom** as the currency type, type the name of the currency.                                                                                                                                                                                                                                          |
   |   **Currency Symbol**   |                                                                                                                                                                                                                                                                      If you selected a currency code from the list of available currencies, the symbol for the selected currency is displayed here. If you selected **Custom** as the currency type, enter the symbol for the new currency.                                                                                                                                                                                                                                                                       |
   | **Currency Conversion** |                                                                                                                                                                                                                                     Type the value of the selected currency in terms of one US dollar. This is the amount at which the selected currency converts to the base currency. **Important:**  Make sure you update this value as frequently as required to avoid any inaccurate calculations in your transactions.                                                                                                                                                                                                                                      |


7. When you're done, on the command bar, select **Save** or **Save and Close**.  

   > [!TIP]
   >  To edit a currency, select the currency, and then enter or select the new values.  

## Delete a currency  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Business**.

3. Select **Currencies**.  

4. From the list of currencies displayed, select the currency to delete.  

5. Select **Delete**  ![Delete button](media/crm-ua-delete.png "Delete button").  

6. Confirm the deletion.  

> [!IMPORTANT]
>  You can't delete currencies that are in use by other records; you can only deactivate them. Deactivating currency records doesn't remove the currency information stored in existing records, such as opportunities or orders. However, you won't be able to select the deactivated currency for new transactions.  

### See also  
 [System Settings dialog box - General tab](system-settings-dialog-box-general-tab.md)   
