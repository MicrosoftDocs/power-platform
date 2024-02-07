---
title: "Automation of tasks with Power Automate  | MicrosoftDocs"
description: Automation of tasks with Power Automate 
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/12/2020
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Automation of tasks with Microsoft Power Automate 

One of the unique things about Power Automate is you can use it to manage itself along with other parts of Microsoft Power Platform. The following connectors can be helpful to automate administrator tasks with Power Automate.

|Connector  |Possible uses  |
|---------|---------|
|Power Automate Management connector <br/> [Power Automate Management](/connectors/flowmanagement/)    |Can be used to automate working with workflows including getting lists of new workflows or connectors in your environments.         |
| Power Automate for Admins connector <br /> [Power Automate for Admins](/connectors/microsoftflowforadmins/) |Allows you to perform typical admin actions, such as disabling a flow or deleting a flow.   |
| Power Apps for Admins connector <br /> [Power Apps for Admins](/connectors/powerappsforadmins/) |To set permissions on Power Apps or set permissions to a certain connector being used by this app.  |
| Power Apps for app makers connector<br /> [Power Apps for Makers](/connectors/powerappsforappmakers/)  | Can be used by makers although some actions could be admin tasks, such as settings permissions to an app. Therefore, admins might also use this connector.    |
|Power Platform for Admins connector<br /> [Power Platform for Admins](/connectors/powerplatformforadmins/)  |To perform tasks against platform components, such as creating an environment or provisioning a Microsoft Dataverse database or creating a DLP policy for a specific environment.    |
|Microsoft 365 Users connector<br/> [Office 365 Users](/connectors/office365users/)     |Useful for automating actions around users. For example, you could use the connector to get the manager of a user who owns an environment to be able to send them an email for approval.         |
|Approvals connector<br/> [Approvals](/connectors/approvals/)    | Often administrators need to get approvals and Power Automate offers a rich approval set of tasks that enable you to automate this process.        |
|Microsoft Forms <br/> [Microsoft Forms](/connectors/microsoftforms/)   | Forms is an easy way to collect information to start an admin task. This can be combined with the Approval connector to get manager approval.        |
|Microsoft Entra connector <br/> [Microsoft Entra ID](/connectors/azuread/)   |Useful to perform tasks such as adding a user to a group or even creating the group.         |

## Common Power Automate tasks

*List new Microsoft Flow connectors* is a simple template you can get started with right away. It triggers daily on schedule, and uses the Power Automate Management connector to get a list of the connections in the environment and sends you an email. You can add it to your flows quickly using the template at https://us.flow.microsoft.com/galleries/public/templates/5a6ef26db3b749ed88b7afb377d11ecf/list-new-microsoft-flow-connectors/.

> [!div class="mx-imgBorder"] 
> ![List new connectors.](media/list-new-flow-connectors.png "List new connectors")

If you want to try building it yourself, here is a good walkthrough of creating the flow from scratch: https://flow.microsoft.com/blog/new-flow-connector-notifications/




[!INCLUDE[footer-include](../includes/footer-banner.md)]