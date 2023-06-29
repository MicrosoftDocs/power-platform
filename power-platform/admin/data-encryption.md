---
title: "Data encryption | MicrosoftDocs"
description: Data encryption
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
contributors:
  - paulliew
  - denisem-msft
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Enhance security by encrypting your data 

The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), use standard [!INCLUDE[pn_MS_SQL_Server](../includes/pn-ms-sql-server.md)] cell level encryption for a set of default table attributes that contain sensitive information, such as user names and email passwords. This feature can help organizations meet FIPS 140-2 compliance.  
  
All new and upgraded organizations use data encryption by default. Data encryption can’t be turned off.  
  
Users who have the system administrator security role can change the encryption key at any time. 

## Change an organization encryption key  

These settings can be found in the Microsoft Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Encryption** > **Data encryption**.

Make sure you have the System Administrator permission to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

1. Select an environment and go to **Settings** > **Encryption** > **Data encryption**.
  
2. In the **Change Encryption Key** box type the new encryption key and then select **Change**.  
  
3. Select **OK** in the confirmation message and then select **Close** to exit the Data Encryption page.  
  
4. We recommend that you copy the key to a safe place. See the next section.

## Copy your organization data encryption key  

 We strongly recommend that you make a copy of your data encryption key.  
  
1. Sign in with the System Administrator or equivalent permissions. 
  
2. Select an environment and go to **Settings** > **Encryption**.
  
3. In the **Data Encryption** dialog box, select **Show Encryption Key**, in the **Current encryption key box** select the encryption key, and copy it to the clipboard.  
  
4. Paste the encryption key into a text editor such as Notepad.  
  
   > [!WARNING]
   >  By default, customer engagement apps generate a passphrase that is a random collection of Unicode characters. Therefore, you must save the system-generated passphrase by using an application and file that supports Unicode characters. Some text editors, such as Notepad use ANSI coding by default. Before you save the passphrase using Notepad, select **Save As**, and then in the **Encoding** list, select **Unicode**.  
  
5. As a best practice, save the text file that contains the encryption key on a computer in a secure location on an encrypted hard drive.  
  
### See also  
 [SQL Server Encryption](/sql/relational-databases/security/encryption/sql-server-encryption)   
 [FIPS 140 Evaluation](/windows/security/threat-protection/fips-140-validation)   
 [Manage Your Data](add-remove-sample-data.md)   
 [Manage configuration data](manage-configuration-data.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
