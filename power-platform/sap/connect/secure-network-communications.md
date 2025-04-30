---
title: Set up Secure Network Communications
description: Learn how to create a secure encrypted connection between the on-premises data gateway and SAP using SNC.
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
---

# Set up Secure Network Communications

Secure Network Communications (SNC) enhances the security of your SAP integration with Power Platform by encrypting the data between an on-premises data gateway and a SAP system. This article walks you through setting up SNC as a proof of concept.

> [!IMPORTANT]
> **The settings and recommendations presented in this article are not intended for production use.** Consult your security team, internal policies, and Microsoft Partner for guidance in setting up SNC in a production environment.

## Prerequisites

 1. [You have a SAP connection that uses the SAP ERP connector](sap-erp-connector.md).
 1. You have access to a SAP instance that you can restart and administer.
 1. The SAP GUI is installed and set up.
 1. You're familiar with public and private key technologies.
 1. OpenSSL is installed and set up. If you have Git for Windows, add `C:\Program Files\Git\usr\bin\` to your system PATH so that you can use the `openssl` command.

## Install SAP Common Crypto Library

SAP Common Crypto Library enables the SAP Connector for Microsoft .NET (NCo) to encrypt communications between the on-premises data gateway and SAP. To extract the library, you need a proprietary decompression utility called SAPCAR.

### Get SAPCAR

1. Go to the [SAP Software Download Center](https://me.sap.com/softwarecenter) and sign in with your SAP credentials.
1. Search for *SAPCAR* and select the latest non-archived version.
1. Select your operating system.
1. Download the .EXE file to `C:\sap\SAR`.

### Get SAP Common Crypto Library

1. In the SAP Software Download Center, search for "COMMONCRYPTOLIB" and select the latest version.
1. Select your operating system.
1. Download the .SAR file with the most recent release date to `C:\sap\SAR`.

### Extract SAP Common Crypto Library

1. Open PowerShell and go to `C:\sap\SAR`.
1. Enter the following command, replacing `xxxx` with your values:

   ```powershell
   .\SAPCAR_xxxx.EXE -xvf .\SAPCRYPTOLIBP_xxxx.SAR -R .\..\libs\sapcryptolib
   ```

1. Confirm that `sapgenpse.exe` is in the `C:\sap\libs\sapcryptolib` directory.

## Generate certificates

Now that you've installed SAP Common Crypto Library, you can generate certificates to establish trust and encryption between your on-premises data gateway and the SAP system.

> [!WARNING]
> This method is for demonstration purposes only and is not recommended for production systems.
> For production systems, consult your internal PKI guidance or security team.

In this example, our certificates are structured as shown in the following diagram. Root CA [O=Contoso, CN=Root CA] signs the SNC encryption certificate [O=Contoso, CN=SNC] and the user certificates [O=Contoso, CN=`UserIDs`].
This article focuses on setting up the Root CA and SNC certificates.

:::image type="content" source="./media/setup-secure-network-communications/fc-pki-demo.svg" alt-text="Diagram showing certificate flow from Root CA to Encryption Cert, Signing Cert, and userIDs.":::

### Create certificates

1. Set up the folder structure:

   ```powershell
   mkdir rootCA
   mkdir sncCert
   
   # Create the necessary serial and index files if they don't exist
   if (-Not (Test-Path "rootCA\index.txt")) { New-Item -Path "rootCA\index.txt" -ItemType File }
   if (-Not (Test-Path "rootCA\serial")) { Set-Content -Path "rootCA\serial" -Value "01" }
   ```

1. Generate a Root CA:

   ```powershell
   openssl genpkey -algorithm RSA -out rootCA/ca.key.pem -pkeyopt rsa_keygen_bits:2048
   openssl req -x509 -new -key rootCA/ca.key.pem -days 7305 -sha256 -extensions v3_ca -out rootCA/ca.cert.pem -subj "/O=Contoso/CN=Root CA"
   ```

1. Generate the SNC certificate:

   ```powershell
   openssl genrsa -out sncCert/snc.key.pem 2048
   openssl req -key sncCert/snc.key.pem -new -sha256 -out sncCert/snc.csr.pem -subj "/O=Contoso/CN=SNC"
   ```

1. Create an OpenSSL configuration file, `sncCert/extensions.cnf`, for signing:

   ```cnf
   [ v3_leaf ]
   subjectKeyIdentifier = hash
   authorityKeyIdentifier = keyid,issuer
   basicConstraints = critical,CA:false
   keyUsage = critical,digitalSignature,keyEncipherment,dataEncipherment
   extendedKeyUsage = clientAuth,emailProtection
   ```

1. Sign the SNC certificate with the Root CA:

   ```powershell
   openssl x509 -req `
      -in sncCert/snc.csr.pem `
      -CA rootCA/ca.cert.pem `
      -CAkey rootCA/ca.key.pem `
      -CAcreateserial `
      -out sncCert/snc.cert.pem `
      -days 3650 `
      -sha256 `
      -extfile sncCert\extensions.cnf `
      -extensions v3_leaf
   ```

