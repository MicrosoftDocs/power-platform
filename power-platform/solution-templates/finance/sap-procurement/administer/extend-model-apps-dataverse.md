---
title: Use the SAP Solution Administrator model-driven app
description: Learn how to use Microsoft's SAP Solution Administrator model-driven app to configure SAP data in your apps and flows and monitor the solutions you deploy.
author: tverhasselt
ms.author: thoverh
contributors:
  - EllenWehrle
  - robinsonshields
  - microsoft-george
  - jongilman88
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Use the SAP Solution Administrator model-driven app

Learn about the _SAP Solution Administrator_ model-driven app and how you can use it in conjunction with Dataverse to seed relevant SAP data into your solutions' apps and flows as well as monitor the solutions you deploy.

Model-driven apps allow you to quickly build apps from your data stored in Dataverse using forms, views, and relationships that connect seamlessly to your tables. The _SAP Solution Administrator_ is designed for the admin experience and is a model-driven app. Just like canvas apps, the model-driven app and underlying Dataverse tables can be extended to support additional admin requirements with minimal effort.

Dataverse provides a great repository for data that's not currently sourced from a system of record. Dataverse also provides the ability to rapidly build experiences on that stored data.

## SAP Solution Administrator

_SAP Solution Administrator_ is a model-driven app that allows the admin to configure seed data to power the end user's canvas app experiences, as well as monitor solution errors. Through this app, an admin can directly search, view, create, update, delete, and deactivate data stored in Dataverse. This model-driven app can be extended to add new _Groups_, _Subareas_, and _Pages_ and many other customizations.

:::image type="content" source="media/extend-model-apps-dataverse/sap-admin-app.png" alt-text="Monitor errors in the procurement solutions":::

More information: [What are model-driven apps in Power Apps](/power-apps/maker/model-driven-apps/model-driven-app-overview), [Understand model-driven app components](/power-apps/maker/model-driven-apps/model-driven-app-components)

## Dataverse tables

All SAP transactional data is sourced from your SAP system and not stored in Power Platform solutions. However, SAP seed data is required to be administered and monitored in order to maintain the most efficient canvas apps and cloud flows. The following is a list of Dataverse entities that also have corresponding forms and views you can use in the _SAP Solution Administrator_ model-driven app. These tables can be further extended to support your local business requirements.

| Table | Description |
| ----- | ----------- |
| SAP Solution Administrator Menu Item | Stores the list of menu items seen and used in the SAP process Power Apps. |
| SAP Solution Administrator List of Value | Provides description of what the list of value represents. |
| SAP Solution Administrator Localization | Stores a list of localized strings that can be displayed according to the user's locale in the SAP process Power Apps.  |
| SAP Solution Administrator Errors | Captures unexpected exceptions within any of the canvas apps or cloud flows. |
| SAP Solution Administrator Search History | Stores all search history for a user within any one of the canvas Power Apps across the various SAP objects and has a view that defaults the return results to 14 days of search history. |
| Team | Only the Team Default LookUp view was included in the solution as it was changed to support looking up Azure Active Directory Security Group type teams. |

More information: [What is Microsoft Dataverse](/power-apps/maker/data-platform/data-platform-intro)

## Next steps

[Extend cloud flows](extend-cloud-flows.md)

## See also

[Get started with the SAP Procurement template](get-started.md)
