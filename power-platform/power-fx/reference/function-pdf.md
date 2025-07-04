---
title: PDF function (experimental)
description: Reference information including syntax and examples for the PDF function.
author: TashasEv
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: tashas
search.audienceType:
  - maker
contributors:
  - TashasEv
  - mduelae
---

# PDF function (experimental)
[!INCLUDE[function-pdf-applies-to](includes/function-pdf-applies-to.md)]




[This article is prerelease documentation and is subject to change.]

Export contents from the current screen to an object for use in multiple scenarios.

> [!IMPORTANT]
> - This is an experimental feature.
> - Experimental features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback. More information: [**Understand experimental, preview, and retired features in canvas apps**](/power-apps/maker/canvas-apps/working-with-experimental-preview)
> - The behavior that this article describes is available only when the PDF function experimental feature in [**Settings &gt; Upcoming features &gt; Experimental**](/power-apps/maker/canvas-apps/working-with-experimental-preview#controlling-which-features-are-enabled) is turned on (it's off by default).
> - Your feedback is valuable to us. Please let us know what you think in the [**Power Apps experimental features community forum**](https://powerusers.microsoft.com/t5/Power-Apps-Experimental-Features/bd-p/PA_ExperimentalFeatures).

## Description

The PDF function allows you to select a screen or portions of a screen for export to a PDF object (blob).

Different configuration options enable different outcomes for the resulting generated PDF.

> [!IMPORTANT]
> - PDF generation happens on the device where the app is running. Different devices such as desktop computers and mobile devices will have different capacities when you're generating a PDF.
> - Generating a PDF with an exceptionally large file size can result in the app crashing. This depends on the capacity of the device that you're running the app on. Be aware of the size and number of images and how much data you want to include in the generated PDF, specifically for apps intended for use on a mobile device.

> [!NOTE]
> - You can only generate a PDF from content existing on the screen where you have invoked the PDF function. For example, if you have added the PDF function on screen two, then only the content in screen two can be included in the generated PDF.

## Syntax

**PDF** _(Screen or control name \[,{Size, DPI, Margin, Orientation, ExpandContainers}\])_

-   *Screen or control name –* Required. The screen or control containing the content to use to generate the PDF. Supported controls: Vertical Gallery, Vertical Layout Container, Horizontal Layout Container, Container, Screen.

-   *Size –* Optional. Controls the dimensions of the generated PDF. The default value depends on the app user's locale; Letter for US and Canada and A4 for other locales.

-   *DPI* – Optional. Controls the scaling/resolution of the generated PDF. Must be a value greater than 0. Content exceeding the space allowed by the specified margins may result in a higher effective DPI. The default value is 96.

-   *Margin –* Optional. A string specifying the size of the space reserved between the content and the outer edge of the generated PDF. Each margin of the generated PDF (top, right, bottom, left) can support a different value. Supported units of measurement for this value include in, cm, mm, pt, and px. The default value is 0.5 inch (12.7 mm) for all margins.

-   *Orientation –* Optional. Controls whether the generated PDF has a portrait (vertical) or landscape (horizontal) orientation. The default value is portrait (vertical).

-   *ExpandContainers –* Optional. Boolean. Controls whether certain containers with contents that exceed their allocated size expand to display all content in the generated PDF. Impacted controls include screens, containers, vertical and horizontal containers, vertical fixed-height galleries (not nested), forms, and scrollable canvas controls. The default value is false.

### Examples

| **Formula**                                                           | **Description**                                                                                                                                  | **Result**                                                                                                                                      |
|-----------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **PDF(Screen1)**                                                      | Generates a PDF object with the default settings.                                                                                                | A PDF object is created from the visible contents of Screen1.                                                                                   |
| **PDF(Container1, {Size: "A3"})**                                       | Generates a PDF object with the paper size set to A3.                                                                                            | An A3-sized PDF object is created from the visible contents of Container1.                                                                      |
| **PDF(Screen1, {DPI: 72, Margin: "25mm", Orientation: "Landscape"})** | Generates a PDF object with the resolution (DPI) set to 72, the margin set to 25 millimeters, and the orientation set to landscape (horizontal). | A PDF with the specified DPI, margin, and orientation is created in the default size (dependent on locale) from the visible content on Screen1. |
| **PDF(Screen1, {ExpandContainers: true})**                            | Generates a PDF object with applicable controls expanded.                                                                                        | A PDF is created where any containers/galleries with more content than is visible are expanded to show all content in the generated PDF.        |

## Known limitations

- Certain controls aren't currently supported. These include charts, Power BI tile, Map, and some configurations of third-party PCF controls.

- Nested Galleries aren't supported.

- Non-Latin script types and font weights and styles such as bold and italic may not appear in the generated PDF for some fonts.

- Creation of fillable PDFs isn't supported.







































































































































