---
title: EY automates customer payment processing by using Power Automate, Dataverse, and AI Builder
description: Learn how Ernst & Young (EY) uses Power Platform tools to automate customer payment processing
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: guidance
ms.date: 11/15/2024

---

# EY automates customer payment processing by using Power Platform

In this case study, you learn how the Global Finance team at Ernst & Young (EY), a global organization that serves more than 200,000 clients, automated the matching and clearing of incoming client payments with the accompanying invoice.

EY receives approximately 1.5 million client payments globally each year. Of those payments, only 30% are automatically matched with the respective invoice and then automatically cleared by SAP. The large number of payments results in a significant amount of manual work to clear the remaining 70% of unmatched payments, which includes researching the payment to find the accompanying invoice and manually processing and clearing the payment in SAP.

Ajith Haripaul, EY Global Controlling Transformation Leader, challenged members of the EY Global Finance team to develop a way to automate the cash application process. Stef Pieterse, EY Business Process Lead for Finance and Accounting, and Marie Sanders, Global Process Owner of Accounts Receivable, were assigned to drive this project and process change.

Their ambition was to increase the percentage of payments automatically matched and cleared from the current 30% to 80% globally. They felt they could achieve this goal, given the experience they gained when developing PowerPost, a tool developed in 2022 that used Power Platform to improve the general ledger (GL) posting process.

## Business challenge

Before EY implemented its PowerMatch solution, after the EY Accounts Receivable (AR) team received a payment, a manual process was needed to review the payment information and perform searches in SAP to match the customer payment with the related invoices. This process took an average of seven minutes per payment, and occasionally as long as 30 minutes per payment.

After the AR team completed this process, they needed to book the payment match in SAP. Depending on how complicated it was, the booking took an average of four minutes to complete, and occasionally as long as 25 minutes per payment. With approximately 1 million payments that needed to be manually processed each year, the volume of bookings amounted to a significant number of hours for EY.

## Implementation approach

After brainstorming on how to solve the problem, the project team decided to create an application that used their knowledge of Power Platform. The project team identified five key technical requirements to develop the solution, all of which could be addressed by using Power Platform capabilities:

| **Requirements** | **Power Platform tools** |
|--|--|
| An automatching algorithm that can be configured based on business rules and that provides the right flexibility to modify and customize per business needs. | Power Automate flows, AI Builder models, and Microsoft 365 scripts |
| A user-friendly application through which all posting scenarios can be efficiently performed. | Power Apps canvas app |
| A solution that can perform at a high level from both the application/flow and SAP perspective, while not putting any pressure on the system. | Prebuilt SAP connectors: `Call SAP (V2)` and `Read SAP table with Parsing` |
| Ability to integrate the application with SAP and other EY tools and Microsoft 365 applications. | Prebuilt connectors, for example Microsoft Outlook and Microsoft SharePoint |
| Ability to rapidly deliver and deploy the solution. | Power Platform |

## Build the payment processing application

A small team of four developers led by Stef Pieterse spent less than four months developing a new application. The application, known as PowerMatch, is a canvas app that uses Power Automate flows to match and clear incoming customer payments. PowerMatch stores its data in Dataverse and uses AI Builder models to extract key information from payments and remittance advices (payment notifications).

To simplify integration of the Power Platform system with SAP, the team used the prebuilt SAP connectors that are available with Power Platform. Every five minutes, PowerMatch pulls new payments that were uploaded in SAP and syncs the open invoices, customers, and related accounting data. These Power Automate flows also update PowerMatch when users work in SAP directly so that both SAP and PowerMatch are always 100% in sync.

For payments that don't automatically match and clear in SAP, PowerMatch extracts the key attributes from the payment information by using custom AI Builder entity extraction models. The attributes are then used in a 14-step matching algorithm that uses an Office Script to try to find the matching invoices based on predefined business rules.

For matches that have a high certainty, PowerMatch automatically matches and clears the payment and invoices in SAP. Payments that have a lower matching certainty or without a match are presented in PowerMatch alongside all the relevant information collected. Examples of lower matching certainties include situations where multiple possible matches are found, a customer is found with no matching invoice, or partial payments that don't match the invoices. In PowerMatch, the AR team matches and clears the lower certainty instances with only four button clicks.

:::image type="content" source="media/global-finance/payment-processing-architecture-1.png" alt-text="Diagram showing the PowerMatch payment clearing system process flow." lightbox="media/global-finance/payment-processing-architecture-1.png":::

EY's PowerMatch technical architecture diagram shows how payments submitted are automatically matched with the corresponding invoice via Power Platform. Payment details sent by the customer are extracted from attachments and moved to Dataverse. Matching data from the bank is extracted from payment information via an AI model and moved to Dataverse. The Accounts Receivable team manually clears payments that don't have a match. Data is then synched with internal systems for engagement and collections teams.

*"To efficiently run a complex finance process requires a huge number of customization and integration options, which we were able to accomplish using Power Platform. PowerMatch's deep integration into SAP is a testimony to how effective Power Platform can be in complementing SAP and delivering business value."* 

&mdash;Stef Pieterse, EY Business Process Lead for Finance and Accounting

PowerMatch also provides the functionality to reapply previously cleared payments. The AR team only needs to provide the new invoice numbers. The back-end flows take care of the time-consuming task of reversing the existing SAP documents and reapplying the payments to the new invoices.

PowerMatch processes a high volume of payments simultaneously. The end-to-end runtime, from the start of data sync to when the payments are automatically matched and cleared in SAP, is less than 10 minutes for a batch of 300 payments.

