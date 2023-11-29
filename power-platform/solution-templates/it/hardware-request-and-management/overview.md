---
title: Hardware Request and Management template for Power Platform
description: Learn about Microsoft's Hardware Request and Management template for Microsoft Power Platform.
author: tverhasselt
ms.author: thoverh
contributors:
  - microsoft-george
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 11/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Hardware Request and Management template for Power Platform

The Hardware Request and Management template enables your organization to digitize and automate asset requests and management.

Employees can request new hardware, such as laptops, keyboards, and monitors.

Program admins or managers can perform several functions, such as:

- Configure a hardware product catalog and business and budget units with respective approvers
- Use copilot (AI) and Microsoft Teams embedded capabilities to process asset requests
- View interactive dashboards to oversee the employee request process and monitor and manage the asset inventory

When employees make requests for new hardware, the requests are reviewed and processed by program admins leveraging insights, AI (copilot), and Microsoft Teams embedded capabilities.

The Hardware Request and Management template is available two ways.

- [Microsoft AppSource](<https://aka.ms/HardwareRequestAndManagementTemplate>).
- [Templates for Power Platform] project site on GitHub(<https://aka.ms/PowerPlatformTemplateSupport>)

The template package consists of two solutions:

- **IT Base** contains common foundational components that all IT template solutions use. For now, this is limited to components that limit localization and integration error handling capabilities. By sharing this across solutions, common strings can be localized once the base solution and all dependent solutions get the benefit. Errors across all IT solutions can also be monitored.

- **Hardware Request and Management** contains all the components needed to enable the Hardware Request and Management experience in your organization.

## Hardware Request and Management solution components

The Hardware Request and Management solution file contains the following Power Platform capabilities that can easily be customized to fit your own organizational requirements:

### Hardware Request app

Allow any organization employee to request new hardware and to see a list of their current assigned hardware assets in this canvas app.

:::image type="content" source="media/overview/hrm-overview-requestapp.png" alt-text="Screenshot of Hardware Request list in the Hardware Request canvas app.":::
More information: [Overview of building canvas apps](/power-apps/maker/canvas-apps/getting-started)

### Hardware Management app

Allow hardware managers and business approvers to process employee requests for hardware and asset inventory in this model-driven app.

:::image type="content" source="media/overview/hrm-overview-hmapp.png" alt-text="Screenshot of the Hardware Management model-driven app.":::

More information: [Overview of building a model-driven app with Power Apps](/power-apps/maker/model-driven-apps/model-driven-app-overview)

### Power Automate approvals in Teams

Approve or reject hardware requests directly in Microsoft Teams.

:::image type="content" source="media/overview/hrm-overview-teams.png" alt-text="Screenshot of Power Automate approvals in Teams.":::
More information: [Get started with approvals](/power-automate/get-started-approvals)

### Cards for Power Apps

Get notified on key process milestones and interact via chat using Microsoft Teams-base collaboration.

:::image type="content" source="media/overview/hrm-overview-teamschat.png" alt-text="Screenshot of approvals in Teams.":::

More information: [Cards for Power Apps overview](/power-apps/cards/overview)

### Copilot

Get your questions answered and mange your organization's hardware data with an AI-powered assistant.

:::image type="content" source="media/overview/hrm-overview-copilot.png" alt-text="Screenshot of Copilot in the Hardware Request and Management app.":::

More information: [Add Copilot to model-driven apps](/power-apps/maker/model-driven-apps/add-ai-copilot)

### Interactive dashboards

Stay on top of the request volume using interactive dashboards.

More information: [Create and configure model-driven app interactive experience dashboards](/power-apps/maker/model-driven-apps/configure-interactive-experience-dashboards)

### Power BI report

Get insights on hardware budget spend and assets procured by your organization using Power BI embedded reports.

More information: [Create or edit a Power BI embedded system dashboard](/power-apps/maker/model-driven-apps/create-edit-powerbi-embedded-page)

### Power Automate cloud flows

Automate processes to manage data and notifications across key process milestones.

More information: [Overview of the cloud flows](/power-automate/overview-cloud)

### Dataverse

Dataverse storage powering intelligent search and role based security access to data in an effortless way.

More information: [What is Microsoft Dataverse?](/power-apps/maker/data-platform/data-platform-intro)

## Next steps

[Install and set up the Hardware Request and Management template](install-and-set-up.md)
