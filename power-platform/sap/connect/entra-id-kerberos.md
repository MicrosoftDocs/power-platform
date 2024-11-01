---
title: Set up Microsoft Entra ID with Kerberos for SSO
description: This guide walks you through setting up the SAP ERP connector so users can access SAP and run RFCs in Microsoft Power Platform using their Microsoft Entra ID for authentication.
author: scottwoodallmsft
ms.author: scottwoodall
ms.reviewer: ellenwehrle
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
ms.topic: how-to
ms.date: 11/01/2024
---

# Microsoft Entra ID with Kerberos for SSO

This guide walks you through setting up the SAP ERP connector so your users can access SAP data and run Remote Function Calls (RFC) in Microsoft Power Platform using their Microsoft Entra ID for authentication. T​he process involves configuring Kerberos constrained delegation on the on-premises data gateway for secure communication.

This guide assumes you're starting from scratch and must configure everything. Most customers have some of these steps already completed. It's out of scope of this document to determine what steps to complete for your scenario.

You'll need assistance from the following roles:

- Active Directory admin
- SAP Basis admin
- Power Platform admin

## Prerequisites

- [A Windows server that has Active Directory Domain Services (AD DS role)](/windows-server/identity/ad-ds/deploy/install-a-new-windows-server-2012-active-directory-forest--level-200-). Note, the domain name used in this guide is corp.bestrun.com (NetBIOS: CORP), but you can can choose any other name.

