---
title: "Overview of Power Platform pipelines (preview)"
description: "Overview of Power Platform pipelines."
author: caburk
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 11/02/2022
ms.reviewer: "matp"
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Overview of Power Platform pipelines (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The most common form of ALM in Power Platform today involves either manual solution export and import or using pro-developer tools, such as Azure DevOps and GitHub. It's an either/or decision where things don't easily work together making it difficult to transition from manual to automated deployments.

With Power Platform pipelines, makers can easily use pre-configured pipelines to perform in-product deployments, and pro-code developers can manage CI/CD of apps, flows, and bots with the tools of their choice. Pipelines can integrate with the existing pro dev tool set for CI/CD (including Azure DevOps and GitHub), and be managed as part of the organization’s existing DevOps processes.

> [!IMPORTANT]
> - This is a preview feature. More information: [Model-driven apps and app management](/power-apps/maker/powerapps-preview-program#model-driven-apps-and-app-management)
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Admins centrally manage and govern pipelines

Admins centrally manage all citizen-led and pro-dev-led projects at scale. Admins set up the appropriate safeguards that govern all low-code solution development within their organization. These safeguards not only govern the citizen developer’s initial exploration and eventual solution development, but also provide a path for how and when no-code authored solutions can join in the organization’s more managed ALM process. Benefits include:

- Customization of maker processes with the appropriate safeguards.
- Automate, review, and approve maker requests (if necessary).
- Achieve compliance, safety, monitoring, and automation goals by having customizations backed by their source control and build automation systems.

## Makers run pre-configured pipelines

Once admins have pipelines in place, makers use the pre-configured pipelines to perform in-product deployments. This ensures any maker can build, share, and update apps, flows, and bots without compromising no-code development with no admin or pro-dev involvement.

## Next steps

[Power Platform pipelines (preview)](admins-makers.md#power-platform-pipelines-preview)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
