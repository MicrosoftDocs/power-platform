---
title: Tenant level special licenses overview for Microsoft Power Platform | Microsoft Docs
description: Overview of assigning tenant level special licenses in Microsoft Power Platform (Power Apps, Power Automate, Power Virtual Agents, Power BI, AI Builder, Dataverse, portals).
author: srpoduri
ms.topic: overview
ms.date: 02/21/2023
ms.subservice: admin
ms.author: srpoduri
ms.reviewer: kvivek
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Tenant level special licenses overview for Microsoft Power Platform 
If a tenant administrator activates any one of the following SKUs, then all users in the tenant (active and guest) become eligible to be synced into all Dataverse environments in the tenant. Access to the users will be granted at runtime when the user accesses the Dataverse environment. In addition, the user’s access mode is set to Read-Write in Dataverse.
You can view a list of all assigned licenses in the [Microsoft Admin Center](https://admin.microsoft.com)

> [!NOTE]
> User must still be assigned a security role in Dataverse before they can access any data in Dataverse.
> 

|Plan Name   | SKU ID  | Capability String  |
|---|---|---|
| Dynamics 365 for Marketing  | 00b861da-8087-4e30-beb8-8db3c6d9581e  | DYN365_MARKETING_APP  |
| Dynamics 365 for Marketing Attach  | 85430fb9-02e8-48be-9d7e-328beb41fa29  | DYN365_MARKETING_APP_ATTACH  |
| Project Plan 3  | 53818b1b-4a27-454b-8896-0dba576410e6  | PROJECTPROFESSIONAL  |
| Project Plan 3 (for Department)  | 46102f44-d912-47e7-b0ca-1bd7b70ada3b  | PROJECT_PLAN3_DEPT  |
| Project Plan 3 for faculty  | 46974aed-363e-423c-9e6a-951037cec495  | PROJECTPROFESSIONAL_FACULTY  |
| Project Plan 3 for students  | ef3a3775-8287-4df8-ba28-8ab34902710a  | PROJECTPROFESSIONAL_STUDENT  |
| Project Plan 5  | 09015f9f-377f-4538-bbb5-f75ceb09358a  | PROJECTPREMIUM  |
| Project Plan 5 for faculty  | 930cc132-4d6b-4d8c-8818-587d17c50d56  | PROJECTPREMIUM_FACULTY  |
| Project Plan 5 for students  | 149f0db2-7fde-45fa-80fa-7716317772c5  | PROJECTPREMIUM_STUDENT  |
| Project Plan 1  | beb6439c-caad-48d3-bf46-0c82871e12be  | PROJECT_P1  |
| Project Plan 1 (for Department)  | 84cd610f-a3f8-4beb-84ab-d9d2c902c6c9  | PROJECT_PLAN1_DEPT  |
| Project Plan 3 for GCC  | 074c6829-b3a0-430a-ba3d-aca365e57065  | PROJECTPROFESSIONAL_GOV  |
| Project Plan 5 for GCC  | f2230877-72be-4fec-b1ba-7156d6f75bd6  | PROJECTPREMIUM_GOV  |
