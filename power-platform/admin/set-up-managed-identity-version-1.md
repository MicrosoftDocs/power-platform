---
title: Set up Power Platform managed identity version 1 for Dataverse plug-ins
description: Learn how to set up version 1 of Power Platform managed identity for Dataverse plug-ins or plug-in packages.
author: apurvghai
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/15/2026
ms.subservice: admin
ms.author: apurvgh
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
contributors:
  - abhijanand
  - sericks
---

# Set up Power Platform managed identity version 1 for Dataverse plug-ins

Version 1 builds the federated identity credential (FIC) subject identifier from the certificate **Common Name (CN)**.

> [!IMPORTANT]
> Version 2 is the recommended version and works with any certificate name. Use this article only to maintain an existing version 1 setup. For new plug-ins, see [Set up Power Platform managed identity (version 2)](set-up-managed-identity.md). To move an existing plug-in to version 2, see [Upgrade to version 2](set-up-managed-identity.md#upgrade-to-version-2).
>
> Version 1 fails when the certificate CN contains non-ASCII characters (`AADSTS70050`) or commas (`AADSTS700213`). If you hit either error, move to version 2.

## Prerequisites

Same as version 2. See [Prerequisites](set-up-managed-identity.md#prerequisites).

## Set up managed identity (version 1)

The steps are the same as version 2 except for the FIC subject identifier format [(Step 3)](#step-3-configure-the-federated-identity-credential) and the managed identity record version [(Step 4)](#step-4-create-the-managed-identity-record-in-dataverse).

### Step 1: Create an app registration or user-assigned managed identity

No change from version 2. See [Step 1](set-up-managed-identity.md#step-1-create-an-app-registration-or-user-assigned-managed-identity).

### Step 2: Build, sign, and register the plug-in

No change from version 2. See [Step 2](set-up-managed-identity.md#step-2-build-sign-and-register-the-plug-in).

### Step 3: Configure the federated identity credential

In the [Azure portal](https://portal.azure.com/), open your app or user-assigned managed identity (UAMI), go to **Certificates & secrets** > **Federated credentials** > **Add credential**, and select **Other issuer**. Then enter:

- **Issuer** — `https://login.microsoftonline.com/{tenantID}/v2.0`
- **Type** — **Explicit subject identifier**
- **Subject identifier** — use the format for your certificate type:

  - Trusted issuer certificate (production):

    ```
    /eid1/c/pub/t/{encodedTenantId}/a/qzXoWDkuqUa3l6zM5mM0Rw/n/plugin/e/{environmentId}/i/{issuer}/s/{certificateSubject}
    ```

  - Self-signed certificate (development only):

    ```
    /eid1/c/pub/t/{encodedTenantId}/a/qzXoWDkuqUa3l6zM5mM0Rw/n/plugin/e/{environmentId}/h/{hash}
    ```

### Step 4: Create the managed identity record in Dataverse

For version 1, set `version` to `1`:

```json
{
  "applicationid": "<<appId>>",
  "managedidentityid": "<<anyGuid>>",
  "credentialsource": 2,
  "subjectscope": 1,
  "tenantid": "<<tenantId>>",
  "version": 1
}
```

### Step 5: Grant access to the Azure resource

Grant the application or user-assigned managed identity access to the Azure resource it needs, such as Azure Key Vault.

### Step 6: Validate the integration

Trigger the plug-in and confirm it acquires a token and reaches the Azure resource without separate credentials.

## Frequently asked questions

### How do I resolve AADSTS700213?

If the CN contains commas, move to [version 2](set-up-managed-identity.md).

### How do I resolve AADSTS70050?

Move to [version 2](set-up-managed-identity.md), which produces an ASCII-only subject identifier.
