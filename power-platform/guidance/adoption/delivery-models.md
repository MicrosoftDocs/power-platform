---
title: "Delivery models - Microsoft Power Platform | MicrosoftDocs"
description: "Depending on the size of your organization, you might want to formalize your Microsoft Power Platform adoption approach by implementing a structured organization model."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Delivery models

Depending on the size of your organization, you might want to formalize your Microsoft Power Platform adoption approach by implementing a structured organization model. You should consider the following ways to structure your team and decide what is the best fit for your situation and organization.

Microsoft Power Platform has four delivery models, but each of these is just a mental model—every organization has a variation of multiple models along this continuum. For example, even if you opt for a centralized model, where all requirements are coming into a central delivery team, you'll still have citizen developers discovering the platform and building apps for their teams. So you'll have elements of matrix or BizDevOps regardless.

These models can help you consider what your current software delivery model is and how Microsoft Power Platform might overlay into it, or how your current model might evolve to accommodate the rapid development capability enabled by Microsoft Power Platform.

![Delivery models](media/delivery-models.png "Delivery models")

## Decentralized

In this model, you can create multiple teams across the organization that are close to the day-to-day running of various teams. They'll have resources to deliver apps consistently within organizational guidelines. Each team can run autonomously, and they can split and grow in cellular fashion. However, with this model, you'll still need centralized governance to apply some high-level digital guardrails to ensure corporate compliance. These can include things like data loss prevention (DLP) governance, connector management, and license management to ensure users and developers can safely build and release solutions with minimal intervention from IT, while keeping company data safe and compliant. This is a great self-service option.

## Centralized  

In this model, you create central teams of product owners who own the low-code delivery of departmental solutions from around the organization's business units. Professional developers owning code-first solutions will work in tandem with the business to deliver in a shared model. Enterprise architects will own the middle tier and services, and ensure data is available to makers. Central IT will own the licensing and systems in which everyone operates.

With this model, you create a central team that can pick up development of apps based on organizational priorities. Additionally, because they would have foundational expertise in Power Apps, your team will include members who specialize in specific parts of Microsoft Power Platform such as Power Automate, Power BI, and the Power Apps component framework, or they could specialize in third-party integration and artificial intelligence. This model is an effective way to drive change across your organization and is the best way to deliver any type of application.

Here is a digital briefing from Schlumberger depicting this type of model having grown through both decentralized and matrixed models. Learn more about how Schlumberger is adopting the Power Platform: [Prolific app maker ignites low code revolution at Schlumberger](https://powerapps.microsoft.com/blog/schlumberger/)

| Type of application delivery | Delivery model type | Build time of the application | Lifetime of the application | Examples | IT engagement |
|---|----|----|---|----|----|
| Self-service | Any | 1-2 weeks | 6-12 months | Small, departmental or LOB solutions. | Decentralized IT |
| Small teams | Matrixed/Centralized | 3-6 months | 6-24 months | Small teams working to deliver medium solutions or multiple-department solutions. | Decentralized IT |
| Multiple-department or large line-of-business solutions | Matrixed/Centralized | 3-6 months | 6-24 months | Large matrixed teams working to deliver medium and large solutions or intra-department solutions. | Centralized IT |
| Large-scale product delivery | Centralized | 1-2 years | 5-7 years | Large product deliveries across an enterprise leveraging a mixture of low-code and code-first Power Apps solutions along with vendor and first-party solutions. | Centralized IT |
| Large enterprise vendor delivery | Centralized | 7 years | 10-15 years | Surround strategy for a third-party system of record and support framework. For example, SAP implementation and surrounding it with a mixture of low-code and code-first solutions in Power Apps and other Microsoft and third-party integrations. | Centralized IT |

## Matrix

With this model, you mix the best of decentralized and centralized. You have a centralized team of trained and certified Microsoft Power Platform specialists. You'll have leaders of change, design, delivery, and architecture, in addition to specialized trainers to train local teams across the organization. Local teams made up of citizen developers are connected with experts from the centralized structure, to make sure nothing is getting lost in translation between the people doing their day-to-day jobs and using the apps that are being built. With this model, you can scale into the thousands of people working on app creation.

This team should also consider the notion of a Center of Excellence to manage their data estate and deploy solutions with guidelines for everyone. This works well for self-service and small teams to deliver options quickly with little IT engagement.

## BizDevOps

Rapid app development can only happen at the speed that operations such as IT can support the apps created. BizDevOps is a holistic relationship between app makers and operations that works in a virtuous loop. For this to work, all teams need to have a clear vision of the digital culture the organization is moving toward. To get the maximum value from the apps created, they need reliable support, governance, and maintainability. As technology evolves, updates will need to be made on the apps to keep them current. Not only being aware of change, but having a plan for managing it, is a key to successful apps.
