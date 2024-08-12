---
title: Set up Microsoft Entra ID (with certificates) - Single Sign-On
description: This guide walks you through setting up the connector so your users can access SAP data and run RFC (short for Remove Function Call) in the Power Platform using their Microsoft Entra ID for authentication.​
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
ms.subservice: solution-templates
---

# Microsoft Entra ID (with certificates) - Single Sign-On

This guide walks you through setting up the connector so your users can access SAP data and run RFC (short for Remove Function Call) in the Power Platform using their Microsoft Entra ID for authentication. T​he process involves configuring both public and private certificates for secure communication.

> [!IMPORTANT]
> This article is for setting up a Proof of Concept only. The settings and recommendations are not intended for production use. Please consult your security team, internal policies, and Microsoft Partner for further guidance.

## Prerequisites

 1. [Setup SAP Connection](./getting-started-with-the-sap-erp-connector.md)
 1. [Setup Secure Network Communications](./setup-secure-network-communications.md)
 1. Familiarity with public and private key technologies.

## Generating a Signing Certificate to Issue Tokens for Users

We will generate an example self signed root certificate similar to those provided by a Certificate Authority.

### Creating A Demo Public Key Infrastructure

Extending the [Setup Secure Network Communication](./setup-secure-network-communications.md) documentation by implementing the other half of our demo PKI (short for Public Key Infrastructure).

```mermaid
flowchart TD
    classDef defaultStyle fill:#fff,stroke:#333,stroke-width:1px,color:black;
    classDef highlightStyle fill:#8df,stroke:#333,stroke-width:2px,color:black;
    RootCA["Root CA [O=Contoso, CN=Root CA]"] --> SNCCert["Encryption Cert [O=Contoso, CN=SNC]"]
    RootCA --> UsersCert["Signing Cert [O=Contoso, CN=Users]"]
    UsersCert --> U1[UserID: testuser01]
    UsersCert --> U2[UserID testuser02]
    UsersCert --> U3[UserID testuser03]
    class UsersCert,U1,U2,U3 highlightStyle;
    class RootCA,SNCCert defaultStyle;
```

Create the folder structure.

```powershell
cd C:\
mkdir pki-certs
cd C:\pki-certs\
mkdir signingUsersCert
mkdir userCerts
```

Create extension files to ensure our certificates are created with the correct metadata and restrictions.

`signingUsersCert/extensions.cnf`
```
[ v3_ca ]
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid:always,issuer
basicConstraints = critical,CA:true,pathlen:0
keyUsage = cRLSign, keyCertSign
```

`userCerts/extensions.cnf`
```
basicConstraints=CA:FALSE
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid,issuer
keyUsage = digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth
```

Create the necessary `index.txt` and `serial` files to keep track of signed certificates.

```powershell
# Create the necessary serial and index files if they don't exist
if (-Not (Test-Path "signingUsersCert\index.txt")) { New-Item -Path "signingUsersCert\index.txt" -ItemType File }
if (-Not (Test-Path "signingUsersCert\serial")) { Set-Content -Path "signingUsersCert\serial" -Value "0001" }
```

Generate our intermediate Users cert.

```powershell
openssl genrsa -out signingUsersCert/users.key.pem 2048

# Create Certificate Signing Request
openssl req -new -key signingUsersCert/users.key.pem -sha256 -out signingUsersCert/users.csr.pem -subj "/O=Contoso/CN=Users Intermediate Cert"

# Sign the certificate with the rootCA cert.
openssl x509 -req -in signingUsersCert/users.csr.pem -days 3650 `
  -CA rootCA/ca.cert.pem -CAkey rootCA/ca.key.pem `
  -out signingUsersCert/users.cert.pem `
  -extfile signingUsersCert/extensions.cnf -extensions v3_ca `
  -CAserial rootCA/serial
```

#### Generating User Certs:

Run the following to generate and sign a certificate for a user with the SAP username `TESTUSER01`.

