---
title: "Overview of pipelines in Power Platform"
description: "Overview of pipelines in Power Platform and frequently asked questions."
author: caburk
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 01/30/2025
ms.reviewer: "matp"
ms.topic: "overview"
contributors:
  - asheehi1
---
# Overview of pipelines in Power Platform

Pipelines in Power Platform aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service in a manner that's more approachable for all makers, admins, and developers.

:::image type="content" source="media/deployment-pipelines.png" alt-text="Example of the deployment Pipelines feature":::

Pipelines significantly reduce the effort and domain knowledge previously required to realize the ROI from adopting healthy, automated ALM processes within your team or organization.

- Admins easily configure automated deployment pipelines in minutes rather than days or weeks.
- Makers have an intuitive user experience for easily deploying their solutions.
- Professional developers can (optionally) [extend pipelines](extend-pipelines.md) and run them using the Power Platform command line interface (CLI).

## Admins centrally manage and govern pipelines

Pipelines enable admins to centrally govern citizen-led and pro-dev-led projects at scale with less effort. Admins set up the appropriate safeguards that govern and facilitate solution development, testing, and delivery across the organization. Other admin benefits include:

- Lower total cost of ownership:
  - Pipelines significantly improve maker, developer, and admin productivity. Pipelines enable your business solutions to come to market faster, with higher quality, through a safe and governed process.
  - Minimal effort to implement a secure and custom-tailored change management processes across your organization or team.

- Save time and money:
  - The system handles the heavy lifting and ongoing maintenance so you don't have to.

- Scale ALM at your own pace:
  - Regardless of where you're at in your ALM journey, you can extend pipelines to accommodate your evolving business needs. We aim for this upward transition to be as seamless and effortless as possible. More information: [Microsoft Power Platform CLI `pac pipeline` command group](../developer/cli/reference/pipeline.md) 
- Achieve compliance, safety, monitoring, and automation goals with:
  - Secure production environments with approval based [delegated deployments](delegated-deployments-setup.md).
  - Customizations and audit log saved automatically and are easily accessible.
  - Out-of-the-box analytics provides better visibility within a central location.
  - The ability to view out-of-the-box Power BI reports within the pipelines app or create your own. More information: [Reporting overview for model-driven apps](/power-apps/maker/model-driven-apps/reporting-overview)
  - Custom tailor pipelines to the needs of your organization with [pipelines extensibility](extend-pipelines.md) and Power Automate. 

## Makers run preconfigured pipelines

Once pipelines are in place, makers can initiate in-product deployments with a few clicks. They do so directly within their development environments. Other benefits to makers include:

- No prior knowledge of ALM processes or systems required. Citizen developers often view pipelines as a guided change management process.
- Solution deployments are prevalidated against the target environment to prevent mistakes and improve success rates. For example, missing dependencies and other issues are detected before deployment and makers are immediately guided to take the appropriate action.
- Connections and environment variables are provided upfront and validated before the deployment begins.
  - This helps ensure applications and automation are deployed without needing manual post-processing steps, and are connected to the appropriate data sources within each environment.
  - Admins can even preconfigure certain connections that will be used.

## Developers can use and extend pipelines

Professional developers are more productive with pipelines now handling the complex background operations. Developers can tell the system what they want to accomplish instead of executing the various underlying tasks necessary to accomplish the same goal. Using the Power Platform CLI, developers can:

- List pipelines to view pertinent details such as which stages and environments are ready to deploy their solutions to.
- Deploy a solution with a single command:
  - With pipelines, developers simply provide the required parameters and the system orchestrates all the end-to-end deployment operations in compliance with the organizational policies.
  - No need to connect to multiple environments, export solutions, download solution files, manually create connections and populate deployment settings files, import solutions, or handle various other tasks that were required previously.

Additionally, developers can [extend pipelines](extend-pipelines.md) and integrate with other CI/CD tools.

## Frequently asked questions

### What do pipelines deploy?

