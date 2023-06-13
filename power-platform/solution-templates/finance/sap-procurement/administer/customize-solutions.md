---
title: Customize your solutions
description: Prepare your development environment so you're ready to customize the SAP procurement solution templates to meet your local business requirements.
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
ms.topic: install-set-up-deploy
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Customize your SAP procurement solution templates

The SAP procurement solution template is published as managed so that we can continue to provide new and updated capabilities. This means you will not be able to directly edit components _directly within_ the actual imported solution files. However, your local configurations will be _layered_ on top of the managed capabilities.

As best practice, create a new _unmanaged_ solution in the same development environment where the imported SAP Procurement managed template solutions reside. Here, you can add the components that support the process and capabilities that you plan to deploy. Once you have added the necessary components to your new unmanaged solution, you can begin to customize to meet your additional requirements.

## Work with an unmanaged solution

1. [Install](install.md) the SAP Procurement managed solutions into your development sandbox environment.
1. Create a new _unmanaged_ solution.
1. Add one or more _components_, such as a canvas app or cloud flow from the SAP Procurement solution template into your newly created unmanaged solution.
1. As you begin to extend the components, _solution layers_ will be created against those components, which you can see underneath _Advanced_ > _See solution layers_ when selecting a solution component.

> [!IMPORTANT]
> Keep these points in mind when working with solution layers:
>
> - Avoid getting your local customizations overwritten if you choose to upgrade the SAP Procurement solution templates.
> - Reserve upgrades for consuming only new or un-customized components. Prohibit getting upgrades on existing components that you have already customized.

More information:

- [Solution concepts](/power-platform/alm/solution-concepts-alm)
- [Solution layers](/power-platform/alm/solution-layers-alm)

## Next steps

- [Extend canvas apps](extend-canvas-apps.md)
- [Extend model-driven apps and Dataverse](extend-model-apps-dataverse.md)
- [Extend cloud flows](extend-cloud-flows.md)

### See also

- [Overview](../overview.md)
- [Get started](get-started.md)
