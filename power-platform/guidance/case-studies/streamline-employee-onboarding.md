---
title: Epiq streamlines employee onboarding with Power Automate, Microsoft Dataverse, and AI Builder
description: Learn from legal and business services firm Epiq how to streamline onboarding with Power Automate, Dataverse, and AI Builder.
author: shellyhaverkamp
ms.author: sashi
ms.topic: overview
ms.subservice: case-study
ms.date: 08/05/2024
ms.custom: sfi-image-nochange
---

# Epiq streamlines employee onboarding with Power Automate, Microsoft Dataverse, and AI Builder

In this article, you learn from a real-world example how Epiq, a global legal and compliance firm, built an employee onboarding solution with Power Automate, Microsoft Dataverse, and AI Builder.

Before building its onboarding solution with Power Platform tools, [Epiq](https://www.epiqglobal.com/) faced challenges with inconsistent and manual onboarding processes across its 6,000-person workforce in 18 countries/regions. The COVID-19 pandemic highlighted the need for a more efficient solution. Colton Coan, Senior Manager of Rapid Development, spearheaded the implementation of the company's Launchpad onboarding solution using Power Automate and Dataverse.

The Launchpad initiative streamlined the onboarding process, integrating seamlessly with Epiq’s existing systems and eliminating manual tasks. The solution enabled rapid scaling for short-term projects, significantly reducing onboarding time and costs. As a result, new hires gained quicker access to necessary tools, and IT staff could focus on higher-value tasks.

Power Automate and Dataverse provided a ready-to-go toolkit, capable of integrating with Epiq’s existing human capital management (HCM) and IT systems. Using Power Automate and Dataverse eliminated manual effort and provided the flexibility to adapt the process for business units that needed to mass-hire short-term employees for specific projects.

## Business challenges

Epiq specializes in handling complex legal matters including investigations, class actions, e-discovery, and document reviews for corporate and government clients. Before implementing its Power Automate and Dataverse solution, Epiq faced several common onboarding challenges:

- Business units had inconsistent processes with no centralized governance.
- Hiring managers lacked visibility into the onboarding status of new employees.
- Microsoft 365 licenses were assigned manually.
- Outlook mailboxes were created manually.
- IT asset life cycle management was complex due to spreadsheet-based tracking.
- Managing mass-hire scenarios for class action or document review service engagements was difficult.

Epiq streamlined employee onboarding by eliminating manual data entry with Power Automate, improving automation and reporting with Dataverse, and performing bulk actions in mass-hiring scenarios with AI Builder.

## Implementation approach

To create an onboarding solution that addresses these common onboarding challenges, use Epiq's approach as an example:  

- **Identify key tasks to automate**. Start by identifying the most time-consuming and error-prone tasks in your onboarding process. For Epiq, these tasks included assigning Microsoft 365 licenses, creating Outlook mailboxes, and managing laptop requests.

- **Build the solution with Power Automate flows**. Create automated workflows that handle repetitive tasks. Epiq created Power Automate flows to assign Microsoft 365 licenses, create Outlook mailboxes, request laptops for new hires, and send email confirmation to hiring managers.

- **Integrate AI Builder for bulk actions**. AI Builder handles large-scale onboarding scenarios. The Epiq team trained models to recognize patterns in bulk data and automate actions accordingly.

- **Monitor and optimize**. Create Power BI dashboards that provide insights into the onboarding process. Epiq regularly reviews its workflows and data, continuously identifying areas for improvement.

## Identify key tasks to automate

Streamlining HR operations and improving efficiency starts with identifying key tasks and pain points. By working with IT and business stakeholders, the Epiq team identified several pain points in the new hire onboarding process:

- **Data entry**: The HR manager enters new employee details into the HCM system and assigns an employee ID.

- **Account creation**: The IT team creates a user account in Microsoft Entra ID.

- **License assignment**: The IT team assigns the appropriate Microsoft 365 license based on the employee’s role and business unit.

- **Mailbox provisioning**: The IT team creates an Outlook mailbox for the new employee.

- **Confirmation of new employee setup**: The IT team sends an email confirmation to the new employee’s manager.

- **Hardware requests**: The new employee’s manager requests necessary hardware (for example, a laptop) and specialized software.

- **Delivery tracking**: The new employee’s manager tracks laptop delivery by checking the shipping provider’s website.

- **Status tracking**: The IT team monitors the status of each onboarding action to ensure readiness for the new employee’s first day.

:::image type="content" source="media/onboarding/manual-task-flow.png" alt-text="Diagram showing manual onboarding tasks across business units." lightbox="media/onboarding/manual-task-flow.png":::

## Build the solution with Power Automate flows

The Epiq team built a solution to replace the disparate spreadsheets that each business unit used, improving data quality and security through centralized controls:

1. Entering the new employee's details in the HCM system triggers the Power Automate flow, which can use prebuilt connectors or custom connectors.

1. A subsequent automation creates the user account in Microsoft Entra ID.

1. Power Automate checks the HCM system every 15 minutes for new employees and identifies the employee ID.

1. A validation step ensures that a user account exists in Microsoft Entra ID before proceeding.

1. Employee details including employee ID, name, business unit, manager, and the event type **onboard** are picked up from the HCM system and added as a new row to a Dataverse table.

1. The **onboard** event type in Dataverse triggers subsequent employee setup flows. Other event types, such as **offboard**, can be used to trigger different flows.

1. The automation identifies and assigns an appropriate Microsoft 365 license based on the new employee’s role and business unit.

1. An Outlook mailbox is automatically created for the new employee with Azure Automation Runbooks using PowerShell.

1. Setup confirmation for the new employee is automatically emailed to the hiring manager.

1. At each step, details are collated in Dataverse to avoid calling other systems multiple times.

:::image type="content" source="media/onboarding/automated-task-flow.png" alt-text="Diagram showing automated onboarding workflow." lightbox="media/onboarding/automated-task-flow.png":::

*"My goal throughout this solution is that every step we take to gather more data, we’re aggregating that data in their record in Dataverse&mdash;so when we have to look it up later in the process, we’re only looking up against Dataverse."*&mdash;Colton Coan, Senior Director of Rapid Development

### Create the flows

Epiq's onboarding solution uses a scheduled cloud flow to routinely check the HCM system for new employees, adding each one as a new row in a selected Dataverse table. The table update triggers subsequent new employee setup actions.

Splitting the Power Automate automation into two subprocesses makes it easier to troubleshoot and rerun the flow for an individual employee if an issue is encountered:

- **First subprocess**: Collect employee details from the HCM system and add them to Dataverse.

- **Second subprocess**: Complete setup tasks.

The Epiq team created an automation to collate employee data from multiple systems and then execute setup tasks.

The following table describes the automation.

| App | Action | Description |
|-----|--------|-------------|
| ![Scheduled cloud flow icon](media/onboarding/scheduled-cloud-flow-icon.png) | A scheduled event runs every 15 minutes. | Start with a scheduled cloud flow to set up a recurring flow automation. You can set the repeat time interval, such as every 15 minutes. |
|  ![Http icon](media/onboarding/http-icon.png) | Check the HCM system for new employees. | Integrate with your HCM system using a prebuilt connector if available or create a custom connector. |
|  ![Dataverse icon](media/onboarding/dataverse-icon.png) | Add new employee details to a Dataverse table. | Use the Dataverse **Add a new row** action to write the employee details from the HCM system to a Dataverse table (for example, a **Workers** table). |
| ![Dataverse icon](media/onboarding/dataverse-icon.png) | When a row is updated in a Dataverse table. | Use the Dataverse **When a row is added, modified, or deleted** action to monitor changes to employee details. You could also specify an event type, for example, **onboard**, to trigger relevant subprocesses. |
| ![Microsoft Entra ID icon](media/onboarding/microsoft-entra-id-icon.png) | Search Microsoft Entra ID for the user account. | Use the Microsoft Entra ID connector to identify the new employee’s user account in Microsoft Entra ID based on the employee ID collected earlier from the HCM system. |
| ![Http icon](media/onboarding/http-icon.png) | Assign a Microsoft 365 license to the new employee. | Use a Microsoft Graph call to identify the new employee’s role and assign an appropriate Microsoft 365 license. |
| ![Http icon](media/onboarding/http-icon.png) | Create an Outlook mailbox for the new employee. | Use another Microsoft Graph call to create an Outlook mailbox for the new employee. |
| ![Outlook icon](media/onboarding/outlook-icon.png) | Send an email to the new employee's manager. | First-day setup confirmation is emailed to the new employee’s manager using the Outlook connector. |

## Apply the solution architecture to your organization

You can use Epiq's solution architecture and design patterns for similar onboarding use cases in your organization. For example:

- Streamline staff offboarding processes.

- Onboard new students, faculty, or staff in a college or university, creating Microsoft 365 accounts based on their student or employee ID.

- Automate smaller-scale, routine onboarding processes to test the solution and gather feedback before scaling enterprise-wide.

## Use AI Builder for bulk actions

Next, the Epiq team identified the need within specific business units to accommodate a mass-hire scenario, where many new staff members are onboarded together for a shorter-term client engagement.

Mass hiring required a variation of the onboarding process to allow the recruitment team to submit a list of new hires as a group and to avoid sending an onboarding email confirmation for each new team member.

The Epiq team adapted the automation to identify when the recruitment team submitted a mass-hire form created in Microsoft Forms. Then they used AI Builder to structure the data into JSON so that it would be added to Dataverse in a consistent format. Power Automate detects the bulk addition and collates all new employee details into a single email message to the hiring manager.

*“The biggest challenge we’ve had over three years that this solution solved was that when people fill out the form, some put a comma-delimited list, some do semi-colons. We’re using the GPT model of AI Builder to normalize that data."*&mdash;Colton Coan, Senior Director of Rapid Development

:::image type="content" source="media/onboarding/mass-hire-flow.png" alt-text="Diagram showing Epiq's mass-hire onboarding workflow." lightbox="media/onboarding/mass-hire-flow.png":::

## Handle laptop requests and status tracking

The team extended the onboarding flow with automations to improve the user experience for hiring managers, including prompts to select hardware for their new team member.

Along with a Microsoft 365 license and an Outlook mailbox, new employees usually require a laptop, which is an ideal task for automation and status tracking. By identifying these concurrent onboarding activities, the team automated more actions triggered by the same **onboard** event type.

The automation prompts the hiring manager to select hardware and any software required for the new employee, and then automatically logs a ticket in the IT Service Management (ITSM) tool. The laptop delivery tracking link and shipping status are retrieved from the shipping provider, and then added to the employee’s record in Dataverse.

The IT team uses a Power Apps interface for centralized monitoring and remediating individual employee setup flows if an issue arises.

:::image type="content" source="media/onboarding/hardware-flow.png" alt-text="Diagram showing Epiq's hardware ordering workflow." lightbox="media/onboarding/hardware-flow.png":::

## Create onboarding status tracking dashboards

Aggregating onboarding data into Dataverse not only helped drive the Power Automate automations, but also enabled the Epiq team to set up tailored Power BI reports for different audiences from a centralized dataset.

For example, they created a management view to focus on higher-level first-day readiness information for hiring managers. They created an IT monitoring view that provides detailed information for status monitoring, task expediting, and longer-term efficiency analysis.

:::image type="content" source="media/onboarding/reporting-flow.png" alt-text="Diagram showing data sources for reporting." lightbox="media/onboarding/reporting-flow.png":::

## Key takeaways

The case study of Epiq’s employee onboarding solution demonstrates the transformative potential of using Power Automate, Microsoft Dataverse, and AI Builder. By addressing common onboarding challenges, Epiq streamlined processes, reduced manual tasks, and improved overall efficiency. Here are some key takeaways for IT professionals who are looking to implement a similar solution in their own organizations:

- **Identify pain points**: Identify the most time-consuming and error-prone tasks in your onboarding process. Prioritize which tasks to automate first.

- **Take advantage of automation tools**: Use Power Automate to create workflows that handle repetitive tasks, such as license assignments and mailbox creation. Reduce manual effort and ensure consistency.

- **Integrate with existing systems**: Ensure that your solution seamlessly integrates with your existing HCM and IT systems. Maintain data integrity and streamline processes.

- **Use AI for bulk actions**: Use AI Builder to handle large-scale onboarding scenarios and manage mass-hire situations more easily.

- **Monitor and optimize**: Use tools like Power BI to monitor the performance of your onboarding processes. Regularly review and optimize your workflows to continuously improve efficiency.

## Related information

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Run flows on a schedule](/power-automate/run-scheduled-tasks)
- [Start a flow based on a Dataverse event](/power-automate/dataverse/create-update-delete-trigger?tabs=classic-designer)
- [Top scenarios for sending emails to users](/power-automate/email-top-scenarios)