Pipelines deploy solutions as well as configuration for the target environment such as connections, connection references, and environment variables. Any Power Platform customization contained in your solution can be deployed using pipelines. Pipelines, or solutions in general, don't contain data stored within Dataverse tables.

   > [!IMPORTANT]
   >
   > Power BI Dashboards (preview) and Power BI Datasets (preview) are not currently supported in pipelines. 
   >

### Why can't I see my pipeline from my environment?

First, ensure that your source and target environments are linked properly. You'll only be able to view your pipeline in the assigned source environments, such as your development environments. When linking each of your environments to your pipeline during configuration, you have an option of **Development Environment** or **Target Environment** environment type. If your pipeline-associated environments are assigned their proper type, your pipeline appears as an option in your source development environment.

### Does pipelines automatically store solution backups?

Yes. Both managed and unmanaged solutions are automatically exported and stored in the pipelines host for every deployment.

### Can customization bypass a deployment stage such as QA?

No. Solutions are exported as soon as a deployment request is submitted (when the maker selects **Deploy** from within their development environment), and the same solution artifact will be deployed. Similarly, the system doesn't re-export a solution for deployments to subsequent stages in a pipeline. The same solution artifact must pass through pipeline stages in sequential order. The system also prevents any tampering or modification to the exported solution artifact. This ensures customization can't bypass QA environments or your approval processes.

### Are standalone licenses required to use pipelines?

- Developer environments aren't required to be Managed Environments. They can be used for development and testing with the developer plan.
- The pipelines host should be a production environment, but the pipelines host doesn't have to be a Managed Environment.
- All other environments used in pipelines must be enabled as Managed Environments.
- Licenses granting premium use rights are required for all Managed Environments.

A common setup example:

| Environment purpose | Environment type |  Standalone license required |
|--------------|-----|-----------|
| Host | Production | No |
| Development | Developer | No |
| QA |  Developer | No |
| Production |  Production | Yes |

### Can I configure approvals for deployments?

Yes. See [delegated deployments](delegated-deployments-setup.md).

