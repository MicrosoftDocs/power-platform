---
title: ReadNFC function
description: Reference information, including syntax, for the ReadNFC function
author: mikepenaMS
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: mikepena
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
  - mikepenaMS
  - anuitz
no-loc: ["ReadNFC"]
---

# ReadNFC function
[!INCLUDE[function-readnfc-applies-to](includes/function-readnfc-applies-to.md)]



Reads a Near Field Communication (NFC) tag.

## Description

Use the **ReadNFC** function to read an NFC tag that is close to your device. When invoked, the screen displays instructions for scanning an NFC tag, and only returns after the tag has been scanned or it times out.

| **Column**  | **Type** | **Description**                              |
|-------------|----------|----------------------------------------------|
| Identifier  | Text     | The NFC tags identifier if available.        |
| NDEFRecords | Table    | The supported NDEF records found on the tag. |

A single **NDEFRecord** contains the following columns:

| **Column** | **Type**  | **Description**                                                                            |
|------------|-----------|--------------------------------------------------------------------------------------------|
| RTD        | Text      | The tag's Record Type Definition (RTD). Only *Text* and *URI* are supported at this time.  |
| TNF        | Number    | The tag's Type Name Format (TNF). Only TNFs of *Well Known(1)* are supported at this time. |
| Text       | Text      | The text payload of the NFC tag if RTD is *TEXT*, *blank* otherwise.                       |
| URI        | Hyperlink | The URI payload of the NFC tag if RTD is *URI*, *blank* otherwise.                         |

If the NDEF record isn't supported (for example, the TNF isn't of type *Well Known*), then it won't be returned as part of the **NDEFRecords** table.

Always check the payload values for *blank* using the [**IsBlank**](function-isblank-isempty.md) function before using it. You don't need to check the **RTD** and **TNF** values yourself as they must be the correct values for **Text** and **URI** to have a non-*blank* value.

Additional **RTD** and **TNF** values may be supported in the future. If more values are supported, additional payload columns will also be added. The raw **RTD** and **TNF** values are provided for informational purposes and don't need to be consulted if the payload column is checked for *blank*. More information about these values and their use is available through the [NFC Forum](https://nfc-forum.org/).

**ReadNFC** doesn't require a tag containing NDEF records to be used, but you may still get the tag identifier if one is available.  
  
**ReadNFC** can only be used in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

> [!NOTE]
> - **ReadNFC** is only supported when running the app on a native mobile app, such as the [iOS](https://apps.apple.com/us/app/power-apps/id1047318566) and [Android](https://play.google.com/store/apps/details?id=com.microsoft.msapps) apps. Even with a supported player, a device may not support NFC. If your application has **Formula-level error management** turned on, the function will return an error. Otherwise, an error message will be shown to the user and the function will return a *blank* record.
> - Ensure your device has the NFC setting enabled to use this capability.

## Syntax

**ReadNFC**()

## Examples

| **Formula**           | **Description**                                                                                | **Result**                                                              |
|-----------------------|------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| `ReadNFC().Identifier`  | Returns the identifier of the NFC tag if one exists.                                            | `04A1C301314003`                                                          |
| `ReadNFC().NDEFRecords` | Returns a table of NDEF records found on the NFC tag if they're a supported type and payload. | :::image type="content" source="media/function-readnfc/ndefrecords.png" alt-text="NDEFRecords result with an example record."::: |

## Step-by-step example

1. Create a [blank canvas app](/power-apps/maker/canvas-apps/create-blank-app) with **Phone** format.

1. Add a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control.

1. Double-click the button control to change the button text to **Read NFC Tag** (or modify the **Text** property).

1. Set the **OnSelect** property of the button control to this formula that will add an item to our collection:  

    ```power-fx
    With(ReadNFC(),
        Set(id, Coalesce(Identifier, "No ID"));
        ForAll(NDEFRecords, Collect(tagRecords, {ID: id, Value: Coalesce(Text, URI)})))
    ```

    :::image type="content" source="media/function-readnfc/onselect-formula.png" alt-text="Above formula entered as the OnSelect property of the button.":::

    This formula reads an NFC tag using the `ReadNFC()` function, and displays type information about the result. Then it collects the read NFC tags to populate the `tagRecords` collection to be used for the gallery in the next steps.

1. Add a [**Gallery**](/power-apps/maker/canvas-apps/controls/control-gallery) control with a vertical layout.

1. When prompted, select the **tagRecords** collection as the data source for this gallery. This action will set the **Items** property of the **Gallery** control.

    :::image type="content" source="media/function-readnfc/tagrecords.png" alt-text="Data source for gallery selected as tagRecords.":::

1. Reposition the gallery control so that it doesn't overlap the button, and change the layout type to **Title and subtitle**.

    :::image type="content" source="media/function-readnfc/gallery-layout.png" alt-text="Layout of the gallery.":::

1. Change the **Title** formula in the gallery control to **ThisItem.Value** and change the **Subtitle** formula in the gallery control to **ThisItem.ID**.

    You can also delete the **NextArrow** from the gallery control since it's not used.

1. [Save and publish](/power-apps/maker/canvas-apps/save-publish-app) the app.

1. Since the function `ReadNFC()` can't be used in Power Apps Studio or in a web browser, open your app on a mobile device.

    > [!TIP]
    > The app might take a few moments to appear on your mobile device. If you don't see the app listed, try refreshing your app list.

1. Select **Read NFC Tag** and scan a tag. Repeat the process to add multiple tags to your collection.

    :::image type="content" source="media/function-readnfc/app-example.png" alt-text="App on mobile device with the NFC Tag reading example and the result inside the gallery.":::

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































