---
title: Cineplex automates business processes with generative AI and Power Automate
description: Learn how Cineplex uses generative AI and Power Automate for invoice processing, financial reporting, onboarding, ticket sales, and more.
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: case-study
ms.date: 11/07/2024
ms.custom: sfi-image-nochange

---

# Cineplex automates business processes with generative AI and Power Automate

In this case study, you'll learn how [Cineplex](https://www.cineplex.com/), one of Canada's largest movie theater chains, transformed its operations through a range of automations to streamline business processes, reduce manual work, and improve efficiency across departments. Spearheaded by Bo Wang, Vice President of Tax and Treasury, the team established an [Automation Center of Excellence for Power Platform](/power-automate/guidance/automation-kit/overview/introduction) that drives Cineplex's digital shift.

With automations in critical areas like invoice processing, payroll, financial reporting, customer feedback, inventory, onboarding, ticket sales, and email processing, Cineplex achieved faster, more accurate workflows that enhance productivity and support better decision-making across the organization.

The team uses AI Builder to enhance automation with AI capabilities, such as keyword extraction in email processing, which improves system adaptability and handles high volumes of email messages during peak times.

Read the full story: [Cineplex saves 30,000 hours a year with Power Platform and generative AI](https://customers.microsoft.com/story/1751257654493783966-cineplex-telecommunications-power-automate-en-canada)

## Business challenges

Cineplex faced these challenges before implementing their Power Platform solution:

- **Manual processes**: Business processes were manual and time-consuming, requiring significant human effort and increasing the likelihood of errors.

- **Inefficiencies**: There were inefficiencies in various departments, such as finance and guest services, leading to delays and reduced productivity.

- **Lack of integration**: Existing systems lacked deep integration, resulting in fragmented workflows and making it difficult to share data across departments.

- **Scalability issues**: The company faced challenges in scaling their solutions to meet growing business needs, which hindered their ability to expand and adapt quickly.

- **Limited automation**: There was minimal use of automation, leading to higher operational costs and a greater chance of human error.

## Implementation approach

To automate business processes to improve efficiency and reduce manual work, the Cineplex team followed this implementation approach:

- **Identified key tasks to automate**: Cineplex found areas where automation can reduce manual work and improve efficiency.

- **Started with a pilot project**: The team began with a pilot project in one department. They used the pilot project to test and refine the automation process.

- **Expanded usage**: They rolled out successful automations across the organization.

- **Created a Center of Excellence (CoE)**: Cineplex adopted the Automation Kit, a comprehensive set of tools and components designed to manage, govern, and scale automation projects. The kit provided Cineplex with a single view of their automation portfolio, enabling them to track progress, measure return on investment (ROI), and identify new opportunities for automation.

- **Integrated AI capabilities**: The company used AI tools like AI Builder to enhance automation processes.

- **Monitor and improve**: Cineplex continuously assesses the success of the automations and makes improvements as needed.

## Identify key tasks to automate

Cineplex began their automation journey with **gift card activation**, by using Power Automate to manage orders through their Customer Relationship Management (CRM) system and activate cards in a separate system. After this success, they rolled out **email processing automation** by using AI Builder for handling high volumes of messages, automating information extraction, and routing to appropriate departments.

As they expanded usage across the company, Cineplex also automated other tasks, including:

- **Invoice processing**: Cineplex automated the extraction and processing of invoice data, reducing the time and effort required for manual data entry and minimizing errors. This automation ensures that invoices are processed quickly and accurately, improving overall financial efficiency.

- **Payroll management**: The company streamlined payroll calculations and data entry by automating these tasks. This automation ensures that employees are paid accurately and on time, enhancing employee satisfaction and reducing administrative workload.

- **Financial reporting**: Cineplex automated the generation and distribution of financial reports. This automation allows for timely and accurate financial insights, enabling better decision-making and strategic planning. Automated reporting also reduces the risk of human error and ensures consistency in financial data.

- **Customer feedback analysis**: Cineplex uses AI to analyze customer feedback to generate actionable insights. AI helps the company understand customer preferences and areas for improvement, leading to enhanced customer experiences and more targeted marketing strategies.

- **Inventory management**: The automation of inventory tracking and restocking processes ensures that Cineplex maintains optimal stock levels. This automation reduces the risk of stockouts or overstocking, leading to better inventory control and cost savings.

- **Employee onboarding**: Cineplex streamlines the onboarding process for new employees by automating various tasks such as document collection, training scheduling, and orientation. This automation makes the onboarding experience smoother and more efficient for both new hires and HR staff.

- **Ticket sales reporting**: The company automated the compilation and analysis of ticket sales data. This automation provides real-time insights into sales performance, helping Cineplex make informed decisions about promotions, pricing, and inventory management.

## Automation of gift card activation use case

Cineplex's automation of gift card activation served as a pilot project to test Microsoft Power Automate's feasibility and benefits. The goal was to streamline the manual, time-consuming process of activating physical gift cards purchased online by integrating their CRM system with the gift card activation system. The pilot automated the entire process, from order retrieval to activation:

- **Scheduled cloud flow**: A Power Automate cloud flow is scheduled to run twice a day. This automated process ensures that gift card orders are processed in a timely manner, reducing delays and improving customer satisfaction.

- **Desktop flow**: The cloud flow initiates a desktop flow, which handles the interaction with the systems involved in gift card activation. This desktop flow automates the steps that would otherwise require manual intervention, such as logging into systems and navigating through various screens.

- **Integration with CRM system**: The desktop flow accesses the CRM system to retrieve gift card orders.

- **Interaction with the activation system**: The flow then interacts with the separate gift card activation system to load and activate the cards. This step involves entering the necessary information into the activation system and confirming that the cards are successfully activated.

- **Error handling and notifications**: The flow includes error handling mechanisms to manage any issues that arise during the process. Notifications are sent to relevant team members if manual intervention is required. The automated notification ensures that any problems are quickly addressed, minimizing disruptions to the activation process.

The automation process includes a final step where the bot sends a summary email message and logs of all the orders that were activated. The summary email message provides visibility into the process and helps the team track the status of gift card activations.

:::image type="content" source="media/business-processes/gift-card-task-flow.png" alt-text="Diagram that shows the automated gift card automation process." lightbox="media/business-processes/gift-card-task-flow.png":::

## Automation of ticket refunds use case

The Cineplex team designed a workflow using Power Automate to handle the entire refund process. This automation aimed to streamline the manual, time-consuming process of handling refund requests, ensuring efficiency and accuracy. The workflow includes several key steps:

- **Capture refund requests**: The system automatically collects refund requests from various channels such as emails, online forms, and customer service interactions. Collecting refund requests ensures that all refund requests are captured in a centralized system, reducing the risk of missed or delayed requests.

- **Validate information**: The workflow ensures that all necessary information, such as booking ID and payment details, is correctly captured and validated. This step is crucial to prevent errors and ensure that refunds are processed accurately.

- **Process refunds**: The system integrates with Cineplex's payment systems to process refunds directly to the customer's original payment method. This integration allows for seamless and timely processing of refunds, improving customer satisfaction.

- **Notify customers**: Automated notifications are sent to customers to inform them that their refund request was received and processed. This step keeps customers informed and provides transparency throughout the refund process.

:::image type="content" source="media/business-processes/ticket-refund-task-flow.png" alt-text="Diagram that shows the ticket refund task flow." lightbox="media/business-processes/ticket-refund-task-flow.png":::

## Automation of email processing use case

Before automating their email processing, Cineplex faced challenges with handling a high volume of emails manually, which was time-consuming and prone to errors. Especially during peak holidays, handling email messages manually led to delayed responses, inconsistent handling, and significant resource allocation, diverting staff from more strategic tasks. Another challenge was that email inquiries were often missing key information needed to process the request, which led to lengthy email chains between departments.

To automate email processing, Cineplex took these steps:

- **Automate email sorting and categorization**: Cineplex automatically sorts and categorizes email messages based on predefined rules, reducing the need for manual intervention. This step ensures that emails are directed to the appropriate departments or individuals, speeding up response times and improving efficiency.

- **Set up automated responses**: Cineplex set up automated responses for common inquiries, ensuring timely and consistent communication with customers. These automated responses provide immediate acknowledgment of receipt and address frequently asked questions, enhancing customer satisfaction.

- **Integrate generative AI and AI Builder**: Cineplex integrated email automation with other internal systems to streamline processes such as ticketing and customer support. This integration ensures that information flows seamlessly between systems, reducing manual data entry and minimizing errors.

- **Integrate with other systems**: Cineplex integrated email automation with other internal systems to streamline processes such as ticketing and customer support.

- **Monitor and optimize**: Cineplex continuously monitors and optimizes the automated workflows to ensure they remain efficient and effective. Regular monitoring allows the team to identify any issues or bottlenecks and make necessary adjustments to improve performance.

:::image type="content" source="media/business-processes/copilot-diagram.png" alt-text="Diagram that shows the workflow of the Guest Services Copilot solution." lightbox="media/business-processes/copilot-diagram.png":::

## Related information

- [Automation adoption best practices](/power-automate/guidance/automation-coe/overview/)
- [Automation Center of Excellence strategy with the Automation Kit](/power-automate/guidance/automation-kit/overview/automation-coe-strategy)
- [Power Automate guidance documentation](/power-automate/guidance/)
- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [AI Builder documentation](/ai-builder/)


