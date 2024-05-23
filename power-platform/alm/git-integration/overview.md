---
title: "Overview of Dataverse Git integration"
description: "This page discusses the integration of Dataverse with Git, focusing on high level concepts and requirements."
author: caburk
ms.subservice: alm
ms.author: matp
ms.date: 04/16/2024
ms.custom: 
ms.topic: article
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
---

# Overview of Dataverse Git integration

Git integration in Dataverse is used to create source control friendly representations of solutions and solution components in your Dataverse environment and store them in Azure DevOps. Using source control as the source of truth for your solutions allows you to track changes, collaborate with team members, and manage deployments to different environments from a central location while also providing traceability and auditability of changes. Git integration in Dataverse is intended to be used with developer environments and not in your test or production environments where deployments can be made using source control and builds to create solution artifacts. Here we look at some of the key concepts and benefits to using Git enabled source control with your Dataverse environments and solutions.

![Makers in their environments can make changes in unmanaged solutions and commit to Git before deploying with Pipelines in Power Platform](media/GitIntegrationFlow.png)

## ALM in the Power Platform and Dataverse

The Power Platform provides many out of the box capabilities that enable organizations to manage Application Lifecycle Management (ALM) for their solutions. Included are the ability to package and ship solutions as containers for the many different types of components in the platform, manage environments involved in the application lifecycle, and integrate and infuse data into their apps. There are several ways to integrate Git repositories with Power Platform that involve IT and administrators to be heavily involved in setting up and maintaining tools that are used in the process. With native integration of Git in Dataverse, the process is simplified and streamlined for makers to work with their solutions in a familiar way and interact with source control through simplified interfaces in the maker portal.

## Benefits

- Source control as source of truth: Within some organizations, the source of truth for deployments in Dataverse is the maker environments in which solutions are built. In some cases Git integration is enabled using advanced techniques and tools, which required professional IT expertise to get started with. With the native integration of Git in Dataverse source control can be enabled in only a few steps and provides a familiar interface for makers to work with their solutions.
- Safety, auditing, and compliance using SDLC best practices: Software development lifecycle (SDLC) best practices are a set of guidelines and processes that help you manage your software development projects effectively. By using Git integration in Dataverse, you can follow SDLC best practices such as version control, code reviews, and static source code analysis to ensure the quality, reliability and security of your solutions. Git integration in Dataverse also provides features such as auditing, compliance, and traceability that help you track changes to your solutions and collaborate with other team members effectively.
- Short lived dev environments: By storing a copy of your environments' customizations and configurations in source control, you can rehydrate development environments quickly and easily in Dataverse. This allows you to create short lived environments for development and testing purposes. Short-lived environments allow you to free up storage,  experiment with new features, test, and iterate on your solutions quickly and easily.
- Fusion Development teams: Fusion development teams are teams that consist of both developers and makers who work together to build solutions. By using Git integration in Dataverse, you can bring developers and makers together in a single environment and collaborate on the same codebase. Source control integration allows you to use the skills and expertise of both developers and makers to build high-quality solutions that meet the needs of your organization and meet your makers where they're comfortable working.
- Disaster recovery: Similar to the benefits of short lived dev environments, using source control as the source of truth for your solutions allows you to recover from disasters quickly and easily. By storing your solutions in source control, you can restore to a previous state if there's data loss, corruption, or other disasters.

## Key Concepts

### Unmanaged vs Managed Solutions

When you're using Git integration in Dataverse, solutions that are stored in source control come from unmanaged solutions in a maker's environment. Unmanaged solutions allow makers to add, remove, and update components that are synced with source control when you commit and push changes. Managed solutions are built from source control and deployed into downstream environments (example: test, production) and aren't editable in those environments. Managed solutions are used to ensure that the source of truth for your solutions is always source control and that changes are only made in a maker's environment before they're added to source control and deployed elsewhere.

### Build and Deploy from source control with Pipelines in Power Platform

Deployments from source control can be done using Pipelines in Power Platform. There are two methods for building managed solution artifacts that are deployed via pipelines when using Dataverse Git integration:

- Pipelines build process: The pipelines build process is a service in Dataverse that builds a solution artifact from the source control repository that is bound to your environment. In this scenario, there's no special processing of the solution source control at build time. The files in source control are built by repacking them into a managed solution file that can be deployed to a downstream environment and the artifact generated is passed to pipelines to perform the deployment.
- Development tooling build process: By using development tooling support for your build process, you are in control of more aspects of the build process. Build tools like Power Platform CLI and Azure DevOps Build Tools or GitHub Actions allow you to build other code-first components like Dataverse plugins and PCF controls as part of the build process and include them in the solution artifact that is deployed to a downstream environment. This method also allows you to insert your own processes and extensions into the build process that aren't otherwise available in the Pipelines build process.

### Fusion Development Teams

With the native integration of Git in Dataverse, developers and makers can work together in a single environment to build solutions. Developers can work on the codebase in source control and makers can work on the solution components in the maker environment. During the build and deployment process, all changes included in source control are packaged and other code-first components like plugins and PCF controls can be built using the development tooling build process. Building from source control ensures that code quality and testing standards are met before deploying to downstream environments and that changes to code-first source code isn't lost when deploying solutions. It also allows for approval processes like pull requests in Git to be employed as the mechanism for code reviews and approvals before deploying to downstream environments.

### Branching and Isolation

Branching and merging are common practices in Git that allow you to work on different versions of your codebase simultaneously. Branching is the process of creating a new copy of your source code from an existing copy, and merging is the process of combining changes from one copy into another. In Dataverse, you can use branching and merging to manage different versions of your solutions and collaborate with other team members and the codebase. Branching can be used to isolate changes to a specific feature or bug fix and merging can be used to combine changes from different branches into a single branch. Branching, and well defined branching strategies, allow you to work on multiple features or bug fixes simultaneously and merge them together when they're ready to be deployed. For more information on standard and supported branching models, see [Branching and merging in Dataverse Git integration](/power-platform/alm/git-integration/branching-and-merging).

### Import and initialize environments from source control

With the concept of source control as the source of truth, maker environments no longer need to be long-lived to ensure that you have a copy of your unmanaged solutions. Instead, you can import and initialize environments from source control to rehydrate your development environments with the latest changes from source control. Recreating environments from source control allows you to create short-lived environments for development and testing purposes and ensures that you always have an up-to-date copy of your solutions in your development environments.

### File formatting for solution components

With the introduction of Git integration in Dataverse, there are changes to the way that solutions and solution components are represented in source control. When you commit and push changes to source control, the solution components are stored in a specific format that is compatible with Git. This format is used to represent the solution components in a way that is easy to read and understand and can be used to track changes to the solution components over time. The file format for solution components is designed to be human-readable and can be used to view changes to the solution components in source control. Additionally, to allow for multiple solutions to be stored in the same repository/folder, the solution components in source control are no longer duplicated for each solution. Instead, the solution components are stored in a single location and can be shared across multiple solutions in the same repository/folder.

### Related content

[Common Dataverse Git integration Scenarios](/power-platform/alm/git-integration/common-scenarios)  
[Getting started with Git integration](/power-platform/alm/git-integration/connecting-to-git)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
