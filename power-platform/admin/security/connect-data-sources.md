---
title: Connecting and authenticating to data sources
description: Learn how Power Platform connects and authenticates to external data sources.
ms.date: 08/25/2023
ms.service: power-platform
ms.topic: conceptual
ms.custom: "admin-security"
ms.collection: get-started
author: lancedMicrosoft
ms.subservice: admin
ms.author: lanced
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - tapanm-msft
  - lancedMicrosoft
---

# Connecting and authenticating to data sources

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Connecting and authenticating to a data source is done separately from authenticating to a Power Platform service.

Let's look first at how Power Platform services connect with data sources. Power Platform services connect to external data sources in various ways, but the general pattern is the same. Then, we'll look at how the connections are authenticated. Authentication credentials may be the same or they may be different, depending on the app and the data sources it uses.

## Connecting to Microsoft Dataverse

Power Apps canvas and model-driven apps connect directly to Dataverse without the need for a separate connector. (Canvas apps store consent to work with other environments in the Power Apps Resource Provider (RP).) Power Automate authenticates using an API Hub, but all data interactions after that are direct to Dataverse. Both Power Apps and Power Automate support legacy connectors that access Dataverse using connectors (for example, [Dynamics 365 (deprecated)](/connectors/dynamicscrmonline/) and [Microsoft Dataverse (legacy)](/connectors/commondataservice/)).

> [!NOTE]
> Creating canvas apps with [Start from data](/powerapps/maker/canvas-apps/data-platform-create-app) uses a placeholder connector icon to connect to Dataverse. However, no actual connector is involved. For more information, see [Connect canvas apps to Microsoft Dataverse](/powerapps/maker/canvas-apps/connections/connection-common-data-service).

The following diagram illustrates how canvas apps work with Dataverse.

:::image type="content" source="./media/PowerAppToDataverse.png" alt-text="A diagram that shows the direct connection between the Power Apps back-end cluster and Dataverse.":::

1. Power Apps back-end services request data directly from Dataverse.
1. Dataverse returns query results back to Power Apps back-end services.

## Connecting to other data sources

In general, Power Platform services use connectors to work with external data sources that aren't Dataverse. The following diagram illustrates a typical pathway using an [Azure API Management (APIM) connector](/azure/api-management/api-management-key-concepts).

:::image type="content" source="./media/generaldataconnection.png" alt-text="A diagram that shows Power Platform back-end services working with an API Hub/API Management connector to reach external data connectors.":::

1. The Power Platform service sends a connection request to the Power Apps Resource Provider (RP).
1. The Power Apps RP asks the API Hub to create a connection and facilitate authentication token exchange.
1. The Power Platform service sends a data query request to the API Management connector.
1. The API Management connector sends a request to the consent service to get permission to access the data source.
1. The consent service returns credentials to the API Management connector.
1. The API Management connector sends the consent credentials to the Power Apps RP. The credentials are stored in the RP so that Power Apps doesn't prompt for consent again the next time data is requested.

    > [!NOTE]
    > Consent for one application connection doesn't give consent for all applications. Each application connection consent per user is separate. For instance, when you provide a connection for use in a Power Automate flow, you consent for the flow to use that connection going forward. You don't need to consent again to reuse that connection in that flow. For a connection provided by a flow author, the consent double is (connection and flow). For a connection provided by a user invoking a flow (for example, from a canvas app), the consent triple is (connection, flow, and user).

1. The API Management connector passes the data query to the external connector.
1. The connector sends the query to the data source.
1. The data source returns the requested data to the connector.
1. The connector passes the data back to the Power Platform back-end cluster.

## Authenticating to data sources

Users authenticate to the Power Platform service first. Then, separately, users authenticate to a data source using the credentials the connector requires. The API Hub credentials service always stores and manages credentials.

Some connectors support more than one authentication method. Authentication to a data source is specific to that data source instance. It's based on the authentication method the maker chose when creating the connection.

There are two types of data source authentication methods in Power Apps: *explicit* and *implicit*.

- **Explicit authentication** means the app user's credentials are used to access the data source.
- **Implicit authentication** means the credentials the app maker provided when creating the connection are used.

We recommend you use explicit authentication whenever possible. It's more secure.

Even in the case of explicit authentication, it's important to remember that it’s the user’s rights on a data source that determines what the user can see and edit. 

For example, suppose you have a SharePoint list that includes **Name** and **Salary** columns. You then build an app that exposes only the **Name** column. This means that users have access only to the **Name** column in your app.

However, suppose your users have SharePoint list permissions that allow them to view and edit both the **Name** and **Salary** columns. Now suppose a specific user has Power Apps maker rights to that SharePoint list. In this case, nothing prevents that user from creating a new app that accesses the **Salary** column. The permissions that you grant through the user interface of your app don't deny the data source permissions that the user has.

Learn more about the [difference between explicit and implicit connections](/powerapps/maker/canvas-apps/connections/sql-server-security#difference-between-explicit-and-implicit-connections). Although the article refers to SQL Server, it applies to all relational databases.

### Related articles

[Security in Microsoft Power Platform](./overview.md)  
[Authenticating to Power Platform services](./authenticate-services.md)  
[Data storage in Power Platform](./data-storage.md)  
[Power Platform security FAQs](./faqs.md)  

### See also

- [Connect canvas apps to Microsoft Dataverse](/powerapps/maker/canvas-apps/connections/connection-common-data-service)
- [Difference between explicit and implicit connections](/powerapps/maker/canvas-apps/connections/sql-server-security#difference-between-explicit-and-implicit-connections)
- [Power Platform connectors reference - Microsoft Dataverse](/connectors/commondataserviceforapps/)
