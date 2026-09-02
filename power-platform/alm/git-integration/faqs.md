---
title: "FAQs about source code integration"
description: "This article includes answers to commonly asked questions about Git integration with Microsoft Dataverse."
author: caburk
ms.subservice: alm
ms.author: caburk
ms.date: 08/18/2026
ms.custom: 
ms.topic: faq
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
- suskumar-MSFT
---

# FAQs about source code integration

This article includes answers to commonly asked questions about Git integration with Microsoft Dataverse.

## What is source code integration in Power Platform?

Git integration provides an easier way of syncing Power Platform customizatinos (solutions and their objects) with a Git repository. The solutions and their objects are stored in human readable formats in the repository, which allows you to easily search, track changes, and manage your solutions in a source control system.

## What's the difference between Git integration and pre-existing Developer tools?

Git integration is built into Power Platform and is more performant, democratized for makers and admins, has more robust safeguards, and uses an optimized file format.
Developer tools currently provide more flexibility for code-first developers.

## What are the prerequisites for using Git integration?

You need a Power Platform environment with the necessary permissions to connect to a supported Git provider. You need a system administrator role in the Dataverse environment to bind to Git. You also need provider-specific permissions. For Azure DevOps, users who interact with source control need an Azure DevOps subscription, **Basic** access level, and access to contribute to the project and repository. For GitHub, you need access to the target repository and the ability to install or approve the GitHub App. You must enable development and target environments as managed environments.


Development and target environments must be enabled as managed environments.

## What other Git providers are supported?

Azure DevOps and GitHub repositories are supported.

## What licenses do I need to use Git integration with Dataverse?

All users within the environment must meet license requirements for [managed environments](../../admin/managed-environment-overview.md). Managed environments are required regardless of environment type.

Developers who use source code integration also need access to the connected repository. For Azure DevOps licensing information, see [Azure DevOps Services pricing details](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/). For GitHub, use your organization's GitHub licensing and repository access model.

## Can developers collaborate on a solution while working in different development environments?

Yes. Import the solution to each additional environment and then connect to the same Git location. For more information, go to [Connect multiple development environments to Git](connecting-to-git.md)

## Why am I getting the error "Source Control Integration is not enabled for this environment?"

This error occurs when your environment is encrypted using Bring Your Own Key (BYOK), which has been deprecated.

To enable source control integration, follow these steps:

1. [Manage your customer-managed encryption key](../../admin/customer-managed-key.md).
1. [Reconnect](connecting-to-git.md) to source control and retry the operation.

If your environment isn't encrypted with BYOK and you receive this error, contact [Microsoft Support](/power-platform/admin/get-help-support) for assistance.

## Why am I getting the message "Failed to retrieve the default branch for the selected repository. Choose a default branch to allow creating new branches?"

Ensure that your Git repository is initialized and has a default branch. New Azure DevOps projects and repositories are uninitialized by default, and you must manually initialize the repository to create the default branch.

## Do I integrate my dev, test, and prod environments with source code and use branch merging to push configuration to another environment?

