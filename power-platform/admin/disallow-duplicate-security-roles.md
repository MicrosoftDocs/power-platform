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

# Disallow duplicate security roles

Power Platform and Microsoft Dataverse allow you to create security roles with duplicate names. This can cause confusion when assigning security roles.



There are times or business/IT rules where this is not allowed at most. At the very least it is confusing as you would not know who to assign SecurityRole1 or SecurityRole2. A way to account for this is to not allow multiple security roles. Of course, you will need to account for solutions which try to break this rule. 

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

3. Under **Components**, expand **Entities**, and then select **Security Role**.

duplicate-security-role-customization.png

4. Select **Keys**, and then select **New**.

duplicate-security-role-customization-keys-new.png

5. Under **Available Attributes**, select **Name (name)**, add then select **Add**.

duplicate-security-role-customization-name-add.png

6. Enter a display name, and then select **Ok**.

duplicate-security-role-customization-display-name.png

7. Select **Publish All Customizations**.

duplicate-security-role-customization-publish.png








