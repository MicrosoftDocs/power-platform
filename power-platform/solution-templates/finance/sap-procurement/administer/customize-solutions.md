---
title: Customize the SAP Procurement solutions
description: Learn how to get started working with solutions so you can customize the SAP Procurement template's solutions to meet your local business requirements.
author: tverhasselt
ms.author: thoverh
contributors:
  - robinsonshields
  - microsoft-george
  - EllenWehrle
  - jongilman88
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/26/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Customize the SAP Procurement solutions

The SAP Procurement solution is published as managed so that we can continue to provide new and updated capabilities. This means you won't be able to edit components _directly within_ the actual imported solution files. However, your local configurations will be _layered_ on top of the managed capabilities.

As a best practice, create a new _unmanaged_ solution in the same development environment where the imported SAP Procurement managed solutions reside. Here, you'll add the components that support the process and capabilities that you plan to deploy. Once you've added the necessary components to your new unmanaged solution, you can begin to customize to meet your additional requirements.

We recommend that you review these topics before you get started working with solutions:

- [Solution concepts](/power-platform/alm/solution-concepts-alm)
- [Solution layers](/power-platform/alm/solution-layers-alm)
- [Use a solution to customize](/power-platform/alm/use-solutions-for-your-customizations)
- [Overview of tools and apps used for ALM](/power-platform/alm/tools-apps-used-alm)

> [!IMPORTANT]
>
> - Avoid getting your local customizations overwritten if you choose to upgrade the SAP Procurement solution templates.
> - Reserve upgrades for consuming only new or uncustomized components. Prohibit getting upgrades on existing components that you have already customized.

## Get started working with solutions

1. [Install](install.md) the SAP Procurement managed solutions into your development sandbox environment.
1. [Create a new _unmanaged_ solution](/power-apps/maker/data-platform/create-solution).
1. Select **Add existing** to add one or more _components_, such as a canvas app or cloud flow from the SAP Procurement solution template into your newly created unmanaged solution.
1. As you begin to extend the components, _solution layers_ are created against those components, which you can see underneath **Advanced** > **See solution layers** when selecting a solution component.

## Next steps

[Extend canvas apps](extend-canvas-apps.md)

### See also

[Get started with the SAP Procurement template](get-started.md)
