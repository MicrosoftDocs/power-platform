# Get started with the SAP ERP connector for Power Platform

The SAP ERP connector for Power Platform helps you seamlessly integrate your SAP systems with Microsoft Power Platform. This guide walks you through setting up the connector so you can start creating flows that work with your SAP environment.

> [!IMPORTANT]
> This article is for setting up a Proof of Concept only. The settings and recommendations are not intended for production use. Please consult your security team, internal policies, and Microsoft Partner for further guidance.

## What you'll need

Before you begin, make sure you have:

- Access to Microsoft Power Platform
- An SAP system
- Admin rights on a Windows virtual machine (VM)
- An SAP S-User account

## Set up the on-premises data gateway

1. Download and install the [on-premises data gateway](https://aka.ms/opdg) on your Windows VM.
2. Launch the installer and follow these steps:
   - Accept the terms of use
   - Sign in with your Power Platform account
   - Select **Register a new gateway**
   - Name your gateway (for example, "SAP-Gateway")
   - Create a recovery key

## Check your gateway connection

1. Open the Power Platform admin center.
2. Go to **Gateways**.
3. Find your new gateway.
4. Make sure the status shows as "Online".

## Install the SAP .NET connector

1. Go to the [SAP Support Portal](https://support.sap.com/en/product/connectors/msnet.html) and download the SAP Connector for Microsoft .NET.
2. Select the .NET Standard 64-bit version.
3. Run the installer.
4. Make sure to select "SAP .NET Connector for Microsoft .NET" during installation.

## Restart the gateway service

1. Open the On-premises data gateway app.
2. Select **Service Settings**.
3. Select **Restart now**.

## Create a flow with the SAP ERP connector

1. Open Power Automate.
2. Create a new flow.
3. Add the "Call SAP function (V3)" action.
4. Set up a new connection:
   - Name your connection (for example, "SAP-Test-Connection")
   - For Authentication Type, select **Basic**
   - Choose your on-premises data gateway
   - Enter your SAP username and password

## Set up and test the SAP action

1. In your flow, select an SAP function (for example, "Call function module").
2. For the SAP System, enter this JSON data (replace with your own values):

   ```json
   {
     "AppServerHost": "sap.example.com",
     "Client": "100",
     "SystemNumber": "00",
     "LogonType": "ApplicationServer"
   }
   ```

3. For RFC Name, enter `STFC_CONNECTION`.
4. Wait for the input parameters to load.
5. Enter a test sentence for the required `REQUTEXT` parameter.
6. Save your flow.
7. Select **Test** to run your flow.

## Troubleshooting tips

- If you see a "SAP Library load failure" error, make sure you've installed the SAP .NET Connector correctly and restarted the gateway service.
- For connection issues, double-check your SAP credentials and system ID.
- Remember that the first connection may take up to 2 minutes to establish.

## Next steps

Now that you've set up the SAP ERP connector for Power Platform, you can:

- Try out more complex SAP functions in your flows
- Set up Secure Network Communication (SNC) for better security between the on-premises data gateway and your SAP system

By following this guide, you've successfully set up the SAP ERP connector. You're now ready to create powerful integrations between your SAP systems and Microsoft Power Platform solutions.
