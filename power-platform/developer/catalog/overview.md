---
title: "Catalog in Power Platform for developers"
description: "Learn about APIs to use when using catalog in Power Platform using code."
author: isaacwinoto
ms.author: isaacwinoto
ms.subservice: developer
ms.date: 11/05/2024
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - skotapalle
---
# Catalog in Power Platform for developers

The catalog in Power Platform enables developers and makers to:

- Crowd-source and find templates and components within their environment easily.
- Find and install the latest and authoritative version of a component.
- Get started with templates and components that provide immediate value.

[Learn more about the catalog in Power Platform](/power-apps/maker/data-platform/catalog-overview)

Application makers and developers can submit items to the catalog so that they can help their colleagues solve business problems. This can be done using the manager app. More information: [View, submit, and install catalog items](/power-apps/maker/data-platform/submit-acquire-from-catalog)

The articles in this section describe how developers can view, submit, and install catalog items programmatically.

## Get started

If you don't have the system administrator security role, contact your administrator to grant access to the catalog. You need the **Catalog Submitter** security role to be associated with your user account or a team that you belong to. More information: [Edit user access](../../admin/administer-catalog.md#edit-user-access)

> [!NOTE]
> Before you can work with catalog items, you must install and configure it. [Set up the catalog](../../admin/administer-catalog.md#set-up-the-catalog)

## APIs and commands you can use

Articles in this section describe three different ways to perform operations with the catalog. Use the one that best suites your skills and the requirements of your project.

|Method|Description|
|---------|---------|
|PAC CLI|Provides commands to perform many operations. You need to:<br />- [Install the PAC CLI](../cli/introduction.md).<br />- Create an authentication profile using the [pac auth create](../cli/reference/auth.md#pac-auth-create) command.|
|SDK for .NET|For .NET client applications. [Learn more about the SDK for .NET](/power-apps/developer/data-platform/org-service/overview)|
|Dataverse Web API|For any client application.<br />Examples in this section use PowerShell functions as described in [Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)<br />[Learn more about the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)|

## Next steps

> [!div class="nextstepaction"]
> [Retrieve data about the catalog](retrieve-data.md)

### See also

[Catalog in Power Platform](/power-apps/maker/data-platform/catalog-overview)   
[View, submit, and install catalog items](/power-apps/maker/data-platform/submit-acquire-from-catalog)   
[Administer the catalog](../../admin/administer-catalog.md)