---
title: How Teck automates data extraction with Power Platform and AI Builder
description: Learn how Teck automated customs data extraction using Power Platform and AI Builder, saving 40 hours weekly and reducing errors by 99%.
#customer intent: As a Power Platform user, I want to learn how Teck automated data extraction using Power Platform and AI Builder so that I can implement similar solutions to save time and reduce errors.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 04/24/2025
---

# How Teck automates data extraction with Power Platform and AI Builder

In this article, you learn how [Teck](https://www.teck.com/), a top Canadian resource company, leverages Power Platform to revolutionize their routine processes. This enables Teck to efficiently provide essential metals for global development and energy transition.

Rodolfo Rodrigues Jr., a Customs Supervisor based in Toronto, is able to explore Power Platform through online tutorials, even though he doesn't have a background in software development. Rodolfo collaborated with Jorge Obregon, and they started by automating document transfers from a shared mailbox to SharePoint, which eliminates hours of manual work.

Rodolfo’s team faced a daily grind: They had to manually compare incoming customs documentation with system-generated documents. This task was time-consuming, requiring hours of line-by-line verification to ensure data accuracy. In one example, they had to handle 5,000 shipments to the USA for TAMSI operations, and the sheer volume of this “busy work” was inefficient and increased stress for the team. Also, if the team didn’t have to do these tasks, then they could focus on work that could have a bigger and better impact on the business.

Rodolfo sought to automate the tedious task of customs document verification. When he and his team receive emails with customs documents, the system automatically saves the attachments to a shared folder on SharePoint. Using AI Builder, the tool extracts key information from the documents and compares it with data from the company’s system to ensure accuracy. Any mismatches are flagged for review, and reports from the company database are automatically generated and uploaded to support the checks.

> Seeing the flow come together and watching it in action, it’s like watching a symphony.
>
> -Rodolfo explained

A user-friendly Power BI dashboard then visually displays the results, which allows the team to focus only on the flagged issues. Overall, the tool saved hundreds of hours (40 hours every week) and reduced errors by 99%. Teck has increased their productivity by over 5x with these tasks, where effectively managing the compliance process would have taken five people, but now the tasks are completed with just one person.

Not only this change frees up resources for strategic work, but it also enhances their accuracy through consistent checks that minimized human error. The solution mitigates financial and reputational risks for Teck by reducing the chances of non-compliance, while also enabling the team to monitor broker compliance levels and to foster continuous improvements in their external partnerships.



:::image type="content" source="media/teck/rodolfo.jpeg" alt-text="Profile photo of Rodolfo Rodrigues CCS." lightbox = "media/teck/rodolfo.jpeg":::

> I saw a need, and I wanted to solve it. That’s what I love about Power Platform – there’s no limit to what you can build.
>  
> -Rodolfo Rodriguez Jr., Customs Supervisor  

## Case study

In this technical case study, you learn how:

- Teck automated data extraction for customs documents using Power Platform and AI.  
- Power Automate can automatically complete time-consuming email processing, file storage, and data validation tasks.  
- Automatically and visually report the results of data extraction and comparison.  
- To establish Power Automate and Power Platform as core tools used to regularly complete time-consuming tasks.  

## The scenario

The following image visually demonstrates the architecture of this automated solution. The tool uses Power Platform’s Power Automate, including robotic process automation (RPA) desktop flows, AI Builder, and Power BI, along with other software, such as Outlook, SharePoint, and Excel.

:::image type="content" source="media/teck/architecture.png" alt-text="Screenshot of a diagram showing the architecture of an automated solution using Power Automate, AI Builder, Power BI, Outlook, SharePoint, and Excel." lightbox = "media/teck/architecture.png":::

The Power Automate flow checks the team’s shared mailbox in Outlook, and based on the sender, it then gathers the reference information (agent, date, and shipment ID). The flow then saves the files into a predetermined SharePoint folder, along with the metadata. Meanwhile, a Power Automate desktop flow is used to download reports from the team’s internal customs agent data feed and is also used to save it to SharePoint.

Once in SharePoint, AI Builder is used to extract the data from each document and from the automated system. AI Builder then leverages Excel to compare the data between the customs documents sent via email and the system-generated data. It confirms that the transactions have all the required documentation and ensures the sources don’t contain any mismatched information. If mismatched data is found, the information is flagged for further review.

The results of the processing are visually reported as a custom compliance dashboard built with Power BI. 

## Key takeaways

The case study of Teck’s data extraction and reporting demonstrates the potential of using Power Platform to set up file or data processing and comparison tools. Here are some key takeaways for professionals who are looking to implement a similar solution in their own organizations:

- **Process files**: Use Power Automate to process files sent via email and to compare the data.
- **Extract and compare data**: Use AI Builder to extract and compare the data.
- **Store documents**: Use Power Automate to automatically update and store the documents on SharePoint.
- **Monitor the results**: Use an automated Power BI dashboard to visualize and report the results of the data comparison.

Since building the data extraction tool, Teck has received the following benefits:

- **Increased productivity**: The Teck team has increased efficiency by 5x on these tasks, saving hundreds of hours (40 hours every week).
- **Reduced errors**: The solution reduced data processing errors by 99%.

## What’s next

As Rodolfo looks ahead, his focus is on empowering others. He’s eager to share his knowledge, mentoring colleagues and inspiring them to explore Power Platform’s capabilities. He believes that in a rapidly changing job market, these skills are not just valuable—they’re essential.

> If you’re not building these skills now, you’re going to be left behind. The future belongs to those who can adapt, automate, and innovate. I want to help people get there.
>
> -Rodolfo 

## Related information

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Automation adoption best practices](/power-automate/guidance/automation-coe/overview/)
- [Use an incoming email to trigger an automation](/power-automate/email-overview)
- [How to use Copilot to help build your automation](/power-automate/get-started-with-copilot)
- [Automate a business process using Power Automate training](/training/paths/automate-process-power-automate/)
- [Requirements for using SharePoint document management](/power-platform/admin/sharepoint-document-management-software-requirements)
- [Create reports in the Power BI service with Copilot](/power-bi/create-reports/copilot-create-report-service)