---
title: View self-service storage capacity
description: View self-service storage capacity
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/25/2025
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# View self-service storage capacity

With the introduction of [self-service purchases](/microsoft-365/commerce/subscriptions/self-service-purchase-faq) for Microsoft Power Platform products, license purchases aren't restricted to Power Platform admins. With this change, you need the ability to view self-service capacity data. Take the following steps to view the storage capacity provided with purchased licenses.

1. Sign in to the Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) with admin or end-user credentials.
1. In the navigation pane, select **Licensing**.
1. In the **Licensing** pane, select **Capacity add-ons**.
1. Select the **Summary** tab.

   > [!NOTE]
   >
   > Admins and end users see the same tenant capacity on the summary page.
   > If tenant users don't purchase licenses, then the **Capacity from self-service user licenses** page is blank.

1. In the **Storage capacity, by source** tile, select **View self-service sources**.

      :::image type="content" source="media/view-self-service-sources.png" alt-text="View self-service sources.":::

## View storage capacity as a Power Platform admin

You see all licenses purchased by users in the tenant. You can filter or search for licenses to shorten the list.

  :::image type="content" source="media/capacity-from-licenses-admin.png" alt-text="Power Platform admin view.":::

## View storage capacity as an end user

You see the license and capacity information for the licenses you purchased.

  :::image type="content" source="media/capacity-from-licenses-user.png" alt-text="User view.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
