---
title: "Move from unmanaged to managed solution ALM with Power Apps | Microsoft Docs"
description: "Learn how to move from unmanaged to managed solutions to support ALM with Power Apps"
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: ""
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---
# Scenario 3: Moving from unmanaged to managed solutions in your organization
This scenario aims at a situation where your production environment
contains several unmanaged solutions or your customizations were done in the default solution.

With the exception of your development environment, the end result is to only have managed solutions in your environments. More information: [Managed and unmanaged solutions](solution-concepts-alm.md#managed-and-unmanaged-solutions).

You can take either of the approaches described here.

## First approach

For smaller, less complex projects, you can consolidate all your unmanaged solutions into a single unmanaged solution. Then, export the unmanaged solution as managed to import into your test and production environments. 

<!-- Need more steps -->

## Second approach
Larger, more complex projects require these tasks:<!--This would be better as a numbered list, so the substeps and commentary can be clearly distinguished. -->
-   Plan carefully, especially when the outcome you want is to use solution layering properly.

-   Identify the base or common component layer. This solution will provide the
    foundation for modular solution development.
-   Copy your dev environment to the sandbox environment.
    -   Isolate the components of the base solution by removing all components
        that won't be members from the active layer<!--Edit okay? -->.

    -   After you complete this step, this environment can be used for isolated development of
        the base solutions.

        Plug-ins can reside in separate solutions, because the assemblies
            themselves don't generate dependencies.<!--Do you want this to be indented extra? You wouldn't want it to be a single, stray bullet. -->

-   Repeat the process<!--Should this say "the following process"? If this were a numbered list, you could identify which steps you mean.--> for any modular solutions that extend the common
    components layer.

    -   Create a copy of the original development environment, and remove the
        unmanaged solutions that hold references to the common components.

    -   Next, import a copy of a managed solution exported from the isolated
        base solution development environment to convert the unmanaged common
        components to managed. Doing so prevents the creation of cyclical dependencies and prevents solutions from becoming bloated with duplicate references to components.

    -   Considerations when importing a managed solution to convert unmanaged
        components to managed: 

        -   If components are held in unmanaged solutions that still exist in the
            environment, all references will have to be removed before<!--Edit okay?--> the managed
            solution can be imported.

        -   Removing unmanaged solutions causes the loss of the reference
            container. Without a good understanding of what has been
            customized, you risk that components become orphaned in the default solution and possibly become hard to track.

    -   Converting solutions to managed in a development environment that's
        completely unmanaged effectively creates a snapshot of the current
        behavior. To prune unnecessary components that were added when multiple
        unmanaged solutions were developed in one environment<!--Edit okay? The agent of action got fuzzy here.-->, you need to remove the
        unneeded components in an isolated development environment.

        For example, assume the Customer entity is created in an unmanaged
            solution named *base*, then extended in another unmanaged solution.
            Any new components added to the Customer entity in the extension
            solution are automatically added to the *base* solution. This is the expected outcome, because when an entity is created the behavior is to include all assets and entity metadata.

## Limitations 
-   In the second approach, it can be very time-consuming to remove components
    to isolate the base solution or modular solutions. It can be a challenge to determine where dependencies reside and how best to remove them.<!--Suggested.-->

-   It's difficult to migrate to a managed solution and
    develop a final solution architecture at the same time. Consider breaking the migration into phases such as moving to managed solutions, then establishing a new solution architecture. Isolated development is needed first to effectively create layered solutions.

###  See also
[Scenario 4: Supporting team development](team-development-alm.md)
