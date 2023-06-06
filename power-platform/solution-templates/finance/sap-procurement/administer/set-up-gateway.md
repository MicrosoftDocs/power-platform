---
title: Set up on-premises data gateway for SAP (preview)
description: Learn how to set up on-premises data gateway for SAP integration with Microsoft Power Platform.
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
ms.topic: install-set-up-deploy
ms.date: 06/06/2023
ms.custom: bap-template
---

# Set up on-premises data gateway for SAP integration with Power Platform (preview)

[This article is prerelease documentation and is subject to change.]

An [on-premises data gateway](/power-platform/admin/wp-onpremises-gateway) acts as a bridge to provide secure data transfer between on-premises data that isn't in the cloud and Microsoft cloud services.

The on-premises data gateway installation encompasses multiple components installed on the same domain as the Windows Virtual Machine (VM). Each dedicated machine can only have one gateway installed on it. The same gateway can be used in multiple environments as long as the [gateway region](/power-automate/regions-overview) and the environment region match. Administrators need to take the following steps to set up the gateway:

1. Create a new [Windows VM](/azure/virtual-machines/overview) or provision a new or repurposed server specifically for SAP integration with the Power Platform.
1. Install the most recent [Microsoft .NET Framework](https://dotnet.microsoft.com/download/dotnet-framework) listed in the _System Requirements_ section on the [gateway download page](https://www.microsoft.com/download/details.aspx?id=53127) on to the machine.
1. Install the most recent version of the [on-premises data gateway](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) on to the machine (December 16, 2022 or newer).
1. Install the [Microsoft C++ Runtime DLLs version 10.x](/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2010-vc-100-sp1-no-longer-supported&preserve-view=true) framework package onto the machine and configure. This version is contained in Microsoft Visual C++ 2010 Redistributables.
1. Install [SAP Connector for Microsoft .NET 3.0 (NCo3.0)](https://support.sap.com/en/product/connectors/msnet.html) on to the machine.
      - Select [Install assemblies to GAC](/dotnet/framework/app-domains/install-assembly-into-gac) in the Optional setup steps window during the installation of NCo3.0.

> [!IMPORTANT]
>
> To avoid error messages, make sure you enable network connectivity from the host of the SAP .NET Connector (NCo) library and that the required ports are open on the firewalls and network security groups. Common error messages are _partner not reached_ from component _NI_ (network interface) or _WSAECONNREFUSED: Connection refused_.
>
> For more information about SAP services and ports, review [TCP/IP Ports of All SAP Products](https://help.sap.com/docs/Security/575a9f0e56f34c6e8138439eefc32b16/616a3c0b1cc748238de9c0341b15c63c.html).


The installed gateway runs as the default machine-local service account, _NT Service\PBIEgwService_. Update the service account to a domain account if setting up Windows or Azure single sign-on (SSO). Additional information is provided in [Step 1](configure-authentication.md#step-1-configure-kerberos-constrained-delegation) in the _Configure authentication_ article.

 On-premises data gateway clusters can be created to avoid single points of failure when accessing on-premises data resources. For solutions working with SAP, calls should be forced to the primary gateway in a cluster. Calls are only directed to the second gateway when the primary gateway call fails. To support this scenario, ensure that random load balancing is turned off.

1. Go to the [**Settings**](/power-platform/admin/onpremises-data-gateway-management#settings) panel in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Make sure the checkbox next to _Distribute requests across all active gateways in this cluster_ **remains unchecked** on the on-premises data Settings panel.

More information:

- [On-premises data gateways documentation](/data-integration/gateway/)
- [Power Platform on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management)
- [Manage on-premises data gateway high-availability clusters and load balancing](/data-integration/gateway/service-gateway-high-availability-clusters)
- [Data source management](/power-platform/admin/onpremises-data-gateway-source-management)