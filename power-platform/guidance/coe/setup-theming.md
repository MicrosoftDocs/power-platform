---
title: Set up Power Apps theming components
description: Learn how to install and configure theming components for canvas apps to streamline app styling, including share custom themes across your organization.
author: manuelap-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/05/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
---

# Set up theming components

Use theming components to create, manage, and share themes for canvas apps. A *theme* is a collection of styles that define multiple design properties for controls and components, such as colors, fonts, and borders. When makers use the themed template app to create a new app, these styles automatically apply to controls and components.

The theming components solution contains assets that are relevant to makers in addition to designers.

> [!IMPORTANT]
> The theming components solution doesn't depend on other components of the CoE Starter Kit. You can use it independently.

Before you begin, review the [prerequisites](setup.md) for using the starter kit solution.

- If you aren't already using the CoE Starter Kit, we recommend [creating a new environment](../../admin/create-environment.md) for CoE solutions.
- If you're already using other CoE Starter Kit components, use the environment that you created as part of setting up the [core components](setup-core-components.md) for this solution.

## Prerequisites

The Power Apps theming solution contains Power Apps component framework elements. You must enable publishing of canvas apps with code components for the environment:

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).
1. In the navigation pane, select **Manage**.
1. From the Manage pane, select **Environments**.
1. Choose the environment where your CoE solution is installed, or the environment where you plan to import the solution.
1. Select **Settings**.
1. Select **Product** > **Features**.
    :::image type="content" source="media/theming-2.png" alt-text="Power Platform admin center Environment Product Settings.":::
1. Make sure **Allow publishing of canvas apps with code components** is enabled.
    :::image type="content" source="media/theming-3.png" alt-text="Enable publishing of canvas apps with code components in the Power Platform admin center.":::

## Import the solution

1. Go to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit/releases/tag/CoEStarterKit-November2022), and download the *Theming_x.x_managed.zip* file from under **Assets**.

1. Extract the zip file.

1. Go to [make.powerapps.com](<https://make.powerapps.com>).

1. Go to your CoE environment. In the example in the following image, you're importing to the environment named **Contoso CoE**.

     :::image type="content" source="media/coe6.png" alt-text="Power Apps maker portal environment selection.":::

1. On the left pane, select **Solutions**.

1. Select **Import**. A pop-up window appears. (If the window doesn't appear, make sure your browser's pop-up blocker is disabled and try again.)

1. In the pop-up window, select **Choose File**.

1. Select the Center Of Excellence theming solution from File Explorer (*Theming_x_x_managed.zip*).

1. When the compressed (.zip) file has been loaded, select **Next**.

1. Select **Next**, and then select **Import**. (This process might take some time.)

1. When the import succeeds, you see the list of components that were imported.

1. Select **Close**.

You can now [use the theming components](theming-components.md).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
