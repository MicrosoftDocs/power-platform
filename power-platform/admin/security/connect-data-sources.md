---
title: "Connect to data sources | MicrosoftDocs"
description: Provides information about the security concepts in Microsoft Dataverse.
ms.date: 12/08/2021
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
  - "intro-internal"
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Connect to data sources

> **Working notes**
>
> This topic is all about connecting to data and associated security:
>
> - Explain the various data sources that Power Platform components can connect to; talk in detail about Dataverse (data platform), connectors, on-premises data gateways, VNets
> - Talk about data centers and residency/sovereignty

## Connecting and authenticating to data sources

Connecting and authenticating to an external data source is an explicit and separate step from authenticating to a Power Platform service. The credentials may be the same for both steps but they may explicitly vary as well depending on your needs for your application.  

Additionally, while the specific pattern of how a Power Platform service connects to external data sources may vary, the general pattern is the same.  It can be very important to understand the specifics of how a Power Platform service connects and authenticates depending on your usage pattern. Details on how each Power Platform service varies is called out below.

### Dataverse

Generally, Power Platform services use connectors to work with external data sources.  However, Power Apps (canvas and model driven apps) connect directly to Dataverse. No connectors are involved. Power Apps (canvas) does store consent to work with other Dataverse environments in the Power Apps RP.  Similarly, Power Automate first authenticates via API Hub but all data interactions after that are direct to Dataverse.  Both Power Apps and Power Automate support legacy connectors that access Dataverse via connectors [e.g., via D365 and CDS].

Below is a image that illustrates how Power Apps (canvas) works with Dataverse.

![Power Apps connection to Dataverse.](./media/PowerAppToDataverse.png "Diagram showing that Power Apps connects directly to Dataverse.  Power Apps back-end cluster works directly with Dataverse.  No explicit separate connection is made.  Consent to working with other environments is stored in the Power Apps RP.")

## Connectors

Power Platform services use connectors to work with all other data sources. The sequence of operations in working with a connector is:

1. Power Platform service requests a connection of the Power Apps RP service.  Power Apps RP requests API Hub to create and store the connection and credentials. (Arrows 1 - 2)
2. When a user requests data via a query, having previously secured an authenticated connection, the request goes directly to APIM. (Arrows 3 - 6)
3. APIM uses the consent service to get user permission to access the data source.  For Power Apps, the consent triple (Connection, Application, User) is stored in Power Apps RP so that when the user requests data again we do not again prompt for consent. Note that consent for a given connection application combination does not give consent for all applications.  Each application connection consent per user is separate. For Power Automate this is the double (Connection, User).  Consent is not required for subsequent use of the connection.
4. The data query is passed on to the connector which then passes it on to the actual data source. (Arrows 7 - 8)
5. The data result is passed to the connector and then back to the Power Platform service back end cluster. (Arrows 9 - 10)

![Power Platform connector model.](./media/generaldataconnection.png "Power Platform connector model.  Power Platform back end cluster services works with external services such as API Hub/APIM to reach connectors that retrieve data.")

## Authentication to data sources

Again, authentication of an end user to a Power Platform data source is a separate and distinct step from authentication to the Power Platform service. First each user authenticates to the Power Platform service and then the credentials required by the connector are used to authenticate to the data source. In all cases credentials are stored and managed by the API Hub credentials service.  It is important to note that some connector types support more than one authentication method. Authentication to a data source for a Power Platform service is then specific to each data source instance and is based on the authentication choice made when creating the connection for the service.

For Power Apps specifically, there are two types of Power Apps data source authentication: explicit and implicit. And it’s important to know the difference to keep your data secure.  Explicit authentication means that only the end user’s credentials will be used to access the data source. Implicit authentication means that the credentials the author used when creating the connection for the Power Apps will be used. The most secure connection type is explicit and we recommend it. [Canvas Apps SQL Server security](https://docs.microsoft.com/en-us/powerapps/maker/canvas-apps/connections/sql-server-security).

 

### See also

[Add related articles]