- [On-premises Data Gateway (OPDG) server](https://www.microsoft.com/download/details.aspx?id=53127), minimum version October 2024 or newer. Installation instructions and how to register the OPDG in your Power Platform environment can be found [here](/data-integration/gateway/service-gateway-install) joined to the Active Directory domain.

## Configure SAP for Kerberos-based SSO with Active Directory

You can skip this section if your SAP system is already configured for Kerberos-based SSO. Consult with the SAP Basis team to determine this.

1. As a domain administrator:
    1. Launch the `Active Directory Users and Computers` Microsoft Management Console (MMC) snap-in on the Domain Controller host.
    1. `Right-click` on `Users` in your domain to open the context menu and select `New -> User` to create the new service account for the SAP system.
1. Enter `Kerberos<SID>` as the `First name`, `Full name`, and `User login name`. Replace `<SID>` with the ID of your SAP system (for example "A4H") then select `Next`.
1. Enter the password for the new service user account. Select `User cannot change password`, and `Password never expires` then select `Next`.
1. Select `Finish`.
1. Start the `ADSI Editor (adsiedit.msc)` to define the Service Principal Name (SPN) of the new service account.
    - Select `CN=Users` from your domain's default naming context, and right-click on the `CN=Kerberos<SID>` user object.
    - From the context menu, select `Properties`.
    - Select `servicePrincipalName` from the list.
    - Select `Edit`.
    - Enter the Service Principal Name (SPN) for the SAP service account in the format `SAP/<SID>`. Replace `<SID>` with the ID of your SAP system (for example "A4H").
    - Select `Add`.
    - Select `OK`.
1. Go back to the `Active Directory Users and Computers MMC` snap-in, and select the new SAP service account `Kerberos<SID>` from the Users list. Right-click on it and select `Properties` from the context menu.
1. Switch to the `Account` tab. Under `Account options`, activate the checkbox for `This account supports Kerberos AES 256 bit encryption`. Select `OK`.

   > [!IMPORTANT]
   > By enabling `Kererbos AES 256 bit encryption`, this is potentially a breaking change for other clients (SAP GUI, for example) requesting Kerberos tickets from this Active Directory service principal as it changes the list of encryption ciphers on this Active Directory account to a list where other clients now no longer have a common encryption cipher. Active Directory teams need to determine what encryption ciphers (though Active Directory logging) are being used with all clients and manually edit the msDS-SupportedEncryptionTypes property with the correct value. Once the msDS-SupportedEncryptionTypes is edited manually, the AES 256 encryption box should appear without having to manually check it. This [blog post](https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/decrypting-the-selection-of-supported-kerberos-encryption-types/ba-p/1628797) can help navigate the different encryption ciphers and what decimal/hex value needs to be set on the Active Directory service principal to make all clients happy.

1. Start SAP GUI and sign-in as the SAP administrator. Run transaction `SNCWIZARD` to start the SNC (Secure Network Communication) Configuration wizard.
1. On the `Start` page of the SNC Configuration wizard, select `Continue`.
1. Accept the default value for system's SNC Identity and select `Continue`.
1. Select `Continue`.
1. Select `Close`.
1. Sign out from the SAP system and restart the SAP application server.
1. After the restart of the application server, sign-in to SAP GUI and run transaction `SNCWIZARD` again.
1. On the `Start` screen, select `Continue`.
1. Select `Continue`.
1. In the `SPNEGO Configuration`, select `Display/Change` to switch into edit mode.
1. Select `Add` to configure a new Kerberos User Principal.
1. Enter the following values:
    - `User Principal Name`: Kerberos<SID>@<full-qualified name of your Active Directory Domain in uppercase letters, for example "CORP.BESTRUN.COM">
    - `Password`: The password you specified when creating the Active Directory Service Principal.
    - `Confirm Password`
1. Select `Exit`.
1. Select `Save` to store the updated SPNEGO Configuration.
1. Select `Skip` on the X.509 Credentials wizard step.
1. Select `Complete` to finalize the wizard.
1. Go back to SAP GUI and run transaction `SU01` to maintain the application user's SNC mapping. Enter the test user's ID (for example `JDAVIS`) in the `User` field and select `Change`.
1. Switch to the tab `SNC`. Maintain the user's `SNC name` by setting it to the users User Principal Name (for example `p:CN=JDAVIS@CORP.BESTRUN.COM`)
1. Select `Save`.

## Configure OPDG for Kerberos Constrained Delegation

By default, the OPDG runs as the machine-local service account `NT Service\PBIEgwService`. To use Kerberos Constrained Delegation with the protocol's S4U extensions, the OPDG has to run under a service account in the domain.

1. On the Domain Controller host, go back to the `Active Directory Users and Computers` Microsoft Management Console (MMC) snap-in. `Right-click` on `Users` in your domain and select `New -> User` from the context menu. Enter  `GatewaySvc` as the `First name`, `Full name`, and `User login name`. Select `Next`.
1. Enter the password for the OPDG domain service account. Select `User cannot change password` and `Password never expires`. Select `Next`.
1. Select `Finish`.
1. As the domain administrator, run the following command to create an SPN for the new service account which is required to configure the Kerberos delegation in the next step:
    - `setspn –S gateway/<OPDG hostname> <domain>\GatewaySvc`
    - Replace `<OPDG hostname>` with the hostname of your OPDG system. You can find out the name by entering the command `hostname`.
1. Right-click on the new service account and select `Properties` from the context menu.
1. Switch to the `Delegation` tab. Select `Trust this user for delegation to specified services only` and `Use any authentication protocol`. Select `Add`.
1. Select `Users or Computers`.
1. Enter `Kerberos<SID>` in the object names field. Replace `<SID>` with your SAP system's ID, for example "A4H". Select `Check Names` to resolve it to the full existent name. Select `OK`.
1. The list of allowed services now contains the value from the SPN (Service Type / Computer) of the SAP system. The new OPDG service account can request a service ticket only for the SAP system on-behalf-of the propagated user with the Kerberos S4U2proxy protocol extension. Select `Select All`.
1. Select `OK`.
1. Select `OK` a second time.
1. The OPDG service account must be granted to local policies on the OPDG host. Perform this configuration with the `Local Group Policy Editor` by running `gpedit.msc` from an Administrator command prompt.
1. Go to `Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment`. Grant the OPDG domain service account (for example "CORP\GatewaySvc") the local policy `Act as part of the operating system` by double-clicking on it.
1. Select `Add User or Group`.
1. Enter the name of your OPDG's domain service account (for example "GatewaySvc") and select `Check Names` to resolve it to the full existent name. Select `OK`. The service account's domain name (for example "CORP\GatewaySvc") is now added to the policy's user list. Select `OK` to apply the new configuration.
1. Repeat the same step for the `Impersonate a client after authentication policy` by double-clicking on it. Select `Add User or Group` and resolve the OPDG's service account to the full existent name with `Check Names`. Select `OK`.
1. The service account's name (for example "CORP\GatewaySvc") is now added to the policy's user list. Select `OK`. `Close` the Local Group Policy Editor.
1. Start the OPDG app from the desktop link on the gateway host, or by running `C:\Program Files\On-premises data gateway\EnterpriseGatewayConfigurator.exe`. Select `Sign in` to sign-in as the Power Platform System administrator user who registered the OPDG in the environment.
1. Select `Service Settings` from the configurator's menu. Select `Change account`.
1. Select `Apply and Restart`.
1. Enter your OPDG's service account name (for example "CORP\GatewaySvc") and password. Select `Configure`.
1. Provide your Power Platform System administrator sign-in account, by selecting `Sign in`.
1. Select `Migrate, restore or takeover an existing gateway` to restore your gateway registration.
1. Select your gateway cluster and instance from the drop-down boxes and provide the recovery key chosen during the initial registration. Select `Configure`.
1. After the restoration is complete, your OPDG service instance uses the domain service account (for example "CORP\GatewaySvc").

## Install and configure the SAP Cryptographic Library

For SNC communication between the OPDG and the SAP system, the SAP Cryptographic Library must be installed on the gateway host along with [SAP NCo 3.1](https://support.sap.com/en/product/connectors/msnet.html).

1. Download the latest version of the SAP Cryptographic Library from the [SAP Support Portal's Software Download](https://support.sap.com/en/my-support/software-downloads.html) (S-User required), and copy the library file (`sapcrypto.dll`) to the OPDG's installation directory on the gateway host (`C:\Program Files\On-premises data gateway`). Right-click on the `sapcrypto.dll` file and select Properties from the context menu.
1. Switch to the `Details` tab to check the version of the library. It should be 8.5.25 or newer. Select `OK`.
1. Create a new text file `sapcrypto.ini` in the same directory (`C:\Program Files\On-premises data gateway`) with this content:`ccl/snc/enable_kerberos_in_client_role = 1`.
1. `Save` the file.
1. Create a `CCL_PROFILE` system environment variable and set its value to the path of the `sapcrypto.ini` configuration file. On the gateway host, launch the `Control Panel` and navigate to `System and Security -> System`. Select `Advanced system settings`.
1. Select `Environment Variables`.
1. Under System variables, select `New`.
1. Enter `CCL_PROFILE` as the variable name. For the variable value, enter the full path to your `sapcrypto.ini` file, for example `C:\Program Files\On-premises data gateway\sapcrypto.ini`. Select `OK`.
1. Select `OK` a second time.

## Configure the FullDomainResolutionEnabled OPDG setting

To help the OPDG when looking up Active Directory users, we need to set a configuration value in the OPDG settings.

1. On the gateway host, open the file `Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config` in the OPDG installation folder (`C:\Program Files\On-premises data gateway`) in an editor.
1. Search for the setting `FullDomainResolutionEnabled` and set its value to `True`.
1. Select `Restart now` from the OPDG's configurator `Service Settings` tab to apply the changes.

## Configure User Mappings in Active Directory

If Microsoft Entra ID User Principal Names are the same as the Active Directory on-premises email property, then this step can be skipped.

To enable Kerberos-based principal propagation for a user in this scenario, a mapping from the user's full username (User Principal Name, UPN) in Microsoft Entra ID to the user's local name in Active Directory is required. For this purpose, we use the unused attribute `msDS-cloudExtensionAttribute1` of the local Active Directory user to store the Microsoft Entra ID UPN. Any other unused Active Directory attribute can be used as well.

For the application test user Jack Davis in this scenario, set the `msDS-cloudExtensionAttribute1` attribute of the local Active Directory domain user account `jdavis@corp.bestrun.com` to the user's Microsoft Entra ID UPN `jdavis@bestruncorp.onmicrosoft.com` for linking his two accounts.

1. On the gateway host, open the file `Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config` in the OPDG installation folder (`C:\Program Files\On-premises data gateway`) in an editor.
1. Search for the setting `ADUserNameReplacementProperty` and set its value to `SAMAccountName`.
1. Search for the setting `ADUserNameLookupProperty` and set it to the value `msDS-cloudExtensionAttribute1`. Save the changes in the file.
1. Select `Restart now` from the OPDG's configurator `Service Settings` tab to apply the changes.
1. On the Domain Controller host, select `Start`, and select `Windows Administrative Tools -> ADSI Edit` from the menu. In the ADSI Editor, navigate in the left-side object tree to `CN=Users` under the domain's default naming context. Right-click on the test user's object (for example `CN=Jack Davis`) and select `Properties` from the context menu.
1. Select the attribute `msDS-cloudExtensionAttribute1` from the list and select `Edit`.
1. Enter the test user's Microsoft Entra ID UPN (for example `jdavis@<domainname>.onmicrosoft.com`) in the Value field. Replace `<domainname>` with your Microsoft Entra ID tenant's domain name, for example, bestruncorp. Select `OK`.

## Create a Power Automate Flow

All on-premises components (SAP system, OPDG, and AD) are now configured properly for Kerberos-based principal propagation. In this step, create and run a Power Automate Flow to test the configuration.

1. Sign-in to Power Automates at [https://make.powerautomate.com](https://make.powerautomate.com).
1. Select `My Flows -> New Flow -> Instant cloud flow`
1. Give the Flow a name, select `Manually trigger a flow`, and select `Create`.
1. Add the SAP ERP connector action `Call SAP function (V3)` to your Flow.
1. If you don't have any SAP ERP connections created, you're prompted to create one. If you have an existing connection, create a new one.
    - `Authentication Type` should be `Microsoft Entra ID (with Kerberos)`
    - `Data Gateway` should be the OPDG that was configured in this guide.
    - Select `Sign-in`.
1. In the SAP ERP `Call SAP function (V3)` action, set the following parameters:
    - `RFC Name` is set to `STFC_CONNECTION`
    - `SAP system` is set to (change these values according to your SAP Basis admin)

    ```json
    {
        "AppServerHost": "<SAP Server Name>",
        "Client": "<SAP Client>",
        "LogonType": "ApplicationServer",
        "SncLibraryPath": "C:\\Program Files\\On-premises data gateway\\sapcrypto.dll",
        "SncPartnerName": "p:<SAP Partner Name>",
        "SncQOP": "Default",
        "SncSso": "On",
        "SystemNumber": "<SAP System Number>",
        "UseSnc": "true"
    }
    ```

1. If everything was successful, a `REQUTEXT` parameter where a value like `Hello World` can be entered.
1. Save and test the flow.
