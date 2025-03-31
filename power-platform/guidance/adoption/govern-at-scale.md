---
title: Govern at scale
description: Adopting Power Platform at scale requires a robust governance framework to ensure efficient management, security, and compliance.
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 02/28/2025
---

# Manage at scale

Adopting Power Platform at scale requires a robust governance framework to ensure efficient management, security, and compliance. This article explores key strategies for managing and governing Power Platform adoption at scale.

## Understand your adoption maturity

The [Power Platform maturity model](maturity-model.md) provides a framework for understanding the different stages of adoption and governance. 

- **Initial stage**: At this stage, organizations are just beginning to explore Power Platform. Governance practices are minimal, focusing primarily on basic security and compliance.
- **Repeatable stage**: Organizations start to build more solutions and integrate Power Platform into their workflows. Governance practices expand to include more detailed policies and procedures.
- **Defined stage**: Power Platform becomes a critical part of the organization's operations. Governance practices become more sophisticated, with a focus on standardization and best practices.
- **Capable stage**: Organizations achieve a high level of maturity, with Power Platform deeply embedded in their processes. Governance practices are comprehensive, covering all aspects of security, compliance, and performance.
- **Efficient stage**: At this stage, organizations continuously refine and optimize their governance practices to ensure maximum efficiency and effectiveness.

As organizations progress through these stages, their governance practices must evolve to address increasing complexity and scale.

## Establish a governance framework

Effective governance frameworks ensure successful adoption and management of Power Platform at scale. These frameworks provide a structured approach to ensuring security, compliance, and operational efficiency across the organization. By defining clear policies, roles, and responsibilities, governance frameworks help maintain control over data access, solution development, and environment management. They also facilitate the integration of best practices and automation tools, enabling organizations to streamline processes and adapt to evolving business needs.

1. **Assess your current governance policies**: Evaluate existing governance practices to identify strengths and areas for improvement. This includes reviewing data access policies, security protocols, compliance measures, environment management procedures, solution development standards, and monitoring tools. Conducting audits and gathering feedback from users and admins can provide valuable insights into the effectiveness of current governance and highlight opportunities for optimization.
1. **Define governance objectives**: Establish clear goals and priorities for how the platform will be managed and utilized within your organization. Ensure your governance framework is aligned with your organization [vision and goals](vision.md).
    1. **Security**: Ensure data protection and prevent unauthorized access.
    1. **Compliance**: Adhere to regulatory standards and organizational policies.
    1. **Efficiency**: Streamline processes and reduce manual effort.
    1. **Scalability**: Enable the platform to grow with the organization’s needs.
1. **Develop governance policies**: Create detailed guidelines and rules that govern how the platform is used and managed within your organization. These policies ensure that all activities on the Power Platform are conducted in a secure, compliant, and efficient manner.
   1. **Data and connector access**: Define what connectors are available in which environment, and what data sources are available for use in Power Platform solutions? Learn more: [Define a DLP (Data Loss Prevention) policy strategy](dlp-strategy.md).
   1. **Environment management**: Establish guidelines for creating, managing, and decommissioning environments. Learn more: [Establish an environment strategy](environment-strategy.md).
   1. **Solution development**: Set standards for developing, testing, and deploying solutions.
   1. **Security protocols**: Implement measures such as encryption, row-level security, and secure data storage. Learn more: [Enhance your security posture](security-posture-management.md).
1. **Establish roles and responsibilities**: As part of planning your governance framework, it’s essential to assign well-defined roles and responsibilities to the growing group of stakeholders. Learn more: [Define roles and responsibilities](roles.md). Some of the stakeholders to keep in mind are:
   1. **Power Platform admins**: Oversee the overall governance framework, define policies, and ensure compliance.
   1. **Environment admins**: Manage specific environments, implement policies, and provide detailed reports.
   1. **Makers**: Develop solutions within the defined governance framework, adhering to policies and standards.
