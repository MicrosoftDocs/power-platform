---
title: "Submit and acquire catalog items (preview)"
description: "Learn how to submit and acquire items from your organization's catalog."
author: derekk
ms.subservice: developer
ms.author: derekk
ms.date: 05/15/2024
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# View, submit, and install catalog items (preview)

> [!IMPORTANT]
>
> - [!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - While not required for preview, when this feature is generally available, it'll require the use of Managed Environment capabilities. More information: [Managed Environments overview](../admin/managed-environment-overview.md)

See here for a [catalog introduction](power-platform/developer/catalog.md)
See here for how admins need to [set up and configure the catalog](power-platform/developer/administer-catalog.md)

## Access controls 

The Catalog has a separate set of access controls from Power Platform. This means makers in a given environment do not automatically get permissions to publish and acquire items from the Catalog. There are four access roles: 

1. Catalog Submitter: Users with this role can submit items to the catalog. 
2. Catalog Read-Only Member: Users with this role can discover and install items from the catalog 
3. Catalog Approver: Users with this role can approve submissions to the catalog. Catalog approvers can be users from your central IT department or Line of Business that your organization wants to empower to participate in the approvals process. 
4. Catalog Administrator: Users with this role can administer the catalog. 

Any environment that has a Catalog will see these roles inside of Power Platform Admin Center, and can be [assigned to groups or individuals](https://learn.microsoft.com/en-us/power-platform/admin/security-roles-privileges) just like any other roles. 

Power Platform admins and system customizers will already have full access to the Catalog. However, **do not** use assign these roles for generally managing Catalog access, and instead use one of the roles from above. 

## Submission 

[Unmanaged solutions](https://learn.microsoft.com/en-us/power-platform/alm/solution-concepts-alm?source=recommendations#managed-and-unmanaged-solutions) in your environment can be published to the Catalog. This means in your normal course of creating solutions, you may decide that what you’re building would be useful as a re-usable artifact for yourself or others in your org. 

Navigate to your solutions page, and any unmanaged solution will have a new option for “Publish to Catalog” in the three vertical dots next to the solution display name. This option will be disabled for anyone without the Catalog Submitter role. 

![Catalog submission](power-platform/developer/media/catalog_submission.png)

Note: this option will be disabled for managed solutions, as you cannot submit managed solutions into the catalog. Coming soon will be the capability to publish catalog items via pipelines. This will be the recommended method to follow proper ALM. 

Similarly, you will not be able to submit an app, flow, or other component directly into the catalog. You must first ensure it exists in an unmanaged solution. You can do this by clicking “New solution” on top of the solutions screen (or choosing an existing one from the list), and then clicking “Add existing” in the top menu in the solution itself, and adding your desired component (such as an app or a flow): 

![Add to solution](power-platform/developer/media/add_to_solution.png)




### See also

[Catalog in Power Platform (Preview)](catalog.md)<br />
[Administer the catalog (Preview)](administer-catalog.md)
