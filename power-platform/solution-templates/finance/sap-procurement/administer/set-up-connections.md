---
title: Set up connections
description: Learn how to set up data connections in solutions for SAP Procurement apps and flows.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - thoverh
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Set up connection information in the solutions

Power Platform services use connectors, like [SAP ERP](/connectors/saperp/), to work with external data sources. A [Connector](/connectors/connectors) is a proxy or a wrapper around an application programming interface (API) that allows the underlying service to talk to Power Platform.

[Solutions](/power-apps/maker/data-platform/solutions-overview) are used to transport apps and components from one environment to another or to apply a set of customizations to existing apps. Solutions are the mechanism for implementing [application lifecycle management (ALM)](/power-platform/alm/overview-alm) in Power Apps and Power Automate.

More information: [Solution concepts](/power-platform/alm/solution-concepts-alm)

The data source for the SAP Procurement solutions is your SAP system. Storing your system's SAP connection information in the solutions ensures that the SAP system connection information can be easily re-established when the solutions are migrated to different environments.

When you import the solutions, you'll be prompted to create new connections or map existing connections.

## Set up and manage connections

The SAP Procurement template requires the following connections:

- [Microsoft Dataverse](/connectors/commondataserviceforapps/)
- [SAP ERP connector](/connectors/saperp/)

To set up [connections](/connectors/connectors):

1. Sign in to [Power Apps](https://make.powerapps.com).

1. In the left navigation pane, expand **Data** and select **Connections**.

1. Select **New connection** in the command bar.

1. Go to **Search** in the command bar if you need to search for the connectors.

1. Select each connector as it appears and follow the prompts to set up the connections.

> [!IMPORTANT]
> Successful setup of the SAP ERP connector is dependent on specific [requirements](requirements.md):
>
> - On-premises data gateway
> - Microsoft C++ Runtime DLL Version 10.x
> - SAP .NET Connector 3.0 SDK from SAP

## Manage connection references

A _connection reference_ is a solution component that contains a reference to a connection about a specific connector.

All required connections are referenced by _Connection References_ in the SAP Procurement solution cloud flows. Connection references provide a way to set connections on cloud flow action steps when migrating solutions across environments without modifying the flow and creating an unnecessary solution layer.

> [!NOTE]
> It's a best practice to always use connection references in both cloud flows and apps to support your ALM strategy.
> Connection references are automatically created and set during the solution [install](install.md) process.

To update the connection references originally set during the install solution process:

1. Go to **Solutions**.
1. Select the **SAP Procurement** solution.
1. Select **Connection references**.
1. Double select each of the _connection references_ and choose each **Connection** that you created.
1. Select **Save**.

The two connection references contained in the SAP Procurement solution are:

- **SAP Dataverse**: A placeholder for Dataverse connection.
- **SAP ERP**: A placeholder for SAP ERP connection.

## Related content

[Connectors overview](/connectors/connectors)

[Create new connections](/power-apps/maker/canvas-apps/add-manage-connections#create-a-new-connection)

[Use a connection reference in a solution](/power-apps/maker/data-platform/create-connection-reference)

[Manage connections in Power Automate](/power-automate/add-manage-connections)

[Manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections)

## Next steps

[Configure security groups](configure-security-groups.md)

## See also

[Get started with the SAP Procurement template](get-started.md)
