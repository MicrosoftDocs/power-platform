---
title: Responsible AI considerations for intelligent application workloads
description: Responsible AI TODO 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Responsible AI considerations for intelligent application workloads

Implementing intelligent application workloads must adhere to responsible AI principles to ensure fairness, accountability, transparency, and ethical behavior.

Design the AI system to treat all users equitably, holding the developers and users accountable for its performance, ensuring transparency in AI operations and adhering to ethical standards.

At Microsoft, we're committed to the advancement of AI driven by principles that put people first. Generative models have significant potential benefits, but without careful design and thoughtful mitigations, such models have the potential to generate incorrect or even harmful content. Microsoft made significant investments to help guard against abuse and unintended harm, which includes incorporating Microsoft’s [principles for responsible AI use](https://www.microsoft.com/ai/responsible-ai?activetab=pivot1:primaryr6), adopting a [Code of Conduct](/legal/cognitive-services/openai/code-of-conduct?context=/azure/ai-services/openai/context/context) for use of the service, building content filters to support customers, and providing responsible AI [information and guidance](/legal/cognitive-services/openai/transparency-note?context=%2Fazure%2Fai-services%2Fopenai%2Fcontext%2Fcontext&tabs=image) that customers should consider when using generative AI. Copilot for Power Platform features follow a set of core security and privacy practices and the [Microsoft Responsible AI Standard](https://www.microsoft.com/ai/principles-and-approach). Power Platform data is protected by comprehensive, industry-leading compliance, security, and privacy controls.

Learn more:

- [Microsoft AI principles](https://www.microsoft.com/ai/responsible-ai)
- [Microsoft responsible AI resources](https://www.microsoft.com/ai/responsible-ai-resources)
- [Microsoft Azure Learning courses on responsible AI](/training/paths/responsible-ai-business-principles/)
- [Responsible AI FAQs for Copilot Studio](/microsoft-copilot-studio/responsible-ai-overview)
- [Overview of Responsible AI practices for Azure OpenAI models](/legal/cognitive-services/openai/overview)

## Core principles of responsible AI

Ensuring that an intelligent application workload built with Power Platform adheres to the core principles of responsible AI of fairness, accountability, transparency, and ethics involves several key practices:

- **Fairness**: Use diverse and representative training data to minimize biases. Regularly update training data and involve auditors to validate fairness and equity.
- **Accountability**: Define clear roles and responsibilities for team members involved in the AI project. Establish and adhere to ethical standards that prioritize fairness and accountability.
- **Transparency**: Ensure end users know that they're using a workload that uses generative AI capabilities. Clearly communicate why an AI solution was chosen, how it was designed, and how it's monitored and updated.
- **Ethics**: Foster an inclusive workforce and seek input from diverse communities early in the development process. Regularly assess and test models for ethical concerns and disparities in performance. Establish a governance framework that includes regular audits.

By integrating these practices into your development and deployment processes, you can build an intelligent application workload that aligns with the core principles of responsible AI.

## Data privacy and security

Ensuring data privacy is critical, especially as the intelligent application workload might handle sensitive data. When planning an intelligent application workload with Power Platform, it's essential to address several key risks and implement effective mitigations:

- **Platform Features**: Understand native controls and platform features that safeguard your data. Copilot is built on [Microsoft Azure OpenAI Service](/azure/cognitive-services/openai/overview) and runs completely within the Azure cloud. Copilot uses OpenAI models with all the [security capabilities of Microsoft Azure](/azure/security/fundamentals/overview). Copilot is integrated in Microsoft services like Dynamics 365 and Power Platform and inherits their security, privacy, and compliance policies and processes, such as multifactor authentication and compliance boundaries.
- **Data Encryption**:  Service-side technologies encrypt organizational content at rest and in transit for robust security. Connections are safeguarded with Transport Layer Security (TLS), and data transfers between Dynamics 365, Power Platform, and Azure OpenAI occur over the Microsoft backbone network, ensuring both reliability and safety. [Learn more about encryption in the Microsoft Cloud](/purview/office-365-encryption-in-the-microsoft-cloud-overview).
- **Access Controls**: Data is provided to Copilot based on the access level of the current user. Implement role-based access control (RBAC) using Microsoft Entra ID to ensure only authorized users can access data. Apply the principle of least privilege to limit access to only what is necessary.
- **Monitoring and Auditing**: Detect and respond to potential security incidents by regularly monitoring access and usage of the AI system. Maintain detailed audit logs to track data access and modifications.
- **Compliance and Governance**: Ensure compliance with relevant data privacy regulations such as GDPR, HIPAA, and CCPA. Implement ethical AI practices to avoid biases and ensure fairness in AI outputs.
- **User Education and Training**: Train users on security best practices and the importance of data privacy. Keep users informed about updates and changes to security policies and procedures.

Learn more: [FAQ for Copilot data security and privacy](/power-platform/faqs-copilot-data-security-privacy)

## Bias awareness and mitigation

Recognize the importance of addressing biases in the system and ensure fairness to avoid biases in AI responses.

- **Diverse and Representative Data**: Ensure that the training data is diverse and representative of different demographics to minimize inherent biases. Regularly audit the data for biases and imbalances, and take corrective actions as needed.
- **Bias Detection and Mitigation Tools**: Use tools and techniques to detect biases in the AI models. This includes statistical analysis and fairness metrics. Implement debiasing techniques such as resampling, reweighting, or adversarial debiasing to reduce biases in the models.
- **Human-in-the-Loop**: Incorporate human review and feedback loops to identify and correct biases that the AI might introduce. Establish an ethics committee or governance board to oversee AI development and deployment, ensuring ethical standards are met.
- **Transparency and Trust**: Ensure end users know that they're using a workload that uses generative AI capabilities. Clearly communicate why an AI solution was chosen, how it's designed, and how it's monitored and updated.
- **Continuous Monitoring and Improvement**: Continuously monitor the AI system for biases and performance issues, and update the models as needed. Ensure models remain fair and unbiased by regularly retraining models with updated and more diverse data.

## Ongoing monitoring and evaluation

Continue improving your intelligent application workload. Establish a framework for continuous monitoring and evaluation, and incorporate user feedback and evolving ethical standards into updates.

- **Feedback Loops**: Establish feedback mechanisms where users can report inaccuracies, which can then be used to refine and improve the models.
- **Monitoring and Auditing**: Detect and respond to potential security incidents by regularly monitoring access and usage of the AI system. Maintain detailed audit logs to track data access and modifications.

<!-- NOTE: I've copied this from https://learn.microsoft.com/en-us/legal/cognitive-services/openai/overview?context=%2Fazure%2Fai-services%2Fopenai%2Fcontext%2Fcontext at the very bottom of the page- not sure if this is something we need to include -->

> [!NOTE]
> This document is not intended to be, and should not be construed as providing, legal advice. The jurisdiction in which you're operating may have various regulatory or legal requirements that apply to your AI system. Consult a legal specialist if you are uncertain about laws or regulations that might apply to your system, especially if you think those might impact these recommendations. Be aware that not all of these recommendations and resources are appropriate for every scenario, and conversely, these recommendations and resources may be insufficient for some scenarios.
