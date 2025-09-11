---
title: Download function
description: Reference information including syntax and examples for the Download function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Download"]
---

# Download function
[!INCLUDE[function-download-applies-to](includes/function-download-applies-to.md)]



Downloads a file from the web to the local device.

## Description

The **Download** function downloads a file from the web to the local device.

In native players (Windows, Android, and iOS), the user is prompted for a location to save the file.

When used on the web, **Download** is dependent on the browser's settings to determine what happens with the file. For images, videos, PDFs, and other file types that the browser natively supports, a new browser tab is opened to display the file. Many browsers support saving the contents to the local file system.

Only on Windows, **Download** returns the location where the file was stored locally as a text string.

**Download** can only be used in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

## Syntax

**Download**( _Address_ )

- _Address_ – Required. The URL address of a web resource to download.

> [!NOTE]
> Power Apps cannot authenticate download requests to the address provided in the Download() function.
>
> For example, when using this function to download a file stored on a SharePoint site that requires authentication, the request might work when using a web browser since the browser session might authenticate against the SharePoint site using cached credentials. However, in Power Apps mobile app, the request will not work since authenticating the download request is not handled by the mobile device.


## Examples

### Simple Download

The following formula will download the user's guide for the Surface Book, a PDF file:

```power-fx
Download( "https://go.microsoft.com/fwlink/?linkid=827480" )
```

When run in a mobile device, the user will be prompted for a location to save the file.

When run in most web browsers, a new tab will be opened to display the PDF file as most browsers natively support this file type.

### Step by Step

The **Product Showcase** tablet layout template was used for the following example. To create an app with this template, follow the steps from [create an app](/power-apps/maker/canvas-apps/get-started-test-drive) article and select the **Product Showcase** template. You can also use your own app.

1. Go to [Power Apps](https://make.powerapps.com).
1. Select **Apps** from left navigation pane.
1. Select your app and then select **Edit**.
1. Select **Insert** from the menu and then select **Label**.
1. Move the label to the bottom right of the screen.
1. From the properties pane on the right-side, select **Color** as _white_ and set **Border thickness** at _1_.
1. Select the **Text** property from right-side and enter text as _Download User Guide_.
1. From property list on top left, select **OnSelect**.
1. Enter formula as `Download("https://go.microsoft.com/fwlink/?linkid=827480")`. You can also use any other URL of your choice.

   ![Download example.](media/function-download/download-example-onselect.png "Download example")

1. Save and publish the app.
1. Play the app.
1. Select the **Download User Guide** button to download the guide.

> [!NOTE]
> Your browser settings determine whether to download the file or open the file directly in a new tab. For more details, go to [Download function description](#description).

### See also

[Canvas app formula reference](/power-apps/maker/canvas-apps/formula-reference)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































