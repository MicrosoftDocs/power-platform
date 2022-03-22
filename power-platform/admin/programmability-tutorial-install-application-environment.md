---
title: "Preview: Programmability and extensibility - Tutorial - Install an application to a target environment | Microsoft Docs"
description: This tutorial will demonstrate how to use the Power Platform API (preview) to install an application in an environment context.
author: laneswenka
ms.reviewer: jimholtz

ms.component: pa-admin
ms.topic: reference
ms.date: 03/21/2022
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Preview: Install an application to a target environment

Utilize Power Platform API to install Applications your tenant already has entitlements to (visible in Admin Center under Resources > D365 Applications). 

In this tutorial, you will learn how to:

1.	Create a Power Automate or Logic Apps workflow (Azure) that authenticates with Power Platform API. 
2.	Call the Get Environment Application Package API to retrieve the list of Applications you can install to a specific environment 
3.	Install the Application using Install Application Package API
4.	Poll for status of the Install Operation Get Application Package Install Status API
5.	Notify by email once install is complete

In this example scenario, a Customer is looking to install Office Groups to a specific Dataverse environment of their choosing. 

> [!IMPORTANT]
> The Power Platform API is in preview. The host name and data contracts are subject to change by the time the endpoints become generally available.  At that time, this article will be updated with the final endpoint details.

## Create a workflow that authenticates with Power Platform API
Below are details on getting connected to the Power Platform programmatically.  For now, only an Azure example is present but more will be added for other tools like Power Platform CLI.

# [Azure](#tab/Azure)
### Create the workflow and set up the variables
To start off, in this tutorial we will use a Logic Apps workflow.  A Power Automate flow is also acceptable, as well as any other orchestration engine that your company prefers to use for automation.  All of the calls to retrieve the data will be using RESTful APIs so any tooling that supports REST will work with this tutorial.

Visit the Azure portal, and then create a new logic app and give it a name:

> [!div class="mx-imgBorder"] 
> ![Create a logic app.](media/capacity1.png "Create a logic app")

After that finishes provisioning, edit the workflow using the Designer and set up a Recurrence trigger to run on schedule of your choosing:

> [!div class="mx-imgBorder"] 
> ![Set up a Recurrence trigger.](media/capacity2.png "Set up a Recurrence trigger")

For the remainder of this tutorial, you will need an environment ID and an application name to complete the subsequent steps:
- **Environment Id**: The id of the environment to which you would install the package.  Please note this is not the organization id.
- **Application name**: The name of the application you are tring to install.

Next we will authenticate with Microsoft Azure Active Directory (Azure AD) and retrieve a token for calling the Power Platform API.  If you haven’t completed your Azure AD setup, see [Authentication (preview)](programmability-authentication-v2.md).

In this tutorial, we are using a key vault to store our service principal secret value.  In this way, an IT administrator can make this value securely available for your workflow.  This is then populated in the POST call to Azure AD to retrieve the token as shown:

> [!div class="mx-imgBorder"] 
> ![Authenticate with Azure AD and retrieve a token for calling the Power Platform API.](media/capacity4.png "Authenticate with Azure AD and retrieve a token for calling the Power Platform API")

We then parse the Azure AD token response into a typed object using this JSON schema in the 'Parse JSON' action:

```json
{
    "properties": {
        "access_token": {
            "type": "string"
        },
        "expires_in": {
            "type": "integer"
        },
        "ext_expires_in": {
            "type": "integer"
        },
        "token_type": {
            "type": "string"
        }
    },
    "type": "object"
}
```

> [!div class="mx-imgBorder"] 
> ![Parse the Azure AD token response into a strongly typed object.](media/capacity5.png "Parse the Azure AD token response into a strongly typed object")

## Retrieve available packages to install
In this section we will retrieve the list of Applications you can install to a specific environment.  Be sure to have your **environment Id** available, and that this environment has a Dataverse database created.

---

# [Azure](#tab/Azure)

### Environment Application Package endpoint
Now we will make our first call to the Power Platform API.  We’ll use the [Get Environment Application Package API](rest/api/power-platform/appmanagement/applications/get-environment-application-package) to to retrieve all of the available packages we can install for the given Dataverse organization. Be sure that the identity you're using be it a Service Principal or a username/password has access to Dataverse and the appropriate security role.

```http
GET https://api.powerplatform.com/appmanagement/environments/{environmentId}/applicationPackages?api-version=2022-03-01-preview
```

We then parse the response into a strongly typed object using this JSON schema with the 'Parse JSON' action:
```json
{
    "properties": {
        "value": {
            "applicationDescription": {
                "type": "string"
            },
            "applicationId": {
                "type": "string"
            },
            "applicationName": {
                "type": "string"
            },
            "applicationVisibility": {
                "type": "string"
            },
            "catalogVisibility": {
                "type": "string"
            },
            "errorDetails": {
                "type": "string"
            },
            "learnMoreUrl": {
                "type": "string"
            },
            "localizedDescription": {
                "type": "string"
            },
            "localizedName": {
                "type": "string"
            },
            "publisherId": {
                "type": "string"
            },
            "publisherName": {
                "type": "string"
            },
            "uniqueName": {
                "type": "string"
            }
        }
    }
}
```

## Install the application
Now we can take one of the applications from the prior step and install it.  Let's say you would like to install the "“"Office 365 Groups" application. Select the value in the PackageUniqueName field, in this case, it is Office365Groups to utilize in the next step.

# [Azure](#tab/Azure)

### Install application API

We'll make use of the [Install application API]([Get Environment Application Package API](rest/api/power-platform/appmanagement/applications/get-environment-application-package) endpoint to trigger the installation. Be sure to set the **uniqueName** property to Office365Groups in this example. 

```http
POST https://api.powerplatform.com/appmanagement/environments/{environmentId}/applicationPackages/{uniqueName}/install?api-version=2022-03-01-preview
```

Then we will use the Parse JSON action to get the operationID

```json
{
    NEED SCHEMA
}
```

## Poll for operation status
Now we will monitor progress of the application install by polling every so often using the operationID from the prior step.

# [Azure](#tab/Azure)

### Use the Do Until control
By evaluating the **InstancePackageOperationStatus** for anything other than *Running* we will effectively monitor for the process to complete.  This could result in a Succeeded or a Failed outcome of which we will email a summary to ourselves as a final step.
