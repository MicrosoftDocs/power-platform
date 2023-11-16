---
title: Configure authentication for SAP Procurement solutions
description: Learn how to streamline access management to SAP for your Microsoft Power Platform users by enabling SSO.
author: jongilman88
ms.author: jongilman
contributors:
  - microsoft-george
  - robinsonshields 
  - EllenWehrle
  - tverhasselt
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

# Configure authentication for SAP Procurement solution

The [SAP ERP connector](/connectors/saperp/) is designed for use by multiple users of an application; therefore, the connections aren't shared. The user credentials are provided in the connection, while other details required to connect to the SAP system (like server details and security configuration) are provided as part of the action.

Enabling single sign-on (SSO) makes it easy to refresh data from SAP while adhering to user-level permissions configured in SAP. There are several ways you can set up SSO for streamlined identity and access management.

The SAP ERP connector supports the following authentication types:

| Authentication type | How a user connects  |  Configuration steps |
|--------------|--------------|----------------|
| [SAP authentication](/connectors/saperp/#sap-authentication)     | Use SAP user name and password to access SAP server.  | Step 4        |
| [Windows authentication](/connectors/saperp/#windows-authentication)     | Use Windows user name and password to access SAP server. |   Steps 1, 2, 3, 4      |
| [Entra ID (Azure AD) authentication](/connectors/saperp/#azure-ad-integrated)    | Use Entra ID to access SAP server. | Steps 1, 2, 3, 4     |

> [!NOTE]
> Specific administrative privileges are required to set up SSO in Azure and SAP. Be sure to obtain the necessary admin privileges for each system before setting up SSO.
More information:

- [Microsoft Entra documentation](/entra/)
- [SAP Identity and Access Management (IAM) Help Portal](https://help.sap.com/docs/btp/sap-business-technology-platform/identity-and-access-management-iam)

## Step 1: Configure Kerberos constrained delegation

[Kerberos constrained delegation (KCD)](/windows-server/security/kerberos/kerberos-constrained-delegation-overview) provides secure user or service access to resources permitted by administrators without multiple requests for credentials. Kerberos constrained delegation needs to be configured for Windows and Entra ID (Azure AD) authentication.

Run the gateway Windows service as a domain account with Service Principal Names (SPNs) (SetSPN).

Configuration tasks:

1. [Configure an SPN for the gateway service account](/power-bi/connect-data/service-gateway-sso-kerberos#configure-an-spn-for-the-gateway-service-account). A domain  administrator uses the [Setspn tool](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc731241(v=ws.11)) that comes with Windows to enable delegation.

1. [Adjust communication settings for the gateway](/data-integration/gateway/service-gateway-communication). Enable outbound Entra (Azure) connections and review your firewall and port setups to ensure communication.

1. [Configure for standard Kerberos constrained delegation](/power-bi/connect-data/service-gateway-sso-kerberos#option-a-standard-kerberos-constrained-delegation). A domain administrator is required to configure a domain account for a service and it restricts the account to run on a single domain.

1. [Grant the gateway service account local policy rights on the gateway machine](/power-bi/connect-data/service-gateway-sso-kerberos#step-6-grant-the-gateway-service-account-local-policy-rights-on-the-gateway-machine).

1. [Add gateway service account to Windows Authorization and Access Group](/power-bi/connect-data/service-gateway-sso-kerberos#add-gateway-service-account-to-windows-authorization-and-access-group).

1. [Set user-mapping configuration parameters on the gateway machine](/power-bi/connect-data/service-gateway-sso-kerberos#set-user-mapping-configuration-parameters-on-the-gateway-machine).

1. [Change the gateway service account to a domain account](/data-integration/gateway/service-gateway-service-account). In a standard installation, the gateway runs as the default machine-local service account, _NT Service\PBIEgwService_. It must run as a domain account in order to facilitate Kerberos tickets for SSO.

More information:

- [Kerberos constrained delegation overview](/windows-server/security/kerberos/kerberos-constrained-delegation-overview)
- [Configure Kerberos-based SSO to on-premises data sources](/power-bi/connect-data/service-gateway-sso-kerberos)

## Step 2: Configure SAP ERP to enable using CommonCryptoLib (sapcrypto.dll)

To use SSO to access your SAP server, make sure:

- You configure your SAP server for Kerberos SSO using CommonCryptoLib as its Secure Network Communication (SNC) library.
- Your SNC name starts with _CN_.

> [!IMPORTANT]
>
> Ensure that SAP Secure Login Client (SLC) isn't running on the computer the gateway is installed on. SLC caches Kerberos tickets in a way that can interfere with the gateway's ability to use Kerberos for SSO. For more information, review [SAP Note 2780475](https://support.sap.com/en/my-support/knowledge-base.html?anchorId=section_1391401241) (s-user required).

1. [Download](https://help.sap.com/docs/help/a76169f317b44b1e87bd0bd2573cba2b/6f6d555ceb0a4e2fb6d1376331f4d34c.html?version=SP6) 64-bit CommonCryptoLib (`sapcrypto.dll`) version 8.5.25 or later from the SAP Launchpad, and copy it to a folder on your gateway machine.

1. In the same directory where you copied `sapcrypto.dll`, create a file named `sapcrypto.ini`, with the following content:

    `ccl/snc/enable_kerberos_in_client_role = 1`

    The `.ini` file contains configuration information required by CommonCryptoLib to enable SSO in the gateway scenario. Ensure that the path (such as,`c:\sapcryptolib\`) contains both `sapcrypto.ini` and `sapcrypto.dll`. The `.dll` and `.ini` files must exist in the same location.

1. Grant permissions to both the `.ini` and `.dll` files to the _Authenticated Users_ group. Both the gateway service user and the Active Directory (AD) user that the service user impersonates need _read_ and _execute_ permissions for both files.

1. Create a `CCL_PROFILE` system environment variable and set its value to the path `sapcrypto.ini`.

1. Restart the gateway service.

More information: [Use Kerberos single sign-on for SSO to SAP BW using CommonCryptoLib](/power-bi/connect-data/service-gateway-sso-kerberos-sap-bw-commoncryptolib)

## Step 3: Enable SAP SNC for Azure AD and Windows authentication

The SAP ERP connector supports Entra ID, formerly Azure AD, and Windows server AD authentication by enabling SAP's [Secure Network Communication (SNC)](https://help.sap.com/doc/saphelp_nw74/7.4.16/en-us/e6/56f466e99a11d1a5b00000e835363f/content.htm?no_cache=true). SNC is a software layer in the SAP system architecture that provides an interface to external security products so secure single sign-on to SAP environments can be established. The following property guidance helps with setup.

| Property | Description |
|---------|---------|
| Use SNC     |  Set to **Yes** if you want to enable SNC.       |
| SNC library     |  The SNC library name or path relative to NCo installation location or absolute path. Examples are `sapcrypto.dll`, or `c:\sapcryptolib\sapcryptolib.dll`.      |
| SNC SSO     | Specifies whether the connector uses the identity of the service or the end user credentials. Set to **On** to use the identity of the end user.   |
| SNC Partner Name     | The name of the back-end SNC server. Example, `p:CN=SAPserver`. |
| SNC Quality of Protection     |  The quality of service used for SNC communication of this particular destination or server. The default value is defined by the back-end system. The maximum value is defined by the security product used for SNC. |

The SAP SNC name for the user must equal the user's Active Directory fully qualified domain name. For example `p:CN=JANEDOE@REDMOND.CORP.CONTOSO.COM` must equal `JANEDOE@REDMOND.CORP.CONTOSO.COM`.

> [!NOTE]
>
> Entra ID (Azure AD) auth only—the _Active DirectorySAP Service Principal_ account must have AES 128 or AES 256 defined on the _msDS-SupportedEncryptionType_ attribute.

## Step 4: Set up SAP server and user accounts to allow actions

Review [SAP Note 460089 - Minimum authorization profiles for external RFC programs](https://accounts.sap.com/) to learn more about the supported user-account types and the minimum required authorization for each action type, like remote function call (RFC), business application programming interface (BAPI), and intermediate document (IDOC).

SAP user accounts need to access the `RFC_Metadata` function group and the respective function modules for the following operations:

| Operations | Access to function modules  |
|------------|-----------------------------|
|RFC actions    | `RFC_GROUP_SEARCH` and `DD_LANGU_TO_ISOLA`  |
|Read Table action   | Either `RFC BBP_RFC_READ_TABLE` or `RFC_READ_TABLE` |
|Grant strict minimum access to SAP server for your SAP connection  | `RFC_METADATA_GET` and `RFC_METADATA_GET_TIMESTAMP`|

## Related content

[SAP Single Sign-On](https://help.sap.com/docs/SAP_SINGLE_SIGN-ON)

[Secure Login for SAP Single Sign-On Implementation Guide](https://help.sap.com/docs/SAP_SINGLE_SIGN-ON/df185fd53bb645b1bd99284ee4e4a750/631b1669678d41d79d94601c238e218b.html)

[SAP Identity and Access Management (IAM) Help Portal](https://help.sap.com/docs/btp/sap-business-technology-platform/identity-and-access-management-iam)

[SAP ERP connector](/connectors/saperp/)

[Azure Logic Apps SAP connector](/azure/logic-apps/logic-apps-using-sap-connector)

[Data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention)

[Hybrid architecture design](/azure/architecture/hybrid/hybrid-start-here)

## Next steps

[Install solutions](install.md)

## See also

[Get started with the SAP Procurement template](get-started.md)
