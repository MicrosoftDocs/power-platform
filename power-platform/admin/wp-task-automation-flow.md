---
title: "Automation of tasks with Flow  | MicrosoftDocs"
description: Automation of tasks with Flow 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Automation of tasks with Flow

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

One of the unique things about Microsoft Flow is you can use it to manage itself along with other parts of the Microsoft Power platform. The following connectors can be helpful to automate administrator tasks with Microsoft Flow.

|Connector  |Possible uses  |
|---------|---------|
|Flow management connector <br/>https://docs.microsoft.com/en-us/connectors/flowmanagement/     |Can be used to automate working with Flows including getting lists of new flows or connectors in your environments.         |
|Office 365 Users connector<br/> https://docs.microsoft.com/en-us/connectors/office365users/     |Useful for automating actions around users. For example, you could use the connector to get the manager of a user that owns an environment to be able to send them an e-mail for approval.         |
|Approval connector<br/> https://docs.microsoft.com/en-us/connectors/approvals/     | Often administrators need to get approvals and Flow offers a rich approval set of tasks you can automate this process.        |
|Microsoft Forms <br/>https://docs.microsoft.com/en-us/connectors/microsoftforms/     | Forms is an easy way to collect information to start an admin task. This can be combined with the Approval connector to get manager approval.        |
|Azure AD connector <br/>https://docs.microsoft.com/en-us/connectors/azuread/     |Useful to perform tasks such as adding a user to a group or even creating the group.         |

## Common Flow tasks

daily on schedule, and uses the Flow Management connector to get a list of the connection in the environment and sends you an e-mail. You can add it to your flows quickly using the template https://us.flow.microsoft.com/en-us/galleries/public/templates/5a6ef26db3b749ed88b7afb377d11ecf/list-new-microsoft-flow-connectors/

> [!div class="mx-imgBorder"] 
> ![](media/list-new-flow-connectors.png "List new connectors")

If you want to try building it yourself, there is a good walkthrough of creating the flow from scratch here: https://flow.microsoft.com/en-us/blog/new-flow-connector-notifications/


