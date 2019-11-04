---
title: "Responding to GDPR Data Subject Export Requests"
description: "Learn how to respond​ to GDPR Data Subject Export Requests for Power Virtual Agents."
ms.date: 05/29/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Export data to respond to requests for copies of personal data in Power Virtual Agents

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

The right of data portability  allows a data subject to request a copy of their personal data in an electronic format (defined as a “structured, commonly used, machine readable, and interoperable format”) that may be transmitted to another data controller.

Power Virtual Agents offers the following capabilities to find or export personal data for a specific user:

1. Export customer data – Bot content (tenant admin)
2. Export customer data – Bot sessions (tenant admin)

## Export customer data – Bot content (tenant admin)

1. Go to [https://www.powerapps.com](https://www.powerapps.com) and sign in with your credentials.

   ![Sign in to powerapps.com](media/export-1.png)

2. After signing in, you are redirected to the Power Apps portal.

   ![Power Apps portal](media/export-2.png)

3. In the left pane, expand the **Data** node. Select **Entities** and select **Export data**.

   ![Clickpath to export data](media/export-3.png)

4. On the Export data screen, select **BotContent** and **Note** from the entity list. Select **Export data** in the top right. Your data will take a couple of minutes to be compiled for export.

   ![Select entities for export](media/export-4.png)

5. Select **Download exported data** to download the content.

   ![Download exported data](media/export-6.png)

   ## Export customer data – Bot sessions (tenant admin)
 
If you are a tenant administrator, you should follow these steps to request an export of the data:

1. Send email to powervaadmins@microsoft.com specifying the user’s Azure Active Directory (Azure AD) objectId in the request.

   An administrator from the Power Virtual Agents team will send an email to the address registered in the Azure AD user account, asking for confirmation to export the data.

2. Acknowledge the confirmation to export the data

Upon acknowledgement, the data will be made available to the requestor.
