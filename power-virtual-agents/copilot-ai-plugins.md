---
title: Create AI plugins for Microsoft Copilot (preview)
description: Use plugin actions to extend the capabilities of your bots.
keywords: "PVA, plugin, connector, flow, automate"
ms.date: 11/13/2023
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: gapretty
ms.custom: plugin, connector, flow, advanced-authoring
ms.collection: virtual-agent
---
# Create AI plugins for Microsoft Copilot (preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can create multiple types of AI plugins in Microsoft Copilot Studio, which let you customize how Microsoft Copilot responds to your end users:

- Prompt plugins, which use AI Builder and natural language understanding to target the specific scenarios and workflows within your business.
- Flow plugins, which use Power Automate flows to perform actions, and retrieve and work with data.
- Connector plugins, which use Power Platform connectors to access data from other systems, such as popular enterprise products like Salesforce, Zendesk, MailChimp, and Github.
- OpenAI plugins, which use connections to custom OpenAI models that you've created.

This article provides instructions for creating and sharing or publishing plugins.

After you've created plugins, you'll need to [enable them for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in -microsoft-copilot).

AI plugins can be created on the **AI plugins (preview)** page in Copilot Studio, under **Plugins (preview)** on the side navigation pane:

![Ai Plugins Page](media/copilot-ai-plugins/ai-plugins-page.png)

The remainder of this article describes how to create each type of plugin.

## Generate content or extract insights with AI Builder dynamic prompts

The experience to create prompt plugins in Copilot Studio is the same as in Power Apps. Any plugins you create in either Copilot Studio or Power Apps will be shared to the plugin registry and populated in both apps.

**To create prompt plugins:**

1. Log in to Copilot Studio and select **Plugins (preview)** on the side navigattion pane.
1. Select **Add a Power Platform component as an AI plugin**.
1. Select **Generate content or extract insights**.
1. Enter a name for your prompt, and then use plain, conversational language to describe what you want to achieve, for example *Summarize this text as a paragraph with less than 50 words*. You can also use pre-built templates to help identify what your prompt can do and how it could be worded.
1. In your prompt, add a dynamic value for each input that the end user should provide in their chat with Microsoft Copilot. You can add dynamic values as phrases or words in your prompt by selecting the phrase and then selecting **Add dynamic value**, or you can add dynamic values without selecting any text and then provide your own label. In this example, the word `text` has been turned into a dynamic variable.
3. Expand the **Test your prompt** section and enter sample data for each dynamic value. Select **Test prompt** to evaluate how well the prompt works.
4.Select **Save custom prompt**.

After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in-microsoft-copilot).

See [AI Builder prompts](/ai-builder/create-a-custom-prompt?branch=pr-en-us-766) for more information about building and using prompt plugins.

## Custom automation with Power Automate flows

Power Automate flow plugins let you define flows that can be called from AI surfaces in Power Platform. Flow plugins leverage the new **Run from Copilot** trigger and **Respond to copilot** action to define custom processes that can be invoked with natural language. 

**To create automation plugins:**

1. Log in to Copilot Studio and select **Plugins (preview)** on the side navigattion pane.
1. Select **Add a Power Platform component as an AI plugin**.
2. Select **Custom Automation**.
3. This automatically places you within the flow editor with the **Run from Copilot** trigger and **Respond to copilot** action present.
4. You can add inputs to your trigger for information you might want to collect from your users. Provide helpful text descriptions for each input so the AI can correctly identify what to extract from a user's data or inputs.
      ![Create Flow Plugin](media/copilot-ai-plugins/create-flow-plugin.png)
5. Add actions to your flow such as the **Create an approval** and **Post a message to Teams chat** to create a simple approval process 

6. Optionally add parameters to the **Respond to copilot** action for any output you want to send back to the bot.

    ![Create Flow Plugin Path](media/copilot-ai-plugins/create-flow-plugin-path.png)
