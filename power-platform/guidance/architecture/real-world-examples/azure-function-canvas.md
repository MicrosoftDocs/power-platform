---
title: "Using Azure functions to extend functionality in Power Apps  | Microsoft Docs"
description: Microsoft Power Platform enables you to extend the functionality of your app using Azure functions. Azure functions are an ideal choice to to move more complex functionality server-side.
author: slaouist
manager: spant
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/20/2021
ms.author: mehdis
ms.reviewer: 
search.audienceType: 
search.app: 
  
---
# Using Azure functions to extend functionality to a canvas app 

Microsoft Power Platform enables you to extend the functionality of your app using Azure functions. When dealing with complex algorithms or with many data sources, Azure functions become an ideal choice to help keep your formulas within Power Apps simple while moving the more complex functionality server-side. Azure functions require professional developers familiar with the Azure Stack but are easy to maintain and scale due to their serverless nature.

![Azure function export](./media/azurefunctionarch.png)

Azure Functions driven by RESTful HTTP requests can also be exported for additional functionality. Behind the scenes, you can create a custom connector using the OpenAPI definition automatically generated within the Azure portal, which you can then export so that it can be consumed in Power Apps or Power Automate.


![Azure function export](./media/azurefunction.png)

As an example of customers using Azure functions in their solution, check out the Metro Bank customer story https://powerapps.microsoft.com/blog/metro-bank-customer-greet-app/. In this story, you will see how Metro bank used an Azure function to build a complex algorithm to estimate wait time, and pair up the customer with the appropriate bank representative.

![Azure function export](./media/MetroBank2.png)
