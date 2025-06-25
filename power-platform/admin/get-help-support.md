---
title: Get Support in Power Platform
description: Use the Support experience to contact a Microsoft support representative to get resolution for your issue.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/11/2025
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

---
# Get Support

Admins can use the **Support** experience in the [Power Platform admin center](admin-documentation.md) to get self-help solutions in real-time for their issue. If the issue can't be resolved through self-help, you can use the same **Support** experience to contact a Microsoft support representative.

An example of solutions provided for Dynamics 365 App for Outlook issues:

> [!div class="mx-imgBorder"] 
> ![List of possible solutions.](media/support-solutions-list.png "List of possible solutions")

## Prerequisites

- You have a security role that is enabled for creating support requests. Users having one of these security roles can create support requests:

  - Microsoft Entra Role Admin  
  - Environment Administrator (or System Administrator role in Dataverse)
  - Company Admin
  - Billing Admin
  - Service Admin
  - CRM Service Admin
  - CRM Organization Admin
  - Power Platform Admin  
  - Security Admin
  - Partner Delegated Admin
  - SharePoint Admin
  - Teams Admin
  - Exchange Admin
  - Power BI Admin
  - Power Apps Environment Admin
  - Power Apps Full Admin
  - Compliance Admin
  - Helpdesk Admin
  - LCS User

