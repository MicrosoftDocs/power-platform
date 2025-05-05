---
title: Teck automates data extraction with Power Automate and AI Builder
description: Learn how Teck automated extraction of customs data using Power Automate and AI Builder, saving 40 hours weekly and reducing errors by 99%.
#customer intent: As a Power Platform user, I want to learn how Teck automated data extraction using Power Automate and AI Builder and so that I can implement similar solutions to save time and reduce errors.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 04/24/2025
---

# Teck automates data extraction with Power Automate and AI Builder

In this case study, you learn how [Teck](https://www.teck.com/) used Microsoft Power Platform to transform its routine processes by automating the extraction of data from customs documents. Teck, a leading Canadian resource company, focuses on responsibly producing the metals essential for global development and the energy transition.

## Business challenges

The team led by Rodolfo Rodrigues, Jr., a Teck Customs Supervisor based in Toronto, faced a daily grind. They had to manually compare incoming customs documentation with system-generated documents. It was inefficient, tedious, and time-consuming work, requiring hours of line-by-line verification to ensure the accuracy of customs data. The sheer volume of this "busy work" put enormous stress on the team and prevented them from focusing on work that had a greater impact on the business.

The heavily manual process was also prone to human error, which could lead to compliance issues and financial penalties. The team needed a solution that would not only streamline their workflow but also enhance accuracy and reduce the risk of noncompliance.

> I saw a need, and I wanted to solve it. That's what I love about Power Platform&mdash;there's no limit to what you can build. Seeing the flow come together and watching it in action&hellip;it's like watching a symphony.
>
> — *Rodolfo Rodrigues, Jr., Customs Supervisor, Teck*

## The solution

Even though he doesn't have a background in software development, Rodrigues started to explore Microsoft Power Platform through online tutorials. He collaborated with coworker Jorge Obregon to develop an automated solution that eventually incorporated Power Automate, Power BI, and AI Builder along with SharePoint, Outlook, and Excel.

Now when team members receive emails with customs documents, the system automatically saves the attachments to a shared folder on SharePoint. AI Builder extracts key information from the documents and compares it with data from the company's system. Any mismatches are flagged for human review. Reports from the company database are automatically generated and uploaded to support the checks. A user-friendly Power BI dashboard visually displays the results, allowing the team to focus on flagged issues.

Overall, the new workflow saves 40 hours every week&mdash;hundreds of hours annually&mdash;and reduced errors by an incredible 99%. Managing the compliance process previously required five people, but now just one person completes the tasks&mdash;a fivefold increase in efficiency. The solution also improved the team's ability to monitor broker compliance levels and foster continuous improvements in their external partnerships.

The improved process not only frees up resources for strategic work but also enhances accuracy through consistent checks that minimize human error. By reducing the chances of noncompliance, it mitigates financial and reputational risks for Teck.

## Case study

In this technical case study, you learn how:

- Teck automated data extraction for customs documents using Power Platform and AI.
- Power Automate can complete time-consuming email processing, file storage, and data validation tasks.
- You can report the results of data extraction and comparison automatically.
- You can use Power Automate and Power Platform to automate repetitive, time-consuming tasks, freeing your employees for more engaging and strategic work.  

## The architecture

The following image shows the architecture of the automated solution. The tool uses Power Automate, including cloud flows and robotic process automation (RPA) desktop flows, AI Builder, and Power BI, along with other software like Outlook, SharePoint, and Excel.

:::image type="content" source="media/teck/architecture.png" alt-text="Flowchart showing the automated customs compliance process using Outlook, SharePoint, Power Automate, AI Builder, Excel, SAP, and Power BI." lightbox = "media/teck/architecture.png":::

The Power Automate flow checks the team's shared mailbox in Outlook and gathers the reference information, such as agent, date, and shipment ID, based on the sender. The flow then saves the files into a predetermined SharePoint folder, along with the metadata. Meanwhile, a Power Automate desktop flow downloads reports from the team's internal customs agent data feed and saves them to SharePoint.

In SharePoint, AI Builder extracts the data from each document and from the automated system. AI Builder then uses Excel to compare the data between the customs documents sent through email and the system-generated data. It confirms that the transactions have all the required documentation and ensures the sources don't contain any mismatched information. If the flow finds mismatched data, it flags the information for further review.

The results appear in a custom compliance dashboard built using Power BI.

## Key takeaways

The case study of Teck's data extraction and reporting demonstrates the potential of using Power Platform to set up file or data processing and comparison tools. Here are some key takeaways for professionals who are looking to implement a similar solution in their own organizations:

- **Process files**: Use Power Automate to process files sent in email and to compare the data.
- **Extract and compare data**: Use AI Builder to extract and compare the data.
- **Store documents**: Use Power Automate to automatically update and store the documents on SharePoint.
- **Monitor the results**: Use an automated Power BI dashboard to visualize and report the results of the data comparison.

Teck enjoys the following benefits of its automated data extraction tool:

- **Increased productivity**: The Teck team increased efficiency by five times on these tasks, saving hundreds of hours.
- **Reduced errors**: The solution reduced data processing errors by 99%.

## Looking ahead

As Rodrigues looks ahead, his focus is on empowering others. He's eager to share his knowledge by mentoring colleagues and inspiring them to explore Power Platform's capabilities. He believes that in a rapidly changing job market, these skills aren't just valuable&mdash;they're essential.

"If you're not building these skills now, you're going to be left behind," Rodrigues says. "The future belongs to those who can adapt, automate, and innovate. I want to help people get there."

## Related information

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Automation adoption best practices overview](/power-automate/guidance/automation-coe/overview/)
- [Overview of using Outlook and Power Automate](/power-automate/email-overview)
- [Get started with Copilot in cloud flows](/power-automate/get-started-with-copilot)
- [Automate a business process using Power Automate (learning path)](/training/paths/automate-process-power-automate/)
- [SharePoint document management software requirements](/power-platform/admin/sharepoint-document-management-software-requirements)
- [Create reports in the Power BI service with Copilot](/power-bi/create-reports/copilot-create-report-service)
