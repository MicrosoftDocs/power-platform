---
title: Get Support in Power Platform
description: Use the Support experience to contact a Microsoft support representative to get resolution for your issue.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/23/2025
ms.subservice: admin
ms.author: johhar 
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
  - lsuresh
contributors:
  - prabhav
  - lavanyapg
ms.custom: sfi-image-nochange
---
# Get Support

Admins can use the [Support experience](https://admin.powerplatform.microsoft.com/support/requests) in the [Power Platform admin center](admin-documentation.md) to get self-help solutions for an issue. If the issue can't be resolved through self-help, you can continue in the same **Support** experience to engage Microsoft support representative using your support plan. Should you need to link a plan with your account, you can enter your access ID and password before creating a support request. Learn more in [Add a support plan](#add-a-support-plan).

## Prerequisites

### Security roles
You must have one of the following security roles to access the **Support requests** page in the Power Platform admin center.

- Billing Admin
- Company Admin
- Compliance Admin
- CRM Organization Admin
- CRM Service Admin
- Environment Admin (or System Admin in Dataverse)
- Exchange Admin
- Helpdesk Admin
- LCS User
- Microsoft Entra Role Admin
- Partner Delegated Admin
- Power Apps Environment Admin
- Power Apps Full Admin
- Power BI Admin
- Power Platform Admin
- Security Admin
- Service Admin
- SharePoint Admin
- Teams Admin

### Support plans
You can access self-help resources in the Support experience without a support plan. However, to create a support request, you must have an active support plan. 

- Subscription Support
- Professional Direct Support
- Unified Support

[Learn more about and purchase support plans](https://www.microsoft.com/en-us/dynamics-365/support).

> [!Note]
> In the following cases, you might not be able to create a support request:
> - There's an issue with your Unified or Premier Support contract. Contact your Incident Manager or Customer Success Account Manager (CSAM).
> - Your Support subscription has expired. Renew.
> - We couldn't find your support plan.
>    - If you have a Unified or Premier Support plan, contact your Incident Manager or Customer Success Account Manager (CSAM).
>    - If you have a non-Unified/Premier Support plan, verify the plan is active. For support information, see [Community forums](https://community.dynamics.com/forums/thread/).

## Request support
There are two experiences depending on your tenant and scenario. Most see the new Support agent, but some may see the older experience.

While the Support agent is in preview, users can switch between experiences by selecting the ellipses icon (**...**) in the upper-right corner of the **Support agent** pane. You may switch back to the Support agent by closing the pane and selecting **Get support** again, or by selecting the **New experience** toggle at the top of the older experience pane.

### Use the Support agent to request support (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

The Support agent is an agentic chat, which takes you through a workflow to resolve your issue. It's an expanding and evolving service with improvements being made and tested all the time. However, it's not purely a virtual support experience. You can find self-help solutions, create a support request, and engage Microsoft representatives by following these steps.

1. **Open the Support agent.** <br>
    1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
    1. In the navigation pane, select **Support**, then in the **Support** pane, select **Support requests**.
    1. On the **Support requests** page, select **Get support**. The **Support agent** pane is displayed. Using a chat-like experience, complete the following steps of this procedure.
1. **Describe the issue.** <br>
    Describe the issue to the agent. Provide as much detail as you can to help the agent understand and categorize the issue. All information is used to both find solutions and create a support request.

    Indicate which product you're using. If the predicted product is incorrect, select **No**, and then specify the product name.

1. **Answer interview questions from the agent.** <br>
    The agent uses AI to interpret the issue description and may ask clarifying questions to gather details for solutions and a support request. The agent may ask for a **Category** and **Subcategory** to help route the request to the appropriate Microsoft support representative. All information that you provide is included in the description of your support request.

   If you don’t have the details requested by the agent, reply with “_I don’t have them_” or “_I don’t know_” and the interview continues or completes.

1. **Review solutions.** <br>
    The Support agent provides solutions based on a summarization of your description and interview responses. The agent checks service health alerts for your selected product, searches through known issues, generates answers from documentation and community content and may trigger a troubleshooting dialog. Review the content and follow the prompts to progress through the solutions.

    It's important to note that AI generated content may be incorrect.
   
1. **Escalate the issue, if needed.** <br>
If the content doesn't address or resolve your issue and you have a support plan, you can continue to create a support request. If available and eligible, live chat with a Microsoft support representative.

    If you don't have an associated plan, you can select **Add a new support contract** to associate a plan using the provided Contract ID and password. Learn more in [Add a support plan](#add-a-support-plan).

    If offered a customer satisfaction (CSAT) survey, we encourage you to take the time to respond with your experience and perspective to improve the experience. Engineers review feedback every day.
   
### Use the legacy experience to request support
The legacy support experience is a support system based on forms and machine learning. Through this experience you can describe your issue, review any self-help solutions, and create a support request, if needed, to engage Microsoft representatives.

1. **Go to the legacy experience.** <br>
    1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
    1. In the navigation pane, select **Support**, then in the **Support** pane, select **Support requests**.
    1. On the **Support requests** page, select **Get support**.
    1. If the **Support agent** pane is displayed, select the ellipses  icon (**...**) in the upper-right of pane. Then select **Switch to old experience.**
    1. Confirm that you want to proceed to the old experience. To help us improve, consider offering your feedback as part of switching.
    1. The **How can we help?** pane is displayed. Complete the following steps of this procedure.

1. **Describe the problem.** <br>
    Select the product you're using. Then provide any requested details, such as the environment, to help Microsoft troubleshoot.

    > [!Note]
    > If you're unsure about what product to select or if your issue spans products, select the product where the issue was experienced. If you don't see your environment, select **My environment is not listed**.

    Describe the issue. Provide as much detail as you can to help Microsoft categorize and find solutions.

    Select the arrow to submit your issue description. The form may ask for a **Type** and **Subtype** to help route the request to the appropriate Support representative. Select the best fit. All information is used to both find solutions and create a support request.

1. **Use Copilot.** <br>

    Once the issue and details are submitted, the issue description is passed to the **Copilot** tab, which searches for service health alerts, known issues, and generative answers from documentation and community content.

    If the initial answers don't resolve the issue, you may select **No** and ask a follow-up question or **Next** to continue.

1. **Review solutions.** <br>

    If the Copilot chat doesn't provide an answer that resolves the issue, more content may be shown on this tab. Content shown here are often troubleshooting dialogs or documentation search results. If a dialog is shown, navigate the dialog to a solution to both find and answer and help categorize this issue for any support request. You can then select **Next** to continue to create a support request.

1. **Create a support request.** <br>

    If self-service content doesn't resolve your issue, and you have a support plan, you can create a support request. 

    1. Select from available support plans or [add a new plan](#add-a-support-plan). You may be asked for a **Request reason** as only premium plans allow for advisory support requests.
    2. Fill out the support request form, severity, and set advanced diagnostic consent. Support requests for some products show optional fields where you can provide helpful details for the Microsoft representative.
    3. Select **Next** to continue to **Contact details**. Fill out your preferences and select **Submit** to create the case. You can track status of the request on the Support page.
  
## Add a support plan
If you need to add a new support plan, you must enter your **Contract ID/Password** information. Be sure to enter your Unified or Premier contract ID. The **Contract ID/Password** defaults to the Unified or Premier contract ID. If you have changed the password when registering online in the Unified/Premier portal, you should use the updated password instead of the contract ID.

> [!Important]
> If you don't know your access or contract ID, contact your service admin or incident manager or Customer Success Account Manager (CSAM).

:::image type="content" source="media/contract-id.png" alt-text="Screen where you enter your Contract ID/Password." lightbox="media/contract-id.png":::

## Self-help content types
Several distinct types of content may be presented during the Solutions phase of the Support Agent workflows. As you progress through each step, these resources are designed to help you pinpoint the causes and find resolutions for your issue. If a particular resource doesn't apply, you can choose to move forward, or, when prompted by a troubleshooting dialog, select the most appropriate answers to describe your situation.

### Service health alerts
Service health alerts notify you of disruptions affecting your product or tenant. A title and preview of the alert is shown in the card. You can see details by selecting the link. Active and recently resolved alerts can be viewed on the **Support Service Health** page of the Power Platform admin center, and in the Microsoft admin center. Learn more in [View service health](view-service-health.md).

:::image type="content" source="media/service-health-incident.png" alt-text="Image of a sample service health incident." lightbox="media/service-health-incident.png":::

### Known issues
Known issues represent bugs or product issues identified by product engineering teams. Details of the issue and any workarounds are provided. If your new issue seems related to a known issue, details are displayed during the support workflow. You can review details by selecting the link. You can search active and resolved known issues on the Support Known Issues page in the Power Platform admin center. Learn more in [View known issues](view-known-issues.md).

:::image type="content" source="media/known-issues.png" alt-text="Image of a sample known issue." lightbox="media/known-issues.png":::

### Generative answers
Generative answers are created in real-time based on your issue description from Microsoft public documentation, internally authored troubleshooting content, and select [Power Platform](https://community.powerplatform.com/) and [Dynamics 365](https://community.dynamics.com/) community forums and blogs. A generative answer card consists of a restatement of the issue as understood, the solution content or resolution steps, clickable citation links, and a navigation prompt. 

It's important to note that AI generated content may be incorrect. 

:::image type="content" source="media/ai-generated-content.png" alt-text="Image of a sample generative answer." lightbox="media/ai-generated-content.png":::

### Dialogs
Troubleshooting dialogs are designed to guide you towards a solution should generative answers not resolve the issue. These dialogs are often triggered if there's a level of ambiguity about your issue. Navigating these dialogs to a solution is required to proceed in many cases. These dialogs are created by product teams to represent frequent issues, questions, and other topics seen in previous support requests. By navigating the dialog, you can both find answers and help Microsoft categorize the issue, so any support request is routed to the correct Microsoft support representative, and the owning product engineering team is alerted.

:::image type="content" source="media/dialogs.png" alt-text="Image of sample dialogs." lightbox="media/dialogs.png":::

### Documentation search results
(Support Experience only) Displayed are the top three search results from Microsoft product documentation based on your selected product and issue description. Select a link to review the articles relevant to your issue.

:::image type="content" source="media/documentation-search-results.png" alt-text="Image of a sample documentation search results." lightbox="media/documentation-search-results.png":::

## Report an outage
Depending on your tenant, you may be able to access the direct **Report outage** feature. If enabled, the **Report outage** button is visible on any of the Support pages, next to the **Get support** button. If the **Report outage** feature isn't enabled, you can navigate the Support agent or experience workflows to create a high-priority support request, if you have an active support plan.

To use the **Report outage** feature to raise a high-priority support request, complete the following steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Support**, then in the **Support** pane, select **Support requests**.
1. On the **Support requests** page, select **Report outage**. The **Report outage** pane is displayed. Submit information about the outage.

## Model-driven apps and support environments
For some support requests, you're asked to request a support environment. Currently, support environments can’t be created for the Power Apps or Power Automate product options in the **What product where you using when the issue occurred?** field. To create a support request that includes a support environment for Power Platform issues, select the **Microsoft Dataverse** product for that field.

## Related content
- [Create an effective support request](/power-apps/maker/canvas-apps/service-request-support)
- [Support overview](support-overview.md)
- [How do I check my online service health?](check-online-service-health.md)