This feature is designed to only have your unmanaged solutions in development environments connected to Git. Deployment to upstream environments requires exporting the managed solution from a development environment, building the solution from source control with the [Power Platform CLI](../../developer/cli/introduction.md) [`pack`](../../developer/cli/reference/solution.md#pac-solution-pack) command, or using pipelines in Power Platform.

## How do I work with branches?

This feature works with a single branch that you specify when you bind the environment or solutions to your repository. You can disconnect and reconnect to different branches and use your Git provider for pull requests (PRs), merging, and other advanced Git operations.

For example, you can connect your development to a developer branch, PR the changes into a feature branch, then disconnect your solution and reconnect to the feature branch to pull the latest changes into an environment.

## Why isn't there unmanaged and managed solution representation for different objects in Git?

Before this feature became available, it was common to store managed and unmanaged solution versions in Git. That's no longer needed. Git should only include your source code and unmanaged customizations. Managed versus unmanaged is determined when building and releasing the solution.

## Why are my source code files in YAML yet the solution export is still primarily XML?

The feature uses YAML to represent solution content because it's easier to read, understand, and facilitates easier merges.

## What folder structure does the YAML source control format use?

When solutions are committed using Dataverse Git integration, or extracted using `pac solution clone`, they're stored in a specific folder layout under the repository root:

- `solutions/<SolutionUniqueName>/` — contains `solution.yml` and supporting manifest files (`solutioncomponents.yml`, `rootcomponents.yml`, `missingdependencies.yml`)
- `publishers/<PublisherUniqueName>/` — contains `publisher.yml`
- Component folders (`entities/`, `workflows/`, `canvasapps/`, and so on) at the repository root

This structure is required when you manually pack the folder back into a `.zip` file using SolutionPackager or `pac solution pack`. Placing the YAML files at the repository root instead of under `solutions/<name>/` causes a misleading error about a missing `Customizations.xml`. For a complete reference, see [Solution YAML source control format](../solution-source-control-yaml-format.md).

## How can I build and deploy a solution from source code?

Microsoft tools can now build the YAML solution format. Use the [Power Platform CLI](../../developer/cli/introduction.md) [`pack`](../../developer/cli/reference/solution.md#pac-solution-pack) command. The [`unpack`](../../developer/cli/reference/solution.md#pac-solution-unpack), [`clone`](../../developer/cli/reference/solution.md#pac-solution-clone), and [`sync`](../../developer/cli/reference/solution.md#pac-solution-sync) commands don't currently support YAML format.

## How do I develop with code-first objects where I don't want my compiled binaries checked into source code?

Currently, you can still author different objects, such as Power Apps component framework controls and plug-ins, using a different solution and Git folder.

## How do I resolve conflicts?

Simple conflicts can be resolved on the solution's source control page by selecting which version to keep (environment versus Git).

Merge conflicts detected when merging branches is currently managed within Git.

## Can I commit specific changes instead of all changes for a solution?

Currently, you need to commit all pending object changes within a solution. However, you can remove objects from your solution (not delete from the environment) if you don't want to commit them. Add the objects back later when you're ready to commit them.

## Can I use an API to bind to Git and trigger commits and pulls?

Yes. Go to the [Web API reference](/power-apps/developer/data-platform/webapi/reference/about) for developer documentation about connecting to Git, `CommitToGit`, `RefreshChangesFromGit`, and `PullChangesFromGit`.

## Can I now make changes directly in source control in a supported manner?

Support for direct modifications to solution customizations isn't changing with this feature. Our recommendation is to continue the practice of making your changes directly in the environment, then committing those changes to source control. Changes to localized labels are permitted directly in source. Code-first objects that are supported using our developer tools are also supported, and include plug-ins, PCF controls, and web resources.

## Can Git integration be disabled?

There is no tenant or environment level setting to prevent connecting to Git. However, access to Git can be managed within the Git repository. You can also disconnect environments within the Git connection panel.

## Can I commit large solutions?

Yes. You can commit large solutions by using Git integration. File limits depend on the connected Git provider. Azure DevOps enforces a 17-MB limit per individual file during a commit operation.

Most solutions consist of many files. Some individual files, such as Canvas app artifacts, plug-in assemblies, or other binary-heavy components, might approach or exceed this limit. Although Azure DevOps supports files up to 25 MB, files are base64-encoded during the commit process, which effectively reduces the supported size to approximately 17 MB.

To handle large solutions, the system automatically:

- Splits the solution into multiple smaller file batches
- Commits each batch separately
- Squash‑merges the commits so the Git history remains clean

If a single file within a solution exceeds the provider limit, the commit may still fail. This is most commonly seen with large Canvas apps, large plug-in assemblies, PCF control bundles, or other binary-heavy components.

If you encounter commit failures due to file size, consider reducing the size of the affected component by removing unused resources or splitting large Canvas apps into smaller components or libraries.

## Are all object types supported?

Currently, some low-usage legacy object types are unsupported. You receive an error in the solution objects view when unsupported object types are detected.

## How can I upgrade existing solutions?

You can connect existing solutions in an environment to Git and commit them. If the solution is only in Git, first use developer tools to pack and import the unmanaged solution into a new development environment. We recommend a new source code location to avoid disruptive changes between old and new file formats. For more information about packing a YAML source-controlled solution, see [SolutionPackager tool](../solution-packager-tool.md#source-control-file-formats).

## Can I use Git integration to audit metadata changes? Even for citizen developers?

Yes, this is common. Dataverse API's can also be used to commit changes automatically.

## Is Git integration available in sovereign clouds?

Yes.

## Can I automatically deploy changes pushed to Git?

Yes, you can trigger an automated build and release with Azure Pipelines or GitHub Actions. The [Power Platform CLI](/power-platform/developer/cli/introduction) [`pack`](/power-platform/developer/cli/reference/solution#pac-solution-pack) command builds the solution artifact that's imported to other environments. Alternatively, you can use pipelines in Power Platform or the Power Platform CLI pac pipeline command to deploy.

## Can I connect environments located in a different geography than the Azure DevOps repository?

For Azure DevOps, consent is needed when the environment is in a different geography than the repository. A message and consent are shown when connecting.

## Does Git integration support cross-tenant workloads?

Not currently.

## Does Git integration support security scanning?

You can integrate your scanning tool of choice into your Git provider tooling.

### Related content

[Overview of Dataverse Git integration](overview.md)

[Connect Dataverse Git integration to a Git provider](connecting-to-git.md)

[Connect Dataverse Git integration to Azure DevOps](connecting-to-azure-devops.md)

[Connect Dataverse Git integration to GitHub](connecting-to-github.md)

[Source control repository operations](source-control-operations.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
