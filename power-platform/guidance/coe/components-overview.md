---
title: "Components overview | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Components overview

Find an overview of each component included in the CoE starter kit here. Some are included in the solution package (called *Solution Aware*), and others live just outside of the package (*Non- Solution Aware*).

## Solution components

### Core Components

1. **Catalog tenant resources**
    1. CDS Entities: Environments, Apps, Flows
    1. Admin | Sync Template v2 (Flows) – all, Apps, Flows, Custom Connectors, Connectors, Model Driven Apps
    1. Admin | Sync Audit Log (Flow)
    1. Power BI Dashboard
    1. Custom Connector for Office 365 Audit Logs
    1. Power Platform Admin View (Model Driven App)
1. **DLP Strategy and Visibility**
    1. DLP Editor (Canvas App)
    1. DLP Customizer (Canvas App)
1. **Change App Ownership**
    1. Set New App Owner (Canvas App)

### Governance Components

1. Sample Audit Process
    1. Developer Compliance Center (Canvas App)
    1. Flow – Compliance detail request
    1. Business Process Flow for Auditing resources
1. Archive unused apps
    1. App Archive and Clean Up – Start Approval and Check Approval (Flows)
    1. App Archive and Clean Up Admin View (Model Driven App)
1. Act based on certain connector usage
    1. Find and add admins as owners for apps that leverage certain connectors (Flow)
    1. Find and disable flows that leverage certain connectors (Flow)

### Nurture Components

1. Onboard new makers, provide training and share best practices
    1. Admin | Welcome Email (Flow)
    1. Template Catalog (Canvas App)
    1. Admin | Newsletter with Product Updates (Flow)
    1. Training in a day Management and Registration (Canvas Apps)
    1. Training in a day Feedback Reminder, Registration Confirmation and Reminder (Flow)
1.Encourage Adoption
    1. App Catalog (Canvas App)

## Common Data Service Entities

These entities are defined in the solution package.

### Core Components Entities

- **Environment**
Represents the Environment object, which contains Power Apps, Flows and Connectors. 
- **PowerApps App**
Represents a Power Apps App.
- **Flow** Represents a flow.
- **PowerApps Connector** Represents a standard or custom connector.
- **Connection Reference** The linking table for the many to many relationships between Connectors (PowerApps Connector) and flows (Flow) / Power Apps (PowerApps App)
- **Maker** Represents a user who has created a Power App, flow, Custom Connector or Environment.
- **Audit Log** Represents session details for Power Apps.
- **CoE Settings** Settings configurations live in a record here. This is an important entity to populate data into during the setup process, because it contains details that are important for configuring the branding and support aspect of the solution
- **Sync Flow Errors** Represents daily occurrence of Sync Flow errors to provide a summary email to admin

### Governance Components Entities

- **Archive Approval** Represents archival approval tasks started during the App Archive and Clean Up Flow

### Nurture Components Entities

- **InADayAttendees** Represents attendees that have registered for a Training in a day course using the Training in a day registration canvas app
- **InADayEvent** Represents training events available and created through the Training in a day management canvas app

## Security Roles

- **Power Platform Admin SR** Gives full access to create, read, write and delete operations on the custom entities.

- **Power Platform Maker SR** Gives read and write access to the custom entities (e.g., Environments, Apps, etc).

- **Power Platform User SR**  Gives read only access to the resources in the custom entities.
