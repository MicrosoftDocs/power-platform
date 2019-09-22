---
title: "Data encryption for Dynamics 365 apps | MicrosoftDocs"
ms.custom: 
ms.date: 08/19/2019
ms.reviewer: 
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.suite: 
ms.tgt_pltfrm: 
applies_to: 
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
ms.assetid: f88f7c87-2ee2-42f3-8101-7271f6731cf9
caps.latest.revision: 28
author: Mattp123
ms.author: matp
manager: kvivek
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Enhance security by encrypting your data

[!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps uses standard [!INCLUDE[pn_MS_SQL_Server](../includes/pn-ms-sql-server.md)] cell level encryption for a set of default entity attributes that contain sensitive information, such as user names and email passwords. This feature can help organizations meet FIPS 140-2 compliance.  
  
 For [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps, all new and upgraded organizations use data encryption by default. Data encryption can’t be turned off.  
  
 [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps users who have the system administrator security role can change the encryption key at any time. 

## Change an organization encryption key  

These settings can be found in the Power Platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Encryption** > **Data encryption**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

1. Select an environment and go to **Settings** > **Encryption** > **Data encryption**.
  
2. In the **Change Encryption Key** box type the new encryption key and then select **Change**.  
  
3. Select **OK** in the confirmation message and then select **Close** to exit the Data Encryption page.  
  
4. We recommend that you copy the key to a safe place. See the next section.

## Copy your organization data encryption key  

 We strongly recommend that you make a copy of your data encryption key.  
  
1. Sign in with the System Administrator or System Customizer security role or equivalent permissions. 
  
2. Select an environment and go to **Settings** > **Encryption**.
  
3. In the **Data Encryption** dialog box, select **Show Encryption Key**, in the **Current encryption key box** select the encryption key, and copy it to the clipboard.  
  
4. Paste the encryption key into a text editor such as Notepad.  
  
   > [!WARNING]
   >  By default, [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps generates a passphrase that is a random collection of Unicode characters. Therefore, you must save the system-generated passphrase by using an application and file that supports Unicode characters. Some text editors, such as Notepad use ANSI coding by default. Before you save the passphrase using Notepad, select **Save As**, and then in the **Encoding** list, select **Unicode**.  
  
5. As a best practice, save the text file that contains the encryption key on a computer in a secure location on an encrypted hard drive.  
  
### See also  
 [SQL Server Encryption](https://technet.microsoft.com/library/bb510663.aspx)   
 [FIPS 140 Evaluation](https://technet.microsoft.com/library/cc750357.aspx)   
 [Manage Your Data](https://docs.microsoft.com/dynamics365/customer-engagement/admin/manage-your-data)   
 [Manage configuration data](https://docs.microsoft.com/dynamics365/customer-engagement/admin/manage-configuration-data)
