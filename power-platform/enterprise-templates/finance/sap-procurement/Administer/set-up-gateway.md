---
title: Set up on-premises data gateway for SAP
description: Learn how to set up an on-premises data gateway for SAP integration with Microsoft Power Platform.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - tverhasselt
  - robinsonshields
  - microsoft-george
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 03/19/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Set up on-premises data gateway for SAP integration with Power Platform

An [on-premises data gateway](/power-platform/admin/wp-onpremises-gateway) acts as a bridge to provide secure data transfer between on-premises data that isn't in the cloud and Microsoft cloud services.

The on-premises data gateway installation encompasses multiple components installed on the same domain as the Windows Virtual Machine (VM).

:::image type="content" source="media/set-up-gateway/opdg-decrypts-sends.png" alt-text="Diagram of the on-premises data gateway.":::

> [!NOTE]
>
> Each dedicated machine can only have one gateway installed on it. The same gateway can be used in [multiple environments](/power-platform/admin/multiple-online-environments-tenants#a-multi-environment-deployment) as long as the [gateway and environment regions](/power-platform/admin/regions-overview) match.

## Gateway setup steps

[Administrators](/power-platform/admin/admin-documentation) set up gateways. To set up the gateway:

1. Create a new [Windows VM](/azure/virtual-machines/overview) or provision a new or repurposed server specifically for SAP integration with Power Platform.

1. Install the most recent [Microsoft .NET Framework](https://dotnet.microsoft.com/download/dotnet-framework) listed in the _System Requirements_ section on the [gateway download page](https://www.microsoft.com/download/details.aspx?id=53127) onto the machine.

1. [Install](/data-integration/gateway/service-gateway-install) the [most recent version of the on-premises data gateway](/data-integration/gateway/service-gateway-monthly-updates) onto the machine. Microsoft releases a new update for on-premises data gateways every month. You should develop a plan to regularly monitor and [update on-premises data gateways](/data-integration/gateway/service-gateway-update?source=recommendations) to ensure optimal performance and support.

1. Install most recent version of [Microsoft C++ Runtime DLLs](/cpp/windows/latest-supported-vc-redist?view=msvc-170&preserve-view=true). SAP's NCo 3.1 download requires this library to support the .NET Framework.

1. Install [SAP Connector for Microsoft .NET 3.1 (NCo 3.1)](https://support.sap.com/en/product/connectors/msnet.html) on the machine.

> [!IMPORTANT]
>
> To avoid error messages, make sure you enable network connectivity from the host of the SAP .NET Connector (NCo) library and that the required ports are open on the firewalls and network security groups. Common error messages are:
>
> - _partner not reached_ from component _NI_ (network interface)
> - _WSAECONNREFUSED: Connection refused_.
>
> For more information about SAP services and ports, review [TCP/IP Ports of All SAP Products](https://help.sap.com/docs/Security/575a9f0e56f34c6e8138439eefc32b16/616a3c0b1cc748238de9c0341b15c63c.html).

> [!NOTE]
>
> If setting up Windows server AD or Microsoft Entra ID SSO, you need to update the service account to a domain account. The installed gateway runs as the default machine-local service account, _NT Service\PBIEgwService_. Additional information is provided in [Step 1](configure-authentication.md#step-1-configure-kerberos-constrained-delegation) in the _Configure authentication_ article.

## Gateway cluster configuration

You can [create on-premises data gateway clusters](/data-integration/gateway/service-gateway-install#add-another-gateway-to-create-a-cluster) to avoid single points of failure when accessing on-premises data resources, but it's important to understand how to configure gateway clusters when working with SAP.

The gateway uses the SAP NCo 3.1 connector and it maintains an internal state of the connection to SAP. For example, if you have _Step A_ in a flow do something in SAP and _Step A_ uses _Gateway 1_ to make that call, then _Gateway 1_ knows about the changes you're trying to make.

Because the connector maintains an internal state of the connection to SAP, you want all your calls to be forced to the primary gateway in the cluster. A call is only directed to the second gateway when the primary gateway call fails. To support this scenario, **turn off random load balancing**.

### Turn off random load balancing

As an admin, ensure that an on-premises data gateway cluster set up with the SAP NCo 3.1 connector has random load balancing set to _off_.

:::image type="content" source="media/set-up-gateway/gateway-clusters.png" alt-text="Select a gateway and access the Settings panel to ensure random load balancing is turned off.":::

Assuming your gateways are already set up, take these steps:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Data** on the left navigation pane.
1. Select **On-premises data gateways** to see a list of gateways.
1. Select the gateway cluster set up with the SAP NCo 3.1 connector.
1. Select [**Settings**](/power-platform/admin/onpremises-data-gateway-management#settings).
1. On the _Settings_ panel, go to **General**. Make sure the checkbox next to _Distribute requests across all active gateways in this cluster_ **remains unchecked**.
1. If you made a change, select **Save**.

> [!NOTE]
>
> Your role determines what features are available to you and what operations you can perform in the Power Platform admin center.
>
> You need to be a Microsoft Entra Global admin, Power BI Service admin, or a Gateway admin to have access to the [gateway management capabilities](/power-platform/admin/onpremises-data-gateway-management) that allow you to manage gateway details, settings, and users in the Power Platform admin center.

## Related content

- [On-premises data gateways documentation](/data-integration/gateway/)
- [Power Platform on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management)
- [Manage on-premises data gateway high-availability clusters and load balancing](/data-integration/gateway/service-gateway-high-availability-clusters)
- [Data source management](/power-platform/admin/onpremises-data-gateway-source-management)

### Next steps

[Configure authentication](configure-authentication.md)

### See also

[Get started with the SAP Procurement template](get-started.md)
