---
title: Evaluate delivery models
description: Discover how to evaluate Power Platform delivery models to align with your organization's needs and foster innovation, efficiency, and compliance.
#customer intent: As a Power Platform user, I want to understand different Power Platform delivery models so that I can choose the best approach for my organization.
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/30/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/30/2025
---

# Evaluate delivery models

Evaluate delivery models and define a structured delivery and organization model to establish [clear roles and responsibilities](roles.md). By outlining how different teams and individuals interact with Power Platform, you help make sure that resources are effectively utilized, and projects are aligned with strategic objectives. This structured approach not only enhances efficiency and accountability but also supports compliance with regulatory requirements and promotes a culture of collaboration and innovation.

Organizations tend to use four primary delivery models. These models are conceptual frameworks, but in practice, organizations often combine approaches. For example, even if an organization adopts a centralized model where a central delivery team handles all requirements, citizen developers within the organization may explore the platform and create solutions for their specific teams. With this approach, elements of other models, such as matrix or BizDevOps, naturally emerge. While these delivery models provide a useful starting point, each organization typically develops a unique combination that fits its needs and context.  

Reflect on your current software delivery model and how Power Platform can integrate with or transform it. These models serve as a framework to understand how Power Platform's rapid development capabilities can be used within your existing processes. For instance, if your organization currently follows a centralized delivery model, integrating Power Platform might involve establishing a central team to manage and govern the platform while enabling citizen developers to create solutions within their departments. This approach enhances agility and innovation without compromising control and oversight.

Alternatively, if your organization uses a decentralized or federated model, Power Platform can empower individual teams to develop and deploy solutions quickly, fostering a culture of innovation and responsiveness. In this scenario, the role of a central governance team involves setting standards, providing support, and ensuring compliance across the organization.

As your organization evolves, you might find that a hybrid approach, blending elements of different delivery models, best suits your needs. This flexibility allows you to adapt to changing requirements and scale your Power Platform adoption effectively.

:::image type="content" source="media/delivery-models.png" alt-text="Screenshot illustrating Centralized, Decentralized, Matrix, and BizDevOps models.":::

## Centralized  

In a centralized model, central teams of product owners are responsible for the low-code delivery of departmental solutions across the organization's business units. Professional developers collaborate with the business to deliver solutions in a shared model. Enterprise architects manage the middle tier and services, ensuring data availability for makers. Central IT oversees licensing and the systems in which everyone operates.

This model allows a central team to prioritize and develop solutions based on organizational needs. With foundational expertise in Power Platform, the team can include specialists in various components of the platform, such as Copilot Studio, Power Automate, Power BI, and the Power Apps component framework. This centralized approach can effectively drive change across the organization and deliver a wide range of applications.

It's important to note that while the centralized model has its advantages, it might not be the best fit for every organization. Typically, a hybrid approach, which combines elements of centralized and decentralized models, is more effective for adopting Power Platform. A hybrid model allows for greater flexibility and enables individual teams to innovate and respond quickly to their specific needs while maintaining central oversight and governance. This balance ensures that the organization can scale its Power Platform adoption efficiently and sustainably.

Some key benefits of a decentralized delivery model are:

- **Consistency**: Centralized teams can ensure that all solutions adhere to organizational standards and best practices, leading to uniform quality and compliance.
- **Governance**: With a central team overseeing development, it's easier to implement and enforce governance policies, such as data security, compliance, and resource management.
- **Resource efficiency**: Centralizing resources allows for more efficient allocation and utilization, reducing redundancy and optimizing costs.
- **Expertise concentration**: A central team can develop deep expertise in Power Platform components, providing specialized knowledge and support to the entire organization.
- **Strategic alignment**: Centralized control ensures that all projects align with the organization's strategic goals and priorities, facilitating coordinated efforts and avoiding conflicting initiatives.
- **Simplified management**: Managing a single, central team can be simpler and more straightforward than coordinating multiple decentralized teams.

While a centralized approach to Power Platform adoption has its benefits, it also comes with several challenges:

- **Bottlenecks**: Centralized teams can become overwhelmed with requests, leading to delays and slower response times for project delivery.
- **Limited innovation**: Centralized control can stifle creativity and innovation, as teams may feel less empowered to experiment and develop solutions independently.
- **Reduced agility**: A centralized model can be less flexible and slower to adapt to changing needs and priorities, as all decisions and developments must go through a central team.
- **Resource constraints**: Central teams might struggle to manage the diverse needs of the entire organization, leading to resource allocation challenges and potential neglect of smaller projects.
- **Dependency**: Relying heavily on a central team can create a single point of failure, where issues within the central team can impact the entire organization's ability to develop and deploy solutions.
- **Lack of business expertise**: Centralized teams might not have the same level of understanding of specific departmental needs and challenges, leading to solutions that are less tailored and effective.
- **Employee disengagement**: Teams might feel less ownership and involvement in the development process, potentially leading to lower engagement and satisfaction.

