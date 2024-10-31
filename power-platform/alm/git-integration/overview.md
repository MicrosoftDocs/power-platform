---
title: "Overview of Dataverse Git integration"
description: "This page discusses the integration of Dataverse with Git, focusing on high level concepts and requirements."
author: shmcarth
ms.subservice: alm
ms.author: matp
ms.date: 10/29/2024
ms.custom: 
ms.topic: article
ms.reviewer: matp
ms.collection: 
ms.contributors:
- mikefactorial
---

# Overview of Dataverse Git integration (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Git integration in Microsoft Dataverse is used to create source control friendly representations of solutions and solution components in your Dataverse environment and store them in Azure DevOps. Using source control as the source of truth for your solutions allows you to track changes, collaborate with team members, and manage deployments to different environments from a central location while also providing traceability and auditability of changes. Git integration in Dataverse is intended to be used with developer environments and not in your test or production environments where deployments can be made using builds to create solution artifacts and pipelines to deploy. Git is an open-source distributed version control system (DVCS) that tracks changes to computer files, especially source code in software development.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]
> - This feature is being gradually rolled out across regions and might not be available in your region yet.

In this article, you find some of the key concepts and benefits to using Git enabled source control with your Dataverse environments and solutions.

:::image type="content" source="media/GitIntegrationFlow.png" alt-text="Makers in their environments can make changes to unmanaged solution and commit to Git before deploying with pipelines" lightbox="media/GitIntegrationFlow.png":::

## ALM in the Power Platform and Dataverse

Power Platform provides many out of the box capabilities that enable organizations to manage application lifecycle management (ALM) for their solutions. Included are the ability to package solutions as containers for the many different types of components in the platform, manage environments involved in the application lifecycle, and deploy solutions using [pipelines in Power Platform](../pipelines.md). There are also several ways to integrate Git repositories with Power Platform using developer tooling. With native integration of Git in Dataverse, the process is simplified and streamlined for makers to work with their solutions in a familiar way and interact with source control through simplified interfaces in the maker portal.

## Benefits

- Source control as source of truth: Within some organizations, the source of truth for deployments in Dataverse is the maker environments in which solutions are built. The primary driver for this behavior is the non-native Git integration uses advanced techniques and tools, which require professional IT expertise to get started. With the native integration of Git in Dataverse, source control can be enabled in only a few steps and provides a familiar interface for makers to work with their solutions.
- Safety, auditing, and compliance using SDLC best practices: Software development lifecycle (SDLC) best practices are a set of guidelines and processes that help you manage your software development projects effectively. By using Git integration in Dataverse, you can follow SDLC practices such as version control, code reviews, and static source code analysis to ensure the quality, reliability, and security of your solutions. Git integration in Dataverse also provides features such as auditing, compliance, and traceability that help you track changes to your solutions and collaborate with other team members effectively.
- Short lived dev environments: By storing a copy of your environments' customizations and configurations in source control, you can rehydrate development environments from source control quickly and easily in Dataverse. This allows you to create short lived environments for development and testing purposes. Short-lived environments allow you to free up storage, experiment with new features, test, and iterate on your solutions without relying on permanent environments.
- Fusion development teams: Fusion development teams are teams that consist of both developers and makers who work together to build solutions. By using Git integration in Dataverse, you can bring developers and makers together in a single environment and collaborate on the same codebase. Source control integration allows you to use the skills and expertise of both developers and makers to build high-quality solutions that meet the needs of your organization and join together your makers where they're comfortable working.
- Disaster recovery: Similar to the benefits of short lived dev environments, using source control as the source of truth for your solutions allows you to recover from disasters quickly and easily. Dataverse environment backups are more time consuming, and as a result more infrequent, than committing changes to source control. By storing your solutions in source control, you can restore to a previous state if there's data loss, corruption, or other disaster.

## Key concepts

### Unmanaged versus managed solutions

When you're using Git integration in Dataverse, solutions stored in source control come from unmanaged solutions in a maker's environment. Unmanaged solutions allow makers to add, remove, and update components that are synced with source control when you commit and push changes. Managed solutions are built from source control and deployed into downstream environments, such as test or production, and aren't editable in those environments. Managed solutions are used to ensure that the source of truth for your solutions is always source control and that changes are only made in a maker's environment before they're added to source control and deployed elsewhere.

### File formatting for solution components

With the introduction of Git integration in Dataverse, there are changes to the way that solutions and solution components are represented in source control. When you commit and push changes to source control, the solution components are stored in a specific format that is compatible with Git. This format is used to represent the solution components in a way that is easy to read and understand and can be used to track changes to the solution components over time. The file format for solution components is designed to be human-readable and can be used to view changes to the solution components in source control. Additionally, to allow for multiple solutions to be stored in the same repository and folder, the solution components in source control are no longer duplicated for each solution. Instead, the solution components are stored in a single location and can be shared across multiple solutions in the same repository and folder.

## Code-first development with Git

Code-first development in the Power Platform is enabled using development tooling like the Power Platform CLI, Visual Studio, and Visual Studio Code extensions. Involving code-first developers in the solution development process is difficult without source control integration as components like PCF controls and Dataverse plug-ins are deployed to solutions as packaged assets built from source code and not directly editable in the Power Apps (make.powerapps.com). Without source control as a part of the development process for both low-code and code-first components, it's difficult to manage changes to the solution and ensure that changes are tracked and deployed in a controlled manner.

By enabling Git integration in Dataverse, you can meet code-first developers where they work and provide a seamless experience for both low-code and code-first developers. However, there are some considerations to keep in mind when managing code-first components in a low-code environment.

### Fusion development with Dataverse Git integration

Power Platform provides capabilities for both low-code and code-first development. This article discusses code-first development processes associated with Dataverse and Git integration and provides guidance about how to manage code-first and low-code components in a single environment. Components like PCF controls, Dataverse plug-ins, and custom workflow activities that are examples of code-first components that can be managed in source control.

### Code-first and low-code components in a single environment

Code-first components can be included in solutions through a build process that generates a managed or unmanaged solution that can be imported into a Dataverse environment. However, code first components can also be deployed directly into an unmanaged solution in a maker environment once they're built without employing the solution build process to deploy them. There's the build process to consider given this flexibility.

If you're deploying code-first components directly to an unmanaged solution in a maker environment, when those components are committed to source control, only their compiled (built) version is stored in source control. For example, the binary DLL if a plugin or the transpiled and optimized bundle.js for a PCF control. As a result, you end up with two copies of the component in source control. One represented by the built version and the other represented by the source code. Storing binaries in your repository can lead to confusion and potential conflicts if the source code and the built version aren't kept in sync. This practice isn't recommended because the source code should be the single source of truth for the component and only a single copy should be stored.

The recommended approach is to build code-first components as part of a solution build process and import the generated unmanaged solution into the maker environment. This approach ensures that the source code and the built version are kept in sync and that the source code is the single source of truth for the component. However, this approach requires that you have a build process in place to generate the managed or unmanaged solution for use in the import process and deployment process. You can create Azure Pipelines or GitHub workflows, for instance, that create artifacts for pipelines in Power Platform and for the Git sync processes to consume.

## Next steps

[Common Dataverse and Git integration scenarios](/power-platform/alm/git-integration/common-scenarios)  

### See also

[Getting started with Git integration](/power-platform/alm/git-integration/connecting-to-git)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
