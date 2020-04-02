---
title: "Limitations | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Limitations

There is no 'one size fits all' solution for a Center of Excellence. Some
companies will want a very restrictive set of rules on their organization in the
mind-frame of mitigating the unknown, while others will want to let users
personally explore without limitations. Because of this, the CoE starter kit
does not come equipped with a set of design patterns for everyone. For example,
there are no components that are configured to automatically delete resources,
because we did not want to provide a tool that might have unintentionally
disrupted a business when installed. Therefore, if more restrictive
implementations are desired, it must be implemented in addition to these tools.

In addition to this high-level warning, there are some additional notes on some
components.

## Timeouts in the Admin | Sync Template V2

The CDS connector might experience some throttling limits if the tenant has a lot of resources. If you see "429" errors in the flow run history occurring in the later runs, you can try the following resolution steps:

1. **Configure Retry**
    1. Open **Admin \| Sync Template v2** tand select **Edit**.
    1. Expand the step: **Get Environments and store them in the CoE CDS Entity**.
    1. Expand the step: **Apply to each Environment**
    1. Go to Settings for each call to the CDS and configure the timeout / retry settings. <br> ![Configure retry policy](media/coe72.png)

1. **Configure concurrency in Foreach**
    Reduce concurrency in Foreach loops to reduce simultaneous calls:
    1. Open **Admin \| Sync Template v2** and select **Edit**.
    1. Expand the step: **Get Environments and store them in the CoE CDS Entity**.
    1. Go to Settings for the **Apply to each Environment** step. <br>![Configure concurrency in Foreach](media/coe73.png)
    1. Reduce the degree of parallelism here.

## DLP editor

- The Environments call returns only the first 2000 environments.
- The tool cannot write back Environment-type policies.

## Government community cloud (GCC) environments

- The CoE Starter Kit is available for government cloud (GCC) Environments; however the Custom Connector to connect to Office 365 Audit Logs is not available for GCC Environments yet.
