---
title: EY uses Power Platform to automate customer payment processing
description: Learn how Ernst & Young (EY) uses Power Platform tools like Power Automate, AI Builder, and Dataverse to automate customer payment processing.
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: guidance
ms.date: 02/03/2025

---

# EY uses Power Platform to automate customer payment processing

In this case study, you learn how the Global Finance team at Ernst & Young (EY), a global professional services organization, used Power Automate, AI Builder, and Dataverse to automate matching and clearing incoming client payments.

## Business challenge

EY receives approximately 1.5 million payments from its 200,000 global clients every year. Of those payments, only 30% are automatically matched with an invoice and cleared by SAP. The rest require significant manual work and time&mdash;from 7 to 30 minutes to research a payment to find the accompanying invoice, and from 4 to 25 minutes to manually process and clear the payment in SAP. That's up to nearly an hour each to match and clear close to a million payments a year.

Ajith Haripaul, EY Global Controlling Transformation Leader, challenged members of the EY Global Finance team to develop a way to automate the cash application process. Stef Pieterse, EY Business Process Lead for Finance and Accounting, and Marie Sanders, Global Process Owner of Accounts Receivable, were assigned to drive the project and manage change. They had developed a similar tool in 2022, PowerPost, which used Power Platform to improve the general ledger posting process.

Given their previous experience, they felt that increasing the percentage of automatically matched and cleared payments from 30% to 80% globally was an achievable goal.

## Implementation approach

After brainstorming how to solve the problem, the project team identified five key technical requirements for the solution, all of which could be addressed using Power Platform capabilities.

| **Requirement** | **Power Platform tools** |
|--|--|
| An auto-matching algorithm that can be configured based on business rules and is flexible enough to customize to meet business needs | Power Automate flows, AI Builder models, and Office Scripts |
| A user-friendly application through which all posting scenarios can be efficiently performed | Power Apps canvas app |
| A solution that can perform at a high level from both the application or flow and SAP perspective without putting undue strain on the system | Prebuilt SAP connectors: `Call SAP (V2)` and `Read SAP table with Parsing` |
| The ability to integrate the application with SAP and other EY tools and Microsoft 365 applications | Prebuilt connectors, including Outlook and SharePoint |
| The ability to rapidly deliver and deploy the solution | Power Platform |

A small team of four developers led by Stef Pieterse spent less than four months developing the new application, known as PowerMatch. PowerMatch is a canvas app that uses Power Automate flows to match and clear incoming customer payments. It stores its data in Dataverse and uses AI Builder models to extract key information from payments and payment notifications. To simplify integration with SAP, the team used the prebuilt SAP connectors that are available with Power Platform.

The following architecture diagram illustrates the process flow.

:::image type="content" source="media/global-finance/payment-processing-architecture-1.png" alt-text="Diagram showing the PowerMatch payment clearing system process flow." lightbox="media/global-finance/payment-processing-architecture-1.png":::

The following table describes the process flow.

| App | Action | Description |
|-|-|-|
| ![Outlook icon](media/global-finance/outlook-icon.png) | Customer sends payment notification. | Start with a scheduled cloud flow to set up a recurring flow automation. |
| ![AI Builder icon](media/global-finance/ai-builder-icon.png) | Payment details are extracted from the attachment and moved to Dataverse. | Use AI Builder to create a custom entity extraction model to extract the key attributes from the payment information. |
| ![SAP icon](media/global-finance/sap-icon.png) | Bank uploads statement to SAP with payment information. | |
| ![Power Automate icon](media/global-finance/power-automate-icon.png) | Open invoices, payments, and related activity are pulled from SAP on a defined schedule. | Use scheduled cloud flow and the prebuilt SAP connector to set up a recurring flow automation. |
| ![Office icon](media/global-finance/office-icon.png) | Matching data is extracted from payment information by an AI model and moved to Dataverse. | Use attributes from the extraction model in a 14-step algorithm that tries to find the matching invoices based on predefined business rules using an Office Script. |
| ![Power Automate icon](media/global-finance/power-automate-icon.png) | Payment data matched in Dataverse is sent to SAP for clearing. | Use Power Automate and the prebuilt SAP connector. |
| ![Power Apps icon](media/global-finance/power-apps-icon.png) | Payments without a match are manually cleared in the app by the Accounts Receivable team. | Use a Power Apps canvas app to display payment data for manual review and processing. |
| ![Power Automate icon](media/global-finance/power-automate-icon.png) | Data is synced with internal systems for engagement and collections teams. | Use Power Automate and custom APIs or Power Automate RPA (robotic process automation) to connect to internal systems. |

## Streamlined payment processing

Every five minutes, Power Automate flows pull new payments from SAP and sync the open invoices, customers, and related accounting data. The flows also update PowerMatch when users work in SAP directly, so that both SAP and PowerMatch are always 100% in sync.

