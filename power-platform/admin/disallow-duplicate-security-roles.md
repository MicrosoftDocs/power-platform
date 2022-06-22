---
title: "Disallow duplicate security roles | MicrosoftDocs"
description: About how to prevent the creation of duplicate security roles.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/05/2022
ms.subservice: admin
author: lezucket
ms.author: lezucket
ms.reviewer: jimholtz
contributors:
  - paulliew
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

<!-- This topic was created at the request of Lee but appears to be unneeded. I'm leaving this in the folder for now but likely can delete after a while -->

# Disallow duplicate security roles

Power Platform and Microsoft Dataverse allow you to create security roles with duplicate names. This can cause confusion when assigning security roles.

There are two parts for security roles. The first is that two can be created with the same name, the second is that a solution prefix is not added to the internal name either. When creating elements (e.g., tables, fields, relationships, etc.) in Power Platform and Dataverse most items will have a unique prefix. The prefix is defined under the publisher settings when creating solutions. A prefix is frequently connected to your company and or department. For example, Microsoft could use the prefix “ms_” or “msft_”. The point of the prefix is to help manage naming collision; this is similar to a namespace in C#. It is to help ensure a table created in one solution does not interfere with another solution’s table with the same name. For example, the first solution “NewTable” would really be abc_NewTable while the second could be “xyz_NewTable”. 

Some items have prefixes while others do not, here is a partial list but again notice that Security Role’s does not have a prefix.: 

**With prefix**
- Canvas app 
- Connector 
- Tables 
- Component 

**No prefix** 
- AI Model 
- Dataflow 
- Chatbot 
- Rules 
- Security Role 

The solution requires that you create a unique key on the Name column of the Security Role table. While this is not hard to do, you need to go through the Classic settings UI to manage it. Take the following steps to accomplish this: 

1.	In the Power Platform admin center, select an environment. Select **Settings** > **Resources** > **All legacy settings**.

    In the web app, select **Settings** (![Gear button.](media/selection-rule-gear.png "Gear button")) > **Advanced Settings**.
   
2. Go to **Settings** > **Customizations** > **Customize the System**.

3. Under **Components**, expand **Entities**, and then expand **Security Role**.

   :::image type="content" source="media/duplicate-security-role-customization.png" alt-text="Select Settings > Customizations > Customize the System.":::

4. Select **Keys**, and then select **New**.

   :::image type="content" source="media/duplicate-security-role-customization-keys-new.png" alt-text="Select Keys > New.":::

5. Under **Available Attributes**, select **Name (name)**, add then select **Add**.

   :::image type="content" source="media/duplicate-security-role-customization-name-add.png" alt-text="Select Available Attributes > Name > Add.":::

6. Enter a display name, and then select **Ok**.

   :::image type="content" source="media/duplicate-security-role-customization-display-name.png" alt-text="Enter a display name and then select OK.":::

7. Select **Publish All Customizations**.

   :::image type="content" source="media/duplicate-security-role-customization-publish.png" alt-text="Select Publish All Customizations":::

8. In the Power Platform admin center, return the **Settings** page for the selected environment.

9. Select **Users + permissions** > **Security roles**.

10. Select **New role**.

11. Enter a role name such as "TestABC", and then select **Save and Close**.

12. Select **New role**, enter "TestABC" again as the role name, and then select **Save and Close**.

An error message appears which demonstrates you can only create security roles with unique names.  

:::image type="content" source="media/duplicate-security-role-error.png" alt-text="Select Publish All Customizations":::





[!INCLUDE[footer-include](../includes/footer-banner.md)]
