---
title: Tiendas CUADRA delivers always-on customer service and product discovery with Copilot Studio
description: Learn how Tiendas CUADRA improved customer service response times and enabled AI-powered product discovery by using Microsoft Copilot Studio.
#customer intent: As a Power Platform user, I want to learn how to use Microsoft Copilot Studio to automate customer service and enable AI-powered product discovery so that I can support customers more effectively without significantly increasing operational effort.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.date: 04/22/2026
ms.topic: overview
---

<!-- In line 59, is 5 the highest score? -->


# Tiendas CUADRA delivers always-on customer service and product discovery with Copilot Studio

[Tiendas CUADRA](http://www.cuadra.com.mx/) is a Mexican premium retail brand specializing in handcrafted leather boots, handbags, jackets, belts, and accessories. Founded in León, a region globally recognized for its leather industry, the company blends traditional craftsmanship with modern omnichannel retail experiences.

As digital sales increased, Tiendas CUADRA needed to respond to customers faster and beyond business hours without expanding a small customer service team. By deploying a multi-agent solution built with Microsoft Copilot Studio, the company automated a high volume of routine customer inquiries and improved response quality for its most common questions.

In this case study, you learn how Tiendas CUADRA uses Copilot Studio, Power Automate, and Dynamics 365 to deliver scalable, always‑on customer service while preserving a personalized brand experience. You also see how the solution evolved from customer support automation into intelligent product discovery.

## Business challenges

Tiendas CUADRA operates an omnichannel customer service model that includes phone, website chat, email, social media, and WhatsApp. As digital commerce grew, customer expectations changed. Customers wanted immediate answers about order tracking, product availability, promotions, and delivery timelines, regardless of the time of day.

The existing model relied entirely on customer service representatives. While this model worked at steady volumes, it struggled outside business hours and during peak retail seasons, such as Mexico's version of Black Friday ("El Buen Fin") and around Christmas. Routine requests like "track my order" overwhelmed their customer service team, limiting availability and increasing response times.

> We needed to be available 24/7. Customers want to know where their order is, if a product is in stock, or where they can buy it—at any moment. Before, all of that depended on people answering phones, emails, or chat messages.
>
> — *Diego Olvera, Director of Information Technology, Tiendas CUADRA*

## Solution

Tiendas CUADRA partnered with Microsoft partner Algoritmo to build a multi-agent solution using Microsoft Copilot Studio. The solution integrates with Dynamics 365 Customer Service to support escalation to customer service representatives. It also integrates with the company’s e-commerce platform to enable order lookup and product discovery scenarios.

Asistente CUADRA is available on the Tiendas CUADRA website and is designed to instantly handle high-volume, repeatable customer questions. It now supports scenarios such as:

- Order status and shipment tracking
- Product catalog and promotion inquiries
- Product availability by size and location
- Store location and contact lookup
- Product recommendations based on uploaded images
- Guided escalation to customer service representatives

When human follow-up is required, the solution creates a case in Dynamics 365 Customer Service and summarizes the conversation so customer service representatives receive clear context without reviewing full transcripts.

The following image shows the conversational agent on [Tiendas CUADRA’s website](https://cuadra.com.mx/).

:::image type="content" source="media/tiendas-cuadra-customer-service/website-agent.png" alt-text="Screenshot of Tiendas CUADRA website with a conversational agent chat window open showing quick reply buttons." lightbox="media/tiendas-cuadra-customer-service/website-agent.png":::

### Key benefits

The solution makes customer service smoother and more reliable. It's available at all times, responds quickly even when many people are reaching out, and handles routine questions so customer service representatives can focus on the issues that truly need their attention.

Key metrics:

- Customer satisfaction score increased from approximately 3.9 to 5.0.
- Answer quality improved from approximately 57 to 95.5 percent.
- Automated case creation generates hundreds of cases every week.

Team confidence in using AI also increased, opening the door to other use cases across the organization.

> We believe the chatbot we built on Copilot Studio enables much more efficient communication. Customers don't get frustrated, they get answers faster, and that moves us away from internal administrative work.
>
> — *Diego Olvera, Director of Information Technology, Tiendas CUADRA*

## Architecture

Asistente CUADRA uses a multi-agent architecture built on Microsoft Copilot Studio to support always-on customer interactions. The solution combines a primary conversational agent, a task-focused agent, and Power Automate for integrations and escalations.

:::image type="content" source="media/tiendas-cuadra-customer-service/architecture.png" alt-text="Diagram of Asistente CUADRA architecture showing Copilot Studio, knowledge sources, Atlas agent, sub agent, Power Automate, and integrations with Dynamics 365 Customer Service, Teams, and Shopify." lightbox="media/tiendas-cuadra-customer-service/architecture.png":::

**Copilot Studio:** Provides the conversational and orchestration layer for the solution.

Atlas is the primary agent and the main entry point for customer interactions.

- Acts as the first point of contact for customers.
- Orchestrates conversations and triggers the Product Set Agent when product recommendations are required.
- Handles inquiries related to the product catalog and store information.
- Retrieves product and order information from Shopify, the e-commerce platform used by Tiendas CUADRA.
- Composes responses using knowledge from multiple sources, including:
  - PDF documents such as offers and product catalogs.
  - Microsoft Excel files with store locations and store manager information.
  - The Tiendas CUADRA website.
- Escalates conversations to customer service by creating cases in Dynamics 365 Customer Service, including conversation summaries, and sends notifications to Microsoft Teams.

The Product Set Agent supports Atlas by generating outfit suggestions, including AI-generated images.
- Uses Power Automate and Azure OpenAI Service to generate product suggestions and AI-generated product images.
- Sends product recommendations and generated content to customers via email.

**Power Automate:** Handles system integrations by retrieving product and order data from Shopify, delivers product suggestions and image generations to customers, and creates service cases and Teams notifications.

**Dynamics 365 Customer Service:** Provides case management capabilities where customer interactions and conversation summaries are linked to existing customer records.

**Microsoft Dataverse:** Serves as the central data layer for customer data, conversation metadata, and case context.

**AI prompts:** Generate summaries for conversations, product status, and product recommendations.

> We wanted something that would integrate cleanly with our CRM and ERP. Microsoft Copilot Studio fit that vision perfectly.
>
> — *Diego Olvera, Director of Information Technology, Tiendas CUADRA*

## Key features

Customers visit Tiendas CUADRA’s website and start conversations with the agent. The agent provides preconfigured options and also allows customers to submit questions by using natural language, such as *"How should I care for this type of leather?"* or *“Do you have any current promotions on leather boots?”*

The following image shows the available preconfigured options.

:::image type="content" source="media/tiendas-cuadra-customer-service/agent-preconfigured-options.png" alt-text="Screenshot of Asistente CUADRA showing a welcome message and five interactive buttons for customer support and product discovery actions." lightbox="media/tiendas-cuadra-customer-service/agent-preconfigured-options.png":::

The following options are available:

- **Estatus de pedido:** Provides customers with concise order status summaries.
- **Ofertas:** Gives customers quick access to current offers.
- **Crear conjunto:** Allows image uploads and provides outfit suggestions.
- **Contactar asesor:** Connects customers to customer service.
- **Disponibilidad:** Enables customers to search for product availability.

### Order status summaries

When a customer selects the option to retrieve order information, the agent collects the order number together with customer identification details such as an email address or phone number. The e-commerce platform then returns order details, including order lines and the order date. Based on this information, the agent generates a concise and customer-friendly order status summary.

If the order is shipped, the response includes a shipment tracking link that directs the customer to the carrier’s tracking page. If the order can't be found, for example due to an invalid order number or mismatched customer details, the customer is offered the option to submit a request for assistance.

The following image shows an example of order status retrieval, where the customer provides order details and Asistente CUADRA returns order status and tracking information.

:::image type="content" source="media/tiendas-cuadra-customer-service/agent-order-status.png" alt-text="Screenshot of Asistente CUADRA showing order number entry and order status with DHL tracking info." lightbox="media/tiendas-cuadra-customer-service/agent-order-status.png":::

### Product discovery

For product discovery, customers can upload an image of a product they're interested in. The agent guides the customer through the process and uses the uploaded image as input to identify complementary products, such as matching apparel and accessories.

The following image shows how the agent prompts the customer to upload a product image and provide an email address to continue the product discovery flow.

:::image type="content" source="media/tiendas-cuadra-customer-service/agent-product-discovery.png" alt-text="Screenshot of Asistente CUADRA prompting to upload a product image and request an email for product discovery.":::



After the customer submits the image, the agent generates a summarized set of product recommendations and sends them to the customer by email. The email includes suggested products and a generated outfit image to help visualize the recommended combination. From the email, customers can navigate directly to the online store to view details and purchase individual items or the complete set.

The following image shows image‑based product discovery and outfit suggestions generated from uploaded product images and delivered to the customer by email.

:::image type="content" source="media/tiendas-cuadra-customer-service/product-discovery-email.png" alt-text="Screenshot of product recommendations listing boots, belt, jacket, and crossbody bag with details and action buttons." lightbox="media/tiendas-cuadra-customer-service/product-discovery-email.png":::

The agent uses image‑based product recognition to generate outfit suggestions and recommend complementary products. Generated images are for illustrative purposes and might not represent exact product combinations or final purchasable sets.

## Implementation approach

Tiendas CUADRA selected Microsoft Copilot Studio to build Asistente CUADRA, building on its existing investment in Dynamics 365 Customer Service, which serves as the primary system for managing tickets and customer interactions. With customer data stored in Microsoft Dataverse, built‑in connectors, and flexibility to use AI services on Azure, the platform provided a future‑ready foundation.

The implementation began with a proof of concept, reflecting a cautious approach to AI adoption. The proof of concept delivered the expected results, built internal confidence, and enabled further expansion of the solution.

### Phased delivery

The solution was implemented in phases, prioritizing operational stability before expanding into more advanced, AI‑driven retail scenarios.

#### Phase 1: Foundation

The initial focus was on reducing friction in customer support and delivering fast, measurable value. The team built the first agent, integrated it with Dynamics 365 Customer Service, and enabled structured escalation to human‑assisted workflows. This phase targeted high‑volume inquiries such as order status and delivery tracking, resulting in immediate workload reduction for agents.

#### Phase 2: Intelligence expansion

After stabilizing core automation, the solution evolved from task automation to value creation. Enhancements included image‑based product recognition, product discovery and recommendations, and complete outfit suggestions.

This phased approach allowed the team to validate architectural decisions early and avoid unnecessary complexity while business value was being proven.

> In our case, we started with operational automation, but the real transformation happened when we evolved the agent into a multimodal retail assistant capable of understanding product images and recommending complete outfits.
>
> — *Carlos Damian, Technology Manager, Tiendas CUADRA*

### AI prompt configuration

AI prompts are used to generate customer‑friendly responses and summaries across multiple scenarios. They support conversation summarization when a customer service case is created, ensuring that key details are passed to customer service representatives without requiring them to review full chat transcripts.

AI prompts are also used to generate concise summaries for order status and product‑related inquiries. Rather than returning raw system data to the customer, relevant information, such as customer intent, order details, or product context, is processed through AI prompts to produce clear and easy‑to‑understand responses before they're shown to the customer.

This approach helps standardize response quality, improve readability, and reduce unnecessary information in both customer responses and service handoff scenarios.

The following image shows the agent’s general instructions.

:::image type="content" source="media/tiendas-cuadra-customer-service/agent-configuration.png" alt-text="Screenshot of CUADRA agent configuration page with editable description, instructions, and knowledge panels visible." lightbox="media/tiendas-cuadra-customer-service/agent-configuration.png":::

This image shows the AI prompt used to generate a conversation summary during handoff to customer service. The team is exploring the built-in Dynamics 365 Customer Service escalation capabilities to further streamline agent handoff and case management.

:::image type="content" source="media/tiendas-cuadra-customer-service/ai-prompt-conversation-summary.png" alt-text="Screenshot of an AI prompt configuration displaying structured guidelines for summarizing conversations." lightbox="media/tiendas-cuadra-customer-service/ai-prompt-conversation-summary.png":::

This image shows the AI prompt for creating the status summary.

:::image type="content" source="media/tiendas-cuadra-customer-service/ai-prompt-order-status.png" alt-text="Screenshot of an AI prompt configuration displaying structured guidelines for generating order status summaries." lightbox="media/tiendas-cuadra-customer-service/ai-prompt-order-status.png":::

### Challenges and learnings

One key challenge during implementation was credit consumption. Early versions relied heavily on generative AI for most responses, which increased overall cost. The team addressed this challenge by refining prompts, selectively applying generative AI, and optimizing response length. As a result, responses became more concise and cost-efficient without compromising quality.

## Takeaways

This case study shows how Microsoft Copilot Studio and Dynamics 365 can be used to deliver always‑on customer service while enabling more intelligent retail experiences.

Key takeaways include:

- Start small, deliver value early, and scale gradually.
- Focus first on high‑volume, repeatable customer inquiries.
- Integrate conversational AI directly with enterprise systems.
- Use AI to reduce administrative work, not replace human expertise.
- Apply multi‑agent orchestration to support more advanced scenarios.
- Monitor credit consumption and architectural choices from the start.

> Our customer service team has only four people supporting a whole universe of customers. Workload has gone down significantly with the Copilot Studio virtual assistant.
>
> — *Carlos Damian, Technology Manager, Tiendas CUADRA*

## Looking ahead

Tiendas CUADRA plans to extend the conversational agent to more channels, including WhatsApp, while continuing to expand its multimodal capabilities. Planned enhancements include image-based product search, enabling customers to upload photos of shoes and receive product matches, styling suggestions, and leather care recommendations. The team also plans to enable customers to complete purchases directly within the conversational experience.

> We're going in phases. First information, then recommendations, then eventually closing the sale through the same channel.
>
> — *Diego Olvera, Director of Information Technology, Tiendas CUADRA*

## Related information

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Use prompts to make your agent or agent flow perform specific tasks](/microsoft-copilot-studio/nlu-prompt-node)
- [Agent flows overview](/microsoft-copilot-studio/flows-overview)
- [Dynamics 365 Customer Service documentation](/dynamics365/customer-service/)