### Can I use different service principals for different pipelines and stages?
Yes. More information: [Deploy with a service principal](delegated-deployments-setup.md#deploy-with-a-service-principal)

### What connections can be used?

Similar to authoring experiences, makers running pipelines can either provide their own connections or connections they have access to. Service principal connections can also be used for connectors that support service principal authentication, including custom connectors. 

### Why can't I update existing connection references?

Currently, connection references without a value in the solution or targeted environment can't be updated during deployment. If a value was deployed previously, it can be updated in the targeted environment.

### Who owns deployed solution objects?

The deploying identity. For standard deployments, the owner is the requesting maker. For delegated deployments, the owner is the delegated service principal or user. 

### Can pipelines deploy to a different tenant?

No. We recommend using Azure DevOps or GitHub for this scenario. 

### What should I do if my development or target environment is reset or deleted?

You should delete the environment record and update the pipeline configuration when needed. If an environment is reset, you re-create the environment record then associate it with your pipeline. 

### Can I use pipelines in the default environment?

Yes. However, using the default environment as the pipelines host isn't recommended for all customers. 

### Can I deploy using my own service principal?

Yes. More information: [Deploy pipelines as a service principal or pipeline owner](delegated-deployments-setup.md).

### Can pipelines be used with Azure DevOps, GitHub, or the ALM Accelerator?

Yes, together these tools are powerful while keeping maker experiences simple. More information: [extend pipelines](extend-pipelines.md)

### Can I roll back to a previous version?

Yes. If the pipeline setting is enabled, you can [redeploy previous solution versions](redeploy-past-solution-versions.md) from the run history view on the Pipelines page. If the setting is disabled, only higher solution versions can be deployed or imported. As a work-around, admins can download the artifact from the pipelines host, increment the solution version in the solution.xml file, then manually import it into the target environment. 

### Can I set retention policies for pipelines data?

Yes. You can configure bulk delete jobs in the Dataverse pipelines host to delete data on a defined schedule. 

### Can I specify advanced solution import behaviors such as update versus upgrade?

Not currently. Pipelines default import behavior is _Upgrade_ without _Overwrite customizations_.

### Can an environment be associated with multiple hosts?

No. However, one environment can be linked to multiple pipelines within the same host. In order to associate an environment with a different host, add it to a pipeline in the new host. Then delete the environment record from the original host and verify everything works as expected.

### Can I customize or extend the first-party deployment pipeline app and tables?

Not currently. However, intentional extension hooks are available to customize pipelines logic. More information: [extend pipelines](extend-pipelines.md).

### Where can I view and run pipelines?

Navigate to an unmanaged solution in development to an environment associated with your pipeline. Pipelines can't be viewed or run from the default solution, managed solutions, or in target environments. Notice you can also retrieve and run pipelines from the Power Platform CLI.

### Can I deploy across regions?

Yes, but only if the [Cross-Geo Solution Deployments](enable-cross-geo-solution-deployments.md) setting is enabled in the host. If the setting is disabled, the host and all environments associated with pipelines in a host must be located within the same geographic location (as specified when creating environments). For example, if the setting is disabled, a pipeline can't deploy from Germany to Canada and a host in Germany can't manage environments in Canada. In a case where the tenant administrator would like to prevent cross-geo solution deployments, separate hosts should be used for Germany and Canada.

### Can I deploy the same solution using different pipelines?

Yes, this is possible, although we recommend starting with the same pipeline for a given solution. This helps avoid confusion and inadvertent mistakes. Pipeline run information is displayed in the context of one pipeline and one solution (within the solution experience). Therefore other pipelines might not show the latest deployed solution version or other important run information associated with different pipelines. Notice that the Deployment Pipeline Configuration app shows run information across all pipelines and all solutions for the current host.

### Can the host environment also be used as a development or target environment?

Using the same environment for development and the host isn't supported; other combinations aren't recommended as a best practice.  

### How can I view what changed between different versions?

Within the target environment, you can see layers of deployed objects as well as what changed between layers. Additionally, you can see XML diffs between layers for model-driven apps, site maps, and forms. Pipelines can also be extended to integrate with GitHub and other source control systems to compare granular diffs. 

### Should my host environment be the same as where I installed the COE toolkit?

This is a valid configuration and should be evaluated based on the needs and policies within your organization.

### Can I deploy unmanaged solutions?

No. We recommend that you always deploy managed solutions to nondevelopment environments. Notice unmanaged solutions are automatically exported and stored in the pipelines host so you can download and import them to other development environments or put them in source control. 

### Can I deploy multiple solutions at once?

Not currently. You'll need to submit a different deployment for each solution. However, the same pipeline can be used for multiple solutions.

### Do pipelines publish unmanaged customizations before exporting the solution?

Not currently. We recommend you publish individual objects as they're saved. Note that only certain solution objects require publishing.

### Can I use pipelines for multi-developer teams working in isolated development environments?

The current implementation uses a single development environment for a given solution.

### How are pipelines different from the ALM Accelerator?

Both offer many valuable capabilities and the owning teams work together closely in developing the pipelines and broader ALM vision for Power Platform. Pipelines are more simplistic in nature and can be set up and managed with less effort. Access to other products and technologies isn't required as everything is managed in-house. The ALM Accelerator, on the other hand, is sometimes a better fit for more advanced ALM scenarios.

While there are many additional functional differences, the fundamental difference is that pipelines are an official Microsoft Power Platform product feature—meaning it's designed, architected, engineered, tested, maintained, and supported by Microsoft product engineering. Pipelines are built into the product and can be accessed within native product experiences.

### When should I use pipelines versus another tool?

We encourage customers to use pipelines for core deployment functionality, and when needed, extend pipelines to integrate with other CI/CD tools. When used together, the workloads required within CI/CD tools often become less complicated and costly to maintain. 


## Next steps

[Set up pipelines](set-up-pipelines.md)  
[Extend pipelines](extend-pipelines.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]


## Related information

- [Deploy solutions using Pipeline in Power Apps (video)](https://youtu.be/iziCkYl8Shc?feature=shared)
- [Simplify Microsoft Power Platform deployments by using pipelines - Learning Path](https://aka.ms/PipelinesLearningPath)
