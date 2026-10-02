---
title: Agentic Support FAQ for Power Platform Admin Center
description: Agentic Support FAQ explains how the AI-powered support agent in Power Platform admin center works, its limits, and safety. Learn how to get the best results.
ms.date: 10/01/2026
ms.topic: faq
author: johnehart
ms.author: johhar
ms.reviewer: ellenwehrle
ai-usage: ai-assisted
---

# Agentic Support frequently asked questions

Agentic Support is the AI-powered support agent in the Power Platform admin center. This article explains how it works, what it can and can't do, how Microsoft tested it, and how to get the best results from it.

**At a glance:**

- Agentic Support uses AI to help you resolve Power Platform and Dynamics 365 issues, and to create a support request when you need one.
- It bases its answers on Microsoft documentation, published known issues, and service health for your tenant, and it links to its sources.
- AI can make mistakes. Check the sources, and ask for a support request whenever you need a person.

## Frequently asked questions

### What is Agentic Support?

Agentic Support is the AI-powered support agent that opens when you select **Get support** in the Power Platform admin center. It helps admins, makers, and developers resolve issues with Power Platform and Dynamics 365 products. Anyone who can open the **Support requests** page can use it. For the list of roles, see [Get support in the Power Platform admin center](get-help-support.md).

A conversation has three stages:

| Stage | What happens |
|---|---|
| Understand your issue | Agentic Support asks a few short questions about what you see, such as the exact error and what you already tried. You can add screenshots. |
| Find a solution | It searches trusted sources and gives step-by-step guidance with links. Tell it the result of each step, and it adjusts its next suggestion. |
| Get help from a person | If you still need help, it drafts a support request from the conversation. You review, edit, and submit it. |

### What is Agentic Support intended for?

Use Agentic Support to:

- Resolve technical issues with Power Platform and Dynamics 365 products on your own.
- Understand error messages, known issues, and service incidents.
- Create a clear, complete support request when you need help from Microsoft.

Agentic Support isn't intended to:

- Replace Microsoft support engineers or perform actions that only Microsoft can do.
- Decide on billing, refunds, credits, or license exceptions, or give legal or compliance advice.
- Answer questions that aren't related to Power Platform or Dynamics 365.
- Handle a critical outage that needs a person right away. In that case, create a support request with the correct severity.

### How does Agentic Support find answers?

Agentic Support uses large language models that Microsoft hosts. The model reads your conversation and decides what to do next: ask a question, search, read a documentation page, or write an answer. It can use only these read-only sources:

- Microsoft Learn documentation
- Published known issues for Power Platform and Dynamics 365
- Service health incidents and advisories for your tenant
- Troubleshooting guidance that Microsoft wrote for common issues

Answers include numbered links to the sources that support them. Each answer is labeled **AI Generated content may be incorrect**.

### How was Agentic Support evaluated?

Before release, Microsoft tested Agentic Support extensively with manual and automated evaluations on scenarios that represent common customer issues. The evaluations checked that answers are grounded in their sources, accurate, relevant, and actionable. They also checked that questions are easy to answer and that support request details match the conversation.

Microsoft also tested Agentic Support against harmful content and against attempts to override its instructions, including instructions hidden in pasted text or error messages. After release, Microsoft continues to monitor quality, such as how often conversations resolve the issue, customer feedback, errors, and response time.

### What are the limitations of Agentic Support?

- **Answers can be wrong.** AI can write answers that sound correct but aren't, or that apply to another product or version. Always check the linked source.
- **It can't see your tenant.** It can't sign in, view your environments, apps, flows, data, or logs, or run diagnostics. It knows only what you tell it, so include the exact error text and what you already tried.
- **It relies on published information.** A very new issue might not be documented yet.
- **Screenshots only.** You can add up to five JPEG or PNG images to each message, up to 5 MB each. It can't read log files or other file types, and it can misread an image.
- **Conversations have limits.** It asks up to five rounds of questions and gives up to 20 answers. When it reaches a limit, it prepares a support request for you.
- **Replies can take time.** Replies can take up to about two minutes.

### How can I tell if an answer is wrong?

Watch for these signs:

- There's no source, or the source doesn't say what the answer says.
- The answer is about a different product or version, or it names screens and settings that you don't see.
- It repeats steps that you already said didn't work.
- It suggests broad permissions or a way around your organization's policies.
- It asks for a password, key, or token. Agentic Support should never do this, so don't share it.

If you notice one of these signs, tell Agentic Support what you see and check the source. Don't make destructive or security changes until you're sure that the step applies, and test in a non-production environment first when you can. If the issue continues, ask for a support request.

## Safety and privacy

### How does Agentic Support help keep conversations safe?

- Content filters check the conversation and the responses for harmful content.
- It treats the text in your messages, screenshots, and search results as information, not as instructions, and it doesn't reveal its internal instructions. Like all generative AI, it can be the target of attempts to bypass these protections, sometimes called jailbreaks. Microsoft has mitigations in place to reduce their success.
- It stays on Power Platform and Dynamics 365 support topics.
- It never asks for credentials. If you share a secret, it doesn't repeat it and advises you to change it. It removes personal information from its searches of public documentation.
- It warns you before steps that delete data, cost money, disrupt other users, or affect privacy.
- It only reads information. You decide which steps to take, and you submit every support request.

### What data does Agentic Support use?

- Your messages, the screenshots that you add, the product that you select, your language, and your tenant, which it uses to check service health.
- The AI service keeps the conversation for up to 24 hours so that the conversation can continue.
- If you create a support request, the conversation details and your images are added to it so that Microsoft support can help you.

Don't include personal, confidential, or proprietary information. For more information, see the [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839).

## Human support and feedback

### How do I get help from a person?

- The first answer always offers self-help.
- From the second answer, each answer ends with "If you need human support, ask me to create a support request." Just ask, in any language.
- From the fifth answer, **Create a support request** also appears as a suggested reply.
- If Agentic Support can't continue, or the conversation reaches its limit, it prepares the request with the information that you shared.
- Agentic Support drafts the title and description. You review and edit them, select your support plan and severity, and submit the request. You don't need a support plan for self-help, but you need an active support plan to create a support request. [Learn more](get-help-support.md)
- If Agentic Support is unavailable or slow, you're given an option to switch to the old form-based experience.

### How do I give feedback?

- Rate your experience in the satisfaction survey after you create a support request.
- If you switch to the old experience, tell Microsoft why in the feedback box.
- If you see harmful, offensive, or incorrect content, don't use it. Describe what you saw in your feedback or support request, without personal or confidential data.

## Related content

- [Get support in the Power Platform admin center](get-help-support.md)
- [Responsible AI FAQs for Microsoft Power Platform](/power-platform/responsible-ai-overview)
- [Microsoft Responsible AI principles](https://www.microsoft.com/ai/responsible-ai)
- [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)