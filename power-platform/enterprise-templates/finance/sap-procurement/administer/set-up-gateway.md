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
ms.date: 08/18/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Set up on-premises data gateway for SAP integration with Power Platform

An [on-premises data gateway](/power-platform/admin/wp-onpremises-gateway) acts as a bridge to provide secure data transfer between on-premises data that isn't in the cloud and Microsoft cloud services.

The on-premises data gateway installation encompasses multiple components installed on the same domain as the Windows Virtual Machine (VM).

:::image type="content" source="media/set-up-gateway/opdg-connect.png" alt-text="Reuse environment variables in the SAP ERP connector's actions":::

> [!NOTE]
>
> Each dedicated machine can only have one gateway installed on it. The same gateway can be used in [multiple environments](/power-platform/admin/multiple-online-environments-tenants#a-multi-environment-deployment) as long as the [gateway and environment regions](/power-platform/admin/regions-overview) match.

## Gateway setup steps

Gateways are set up by [administrators](/power-platform/admin/admin-documentation). To set up the gateway:

1. Create a new [Windows VM](/azure/virtual-machines/overview) or provision a new or repurposed server specifically for SAP integration with Power Platform.

1. Install the most recent [Microsoft .NET Framework](https://dotnet.microsoft.com/download/dotnet-framework) listed in the _System Requirements_ section on the [gateway download page](https://www.microsoft.com/download/details.aspx?id=53127) onto the machine.

1. Install the most recent version of the [on-premises data gateway](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) onto the machine (December 16, 2022, or later).

1. Install most recent version of [Microsoft C++ Runtime DLLs](/cpp/windows/latest-supported-vc-redist?view=msvc-170&preserve-view=true). SAP's NCo 3.1 download requires this library to support the .NET Framework.

1. Install [SAP Connector for Microsoft .NET 3.1 (NCo3.1)](https://support.sap.com/en/product/connectors/msnet.html) on the machine.

      - Select [Install assemblies to GAC](/dotnet/framework/app-domains/install-assembly-into-gac) in the Optional setup steps window during the installation of NCo3.1.

> [!IMPORTANT]
>
> To avoid error messages, make sure you enable network connectivity from the host of the SAP .NET Connector (NCo) library and that the required ports are open on the firewalls and network security groups. Common error messages are:
>
> - _partner not reached_ from component _NI_ (network interface)
> - _WSAECONNREFUSED: Connection refused_.
>
> For more information about SAP services and ports, review [TCP/IP Ports of All SAP Products](https://help.sap.com/docs/Security/575a9f0e56f34c6e8138439eefc32b16/616a3c0b1cc748238de9c0341b15c63c.html).

The installed gateway runs as the default machine-local service account, _NT Service\PBIEgwService_. Update the service account to a domain account if setting up Windows or Azure single sign-on (SSO). Additional information is provided in [Step 1](configure-authentication.md#step-1-configure-kerberos-constrained-delegation) in the _Configure authentication_ article.

## Gateway cluster configuration

On-premises data gateway clusters can be created to avoid single points of failure when accessing on-premises data resources, but it is important to understand how gateway clusters need to be configured when working with SAP.

The gateway uses the SAP NCo connector and it maintains an internal state of the connection to SAP. For example, if you have _Step A_ in a flow do something in SAP and _Step A_ uses _Gateway 1_ to make that call, then _Gateway 1_ knows about the changes you are trying to make.

Because the connector maintains an internal state of the connection to SAP, you want all of your calls to be forced to the primary gateway in the cluster. A call is only directed to the second gateway when the primary gateway call fails. To support this scenario, **ensure that random load balancing is turned off**.

### Turn off random load balancing

1. Go to the [**Settings**](/power-platform/admin/onpremises-data-gateway-management#settings) panel in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Make sure the checkbox next to _Distribute requests across all active gateways in this cluster_ **remains unchecked** on the on-premises data Settings panel.

## Related content

[On-premises data gateways documentation](/data-integration/gateway/)

[Power Platform on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management)

[Manage on-premises data gateway high-availability clusters and load balancing](/data-integration/gateway/service-gateway-high-availability-clusters)

[Data source management](/power-platform/admin/onpremises-data-gateway-source-management)

## Next steps

[Configure authentication](configure-authentication.md)

## See also

[Get started with the SAP Procurement template](get-started.md)
