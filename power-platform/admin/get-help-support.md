---
title: Get Support in Power Platform
description: Use the Support experience to contact a Microsoft support representative to get resolution for your issue.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/17/2025
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

Admins can use the [Support experience](https://admin.powerplatform.microsoft.com/support/requests) in the [Power Platform admin center](admin-documentation.md) to get self-help solutions for an issue. If the issue can't be resolved through self-help, you can continue in the same **Support** experience to engage Microsoft support representative using your support plan. Should you need to link a plan with your account, you provide your access ID and password.

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
You can access self-help resources in the Support experience without a support plan. However, to create a request, you must have an active support plan. 

- Subscription Support
- Professional Direct Support
- Unified Support

[Learn more about and purchase support plans](https://www.microsoft.com/en-us/dynamics-365/support).

> [!Note]
> In the following cases, you might not be able to create a support request, or we can't provide solutions:
> - There's an issue with your Unified or Premier Support contract. Contact your Incident Manager or Customer Success Account Manager (CSAM).
> - Your Support subscription has expired. Renew.
> - We couldn't find your support plan.
>    - If you have a Unified or Premier Support plan, contact your Incident Manager or Customer Success Account Manager (CSAM).
>    - If you have a non-Unified/Premier Support plan, verify the plan is active. For support information, see [Community forums](https://community.dynamics.com/forums/thread/).

## Request support
There are two experiences depending on your tenant and scenario. Most will see the new Support agent, but some may see the older experience.

While the Support agent is in preview state, users can switch between experiences by selecting the ellipses  icon (**...**) in the upper-right of the **Support agent** pane.

### Use the Support agent to request support (preview)
The Support agent is an agentic chat which takes you through a workflow to resolve your issue. It is an expanding and evolving service with improvements being made and tested all the time. However, it's not purely a virtual support experience. You can find self-help solutions, create a support request, and engage Microsoft representatives. 

1. **Open the Support agent** <br>
    1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
    1. In the navigation pane, select **Support**, then in the **Support** pane, select **Support requests**.
    1. On the **Support requests** page, select **Get support**. The **Support agent** pane is displayed. Using a chat-like experience, complete the following steps of this procedure.
1. **Describe the issue.** <br>
    Describe the issue to the agent. Provide as much detail as you can to help the agent understand and categorize the issue. All information is used to both find solutions and create a support request.

    Indicate which product you're using. If the predicted product is incorrect, select **No**, and then specify the product name.

1. **Answer interview questions from the agent.** <br>
    The agent uses AI to interpret the issue description and may ask clarifying questions to gather details for solutions and a support request. The agent may ask for a **Category** and **Subcategory** to help route the request to the appropriate Microsoft support representative. All information that you provide is included in the description of your support request.

   If you don’t have the details requested by the agent, simply reply with “_I don’t have them_” or “_I don’t know_” and the interview will progress or complete.

1. **Review solutions.** <br>
    The Support agent provides solutions based on your description. The agent restates the issue, as understood by the agent, checks service health alerts, searches through known issues, and generates answers from documentation and community content or triggers troubleshoting dialogs. Review the content and follow the prompts to progress through the solutions.

    It's important to note that AI generated content may be incorrect.
   
1. **Escalate the issue, if needed.** <br>
If the content doesn't address or resolve your issue and you have a support plan, you can continue to create a support request. If available and eligible, live chat with a Microsoft support representative.

    If you don't have an associated plan, you can select **Add a new support contract** to associate a plan using the provided Contract ID and password.

    Engineers review feedback every day. If you have ideas for how to improve the experience, please take the time to offer your perspective.

### Use the legacy experience to request support
The legacy support experience is a support system based on forms and machine learning. It takes you through a workflow to resolve your issue. Through this experience you can find self-help solutions and create a support request to engage Microsoft representatives.

1. **Go to the legacy experience** <br>
    1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
    1. In the navigation pane, select **Support**, then in the **Support** pane, select **Support requests**.
    1. On the **Support requests** page, select **Get support**.
    1. If the **Support agent** pane is displayed, select the ellipses  icon (**...**) in the upper-right of pane. Then select **Switch to old experience.**
    1. Confirm that you want to proceed to the old experience.
    1. The **How can we help?** pane is displayed. Complete the following steps of this procedure.

1. **Describe the problem.** <br>
    Select the product you're using. Then provide any requested details, such as the environment, to help Microsoft troubleshoot.

    > [!Note]
    > If you're unsure about what product to select or if your issue spans products, select the product where the issue was experienced. If you do not see your environment, select **My environment is not listed**.

    Describe the issue. Provide as much detail as you can to help Microsoft categorize and find solutions.

    Select the arrow to submit your answers. The form may ask for a **Type** and **Subtype** to help route the request to the appropriate Support representative. Select the best fit. All information is used to both find solutions and create a support request.

1. **Use Copilot.** <br>

    Once the issue and details are submitted, the issue description will be passed to the **Copilot** tab which will search for service health alerts, search known issues, and generative answers from documentation and community content.

    If the initial answers do not resolve the issue, you may select **No** and ask a follow-up question or **Next** to continue. All information provided is included in the description of your support request.

1. **Review solutions.** <br>

    If the Copilot chat doesn't provide an answer which resolves the issue, content is shown. Content shown here is often troubleshooting dialog and documentation search results. If a dialog is shown, navigate the dialog to a solution to both find and answer and help categorize this issue for any support request. You can then select **Next** to continue to create a support request.

1. **Provide information for the Support team.** <br>

    If self-service content does not resolve your issue, and you have a support plan, you can create a support request. 

    1. Select from available support plans or add a new plan. You may be asked for a **Request reason** as only premium plans allow for advisory support requests.
    2. Fill out the support request form, severity, and set advanced diagnostic consent. Some products show optional fields where you can provide helpful details for the Microsoft representative.
    3. Select **Next** to continue to **Contact details**. Fill out your preferences and select **Submit** to create the case. You can track status of the request on the Support page.
  
## Support plan information
When you submit a support request, you must enter your **Contract ID/Password** information. Be sure to enter your Unified or Premier contract ID. The **Contract ID/Password** defaults to the Unified or Premier contract ID. If you have changed the password when registering online in the Unified/Premier portal, you should use the updated password instead of the contract ID.

> [!Important]
> If you don't know your access or contract ID, contact your service admin or incident manager or Customer Success Account Manager (CSAM).

## Self-help content types
Several distinct types of content may be presented during the Solutions phase of the Support Agent workflows. As you progress through each step, these resources are designed to help you pinpoint the causes and find resolutions for your issue. If a particular resource does not apply, you can choose to move forward, or, when prompted by a troubleshooting dialog, select the most appropriate answers to describe your situation.

### Service health alerts
Service health alerts notify you of disruptions affecting your product or tenant. A title and preview of the alert is shown in the card. You can see details by selecting the link. Active and recently resolved alerts can be viewed on the Support Service Health page of the Power Platform admin center, as well as in the Microsoft admin center. Learn more in [View service health](view-service-health.md).

### Known issues
Known issues represent bugs or product issues identified by product engineering teams. Details of the issue and any workarounds are provided. If your new issue seems related to a known issue, this is displayed during the support workflow. You can review details by selecting the link. You can search active and resolved known issues on the Support Known Issues page in the Power Platform admin center. Learn more in [View known issues](view-known-issues.md).

### Generative answers
Generative answers are created in real-time based on your issue description from Microsoft public documentation, internally authored troubleshooting content, and select [Power Platform](https://community.powerplatform.com/) and [Dynamics 365](https://community.dynamics.com/) community forums and blogs. A generative answer card consists of a restatement of the issue as understood, the solution content or resolution steps, clickable citation links, and a navigation prompt. 

It's important to note that AI generated content may be incorrect. 

### Dialogs
Troubleshooting dialogs are designed to guide you towards a solution should generative answers not resolve the issue. These dialogs are often triggered if there is a level of ambiguity about your issue. Navigating these dialogs to a solution is required to proceed in many cases. These dialogs are created by product teams to represent frequent issues, questions and other topics seen in previous support requests. By navigating the dialog, you can both find answers and help Microsoft categorize the issue, so any support request is routed to the correct Microsoft support representative, and the owning product engineering team is alerted.

### Documentation search results
(Support Experience only) Displayed are the top 3 search results from Microsoft product documentation based on your selected product and issue description. Select a link to review the articles relevant to your issue.

## Report outage
























#### Support Agent workflow

##### **Issue**

Describe the issue to the Agent and confirm the product. Provide as much
detail as you can to help Microsoft understand and categorize the issue.
All information will be used to both find solutions and create a support
request. Do not include personal, confidential or proprietary
information ([Microsoft Privacy
Statement](https://www.microsoft.com/en-us/privacy/privacystatement)).

<table>
<colgroup>
<col style="width: 48%" />
<col style="width: 51%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><p>Describing the issue, with
suggestions:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image3.png" alt-text="":::</p></th>
<th style="text-align: center;"><p>Confirming the product:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image4.png" alt-text="":::</p>
<p>Selecting a different product:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image5.png" alt-text="":::</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

**Note:** If the predicted product is incorrect, select “No” and choose
from the next 5 most likely products, or select from the full list of
available products.

##### **Interview**

The Agent will use AI to interpret the issue description and may ask
clarifying questions to gather details for solutions and a support
request. The Agent may ask for a Category and Subcategory to help with
support request routing. All information provided will be included in
the description of your support request. Do not include personal,
confidential or proprietary information ([Microsoft Privacy
Statement](https://www.microsoft.com/en-us/privacy/privacystatement)).

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><p>Questions and answers:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image6.png" alt-text="A screenshot of a chat AI-generated content may be incorrect.":::</p></th>
<th style="text-align: center;"><p>Gathering details and categorizing
the issue:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image7.png" alt-text="":::</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

**Note:** If you don’t have the details requested by the interview
question. Simply reply with “I don’t have them” or “I don’t know”
appropriate and the interview will progress or complete.

##### **Solutions**

The Support Agent will summarize the product, issue description and your
interview answers, then check [service health
alerts](#several-distinct-types-of-content-may-be-presented-during-the-solutions-phase-of-the-support-agent-workflows.-as-you-progress-through-each-step-these-resources-are-designed-to-help-you-pinpoint-the-causes-and-find-resolutions-for-your-issue.-if-a-particular-resource-does-not-apply-you-can-choose-to-move-forward-or-when-prompted-by-a-troubleshooting-dialog-select-the-most-appropriate-answers-to-describe-your-situation.),
search [known issues](#known-issues), [generate
answers](#generative-answers) from documentation and community content
or trigger [troubleshooting dialogs](#dialogs). Review the content and
follow the prompts to progress through the solutions:

##### **Escalation**

If self-service content does not address or resolve your issue and you
have a support plan you can continue to create a support request, and if
available and eligible, live chat with a Microsoft support
representative.

**Note:** If you do not have an associated plan. You can select “[Add a
new support contract](#adding-a-support-plan)” to associate a plan using
the provided **Contract ID/password**.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><p>Creating a Support Request:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image8.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::</p>
<p>Selecting a support plan and <a
href="https://learn.microsoft.com/en-us/power-platform/admin/support-overview#severity-and-responsiveness">severity</a>:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image9.png" alt-text="":::</p>
<p>Support Request details:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image10.png" alt-text="":::</p>
<p>Contact Details and set <a
href="https://learn.microsoft.com/en-us/power-platform/admin/support-environment">Advanced
Consent</a></p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image11.png" alt-text="":::</p>
<p>Case submission and CSAT Survey:</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image12.png" alt-text="":::</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

**Note:** Engineering reviews feedback every day. If you have ideas for
how to improve the experience, please take the time to offer your
perspective.

### Support Experience (Legacy)

The legacy support experience is a forms and machine learning (ML) based
support system, which takes you through a workflow to resolve your
issue. Through this experience you can find self-help solutions and
create a support request to engage Microsoft representatives. The
Support Experience has several sequential phases:

1.  **[Problem](#problem):** Describe the issue to better scope solution
    content.

2.  **[Copilot](#copilot):** See [service health
    alerts](#service-health-alerts), [known issues](#known-issues), and
    chat with an AI agent for generative solutions.

3.  **[Solutions](#_Solutions_1):** Navigate [troubleshooting
    dialogs](#dialogs) to review additional solutions and categorize the
    issue.

4.  **[Details & Contact](#details-contact):** Fill out and submit a
    support request if self-help does not meet your needs.

#### Support Experience Workflow

##### Problem

Begin by selecting the product. Then provide any requested details, such
as Environment, to help Microsoft troubleshoot. Next describe the issue.
Provide as much detail as you can to help Microsoft categorize and find
solutions. After clicking the arrow to submit, the form may ask for a
Type and Subtype to help with support request routing. Select the best
fit. **All information will be used to both find solutions and create a
support request. Do not include personal, confidential or proprietary
information ([Microsoft Privacy
Statement](https://www.microsoft.com/en-us/privacy/privacystatement)).**

| :::image type="content" source="media/lmc-draft-doc_ppac-get-support/image13.png" alt-text="":::  |
|---------------------------------------------|

**Note:** If you are unsure about what product to select or if your
issue spans products, select the product where the issue was experience.
If you do not see your environment, select “My environment is not
listed”.

##### Copilot

Once the issue and details are submitted, the issue description will be
passed to the Copilot tab which will search for [service health
alerts](#several-distinct-types-of-content-may-be-presented-during-the-solutions-phase-of-the-support-agent-workflows.-as-you-progress-through-each-step-these-resources-are-designed-to-help-you-pinpoint-the-causes-and-find-resolutions-for-your-issue.-if-a-particular-resource-does-not-apply-you-can-choose-to-move-forward-or-when-prompted-by-a-troubleshooting-dialog-select-the-most-appropriate-answers-to-describe-your-situation.),
search [known issues](#known-issues), [generative
answers](#generative-answers) from documentation and community content.
If the initial answers do not resolve the issue, you may select “No” and
ask a follow-up question or “Next” to continue. **All information
provided will be included in the description of your support request. Do
not include personal, confidential or proprietary information
([Microsoft Privacy
Statement](https://www.microsoft.com/en-us/privacy/privacystatement)).**

:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image14.png" alt-text="A screenshot of a chat AI-generated content may be incorrect.":::

##### Solutions

If the Copilot chat does not provide an answer which resolves the issue,
content will be shown. Content shown here is often [troubleshooting
dialog](#dialogs) and [documentation search
results](#documentation-search-results). If a dialog is shown, navigate
the dialog to a solution to both find and answer and help categorize
this issue for any support request. You can then select “Next” to
continue to support request creation.

##### Details & Contact

If self-service content does not resolve your issue, and you have a
support plan, you can create a support request. First, select from
available support plans or [add a new plan](#adding-a-support-plan). You
may be asked for a “Request reason” as only [premium
plans](https://dynamics.microsoft.com/support) allow for advisory
support requests. Next, fill out the support request form,
[severity](https://learn.microsoft.com/en-us/power-platform/admin/support-overview#severity-and-responsiveness)
and set [advanced diagnostic
consent](https://learn.microsoft.com/en-us/power-platform/admin/support-environment).
Some products show optional fields where you can provide helpful details
for the Microsoft representative. When complete select “Next” to
continue to Contact details. There fill out your preferences and select
“Submit” to create the case. You can track status of the request on the
Support page.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><p>Support Request Form</p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image15.png" alt-text="":::</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

### Adding a Support Plan

For **Contract ID/password**, enter your Unified or Premier contract ID.
The **Contract ID/password** defaults to the Unified or Premier contract
ID. If you have changed the password when registering online in the
Unified/Premier portal, you should use the updated password instead of
the contract ID.

<table>
<colgroup>
<col style="width: 49%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><p><a href="#support-agent">Support
Agent</a></p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image16.png" alt-text="A screenshot of a support plan AI-generated content may be incorrect.":::</p></th>
<th style="text-align: center;"><p><a
href="#support-experience-workflow">Support Experience</a></p>
<p>:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image17.png" alt-text="A screenshot of a phone AI-generated content may be incorrect.":::</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

**Important:**

If you don't know your access or contract ID, contact your service admin
or Incident Manager or Customer Success Account Manager (CSAM).

### Self Help Content Types

##### Several distinct types of content may be presented during the Solutions phase of the Support Agent workflows. As you progress through each step, these resources are designed to help you pinpoint the causes and find resolutions for your issue. If a particular resource does not apply, you can choose to move forward, or, when prompted by a [troubleshooting dialog](#dialogs), select the most appropriate answers to describe your situation.

##### Service Health Alerts

| Service health alerts notify you of disruptions affecting your product or tenant. A title and preview of the alert is shown in the card. You can see details by clicking the link. Active and recently resolved alerts can be viewed on the [PPAC Support Service Health](https://admin.powerplatform.microsoft.com/support/serviceHealth) page as well as the [Microsoft Admin Center](https://admin.microsoft.com/Adminportal/Home#/servicehealth). [Learn more](https://learn.microsoft.com/en-us/power-platform/admin/view-service-health)… | :::image type="content" source="media/lmc-draft-doc_ppac-get-support/image18.png" alt-text="A screenshot of a computer AI-generated content may be incorrect."::: |
|----|----|

##### Known Issues

| Known Issues represent bugs or product issues identified by product engineering teams. Details of the issue and any workarounds will be provided. If your new issue seems related to a known issue, this will be displayed during the support workflow. You can review details by clicking on the link. You can search active and resolved known issues on the [PPAC Support Known Issues](https://admin.powerplatform.microsoft.com/support/knownIssues) page. [Learn more](https://learn.microsoft.com/en-us/power-platform/admin/view-known-issues)… | :::image type="content" source="media/lmc-draft-doc_ppac-get-support/image19.png" alt-text="A screenshot of a computer error AI-generated content may be incorrect."::: |
|----|----|

##### Generative Answers

| Generative answers are created in real time based on your issue description from [Microsoft public documentation](https://learn.microsoft.com/en-us/power-platform/admin/view-known-issues), internally authored troubleshooting content, and select [Power Platform](https://powerusers.microsoft.com/) and [Dynamics](https://community.dynamics.com/) community forums and blogs. A generative answer card consists of a restatement of the issue as understood, the solution content or resolution steps, clickable citation links and a navigation prompt. **It is important to note that AI generated content may be incorrect.** | :::image type="content" source="media/lmc-draft-doc_ppac-get-support/image20.png" alt-text="A screenshot of a computer error AI-generated content may be incorrect."::: |
|----|----|

##### Dialogs

| Troubleshooting dialogs are designed to guide you towards a solution should generative answers not resolve the issue. These dialogs are often triggered if there is a level of ambiguity about your issue. Navigating these dialogs to a solution is required to proceed in many cases. These dialogs are created by product teams to represent frequent issues, questions and other topics seen in previous support requests. By navigating the dialog, you can both find answers and help Microsoft categorize the issue, so any support request is routed to the correct Microsoft support representative, and the owning product engineering team is alerted. | :::image type="content" source="media/lmc-draft-doc_ppac-get-support/image21.png" alt-text="A screenshot of a computer AI-generated content may be incorrect."::: |
|----|----|

##### Documentation Search Results

| ([Support Experience](#support-experience-legacy) only) Displayed are the top 3 search results from Microsoft product documentation based on your selected product and issue description. Select a link to review the articles relevant to your issue. | :::image type="content" source="media/lmc-draft-doc_ppac-get-support/image22.png" alt-text="A screenshot of a computer program AI-generated content may be incorrect."::: |
|----|----|

### Report outage (limited preview)

**Note:** This is a preview feature available only to a limited set of
customers to try out. If you don't see the **Report Outage** link, don't
worry! We'll be bringing this feature to all customers in the future.

If you're experiencing a service outage, select the **Report
outage** link to report the outage so that we can timely review and act
on it.

:::image type="content" source="media/lmc-draft-doc_ppac-get-support/image23.png" alt-text="Screenshot that shows the Get support button under the Support requests section.":::

Fill out the pages and then submit to have your support request receive
an expedited review.

We'd love to know your thoughts on the new outage reporting process. Or,
if you'd like to be considered for this limited preview, fill out
this [form](https://forms.office.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR-5Axi2KMXdNi_1eF9P36tZUN1FUQkJLNVBZVVlOSVk0T0tIQTBIMk9VOC4u).

### Model-driven apps and support environments

For some support requests, you're asked to request a support
environment. Currently, support environments can’t be created for the
Power Apps or Power Automate product options in the **What product where
you using when the issue occurred?** field. To create a support request
which includes a support environment for Power Platform issues, select
the **Microsoft Dataverse** product for that field.

**See also**

- [Create an effective support
  request](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/service-request-support)

- [Support
  overview](https://learn.microsoft.com/en-us/power-platform/admin/support-overview)

- [How do I check my online service
  health?](https://learn.microsoft.com/en-us/power-platform/admin/check-online-service-health)


