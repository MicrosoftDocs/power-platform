---
title: "System Settings Sales tab  | MicrosoftDocs"
description: System Settings Sales tab 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# System Settings Sales tab

Use the settings on this page to configure system-level settings for the sales area of customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).  

<!-- legacy procedure -->
 
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
2. If you are using a Sales web application, go to **Settings** > **Administration** > **System Settings**, and then select the **Sales** tab.

   OR

   If you are using the Sales Hub App, select the Site map icon ![Site map icon](media/site-map-icon.png "Site map icon"), then select ellipsis ![Ellipsis to open more options](media/ellipsis-more-options.png "Ellipsis to open more options") , then select **App Settings**, and then select **Product Catalog Settings**.

  
  |                                            Settings                                             |                                                                                                                                                                                             Description                                                                                                                                                                                              |
|-------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                **Select whether products should be created in the active state**                |                                                                                                                                                                                                                                                                                                                                                                                                      |
|                                 Create products in active state                                 |                                                                                           To set the products to active state by default after creation, click **Yes**. This option applies only to products that don't have a parent product family. To create products in the Draft state, click **No**.                                                                                           |
| **Set whether the default pricelist for an opportunity should be selected via an inbuilt rule** |                                                                                                                                                                                                                                                                                                                                                                                                      |
|              Allow selection of default pricelist for opportunity via inbuilt rule              |                                                                                                  Click **Yes** if you want the default price list to be selected for an opportunity based on the inbuilt rule (based on the default price lists defined for territories). Otherwise, click **No**.                                                                                                   |
|                         **Set maximum number of products in a bundle**                          |                                                                                                                                                                                                                                                                                                                                                                                                      |
|                             Maximum number of products in a bundle                              |                                                                                                                                                                        Type the maximum number of products a bundle can have.                                                                                                                                                                        |
|                             **Set pricing calculation preference**                              |                                                                                                                                                                                                                                                                                                                                                                                                      |
|                                 Use system pricing calculations                                 |                                                      Click **Yes** to use the pricing calculations of customer engagement apps. To use custom pricing by using a plug-in, click **No**. When set to **No**, the default pricing calculations won't be done on opportunity, quote, order and invoice records.                                                      |
|                **Set whether a discount is applied as a line item or per unit**                 |                                                                                                                                                                                                                                                                                                                                                                                                      |
|                                   Discount calculation method                                   |                                                             Select **Per unit** if you want the pricing engine to calculate the discount based on the prices per unit instead of a line item. By default, the calculations are done on a line item-basis. \*See the table below that shows the difference between the two calculations.                                                              |
|              **Set maximum number of properties allowed for a product or bundle**               |                                                                                                                                                                                                                                                                                                                                                                                                      |
|              Maximum number of properties that are allowed for a product or bundle              | Type the maximum number of properties (specifications) a product or bundle can have. Product properties are added to a product family record, and all the child products and bundles under the product family inherit the properties added to the parent product family. The number specified in this setting is applied only when you publish a product or a bundle with the associated properties. |

*Table: Difference between calculations

|Discount method|Product|Price per unit|Quantity|Discount|Amount|  
|---------------------|-------------|--------------------|--------------|--------------|------------|  
|Line item|Product 1|100|11|10|(100*11)-10=1090|  
|Per unit|Product 2|100|11|10|(100-10)*11=990|  
  
  
          


  
### See also  
 [Set up a product catalog: Walkthrough](https://docs.microsoft.com/dynamics365/sales-enterprise/set-up-product-catalog-walkthrough)   
 [Define product pricing with price lists and price list items](https://docs.microsoft.com/dynamics365/sales-enterprise/create-price-lists-price-list-items-define-pricing-products)   
 [Set up a discount list](https://docs.microsoft.com/dynamics365/sales-enterprise/set-up-discount-list)   
 [Set up product bundles to sell multiple items together](https://docs.microsoft.com/dynamics365/sales-enterprise/create-product-bundles-sell-multiple-items-together)   
 [Use properties to describe a product](https://docs.microsoft.com/dynamics365/sales-enterprise/use-properties-describe-product)  
 [Administrator and Sales Manager Guide](https://docs.microsoft.com/dynamics365/sales-enterprise/admin-guide)  