7. Save your flow with a meaningful flow name and test or run it at least once. The AI uses the title and description of the flow to determine when to invoke the flow plugins. Ensure your flows run correctly, as only tested flows show up as available plugins in Microsoft Copilot.



After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in-microsoft-copilot).

## Update or get answers about external data with connectors


Connector plugins let you define connector actions that can be invoked from AI surfaces in Power Platform. Connector plugins require identification of actions that are enabled for use in Microsoft Copilot as well as the capture of information that large language models require to effectively identify and utilize the plugin, such as **Summary** and **Description** fields. 

>[!NOTE]
>Connector plugins are required to be certified before they can be used in Microsoft Copilot. 

**To create connector plugins:**

1. Log in to Copilot Studio and select **Plugins (preview)** on the side navigattion pane.
1. Select **Add a Power Platform component as an AI plugin**.
2. Select **Update or get answers about external data** to get started creating a plugin using a connector.
3. This automatically places you within the **Custom connector** editor page where you can open your connector from the available list or you can create a new one.
    ![Create Connector Editor](media/copilot-ai-plugins/create-connector-editor.png)
4. On the **AI plugin** tab, add your plugin information such as a summary and description under **Manifest details**. Select the connector actions you would like to enable one at a time, and provide helpful text descriptions to help the copilot identify and use your actions.
     ![Create Connector Details](media/copilot-ai-plugins/create-connectror-details.png)
5. Select the input parameter in the **Request** section of the action and enter a description. For actions where the input parameters don’t have descriptive names and descriptions, it's helpful to add human readable text to aid the AI in using the actions effectively. For example, a field "id" can be better described as the "Account Identifier" or b_date can be described as "Birth Day of Contact in MM/DD/YYYY format". Such descriptions help large language models interact effectively with the plugin.
     ![Create Connector Description](media/copilot-ai-plugins/create-connector-description.png)

6. Select **Create/Update Connector** and the connector's Swagger will be updated with appropriate annotations. 
7. Follow the instructions to certify the connector so that the plugin can be used in Microsoft Copilot. 

After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in-microsoft-copilot).

## Add an OpenAI plugin


OpenAI plugins provide the ability for the AI to access data that normally would not be available to them based on their available training data. This can include:
- Personal information.
- Specific product, feature, or content details that aren't available publicly.
- Access to line of business application records.
- Data accessed as part of an integration with specific websites, software, or services.

Depending on the plugin, end users of the copilot can also perform actions against the data such as make updates, additions, or delete content.

Users can create OpenAI plugins and use them to generate connectors to integrate data sources with the Power Platform and to integrate AI chat capabilities in Microsoft products like Microsoft Teams.

**To create an OpenAI plugin:**

1. Log in to Copilot Studio and select **Plugins (preview)** on the side navigattion pane.
1. Select **Add an OpenAI plugin**. 
4. Provide your manifest for the Open AI plugin. You can add a link to the location of the manifest file, or by manually selecting and uploading the manifest file from a local machine.
     ![Create Openai Manifest](media/copilot-ai-plugins/create-openai-manifest.png)
5. After providing your manifest, select **Next**.
6. Select the authentication type for your plugin from the available options. You might be asked to provide authentication details, if required for the connection. 
     ![Create Openai Auth](media/copilot-ai-plugins/create-openai-auth.png)
 
    The following suthentication types are supported:

    - **No Auth** – This is used for anonymous plugins and require no additional credentials.
    - **API Key** - This will require you to provide a parameter label and name, as well as the location for the label. Later, when creating a connection to the connector or plugin, you will be prompted to provide your API Key.
    - **OAuth 2.0** – This will require a client ID, client secret, authentication URL, token URL, refresh URL, and scope.

7. Select **Add Plugin**.
     ![Create Openai Added](media/copilot-ai-plugins/create-openai-added.png)
 
Your copilot plugin is generated along with your custom connector for the plugin. Both are available for use within your organization and can be included in solutions that you export. For more information, see [Create a custom connector from an OpenAI definition](/connectors/custom-connectors/define-openapi-definition).

After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in-microsoft-copilot).