## Decentralized

In a decentralized delivery model, multiple teams are established across the organization, each closely aligned with the day-to-day operations of various departments. These teams are equipped with the resources needed to consistently deliver apps within organizational guidelines. Operating autonomously, they can adapt and expand in a cellular fashion, allowing for flexibility and rapid response to specific needs.

Despite the autonomy of these teams, centralized governance remains essential to ensure corporate compliance and maintain high-level digital guardrails. For example, implementing data loss prevention (DLP) policies, managing connectors, and overseeing license management. These measures enable users and developers to build and release solutions safely and efficiently, with minimal intervention from IT, while safeguarding company data.

The decentralized model is an excellent self-service option because it lets teams innovate and solve their unique challenges while following organizational standards and compliance. This approach fosters a culture of agility and responsiveness, driving successful Power Platform adoption across the enterprise.

Key benefits of a decentralized delivery model are:

- **Increased agility**: Teams can quickly respond to their specific needs and challenges, leading to faster development and deployment of solutions.
- **Enhanced innovation**: By empowering individual teams, the model fosters a culture of creativity and experimentation, driving innovation across the organization.
- **Scalability**: Teams can grow and adapt in a cellular fashion, allowing the organization to scale its Power Platform adoption efficiently.
- **Autonomy**: Teams operate independently, making decisions and managing their projects without waiting for central approval, which can streamline processes and reduce bottlenecks.
- **Closer alignment with business needs**: Teams that are closely aligned with day-to-day operations can develop solutions that are more tailored to the specific needs of their departments.
- **Resource optimization**: Decentralized teams can apply their unique expertise and resources, optimizing the use of organizational assets.
- **Employee empowerment**: Giving teams the autonomy to manage their projects can increase job satisfaction and engagement, as employees feel more empowered and responsible for their work.

Challenges of a decentralized delivery model include:

- **Consistency**: Ensuring that all teams adhere to organizational standards and guidelines can be difficult, leading to potential inconsistencies in app quality and compliance.
- **Governance**: Maintaining effective governance across multiple autonomous teams requires robust oversight mechanisms to ensure data security, compliance, and proper use of resources.
- **Coordination**: With multiple teams working independently, coordinating efforts and sharing knowledge can be challenging, potentially leading to duplicated efforts or missed opportunities for collaboration.
- **Training and support**: Providing consistent training and support to all teams can be demanding, especially as the number of teams grows.
- **Change management**: Managing changes across a decentralized structure can be more complicated, requiring clear communication and coordination to ensure smooth transitions.
- **Scalability**: While decentralization can facilitate growth, it can also lead to scalability issues if not managed properly, as the organization must ensure that all teams have the necessary resources and support.

## Hybrid

Hybrid delivery models for Power Platform adoption combine the strengths of both centralized and decentralized approaches, offering a balanced framework that maximizes efficiency and innovation. Two prominent hybrid models are the matrix and BizDevOps model.

### Matrix

The Matrix model integrates the best aspects of centralized and decentralized structures. It features a centralized team of trained Power Platform specialists, including leaders in change management, design, delivery, and architecture. This team also includes specialized trainers who equip local teams across the organization with the necessary skills. Local teams collaborate closely with experts from the centralized structure to ensure seamless communication and alignment between day-to-day operations and solution development. This model supports scalability, enabling thousands of individuals to participate in app creation.

To enhance this model, organizations should [establish a Center of Excellence (CoE)](coe.md) to manage their data estate and deploy solutions with standardized guidelines for everyone. This approach is particularly effective for self-service and small teams, allowing them to deliver solutions quickly with minimal IT involvement.

### BizDevOps

The BizDevOps model emphasizes a holistic relationship between solution developers and operations, fostering a continuous feedback loop that accelerates app development. For this model to succeed, all teams must share a clear vision of the organization's digital culture and strategic goals. Reliable support, governance, and maintainability are needed to maximize the value of the apps created. As technology evolves, update solutions to keep them current. Effective change management, including awareness and planning, is key to ensuring the success and longevity of the apps.

Some key benefits of a hybrid delivery model are:

