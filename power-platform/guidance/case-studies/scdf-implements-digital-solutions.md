---
title: Singapore Civil Defence Force implements digital solutions using Power Platform and Copilot Studio
description: Learn how SCDF transformed manual processes into automated solutions, saving millions of dollars and empowering 6,000 officers with innovative apps and AI tools.
#customer intent: As a Power Platform user, I want to learn how SCDF empowers its officers with apps and agents so that I can get inspiration for building apps and agents for my organization.
author: carcla
ms.author: v-caclaesson
ms.reviewer: v-caclaesson
ms.date: 02/23/2026
ms.topic: overview
---

# Singapore Civil Defence Force implements digital solutions using Power Platform and Copilot Studio

The Singapore Civil Defence Force (SCDF), operating under the Ministry of Home Affairs (MHA), consistently embraces innovation and technology to enhance its operational capabilities and ensure the safety of its personnel in fulfilling its mission of protecting lives and property.

Partnering closely with HTX (Home Team Science and Technology Agency), the statutory board of MHA that integrates science and engineering capabilities to innovate and deliver transformative and operationally ready solutions for public safety and security, SCDF set out to upskill its workforce by creating apps and agents, encouraging everyone to be part of the change and be a digital frontliner.

In this case study, you learn how SCDF empowers its workforce through different apps and how the NEXA agent enhances operations and continuous learning.

## Business challenges

SCDF previously relied on manual processes for tasks such as duty roster management and vehicle maintenance. These processes were time-consuming and reduced their frontliners' operational efficiency. Traditional IT projects took years to deliver solutions, which was far too long for a frontline organization that depends on timely and reliable digital solutions.

To overcome these challenges, SCDF established a Digital Factory team with HTX in 2023 to support its digitalization ambitions. This initiative streamlines processes and shortens the path from ideation to realization, enabling faster deployment of solutions that enhance day-to-day operations and frontline effectiveness.

## Solution

SCDF is embarking on a digital transformation journey to raise the skill levels of its workforce through the development of applications and conversational agents. At the forefront of this initiative is NEXA (Next Evolution Assistant), a Microsoft Copilot Studio conversational agent that streamlines information retrieval from government websites and internal knowledge repositories. Before building NEXA, SCDF deployed the following apps:

- **Automated Duty Assignment App (ADA)**: Streamlines firefighter duty rostering through automation, improving scheduling efficiency and reducing manual effort.

- **Food Indentation and Consumption App (FICA)**: Streamlines food indentation and monitors consumption rates to reduce food wastage.

- **Interactive Troubleshooting App (ITA)**: Provides interactive troubleshooting guides that enable SCDF frontliners to perform self-help diagnostics and resolve issues independently to enhance appliance operational readiness.

- **Duty Officer Rostering App (DORA)**: Streamlines regimental duty scheduling through automation, ensuring fair rotation and balanced duty allocation.

Key benefits since the start of this journey:

- Delivered solutions are valued at $20 million with development costs below $50,000.

  - ADA and ITA are actively used by 2,100 SCDF frontliners across 23 stations.

  - DORA serves approximately 700 nonfrontline SCDF staff.

  - FICA was successfully developed in three months by a one-person effort.

- NEXA is successfully deployed to all 6,000 SCDF officers.

- App development timelines are reduced from 2 to 3 years under conventional methods to just 1 to 3 months through the Digital Factory.

The following image shows the NEXA agent and the DORA app.

:::image type="content" source="media/scdf-implements-digital-solutions/nexa-agent-dora-app.png" alt-text="Screenshot of NEXA chat interface with Ask Question, Take Quiz, and Identify Object buttons, and DORA duty calendar showing upcoming duty dates." lightbox="media/scdf-implements-digital-solutions/nexa-agent-dora-app.png":::

### Next Evolution Assistant (NEXA)

NEXA is a conversational agent built using Microsoft Copilot Studio to serve as a smart, adaptive assistant for SCDF personnel. It simplifies access to guidelines, standard operating procedures, and directives. With quiz-like gamification features powered by SharePoint, Dataverse, and Power Automate, NEXA supports learning and onboarding for new personnel. These capabilities reflect SCDF's commitment to operational efficiency and continuous learning across the organization.

### Automated Duty Assignment App (ADA)

SCDF frontliners require specific competencies to operate various types of specialized equipment and fire appliances safely and effectively. The Automated Duty Assignment App manages the complex task of firefighter rostering. The app accomplishes this by intelligently assigning personnel to duties and fire appliances based on their individual skill set and driving licenses.

ADA automates the matching process by analyzing each firefighter's qualifications and aligning them with operational needs, ensuring optimal deployment of personnel. This approach enhances resource use while strengthening operational readiness and safety across fire stations.

### Food Indentation and Consumption App (FICA)

The Civil Defence Academy (CDA) is SCDF's training institution that serves over 3,000 meals daily to trainees, instructors, and staff during training programs, courses, and daily operations.

The Food Indentation and Consumption App was introduced to modernize meal management operations, replacing an outdated system. FICA enables officers to indent and access meal data on the go, allowing the kitchen to respond dynamically to demand. This approach reduces food wastage, cuts operational costs, and supports accurate long-term analysis of meal consumption patterns.

### Interactive Troubleshooting App (ITA)

The Interactive Troubleshooting App empowers officers to perform self-help vehicle maintenance through interactive, step-by-step troubleshooting guides. Officers can use the app to identify, troubleshoot, and resolve problems independently, reducing the need to contact vendors over minor issues.

