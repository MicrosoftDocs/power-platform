---
title: "General recommendations for healthy model-driven app form ALM with Power Apps"
description: "Learn about the recommendations for healthy model-driven app form ALM."
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 06/25/2021
ms.reviewer: ""
ms.service: power-platform
ms.topic: "conceptual"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
---
# Recommendations for healthy model-driven app form ALM
Follow these recommendations when you customize forms:
- To create a new form, don't make manual edits to the FormXml in the customizations.xml. Instead, use the form designer to create a new form or copy an existing form by doing a **Save as**. The form designer ensures that new forms have unique ids, which avoids conflicts with existing forms. More information: [Create, edit, or configure forms using the form designer](/powerapps/maker/model-driven-apps/create-and-edit-forms).
- Don't import the same localized labels when there are existing translated labels that have translation text you want to keep. This reduces dependencies and improves solution import performance.
- If your solution publisher is the owner of a form, only the base solution in your solution package should be a full FormXml. Similarly, a solution upgrade or patch for this base solution can be full FormXml. Any other managed solution you package for this form other than the base should not be a full FormXml, but should be diff FormXml. More information: [Full and differential form XML](form-alm.md#full-and-differential-form-xml)
- Forms use a merge approach when you import an update to a form. Therefore, using the **Overwrite customization** option during import doesn't have any affect on forms. We recommend that you keep this in mind when you update forms. If you want to overwrite customizations in the target environment, remove the active customizations in the unmanaged layer and then import the solution update. More information: [Merge form customizations](/power-platform/alm/how-managed-solutions-merged#merge-form-customizations) and [Remove an unmanaged layer](/powerapps/maker/data-platform/solution-layers#remove-an-unmanaged-layer)
- Don't use unmanaged solutions in your production instances. More information: [Scenario 3: Moving from unmanaged to managed solutions in your organization](move-from-unmanaged-managed-alm.md)

### See also
[Maintaining healthy model-driven app form ALM](form-alm.md)


