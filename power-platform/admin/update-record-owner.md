---
title: "Update a record Owner and Owning Business Unit"
description: "Learn how to update a record’s owner, an Owning Business Unit, or both an Owner and Owning Business Unit because the record changes ownership."
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Update a record Owner and Owning Business Unit

There are situations where you need to update a record’s owner, an Owning Business Unit, or both an owner and Owning Business Unit because the record changes ownership. If you have enabled the [allow record ownership across business units](wp-security-cds.md#to-enable-this-matrix-data-access-structure-preview), you can update the record’s owning business unit. 

> [!NOTE]
> Changing the **Owner Business Unit** is a preview feature and is being rolled out over time.

To update the record owner and owning business unit, you can add the Owning Business Unit in the header of the form and in the summary of the form.

Follow these steps.

1. Open a customer engagement app (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).

2. Select a record such as an account.

3. Change the **Owner** or **Owner Business Unit** in the form header or form summary.

   :::image type="content" source="media/change-owning-business-unit.png" alt-text="Change Owner or Owner Business Unit":::

## Table relationship and cascading behavior 

If there are related tables and the relationship behavior is set to parental, updating the record’s owner and/or owning business unit can have a cascading effect. See [About the assign action](https://review.docs.microsoft.com/powerapps/developer/data-platform/configure-entity-relationship-cascading-behavior?branch=jimholtztemp#about-the-assign-action).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