By reducing resolution times, ITA ensures appliances return operationally ready faster—critical for emergency response operations. The app's self-help capability is valuable when faults occur during firefighting or rescue operations, maintaining operational readiness across SCDF's fleet.

### Duty Officer Rostering App (DORA)

The Duty Officer Rostering App addresses the challenge of regimental duty assignment for SCDF nonfrontline personnel. Under the previous system, officers had to sign in to the intranet to search for available duty slots, frequently missing booking windows when occupied with work. This approach created inequitable duty allocation.

DORA centralizes duty roster information and automates the assignment process, ensuring fair and efficient allocation. The platform also enables officers to view and swap duties, providing flexibility and greater control over their regimental commitments.

## Implementation approach

In 2021, SCDF began its journey to digitize business administrative and operational processes with the goal of building a future-ready digital workforce. They recognized that success would require upskilling their personnel and equipping officers with the right technologies and capabilities to cocreate that future.

SCDF actively engaged its officers throughout this journey, ensuring they have the information and skills needed, whether operating on the ground or performing staff work in the office. A digital mindset is now seen as essential across all roles.

To shape this future collaboratively, SCDF adopted agile development methodology and established the Digital Factory team in partnership with HTX. This initiative enabled frontline personnel to participate in the digitization effort and rapidly deliver enterprise applications. With technical expertise from HTX, the Digital Factory team successfully developed eight enterprise-level applications using Power Platform, benefiting over 3,000 users. Their journey began in 2023 with the four apps built with Power Apps—ADA, FICA, ITA, and DORA—laying the foundation and building internal expertise.

In 2024, SCDF expanded its app portfolio and began exploring AI. They experimented with Copilot Studio and developed the conversational agent NEXA to help users retrieve information from government websites.

By 2025, SCDF was integrating data into its apps and AI solutions. NEXA is now powered by knowledge from SCDF's official documents and includes advanced features such as equipment detection and interactive quiz generation. The apps also gathered sufficient data to enable meaningful visualizations across operations, logistics, human resources, and more.

SCDF's Digital Factory played a key role in helping the organization achieve the highest digital maturity ranking among agencies under the Ministry of Home Affairs in 2023. To date, their success story has attracted over 300 visitors from local and international agencies eager to learn from their experience.

## Architecture

The Copilot Studio agent NEXA uses official government websites, uploaded documents, and Dataverse as knowledge sources, with data populated from SharePoint through Power Automate.

The following image gives an overview of the technologies used.

:::image type="content" source="media/scdf-implements-digital-solutions/architecture.svg" alt-text="Diagram of SCDF digital workflow showing Copilot Studio, Power Apps, Power BI, SharePoint, Power Automate, Microsoft 365 Copilot, Dataverse, and knowledge sources integration." lightbox="media/scdf-implements-digital-solutions/architecture.svg":::

The workflow is as follows:

1. An SCDF officer starts a natural language conversation with NEXA.

1. The agent bases its information on public government websites.

1. SCDF official documents are used as a knowledge source as well.

1. The agent retrieves information from Dataverse, which a Power Automate cloud flow populates with data from SharePoint. This approach enables equipment detection and interactive quiz generation and is used depending on the identified intent.

1. SCDF officers use multiple Power Apps apps that support everyday work.

1. SCDF officers use Power BI to analyze the data captured.

1. The SCDF workforce uses Microsoft 365 Copilot as part of its suite of digital tools. Additionally, AI features are being explored and adopted across various products and services.

## Takeaways

This case study describes SCDF's approach to digital transformation, which includes the use of Copilot Studio and Power Platform among other technologies. Here are key takeaways for IT professionals who are looking to implement a similar solution in their own organizations:

- Build internal capabilities and upskill the workforce by establishing a center of excellence or digital factory team.

- Automate manual processes by using Power Apps to improve efficiency and reduce operational overhead.

- Enhance information retrieval with a Copilot Studio conversational agent for a more intuitive and user-friendly experience.

## Looking ahead

SCDF reaches new heights in working smarter by championing AI adoption, refining prompt engineering, and enhancing workplace productivity. It began as digital transformation through Power Apps and Copilot Studio. It evolved into a transformative journey that engages the workforce and strengthens digital capabilities across the organization.

In collaboration with HTX, the journey now enters Digital Frontliner 3.0—a phase that unites apps, data, and AI into "The Power of 3." This milestone represents more than technological advancement; it embodies SCDF's commitment to building organizational capabilities while inspiring and empowering every officer.

SCDF envisions a future where data, apps, and AI work seamlessly together, enabling officers to serve Singapore with greater safety, intelligence, and strength.

## Related information

- [What is Copilot Studio?](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)
  - [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/nlu-gpt-quickstart)
  - [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
  - [Copilot Studio Implementation Guide](https://aka.ms/CopilotStudioImplementationGuide)
- [What is Power Apps?](/power-apps/powerapps-overview)
  - [Get started with Power Apps](/power-apps/maker/canvas-apps/intro-maker-portal)
  - [Overview of building a model-driven app with Power Apps](/power-apps/maker/model-driven-apps/model-driven-app-overview)
  - [Overview of building canvas apps](/power-apps/maker/canvas-apps/getting-started)
  - [FAQ about using AI responsibly in Power Apps](/power-apps/maker/common/responsible-ai-overview)
- [What is Microsoft Dataverse?](/power-apps/maker/data-platform/data-platform-intro)
- [What is Power Automate?](/power-automate/flow-types)
- [What is Power BI?](/power-bi/fundamentals/power-bi-overview)
