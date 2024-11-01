---
title: Get started with the SAP ERP connector
description: The SAP ERP connector for Power Platform helps you seamlessly integrate your SAP systems with Microsoft Power Platform. This guide walks you through setting up the connector so you can start creating flows that work with your SAP environment.
author: ryanb58
ms.author: tbrazelton
contributors:
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/15/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
---

# Get started with the SAP ERP connector

The SAP ERP connector for Power Platform helps you seamlessly integrate your SAP systems with Microsoft Power Platform. This guide walks you through setting up the connector so you can start creating flows that work with your SAP environment.

> [!IMPORTANT]
> **This article only provides a guide for setting up a proof of concept**. The settings and recommendations are not intended for production use. For more information about this topic, review [Microsoft Power Platform admin documentation](/power-platform/admin/) and consult your security team, internal policies, and Microsoft Partner for more guidance.

## Prerequisites

Before you begin, make sure you have the necessary [administration](/power-platform/admin/admin-documentation) rights and meet the requirements defined in the [SAP ERP Connector documentation](/connectors/saperp/#pre-requisites).

## Step 1: Set up your on-premises data gateway (OPDG)

An on-premises data gateway acts as a bridge to provide secure data transfer between on-premises data that isn't in the cloud and Microsoft cloud services. The on-premises data gateway installation encompasses multiple components installed on the same domain as the Windows Virtual Machine (VM).

[Download](https://aka.ms/opdg) and [install](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) the on-premises data gateway on your Windows VM.

Verify your Windows VM can access your SAP instance.

```powershell
telnet sap.example.com 3300
```

## Step 2: Install the SAP .NET connector(NCo)

To enable the on-premises data gateway to communicate with your SAP system, you need to install the SAP .NET connector (NCo) on your on-premises data gateway Windows VM.

1. Go to the [SAP Support Portal](https://support.sap.com/en/product/connectors/msnet.html) and download the SAP Connector for Microsoft .NET to your Windows VM.
1. Select the .NET Standard 64-bit version.
1. Run the installer.
1. Make sure **SAP .NET Connector for Microsoft .NET** is checked during installation.

## Step 3: Restart the gateway service

1. Open the on-premises data gateway app.
1. Select **Service Settings**.
1. Select **Restart now**.

## Step 4: Verify the connection

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
2. Select **Data**.
1. Select **On-premises data gateways**.
1. Find and select your new gateway from the list.
1. Make sure the status shows as *Online*.

## Step 5: Create a flow with the SAP ERP connector

1. Go to [Power Automate](https://make.preview.powerautomate.com)
2. [Create a new flow].
1. Search for the `SAP ERP` Connector
1. Add a `Call SAP function (V3)` action to the flow.
1. Set up a new connection:
   - Name your connection (for example, *SAP-Test-Connection*)
   - For Authentication Type, select `Basic`
   - Choose your on-premises data gateway
   - Enter your SAP username and password

## Step 6: Set up and test the SAP action

1. In your flow, select the `Call SAP function` to open the panel.
1. For the `SAP System`, enter your configuration values as JSON data (replace with your own values). For more parameter options please see the [documentation](/connectors/saperp/#call-sap-function-(v3)-(preview)).

   for example
   ```json
   {
     "AppServerHost": "sap.example.com",
     "Client": "100",
     "SystemNumber": "00",
     "LogonType": "ApplicationServer"
   }
   ```

1. For `RFC Name`, enter `STFC_CONNECTION`.
1. Wait for the input parameters to load.
1. Enter a test sentence for the required `REQUTEXT` parameter.
1. Save your flow.
1. Select **Test** to try out your flow.

Once you test and verify the SAP action, you're ready to learn [best practices for building](/power-platform/well-architected/) powerful Microsoft Power Platform solutions that work with your SAP systems.

## Troubleshooting tips

- If you see an *SAP Library load failure* error, make sure the SAP .NET Connector is installed correctly and restart the on-premises data gateway.
- For connection issues, double-check your SAP credentials and System ID.
- Remember that the first connection may take up to 2 minutes to establish.

## Next steps

Now that you've set up the SAP ERP connector for Power Platform, you can:

- Try out more complex SAP functions in your flows
- [Set up Secure Network Communication (SNC)](set-up-secure-network-communications.md)
