---
title: Programmability and Extensibility - Tutorial - Create a daily capacity report | Microsoft Docs
description: This tutorial will demonstrate how to use the Power Platform API (preview) to create a daily capacity report.
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 03/15/2021
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Create a daily capacity report

The Power Platform API can be used to extract the various details and metadata from your Power Platform environments, both those that use Microsoft Dataverse and those that do not.  

In this tutorial, you will learn how to:

- Create a Power Automate or Logic App workflow that authenticates with the Power Platform API.
- Call the List Environments endpoint to retrieve your Power Platform environment details.
- Iterate through the capacity object to retrieve the actual consumption.
- Save this in to an HTML table for display.

As an example of this scenario, a customer is looking to get a handle on their capacity consumption so that they can better understand the allocation of their total tenant capacity by department.  This is so that the customer can perform some internal cost accounting functions and chargebacks based on how much each department is consuming of the total available capacity.  This customer is using the Environment Description to call out the department that owns each environment.  

> [!IMPORTANT]
> The Power Platform API is in preview, the hostname and data contracts are subject to change by the time the endpoints become generally available.  At that time, this article will be updated with the final endpoint details.

## Create the workflow and setup the variables
To start off, in this tutorial we will use a Logic App workflow.  A Power Automate flow is also acceptable, as well as any other orchestration engine that your company prefers to use for automation.  All of the calls to retrieve the data will be using RESTful APIs so any tooling that supports REST will work with this tutorial.

Visit the Azure portal, and create a new Logic App and give it a name:

> [!div class="mx-imgBorder"] 
> ![Create a logic app](media/capacity1.png "Create a logic app")

After that has finished provisioning, edit the workflow using the Designer and setup a Recurrence trigger to run daily:

> [!div class="mx-imgBorder"] 
> ![Setup a Recurrence trigger](media/capacity2.png "Setup a Recurrence trigger")

After this, we will need to create five variables as detailed below:

- **SPN-Id** – This is your service principal ClientID.  It will be used later to perform the authentication in a Service Principal context.  If you are using username/password context, you can skip this variable.
- **DBCapacity** – This is a Float variable for the consumed DB capacity in megabytes.
- **FileCapacity** – This is a Float variable for the consumed File capacity in megabytes.
- **LogCapacity** – This is a Float variable for the consumed Log capacity in megabytes.
- **SimplifiedEnvironmentArray-Init** – This is an Array variable that we will populate with a few environment properties.  This drastically simplifies the final HTML table report output.

> [!div class="mx-imgBorder"] 
> ![Create five variables](media/capacity3.png "Create five variables")

Next we will authenticate with Microsoft Azure Active Directory (Azure AD) and retrieve a token for calling the Power Platform API.  If you haven’t completed your Azure AD setup, visit [Create a service principal for the Power Platform API] article.

In this tutorial, we are using a KeyVault to store our Service Principal secret value.  In this way, an IT administrator can make this value securely available for your workflow.  This is then populated in the POST call to Azure AD to retrieve the token as shown:

> [!div class="mx-imgBorder"] 
> ![Authenticate and receive a token](media/capacity4.png "Authenticate and receive a token")

We then parse the Azure AD token response in to a strongly typed object using this JSON schema:

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

<img src="media/capacity5.png" widght="300px" alt="" /><br/>

## Call the List Environments endpoint
Now it is time to call the Power Platform API.  We’ll use the List Environments endpoint to retrieve all of our environments and their metadata, specifically with the $expand parameter for capacity.  This also uses the Authorization header with the Bearer Token we received in the previous section from Azure AD.  If you used username/password context you can also enter that Bearer Token at this step as well.

<img src="media/capacity6.png" widght="300px" alt="" /><br/>