PowerMatch is built to be simple and intuitive. With only two screens, the AR team efficiently manages incoming payments and performs all the needed posting scenarios. In the first screen, which serves as the landing page, the AR team gets a full view of bank statements posted, payments needed to be cleared, and overall metrics related to the status of payments.

After a payment is selected, the AR team is directed to the second screen which shows the payment details, including the research that PowerMatch has performed on the payment and the proposal on how it should be matched. The screen also has an activity log which tracks all actions taken in the PowerMatch app to ensure a full audit trail.

Every payment that isn't automatically matched and cleared goes through the same four-step process:

1. The AR team confirms the matching result, for example the research performed by the App on the payment and the proposal on how it should be matched.

1. The team selects the clearing options.

1. If applicable, any offsets are added.

1. The document is submitted.

This process is generic and works for all the posting scenarios. The steps the AR team need to take in PowerMatch take no more than two minutes per payment. The process represents a huge reduction in time spent compared to the process before PowerMatch since the research of the payment is eliminated from the manual process.

The following table describes the process flow: 

|App|Action|Description|
|-|-|-|
|![Outlook icon](media/global-finance/outlook-icon.png)|Customer sends payment notification.|Start with a scheduled cloud flow to set up a recurring flow automation. |
|![AI Builder icon](media/global-finance/ai-builder-icon.png)|Payment details are extracted from the attachment and moved to Dataverse. |Use AI Builder to create a custom entity extraction model to extract the key attributes from the payment information. |
|![SAP icon](media/global-finance/sap-icon.png)|Bank uploads statement to SAP with payment information. ||
|![Power Automate icon](media/global-finance/power-automate-icon.png)|Open invoices, payments, and related activity are pulled from SAP on a defined schedule. 	|Use scheduled cloud flow and the pre-built SAP connector to set up a recurring flow automation. |
|![Office icon](media/global-finance/office-icon.png)|Matching data is extracted from payment information via an AI model and moved to Dataverse. |Use attributes from the extraction model in a 14-step matching algorithm that tries to find the matching invoices based on predefined business rules by using an Office script.|
|![Power Automate icon](media/global-finance/power-automate-icon.png)|Payment data matched in Dataverse is sent to SAP for clearing.|Use Power Automate and the pre-built SAP connector.|
|![Power Apps icon](media/global-finance/power-apps-icon.png)|Payments without a match are manually cleared in app by the Accounts Receivable team.|	Use a Power Apps application to display payment data for manual review and processing. |
|![Power Automate icon](media/global-finance/power-automate-icon.png)|Data is synched with internal systems for engagement and collections teams. 	|	Use Power Automate and custom APIs or Power Automate RPA to connect to internal systems.|

## Key benefits

With the deployment of PowerMatch, EY was able to increase the percentage of payments automatically matched and cleared from 30% to 80%, achieving the planned goal. Additionally, 15% of payments are automatically matched with an invoice, but manually cleared. As a result, only 5% of payments need to be manually matched and cleared. This improvement is an impressive accomplishment given that 70% of payments needed to be manually matched and cleared before PowerMatch.

:::image type="content" source="media/global-finance/cash-application-impact.png" alt-text="Chart showing impact of PowerMatch on automatic matching." lightbox="media/global-finance/cash-application-impact.png":::

As a result of the automation and the more efficient process, PowerMatch is expected to save approximately 230,000 hours per annum globally for EY. 

:::image type="content" source="media/global-finance/hours-saved.png" alt-text="Chart showing savings of 230k hours." lightbox="media/global-finance/hours-saved.png":::

Time savings aren't the only benefit of PowerMatch. Due to the reduced manual processing needed, EY is expecting increased accuracy in payment processing, resulting in an estimated 50% reduction in rebookings.

Additionally, the training time needed for a member of the finance team to become proficient in payment processing is reduced from two weeks to two days. The time savings is primarily due to PowerMatch’s simple and intuitive functionality, and the fact that SAP training is no longer needed.

*“PowerMatch has revolutionized how EY handles the cash application process, resulting in faster and more accurate information. The fact that we were able to build the PowerMatch app in less than four months is amazing and really due to the low code development platform we used."* &mdash;Marie Sanders, Global Process Owner of Accounts Receivable

PowerMatch is successfully deployed in Canada, Italy, and the United Kingdom, and EY expects to deploy PowerMatch globally in phases up until end of 2025.

## Next steps

EY has several projects in progress that are building on logic used in PowerMatch. At the core of each project is the deep integration achieved with Power Platform and EY's SAP system.

Ajith explains why EY is so keen on using the Power Platform:

*“EY is a large complex organization with many stakeholders located in many geographies. SAP offers us the degree of rigidity, scalability, governance, and security that we as EY need at a macro level. However, we also need to be flexible, agile, and deal with numerous different inputs and scenarios on an ongoing basis and this is where Power Platform has been so effective.”* 

*“Complementing SAP with the Microsoft Power Platform offers us the ability to be flexible, develop and build applications within a short timeframe, yet still meeting our overall stringent security requirements,” says Ajith. “With continuously changing business needs we're finding that the Power Platform offers us the ability to build things quickly in a cost-effective manner. We see lots of opportunities in the horizon to leverage Power Platform. Complementing SAP with the Microsoft Power Platform offers us the ability to be flexible, develop and build applications within a short timeframe, yet still meeting our overall stringent security requirements."* 

&mdash;Ajith Haripaul: Global Controlling Transformation Leader

## Related information

- [Automation adoption best practices](/power-automate/guidance/automation-coe/overview/)
- [Power Automate guidance documentation](/power-automate/guidance/)
- [AI Builder documentation](/ai-builder/)
