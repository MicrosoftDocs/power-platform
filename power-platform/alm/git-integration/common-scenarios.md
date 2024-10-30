---
title: "Common Dataverse and Git integration scenarios"
description: "This article discusses common use cases of Microsoft Dataverse with Git, focusing on high level concepts and requirements."
author: shmcarth
ms.subservice: alm
ms.author: matp
ms.date: 10/29/2024
ms.custom: 
ms.topic: article
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
---

# Common Dataverse and Git integration scenarios (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Integrating Git with Dataverse allows you to manage your solutions and components in a source control system rather than relying solely on Dataverse environments to house your solution components during the development process. Source control, and Git in particular, is often associated with professional software development life cycles. However, source control can be used in various scenarios to manage your solutions and components in Dataverse even when no professional developers are involved. In this article, some common scenarios are discussed where Git integration can be useful in managing your solutions and components in Dataverse. All of these scenarios unlock different capabilities that can be used on their own or in combination to manage your solutions and components more effectively.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

## Viewing changes made over time to your solutions

Most components in Dataverse have a history of changes that can be viewed in Power Apps (make.powerapps.com). However, viewing all changes to a solution over time can be difficult using only the maker tools available. There's also no way to revert changes to a previous state or compare changes made by different users. By integrating Git with Dataverse, you can view granular changes made to your solutions, compare changes made by different users, and revert changes to a previous state if needed. Being able to view and search changes made to your solutions over time can help you understand how your solutions evolve and identify when and why changes were made and by whom.

## Collaborating with other team members on solutions

Collaborating with other team members on solutions in Dataverse can be difficult without a way to track changes made by different users and merge changes made by different users into a single solution. By integrating Dataverse with Git, you can collaborate with other team members on solutions by tracking changes made by different users in separate branches, merging changes made by different users into a single branch, and resolving conflicts that occur when changes are made to the same solution component by multiple users. Being able to collaborate with other team members on solutions can help you work more effectively with others and ensure that changes are tracked and deployed in a controlled manner.

## Managing different versions of your solutions

By integrating Dataverse with Git, you can create and manage different versions of your solutions by creating branches for different versions, tagging different versions of built solutions or the source code with version numbers. Being able to manage different versions of your solutions can help you employ more rigid application lifecycle management practices and also recover from issues that could arise from deploying a new version of your solution or recover a lost or broken environment to a previous state.

## Automate testing and validation of your solutions

With Git integration, you can automate testing and validation of your solutions by creating build pipelines that deploy your solutions to different environments, run tests against your solutions, and validate that your solutions meet your requirements. Being able to automate testing and validation of your solutions can help you catch errors sooner, discover security risks, and ensure that solutions meet your standards before they're deployed for use.

## Fusion development with low-code and code-first components

Being able to manage both low-code and code-first components in a single environment can help you to involve code-first developers in the solution development process and provide a seamless experience for both low-code and code-first developers.

## Advanced approval workflows for solution changes

Deployment approvals in Dataverse can be difficult without a way to track and approve changes to solutions before they're deployed to production environments. Changes inside of the zipped solution when exporting from the Power Apps aren't easily comparable with previous versions and in cases including solutions with code-first components it can be impossible to know what changed without the original source code. By integrating Dataverse with Git, you can create advanced approval workflows for solution changes by creating pull requests that require approval before changes are merged into the main branch, setting up branch policies that require code reviews before changes are merged into the main branch, and setting up build policies that require successful builds before changes are merged into the main branch. Being able to create advanced approval workflows for solution changes can help you to ensure that changes are reviewed and approved before they're deployed to production environments and that changes are tracked and deployed in a controlled manner.

## Better on their own, best together

Git integration unlocks many previously unavailable capabilities in Dataverse that can be used in various scenarios to manage your solutions and components more effectively. By using Git with Dataverse, you can view changes made over time to your solutions, work with other team members on solutions, manage different versions of your solutions, automate testing and validation of your solutions, and manage both low-code and code-first components in a single environment. All of these capabilities can be used on their own or in combination to manage your solutions and components more effectively and ensure that changes are tracked and deployed in a controlled manner.

### Related content

[Setup Git integration](connecting-to-git.md)


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
