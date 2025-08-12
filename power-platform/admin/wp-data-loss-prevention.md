---
title: Data policies
description: You can create data policies that can act as guardrails to help reduce the risk of users from unintentionally exposing organizational data.
ms.component: pa-admin
ms.topic: overview
ms.date: 08/12/2025
author: laneswenka
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
contributors:
- ChrisGarty 
---
# Data policies 

Data policies are a critical aspect of maintaining data security and compliance within the Microsoft Power Platform ecosystem. 

You can create data policies that can act as guardrails to help reduce the risk of users from unintentionally exposing organizational data. A core component of Power Apps, Power Automate, and Microsoft Copilot Studio is the use of connectors to enumerate, populate, push, and pull data. Data policies in Power Platform admin center allow administrators to control access to these connectors in various ways to help reduce risk in your organization.

This overview describes some high-level concepts related to connectors and several important considerations to take into account when setting up your policies or making policy changes. 

## Connectors
Connectors, at their most basic level, are strongly typed representations of restful, application programming interfaces, also known as APIs.  For example, the Power Platform API provides several operations related to functionality in Power Platform admin center.

:::image type="content" source="media/dlp-ppapi-restapi.png" alt-text="Shows a restful API reference page with optional querystring parameters.":::

When wrapping the Power Platform API in to a connector, it becomes easier for makers and citizen developers to utilize the API in their low-code apps, workflows, and chatbots. For example, the Power Platform for Admins V2 connector is the representation of the Power Platform API and we see the 'Get Recommendations' action is simply drag and dropped on to the flow:

:::image type="content" source="media/dlp-ppapi-connectorv2.png" alt-text="Shows the connector on a Power Automate workflow.":::

There are several types of connectors mentioned in this article, and each has capabilities within data policies.

### Certified connectors
Certified connectors refer to connectors that have undergone rigorous testing and certification processes to ensure they meet Microsoft's standards for security, reliability, and compliance. These connectors provide users with a reliable means of integrating with other Microsoft services and external services, all while maintaining data integrity and security.

For more information on certified connectors, see [Certification Submission Guidelines](/connectors/custom-connectors/submit-certification).

### Custom connectors
Custom connectors allow makers to create their own connectors to integrate with external systems or services not covered by the standard set of certified connectors. While offering flexibility and customization options, custom connectors require careful consideration to ensure that they comply with data policies and don't compromise data security.

Learn more about [creating and managing custom connectors](/connectors/custom-connectors).

### Virtual connectors
Virtual connectors are connectors that are shown in data policies for administrators to control, however they're not based on a restful API. The proliferation of virtual connectors has stemmed from data policies being one of the most popular governance controls in Power Platform. More of these types of "on/off" capabilities are expected to surface as rules within [Environment groups](/power-platform/admin/environment-groups).

Several virtual connectors are provided for governing Microsoft Copilot Studio. These connectors facilitate the ability to turn off various features of Copilots and chatbots.

Explore virtual connectors and their role in [data loss prevention in Microsoft Copilot Studio](/microsoft-copilot-studio/admin-data-loss-prevention).

### Model Context Protocol (MCP) connectors

Model Context Protocol (MCP) connectors are a class of connectors that provide additional metadata to expose MCP-enabled API endpoints, known as Tools. MCP connectors extend typical connector functionality and enable richer experiences for generative AI in Microsoft Copilot Studio.

Many of the non-blockable connectors in Microsoft Power Platform now support MCP.  These connectors and their MCP Servers can be managed and restricted through [Advanced Connector Policies](./advanced-connector-policies.md).

## Connections 
When a maker is building an app or a flow and needs to connect to data, they can use one of the above connector types.  When a connector is first added to an app, a connection is established using the authentication protocols supported by that particular connector.  These connections represent a saved credential and are stored within the environment that is hosting the app or flow.  For more information about authenticating to connectors, see [Connecting and authenticating to data sources](/power-platform/admin/security/connect-data-sources).

## Design-time versus runtime
When an administrator chooses to limit access to either a whole connector or specific actions of a connector, there are impacts both to the maker experience and to the execution of previously created apps, flows, and chatbots.

Maker experiences, often referred to as *design-time* experiences, limit what connectors makers can interact with. If a data policy blocked the use of MSN Weather connector, then a maker can't save their flow or app that utilizes this, and instead receives an error message that the connector has been blocked by policy.  

Experiences where an app is being run or a flow is executing on a predefined schedule, such as every day at 3:00 AM, are often referred to as *runtime* experiences. Continuing with the example earlier, if the connection was inactivated by the background process outlined below, then the result is that the app or flow provides an error message that the MSN Weather connection is broken and needs resolution. When the maker attempts to update their connection to fix it, they get an error in the design-time experience that the connector is blocked by policy.

## Process for policy changes
As new data policies are created, or when existing policies are updated, there's a specific process that's triggered within the Power Platform ecosystem of services that helps to get those policies enforced across the entire set of resources a customer has in their tenant. This process involves the following steps.

1. Data policy configuration is saved at the customer management level.
2. Configurations are cascaded down to each environment in the customer tenant.
3. Resources in each environment (such as apps, flows, and chatbots) periodically check for updated policy configurations.
4. When a configuration change is detected, each app, flow, and chatbot is evaluated to see if it violates the policy.
5. If a violation occurs, the app, flow, or chatbot is put in to a _suspended_ or _quarantine_ state so that it can't operate.
6. Connections are scanned. If the policy blocks the whole connector then the connection is set to a _disabled_ state so that it can't operate.
7. Any resources which are running and attempting to use an inactive connection, action, trigger, or MCP server that is blocked, fail at runtime.   

## Latency considerations
The time it takes to effectively implement data policies varies from customer to customer based on their volume of environments and resources within those environments. The more apps, flows, and chatbots a customer has the longer it takes for policy changes to take full effect. For the most extreme cases, the latency for full enforcement is 24 hours. In most cases it is within an hour.

### Related content

- [Manage data policies](prevent-data-loss.md)
- [Data policies for Power Automate](/power-automate/prevent-data-loss)
- [Advanced connector policies](./advanced-connector-policies.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
