---
title: Data policies
description: You can create data policies that can act as guardrails to help reduce the risk of users from unintentionally exposing organizational data.
ms.component: pa-admin
ms.topic: overview
ms.date: 04/07/2026
author: laneswenka
ms.subservice: admin
ms.author: laswenka
ms.reviewer: mkaur
ms.custom: "admin-security"
search.audienceType: 
  - admin
contributors:
- ChrisGarty 
---
# Data policies 

Data policies are a critical aspect of maintaining data security and compliance within the Microsoft Power Platform ecosystem. 

Create data policies that act as guardrails to help reduce the risk of users unintentionally exposing organizational data. A core component of Power Apps, Power Automate, and Microsoft Copilot Studio is the use of connectors to enumerate, populate, push, and pull data. Power Platform admin center data policies allow administrators to control access to these connectors in various ways to help reduce risk in your organization.

This overview describes some high-level concepts related to connectors and several important considerations to take into account when setting up your policies or making policy changes. 

## Connectors
Connectors, at their most basic level, are strongly typed representations of RESTful application programming interfaces, also known as APIs. For example, the Power Platform API provides several operations related to functionality in Power Platform admin center.

:::image type="content" source="media/dlp-ppapi-restapi.png" alt-text="Shows a restful API reference page with optional querystring parameters.":::

When you wrap the Power Platform API into a connector, it becomes easier for makers and citizen developers to use the API in their low-code apps, workflows, and chatbots. For example, the Power Platform for Admins V2 connector is the representation of the Power Platform API and you see the **Get Recommendations** action is simply drag and dropped on to the flow:

:::image type="content" source="media/dlp-ppapi-connectorv2.png" alt-text="Shows the connector on a Power Automate workflow.":::

This article mentions several types of connectors. Each type has different capabilities within data policies.

### Certified connectors
Certified connectors are connectors that Microsoft tests and certifies to ensure they meet Microsoft's standards for security, reliability, and compliance. These connectors provide users with a reliable means of integrating with other Microsoft services and external services, all while maintaining data integrity and security.

For more information on certified connectors, see [Certification Submission Guidelines](/connectors/custom-connectors/submit-certification).

### Custom connectors
Custom connectors allow makers to create their own connectors to integrate with external systems or services not covered by the standard set of certified connectors. While custom connectors offer flexibility and customization options, they require careful consideration to ensure that they comply with data policies and don't compromise data security.

Learn more about [creating and managing custom connectors](/connectors/custom-connectors).

### Virtual connectors
Virtual connectors are connectors that appear in data policies for administrators to control, but they're not based on a RESTful API. The proliferation of virtual connectors comes from data policies being one of the most popular governance controls in Power Platform. More of these types of "on/off" capabilities are expected to surface as rules within [Environment groups](/power-platform/admin/environment-groups).

Microsoft provides several virtual connectors for governing Microsoft Copilot Studio. These connectors facilitate the ability to turn off various features of Copilots and chatbots.

Learn about virtual connectors and their role in [data loss prevention in Microsoft Copilot Studio](/microsoft-copilot-studio/admin-data-loss-prevention).

> [!IMPORTANT]
> [Advanced connector policies](./advanced-connector-policies.md) (ACP) **don't support** virtual connectors and won't add support in the future. ACP's singular focus is to be the most robust governance feature for real certified connectors. The following transition paths apply to virtual connectors:
>
> - **Copilot Studio virtual connectors** are evolving into their own dedicated governance rules, separate from both data policies and ACP.
> - **Desktop Flow virtual connectors** are transitioning to certified connectors, at which point ACP manages them.

### Model Context Protocol (MCP) connectors

Model Context Protocol (MCP) connectors are a class of connectors that provide more metadata to expose MCP-enabled API endpoints, known as _tools_. MCP connectors extend typical connector functionality and enable richer experiences for generative AI in Microsoft Copilot Studio.

Many of the nonblockable connectors in Microsoft Power Platform now support MCP. You can manage and restrict these connectors and their MCP servers through [advanced connector policies](./advanced-connector-policies.md).

## Connections 
When a maker builds an app or a flow and needs to connect to data, they can use one of the connector types described earlier. When a maker first adds a connector to an app, they establish a connection by using the authentication protocols that the connector supports. These connections represent a saved credential and are stored within the environment that hosts the app or flow. For more information about authenticating to connectors, see [Connecting and authenticating to data sources](/power-platform/admin/security/connect-data-sources).

## Design-time versus runtime
When an administrator chooses to limit access to either a whole connector or specific actions of a connector, it impacts both the maker experience and the execution of previously created apps, flows, and chatbots.

Maker experiences, often referred to as *design-time* experiences, limit what connectors makers can interact with. If a data policy blocks the use of MSN Weather connector, a maker can't save their flow or app that uses this connector. Instead, they receive an error message that the connector is blocked by policy.  

Experiences where an app is running or a flow is executing on a predefined schedule, such as every day at 3:00 AM, are often referred to as *runtime* experiences. Continuing with the example earlier, if the background process outlined in the following section inactivates the connection, the app or flow provides an error message that the MSN Weather connection is broken and needs resolution. When the maker attempts to update their connection to fix it, they get an error in the design-time experience that the connector is blocked by policy.

## Process for policy changes
When you create new data policies or update existing policies, the Power Platform ecosystem of services triggers a specific process. This process helps enforce those policies across the entire set of resources a customer has in their tenant. This process involves the following steps.

1. Save data policy configuration at the customer management level.
1. Cascade configurations down to each environment in the customer tenant.
1. Resources in each environment (such as apps, flows, and chatbots) periodically check for updated policy configurations.
1. When a configuration change is detected, evaluate each app, flow, and chatbot to see if it violates the policy.
1. If a violation occurs, put the app, flow, or chatbot in to a _suspended_ or _quarantine_ state so that it can't operate.
1. Scan connections. If the policy blocks the whole connector, set the connection to a _disabled_ state so that it can't operate.
1. Any resources that are running and attempting to use an inactive connection, action, trigger, or MCP server that is blocked, fail at runtime.      

## Latency considerations
The time it takes to effectively implement data policies varies from customer to customer based on their volume of environments and resources within those environments. The more apps, flows, and chatbots a customer has, the longer it takes for policy changes to take full effect. For the most extreme cases, the latency for full enforcement is 24 hours. In most cases, it's within an hour.

### Related content

- [Manage data policies](prevent-data-loss.md)
- [Data policies for Power Automate](/power-automate/prevent-data-loss)
- [Advanced connector policies](./advanced-connector-policies.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
