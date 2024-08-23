---
title: Overview of intelligent application workloads
description: Learn how architecture patterns, design areas, and architecture layers relate to well-architected intelligent application workloads built with Power Platform
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Overview of intelligent application workloads

This documentation provides actionable guidance for planning, developing and maintaining intelligent application workloads with Power Platform. The guidance has a technical foundation in Power Platform Well-Architected Framework best practices and is also informed by learnings from numerous customer deployments.

This guidance is intended for workload owners, technical stakeholders, and business stakeholders. It's appropriate for people who play an integral role designing, building, and maintaining an intelligent application workload.

>[!TIP]
>To assess your workload through the lenses of reliability, security, operational excellence, performance efficiency, and experience optimization see the [Power Platform Well-Architected Assessment](https://aka.ms/powa/assessment).

## What is an intelligent application workload?

The term _workload_ is used to describe a set of application resources, data, and supporting infrastructure and processes that work together to deliver desired business outcomes. A workload comprises application and technology components as well as behavioral, development, and operational processes.

An intelligent application workload built on Power Platform leverages the capabilities of Microsoft’s Power Platform to integrate and utilize generative AI models for automating and enhancing business processes.

Generative AI is an artificial intelligence technology that uses large language models (LLMs) to generate original content and provide natural language understanding and responses. For details, see Technology guidance > [Generative AI](/ai/playbook/technology-guidance/generative-ai/).

## What are the common challenges?

Developing an intelligent application workload built on Power Platform can be complex and presents several challenges. Here are some of the most common ones:

- **Data quality and availability**: Generative AI models require large volumes of high-quality data. Ensuring data is clean, well-structured, and accessible can increase complexity.
- **Integration with existing systems**: Seamlessly integrating generative AI with existing IT infrastructure and business processes can be resource-intensive and technically challenging.
- **Ethical and compliance issues**: Addressing ethical concerns and ensuring compliance with legal and regulatory standards is crucial. This includes managing data privacy, avoiding biases in AI models, and maintaining transparency.
- **Skills and expertise**: Developing and managing generative AI solutions requires specialized skills. Organizations often need to invest in training their workforce or hiring new talent with the necessary expertise.
- **Cost and resource allocation**: Implementing generative AI can be costly. Organizations need to carefully manage their resources and often start with small, high-impact pilot projects to demonstrate value before scaling up.
- **Security concerns**: Ensuring the security of AI systems and protecting sensitive data from breaches is a critical challenge. This includes safeguarding against potential vulnerabilities in AI models and infrastructure.
- **User Interface design**: Creating intuitive and user-friendly interfaces that effectively leverage AI capabilities without overwhelming users can be difficult.

Addressing these challenges requires thorough planning, collaboration across different teams, and a strategic approach to integrating AI into business processes.

### The Well-Architected Framework approach

We recommend that you structure your well-architected workload to meet specific reliability, security, operational excellence, performance efficiency, and experience optimization objectives. To enhance user experiences and deliver consistency and reliability, follow architectural principles and guidelines that are specific to intelligent application workloads.

The Well-Architected Framework pillars help you implement modularity, separate roles, and improve operational productivity. Use a well-architected approach to create workloads without unnecessary complexities and unforeseen costs.

Use the Well-Architected Framework pillars to improve your intelligent application workload in the following ways:

- **Reliability**: An intelligent application workload requires resiliency at the architecture layer to ensure the AI models and workflows are highly available and can recover quickly from failures. This involves implementing robust error-handling mechanisms. Resiliency at the architecture layer also maintains the integrity of data used by AI models to ensure consistent and accurate outputs.

- **Security**: An intelligent application workload might handle sensitive data. Safeguard sensitive data used and generated by AI models by implementing access controls, and regular security audits. Ensure the workload complies with relevant regulation standards, such as GDPR or HIPAA, to protect user privacy and data.

- **Operational Excellence**: An intelligent application workload requires comprehensive monitoring and logging to track the performance and health of AI models, workflows and conversations. This helps in quickly identifying and resolving issues. Operational Excellence also recommends how to use automation to streamline operations, reduce manual intervention, and minimize the risk of human error.

- **Performance Efficiency**: An intelligent application workload needs to be designed to scale seamlessly with increasing data volumes and user demands. Identify key performance metrics and implement monitoring to track the progress towards achieving workload performance goals. In the context of intelligent application workloads, performance also refers to the amount of requests and interactions that can be completed in a self-service fashion that would otherwise be handled by a human.

- **Experience Optimization**: An intelligent application workload needs to have a focus on conversation design to be user-friendly and allow users to achieve their goals with minimal effort. The experience should account for topics the generative AI can't handle and have fallback mechanisms in place. Also implement mechanisms to gather user feedback and continuously improve the AI models and workload based on this feedback. 

## Assess technical and operational feasibility

Before you start developing your intelligent application workload with Power Platform assess technical and operational feasibility and identify risks and mitigation strategies.

You may also want to consider updating current workloads to use Generative AI capabilities - for example, when these capabilities can meet business needs at reduced costs. Consider modernizing based on the purpose of the application, life expectancy, supportability, cost, and service-level agreements (SLAs).

### Technical feasibility

#### Data availability and quality

High quality data ensures consistency and accuracy for the intelligent application workload. As part of your feasibility assessment, consider the following:

- **Source Identification**: Identify and catalog all potential data sources, including internal databases, external APIs, and third-party datasets. Ensure these sources are reliable and accessible.
- **Data Silos**: Identify if the current process uses any disparate data sources, like spreadsheets. The integration of this disparate data into the AI system may pose a challenge but is essential for providing accurate responses.
- **Data Volume and Variety**: Assess the volume and variety of data available. Generative AI models typically require large and diverse datasets to perform effectively. Ensure that the data sources can provide sufficient quantity and diversity to train and validate the models.
- **Data Cleaning**: Perform data cleaning to remove duplicates, correct errors, and handle missing values. This step is critical to ensure the data fed into AI models is accurate and reliable.
- **Data Transformation**: Transform raw data into a suitable format for AI model training. This may involve normalization, scaling, and encoding categorical variables.
- **Validation and Testing**: Regularly validate and test the data to ensure it meets the required quality standards. 

#### Integration requirements

Straightforward integration facilitates real-time data access and updates for the intelligent application workload. As part of your feasibility assessment, consider the following:

- **Existing Infrastructure**: Assess the compatibility of generative AI models with your current infrastructure. Assess if robust APIs are available for easy integration.
- **Integration Points**: Identify how your intelligent application workload will integrate with the required data sources. Assess if connectors or APIs are available

#### Technical complexity challenges

Accurate responses rely on a well-architected intelligent application workload. As part of your feasibility assessment, consider the following:

- **Crafting Effective Prompts**: Design precise and contextually relevant prompts to help guide the AI to produce accurate responses.
- **Regular Evaluation**: Implement continuous monitoring and testing of AI outputs to assess accuracy, relevance, and ethical adherence.
- **Feedback Loops**: Establish feedback mechanisms where users can report inaccuracies, which can then be used to refine and improve the models. Microsoft Copilot Studio provides [customer satisfaction analytics](/microsoft-copilot-studio/analytics-csat) that provide actionable insights on drivers of satisfaction or dissatisfaction with your copilot's responses.
- **Domain-Specific Training**: Fine-tune models on domain-specific data to enhance their accuracy in specific contexts.
- **Regular Updates**: Periodically update models with new data to maintain their relevance and accuracy.
- **Performance Metrics:** Establish clear performance metrics to evaluate the success and accuracy of AI responses.

### Operational feasibility

#### Resource availability

The success of your intelligent application workload depends on a the availability of a dedicated budget and team resources, supported by an AI-focused Center of Excellence (CoE). Consider the following:

- **Skill Assessment**: Assess the skills of your team members to identify any gaps that need to be filled through training or hiring.
- **Role Allocation**: Clearly define roles and responsibilities to ensure that each team member knows their tasks and how they contribute to the overall project.
- **Training and Development**: Invest in continuous training and development to keep the team updated with the latest AI technologies and methodologies.
- **Cost Estimation**: Begin with a detailed cost estimation that includes license cost, software and cloud services cost, and personnel costs. This helps in setting a realistic budget.

#### User adoption

The success of your intelligent application workload depends on users being comfortable using the system. Consider the following:

- **User-Centric Design**: Design the system to be intuitive and user-friendly. Complex interfaces can deter users, so simplicity and clarity are crucial. Ensure the system is accessible to all users.
- **Training**: Facilitate comprehensive training sessions and ongoing support.
- **Feedback Loops**: Establish feedback mechanisms where users can report inaccuracies, which can then be used to refine and improve the models.
- **Transparency and Trust**: Ensure end users know that they're using a workload that uses generative AI capabilities. Clearly communicate why an AI solution was chosen, how it's designed, and how it's monitored and updated.
- **Change Management**: Align the change with the organization’s culture and values. This can help in gaining broader acceptance and support. 

### Risks and mitigations

Data privacy concerns, potential biases in AI response, and technical failures are potential risks. Ensuring data privacy is critical, especially as the intelligent application workload might handle sensitive data. When planning an intelligent application workload with Power Platform, it's essential to address several key risks and implement effective mitigations:

- **Data Privacy**: Safeguard sensitive data used and generated by AI models. Implement encryption, access controls, and regular security audits. Ensure the workload complies with relevant regulation standards, such as GDPR or HIPAA, to protect user privacy and data.

- **Bias in AI Responses**: Use diverse and representative datasets to train AI models. Regularly audit and test models for bias. 

- **Technical Failures**: Design robust and scalable infrastructure with redundancy and failover mechanisms. Implement regular backups and disaster recovery plans.

- **Security Threats**: Employ advanced security measures such as multi-factor authentication, intrusion detection systems, and regular security audits. Keep software and systems updated to protect against vulnerabilities.

- **Ethical Concerns**: Establish clear ethical guidelines and governance frameworks for AI use. Ensure transparency in AI operations and maintain a human-in-the-loop approach for critical decisions.

- **Compliance and Regulatory Issues**: Stay informed about relevant regulations and ensure that AI systems comply with all legal requirements. Conduct regular compliance audits and update policies as needed.

## Next steps

Start by reviewing design principles.

> [!div class="nextstepaction"]
> [Design principles](design-principles.md)