```powershell
# Create the private key.
openssl genrsa -out userCerts/TESTUSER01.key.pem 2048

# Generate the certificate signing request
openssl req -key userCerts/TESTUSER01.key.pem -new -sha256 -out userCerts/TESTUSER01.csr.pem -subj "/CN=TESTUSER01"

# Sign the certificate + add extensions with the intermediate cert.
openssl x509 -req -days 365 -in userCerts/TESTUSER01.csr.pem -sha256 `
  -CA signingUsersCert/users.cert.pem -CAkey signingUsersCert/users.key.pem `
  -out userCerts/TESTUSER01.cert.pem -extfile userCerts/extensions.cnf `
  -CAserial signingUsersCert/serial
```

> [!NOTE]
> CN=TESTUSER01 should be the first parameter.

You should now have a root cert, an intermediate SNC Cert, an intermediate Users Cert, and a certificate to identify the user cert.

Verify the chain with the following command:

```powershell
$ openssl verify -CAfile rootCA/ca.cert.pem -untrusted signingUsersCert/users.cert.pem userCerts/TESTUSER01.cert.pem

userCerts/TESTUSER01.cert.pem: OK
```

## Adding Users Signing Certificate + Certificate Chain to Windows Store

Generate .p12 file from users signing certificate & private key.

```powershell
openssl pkcs12 -export -out user_signing_cert.p12 -inkey .\signingUsersCert\users.key.pem -in .\signingUsersCert\users.cert.pem
```

1. Open the Windows Certificate Manager:
	1. Press `Win + R`, type `certlm.msc`, and press Enter.
1.  Import the public Root CA certificate.
	1. Import into "Trusted Root Certification Authorities"
2. Import the User Certificate + Key
	- In the Certificate Manager, navigate to the appropriate certificate store (for example, Personal).
	- Right-click and select `All Tasks > Import`.
	- Follow the wizard to import the `.p12` file, ensuring to **mark the key as exportable** so the OPDG can use it to encrypt data.
	- Right click on `Users Intermediate Cert` and select `All Tasks>Manage Private Keys...`.
		- Add the `NT SERVICE\PBIEgwService` user to the list of people who have permissions.

Check subject name of certificate in the Windows Certificate Store
```powershell
Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.Subject -like "*Users Intermediate Cert*" } | Format-List -Property Subject
```

View certs in .p12 file.
```powershell
openssl pkcs12 -nokeys -info -in .\user_signing_cert.p12
```

## Entra ID to SAP User Mapping

### Mapping X.509 Certificates to Users Explicitly

Explicitly map a small amount of Entra ID users to SAP users.

Navigate the SAP GUI to T-Code `SM30`.

Enter table `VUSREXTID` and select the maintain button.

Select option `DN` when prompted for `Type of ACL`.

Choose "New Entry" and enter `CN=USER@CONTOSO.COM` for the external ID. Make sure CN comes first.(DO NOT INCLUDE the '**p:**' prefixed); Select your username for the username field; and last Check the 'Activated' option and click the save button.

### Mapping X.509 Certificates to Users Using Rules

Use Certificate Rules to easy bulk map Entra ID users to SAP users.

Ensure the `login/certificate_mapping_rulebased` profile parameter is set to a current value of `1`.

> ![Note]
	Alert that this will not be persisted between restarts.

Then created the following rule in t-code `CERTRULE`

![T-Code: CERTRULE](./media/setup-microsoft-entra-id-with-certificates/sap-certrule-mapping.png)

> [!NOTE]
> Now wait 2 minutes to ensure cached connections to SAP have expired.. Then retest the connection. If not, you may run into the `No suitable SAP user found for X.509-client certificate` error.

## Add the Users Intermediate Certificate to SAP

In `STRUST` add the users.cert.pem file to the box.

## Updating SAP System

Add the `SsoCertificateSubject` to your SAP System parameters.

Use the `Microsoft Entra ID using Certificates` to login to SAP with your Entra ID account.
```
"SsoCertificateSubject": "CN=Users Intermediate Cert, O=Contoso",
```

Also enable
```
"SncSso": "On"
```

> [!IMPORTANT]
> Delete the temporary TESTUSER01 public and private keys on completion of this tutorial.

> [!IMPORTANT] 
> Ensure the secure handling and eventual deletion of private keys upon completion of this setup to maintain security integrity.

## Sources:
[On-premises data gateway FAQ | Microsoft Learn](https://learn.microsoft.com/data-integration/gateway/service-gateway-onprem-faq#what-is-the-actual-windows-service-called---)