- Available for the following [support plans](https://www.microsoft.com/dynamics365/support):
   
  - Subscription Support
  - Professional Direct Support
  - Unified Support

> [!NOTE]
> In the following cases, you might not be able to create a support request or we can't provide relevant solutions: 
> - There's an issue with your Unified or Premier Support contract. Contact your Incident Manager or Customer Success Account Manager (CSAM).
> - Your Support subscription has expired. Renew.
> - We couldn't find your support plan. 
>   - If you have a Unified or Premier Support plan, contact your Incident Manager or Customer Success Account Manager (CSAM).
>   - If you have a non-Unified/Premier Support plan, verify the plan is active. For support information, see [Community forums](https://community.dynamics.com/forums/thread/).

## View solutions or create a support request using the Support agent (Preview)

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with your admin credentials.

1. Select **Support** > **Support requests** and then select **Get support**.

1. The **Support agent PREVIEW** pane opens. This is a chat-based experience that provides self-help solutions and allows you to create a support request if needed. Select the **Technical** section to find solutions to your issue.

   :::image type="content" source="media/support-agent-new.png" alt-text="Screenshot shows the Support agent in the Power Platform admin center.":::

1. In the text box, describe the issue you're facing. The Support agent provides a list of possible solutions based on the information you provided.

   :::image type="content" source="media/support-agent-technical-result.png" alt-text="Screenshot shows the Technical section in the Support agent.":::   

1. Select either **Yes** or **No** to indicate if the solution suggested by the Support agent (Preview) was helpful. 
    - If you select **Yes**, the support request is closed, and you can provide feedback on the solution.
    - If you select **No**, you're prompted to create a support request. You can create a support request only if you have a valid support plan. If you don't have a support contract, you're prompted to add one or ask about a new topic.

## View solutions or create a support request using the **Support** experience

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with your admin credentials.

1. Select **Support** > **Support requests** and then select **Get support**.

1. To switch to the old **Support** experience instead of the Support agent experience, select the **...** (ellipsis) icon in the top right corner, and then select **Switch to old experience**.

1. Select **Proceed** to continue to the old experience. The **How can we help?** page opens with the following tabs:  

#### Problem tab 

1. In the **Problem** tab, select the product that you need help with. The product options are based on your licenses and the products you have access to. 

      > [!NOTE]
      > We've made changes to the product listing when creating a new support request. The following products are now available from the menu:
      > 
      > - Dynamics 365 Sales
      > - Dynamics 365 Marketing
      > - Dynamics 365 Customer Service
      > - Dynamics 365 Omnichannel for Customer Service
      > - Microsoft Dataverse
      > - Power Platform Administration
      > 
      > This change doesn't impact on your licenses.

1. Next, describe the exact error or describe the issue you're facing and then select the problem type. Scroll down and select **Get solutions** to view the possible solutions based on the product and problem type.

  :::image type="content" source="media/support-problem-tab.png" alt-text="Screenshot shows the Problem tab in the support page.":::


#### Copilot (Preview) tab 

This tab appears only for select products after you select it in the previous tab.

1. In the **Copilot (Preview)** tab, you see a list of suggested solutions based on the information you provided.  If you find a solution that seems relevant, select it to view more details.

1. Select either **Yes** or **No** to indicate if the solution suggested by Copilot (Preview) was helpful. 
    - If you select **Yes**, the support request is closed, and you can provide feedback on the solution.
    - If you select **No**, you're prompted to provide follow-up questions your issue. Select **Next** to continue.

  :::image type="content" source="media/support-copilot-tab.png" alt-text="Screenshot shows the Copilot (Preview) tab in the support page.":::


#### Solutions tab 

1. In the **Solutions** tab, you see a list of recommended solutions to your issue based on the information you provided. 

1. If the guidance doesn't resolve your issue, scroll down and select **Next**.

  :::image type="content" source="media/support-solutions-tab.png" alt-text="Screenshot shows the Solutions tab in the support page.":::


#### Support tab 

1. In the **Support** tab, you can create a support request. 

1. Enter your **Premier access ID** and the **Contract ID/password**. 

   > [!NOTE]
   > - For **Contract ID/password**, enter your Unified or Premier contract ID. 
   > - The **Contract ID/password** defaults to the Unified or Premier contract ID. If you have changed the password when registering online in the Unified/Premier portal, you should use the updated password instead of the contract ID.

   > [!IMPORTANT]
   > If you don't know your access or contract ID, contact your service admin or Incident Manager or Customer Success Account Manager (CSAM).

   > [!NOTE]
   > If you have one of the plans listed in [Prerequisites](#prerequisites), you can set the severity to a higher level than **Minimal**.

#### Contact tab  

In the **Contact** tab, enter your contact information. This information is used to contact you about the support request.


## View list of support requests

After you submit your request, it appears in the list of support requests. You can check the status and edit your request on this page.

  > [!NOTE]
  > Depending on availability, you might be able to use live chat option to converse with support engineers from Microsoft after creating a support request. More information: [Use live chat with persistence for support requests](live-chat-support.md)

## Advisory services and premium support plan

A [premium support plan](https://dynamics.microsoft.com/support) includes advisory services. You can submit a request to get answers relative to recommendations, best practices, general advice or guidance on the usage of the products.

Without a premium support plan, you can only submit request on technical issues. Progressively, such restriction is enforced and you can't create a support request for advisory services unless you have a premium support plan.

## Limited preview: Report outage  <---dont see this in any screen now--->

> [!NOTE]
> This is a preview feature available only to a limited set of customers to try out. If you don't see the **Report Outage** link, don't worry! We'll be bringing this feature to all customers in the future.

If you're experiencing a service outage, select the **Report outage** link to report the outage so that we can timely review and act on it.

   :::image type="content" source="media/live-chat-support/support-requests.png" alt-text="Screenshot that shows the Get support button under the Support requests section.":::

Fill out the pages and then submit to have your support request receive an expedited review.

> [!div class="mx-imgBorder"]
> ![Fill in outage info.](media/report-outage-page-one.png "Fill in outage info")

We'd love to know your thoughts on the new outage reporting process. Or, if you'd like to be considered for this limited preview, fill out this [form](https://forms.office.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR-5Axi2KMXdNi_1eF9P36tZUN1FUQkJLNVBZVVlOSVk0T0tIQTBIMk9VOC4u).

## Model-driven apps and support environments

For some support requests, you're asked to request a support environment. Currently, support environments can’t be created for the Power Apps or Power Automate product options in the **What product where you using when the issue occurred?** field. To create a support request which includes a support environment for Power Platform issues, select the **Microsoft Dataverse** product for that field.

:::image type="content" source="media/support-environment-select.png" alt-text="Screenshot shows the product options needing support environments.":::

### See also

- [Create an effective support request](/power-apps/maker/canvas-apps/service-request-support)
- [Support overview](support-overview.md)
- [How do I check my online service health?](check-online-service-health.md)


