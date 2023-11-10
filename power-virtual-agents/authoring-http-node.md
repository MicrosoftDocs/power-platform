---
title: Perform HTTP requests
description: Calling external REST APIs using the HTTP request node.
keywords: "HTTP, API, integration"
ms.date: 10/02/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewr: gapretty
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Making HTTP requests

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

In Microsoft Copilot Studio, you can extend the bot's capabilities by calling external REST APIs using the **HTTP request** node. This can be helpful when you need to retrieve data from an external system or manipulate data on that system.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Create and edit topics](authoring-create-edit-topics.md)

## Using the HTTP request node

1. Select **Add node** (**+**), open the **Advanced** sub menu, and then select **Send HTTP request**.

   :::image type="content" source="media/authoring-http-node/add-http-node.png" alt-text="Screenshot of the send HTTP request option in the advanced menu.":::

1. In the **URL** box, enter the URL for the API endpoint you want to call.

1. Select the appropriate request **Method** from the dropdown. GET, POST, PATCH, PUT and DELETE methods are supported.

    :::image type="content" source="media/authoring-http-node/select-http-method.png" alt-text="Screenshot of completed API URL and method dropdown":::

1. Under **Headers and body** on the node, click the **Edit** button. This will open the **HTTP request properties** pane.

1. You can optionally add one or more headers to the HTTP request. Click the **Add** button to add each header's key and value.

    :::image type="content" source="media/authoring-http-node/add-headers.png" alt-text="Screenshot of headers key value pair list for HTTP node.":::

1. By default, no content is sent in the body of the HTTP request, but you [specify content to be sent on the body](#sending-content-in-the-http-request-body).

1. On the node, choose the **Response data type** from the available options. 

    You can provide an example JSON response (which you can usually find in the documentation for the API you are calling), which will generate a strongly typed Power FX variable, allowing you to use it elsewhere in your authoring canvas with intellisense support in the Power FX editor. To do this, choose **From Sample Data** and then click **Get schema from sample JSON**, pasting your sample response into the editor that is shown and choosing **Confirm**.

    :::image type="content" source="media/authoring-http-node/schema-from-sample.png" alt-text="Screenshot of the Get schema from sample JSON editor.":::    

1. Under **Save response as** choose where you want the HTTP request response to be stored, either creating a new variable or selecting an existing one.

## Sending content in the HTTP request body

1. Under **Headers and body** on the node, click the **Edit** button. This will open the **HTTP request properties** pane.

1. Under **Body**, select the appropriate content type. By default this is set to **No Content**, where no content should be present within the request body, which is most commonly used with the GET request. To add content to the body, select from one of the available options.

    :::image type="content" source="media/authoring-http-node/body-content-options.png" alt-text="Screenshot of body content options dropdown":::

      - **JSON Content**: JSON content allows you to provide a JSON object in the request body. This is often used when making POST or PUT requests. When this option is selected, you are presented with an editor where you can enter your JSON content. 
    
      You can also enter specify your JSON content using Power FX, allowing you to include dynamic values and reference variables. To do this, select the **Edit JSON** button, choose **Formula** and then enter a Power FX object (any existing JSON that has already been entered will be converted into a Power FX object for you), which will be converted into JSON when the HTTP request is made.

      :::image type="content" source="media/authoring-http-node/body-content-json.png" alt-text="Screenshot of JSON content selected for body content type.":::

      - **Raw content**: Raw content lets you insert a string of data into the request body, and this string can be of any content type you specify. Raw content is entered using a Power FX formula, such as the string content shown in the example below.

      :::image type="content" source="media/authoring-http-node/body-content-raw.png" alt-text="Screenshot of RAW content selected for body content type.":::

## Error handling and timeout

The **HTTP request** node has multiple options for handling situations where the HTTP request may fail or return an error.

By default, the feature will "Raise an error". This means that when an HTTP request returns an error or fails to execute, the bot will stop its operation and trigger the **Error** system topic, displaying an error message.

However, you can configure the error handling to not trigger the **Error** system topic and, instead, populate the HTTP status code and any error response body into variables that you specify, allowing you to interrogate these variables as needed and for the topic to continue to run. This is useful in scenarios where you want the bot to continue operation even if a particular HTTP request fails.

To configure the error handling behavior.

1. Under **Headers and body** on the node, click the **Edit** button. This will open the **HTTP request properties** pane.

1. Choose your desired behavior from the **Error handling** dropdown.

1. If you choose **Continue on error**, configure the **Status code** and **Error response body** variables, either creating new variables or selecting existing variables from the picker.

    :::image type="content" source="media/authoring-http-node/error-handling.png" alt-text="Screenshot of error handling configured to continue on error with variables specified for status code and error response body.":::

In this code sample, if the HTTP request fails, the bot will store the HTTP status code in the Topic.StatusCode variable and the response body in the Topic.ErrorResponse variable. The bot will then continue to its next steps in the topic.

The **Error response** variable type will be **Any**. You can use the [Parse Value node](authoring-variables.md#parse-value-node) to convert this into a Power Fx record.

The property pane also contains a **Request timeout** property, which accepts a value in milliseconds. The default value is 30 seconds, but you can change this value if needed.
