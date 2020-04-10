---
title: "Legacy storage capacity  | MicrosoftDocs"
description: About the legacy storage model.
ms.date: 03/27/2020
ms.reviewer: ""
ms.service: "power-platform"
ms.topic: "quickstart"
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Legacy storage capacity

In April 2019, we introduced Common Data Service capacity storage that is optimized for relational data, attachments, and audit logs. If you purchased storage prior to April 2019, you are using the legacy licensing model for storage discussed in this topic.

> [!NOTE]
> The calculation of capacity storage into three storage types - database, file, and log - is the same for the legacy licensing storage model and the new licensing storage model. What differs is the presentation of the storage information in the user interface. See [Determining your storage model](#determining-your-storage-model).
> 
> For more information on changes, see [What's new in storage](whats-new-storage.md).

## Licenses for legacy storage model

The following licenses provide capacity using the legacy storage model.

<should license table be included - only if user can determine>

## Verifying your legacy storage model

1. Sign in to the Power Platform admin center, and then select an environment. 

2. Select **Analytics** > **Capacity**.

3. View the data on the **Summary** page.

The legacy licensing storage model looks like this:

> [!div class="mx-imgBorder"] 
> ![](media/capacity-old-license-model.png "Legacy licensing storage model")

The report displays available storage capacity by source as well as overall storage capacity usage. To help customers transition to the new licensing model, current usage is also shown by database, file, and log capacity. 

## Example storage capacity scenario

### Scenario: Database storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 110GB        |

This tenant is 10GB over in storage usage. Therefore, there is a deficit and additional capacity should be purchased.

### FAQ

#### I have available instances (Production and Sandbox), but my capacity usage is more than capacity entitled. Will I be able to provision new environments? 
For now, you can provision a new environment if you have at least 1GB available database capacity. 

#### I have storage licenses from the legacy licensing model and I also purchased new model storage licenses. Which report will I see?  
You will see the report for the new licensing model. 

#### What are my options if I'm overusing capacity?  
You can buy more capacity to be compliant, and [free up](free-storage-space.md) or [delete](delete-environment.md) unused environments. 

#### Do I get notified through email when my org is over capacity?  
When you sign in to the Power Platform admin center, you will be notified if your capacity usage is more than the entitled capacity. 

### See also
[Common Data Service storage capacity](capacity-storage.md) <br />
[What's new in storage](whats-new-storage.md)


