---
title: Customize the SAP Procurement solutions
description: Learn how to customize the SAP Procurement template's solutions to meet your local business requirements.
author: tverhasselt
ms.author: thoverh
contributors:
  - galitskyd
  - microsoft-dustin
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 05/19/2026
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Customize the SAP Procurement solutions

The SAP Procurement template's solutions are published as managed so that Microsoft can continue to provide new and updated capabilities. This publishing method means you can't edit components _directly within_ the actual imported solution files. Instead, you _layer_ your local configurations on top of the managed capabilities.

As a best practice, create a new _unmanaged_ solution in the same development environment where the imported SAP Procurement template's managed solutions reside. Add the components that support the process and capabilities you plan to deploy. After you add the necessary components to your new unmanaged solution, you can customize it to meet your additional requirements.

> [!IMPORTANT]
>
> - Avoid getting your local customizations overwritten if you choose to upgrade the SAP Procurement solution templates.
> - Reserve upgrades for consuming only new or uncustomized components. Prohibit getting upgrades on existing components that you already customized.

## Get started working with solutions

1. [Install](install.md) the SAP Procurement managed solutions into your development sandbox environment.
1. [Create a new _unmanaged_ solution](/power-apps/maker/data-platform/create-solution).
1. Select **Add existing** to add one or more _components_, such as a canvas app or cloud flow from the SAP Procurement solution template into your newly created unmanaged solution.
1. As you begin to extend the components, you _create solution layers_ against those components. You can see these layers under **Advanced** > **See solution layers** when selecting a solution component.

## Related content

- [Solution concepts](/power-platform/alm/solution-concepts-alm)
- [Solution layers](/power-platform/alm/solution-layers-alm)
- [Use a solution to customize](/power-platform/alm/use-solutions-for-your-customizations)
- [Overview of tools and apps used for ALM](/power-platform/alm/tools-apps-used-alm)

### Next step

[Extend canvas apps](extend-canvas-apps.md)

### See also

[Get started with the SAP Procurement template](get-started.md)
