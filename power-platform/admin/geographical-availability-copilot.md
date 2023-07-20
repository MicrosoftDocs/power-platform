---
title: Enabling generative AI in non-US regions
description: Description about this article.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/20/2023
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType: 
  - admin 
---
# Enabling generative AI in non-US regions

With Copilots and generative AI features in Power Platform and Dynamics 365 you can build apps, flows, pages, chatbots, ask questions about your data, summarize information, reply to chat and email messages, generate content ideas, and get general question and answers related to the product.

These capabilities are currently available in environments in US region and support English language. This feature will allow you to try the copilot and generative features across Power Platform and Dynamics 365 CE from environments is non-US regions.

Note: The underlying infrastructure for copilots is currently available in the US region only. Accessing copilots or generative AI features from non-US region will result in data movement across regional boundaries.

You can allow copilots in your non-US environments by following these steps:

1.  Navigate to the environment settings page in Power Platform Admin Center.

2.  Click the Edit button on the "Allow data movement across regions for AI features" card.

![A screenshot of a computer Description automatically generated](media/image1.png)

3.  Read the information on the panel and select the check box to consent to the terms of use.

![A screenshot of a computer Description automatically generated](media/image2.png)

4.  Click "Enable" button.

![A screenshot of a computer Description automatically generated](media/image3.png)

After you consent, the status on the "Allow data movement across regions for AI features" card should show as "Allowed" copilots and generative AI features will be enabled in the environment.

You can disable the copilots in non-US environments by following these steps.

1.  Navigate to the environment settings page in Power Platform Admin Center.

2.  Click the Edit button on the "Allow data movement across regions for AI features" card.

![](media/image4.png)

3.  Unselect the terms of use check box.

![](media/image5.png)

4.  Click "Disable" button.

![A screenshot of a computer Description automatically generated](media/image1.png)

After you remove your consent, the status on the "Allow data movement across regions for AI features" card should show as "Not allowed" and the copilots and generative AI features will be disabled in the environment.

Please note that any data movement that happened while this feature was enabled cannot be reversed by removing your consent.

### Geographical availability of copilot & generative AI features

Currently all the Power Platform and Dynamics 365 copilots and generative features are available in US only. As the required infrastructure are available across other regions, copilots and generative AI features can be accessed from the same data boundary and an opt-in is not required.

Below table illustrates the availability of copilots in non-US environments.

| Product | Feature Name &amp; Description | Regions available without consent | Available in non-US region w/ consent | Language support |
|-------------------------|-------------------------|-------------------------|-------------------------|-------------------------|
| Dynamics 365 Marketing | **Content Ideas: Discoverability and first use UX improvements**</br>(doc link) | US | No | English |
| Dynamics 365 Marketing  | **Query Assist: Natural language to segment<br /></br>**(doc link) | US | No | English |
| Dynamics 365 Customer Insights | **Dialog with Data**</br>(doc link) | US | No | English |
| Viva Sales | **Meeting Summary Follow Up Email**<br /></br>(doc link) | US | No | English |
| Dynamics 365 Finance | **Collections CoPilot: Collections timeline summary from workspace**</br>(doc link) | US | No | English |
|Project Operations | **Project issues and risks tracking information<br /></br>**(doc link) | US | No | English |
|Project Operations | **Project status reports<br /></br>**(doc link) | US | No | English |
| Project Operations | **Project WBS generation<br /></br>**(doc link) | US | No | English |
| Dynamics 365 Customer Service | **Digital messaging with Copilot **<br /></br>(doc link) | US | Yes | English |
| Dynamics 365 Customer Service | **Auto-Draft Email**<br /></br>(doc link) | US | Yes | English |
| Dynamics 365 Customer Service | **Converse with Copilot**</br>(doc link) | US | Yes | English |
| Dynamics 365 Customer Service | **Conversation summarization**</br>(doc link) | US | Yes | English |
| Dynamics 365 Customer Service | **Case summarization<br /></br>**(doc link) | US | Yes | English |
| Nuance Mix (VA, IVR) | **Consumer Assist (Bing/GPT fallback)**</br>(doc link) | US | No | English |
|  Nuance Mix (VA, IVR) | **AppDev Assist (NL2Bot)**</br>(doc link) | US | No | English |
| Microsoft Supply Chain Center | **Contact Suppliers**<br /></br>(doc link) | US | No | English |
| Dynamics 365 Supply Chain Management | **Copilot for Procurement: Summarize and handle PO changes in Dynamics 365 SCM Hub**</br>(doc link) | US | No | English |
| Business Central| **AI-Generated Product Descriptions**<br /></br>(doc link) | US | No | English |
| Dataverse | **Dataverse Service for Copilot for M365 BizChat and BAP business applications<br /></br>**(doc link) | US | No | English |
| Dataverse | **Excel to Table for New Makers<br /></br>**(doc link) | US | No | English |
| Dataverse | **M365 Biz Chat Q&amp;A and Actions with Dataverse Connectors**</br>(doc link) | US | No | English |
| AI Builder | **Text Generation with GPT**<br /></br>(doc link) | US | Yes | English |
| Power Apps | **Maker Copilot (NL2Table)**<br /></br>(doc link) | US | No | English |
| Power Apps | **Maker Copilot: (NL2Edit)**</br>(doc link) | US | No | English |
|  Power Apps| **App Copilot for canvas Power Apps**</br>(doc link - [Add Copilot control to a canvas app](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Flearn.microsoft.com%2Fen-us%2Fpower-apps%2Fmaker%2Fcanvas-apps%2Fadd-ai-copilot&amp;data=05%7C01%7CSidhartha.Gundavarapu%40microsoft.com%7C35658fc11c624c52cba708db84c7ce1a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638249766110760978%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=M2%2BaRQy6cOK17%2BiI1%2F7JQGm0rvEUvuzZMj6q3S5nXkI%3D&amp;reserved=0)) | US | No | English |
| Power Apps | **App Copilot for model Power Apps and Dynamics 365**</br>(doc link) | US | No | English |
| Power Automate | **Power Automate Designer Copilot**</br>(doc link) | US | No | English |
| Power Pages| **C2 Copilot (PVA Chatbot)<br /></br>**(doc link) | US | No | English, Danish, Dutch, French, German, Italian, Spanish, and Japanese |
|Power Pages | **Create form in webpage<br /></br>**(doc link) | US | No | English |
|Power Pages | **Create Text Copy in webpage<br /></br>**(doc link) | US | No | English |
| Power Pages| **Create Website Page**</br>(doc link) | US | No | English |
| Power Virtual Agents | **Generative Answers**</br>(doc link) | US | No | English, Danish, Dutch, French, German, Italian, Spanish, and Japanese |
| Power Virtual Agents  | **Generative Actions**</br>(doc link) | US | No | English |
|  Power Virtual Agents | **PVA Copilot**</br>(doc link) | US | No | English |



