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

Pipelines aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 Customer Engagement by bringing ALM automation into the product and making it **more approachable for all makers, admins, and developers**. 

:::image type="content" source="media/deployment-pipelines.png" alt-text="Example of the deployment pipelines feature":::


Pipelines significantly reduce the effort and expertise that was required previously when adopting healthy, enterprise-grade ALM practices. Admins can now easily configure automated deployment pipelines in minutes (compared to days or weeks). Makers can deploy their solutions in a few clicks; without any prior knowledge of DevOps concepts or tools. Professional developers can run Pipelines from within the command line interface.

## Admins centrally manage and govern pipelines

Admins centrally manage all citizen-led and pro-dev-led projects at scale. Admins set up the appropriate safeguards that govern all low-code solution development within their organization. Power Platform pipelines central administration benefits include:

- Customization of maker processes with the appropriate safeguards.
- Create a pipeline once then share it with multiple groups of makers and developers. A Pipeline can be run (by those granted access) from within any environment associated with the pipeline.
- Achieve compliance, safety, monitoring, and automation goals with customizations and audit logs backed up automatically.
- **Lowers total cost of ownership** for ALM automation. Pipelines handle the complex background processing and ongoing maintenance so that you can focus your efforts on other priorities. 
- Pipelines enable you to **scale at your own pace**. Regardless of where you're at in your ALM journey, Pipelines allow you benefit from automated ALM today with minimal effort, and later you can extend your Pipelines to accomodate evolving business needs. We aim for this upward transition to be as seamless and effortless as possible. 

## Makers run pre-configured pipelines

- Once admins have pipelines in place, makers use the pre-configured pipelines to perform in-product deployments. This ensures any maker can build, share, and update apps, flows, or any other customization in a healthy and compliant manner.
- Citizen developers can participate in automated ALM processes without prior knowledge of developer focused DevOps systems or SDLC (software development lifecycle) practices. 
- Solutions are **pre-validated** against the target environment to prevent mistakes and improve success rates. For example, missing dependencies and other issues are detected before deployment and in-context of where the maker can take action.
- **Connections** and **environment variables** are provided upfront and validated before the deployment begins. This helps ensure applications and automations are deployed without manual post-processing steps, and are connected to the appropriate data sources within each environment. 

## Developers can use the same pipelines
Professional developers are now more productive given Pipelines handle the complex background ALM operations. Developers can tell the system what they want to accomplish instead handling the various underlying tasks necessary to accomplish the same goal. Using the Power Platform CLI (command line interface), developers can:

- **List Pipelines** to view details pertinent details such as which stages and environments are ready to be deployed to. 
- **Deploy** a solution with a single command. No need to connect to multiple environments, export solutions, download solutions, manually generate deployment settings files, import solutions, or handle various other tasks that were required previously. With Pipelines, developers simply provide the required parameters and the system will orchestrate all the end-to-end deployment operations.  



> [!IMPORTANT]
> - This is a preview feature. More information: [Model-driven apps and app management](/power-apps/maker/powerapps-preview-program#model-driven-apps-and-app-management)
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is being gradually rolled out across regions and might not be available yet in your region.


## Next steps

[Use Power Platform pipelines (preview)](use-pipelines.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
