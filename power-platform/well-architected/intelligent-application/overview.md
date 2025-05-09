---
title: Overview of intelligent application workloads
description: Learn how architecture patterns, design areas, and architecture layers relate to well-architected intelligent application workloads built with Power Platform.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Overview of intelligent application workloads

This documentation provides actionable guidance for planning, developing, and maintaining intelligent application workloads with Microsoft Power Platform. The guidance has a technical foundation in Power Platform Well-Architected best practices and is also informed by experience derived from customer deployments.

This guidance is intended primarily for workload owners, technical stakeholders, and business stakeholders&mdash;anyone who plays an integral role in designing, building, and maintaining an intelligent application workload.

>[!TIP]
>To assess your workload through the lenses of reliability, security, operational excellence, performance efficiency, and experience optimization, conduct a [Power Platform Well-Architected Assessment](https://aka.ms/powa/assessment).

## What is an intelligent application workload?

Within the context of Power Platform Well-Architected, the term *workload* describes a set of application resources, data, and supporting infrastructure and processes that work together to deliver desired business outcomes. A workload comprises application and technology components as well as behavioral, development, and operational processes.

An intelligent application workload built on Power Platform applies the capabilities of Power Platform to integrate and consume generative AI models for automating and enhancing business processes.

Generative AI is an artificial intelligence technology that uses large language models (LLMs) to generate original content and provide natural language understanding and responses. Learn more about [Generative AI](/ai/playbook/technology-guidance/generative-ai/) in the Artificial Intelligence (AI) playbook.

## What are common challenges?

Developing an intelligent application workload built on Power Platform can be complex. Challenges include:

- **Data quality and availability**: Generative AI models require large volumes of high-quality data. Ensuring data is clean, well-structured, and accessible increases complexity.
- **Integration with existing systems**: Seamlessly integrating generative AI with existing IT infrastructure and business processes can be resource-intensive and technically challenging.
- **Ethical and compliance issues**: Addressing ethical concerns and ensuring compliance with legal and regulatory standards are essential. Managing data privacy, avoiding biases in AI models, and maintaining transparency are just some of the issues to navigate.
- **Skills and expertise**: Developing and managing generative AI solutions requires specialized skills. Organizations often need to invest in training their workforce or hire new talent with the necessary expertise.
- **Cost and resource allocation**: Implementing generative AI can be costly. Organizations need to carefully manage their resources and start with small, high-impact pilot projects to demonstrate value before scaling up.
- **Security concerns**: Ensuring the security of AI systems is critical, and includes protecting sensitive data from breaches as well as safeguarding against potential vulnerabilities in AI models and infrastructure.
- **User interface design**: Designing intuitive, user-friendly interfaces that harness AI capabilities, particularly without overwhelming users, can be difficult.

Addressing these challenges requires thorough planning, collaboration across different teams, and a strategic approach to integrating AI into business processes.

### The Well-Architected approach

We recommend that you structure your well-architected workload to meet specific reliability, security, operational excellence, performance efficiency, and experience optimization objectives. To enhance user experiences and deliver consistency and reliability, follow architectural principles and guidelines that are tailored to intelligent application workloads.

The Power Platform Well-Architected [pillars](../pillars.md) help you implement modularity, separate roles, and improve operational productivity. Use a well-architected approach to create workloads without unnecessary complexity and cost.

To understand how each pillar can improve your intelligent application workload, consult [Design principles of intelligent application workloads](design-principles.md).

## Assess technical and operational feasibility

Before you start developing your intelligent application workload with Power Platform, assess technical and operational feasibility and identify risks and mitigation strategies.

You might also want to consider updating current workloads to use Generative AI capabilities&mdash;when these capabilities meet business needs and reduce costs. Consider modernizing based on the purpose of the application, life expectancy, supportability, cost, and service-level agreements (SLAs).

### Technical feasibility

Technical feasibility involves assessing the availability and quality of data, integration requirements, and challenges around technical complexity.

#### Data availability and quality

High-quality data ensures consistency and accuracy for the intelligent application workload. As part of your feasibility assessment, consider the following:

- **Data sources**: Identify and catalog all potential data sources, including internal databases, external APIs, and third-party datasets. Ensure these sources are reliable and accessible.
- **Data silos**: Identify whether the current process uses any disparate data sources, like spreadsheets. The integration of this disparate data into the AI system might pose a challenge yet may be essential for providing accurate responses.
- **Data volume and variety**: Assess the volume and variety of data available. Generative AI models typically require large and diverse datasets to perform effectively. Ensure that the data sources provide sufficient quantity and diversity to train and validate the models.
- **Data cleaning**: Perform data cleaning to remove duplication, correct errors, and handle missing values. This step is critical to ensure the data that is fed into the AI models is accurate and reliable.
- **Data transformation**: Transform raw data into a suitable format for AI model training. This process may involve normalization, scaling, and encoding categorical variables.
- **Data validation and testing**: Regularly validate and test the data to ensure it meets the required quality standards. 

#### Integration requirements

Straightforward integration facilitates real-time data access and updates for the intelligent application workload. As part of your feasibility assessment, consider the following:

- **Existing infrastructure**: Assess the compatibility of generative AI models with your current infrastructure. For example, determine whether robust APIs are available for easy integration.
- **Integration points**: Identify how your intelligent application workload will integrate with the required data sources. For example, determine whether connectors or APIs are available.

#### Technical complexity challenges

Accurate responses rely on a well-architected intelligent application workload. As part of your feasibility assessment, evaluate the reliability and accuracy of the responses provided by the intelligent workload. Consider how to optimize, monitor, and improve the generated responses. The technical complexity challenges require a combination of technical expertise, robust infrastructure, and ongoing management to successfully implement and maintain intelligent application workloads. Learn more in [Reliability design principles of intelligent application workloads](design-principles.md#reliability).

### Operational feasibility

Operational feasibility involves assessing the availability of resources, user adoption, and risks together with mitigation strategies.

#### Resource availability

The success of your intelligent application workload depends on the availability of a dedicated budget and team resources, supported by an AI-focused Center of Excellence (CoE). Consider the following:

- **Skill assessment**: Assess the skills of your team members to identify any gaps that can be addressed through training or hiring.
- **Role allocation**: Clearly define roles and responsibilities to ensure that each team member understands their tasks and how they contribute to the project's success.
- **Training and development**: Invest in continuous training and development to keep the team updated with the latest AI technologies and methodologies.
- **Cost estimation**: Begin with a detailed cost estimation that includes license cost, software and cloud services costs, and personnel costs. Such estimates form the foundation of a realistic budget.

#### User adoption

The success of your intelligent application workload depends on users being comfortable with the system. Consider the following:

- **User-centric design**: Design the system to be intuitive and user-friendly. Complex interfaces can deter users&mdash;simplicity and clarity are critical. Ensure the system is accessible to all users.
- **Training**: Facilitate comprehensive training sessions and provide ongoing support.
- **Feedback loops**: Establish feedback mechanisms where users can report inaccuracies, which can then be used to refine and improve the models.
- **Transparency and trust**: Ensure that users know they're using a workload that includes generative AI capabilities. Clearly communicate why an AI solution was chosen, how it was designed, and how it's monitored and updated.
- **Change management**: Align the change with the organization's culture and values to ensure broad acceptance and support. 

### Risks and mitigations

Data privacy concerns, potential biases in AI responses, and technical failures are potential risks. Ensuring data privacy is critical, especially as the intelligent application workload may handle sensitive data. 

When planning an intelligent application workload, address the following risks and implement effective mitigation strategies:

- **Data privacy**: Safeguard sensitive data used and generated by AI models. Implement encryption, access controls, and regular security audits. Ensure the workload complies with relevant regulation standards, such as GDPR or HIPAA, to protect user privacy and data.

- **Bias in AI responses**: Use diverse and representative datasets to train AI models. Regularly audit and test models for biases. 

- **Technical failures**: Design robust and scalable infrastructure with redundancy and failover mechanisms. Implement regular backups and disaster recovery plans.

- **Security threats**: Employ advanced security measures such as multifactor authentication, intrusion detection systems, and regular security audits. Keep software and systems updated to protect against vulnerabilities.

- **Ethical concerns**: Establish clear ethical guidelines and governance frameworks for AI use. Ensure transparency in AI operations and maintain a human-in-the-loop approach for critical decisions.

- **Compliance and regulatory issues**: Stay informed about relevant regulations and ensure that AI systems comply with all legal requirements. Conduct regular compliance audits and update policies as needed.

## Next steps

Start by reviewing design principles.

> [!div class="nextstepaction"]
> [Design principles](design-principles.md)