We then parse the Power Platform API response in to a strongly typed object using this JSON schema:
```json
{
    "properties": {
        "value": {
            "items": {
                "properties": {
                    "description": {
                        "type": "string"
                    },
                    "id": {
                        "type": "string"
                    },
                    "location": {
                        "type": "string"
                    },
                    "name": {
                        "type": "string"
                    },
                    "properties": {
                        "properties": {
                            "addons": {
                                "type": "array"
                            },
                            "azureRegion": {
                                "type": "string"
                            },
                            "capacity": {
                                "items": {
                                    "properties": {
                                        "actualConsumption": {
                                            "type": "number"
                                        },
                                        "capacityType": {
                                            "type": "string"
                                        },
                                        "capacityUnit": {
                                            "type": "string"
                                        },
                                        "ratedConsumption": {
                                            "type": "number"
                                        },
                                        "updatedOn": {
                                            "type": "string"
                                        }
                                    },
                                    "required": [
                                        "capacityType",
                                        "actualConsumption",
                                        "ratedConsumption",
                                        "capacityUnit",
                                        "updatedOn"
                                    ],
                                    "type": "object"
                                },
                                "type": "array"
                            },
                            "clientUris": {
                                "properties": {
                                    "admin": {
                                        "type": "string"
                                    },
                                    "maker": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "cluster": {
                                "properties": {
                                    "category": {
                                        "type": "string"
                                    },
                                    "number": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "connectedGroups": {
                                "type": "array"
                            },
                            "createdBy": {
                                "properties": {
                                    "displayName": {
                                        "type": "string"
                                    },
                                    "id": {
                                        "type": "string"
                                    },
                                    "type": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "createdTime": {
                                "type": "string"
                            },
                            "creationType": {
                                "type": "string"
                            },
                            "databaseType": {
                                "type": "string"
                            },
                            "displayName": {
                                "type": "string"
                            },
                            "environmentSku": {
                                "type": "string"
                            },
                            "isDefault": {
                                "type": "boolean"
                            },
                            "linkedEnvironmentMetadata": {
                                "properties": {
                                    "backgroundOperationsState": {
                                        "type": "string"
                                    },
                                    "baseLanguage": {
                                        "type": "number"
                                    },
                                    "createdTime": {
                                        "type": "string"
                                    },
                                    "domainName": {
                                        "type": "string"
                                    },
                                    "friendlyName": {
                                        "type": "string"
                                    },
                                    "instanceApiUrl": {
                                        "type": "string"
                                    },
                                    "instanceState": {
                                        "type": "string"
                                    },
                                    "instanceUrl": {
                                        "type": "string"
                                    },
                                    "platformSku": {
                                        "type": "string"
                                    },
                                    "resourceId": {
                                        "type": "string"
                                    },
                                    "scaleGroup": {
                                        "type": "string"
                                    },
                                    "uniqueName": {
                                        "type": "string"
                                    },
                                    "version": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "protectionStatus": {
                                "properties": {
                                    "keyManagedBy": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "provisioningState": {
                                "type": "string"
                            },
                            "retentionDetails": {
                                "properties": {
                                    "backupsAvailableFromDateTime": {
                                        "type": "string"
                                    },
                                    "retentionPeriod": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "retentionPeriod": {
                                "type": "string"
                            },
                            "runtimeEndpoints": {
                                "properties": {
                                    "microsoft.ApiManagement": {
                                        "type": "string"
                                    },
                                    "microsoft.BusinessAppPlatform": {
                                        "type": "string"
                                    },
                                    "microsoft.CommonDataModel": {
                                        "type": "string"
                                    },
                                    "microsoft.Flow": {
                                        "type": "string"
                                    },
                                    "microsoft.PowerApps": {
                                        "type": "string"
                                    },
                                    "microsoft.PowerAppsAdvisor": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "states": {
                                "properties": {
                                    "management": {
                                        "properties": {
                                            "id": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "runtime": {
                                        "properties": {
                                            "id": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "object"
                            },
                            "updateCadence": {
                                "properties": {
                                    "id": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "type": "object"
                    },
                    "type": {
                        "type": "string"
                    }
                },
                "required": [
                    "id",
                    "type",
                    "location",
                    "name",
                    "properties"
                ],
                "type": "object"
            },
            "type": "array"
        }
    },
    "type": "object"
}
```
<img src="media/capacity7.png" widght="300px" alt="" /><br/>

## Iterate through the Capacity object
This is the most complex part of the tutorial.  Here we will use a loop inside of a loop to iterate each environment in the List Environment response, and each environment has an array of capacity details that we will iterate as well.  This will let us capture the necessary information for each environment row in our capacity report table.
Let’s take this step by step.  First, we will use a For Each control using the ‘value’ of the Parse-List-Response output:
<img src="media/capacity8.png" widght="300px" alt="" /><br/>

