---
title: Get support in the Power Platform admin center
description: Get support in the Power Platform admin center using the AI-powered support agent and learn how to engage with support resources so you can create and submit a support request.
#customer intent: As a Power Platform admin, I want to review service health alerts, known issues, and self-help solutions before creating a support request, so that I can identify whether my issue is already being addressed, can be resolved, or requires submission of a support request.
author: johnehart
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/15/2026
ms.subservice: admin
ms.author: johhar
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
  - lsuresh
contributors:
  - royrubinstein
  - prabhav
  - lavanyapg
ms.custom: sfi-image-nochange
---

# Get support in the Power Platform admin center

Admins can use the [Support experience](https://admin.powerplatform.microsoft.com/support/requests) in the [Power Platform admin center](admin-documentation.md) to get self-help solutions for an issue. If self-help doesn't resolve the issue, continue in the same **support** experience to engage Microsoft support representatives by using your support plan. If you need to link a plan with your account, enter your access ID and password before creating a support request. For more information, see [Add a support plan](#add-a-support-plan).

## Prerequisites

### Security roles
To access the **Support requests** page in the Power Platform admin center, you must have one of the following security roles.

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
- Fabric Admin
- Power Platform Admin
- Security Admin
- Service Admin
- SharePoint Admin
- Teams Admin

### Support plans
You can access self-help resources in the **Support** experience without a support plan. However, to create a support request, you must have an active support plan. [Learn more about and purchase support plans](https://www.microsoft.com/en-us/dynamics-365/support).

- Subscription support
- Professional direct support
- Unified support

> [!NOTE]
> In the following cases, you might not be able to create a support request:
> - There's an issue with your Unified or Premier Support contract. Contact your incident manager or customer success account manager (CSAM).
> - Your support subscription expired. Renew the subscription.
> - Microsoft couldn't find your support plan.
>    - If you have a Unified or Premier Support plan, contact your incident manager or customer success account manager (CSAM).
>    - If you have a non-Unified/Premier Support plan, verify the plan is active. For support information, see [community forums](https://community.dynamics.com/forums/thread/).

## Request support
Two experiences exist depending on your tenant and scenario. Most users see the new support agent, which says **Support agent** at the top of the pane, but some users see the backup support experience if the support agent isn't available.

### Use the support agent 

The support agent is an AI-powered virtual agent that takes you through a workflow to resolve your issue. It's an expanding and evolving service with improvements being made and tested all the time. However, it's not purely a virtual support experience. By following these steps, you can find self-help solutions, create a support request, and engage Microsoft representatives.

1. **Open the support agent.**

    1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
    1. In the navigation pane, select **Support**.
    1. In the **Support** pane, select **Support requests**.
    1. On the **Support requests** page, select **Get support**. The **Support agent** pane is displayed. Using the chat experience, complete the following steps.
      
1. **Describe the issue.**

    1. [Clearly describe the full issue](/power-apps/maker/canvas-apps/service-request-support) to the agent. Provide as much detail as you can to help the agent understand and categorize. The agent uses all information to find solutions and add to the description for any support request.
          
    1. Indicate which product you're using. If the predicted product is incorrect, select **No**, and then specify the product name.
   
        > [!IMPORTANT]
        > - Selecting "Dynamics 365 Customer Service" for customer service with another product **misroutes and delays a request.**
        > - For administration issues or if you encountered an issue in Power Platform admin center, select **Power Platform Administration** as the product.
     
1. **Answer clarifying questions from the agent.**

    The agent uses AI to interpret the issue description and might ask clarifying questions. Do your best to answer the questions. All information you provide is included in any support request description.
   
     > [!TIP]
     > - If you don't have the details requested, reply with *“I don’t have them”* or *“I don’t know”* to continue.
     > - Occasionally, the agent asks you to select a best fit **Category** and **Subcategory** to help route a support request to the appropriate Microsoft support representatives and highlight the issue for the responsible product team.
     
1. **Review solutions.**

    The agent goes through known issues and generates answers from documentation and community content by using a summary of your description. Review the solution content and follow the prompts to progress through solutions.
   
     > [!IMPORTANT]
     > AI-generated content might be incorrect.
     
    If the solution content doesn't address or resolve your issue, and you have an active support plan, you can choose to **[Create a support request](#request-support-step)** or **[Add a new support contract](#use-the-support-agent-to-add-a-plan).**

    <a id="request-support-step"></a>   
1. **Request support.**
     
      1. Select whether your request is [advisory or technical](support-overview.md#technical-support-vs-advisory-services). Some support plans don't have Advisory support.
      
      1. Choose a support plan. You can add a support plan if you don't have one active for the affected product. Learn more in [Add a support plan](#add-a-support-plan).
      1. Set the [appropriate severity](support-overview.md#severity-and-responsiveness) for your request. 
   
          > [!WARNING]
          > - Submitting a **Severity A** request means you can engage with Microsoft until the issue is resolved. If you can't do so, file your case at a lower severity to avoid downgrade.
          > - Selecting **Severity A** for a low priority issue results in automatic downgrade to an appropriate severity.
          > - Selecting **Technical** in order to submit an **Advisory** request results in closure of your request. 
     
      1. Review the generated title and description for your request, and modify as needed. Set the date the issue occurred. If you're unsure, leave as current.
      1. Provide any requested details, such as an affected environment. Microsoft uses this information to help troubleshoot your issue. 
   
          > [!TIP]
          > If the affected environment isn't listed, select **My environment is not listed** and provide the URL of the environment.
      
      1. Set your contact preferences and advanced diagnostic consent. Learn more about [advanced diagnostics](/power-platform/admin/support-environment).
   
           > [!IMPORTANT]
           > Microsoft can't access or run diagnostics on data in your tenant or environment without consent. If you don't provide consent when it's required, a Microsoft support representative will contact you to update the consent before proceeding.
       
      1. If available, a **Live chat** checkbox appears in contact preferences. If you leave it checked, a Microsoft representative will join the chat after support request creation.
         
      1. Select **Create support request** to submit your request to Microsoft support. You'll receive a confirmation message when the request is created.
         
      1.  If offered a customer satisfaction survey, respond with your perspective to improve the experience. Engineers review your feedback.
   
### Use the backup support experience

If the support agent is unavailable or isn't performant, the backup support experience is available automatically or by selecting the **Switch to web form** button at the top of the panel. Through this experience, you can describe your issue, review any self-help solutions, and create a support request, if needed.

1. **Open backup support.**

      1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
      1. In the navigation pane, select **Support**. In the **Support** pane, select **Support requests**.
      1. On the **Support requests** page, select **Get support**. Typically, the support agent loads. The backup support experience shows in these scenarios.
            
         | Scenario | Backup support Behavior |
         | -------- | -------- |
         | Support agent is unavailable | The backup support experience loads automatically until the root cause is addressed. |
         | Support agent crashes | You're prompted to select the **Switch to webform** button at the top of the panel. An 8-hour cooldown period is triggered where the backup support experience loads by default when selecting **Get support** to allow the issue to be resolved. |
         | Support agent isn't performant | In the case of a critical timeout, the **Switch to webform** button appears at the top of the panel. You can choose to select it or wait for the support agent to respond. |
         | Specific scenario | A specific business scenario, technical limitation, or policy compliance reasons prevent use of some or all agentic features. |
     
      If you choose to or must switch to the backup experience, leave feedback when prompted so Microsoft can diagnose and address the issues. 
      
1. **Describe the problem.**

      1. Select the product where you experienced the issue.
   
          > [!IMPORTANT]
          > - Selecting **Dynamics 365 Customer Service** for customer service *with another* *product* **misroutes and delays a request.**
          > - For administration issues or if you encountered an issue in the Power Platform admin center, select this as the product. 
     
      1. Select the best fit **Category** and **Subcategory** to help route the request to the appropriate support representative. 
            
      1. Provide a summary title, then fully and [clearly describe the issue](/power-apps/maker/canvas-apps/service-request-support) in the description field. Provide as much detail as you can to help Microsoft understand the issue. All information is used to find solutions and becomes the **Title** and **Description** of any support request.
            
      1. Set the date the issue occurred to help Microsoft troubleshoot the issue. If you're unsure or it isn't relevant, leave it set to current date and time.
            
      1. Select **Next** to review available solutions for the issue.
      
1. **Review solutions.**

      The **Product**, **Title**, and **Description** are used to search known issues, Microsoft documentation, and community content, resulting in a generative answer.
      
      Review the provided answers to see if they address or resolve the issue. If the answers don't resolve the issue, select **Next** to create your support request.
      
1. **Request support.**

      1. Provide any requested details, such as an affected environment. This information is critical to help Microsoft troubleshoot your issue.

          > [!TIP]
          > If the affected environment isn't listed, select **My environment is not listed** and provide the URL of the environment.
      
      1. Select whether your request is [advisory or technical](support-overview.md#technical-support-vs-advisory-services). Some support plans don't have Advisory support.
      1. Choose a support plan. You can add a support plan if you don't have one active for the affected product. Learn more in [Add a support plan](#add-a-support-plan).
      1. Set the [appropriate severity](support-overview.md#severity-and-responsiveness) for your request.
  
          > [!WARNING]
          > - Submitting a **Severity A** request means you can engage with Microsoft until the issue is resolved. If you can't do so, file your case at a lower severity to avoid downgrade.
          > - Selecting **Severity A** for a low priority issue results in automatic downgrade to an appropriate severity.
          > - Selecting **Technical** in order to submit an **Advisory** request results in closure of your request. 
    
      1. Set your contact preferences and advanced diagnostic consent. To learn more, see [advanced diagnostics](/power-platform/admin/support-environment).
  
          > [!IMPORTANT]
          > Microsoft can't access or run diagnostics on data in your tenant or environment without consent. If consent is required but not provided, a Microsoft support representative contacts you to update the consent before proceeding.
    
      1. Select **Create support request** to submit. You see confirmation when successful. You can manage the request on the [Support requests page](https://admin.powerplatform.microsoft.com/support/requests).
      1. If offered a customer satisfaction survey, respond with your perspective to improve the experience. Engineers review feedback.

## Add a support plan
To add a support plan or check the support plans currently associated with a product, select the **Support plans** button shown on any of the **Support** pages. 

:::image type="content" source="media/get-help-support/support-plans-add-new-plan-panel.png" alt-text="Screenshot of Support plans panel showing options to view existing plans and add a new plan." lightbox="media/get-help-support/support-plans-add-new-plan-panel.png":::

Follow these instructions to add new support plans.

- **View existing plans:** Choose the product to check the associated plans. The **Support plans** menu lists the resulting plans once loaded.

- **Add a new plan:** Enter your **Access ID** and **Password** and select **Save** to associate the plan. To confirm the plan is ready to use, select the product the plan is associated with and check the value in the **Support plans** menu. It might take up to ah hour to appear. Select the refresh button to check again. Once a plan appears in this menu, it's ready to use. 

> [!NOTE]
>   - If you don't know your access or contract ID, contact your service admin, incident, or customer success account manager (CSAM).
>   - The **Contract ID**/**Password** defaults to the Unified or Premier contract ID. If you changed the password when registering online in the Unified/Premier portal, use the updated password instead of the contract ID.

### Use the support agent to add a plan

You can add a support plan while using the support agent.
1. After the self-help solutions are shown, select Create a support request.
1. Select **Add a new support contract**. 
1. Enter your access ID and password when prompted and select **Submit**.
    The support agent will confirm if the link was successful.

> [!Note]
> It may take up to an hour to add the new support contract. After that, you can submit a support request.

## Self-help content types

During the solutions phase of support workflows, you might see several distinct types of content. This content helps pinpoint the causes of the issue and find resolutions. If a particular resource doesn't apply, you can choose to move forward.

### Service health

Service health alerts notify you of active and recently resolved disruptions affecting your products and tenant. Expanding the **Service Health** card shows a title and preview of each alert along with a link to the details page. The details page contains the latest updates from Microsoft. You can notify Microsoft that you're seeking support for these issues by checking the relevant box and selecting **Submit**. You can also view active and recently resolved alerts on the [Support/Service Health](https://admin.powerplatform.microsoft.com/support/serviceHealth) page of the Power Platform admin center, and in the Microsoft admin center (where you can subscribe for email updates). For more information, see [View service health](view-service-health.md).

:::image type="content" source="media/get-help-support/service-health-card-active-alerts.png" alt-text="Screenshot of Service Health card showing active alerts." lightbox="media/get-help-support/service-health-card-active-alerts.png":::

### Known issues

Known issues represent bugs or product problems that product engineering teams identify and share. The details of the issue and any workarounds are provided. If your new issue seems related to an existing known issue, the support workflow displays details. You can review details by selecting the link. You can also search active and resolved known issues on the **Support Known Issues** page in the Power Platform admin center. For more information, see [View known issues](view-known-issues.md).

:::image type="content" source="media/support-agent-known-issues-card.png" alt-text="Screenshot of Known Issues." lightbox="media/support-agent-known-issues-card.png":::

### Generative answers

Generative answers are created in real time based on your issue description from Microsoft public documentation, internally authored troubleshooting content, and select [Power Platform](https://community.powerplatform.com/) and [Dynamics 365](https://community.dynamics.com/) community forums and blogs. A generative answer card consists of a reference to the issue as understood, the solution content or resolution steps, clickable citation links, and a navigation prompt to mark if the answer resolved your issue or if you wish to create a support request. If you're using the **Support Agent**, generated answers also show suggested follow-up questions. You can select from these questions or ask your own. The agent retains context when answering follow-up questions.

> [!IMPORTANT]
> It's important to note that AI-generated content might be incorrect.

:::image type="content" source="media/get-help-support/support-agent-generative-answer.png" alt-text="Screenshot of support agent generative answer card with citation links and follow-up options." lightbox="media/get-help-support/support-agent-generative-answer.png":::

## Report an outage

Depending on your tenant, you might be able to access the direct **Report outage** feature. If enabled, the **Report outage** button is visible on any of the support pages, next to the **Get support** button. If the **Report outage** feature isn't enabled, you can use the support agent or experience workflows to create a high-priority support request, if you have an active support plan.

To use the **Report outage** feature to raise a high-priority support request, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Support**, and then in the **Support** pane, select **Support requests**.
1. On the **Support requests** page, select **Report outage**. The **Report outage** pane is displayed. Submit information about the outage.

## Model-driven apps and support environments
For some support requests, you're asked to request a support environment. Currently, you can't create support environments for the Power Apps or Power Automate product options in the **What product were you using when the issue occurred?** field. To create a support request that includes a support environment for Power Platform issues, select the **Microsoft Dataverse** product for that field.

## Related content
- [Create an effective support request](/power-apps/maker/canvas-apps/service-request-support)

- [Support overview](support-overview.md)

- [How do I check my online service health?](check-online-service-health.md)
