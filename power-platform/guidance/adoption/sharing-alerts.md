---
title: "Set up sharing alerts and mitigation - Microsoft Power Platform | MicrosoftDocs"
description: "Alerting can be used to inform admins and stakeholders about specific events, or provide a summary of activity."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Set up sharing alerts and mitigation

Alerting can be used to inform admins and stakeholders about specific events, or provide a summary of activity.

Much like makers use Power Automate to automate their business processes, admins can use the tools for the same level of automation. An example of alerting that can be implemented is subscribing to [Office 365 Security & Compliance audit logs](https://docs.microsoft.com/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance).

By using flows to consume these alerts, admins can get much more value from the alerts without additional manual effort. With the management connectors and other built-in connectors of Power Automate like Approvals, additional actions can be implemented to help administrators remain productive as they protect their environment.

Here are good reasons to monitor widely shared resources:

- Apps shared with the entire tenant or many individual users might be business important or critical, and therefore might need a stronger support model or a review of the number of people they're shared with.

- Often apps are shared with the entire organization because it's an easy option. If the app is for a single department, job role, or group of people, you can help the maker by setting up an Azure Active Directory (Azure AD) group to share their app. Otherwise, your entire org will see the app in the Power Apps mobile player or on make.powerapps.com (even if it's not relevant to them), and if a user doesn't have access to the underlying data source, they'll receive an error message when they try to open the app, which can cause an increase in support tickets and confusion.

- Apps shared with a large number of individual users pose a different risk: if the app is for a specific job role or department, when a user moves departments or job roles they'll still see the app and be able to access the information. Therefore, we recommend sharing role-specific apps with an Azure AD group instead.

- Flows can be shared and have multiple owners, which creates a [team flow](https://docs.microsoft.com/power-automate/create-team-flows). All owners of a flow can edit the definition of the flow (for example, add or remove an action or condition). Connections of a team flow are shared in the flow in which they were created. Often flows are shared not because ownership is required, but because a maker would like to share how something was done, which can be achieved by [sending a flow as a copy](https://flow.microsoft.com/blog/send-a-flow-as-a-copy/). For flows that are important to your business, you can support a maker by moving the flow from using personal connections to a service account.

The [CoE Starter Kit](https://aka.ms/coestarterkit), a collection of templates, components and tools designed to help you get started with developing a strategy for adopting and supporting Microsoft Power Platform, can help you identify widely shared resources:

- Find out who an app is shared with, what roles (edit or view) the users have and—for groups—what the group size is.

  ![Find out who an app is shared with](https://docs.microsoft.com/power-platform/guidance/coe/media/coe-mda2.png "Find out who an app is shared with")
    
- Identify [widely shared apps](https://docs.microsoft.com/power-platform/guidance/coe/power-bi-govern#identify-widely-shared-apps).

- Identify [implicitly shared flow connections](https://docs.microsoft.com/power-platform/guidance/coe/power-bi-govern#implicitly-shared-flow-connections).

- Identify [implicitly shared app connections](https://docs.microsoft.com/power-platform/guidance/coe/power-bi-govern#identify-implicitly-shared-app-connections).

- Set up an [app auditing process](https://docs.microsoft.com/power-platform/guidance/coe/example-processes) that requires app makers to provide more details—such as business justification and impact—if an app is shared with a high number of users.
