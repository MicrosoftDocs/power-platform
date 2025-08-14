---
title: "Step 4: Store your AppSource Package on Azure Storage and generate a URL with SAS key | Microsoft Docs" 
description: "To maintain security of your files, all app developers must store their AppSource package file in a Microsoft Azure Blob storage account, and use a Shared Access Signature (SAS) key to share the package file. Your package file is retrieved from your Azure Storage location for certification, and then for AppSource trials."
ms.date: 04/03/2023
ms.reviewer: pehecke
ms.topic: how-to
author: shmcarth
ms.author: shmcarth
ms.subservice: developer
search.audienceType: 
  - developer
ms.custom: sfi-image-nochange
---
# Step 4: Store your AppSource Package on Azure Storage and generate a URL with SAS key

Microsoft Azure Storage is a Microsoft-managed cloud service that provides storage that is highly available, secure, durable, scalable, and redundant. More information: [Introduction to Microsoft Azure Storage](/azure/storage/common/storage-introduction).

To maintain security of your files, all app developers must store their AppSource package file in a Microsoft Azure Blob storage account, and use a Shared Access Signature (SAS) key to share the package file. Your package file is retrieved from your Azure Storage location for certification, and then for AppSource trials.

## Before you upload your package

Download and install the Microsoft Azure Storage Explorer from [https://storageexplorer.com](https://storageexplorer.com).

Azure Storage Explorer lets you easily manage the contents of your storage account.

## Upload your package and generate a URL with SAS key

To upload your package to Azure Blob storage:

1. Create a free trial or pay as you go Azure account at [https://azure.microsoft.com](https://azure.microsoft.com).
1. Sign in to Azure Management portal at [https://portal.azure.com](https://portal.azure.com).
1. Create a new Storage account by clicking  > **Storage** > **Storage account - blob, file, table, queue**.
    
   :::image type="content" source="media/appsource-storageaccount-pic1.png" alt-text="Create a Storage account":::

1. On the **Create storage account** page, specify **Name**, **Resource group**, and **Location** for your storage account. Leave the rest of the columns with the default options. Click **Create**. 

   :::image type="content" source="media/appsource-storageaccount-pic2.png" alt-text="Specifying account values":::
  
1. After your storage account is created, navigate to the newly created resource group, and create a new Blob container. Under **Blob Service**, select **Containers**, and then **+ Container**.

   :::image type="content" source="media/appsource-storageaccount-pic3.png" alt-text="Create a new Blob container.":::

1. Specify a name for your container, and select the **Public access level** as **Blob**. Click **OK**.

   :::image type="content" source="media/appsource-storageaccount-pic4.png" alt-text="Set access level of the Blob.":::

1. Start Azure Storage Explorer on your computer, and connect to your Azure Storage account by signing in using the same account with which you created your Azure Storage account.

1. In Azure Storage Explorer, select the newly created container, and then select **Upload** > **Upload Files** to upload the app source package that you created in [Step 3: Create an AppSource package for your app](create-package-app.md). 

   :::image type="content" source="media/appsource-storageaccount-pic5.png" alt-text="Upload the app source package.":::

1. Browse to the AppSource package file on your computer, and select to upload it.

1. Right-click on the uploaded AppSource package file, and select **Get Shared Access Signature**.

   :::image type="content" source="media/appsource-storageaccount-pic6.png" alt-text="Selecting Shared Access Signature":::

1. On the **Shared Access Signature** page, modify the **Expiry time** value to make the Shared Access Signature (SAS) active for a month from the **Start time**. Click **Create**.

   :::image type="content" source="media/appsource-storageaccount-pic7.png" alt-text="Set an expiration time":::

1. The next page displays information about the generated SAS information. Copy the **URL** value and save it for later. You will need to specify this URL while creating an offer in Partner Center.

   :::image type="content" source="media/appsource-storageaccount-pic8.png" alt-text="Copying the SAS URL":::


> [!div class="nextstepaction"]
> [Next steps: Submit your app on Partner Center](next-steps-submit-app-cloud-partner-portal.md)
