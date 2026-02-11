---
title: Learning management app using Microsoft Learn content
description: Learn how to design a learning management solution using Microsoft Power Platform and Microsoft Learn content to enhance trainer and learner experiences.
#customer intent: As a business decision maker, I want to explore an example implementation of a learning management solution so that I can design a well-architected solution.
author: carcla
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 02/11/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
  - flowmaker
---

# Learning management app using Microsoft Learn content

In this article, you learn about a training system that uses integrations with Microsoft Learn and various Microsoft Power Platform services to improve trainer and learner experiences.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/app-learning-management/architecture.png" alt-text="Architecture diagram of the learning management solution." lightbox="media/app-learning-management/architecture.png":::

## Workflow

This solution uses a wide range of Power Platform resources to ensure up-to-date content is presented and proper assignment takes place.

1. **Content integrations**
    1. A Power Platform dataflow connects to the Microsoft Learn Catalog API and parses the request for Learning Paths and Modules.

    1. Microsoft Power Query is used to transform the data to prepare the data for ingestion into Microsoft Dataverse.

    1. Content is then upserted based on the last-modified date to ensure only deltas are uploaded to Dataverse.

1. **Model-driven app (Trainers)**
    1. Trainers access a model-driven app to create custom training plans based on the ingested Microsoft Learn content.

    1. Dashboards provide visibility to trainers for submitted trainings from learners for review and finalization.

1. **Process automation**
    1. Power Automate flows listen to any modified learning paths or modules to ensure the relationship between them stays consistent.

    1. From training assignment to learner submission, Power Automate creates notifications for both personas to ensure the lifecycle of training is communicated.

    1. Power Automate triggers when a training is assigned to create progress records to track completion percentage.

1. **Learner portal (Learners)**
    1. Employees access the Learner Power Page and authenticate by using Microsoft Entra ID single sign-on (SSO) authentication.

    1. Learners can view their training assignment, where they can check the content and length of training to help plan their self-paced training. They're redirected to Microsoft Learn to complete trainings. Once the learning path or module is complete, they update their assigned training as complete.

    1. Optionally, learners can browse, filter based on role, and self-assign trainings they're interested in through the Learning catalog.

## Scenario details

This use case is based on a company that wants to improve its visibility into employee training and reduce the time required to create training plans.

### Business problem

Training spans multiple systems and external tools. This causes low visibility, increases maintenance overhead, and confuses learners.

The company simply wants to view integrated content to remove the manual task of updating content and provide learners with the tools to accelerate their career.

## Components

[**Power Platform dataflows**](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365/): Dataflows enable customers to ingest, transform, and load data into Microsoft Dataverse environments.

[**Microsoft Dataverse**](/power-apps/maker/data-platform/): Dataverse lets you securely store and manage data used by business applications.

[**Microsoft Power Apps**](/power-apps/): Model-driven app design is an approach that focuses on adding components such as forms, views, charts, and dashboards to tables using an app designer tool.

[**Microsoft Power Pages**](/power-pages/): Power Pages is a secure, enterprise-grade platform for creating, hosting, and administering modern external-facing business websites.

[**Microsoft Power Automate**](/power-automate/): Power Automate helps you streamline your business processes and automate repetitive tasks to save time and improve efficiency.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- This design reduces content management overhead by using a ready-made API provided by Microsoft. It ensures resilient and consistent ingestion of Microsoft Learn catalog updates.
- Dataverse provides high availability and consistent data storage for trainers and learners.
- Power Automate ensures timely notification and alignment between content updates and training assignments.

### Security

- Microsoft Entra ID authentication enforces secure, governed access for employees.
- Uses secure connections and access controls to protect sensitive data.
- Dataverse enforces access control and governance.

### Performance Efficiency

- Dataflows scale horizontally and handle transformation of the Catalog API efficiently.
- Power Automate runs under load and scales to handle many learners or content updates.
- Server-side rendering and metadata-driven UI optimize performance.

### Experience Optimization

- Learners use a self-service portal that provides a learner-friendly interface for assignments and progress.
- Trainers use intuitive dashboards, views, and review workflows in a model-driven app experience.
- Content management integration builds confidence and reliability in the solution.

### Operational Excellence

- Dataflows provide predictable refresh cycles and observability.
- Trainers using model-driven applications support standardization and predictable processes.
- Automated flows enforce consistent lifecycle events and reduce manual work.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- [**Chris Mahanes**](https://www.linkedin.com/in/christophermahanes/), Solution Architect

## Related resources

- [Microsoft Learn Catalog API developer reference documentation](/training/support/catalog-api-developer-reference)
- [Create and use dataflows in Microsoft Power Platform](/power-query/dataflows/create-use)
- [Power Platform Well-Architected](/power-platform/well-architected/)
