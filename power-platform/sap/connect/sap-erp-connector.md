---
title: Get started with the SAP ERP connector
description: Learn how to set up Power Platform's SAP ERP connector so you can start creating solutions that work with your SAP environment.
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
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
# Customer intent: As an administrator, I want to learn about the SAP ERP connector, so I can determine which connection method I want to use to connect Power Platform and SAP.
---

# Get started with the SAP ERP connector

The [SAP ERP connector](/connectors/saperp) for Power Platform helps you seamlessly integrate your SAP systems with Microsoft Power Platform. This article walks you through setting up the connector as a proof of concept.

> [!IMPORTANT]
> **The settings and recommendations presented in this article are only intended to help you set up a proof of concept and are not intended for production use.** Review the [Microsoft Power Platform admin documentation](/power-platform/admin/) and consult your security team, internal policies, and Microsoft Partner for guidance in setting up the SAP ERP connector in a production environment.

## Prerequisites

It's important that you review the following to ensure you can move forward with the steps to connect Power Platform and SAP with the SAP ERP connector:

- [Administration](/power-platform/admin/admin-documentation) privileges
- [SAP ERP connector ](/connectors/saperp/#pre-requisites) requirements.

## Set up your on-premises data gateway

An on-premises data gateway acts as a bridge to securely transfer data between on-premises systems and Microsoft cloud services. Installation of the on-premises data gateway includes installing several components on the same network domain as the Windows virtual machine (VM) that hosts the gateway.

1. [Download](https://aka.ms/opdg) and [install](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) the on-premises data gateway on your Windows VM.

1. Use the following PowerShell command to verify that your Windows VM can access your SAP instance on port 3300. Replace `sap.example.com` with your SAP server name.

    ``` powershell telnet sap.example.com 3300 ```

## Install the SAP .NET connector

To enable the on-premises data gateway to communicate with your SAP system, you need to install the SAP Connector for Microsoft .NET (NCo) on your on-premises data gateway Windows VM.

1. Go to the [SAP support portal](https://support.sap.com/en/product/connectors/msnet.html) and download the appropriate 64-bit NCo to your Windows VM.
1. Run the installer. Make sure to select **SAP .NET Connector for Microsoft .NET** during installation.

## Restart the gateway service

1. Open the on-premises data gateway app.
1. Select **Service Settings**.
1. Select **Restart now**.

## Verify the connection

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Data**.
1. Select **On-premises data gateways**.
1. Find and select your new gateway in the list.
1. Make sure that the status shows as *Online*.

## Create a test flow with the SAP ERP connector

1. Go to [Power Automate](https://make.preview.powerautomate.com) and create a flow.
1. Search for the SAP ERP connector and add a `Call SAP function (V3)` action to the flow.
1. Set up a new connection:
   - Name your connection (for example, *SAP-Test-Connection*)
   - For **Authentication Type**, select **Basic**.
   - Choose your on-premises data gateway.
   - Enter your SAP credentials.

## Set up and test the SAP action in the flow

1. In your flow, select the **Call SAP function** to open the settings panel.
1. For **SAP System**, enter your configuration values in JSON format; for example:

   ``` json {"AppServerHost": "sap.example.com","Client": "100" "SystemNumber": "00", "LogonType": "ApplicationServer"} ```

   For more parameter options, refer to the [documentation](/connectors/saperp/#call-sap-function-(v3)-(preview)).

1. For **RFC Name**, enter `STFC_CONNECTION`.
1. Wait for the input parameters to load.
1. Enter a test sentence for the required `REQUTEXT` parameter.
1. Save your flow.
1. Select **Test**.

After you verify that the SAP action is working, learn [best practices](/power-platform/well-architected/) for building powerful Power Platform solutions that work with your SAP system. You can also try out more complex functions in your flows.

## Troubleshooting tips

- If you see an *SAP Library load failure* error, make sure that the SAP .NET connector is installed correctly and then restart the on-premises data gateway.
- For connection issues, double-check your SAP credentials and System ID.
- Remember that the first connection might take up to two minutes to establish.

## Next step

> [!div class="nextstepaction"]
> [Set up Secure Network Communication](./secure-network-communications.md)
