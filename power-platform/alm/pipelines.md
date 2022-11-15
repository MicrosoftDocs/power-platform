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

Pipelines aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 customers by bringing ALM automation and CI/CD capabilities into the product in a manner that's **much more approachable for all makers, admins, and developers**. 

:::image type="content" source="media/deployment-pipelines.png" alt-text="Example of the deployment pipelines feature":::


Pipelines significantly **reduce** the **effort** and **domain knowledge** previously required to **realize the ROI** (return on investment) from adopting healthy, enterprise-grade, automated ALM processes within your team or throughout your entire company. Pipelines simplify ALM for everyone:
1. **Admins** can now easily configure automated deployment pipelines in minutes (compared to days or weeks). 
2. **Makers** have an intuitive user experience for deploying their solutions with just a few clicks. 
3. **Professional developers** can (optionally) run Pipelines using their preferred tools such as the command line interface (CLI).

## Admins centrally manage and govern pipelines

Admins centrally manage all citizen-led and pro-dev-led projects at scale. Admins set up the appropriate safeguards that govern all low-code solution development within their organization. Power Platform pipelines central administration benefits include:

- **Lower total cost of ownership**. 
  - Pipelines significantly **improve maker, developer and admin productivity**, enabling your business solutions to **come to market faster**, with better **quality**, better **visibility** and **control** for admins, and with **far less effort**. 
  - **Minimal effort** to implement custom-tailored _change management processes_ across your organization or team.
  - Pipelines handle the complex background processing and ongoing maintenance so that IT and development teams can **spend more time creating** valuable business solutions **vs developing and maintaining custom processes** to deploy and administer solutions. 
- Rest easy with **safeguards automatically applied by the system**. Soon you'll even be able to apply your own custom business logic.
- Create a pipeline once then share it with multiple groups of makers, developers, and/or admins. A **Pipeline can be run** (by those with access) from **within any environment** associated with the pipeline.
- **Pipelines enable admins** to **scale at their own pace**. Regardless of where you're at in your ALM journey, Pipelines allow you benefit from ALM / CI/CD - without needing to comprehend, license, and adopt more sophisticated DevOps tooling. 
  - Rest assured, you can later extend Power Platform Pipelines to accomodate your evolving business needs. We aim for this upward transition to be as seamless and effortless as possible. 
- Achieve compliance, safety, monitoring, and automation goals with **customizations and audit logs saved automatically and easily accessible** by admins at any time.
- Leverage **out of the box analytics** and/or create your own reports.
  - Central storage makes reporting much simpler. 


## Makers run pre-configured pipelines

- Once pipelines are in place, makers can initiate (or soon request with approval) in-product deployments. This ensures any maker can build, share, and update apps, flows, or any other customization in a healthy and compliant manner.
- **Citizen developers view this as a guided change management process** - without any prior knowledge of automated ALM processes or developer focused DevOps systems and SDLC (software development lifecycle) best practices. 
  - Such **complexities are not exposed to citizen developers**, regardless of how sophisticated the processes running in the background might be.
- Solutions are **pre-validated** against the target environment to prevent mistakes and **improve success rates**. 
  - For example, missing dependencies and other **issues are detected before deployment** and makers are prompted in-context of where they can take action.
- **Connections** and **environment variables** are provided upfront and validated before the deployment begins. This helps ensure applications and automations are deployed without needing manual post-processing steps, and are connected to the appropriate data sources within each environment. 

## Developers can use the same pipelines
Professional developers are **more productive** with Pipelines now handling the complex background operations. Developers can tell the system _what they want to accomplish_ instead of executing the various underlying tasks necessary to accomplish the same goal. Using the Power Platform CLI (command line interface), developers can:

- **List Pipelines** to view pertinent details such as which stages and environments are ready to deploy their solutions to. 
- **Deploy** a solution with a single command. 
  - With Pipelines, developers simply provide the required parameters and the **system will orchestrate all the end-to-end deployment operations** (in compliance with the organizational policies).
  - No need to connect to multiple environments, export solutions, download solution files, manually create connections and populate deployment settings files, import solutions, or handle various other tasks that were required previously. 
    



> [!IMPORTANT]
> - This is a preview feature. More information: [Model-driven apps and app management](/power-apps/maker/powerapps-preview-program#model-driven-apps-and-app-management)
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is being gradually rolled out across regions and might not be available yet in your region.


## Next steps

[Use Power Platform pipelines (preview)](use-pipelines.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
