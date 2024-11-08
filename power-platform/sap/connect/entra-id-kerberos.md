---
title: Set up Microsoft Entra ID with Kerberos for SSO
description: Learn how to set up the SAP ERP connector so that users can access your SAP data in Microsoft Power Platform using single sign-on with Microsoft Entra ID and Kerberos.
author: scottwoodallmsft
ms.author: scottwoodall
ms.reviewer: ellenwehrle
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
ms.topic: how-to
ms.date: 11/01/2024
---

<!-- EDITOR'S NOTE: I found these instructions: /power-bi/connect-data/service-gateway-sso-kerberos. Would it be possible just to point the relevant parts of this article to that one to eliminate redundant information? If not, no worries, but I'd still recommend that you use the organizational approach and examples from that article. It's very easy to follow, and you'd only need to change the parts that are specific to SAP. -->
<!-- EDITOR'S NOTE: I stopped editing at line 178. Please review the article again, especially confirming UI labels, proper text formatting for commands, user input, etc., and the accuracy of the instructions, and then resubmit for editing. Thanks! -->
<!-- EDITOR'S NOTE: Is it still "Active Directory" not "Microsoft Entra"?  -->

# Set up Microsoft Entra ID with Kerberos for SSO

You can set up the Power Platform SAP ERP connector to use Microsoft Entra ID credentials for Kerberos-based single sign-on (SSO). Your users can access SAP data and run SAP Remote Function Calls (RFCs) in Power Platform solutions without having to sign in multiple times to multiple services. This article walks you through the process, including configuring Kerberos constrained delegation on the on-premises data gateway for secure communication. Learn more in [Kerberos constrained delegation overview](/windows-server/security/kerberos/kerberos-constrained-delegation-overview).

These instructions assume that you're starting from scratch. Most customers have already completed some of the steps. Determining which steps you need to complete for your scenario is beyond the scope of this article.

