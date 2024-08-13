---
title: Overview of intelligent applications
description: Learn how architecture patterns, design areas, and architecture layers relate to well-architected Power Platform workloads that use generative AI features
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Overview of Intelligent applications

This article provides Well-Architected Framework best practices for an intelligent application workloads. Application owners, Power Platform administrators, business stakeholders, and architects can use this guidance to create a technical foundation for their intelligent application workloads.

>[!TIP]
>To assess your workload through the lenses of reliability, security, operational excellence, performance efficiency, and experience optimization see the [Power Platform Well-Architected Assessment](https://aka.ms/powa/assessment).

## What is an intelligent application workload?

The term _workload_ is used to describe a set of application resources, data, and supporting infrastructure that work together to deliver desired business outcomes. A workload comprises application and technology components as well as behavioral, development, and operational processes.

Generative AI is an artificial intelligence technology that uses large language models (LLMs) to generate original content and provide natural language understanding and responses. For details, see Technology guidance > [Generative AI](/ai/playbook/technology-guidance/generative-ai/).

A Generative AI Power Platform workload leverages the capabilities of Microsoft’s Power Platform to integrate and utilize generative AI models for automating and enhancing business processes.

## What are the common challenges?

Developing Power Platform workloads that use Generative AI features can be complex and presents several challenges. Here are some of the most common ones:

- **Data quality and availability**: Generative AI models require large volumes of high-quality data. Ensuring data is clean, well-structured, and accessible can increase complexity.
- **Integration with existing systems**: Seamlessly integrating generative AI with existing IT infrastructure and business processes can be resource-intensive and technically challenging.
- **Ethical and compliance issues**: Addressing ethical concerns and ensuring compliance with legal and regulatory standards is crucial. This includes managing data privacy, avoiding biases in AI models, and maintaining transparency.
- **Skills and expertise**: Developing and managing generative AI solutions requires specialized skills. Organizations often need to invest in training their workforce or hiring new talent with the necessary expertise.
- **Cultural resistance and change management**: Employees may resist adopting new AI technologies due to fears of job displacement or changes in established workflows. Effective change management strategies are essential to ease this transition.
- **Cost and resource allocation**: Implementing generative AI can be costly. Organizations need to carefully manage their resources and often start with small, high-impact pilot projects to demonstrate value before scaling up.
- **Security concerns**: Ensuring the security of AI systems and protecting sensitive data from breaches is a critical challenge. This includes safeguarding against potential vulnerabilities in AI models and infrastructure.
- **User Interface design**: Creating intuitive and user-friendly interfaces that effectively leverage AI capabilities without overwhelming users can be difficult.

Addressing these challenges requires thorough planning, collaboration across different teams, and a strategic approach to integrating AI into business processes.

### The Well-Architected Framework approach

We recommend that you structure your well-architected workload to meet specific reliability, security, operational excellence, performance efficiency, and experience optimization objectives. To enhance user experiences and deliver consistency and reliability, follow architectural principles and guidelines that are specific to Generative AI Power Platform workloads.

The Well-Architected Framework pillars help you implement modularity, separate roles, and improve operational productivity. Use a well-architected approach to create workloads without unnecessary complexities and unforeseen costs.

Use the Well-Architected Framework pillars to improve your Generative AI Power Platform workload in the following ways:

- **Reliability**: A Generative AI Power Platform workload requires resiliency at the architecture layer to ensure the AI models and workflows are highly available and can recover quickly from failures. This involves building redundancy and implementing robust error-handling mechanisms. Resiliency at the architecture layer also maintains the integrity of data used by AI models to ensure consistent and accurate outputs.

- **Security**: A Generative AI Power Platform workload might handle sensitive data. Safeguard sensitive data used and generated by AI models. Implement encryption, access controls, and regular security audits. Ensure the workload complies with relevant regulation standards, such as GDPR or HIPAA, to protect user privacy and data.

- **Operational Excellence**: A Generative AI Power Platform workload requires comprehensive monitoring and logging to track the performance and health of AI models, workflows and conversations. This helps in quickly identifying and resolving issues. Operational Excellence also recommends how to use automation to streamline operations, reduce manual intervention, and minimize the risk of human error. Ensure that your Generative AI Power Platform workload meets operational excellence standards. 

- **Performance Efficiency**: A Generative AI Power Platform workload needs to be designed to scale seamlessly with increasing data volumes and user demands. You must also manage costs. 

- **Experience Optimization**: A Generative AI Power Platform workload needs to have a focus on conversation design to be user-friendly and allow users to achieve their goals with minimal effort. The experience should account for topics the generative AI can't handle and have fallback mechanisms in place. Also implement mechanisms to gather user feedback and continuously improve the AI models and workload based on this feedback. 

## Assess technical and operational feasibility

Before you start developing your Generative AI Power Platform workload assess technical and operational feasibility and identify risks and mitigation strategies.

You may also want to consider updating current workloads to use Generative AI capabilities - for example, when these capabilities can meet business needs at reduced costs. Consider modernizing based on the purpose of the application, life expectancy, supportability, cost, and service-level agreements (SLAs).

### Technical feasibility

#### Data availability and quality

High quality data ensures consistency and accuracy for the Generative AI Power Platform workload. As part of your feasibility assessment, consider the following:

- **Source Identification**: Identify and catalog all potential data sources, including internal databases, external APIs, and third-party datasets. Ensure these sources are reliable and accessible.
- **Data Silos**: Identify if the current process uses any disparate data sources, like spreadsheets. The integration of this disparate data into the AI system may pose a challenge but is essential for providing accurate responses.
- **Data Volume and Variety**: Assess the volume and variety of data available. Generative AI models typically require large and diverse datasets to perform effectively. Ensure that the data sources can provide sufficient quantity and diversity to train and validate the models.
- **Data Cleaning**: Perform data cleaning to remove duplicates, correct errors, and handle missing values. This step is critical to ensure the data fed into AI models is accurate and reliable.
- **Data Transformation**: Transform raw data into a suitable format for AI model training. This may involve normalization, scaling, and encoding categorical variables.
- **Validation and Testing**: Regularly validate and test the data to ensure it meets the required quality standards. 

#### Integration requirements

Straightforward integration facilitates real-time data access and updates for the Generative AI Power Platform workload. As part of your feasibility assessment, consider the following:

- **Existing Infrastructure**: Assess the compatibility of generative AI models with your current infrastructure. Assess if robust APIs are available for easy integration.
- **Integration Points**: Identify how Generative AI will integrate with the required data sources. Assess if connectors or APIs are available

#### Technical complexity challenges

Accurate responses rely on a well-architected Generative AI Power Platform workload. As part of your feasibility assessment, consider the following:

- **Crafting Effective Prompts**: Design precise and contextually relevant prompts helps guide the AI to produce accurate and relevant responses.
- **Regular Evaluation**: Implement continuous monitoring and testing of AI outputs to assess accuracy, relevance, and ethical adherence.
- **Feedback Loops**: Establish feedback mechanisms where users can report inaccuracies, which can then be used to refine and improve the models.
- **Domain-Specific Training**: Fine-tune models on domain-specific data to enhance their accuracy in specific contexts.
- **Regular Updates**: Periodically update models with new data to maintain their relevance and accuracy.
- **Performance Metrics:** Establish clear performance metrics to evaluate the success and accuracy of AI responses

### Operational feasibility

#### Resource availability

The success of your Generative AI Power Platform workload depends on a the availability of a dedicated budget and team resources, supported by an AI-focused CoE. Existing teams have ongoing commitments, necessitating careful planning. As part of your feasibility assessment, consider the following: 


#### User adoption

### Risks and mitigations


## What are the key design areas?