## Create a Personal Secure Environment

Create a Personal Secure Environment (PSE) for the on-premises data gateway. The NCo library looks for the SNC certificate inside the PSE.

1. Create a PKCS#12 container:

   ```powershell
   openssl pkcs12 -export -out snc.p12 -inkey sncCert\snc.key.pem -in sncCert\snc.cert.pem -certfile rootCA\ca.cert.pem
   ```

1. Create the SECUDIR environment variable:

    1. Open **System Properties**: In File Explorer, right-click **This PC**, and then select **Properties** > **Advanced system settings**.
    1. Select **Environment Variables**.
    1. Under **System variables**, select **New**.
    1. Set the variable name to `SECUDIR`.
    1. Set the value to `C:\sapsecudir` (create this directory if it does not exist).
    1. Select **OK**.
    1. Restart your Powershell session to pick up this new environment variable.

1. Import the PKCS#12 container into a PSE:

   ```powershell
   C:\sap\libs\sapcryptolib\sapgenpse.exe import_p12 -p SAPSNCSKERB.pse C:\pki-certs\snc.p12
   ```

## Set up SAP for SNC

1. Sign in to the SAP GUI.
1. Go to transaction code `SNC0`.
1. Enter **E** as the work area.
1. Select **New Entry** from the top bar and fill in the required information.

   :::image type="content" source="./media/setup-secure-network-communications/sap-snc-access-controll-list-for-systems.png" alt-text="Screenshot of the SAP GUI showing the Access Control List for Systems.":::
1. Select the **Save**.
1. Return to the SAP GUI home screen.
1. Go to transaction code `RZ10`.
1. Set these profile parameters:

   ```txt
   snc/accept_insecure_cpic: 1
   snc/accept_insecure_gui: 1
   snc/accept_insecure_rfc: 1
   snc/enable: 1
   snc/extid_login_diag: 1
   snc/extid_login_rfc: 1
   snc/gssapi_lib: $(SAPCRYPTOLIB)
   snc/identity/as: p:CN=ID3, O=Contoso
   snc/permit_insecure_start: 1
   snc/data_protection/max: 3```

1. Save the profile parameters and restart your SAP system.

## Exchange certificates between SAP and the on-premises data gateway

You need to exchange certificates between the on-premises data gateway and SAP to establish trust.

### Add the gateway SNC certificate to SAP

1. In the SAP GUI, go to transaction code `STRUST`.
1. If **SNC SAPCryptolib** has a red X, right-click it and select **Create**.
1. Otherwise, double-click **SNC SAPCryptolib**, and then double-click your **Own Certificate**.
1. Select **Import Certificate** and choose your `sncCert\snc.cert.pem` public certificate.
1. Select **Add to Certificate List**.

### Add the SAP SNC certificate to the on-premises data gateway

1. In the SAP GUI, go to transaction code `STRUST`.
1. Double-click **SNC SAPCryptolib**, and then double-click your **Own Certificate**.
1. Export the public certificate.
1. Move the public certificate to your gateway machine (for example, `C:\sap\contoso-public-key.crt`).
1. Import the certificate into your gateway's PSE:

   ```powershell
   C:\sap\libs\sapcryptolib\sapgenpse.exe maintain_pk -p SAPSNCSKERB.pse -v -a C:\pki-certs\sncCert\sapkerb.public.cert
   ```

## Test the secure connection

Follow the steps to test the secure connection. Once you complete the test successfully, you're ready to implement SNC in your production environment.

1. Create an instant flow in Power Automate.
1. Add an `SAP ERP Call Function` action.
1. Add the following SNC parameters to the **SAP Connection** string:

   ```json
   {
   "AppServerHost": "xxx",
   "Client": "xx",
   "SystemNumber": "xx",
   "LogonType": "ApplicationServer",
   "SncLibraryPath": "C:\\sap\\libs\\sapcryptolib\\sapcrypto.dll",
   "SncMyName": "p:CN=SNC, O=Contoso",
   "SncPartnerName": "p:CN=ID3, O=Contoso",
   "SncQop": "Default",
   "UseSnc": "true",
   "SncSso": "Off"
   }```

1. Test the connection using the `STFC_CONNECTION` RFC function.

    :::image type="content" source="./media/setup-secure-network-communications/sap-stfc_connection-response-in-power-automate.png" alt-text="Screenshot showing the results of a test in a Power Automate flow.":::

> [!IMPORTANT]
> Make sure that you securely handle private keys and delete them on completion of this setup.

## Next step

[Set up Microsoft Entra ID with certificates for SSO](./entra-id-certs.md)
