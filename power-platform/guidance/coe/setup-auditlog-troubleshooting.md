---
title: Troubleshooting sync problems in audit logs
description: Provides common causes for sync issues to help troubleshooting.
author: pete-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/03/2024
ms.subservice: guidance-toolkit
ms.author: petrip
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- Grant-Archibald-MS
  
---

# Troubleshooting sync problems in audit logs

## API permissions

Go to your app registration and validate that you have the correct API permissions. Your app registration requires application permissions not delegated. Validate that the status is _Granted_.

:::image type="content" source="media/auditlog-troubleshoot-1.png" alt-text="Screenshot that highlights the Application type and Granted for status of a configured permission." lightbox="media/auditlog-troubleshoot-1.png":::

## Secret environment variable - Azure secret

If you're using Azure Key value to store the app registration secret, validate that the Azure Key Vault permissions are correct.

A user needs to be in the _Key Vault Secret User_ role to read and in the _Key Vault Contributor_ role to update.

:::image type="content" source="media/auditlog-troubleshoot-2.png" alt-text="Screenshot that shows the Key Vault Contributor and Key Vault Secrets User roles." lightbox="media/auditlog-troubleshoot-2.png":::

If you have other issues with Azure Key Vault regarding a firewall, static IPs for the Dataverse environment, or other such feature issues, contact product support to resolve them.

## Secret environment variable - plain text

If you're using plain text to store the app registration secret, validate that you entered the secret value itself, and not the secret ID. The secret value is a longer string with a larger character set than a GUID. For example, the string might have tilde characters.
