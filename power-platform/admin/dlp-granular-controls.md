---
title: "Granular DLP controls  | MicrosoftDocs"
description: About fine-grained controls such as the ability to block specific connector actions or connection endpoints.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/19/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

## Granular DLP controls

While connector classification capability is very helpful in governing Power Platform connectors, fine-grained controls such as the ability to block specific connector actions or connection endpoints help admins strike a fine balance between productivity and protection. 

### Connector action control 

Connector action control gives admins the ability to allow and block individual actions within a given connector. Admins can use this capability by selecting the new **Configure connector** dropdown in the **Connectors** tab and selecting **Connector actions**.  

:::image type="content" source="media/dlp-connector-actions.png" alt-text="Select Configure connector > Connector actions.":::

This opens up a side panel which enables admins to allow or deny specific actions. Admins can also set default value (Allow/Deny) for any new connector actions that will be added to the connector in future. 

:::image type="content" source="media/dlp-allow-deny-connector-actions.png" alt-text="Set Allow or Deny for connector actions.":::

### Endpoint filtering 

Endpoint filtering allows admins to govern at a fine grain which specific endpoints will be allowed versus blocked at a tenant or environment level. This facility is available for HTTP, HTTP with Azure AD, HTTP Webhook, SQL Server, Dataverse (legacy), Azure Blob Storage, and SMTP connection endpoints. 

Admins will see a new column “Endpoint configurable” in the **Prebuilt Connectors** tab in the Data Policies wizard, which indicates if endpoint filtering capability is supported for the connector.  

:::image type="content" source="media/dlp-endpoint-configurable-prebuilt-connectors.png" alt-text="Endpoint configurable in the Prebuilt Connectors tab.":::

Admins can then use this capability by selecting the new **Configure connector** dropdown and selecting **Connector endpoints**.  

:::image type="content" source="media/dlp-configure-connector-connector-endpoints.png" alt-text="Configure connector > Connector endpoints.":::

This opens up a side panel which will allow them to specify an ordered list of Allow or Deny URL patterns for custom connectors. The last row in the list will always be a rule for "`*`" which applies to all endpoints in that connector. By default, the "`*`" pattern is set up as Allow for new DLP policies, but admins can tag this as Allow or Deny. 

:::image type="content" source="media/dlp-specify-ordered-list-allow-deny-url-patterns.png" alt-text="Specify an ordered list of Allow and Deny URL patterns for custom connectors.":::

New rules can be added by selecting **Add endpoint**. New rules are added to the end of the pattern list (second to the last rule since "`*`" will always be the last entry in the list). However, admins can also update the order of the patterns by using the **Order** dropdown or selecting **Move up** or **Move down**. 

:::image type="content" source="media/dlp-add-endpoint-new-rules.png" alt-text="Select Add endpoint to add new rules.":::

Once a pattern has been added, admins can edit or delete these patterns by selecting a specific row and then selecting **Delete**. 

:::image type="content" source="media/dlp-delete-pattern.png" alt-text="Delete a pattern.":::




[!INCLUDE[footer-include](../includes/footer-banner.md)]