For payments that don't automatically match and clear in SAP, PowerMatch uses custom AI Builder entity extraction models to extract the key attributes from the payment information. The attributes are then used in a 14-step algorithm that uses an Office Script to try to find the matching invoices based on predefined business rules. When a match is made with high certainty, PowerMatch automatically matches and clears the payment and invoices in SAP.

Payments that have a lower matching certainty&mdash;for example, when multiple possible matches are found or partial payments don't match the invoices&mdash;are presented in PowerMatch along with the relevant information the app collected. Every payment that isn't automatically matched and cleared goes through the same four-step process:

1. The Accounts Receivable (AR) team confirms the matching result; for example, the app's research on the payment and the proposal for how it should be matched.

1. The team selects clearing options.

1. The team adds offsets, if applicable.

1. The team submits the document.

This process is generic and works for all posting scenarios. The AR team matches and clears lower-certainty instances with only four button clicks that take no more than two minutes per payment. Because researching the payment is eliminated from the manual process, the time savings are huge.

PowerMatch also provides the functionality to reapply previously cleared payments. The AR team only needs to provide the new invoice numbers. The back-end flows take care of the time-consuming task of reversing the existing SAP documents and reapplying the payments to the new invoices.

PowerMatch processes a high volume of payments simultaneously. The end-to-end runtime, from the start of data sync to when the payments are automatically matched and cleared in SAP, is less than 10 minutes for a batch of 300 payments.

PowerMatch is built to be simple and intuitive. The AR team efficiently manages incoming payments and performs all the required posting scenarios with just two screens. On the first screen, which serves as the landing page, the AR team gets a full view of bank statements that have posted, payments that need to be cleared, and overall metrics related to the status of payments. Selecting a payment opens the second screen, which shows the payment details, including PowerMatch's research and matching proposal. The screen also has an activity log that tracks all actions taken in the PowerMatch app, creating a full audit trail.

## Key benefits

*"To efficiently run a complex finance process requires a huge number of customization and integration options, which we were able to accomplish using Power Platform. PowerMatch's deep integration into SAP is a testimony to how effective Power Platform can be in complementing SAP and delivering business value."*

&mdash;Stef Pieterse, EY Business Process Lead for Finance and Accounting

PowerMatch increased the percentage of payments that are automatically matched and cleared from 30% to 80%, achieving the team's goal. Another 15% of payments are automatically matched with an invoice and manually cleared in the app. As a result, only 5% of payments need to be manually matched and cleared, compared to 70% before PowerMatch, saving approximately 230,000 hours globally for EY every year.

The following charts illustrate the impact of the PowerMatch app.

:::image type="content" source="media/global-finance/cash-application-impact.png" alt-text="Chart showing the impact of PowerMatch on automatic matching." lightbox="media/global-finance/cash-application-impact.png":::

:::image type="content" source="media/global-finance/hours-saved.png" alt-text="Chart showing savings of 230k hours." lightbox="media/global-finance/hours-saved.png":::

Time savings aren't the only benefit of PowerMatch, however. The reduced manual processing needed increases accuracy in payment processing, resulting in an estimated 50% reduction in rebookings.

Additionally, a new member of the finance team can become proficient in payment processing in just two days, as opposed to needing two weeks of training to learn the old process. The time savings is primarily due to PowerMatch's simple and intuitive functionality, and the fact that SAP training is no longer needed.

*"PowerMatch has revolutionized how EY handles the cash application process, resulting in faster and more accurate information. The fact that we were able to build the PowerMatch app in less than four months is amazing and really due to the low-code development platform we used."*

&mdash;Marie Sanders, Global Process Owner of Accounts Receivable

PowerMatch is successfully deployed in Canada, Italy, and the United Kingdom, and EY expects to deploy PowerMatch globally in phases through 2025.

## Next steps

EY has several projects in progress that are building on logic used in PowerMatch. At the core of each project is the deep integration of Power Platform with EY's SAP system.

Ajith explains why EY is so keen on using the Power Platform:

*"EY is a large, complex organization with many stakeholders located in many geographies. SAP offers us the degree of rigidity, scalability, governance, and security that we as EY need at a macro level. However, we also need to be flexible, agile, and deal with numerous different inputs and scenarios on an ongoing basis, and this is where Power Platform has been so effective. Complementing SAP with Microsoft Power Platform offers us the ability to be flexible, develop and build applications within a short timeframe, yet still meet our overall stringent security requirements. With continuously changing business needs, we're finding that Power Platform offers us the ability to build things quickly in a cost-effective manner. We see lots of opportunities on the horizon to leverage Power Platform."*

&mdash;Ajith Haripaul, Global Controlling Transformation Leader

## Related information

- [Automation adoption best practices](/power-automate/guidance/automation-coe/overview/)
- [Power Automate guidance documentation](/power-automate/guidance/)
- [AI Builder documentation](/ai-builder/)
