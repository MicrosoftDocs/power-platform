---
title: Connecting and authenticating to data sources
description: Provides information about connecting and authenticating to different data sources from Power Platform.
ms.date: 01/04/2021
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
  - "intro-internal"
author: lancedMicrosoft
ms.subservice: admin
ms.author: lanced
ms.reviewer: tapanm
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Connecting and authenticating to data sources

Connecting and authenticating to an external data source is an explicit and separate step from authenticating to a Power Platform service. Depending on the app design or configuration, the credentials used to connect and authenticate to an external data source might be same, or different.

While the specific pattern of how a Power Platform service connects to external data sources may vary, the general pattern is the same.  It's important to understand the specifics of how a Power Platform service connects and authenticates to such data sources depending on your usage pattern. In this article, learn about the varying methods used by different Power Platform services.

## Connecting to Microsoft Dataverse

Power Platform services use connectors to work with external data sources generally. However, Power Apps (canvas and model driven apps) connects directly to Dataverse without using any underlining connectors. Canvas apps do store consent to work with other Dataverse environments in the Power Apps Resource Provider (RP). Similarly, Power Automate first authenticates using an API Hub, but all data interactions after that are direct to Dataverse. Both Power Apps and Power Automate support legacy connectors that access Dataverse using connectors (for example, [Dynamics 365 (deprecated)](/connectors/dynamicscrmonline/) and [Microsoft Dataverse (legacy)](/connectors/commondataservice/)).

> [!NOTE]
> Creating canvas apps with [Start from data](/powerapps/maker/canvas-apps/data-platform-create-app) uses a placeholder connector icon to allow the abovementioned path for connecting to Dataverse. However, there's no actual connector involved. Legacy connectors mentioned above also use connectors. More information: [Connect canvas apps to Microsoft Dataverse](/powerapps/maker/canvas-apps/connections/connection-common-data-service)

The following diagram shows how canvas apps work with Dataverse.

:::image type="content" source="./media/PowerAppToDataverse.png" alt-text="Diagram showing that Power Apps connects directly to Dataverse.  Power Apps back-end cluster works directly with Dataverse. No explicit separate connection is made.  Consent to working with other environments is stored in the Power Apps Resource Provider.":::

**Step 1** - Power Apps back-end services request data from Dataverse directly.
<br>**Step 2** - Dataverse returns query results back to Power Apps back-end services.

## Connecting to other data sources

Power Platform services use connectors to work with all other data sources. The following steps explain the sequence of operation when connecting to all data sources other than connecting to Dataverse:

:::image type="content" source="./media/generaldataconnection.png" alt-text="Power Platform connector model. Power Platform back-end cluster services work with external services such as API Hub/APIM to reach connectors that retrieve data.":::

**Steps 1-2** - Power Platform service requests a connection of the Power Apps Resource Provider (RP) service. Power Apps RP requests API Hub to create and store the connection and credentials.

**Steps 3-6** - Having previously secured an authenticated connection, a user requests data through a query. And the request goes directly to APIM. The APIM uses the consent service to get user permission to access the data source.

For Power Apps, the consent triple (*Connection*, *Application*, *User*) is stored in Power Apps RP so that Power Apps doesn't prompt for consent when the user requests data subsequently.

> [!NOTE]
> Consent for a given connection application combination does not give consent for all applications. Each application connection consent per user is separate. For Power Automate, when a user provides a connection which they access to for use in a flow, they consent for the flow to use that connection going forward. Additional consent is not required for subsequent use of that connection in that flow. For a connection provided by a flow author, this consent double is (Connection, Flow). For a connection provided by a user invoking a flow (e.g. from a PowerApp) this is a consent triple of (Connection, Flow, User).

**Steps 7-8** - The data query is passed on to the connector&mdash;which then passes it on to the actual data source.

**Steps 9-10** - The data result is passed to the connector, and then back to the Power Platform service back-end cluster.

## Authentication to data sources

Authentication of an end user to a Power Platform data source is a separate and distinct step from authentication to the Power Platform service.

Each user authenticates to the Power Platform service first, and then, the credentials required by the connector are used to authenticate to the data source.

In all scenarios, credentials are stored and managed by the API Hub credentials service. Some connector types support more than one authentication method. Authentication to a data source for a Power Platform service is then specific to each data source instance, and is based on the authentication choice made when creating the connection for the service.

There are two types of data source authentication methods in Power Apps&mdash;**explicit** and **implicit**.

- Explicit authentication means that only the end user's credentials will be used to access the data source.
- Implicit authentication means that the credentials the author used when creating the connection for the Power Apps will be used.

We recommend that you use **explicit** connection type as it's more secure. More information: [Difference between explicit and implicit connections](/powerapps/maker/canvas-apps/connections/sql-server-security#difference-between-explicit-and-implicit-connections)

### See also

- [Connect canvas apps to Microsoft Dataverse](/powerapps/maker/canvas-apps/connections/connection-common-data-service)
- [Difference between explicit and implicit connections](/powerapps/maker/canvas-apps/connections/sql-server-security#difference-between-explicit-and-implicit-connections)
- [Power Platform connectors reference - Microsoft Dataverse](/connectors/commondataserviceforapps/)
