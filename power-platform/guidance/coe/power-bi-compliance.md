---
title: Compliance and Adoption with the CoE Power BI dashboard
description: "The Compliance and Adoption Power BI dashboard gives you the ability to review compliance, security and governance statistics and gain further adoption insights."
author: manuelap-msft

ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/02/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Compliance and Adoption with the CoE Power BI dashboard

>[!IMPORTANT]
> The reports on this page are part of a separate dashboard, **PowerPlatformGovernance_CoEDashboard_MMMYY.pbit**. See: [Setup Power BI dashboard](setup-powerbi.md).

The **Compliance and Adoption** dashboard highlights governance, compliance and security insights, allows you to gain a high level view into your adoption and provides a tech debt report of the [Default environment](/power-platform/admin/environments-overview#the-default-environment).

## Compliance and Governance

The **Compliance and Governance insights** page provides you with a tenant-wide overview of:

- Apps and flows without an owner
- Apps and flows not in solutions
- Apps and flows with duplicate names
- Apps and flows with test, demo, template in the name
- Apps, flows, and environments with open [compliance details requests](example-processes.md)
- Apps currently not compliant with DLP policies or billing policies
- Grandfathered apps
- Apps shared with everyone and apps shared with more than 100 users
- Apps not launched in the last month and in the last quarter
- Quarantined apps
- Suspended flows
- Flows using plain text passwords
- Flows using HTTP actions
- Flows pending suspension
- Cross-tenant connections
- Environments with no apps or flows
- Custom connectors using HTTP environments
- Non-managed environments

:::image type="content" source="media/pbi-compliance1.png" alt-text="Compliance and Governance insights":::

From each card, you can drill-through to a list of apps, flows, or environments matching the selected criteria.

:::image type="content" source="media/pbi-compliance2.png" alt-text="Compliance and Governance drill-through":::

From the detail page, you can get more information about the resource and navigate to the admin center or email the maker.

:::image type="content" source="media/pbi-compliance3.png" alt-text="Compliance and Governance details":::

## Adoption insights

The **Adoption insights** page provides you with a tenant-wide overview of:

- Apps launched this month and this quarter
- Unique users in the past month
- Total makers
- Top 5 connectors used in apps and flows
- Top 5 most launched apps
- Top 5 makers with the most launched apps
- Top 5 countries/regions where makers create most launched apps
- Top 5 environments that consume the most capacity

## Default environment

The **Default environment** page gives you an overview of adoption in the default environment, with the intent to help clean up tech debt in this environment and highlight highly adopted resources that may need to be migrated to a production environment.

- Apps and flows without an owner
- Apps currently not compliant with DLP policies or billing policies
- Grandfathered apps
- Apps shared with everyone and apps shared with more than 100 users
- Suspended flows
- Flows using plain text passwords
- Top 5 most launched apps
- Top 5 most shared apps
- Latest non-compliant apps
- Latest suspended flows

:::image type="content" source="media/pbi-compliance5.png" alt-text="Default environment tech debt insights.":::
