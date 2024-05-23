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

NOTE: Any maker with the Catalog Submitter role in a given environment will be able to publish. However, after a solution has been published, a maker will need to be a part of the publishing group to re-publish that same solution again. You will see this error if you do not have access, which you can request from your admin. Admins can grant access from  

![Catalog submission access error](power-platform/developer/media/access_error_submission.png)

After clicking “Publish to Catalog”, you will access a wizard: 

1. **Step 1 (Add your solution)**
   1. Select a catalog: if you have multiple catalogs set up, you can select which catalog you would like to publish this item to
   2. Select **managed item** vs **template** for your submission: **managed items** cannot be edited by other makers, your environment shares a single copy, and that copy can be versioned with updates over time. Makers can then update their solutions with your updates. A **template** is a standalone copy that can be edited, makers can have as many copies as they want, and will not automatically update solutions in environments when new updates are published.
   3. Select a primary component: a solution may have many components in it (ex: apps, flows, tables, connectors, prompts, and more). You may want makers to open a specific component for editing after they install it (such as opening Canvas Studio for your Canvas app). Set the primary component to whichever you think is the "focus" of the solution, other, set "Unspecified", and installers will just go the solution itself.
   4. NOTE: if you are resubmitting an item, you will get an alert message notifying you about the resubmission. You will be prompted with a version field. The last digit of the version number will be automatically incremented for you. You can modify the version number if you like, but do not set the version number to a lower number from this interface. Updating the version number in the catalog submission will update the version number in the original solution as well.
       1. Resubmissions of **templates** will replace the previous item in the catalog, and will not affect any solutions already using the previous catalog item. Makers who now install your resubmission will simply get your newest version.
       2. Resubmissions of **managed items** will update the catalog item with your most recent version, and the next time makers see your catalog item in an environment where that catalog item was already installed, they will see an "update" button, which will install the most recent changes to the managed item into that environment, and then all solutions using that managed item will be updated as well.
       3. You cannot resubmit a managed item as a template, and vice versa.
2. **Step 2 (Catalog)**
   1. Title: rename the item if needed before it gets submitted to catalog. The default will be the solution name. NOTE: you cannot edit title when submitted a managed item.
   2. Description: provide details on this catalog item. Makers will read your description in the catalog gallery to find out more about it.
   3. Business justification: by default, all catalog submissions must be approved by your admin before they are added to the catalog. This field provides a justification for your submission to your admin.
   4. Works with: a flow that you're building may be intended to **work with** canvas apps and model apps, for example. Indicate here what your catalog item is intended to work with.
   5. Select business categories: select up to five business categories that describe your catalog item. Makers will use these categories to search for catalog items that are of interest to them.
   6. Publisher: select an existing publisher in this environment, or create a new publisher, to connect to this catalog submission. NOTE: a maker cannot resubmit a catalog item unless they are part of the publishing group that submitted the item the first time.
   7. Author: this is defaulted to the current user, but can be changed if needed
3. **Step 3 (Solution info)**
   1. Add your solution icon: you can attach an icon to your solution (216x216px) to help identify it in the catalog gallery
   2. Add your template images: you can attach some screenshots or other visuals that can help makers understand more details about this catalog item
   3. Help link: add the URL for any help documentation as needed
   4. Privacy policy link: add the URL for any privacy policy documentation as needed
   5. Legal terms link: add the URL for any legal terms documentation as needed
4. **Step 4 (Review + finish)**
   1. This last step provides a summary of all the info you provided. If everything looks good, click "Submit" to publish to the catalog. As previously mentioned, if your catalog requires an approver before submission can complete, you will need to wait for approval first. Please contact your admin / approver if you need the process accelerated.
  
## Acquisition

As makers browse the Discover page and find catalog items that are useful for them, they can acquire those artifacts and install a copy into their environment to start using and/or building with. Clicking on “get” on any template or managed item will open up a details popup which contains information like description, links, included components, business categories, expandable screenshots, and more.

![Catalog item tile](power-platform/developer/media/catalog_item.png)

If the details meet what the maker is looking for, they can click “get” on the details popup to start the acquisition wizard. NOTE: if the catalog item is a managed item, and has already been installed in the environment, you cannot install the managed item again, as the environment shares that managed item. If the managed item has already been installed in an environment, and an update has been published to the managed item, you will see an "update" button instead of "get", which will update the shared managed solution in the environment. If the managed item was already updated, and no new updates have been published, you will see the "update" button, but it will be disabled until a new update is published again. 

1. Step 1 (Connections): The first step checks the connections for the solution to make sure they are working for you in your environment. If there are any connection issues, you will see a red status notification, and can resolve by clicking the “...” next to the problematic connection to update it.
2. Step 2 (Environment variables): The publishing maker may decide some environment variables need to be specified before you can acquire the solution. Typically, these variables will be set to some default value. If unsure of what to fill out, check with the author of the catalog item or in the details of the catalog listing (available on the first details step).
3. Step 3 (Configuration): The next step is also determined by the publishing maker, if they want you to provide any additional info for using the solution. This may include things like, “what days of the week do you run a report?”. If no additional info needed, this step will be blank. Proceeding from here kicks off the installation process.
4. Step 4 (Summary): When you reach the final step, the summary screen, you are now waiting for the catalog item to install into your environment. Depending on the complexity, this may take from less than a minute to several minutes. When complete, you will be given several options in the dropdown, depending on what's included in the catalog item, as well as if a primary component was set by the author. Below is an example where a canvas app is the primary component of the catalog item:

![Catalog item install options](power-platform/developer/media/acquisition_options.png)

In this example, you can:

1. Edit the app, which opens the app in Canvas studio
2. Got to apps, which takes you to the app screen, if you aren't ready to edit yet
3. Go to solution, which opens the solution file

Depending on what is contained in the catalog item package, different options will appear.

After the catalog item is installed, you can find the catalog item:

1. In the unmanaged solutions list in the Solutions page if the catalog item was a **template**
2. In the managed solutions list in the Solutions page if the catalog item was a **managed item**

As previously mentioned, templates can be acquired as many times as you like, each as its own copy. The catalog will append a suffix to the unmanaged solution display name to differentiate the different copies. Managed items can be acquired only once into the managed solutions list, and all makers in the environment will share the same managed solution. This means you cannot acquire a managed item back into the same environment it was published from (the "update" button will be disabled) 


### See also

[Catalog in Power Platform (Preview)](catalog.md)<br />
[Administer the catalog (Preview)](administer-catalog.md)
