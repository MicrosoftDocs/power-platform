---
title: Details List control reference | Creator Kit
description: Learn about the details and properties of Details List control in the Creator Kit.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/16/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - demora-msft
  - slaouist
---

# Details List control

A control used to display a set of data.

:::image type="content" source="media/details-list.png" alt-text="Details List control.":::

## Description

A details list is a robust way to display an information-rich collection of items, and allow people to sort, group, and filter the content. Use a details list when information density is critical.

The Details List code component allows using of the [Fluent UI Details List component](https://developer.microsoft.com/fluentui#/controls/web/detailslist) from inside canvas apps and custom pages.

[View component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/Controls/cat_PowerCAT.FluentDetailsList)

## Limitations

This PCF component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| Items | Required. The data source items table to render. Items can be from any data source because values are mapped in the Columns property (which acts as a schema definition). |
| Fields | Required. The fields needed are indicated. |
| Columns | Required. Table mapping definition between the component column and the data source. Use this property to map field names and define specific column behavior. |

## Additional properties

| Property | Description |
| -------- | ----------- |
| Views | View if supported by the data source (for example, Dataverse). |
| Selection type | Controls how/if the details list manages selection. Options include none, single, multiple |
| Select rows on focus | Whether rows will be selected when the control is focused. |
| Page size | Number of items displayed in the page. |
| Sort column | ColName value to sort by default. |
| Sort direction | Default sorting direction. |
| Compact | Whether to render in compact mode. |
| Header visible | Controls the visibility of the header. |
| Alternate row color | Color of every other row. Accepts CSS color values (for example,  hexadecimal, RGB, predefined) |
| Selection radio button | Whether to render the **Select all** radio button. |
| Raise OnRowSelection | Enable this property to allow **OnRowSelection** events. |

## Mapping data to columns

To determine which columns are displayed in the Details List, configure the following properties of the Details List:

1. **Fields**. Add the desired fields by selecting the Edit option in the controls flyout on the right (uses the same interface for modifying [predefined data cards](/power-apps/maker/canvas-apps/working-with-cards)).

1. **Columns**. Provide specific mapping between columns and fields in the `Columns` property.  

The below table schema must be used in the `Columns` (`column_Items`) property to display the desired data.

### Columns table schema

| Name | Description |
| ------ | ----------- |
| ColName | A unique key for identifying the column. |
| ColDisplayName | Name to render on the column header. |
| ColWidth | Minimum width for the column. |
| ColSortable | Determines if the column has sorting behavior. |
| ColIsBold | Determines if the text is bold or not. |
| ColResizable | Determines if the column can be resized. |
| ColShowAsSubTextOf | The ColName value of the parent column this text. Leave blank to display in a separate column. |
| ColCellType | Provide "link" as the value to make the column selectable. Leave blank for regular text without style. |

Example:

Mapping to the Dataverse [Accounts](/power-apps/developer/data-platform/reference/entities/account) system table, with the below formula:

```powerapps-dot
    Table(
        {
            ColName: "name",
            ColDisplayName: "Name",
            ColWidth: 200,
            ColSortable: true,
            ColIsBold: true,
            ColResizable: true
        },{
            ColName: "address1_city",
            ColDisplayName: "City:",
            ColShowAsSubTextOf: "name"
        },{
            ColName: "address1_country",
            ColDisplayName: "Country:",
            ColShowAsSubTextOf: "name"
        },{
            ColName: "telephone1",
            ColDisplayName: "Telephone",
            ColWidth: 100,
            ColSortable: true,
            ColResizable: true
        },{
            ColName: "primarycontactid",
            ColDisplayName: "Primary Contact",
            ColWidth: 200,
            ColSortable: true,
            ColSortBy: "_primarycontactid_value",
            ColResizable: true,
            ColCellType: "link"
        })
```

## Configure "On Change" behavior

Add and modify the below formula in the component's `OnChange` property to configure specific actions based on the `EventName` provided by the component:

- Trigger events when a user changes the selected row: Enable the property **Raise OnRowSelectionChange event** in the component.
- Configure link behavior: Add columns with the **ColCellType** value set to "link".

```powerapps-dot
/* Runs when selected row changes and control property 'Raise OnRowSelection event' is true */
If( Self.EventName = "OnRowSelectionChange",
    Notify( "Row Select " & Self.EventRowKey )
);

/* Runs when a user clicks on a column with ColCellType set to 'link' */
If( Self.EventName = "CellAction",
    Notify( "Open Link " &  Self.EventColumn & " " & Self.EventRowKey )
)
```

## Best practices

For more information, see [Fluent UI Details List control best practices](https://developer.microsoft.com/fluentui#/controls/web/detailslist).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]