1. **Define delivery model**: Effective delivery models for admins are vital for managing Power Platform adoption at scale. These models include centralized administration, decentralized administration, and hybrid approaches. Centralized administration involves a dedicated team managing all environments, while decentralized administration allows individual departments to manage their own environments. Hybrid models combine elements of both, providing flexibility and scalability. Learn more: [Delivery models](delivery-models.md)

## Create environment groups

The task of managing Power Platform on a large scale across numerous environments ranging from hundreds to tens of thousands poses a significant challenge for both startup and enterprise IT teams.

Similar to folders, environment groups are designed to help administrators organize their flat list of environments into structured groups based on different criteria, such as business unit, project, and location.

Learn more: [Environment groups](/power-platform/admin/environment-groups)

Admins can apply various rules to groups to govern many environments in bulk, reducing manual effort and ensuring consistency. For example, admins might apply rules to security, licensing, compliance, or other facets.

Learn more: [Rules](/power-platform/admin/environment-groups#rules)

## Review recommendations

Stay up to date with recommended actions provided in the Power Platform Admin Center. These recommendations offer valuable insights and best practices tailored to your organization's specific usage and needs. By regularly reviewing and implementing these actions, you can proactively address potential issues, optimize performance, and ensure that governance policies are consistently applied. 

- [Review Power Advisor recommendations](/power-platform/admin/power-platform-advisor) to improve the overall health of your Power Platform tenant and get proactive.
- [Review Intelligent recommendations about licensing](/power-platform/admin/get-recommendations-licensing) to stay up to date with who in your organization would benefit from having a Power Apps premium license.

### Automate and formalize processes

Automating and formalizing processes like requests for new environments and connectors is essential for efficient management. Automation tools, such as Power Automate, can streamline these processes, reducing manual effort and ensuring consistency. Formalizing these processes with clear guidelines and approval workflows helps in maintaining control and accountability.

Consider the following tasks:

- **New environment requests**: 
    - Purpose: Establishing new environments for development, testing, or production.
    - Considerations: Define criteria for environment creation, such as project scope, department needs, and resource allocation.
    - Process: Implement an approval workflow to ensure that new environments are created only when necessary and meet governance standards. Consider automating the clean-up of environments that are no longer needed. 
- **New connector requests**: 
    - Purpose: Adding new connectors to existing Data Loss Prevention (DLP) policies or creating a new DLP policy for specific environments.
    - Considerations: Evaluate the security, compliance, and compatibility of new connectors.
    - Process: Establish an approval workflow to review and authorize new connector requests. Consider who has to approve the connector request - is it the Power Platform admin alone, or are their product or service owners that also need to approve the request? For example, if a maker requests the SAP connector for use in their environment, would the Power Platform or SAP service owner approve this request? 
- **User access management**: 
    - Purpose: Managing user permissions and roles within the Power Platform.
    - Considerations: Define access levels based on user roles and responsibilities.
    - Process: Implement workflows to approve changes in user access and ensure compliance with security policies.
- **Solution development and deployment**: 
    - Purpose: Standardizing the development and deployment of Power Platform solutions.
    - Considerations: Define best practices for solution development, testing, and deployment.
    - Process: Establish workflows to review and approve solutions before deployment. Consider using [pipelines in Power Platform](/power-platform/alm/pipelines).
- **Power Advisor recommendations**:
     - Purpose: Take action on Power Advisor recommendations. 
    - Considerations: Regularly review recommendations provided by Power Advisor to identify best practices, performance improvements, and security enhancements.
    - Process: Use the [Power Platform for Adminv V2](/connectors/powerplatformadminv2/) connector to retrieve and take action on recommendations. 

Automating common governance tasks reduces manual effort, ensures consistency, and enhances efficiency. Automation helps in maintaining control over the Power Platform, enabling organizations to scale their operations while adhering to governance standards.

Learn more: [Programmability and extensibility](/power-platform/admin/programmability-extensibility-overview)

## Train your team

Provide training and resources to your team to ensure they understand the importance of governance and are equipped to implement best practices effectively. Provide training to both makers and environment admins that you delegate responsibilities to.

### Training for makers

Bear in mind that often makers developing the solutions aren't fully aware of governance and security risks. If your organization does any training on how to build workloads with Power Platform, incorporate your recommendations for effective governance into those training efforts. Make sure your makers are aware of any rules and policies before building a solution.

Your training should include education on tenant-wide guardrails and configurations that might affect the workloads that are being built. Makers also require training on configurations they need to make for their workloads, such as security roles and how to connect to data. Share the process for collaborating with them on any requests they might have - such as requesting a new environment or a new connector.

Having a central source, such as a [SharePoint site or wiki](wiki-community.md), where makers can easily access this training content is important. This centralized repository ensures that all team members have consistent and up-to-date information, making it easier to discover and reference security guidelines and resources. Empowering makers and developers with the knowledge and tools they need helps safeguard your organizations data and applications.

### Training for environment admins

**Power Platform environment admins** are responsible for managing specific environments within Power Platform. They focus on the operational aspects of individual environments, ensuring they run smoothly and securely.

**Power Platform Admins**, on the other hand, oversee the broader governance and administration of the entire Power Platform across the organization. Their responsibilities include defining governance policies, monitoring overall platform usage, ensuring compliance with organizational standards, and managing integrations with other systems. They take a strategic view, ensuring that Power Platform aligns with the organization's goals and operates efficiently at scale.

Your training should include an introduction so environment admins can understand their responsibilities. Environment admins will focus on the day-to-day management of specific environments, including user access, data security, and compliance within their environments. Power Platform admins oversee the overall governance framework, define policies, and ensure that all environments adhere to organizational standards. 

Power Platform admins define governance policies, which environment admins implement within their environments. Both roles need to work together to ensure data security and compliance. Power Platform admins will [define a DLP (Data Loss Prevention) policy strategy](dlp-strategy.md), and environment admins will assess what connectors and policies they require for their environments and work with the Power Platform admin to assign the most appropriate policy to their environments.

Power Platform admins monitor platform-wide usage and performance, while environment admins require more detailed reports on their specific environments.

Environment admins handle immediate issues within their environments, escalating complex problems to Power Platform admins for resolution. Make sure environment admins clearly understand what they can and can't do, and provide them with an escalation path to the Power Platform admins for further questions and issues.

## Monitor and review governance practices

Monitoring and reviewing governance practices to maintain the effectiveness and efficiency of Power Platform adoption. Regular audits should be conducted to ensure compliance with established governance policies and to identify areas for improvement. These audits help in detecting any deviations from the policies and provide insights into potential risks and vulnerabilities. Review recommendations for [managing the defautlt environment](manage-default-environment.md) and ensure your default environment is well-governed.

Implement feedback mechanisms to gather input from makers and admins on governance practices. These channels allow stakeholders to share their experiences, suggest improvements, and report issues, fostering a culture of continuous improvement. Together, these practices ensure that the governance framework remains robust, adaptable, and aligned with organizational goals. Explore the [pulse survey](/power-platform/guidance/coe/nurture-components#pulse-survey-components) components of the CoE Starter Kit for sending out feedback surveys to your makers.

## Continuously improve

Regularly review and refine governance practices to ensure they remain effective and aligned with organizational goals and industry standards. The journey toward a modern, robust governance framework doesn't end with the initial implementation. To keep up with new risks, continuously review and refine your governance practices while maintaining strict adherence to standards. Continuous improvement is essential for maintaining a robust governance framework and for ensuring your Power Platform adoption can scale in a safe and maintainable way.

## Related resources

- [Microsoft Power Platform security and governance documentation](/power-platform/admin/security)
- [What's the role of a Power Platform administrator?](/power-platform/admin/overview-role-powerapps-admin)
- [Configure user security to resources in an environment](/power-platform/admin/database-security)
- [Managed Environments overview](/power-platform/admin/managed-environment-overview)
