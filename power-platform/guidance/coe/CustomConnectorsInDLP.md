---
title: "Custom Connectors in DLP | MicrosoftDocs"
description: "In order to use audit logs in the CoE, if you have DLP on the CoE, you will need to do the following."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Adding Custom Connector DLP

There is no way to add a custom connector to DLP in the UX today and so you have to use Power Shell. This article is intended to help with that process

## The DLP Policy

Note that the DLP Policy needs to be an Environment DLP, not a tenant DLP. If you had created a tenant policy in the past for your CoE, you will need to remake it to being an Environment policy in order to add a custom connector to it.
Note also that today a tenant admin cannot create Environment DLP policies, even if they are an admin on the environment of interest. Their position as a global admin means that they cannot create any Environment DLP policies.
So you will need both a tenant admin for the Azure steps of setup and a purely environment admin for the creation of the DLP

1. Log in as an environment admin for the CoE environment with a user that is not also a tenant admin
1. Browse to Power Platform admin center (microsoft.com)
1. Data policies > New Policy
1. If you see “Environments” here instead of “Scope”, you are logged in with the correct credential type for this work. 
<br>If you see “Scope” there instead, you still need to find a user that isn’t also a tenant admin
 ![CC DLP Image 1](media/ccdlp1.png "CC DLP Image 1")

1. Give it a name > Next
1. Add the connectors listed in the CoE Setup Pre-reqs to Business > Next
1. Add your CoE Environment to the policy > Next
1. Create policy
1. You should see the policy now with scope “Environment”
![CC DLP Image 2](media/ccdlp2.png "CC DLP Image 2")

## Add the Custom Connector to the Policy

The only way to do this today is via PowerShell.
In the event you are new to PowerShell for Power Apps, here is a link on the Power Apps cmdlets for Power Apps administration: [power-apps-cmdlets-for-administrators](https://docs.microsoft.com/power-platform/admin/powerapps-powershell#power-apps-cmdlets-for-administrators)

### Get Sample Functions

First you will need to get the sample module of functions imported.

- Browse to this sample module of functions: [Microsoft.PowerApps.Administration.PowerShell.Samples](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/admin-center/Microsoft.PowerApps.Administration.PowerShell.Samples.psm1)
- Download it to your local drive
- Boot powershell as admin and load the module. Here the file is in the same folder as PowerShell 

```powershell
Import-Module .\ Microsoft.PowerApps.Administration.PowerShell.Samples.psm1 
```

### Collect Parameter Values

The call will have a set of required parameters, this step shows you how to collect those.

**PolicyName**<br>
In PowerShell, call Get-DlpPolicy
You will get the following response and name is your target value

```powershell
value                                      
-----                                                       
{@{name=22bb22b2-22b2-2b22-b2b2-222bb22bbb22; displayName=CoE DLP; defaultConnectorsClassification=General; connectorGroups=System.Object[]; environmentType=SingleEnvironment; environment...
```

**ConnectorName**<br>
1. Browse to [flow.microsoft.com](flow.microsoft.com), note this you cannot get this string from the powerapps url <br>
1. Browse to the custom connection (for us that is solutions > Center of Excellence - Core Components > Office 365 Management API)
1. Hit edit and from the URL grab the section of the url between custom and edit. That is your value.
For our example, we will call it shared_admin-5foffice-20365-20management-20api-3cc33333333c3ccc33

![CC DLP Image 3](media/ccdlp3.png "CC DLP Image 3")
![CC DLP Image 4](media/ccdlp4.png "CC DLP Image 4")

**GroupName**<br>
This one is simple and always the same: hbi

**ConnectorID**<br>
This is just the ConnectorName with this prepended: /providers/Microsoft.PowerApps/apis/ <br>
So for us that results in: /providers/Microsoft.PowerApps/apis/shared_admin-5foffice-20365-20management-20api-3cc33333333c3ccc33

**ConnectorType**<br>
This one is simple and always the same: Microsoft.PowerApps/apis

### Call the function

With the samples above, the calls would look as shown here.<br>
At the prompt, enter Add-CustomConnectorToPolicySample and then enter the parameters as shown using samples from above

```powershell
PS C:\WINCOWS\systen32> Add-CustomConnectorToPolicySample
cmdlet Add-CustomConnectorToPolicySample at command pipeline position 1
Supply values for the following parameters:
PolicyName: 22bb22b2-22b2-2b22-b2b2-222bb22bbb22
ConnectorName: shared_admin-5foffice-20365-20management-20api-3cc33333333c3ccc33
GroupName: hbi
ConnectorId: /providers/Microsoft.PowerApps/apis/shared_admin-5foffice-20365-20management-20api-3cc33333333c3ccc33
ConnectorType: Microsoft.PowerApps/apis 

```