- **Balanced approach**: A hybrid model combines the strengths of both centralized and decentralized models, providing a balanced framework that maximizes efficiency and innovation.
- **Scalability**: Hybrid models can support large-scale adoption, enabling thousands of individuals to participate while maintaining oversight and governance.
- **Flexibility**: These models allow for adaptability, enabling teams to respond quickly to changing needs and priorities while still adhering to organizational standards.
- **Enhanced collaboration**: By connecting local teams with centralized experts, hybrid models ensure seamless communication and alignment, reducing the risk of miscommunication and ensuring that solutions meet business needs.
- **Resource optimization**: Hybrid models optimize the use of resources by using the expertise of centralized teams and the agility of decentralized teams.
- **Improved governance**: Centralized governance structures, such as a Center of Excellence, provide standardized guidelines and oversight, ensuring compliance and data security.
- **Innovation and responsiveness**: Local teams are empowered to innovate and address their unique challenges, fostering a culture of creativity and responsiveness.
- **Effective change management**: Hybrid models facilitate effective change management by combining centralized planning with decentralized execution, ensuring smooth transitions and continuous improvement.

While a hybrid delivery model offers many benefits, it also presents some challenges:

- **Complex coordination**: Balancing centralized and decentralized elements requires effective coordination and communication, which can be complex and time-consuming.
- **Resource management**: Ensuring that both central and local teams have the necessary resources and support can be challenging, especially as the organization scales.
- **Potential for silos**: There's a risk of creating silos if local teams become too autonomous and disconnected from the central governance structure.
- **Training and support**: Providing consistent training and support to both central and local teams can be demanding, requiring ongoing investment in skills development.
- **Alignment with strategic goals**: Ensuring that all teams, both central and local, are aligned with the organization's strategic goals and priorities can be challenging.
- **Balancing innovation and control**: Striking the right balance between allowing local teams to innovate and maintaining central control and oversight can be difficult.

Addressing these challenges requires a well-thought-out strategy, effective communication, and robust governance framework. Overall, hybrid models offer a comprehensive and adaptable approach to Power Platform adoption, driving successful digital transformation across the organization.

## Customer examples

The following customer stories highlight various operating models and provide insights into how organizations have structured their delivery models for successful Power Platform adoption.

Equinors Center for Enablement development team took a blended approach to centralize and decentralize different components of the company's citizen development model. Equinor's five DigiTEAMs and certified citizen developers are decentralized, enabling them to work across the company based on solution development needs. This approach often involves fusion teams and co-development with IT. [Learn more about their Center for Enablement and citizen development model](https://www.microsoft.com/en/customers/story/1509256450290599724-equinor-energy).

Zurich developed a decentralized operational model to manage its large global tenant, which was essential for growth due to the numerous makers and projects across various languages and regulatory environments. The central Center for Enablement team handles central governance, while local Center for Enablement teams manage production and local governance. This approach, with nearly 20 teams organized by business unit or country, balances governance and empowerment, leading to simplification and innovation for Zurich's business and internal customers. [Learn more about Zurichs' operational model.](https://www.microsoft.com/en/customers/story/1792347226516734147-zurich-insurance-group-power-apps-insurance-en-switzerland).

Schlumberger has embraced Power Platform to drive digital transformation across its global operations, achieving rapid adoption. This success is supported by a robust Center of Excellence (CoE) that ensures governance, monitoring, and security practices are in place. The CoE fosters innovation by providing a structured environment where both citizen developers and professional developers can collaborate effectively. This decentralized approach, combined with central oversight, allows Schlumberger to scale its solutions while maintaining control and compliance. [Learn more about how Schlumberger is adopting Microsoft Power Platform](https://www.microsoft.com/en-us/power-platform/blog/power-apps/schlumberger).

| Type of application delivery | Delivery model type | Build time of the application | Lifetime of the application | Examples | IT engagement |
|---|----|----|---|----|----|
| Self-service | Any | 1-2 weeks | 6-12 months | Small, departmental, or LOB solutions. | Decentralized IT |
| Small teams | Matrixed/Centralized | 3-6 months | 6-24 months | Small teams working to deliver medium solutions or multiple-department solutions. | Decentralized IT |
| Multiple-department or large line-of-business solutions | Matrixed/Centralized | 3-6 months | 6-24 months | Large matrixed teams working to deliver medium and large solutions or intra-department solutions. | Centralized IT |
| Large-scale product delivery | Centralized | 1-2 years | 5-7 years | Large product deliveries across an enterprise using a mixture of low-code and code-first Power Apps solutions along with vendor and first-party solutions. | Centralized IT |
| Large enterprise vendor delivery | Centralized | 7 years | 10-15 years | Surround strategy for a third-party system of record and support framework. For example, SAP implementation and surrounding it with a mixture of low-code and code-first solutions in Power Apps and other Microsoft and third-party integrations. | Centralized IT |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
