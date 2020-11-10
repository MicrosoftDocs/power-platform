---
title: "Troubleshooting Word templates | MicrosoftDocs"
description: How to upload an image for entities that don't include the EntityImage field by default
author: udaykirang
manager: shujoshi
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/11/2020
ms.author: udag
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Troubleshooting Word templates

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

This article helps you troubleshoot and resolve issues related to Word templates.

## I'm unable to see an entity image in a Word template for certain out-of-the-box and custom entities

### Reason

By default, only a few out-of-the-box entities&mdash;such as Account, Contact, Opportunity, Order, Invoice, Product, Lead, Goal, and Territory&mdash;include an **EntityImage** value for the **Primary Image** field, which you can use to upload the image to a Word template. However, for other out-of-the-box (such as Quote, Business Unit, Appointment, and Email) and custom entities, **EntityImage** isn't available.

### Resolution

To show an image for entities that don't have an **EntityImage** by default, you create an image field for the entity, upload the entity image to a record, and then add the entity image to the Word template. In the following example, we add an **EntityImage** for a **Discuss contract renewal** appointment. 

**To create an image field for the entity**

  1.	Go to **Settings** > **Customizations** > **Customize the System**.

  2.	In the solution explorer, under **Components**, expand **Entities**, and then select the entity. In this example, we're selecting the **Appointment** entity.

  > [!div class="mx-imgBorder"]
  > ![Open the Appointment entity](media/ts-wordtemplate-select-appointment-entity.png "Open the Appointment entity")

  3.	In the **Appointment** entity, select **Fields**, and then select **New**.

  > [!div class="mx-imgBorder"]
  > ![Add a new field](media/ts-wordtemplate-select-new-field.png "Add a new field")
    
  4.	In the new field form, enter **Entity Image** for the **Display Name**, enter **EntityImage** for the **Name**, and for **Data Type**, select **Image**.

  > [!div class="mx-imgBorder"]
  > ![Add EntityImage as a new field](media/ts-wordtemplate-add-image-entity.png "Add EntityImage as a new field") 

  5.	Save and close the form. 

  6.	Verify that the new field has been added by selecting the entity name. In this example, we've added **Entity Image** as a value for the **Primary Image** field for the **Appointment** entity.

  > [!div class="mx-imgBorder"]
  > ![Entity Image is added to the Primary Image field for the Appointment entity](media/ts-wordtemplate-primary-image-entity-added.png "Entity Image is added to the Primary Image field for the Appointment entity")

  7.	Publish the customizations.

**To upload the entity image to the record**

1. Open the entity record. In this example, we're opening a **Discuss contract renewal** appointment.

   > [!div class="mx-imgBorder"]
   > ![Open an appointment](media/ts-wordtemplate-open-appointment.png "Open an appointment")

2. Select the image, and in the **Choose Image** dialog box, select **Upload Image**.

   > [!div class="mx-imgBorder"]
   > ![Select Upload Image](media/ts-wordtemplate-select-upload-image.png "Select Upload Image")

3. Select the image, and then select **Change**.

   > [!div class="mx-imgBorder"]
   > ![Select Change](media/ts-wordtemplate-select-change.png "Select Change")

  The image appears beside the entity.

  > [!div class="mx-imgBorder"]
  > ![Image updated in the record](media/ts-wordtemplate-image-updated.png "Image updated in the record")

**To add the entity image to the Word template** 

1. Download and open the Word template.

   The downloaded template is saved in the following format:<br>*recordType organizationDateFormat time localDateFormat time*.docx<br>For example, the downloaded template name for the appointment is: **Appointment 2020-7-15 15-39-27 17-7-2020 12-28-00 PM.docx**.

2. Open the **XML Mapping** pane, right-click to select **new_entityimage**, and then select **Insert Content Control** > **Picture**.

    > [!div class="mx-imgBorder"]
    > ![Add an image control to a Word template](media/ts-wordtemplate-add-image-word-template.png "Add an image control to a Word template")

    The entity image field with the image is added to the Word template.

3. Save and upload the Word template to your Dynamics 365 Sales Hub app.

Now, when you download and open a document based on this template, it will contain the image you added.

  >[!NOTE]
  >Similarly, if you add an image to an entity form, follow this process to upload the image to the Word template.


### See also

[Use Word templates to create standardized documents](using-word-templates-dynamics-365.md)
