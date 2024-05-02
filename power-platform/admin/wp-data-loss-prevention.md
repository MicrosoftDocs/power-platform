---
title: "Data loss prevention policies  | MicrosoftDocs"
description: About data loss prevention (DLP) policies.
ms.component: pa-admin
ms.topic: overview
ms.date: 05/01/2024
author: laneswenka
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Data policies 
Data Loss Prevention (DLP) is a critical aspect of maintaining data security and compliance within the Microsoft Power Platform ecosystem. It encompasses various measures and tools aimed at preventing the unauthorized disclosure or leakage of sensitive information, also known as exfiltration.  A core component of Power Apps, Power Automate, and Copilot Studio is the use of Connectors to enumerate, populate, push, and pull data.  **Data policies** in Power Platform admin center allow administrators to control access to these Connectors in various ways to help reduce risk in your organization.

In this overview, we will touch on some high level concepts related to Connectors, and several important considerations to take in to account when setting up your policies or making policy changes. 

## Connectors
Connectors at their most basic level are nothing but strongly-typed representations of restful application programming interfaces, also known as APIs.  For example, the Power Platform API provides several operations related to functionality in Power Platform admin center:
[image1]

When wrapping this API in to a connector, it becomes much easier for makers and citizen developers to utilize in their low code apps, workflows, and chatbots. For example, the Power Platform for Admins V2 connector is the representation of Power Platform API:
[image2]

There are several types of connectors that we will enumerate below, as each has capabilities within data policies.

## Certified Connectors
Certified Connectors refer to connectors that have undergone rigorous testing and certification processes to ensure they meet Microsoft's standards for security, reliability, and compliance. These connectors provide users with a reliable means of integrating with other Microsoft services as well as external services - all while maintaining data integrity and security.

For more information on certified connectors, please refer to the [Certification Submission Guidelines](/connectors/custom-connectors/submit-certification.md).

## Custom Connectors
Custom Connectors allow makers to create their own connectors to integrate with external systems or services not covered by the standard set of certified connectors. While offering flexibility and customization options, custom connectors also require careful consideration to ensure they comply with data policies and do not compromise data security.

Learn more about [creating and managing custom connectors](/connectors/custom-connectors).

## Virtual Connectors
Virtual Connectors are connectors that are shown in data policies for administrators to control, however they are not based on a restful API.  The proliferation of virtual connectors has stemmed from data policies being one of the most popular governance controls in Power Platform, however over time more of these types of "on/off" capabilities will surface as rules within [Environment Groups](power-platform/admin/environment-groups.md).

Several virtual connectors are provided for governing Microsoft Copilot Studio. These connectors facilitate the ability to disable various features of Copilots and chatbots.

Explore Virtual Connectors and their role in [data loss prevention in Microsoft Copilot Studio](microsoft-copilot-studio/admin-data-loss-prevention.md).

## Design-Time Blocking and Runtime Blocking
Design-Time Blocking involves preventing makers from inadvertently including sensitive data or violating data policies while building an app or workflow. Runtime Blocking, on the other hand, prevents the execution of apps or flows that have already been built if they violate data policies.

## Latency Considerations
It's essential to consider the latency associated with DLP enforcement for various workloads within the Power Platform. Changes in data policies may impact design-time blocking and runtime blocking differently across different services such as Power Apps, Power Automate, and Copilot Studio. Below is a table summarizing the latency for each workload:

| Workload | Design-time Block Latency | Runtime Block Latency | 
|--------------|--------------|-------------------|
| Power Apps | | |
| Power Automate | | |
| Copilot Studio | | |


### See also

[Create a data loss prevention (DLP) policy](create-dlp-policy.md) <br />
[Manage data loss prevention (DLP) policies](prevent-data-loss.md) <br />
[Data loss prevention (DLP) policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
