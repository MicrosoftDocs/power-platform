---
title: Audit security roles (preview)
description: Audit security roles to better understand change made to your security.
author: sericks007
ms.subservice: admin
ms.author: pmantha
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/03/2023
search.audienceType: 
  - admin
---
# Audit security roles (preview)

You can audit security roles to better understand changes made to security roles in your Power Platform environment.

> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]
> 
> This capability is in the process of rolling out, and may not be available in your region yet.

## Configure auditing for an environment

1. Go to the Power Platform admin center and sign in using administrator credentials. 
2. Follow the instructions in [Configure auditing for an environment](manage-dataverse-auditing.md#configure-auditing-for-an-environment) to turn on auditing for your environment.

## Configure auditing for security roles

1. Go to the Power Platform admin center and sign in using administrator credentials.  
2. Select **Environments** > [select an environment] > **Settings** > **Audit and logs** > **Entity and field audit settings**.
3. In the left pane, under **Entities** select **Security Role**. 
4. On the **General** tab, under the **Data Services** area, select **Auditing**. 
5. Select the **Save** icon in the toolbar.

## Change a security role

Change a security role, as needed. More information: [Create, edit, or copy a security role using the new, modern UI](database-security.md#create-edit-or-copy-a-security-role-using-the-new-modern-ui-preview)

## View the audit report

1. Go to the Power Platform admin center and sign in using administrator credentials. 
2. Select **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Security roles (Preview)**.
3. Select **Audit report** in the command bar.
4. A report showing the changes that have been made to security roles is displayed.