Then we parse this single environment in to a strongly typed object using this JSON schema:
```json
{
    "properties": {
        "description": {
            "type": "string"
        },
        "id": {
            "type": "string"
        },
        "location": {
            "type": "string"
        },
        "name": {
            "type": "string"
        },
        "properties": {
            "properties": {
                "addons": {
                    "type": "array"
                },
                "azureRegion": {
                    "type": "string"
                },
                "capacity": {
                    "items": {
                        "properties": {
                            "actualConsumption": {
                                "type": "number"
                            },
                            "capacityType": {
                                "type": "string"
                            },
                            "capacityUnit": {
                                "type": "string"
                            },
                            "ratedConsumption": {
                                "type": "number"
                            },
                            "updatedOn": {
                                "type": "string"
                            }
                        },
                        "required": [
                            "capacityType",
                            "actualConsumption",
                            "ratedConsumption",
                            "capacityUnit",
                            "updatedOn"
                        ],
                        "type": "object"
                    },
                    "type": "array"
                },
                "clientUris": {
                    "properties": {
                        "admin": {
                            "type": "string"
                        },
                        "maker": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                },
                "cluster": {
                    "properties": {
                        "number": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                },
                "connectedGroups": {
                    "type": "array"
                },
                "createdBy": {
                    "properties": {
                        "displayName": {
                            "type": "string"
                        },
                        "id": {
                            "type": "string"
                        },
                        "type": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                },
                "createdTime": {
                    "type": "string"
                },
                "creationType": {
                    "type": "string"
                },
                "databaseType": {
                    "type": "string"
                },
                "displayName": {
                    "type": "string"
                },
                "environmentSku": {
                    "type": "string"
                },
                "isDefault": {
                    "type": "boolean"
                },
                "linkedEnvironmentMetadata": {
                    "properties": {
                        "backgroundOperationsState": {
                            "type": "string"
                        },
                        "baseLanguage": {
                            "type": "integer"
                        },
                        "createdTime": {
                            "type": "string"
                        },
                        "domainName": {
                            "type": "string"
                        },
                        "friendlyName": {
                            "type": "string"
                        },
                        "instanceApiUrl": {
                            "type": "string"
                        },
                        "instanceState": {
                            "type": "string"
                        },
                        "instanceUrl": {
                            "type": "string"
                        },
                        "resourceId": {
                            "type": "string"
                        },
                        "scaleGroup": {
                            "type": "string"
                        },
                        "uniqueName": {
                            "type": "string"
                        },
                        "version": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                },
                "protectionStatus": {
                    "properties": {
                        "keyManagedBy": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                },
                "provisioningState": {
                    "type": "string"
                },
                "retentionDetails": {
                    "properties": {
                        "backupsAvailableFromDateTime": {
                            "type": "string"
                        },
                        "retentionPeriod": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                },
                "retentionPeriod": {
                    "type": "string"
                },
                "runtimeEndpoints": {
                    "properties": {
                        "microsoft.ApiManagement": {
                            "type": "string"
                        },
                        "microsoft.BusinessAppPlatform": {
                            "type": "string"
                        },
                        "microsoft.CommonDataModel": {
                            "type": "string"
                        },
                        "microsoft.Flow": {
                            "type": "string"
                        },
                        "microsoft.PowerApps": {
                            "type": "string"
                        },
                        "microsoft.PowerAppsAdvisor": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                },
                "states": {
                    "properties": {
                        "management": {
                            "properties": {
                                "id": {
                                    "type": "string"
                                }
                            },
                            "type": "object"
                        },
                        "runtime": {
                            "properties": {
                                "id": {
                                    "type": "string"
                                }
                            },
                            "type": "object"
                        }
                    },
                    "type": "object"
                },
                "updateCadence": {
                    "properties": {
                        "id": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "type": "object"
        },
        "type": {
            "type": "string"
        }
    },
    "type": "object"
}
```
Next, we will use another For Each control using the ‘capacity’ of the Parse-CurrentItem output. Then we parse this in to a strongly typed object using this JSON schema:
[code]
<img src="media/capacity9.png" widght="300px" alt="" /><br/>

Now we can use the Switch control on the CapacityType property from the Parse-Capacity output.  This will either be a value of ‘Database’, ‘File’, or ‘Log’.  Under each switch case, capture the related ‘actualConsumption’ property in to the related variable.  In the below case, you’ll see we are capturing Database capacity:
<img src="media/capacity10.png" widght="300px" alt="" /><br/>

As the last step in the ‘For each environment’ loop, we now can capture the environment details for this row in the report.  Using the Append to array variable control, use the below JSON schema:
```json
{
    "properties": {
        "actualConsumption": {
            "type": "number"
        },
        "capacityType": {
            "type": "string"
        },
        "capacityUnit": {
            "type": "string"
        },
        "ratedConsumption": {
            "type": "number"
        },
        "updatedOn": {
            "type": "string"
        }
    },
    "type": "object"
}
```
<img src="media/capacity11.png" widght="300px" alt="" /><br/>

## Save to an HTML table
Congratulations, you’ve now made it to the easy part!  Now that we have our fully populated and simplified environment array, we can pass this value to the Create HTML table connector:
<img src="media/capacity12.png" widght="300px" alt="" /><br/>

Running the logic app we can now see the output of the HTML table report:
<img src="media/capacity13.png" widght="300px" alt="" /><br/>

The report could be optionally emailed to stakeholders in this example for Cost Accounting purposes, or the data could be saved in to a database for further analysis and historical trending.  

