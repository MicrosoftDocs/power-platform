---
title: Get started with the SAP ERP connector
description: The SAP ERP connector for Power Platform helps you seamlessly integrate your SAP systems with Microsoft Power Platform. This guide walks you through setting up the connector so you can start creating flows that work with your SAP environment.
author: ryanb58
ms.author: ryanb58
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
ms.subservice: solution-templates
---

# Get started with the SAP ERP connector

The SAP ERP connector for Power Platform helps you seamlessly integrate your SAP systems with Microsoft Power Platform. This guide walks you through setting up the connector so you can start creating flows that work with your SAP environment.

> [!IMPORTANT]
> This article is for setting up a Proof of Concept only. The settings and recommendations are not intended for production use. Please consult your security team, internal policies, and Microsoft Partner for further guidance.

## Prerequisite

Before you begin, make sure you meet the requirements defined in the [SAP ERP Connector documentation](https://learn.microsoft.com/en-us/connectors/saperp/#pre-requisites).

## Setup your on-premises data gateway (OPDG)

[Download](https://aka.ms/opdg) and [install](https://learn.microsoft.com/en-us/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) the on-premises data gateway on your Windows VM.

Verify your Windows VM can access your SAP instance.

```powershell
telnet sap.example.com 3300
```

## Install the SAP .NET connector(NCo) onto the OPDG Windows VM

This enables the OPDG to communicate with your SAP system.

1. Go to the [SAP Support Portal](https://support.sap.com/en/product/connectors/msnet.html) and download the SAP Connector for Microsoft .NET to your Windows VM.
1. Select the .NET Standard 64-bit version.
1. Run the installer.
1. Make sure "SAP .NET Connector for Microsoft .NET" is checked during installation.

## Restart the gateway service

1. Open the On-premises data gateway app.
1. Select **Service Settings**.
1. Select **Restart now**.

## Verify Power Platform to OPDG Connection

1. Open the Power Platform Portal(Power Apps or Power Automate).
1. Select **Gateways** from the left panel.
1. Find and select your new gateway from the list.
1. Make sure the status shows as "Online".

## Create a flow with the SAP ERP connector

1. Create a new flow.
1. Search for the `SAP ERP` Connector
1. Add a `Call SAP function (V3)` action to the flow.
1. Set up a new connection:
   - Name your connection (for example, "SAP-Test-Connection")
   - For Authentication Type, select `Basic`
   - Choose your on-premises data gateway
   - Enter your SAP username and password

## Set up and test the SAP action

1. In your flow, select the `Call SAP function` to open the panel.
1. For the `SAP System`, enter your config values as JSON data (replace with your own values). For more parameter options please see the [documentation](https://learn.microsoft.com/en-us/connectors/saperp/#call-sap-function-(v3)-(preview)).

   e.g.
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
1. Finally, select **Test** to try out your flow.

## Troubleshooting tips

- If you see a "SAP Library load failure" error, make sure you've installed the SAP .NET Connector correctly and restarted the OPDG.
- For connection issues, double-check your SAP credentials and System ID.
- Remember that the first connection may take up to 2 minutes to establish.

## Next steps

Now that you've set up the SAP ERP connector for Power Platform, you can:

- Try out more complex SAP functions in your flows
- Set up Secure Network Communication (SNC) for better security between the on-premises data gateway and your SAP system

By following this guide, you've successfully set up the SAP ERP connector. You're now ready to create powerful integrations between your SAP systems and Microsoft Power Platform solutions.
