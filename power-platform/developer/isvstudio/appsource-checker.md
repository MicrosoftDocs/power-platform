---
title: Introduction to the AppSource checker | Microsoft Docs
description: Learn how to use AppSource checker
ms.date: 04/03/2023
author: angela21k
ms.author: angelakim
ms.reviewer: jdaly
ms.topic: article
ms.subservice: developer
search.audienceType: 
  - developer
contributors: 
  - JimDaly
---

# AppSource checker

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

You can use the AppSource checker to verify whether your app has met certification criteria before you submit it to [AppSource](https://appsource.microsoft.com/). The checker lets you know whether your solution file has errors that need to be corrected and verifies whether AppSource certification criteria have been met.

In ISV Studio, you can upload either a full [package](/power-platform/alm/package-deployer-tool) or solution(s). You'll be notified whether any issues need to be remediated.

**To run AppSource checker**

1. In ISV Studio, select **AppSource checker** in the leftmost pane, and then select **Validate your app**.

   :::image type="content" source="media/appsource-checker.png" alt-text="AppSource checker":::

2. Select **Browse** to upload a solution file from your local machine, and then select **Run Check**.
   
   :::image type="content" source="media/appsource-browse-solution-files.png" alt-text="Run check command":::
 
   > [!NOTE]
   > If you've previously uploaded a solution for validation, you'll see a history of submissions instead of the screenshot above.

3. After the validation check is complete, a summary of results is displayed with the number of issues found (if any). Double-click to select the solution file to see the issues in detail.

   :::image type="content" source="media/appsource-results-page.png" alt-text="Summary of AppSource checker results":::

4. If the submission has no errors, you'll see the following message:
 
   :::image type="content" source="media/appsource-no-error-page.png" alt-text="AppSource checker success message":::
   
Now you can download the validation report for your app and include it with your AppSource submission.

### See also

[Home page](home.md)<br/>
[App page](app.md)<br/>
[Tenant page](tenant.md)<br/>
[Connector certification](connector-certification.md)
