---
title: "About Common Data Service   | MicrosoftDocs"
description: About Common Data Service 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/05/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# About Common Data Service 

The Common Data Service is a cloud scale database used to securely store data for business applications built on Power Apps. Common Data Service is an abstraction on top of underlying Azure cloud data management services to make it easier to build business applications. Common Data Service provides not just data storage, but a way to implement business logic that enforces business rules and automation against the data. Data in Common Data Service is organized as entities, for example account and contact would be two examples of entities. These entities can have relationships that define the business connection between the data stored in an entity. For example, John works for Contoso would be expressed as a relationship. The security model of Common Data Service enables data protection down to the field level on individual records. A more thorough discussion of security will be covered in the security section.

Common Data Service databases are created in the context of a Power Apps environment. Each environment can have only a single Common Data Service database. Common Data Service databases can be provisioned by you or licensed individuals in your organization to support their custom applications. Common Data Service databases are also automatically provisioned when a model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, is added to your tenant.

### See also
[Microsoft Learn: Get started with Common Data Service](https://docs.microsoft.com/learn/modules/get-started-with-powerapps-common-data-service/)<br />
[Environments overview](environments-overview.md)<br />
[Create and manage environments in the Power Apps Admin center](create-environment-powerapps.md)
