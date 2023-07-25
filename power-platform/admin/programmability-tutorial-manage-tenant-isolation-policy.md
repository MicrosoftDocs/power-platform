---
title: Tutorial: Manage tenant isolation policy (preview) 
description: This tutorial will demonstrate how to use the Power Platform API (preview) to manage tenant isolation policy.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 07/25/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Manage tenant isolation policy (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This tutorial demonstrates how to use the Power Platform API (preview) to manage tenant isolation policy.

In this tutorial, you'll learn how to:

1.	Authenticate with Power Platform API and related tools.
2.	Call the GET. 
3.	Review the output.
4.	Make updates using POST.
5.	Verify in the admin center.

In this example scenario, a customer is looking to enable tenant isolation for their production tenant. 

> [!IMPORTANT]
> The Power Platform API is in preview. The host name and data contracts are subject to change by the time the endpoints become generally available.  At that time, this article will be updated with the final endpoint details.

## Choose a tool that can authenticate with Power Platform API
Below are details on getting connected to the Power Platform programmatically. This tutorial includes using Azure Logic Apps as a common client for admins working in the Azure space, as well as a generic PowerShell example.  More tools and software development kits (SDKs) are coming for Power Platform API that are directly built on top of the API and have full parity.  When those tools become available this tutorial will be updated.

# [Azure](#tab/Azure)
### Authenticate with Power Platform API and related tools
To start off, in this tutorial we'll use a Logic Apps workflow.  A Power Automate flow is also acceptable, and any other orchestration engine that your company prefers to use for automation.  All of the calls to retrieve the data will be using RESTful APIs so any tooling that supports REST will work with this tutorial.

Visit the Azure portal, and then create a new logic app and give it a name:

:::image type="content" source="media/appmgmt-tutorial-1.png" alt-text="Create a logic app.":::

After that finishes provisioning, edit the workflow using the designer and set up a recurrence trigger to run on schedule of your choosing:

:::image type="content" source="media/capacity2.png" alt-text="Set up a recurrence trigger.":::
 
For the remainder of this tutorial, you'll need an environment ID and an application name to complete the subsequent steps:
- **Environment ID**: The ID of the environment to which you would install the package. This isn't the organization ID.
- **Application name**: The name of the application you're trying to install.

Next, authenticate with Microsoft Azure Active Directory (Azure AD) and retrieve a token for calling the Power Platform API.  If you haven’t completed your Azure AD setup, see [Authentication (preview)](programmability-authentication-v2.md).

In this tutorial, we're using a user credential with password to obtain a token.  An example call to Azure AD is below:

:::image type="content" source="media/appmgmt-tutorial-2.png" alt-text="Authenticate with Azure AD and retrieve a token for calling the Power Platform API.":::

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

:::image type="content" source="media/capacity5.png" alt-text="Parse the Azure AD token response into a strongly typed object.":::

# [Generic PowerShell](#tab/pshell)
### Get authenticated
Using Power Platform CLI, you can easily get authenticated with a particular Dataverse organization.  To do this, select an existing auth profile:

```powershell
#REPLACE_WITH_EXAMPLE
```
---

## Call the GET
In this section we will retrieve the (PROVIDE CUSTOMER EXAMPLE).

# [Azure](#tab/Azure)

### Call the GET
REST INSTRUCTIONS

```http
GET https://api.powerplatform.com/appmanagement/environments/{environmentId}/applicationPackages?api-version=2022-03-01-preview
```

We then parse the response into a strongly typed object using this JSON schema with the 'Parse JSON' action:
```json
{
    "properties": {
        "value": {
            "items": {
                "properties": {
                    "applicationDescription": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "applicationId": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "applicationName": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "applicationVisibility": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "catalogVisibility": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "crmMaxVersion": {},
                    "crmMinversion": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "customHandleUpgrade": {
                        "type": "boolean"
                    },
                    "endDateUtc": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "errorDetails": {},
                    "id": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "instancePackageId": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "learnMoreUrl": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "localizedDescription": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "localizedName": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "publisherId": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "publisherName": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "singlePageApplicationUrl": {},
                    "startDateUtc": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "state": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "supportedCountries": {
                        "items": {
                            "type": [
                                "string",
                                "null"
                            ]
                        },
                        "type": "array"
                    },
                    "uniqueName": {
                        "type": [
                            "string",
                            "null"
                        ]
                    },
                    "version": {
                        "type": [
                            "string",
                            "null"
                        ]
                    }
                },
                "required": [
                    "id",
                    "uniqueName",
                    "version",
                    "localizedDescription",
                    "localizedName",
                    "applicationId",
                    "applicationName",
                    "applicationDescription",
                    "singlePageApplicationUrl",
                    "publisherName",
                    "publisherId",
                    "learnMoreUrl",
                    "crmMinversion",
                    "crmMaxVersion",
                    "customHandleUpgrade",
                    "instancePackageId",
                    "state",
                    "catalogVisibility",
                    "applicationVisibility",
                    "errorDetails",
                    "startDateUtc",
                    "endDateUtc",
                    "supportedCountries"
                ],
                "type": "object"
            },
            "type": "array"
        }
    },
    "type": "object"
}
```

# [Generic PowerShell](#tab/pshell)
### Call the GET
Powershell instructions:

```powershell
#PROVIDE_CUSTOMER_EXAMPLE
```

:::image type="content" source="media/appmgmt-tutorial-cli-2.png" alt-text="List the apps for an environment.":::

For more information, see the [Auth](/powerapps/developer/data-platform/cli/reference/application-command) article for more in depth examples.

---

## Review the output
Now we will (PROVIDE CUSTOMER EXAMPLE)

# [Azure](#tab/Azure)

### Review the output API

REST instructions

```http
POST https://api.powerplatform.com/appmanagement/environments/{environmentId}/applicationPackages/{uniqueName}/install?api-version=2022-03-01-preview
```

The request body has the application entry from the earlier step:

```json
{
                "id": "ce3bab3c-ada1-40cf-b84b-49b26603a281",
                "uniqueName": "Office365Groups",
                "version": "2.9.0.3",
                "localizedDescription": "With Office 365 groups, you can collaborate with people across your company even if they aren’t Dynamics 365 users. Groups provide a single location to share conversations, meetings, documents, and more.",
                "localizedName": "Office 365 Groups",
                "applicationId": "2f17f077-4175-4d82-b82b-17cd8950b74f",
                "applicationName": "Office365Groups",
                "applicationDescription": "",
                "singlePageApplicationUrl": "",
                "publisherName": "Microsoft CRM Package",
                "publisherId": "255953fd-9ab8-4146-bfa1-859aae326ae9",
                "learnMoreUrl": "http://go.microsoft.com/fwlink/?LinkID=525719",
                "crmMinversion": "8.0",
                "crmMaxVersion": null,
                "customHandleUpgrade": false,
                "instancePackageId": null,
                "state": "None",
                "catalogVisibility": "None",
                "applicationVisibility": "All",
                "errorDetails": null,
                "startDateUtc": "2016-01-01T00:00:00Z",
                "endDateUtc": "2050-01-01T00:00:00Z",
                "supportedCountries": [
                    "AE",
                    "AL",
                    "AM",
                    "AO",
                    "VN",
                    "ZA",
                    "ZW"
                ]
            }
```

The following is an example response:

```json
{
        "id": "9a44d33b-6055-4c9b-aa4a-4c410a22e9ad",
        "packageId": "ce3bab3c-ada1-40cf-b84b-49b26603a281",
        "applicationId": "2f17f077-4175-4d82-b82b-17cd8950b74f",
        "applicationName": "Office365Groups",
        "applicationDescription": "",
        "singlePageApplicationUrl": "",
        "publisherName": "Microsoft CRM Package",
        "publisherId": "255953fd-9ab8-4146-bfa1-859aae326ae9",
        "packageUniqueName": "Office365Groups",
        "packageVersion": "2.9.0.3",
        "localizedDescription": "With Office 365 groups, you can collaborate with people across your company even if they aren’t Dynamics 365 users. Groups provide a single location to share conversations, meetings, documents, and more.",
        "localizedName": "Office 365 Groups",
        "learnMoreUrl": "http://go.microsoft.com/fwlink/?LinkID=525719",
        "termsOfServiceBlobUris": [
            "https://crmprodnam.blob.core.windows.net/preferredsolution/microsoft_tos_dbd53f75-b571-46ad-b9ce-21b5656b85dd_1?sv=2018-03-28&sr=c&sig=v5iBtDum0N6A0sqyyhIkPECibmpGOKGiSmmm3ALGIR0%3D&se=2022-03-23T19%3A35%3A59Z&sp=r"
        ],
        "applicationVisibility": "All",
        "lastOperation": {
            "state": "InstallRequested",
            "createdOn": "2022-03-22T19:35:59.7425066Z",
            "modifiedOn": null,
            "errorDetails": null,
            "statusMessage": null,
            "instancePackageId": "9a44d33b-6055-4c9b-aa4a-4c410a22e9ad",
            "operationId": "4fde996a-bf68-413c-b2bf-33f21a7e9afb"
        },
        "customHandleUpgrade": false
    }
```

Then, use the Parse JSON action to get the operationID for our subsequent steps.

# [Generic PowerShell](#tab/pshell)
### Review the output
Powershell instructions:

```powershell
#PROVIDE_CUSTOMER_EXAMPLE
```
---

## Make updates using POST
Now we will (PROVIDE CUSTOMER EXAMPLE)

# [Azure](#tab/Azure)

### Make updates using POST API
REST instructions:

> [!div class="mx-imgBorder"] 
> ![Until control.](media/appmgmt-tutorial-3.png "Until control")

Use the [Application Install Status](/rest/api/power-platform/appmanagement/applications/get-application-package-install-status) endpoint to monitor the installation. Be sure to set the **operationId** property to from the prior step. 

```http
GET https://api.powerplatform.com/appmanagement/environments/{environmentId}/operations/{operationId}?api-version=2022-03-01-preview
```

An example output is shown below:

```json
{
  "status": "NotStarted",
  "createdDateTime": "2022-03-22T20:05:58.9414573Z",
  "lastActionDateTime": null,
  "error": null,
  "statusMessage": null,
  "operationId": "523b51a8-6af4-40cd-aa7d-86bddfa6697b"
}
```
From here, we can evaluate the status and if it's one of the terminal values we can break the loop.

### Verify in the admin center
Now that the activity is done, you can verify it here in the admin center:

:::image type="content" source="media/appmgmt-tutorial-4.png" alt-text="Send an email (v2) on the status of the activity.":::

# [Generic PowerShell](#tab/pshell)
### Monitor progress
Congratulations! Now watch as your application completes installation.  In the case of a failure, you can always review the detailed logs from the Dynamics 365 apps list in your environment in the Power Platform admin center.