- [Create an SAP service account in Active Directory Domain Services](#create-an-sap-service-account-in-ad-ds) (skip this section if your SAP system is already configured for Kerberos-based SSO)
<!-- EDITOR'S NOTE: Continue listing H2 headings to act as a mini TOC. -->


You'll need assistance from the following roles:

- Microsoft Entra ID admin
- SAP Basis admin
- Power Platform admin

## Prerequisites

- [A Windows server that has Active Directory Domain Services](/windows-server/identity/ad-ds/deploy/install-a-new-windows-server-2012-active-directory-forest--level-200-) (AD DS). The example domain name used in this guide is corp.bestrun.com (NetBIOS: CORP).

- [An on-premises data gateway server](https://www.microsoft.com/download/details.aspx?id=53127), version October 2024 or newer, joined to the Active Directory domain. Learn more in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Create an SAP service account in AD DS

If your SAP Basis admin confirms that your SAP system is already configured for Kerberos-based SSO, skip this section.

Perform the following steps as a domain admin.

1. On the domain controller host PC, open Microsoft Management Console (MMC) and run the Active Directory Users and Computers snap-in.

1. In your domain, right-click **Users** and select **New** > **User**.

1. Enter *Kerberos\<SID>* as the **Full name** and **User logon name**, where *\<SID>* is the ID of your SAP system, such as *A4H*.

1. Select **Next**.

1. Enter and confirm the password for the new service account.

1. Select both **User cannot change password** and **Password never expires**.

1. Select **Next**, and then select **Finish**.

With the service account created, next you'll define its Service Principal Name (SPN) and enable it for Kerberos encryption.

1. Open the ADSI Edit snap-in (adsiedit.msc) and connect to your domain.

1. Select **CN=Users** from your domain's default naming context.

1. Right-click the **CN=Kerberos\<SID>** user object and select **Properties**.

1. In the **Attributes** list, select **servicePrincipalName**.

1. Select **Edit**.

1. Enter the Service Principal Name in the format *SAP/\<SID>*, where *\<SID>* is the ID of your SAP system, such as *A4H*.

1. Select **Add**, and then select **OK**.

1. Go back to the Active Directory Users and Computers snap-in.

1. In the **Users** list, right-click the new SAP service account *Kerberos\<SID>* and select **Properties**.

1. Select the **Account** tab.

1. Under **Account options**, select **This account supports Kerberos AES 256 bit encryption**.

1. Select **OK**.

> [!IMPORTANT]
> Enabling Kerberos AES 256-bit encryption can cause problems for other clients, like SAP GUI, that request Kerberos tickets from this Active Directory account. This is because it changes the list of encryption methods available, and other clients no longer have a common encryption cipher. Check the Active Directory logs to determine which encryption methods all clients are using, and then manually update the `msDS-SupportedEncryptionTypes` property with the correct value. After the update, the AES 256 encryption option should appear automatically without needing to be selected manually. Learn more at [Decrypting the selection of supported Kerberos encryption types](https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/decrypting-the-selection-of-supported-kerberos-encryption-types/ba-p/1628797) on the Core infrastructure and Community blog.

## Set up Secure Network Communications with Kerberos SSO authentication in SAP

Perform the following steps as an SAP Basis admin in SAP GUI.

1. To start the SAP Single Sign-On wizard, enter *SNCWIZARD* in the Command field.

1. On the wizard **Start** page, select **Continue**.

1. Accept the default value for the system's **SNC Identity** and select **Continue**.

1. On the **Default Profile Parameters** page, select **Continue**.

1. Select **Close**.

1. Sign out from the SAP system and restart the SAP application server.

1. Sign in to SAP GUI and run SNCWIZARD again.

1. On the **Start** page, select **Continue**.

1. On the **Kerberos Credentials** page, select **Continue**.

1. In **SPNEGO Configuration**, select **Display/Change** to switch to edit mode, and then select **Add**.

1. Enter the following values:

    - **User Principal Name**: *Kerberos\<SID>@DOMAIN*, where *Kerberos\<SID>* is the service account user name and *DOMAIN* is the fully-qualified name of your Active Directory domain in uppercase letters; for example, *KerberosA4H(at)CORP.BESTRUN.COM*
    - **Password** and **Confirm Password**: The password that you entered when you created the Active Directory account

1. Select **Check User in Active Directory** to verify the user, and then select **Exit**.

1. Select **Save**.

1. On the **X.509 Credentials** page, select **Skip**.

1. Select **Complete**.

Next, map the SNC user name (based on the Windows domain user name) to the SAP User Principal Name.

1. In SAP GUI, run transaction *SU01*.

1. Enter the test user ID (for example, *JDAVIS*) in the **User** field, and then select **Change**.

1. Select the **SNC** tab.

1. Enter the User Principal Name in the **SNC name** field; for example, *p:CN=JDAVIS(at)CORP.BESTRUN.COM*.

1. Select **Save**.

## Set up the on-premises data gateway for Kerberos Constrained Delegation

By default, the on-premises gateway runs as the machine-local service account `NT Service\PBIEgwService`. To use Kerberos Constrained Delegation with the protocol's S4U extensions, the gateway has to run as a service account in the domain.

Perform the following steps as a domain admin.

1. On the Domain Controller host PC, go back to the Active Directory Users and Computers snap-in.

1. In your domain, right-click **Users** and select **New** > **User**.

1. Enter *GatewaySvc* as the **Full name** and **User logon name**.

1. Select **Next**.

1. Enter and confirm the password for the new domain service account.

1. Select both **User cannot change password** and **Password never expires**.

1. Select **Next**, and then select **Finish**.

With the domain service account created, next you'll define its Service Principal Name and enable it for Kerberos constrained delegation.

1. In an elevated PowerShell window, enter the following command to create an SPN for the new service account. Replace *\<OPDG hostname>* with the hostname of your on-premises data gateway and *\<domain>* with the name of your domain. You can find out the hostname by entering the command `hostname` at a command prompt.

    ```cmd
    setspn –s gateway/<OPDG hostname> <domain>\GatewaySvc
    ```

1. In the Active Directory Users and Computers snap-in, right-click the new service account and select **Properties**.

1. Select the **Delegation** tab.

1. Select **Trust this user for delegation to specified services only** and **Use any authentication protocol**.

1. Select **Add**.

1. Select **Users or Computers**.

1. Enter *Kerberos\<SID>* in the object names field, where *\<SID>* is the ID of your SAP system, such as *A4H*.

1. Select **Check Names**, and then select **OK**.

The list of allowed services now contains the SPN of the SAP system. The new gateway service account can request a service ticket only for the SAP system on behalf of the propagated user with the Kerberos S4U2proxy protocol extension.

1. Select Select All.
1. Select OK.
1. Select OK a second time.
1. The OPDG service account must be granted to local policies on the OPDG host. Perform this configuration with the Local Group Policy Editor by running gpedit.msc from an Administrator command prompt.
1. Go to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment. Grant the OPDG domain service account (for example "CORP\GatewaySvc") the local policy Act as part of the operating system by double-clicking on it.
1. Select Add User or Group.
1. Enter the name of your OPDG's domain service account (for example "GatewaySvc") and select Check Names to resolve it to the full existent name. Select OK. The service account's domain name (for example "CORP\GatewaySvc") is now added to the policy's user list. Select OK to apply the new configuration.
1. Repeat the same step for the Impersonate a client after authentication policy by double-clicking on it. Select Add User or Group and resolve the OPDG's service account to the full existent name with Check Names. Select OK.
1. The service account's name (for example "CORP\GatewaySvc") is now added to the policy's user list. Select OK. Close the Local Group Policy Editor.
1. Start the OPDG app from the desktop link on the gateway host, or by running C:\Program Files\On-premises data gateway\EnterpriseGatewayConfigurator.exe. Select Sign in to sign-in as the Power Platform System administrator user who registered the OPDG in the environment.
1. Select Service Settings from the configurator's menu. Select Change account.
1. Select Apply and Restart.
1. Enter your OPDG's service account name (for example "CORP\GatewaySvc") and password. Select Configure.
1. Provide your Power Platform System administrator sign-in account, by selecting Sign in.
1. Select Migrate, restore or takeover an existing gateway to restore your gateway registration.
1. Select your gateway cluster and instance from the drop-down boxes and provide the recovery key chosen during the initial registration. Select Configure.
1. After the restoration is complete, your OPDG service instance uses the domain service account (for example "CORP\GatewaySvc").

## Install and configure the SAP Cryptographic Library

For SNC communication between the OPDG and the SAP system, the SAP Cryptographic Library must be installed on the gateway host along with [SAP NCo 3.1](https://support.sap.com/en/product/connectors/msnet.html).

1. Download the latest version of the SAP Cryptographic Library from the [SAP Support Portal's Software Download](https://support.sap.com/en/my-support/software-downloads.html) (S-User required), and copy the library file (sapcrypto.dll) to the OPDG's installation directory on the gateway host (C:\Program Files\On-premises data gateway). Right-click on the sapcrypto.dll file and select Properties from the context menu.
1. Switch to the Details tab to check the version of the library. It should be 8.5.25 or newer. Select OK.
1. Create a new text file sapcrypto.ini in the same directory (C:\Program Files\On-premises data gateway) with this content:ccl/snc/enable_kerberos_in_client_role = 1.
1. Save the file.
1. Create a CCL_PROFILE system environment variable and set its value to the path of the sapcrypto.ini configuration file. On the gateway host, launch the Control Panel and navigate to System and Security -> System. Select Advanced system settings.
1. Select Environment Variables.
1. Under System variables, select New.
1. Enter CCL_PROFILE as the variable name. For the variable value, enter the full path to your sapcrypto.ini file, for example C:\Program Files\On-premises data gateway\sapcrypto.ini. Select OK.
1. Select OK a second time.

## Configure the FullDomainResolutionEnabled OPDG setting

To help the OPDG when looking up Active Directory users, we need to set a configuration value in the OPDG settings.

1. On the gateway host, open the file Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config in the OPDG installation folder (C:\Program Files\On-premises data gateway) in an editor.
1. Search for the setting FullDomainResolutionEnabled and set its value to True.
1. Select Restart now from the OPDG's configurator Service Settings tab to apply the changes.

## Configure User Mappings in Active Directory

If Microsoft Entra ID User Principal Names are the same as the Active Directory on-premises email property, then this step can be skipped.

To enable Kerberos-based principal propagation for a user in this scenario, a mapping from the user's full username (User Principal Name, UPN) in Microsoft Entra ID to the user's local name in Active Directory is required. For this purpose, we use the unused attribute msDS-cloudExtensionAttribute1 of the local Active Directory user to store the Microsoft Entra ID UPN. Any other unused Active Directory attribute can be used as well.

For the application test user Jack Davis in this scenario, set the msDS-cloudExtensionAttribute1 attribute of the local Active Directory domain user account jdavis@corp.bestrun.com to the user's Microsoft Entra ID UPN jdavis@bestruncorp.onmicrosoft.com for linking his two accounts.

1. On the gateway host, open the file Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config in the OPDG installation folder (C:\Program Files\On-premises data gateway) in an editor.
1. Search for the setting ADUserNameReplacementProperty and set its value to SAMAccountName.
1. Search for the setting ADUserNameLookupProperty and set it to the value msDS-cloudExtensionAttribute1. Save the changes in the file.
1. Select Restart now from the OPDG's configurator Service Settings tab to apply the changes.
1. On the Domain Controller host, select Start, and select Windows Administrative Tools -> ADSI Edit from the menu. In the ADSI Editor, navigate in the left-side object tree to CN=Users under the domain's default naming context. Right-click on the test user's object (for example CN=Jack Davis) and select Properties from the context menu.
1. Select the attribute msDS-cloudExtensionAttribute1 from the list and select Edit.
1. Enter the test user's Microsoft Entra ID UPN (for example jdavis@\<domainname>.onmicrosoft.com) in the Value field. Replace \<domainname> with your Microsoft Entra ID tenant's domain name, for example, bestruncorp. Select OK.

## Create a Power Automate Flow

All on-premises components (SAP system, OPDG, and AD) are now configured properly for Kerberos-based principal propagation. In this step, create and run a Power Automate Flow to test the configuration.

1. Sign-in to Power Automates at [https://make.powerautomate.com](https://make.powerautomate.com).
1. Select My Flows -> New Flow -> Instant cloud flow
1. Give the Flow a name, select Manually trigger a flow, and select Create.
1. Add the SAP ERP connector action Call SAP function (V3) to your Flow.
1. If you don't have any SAP ERP connections created, you're prompted to create one. If you have an existing connection, create a new one.
    - Authentication Type should be Microsoft Entra ID (with Kerberos)
    - Data Gateway should be the OPDG that was configured in this guide.
    - Select Sign-in.
1. In the SAP ERP Call SAP function (V3) action, set the following parameters:
    - RFC Name is set to STFC_CONNECTION
    - SAP system is set to (change these values according to your SAP Basis admin)

    json
    {
        "AppServerHost": "\<SAP Server Name>",
        "Client": "\<SAP Client>",
        "LogonType": "ApplicationServer",
        "SncLibraryPath": "C:\\Program Files\\On-premises data gateway\\sapcrypto.dll",
        "SncPartnerName": "p:\<SAP Partner Name>",
        "SncQOP": "Default",
        "SncSso": "On",
        "SystemNumber": "\<SAP System Number>",
        "UseSnc": "true"
    }
    

1. If everything was successful, a REQUTEXT parameter where a value like Hello World can be entered.
1. Save and test the flow.
