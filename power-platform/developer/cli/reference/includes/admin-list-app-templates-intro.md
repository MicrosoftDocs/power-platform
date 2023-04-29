### Examples

The following examples use the `pac admin list-app-templates` command:

- [List all supported Dataverse database templates](#list-all-supported-dataverse-database-templates)
- [List all supported Dataverse database templates of model-driven apps in Dynamics 365 for region Europe](#list-all-supported-dataverse-database-templates-of-model-driven-apps-in-dynamics-365-for-region-europe)

#### List all supported Dataverse database templates

This example lists all supported Dataverse database templates of model-driven apps in Dynamics 365.

```powershell
pac admin list-app-templates
```

An example of the output is displayed below.

```powershell
Template Name               Template Location Template Display Name Is Disabled
D365_CDSSampleApp           unitedstates      Sample App            False
D365_CustomerService        unitedstates      Customer Service      True
D365_CustomerServicePro     unitedstates      Customer Service Pro  True
D365_DeveloperEdition       unitedstates      Developer Edition     False
D365_FieldService           unitedstates      Field Service         True
D365_Guides                 unitedstates      Guides                True
D365_PowerFrameworkTemplate unitedstates      Power Framework       False
D365_ProjectOperations      unitedstates      Project Operations    True
D365_RemoteAssist           unitedstates      Remote Assist         True
D365_Sales                  unitedstates      Sales Enterprise      True
D365_SalesPro               unitedstates      Sales Pro             True
D365_SmbMarketing           unitedstates      SMB Marketing         True
```

#### List all supported Dataverse database templates of model-driven apps in Dynamics 365 for region Europe

This example lists all supported Dataverse database templates of model-driven apps in Dynamics 365 for the region Europe.

```powershell
pac admin list-app-templates --region Europe
```

An example of the output is displayed below.

```powershell
Template Name               Template Location Template Display Name Is Disabled
D365_CDSSampleApp           Europe            Sample App            False
D365_CustomerService        Europe            Customer Service      True
D365_CustomerServicePro     Europe            Customer Service Pro  True
D365_DeveloperEdition       Europe            Developer Edition     True
D365_FieldService           Europe            Field Service         True
D365_Guides                 Europe            Guides                True
D365_PowerFrameworkTemplate Europe            Power Framework       True
D365_ProjectOperations      Europe            Project Operations    True
D365_RemoteAssist           Europe            Remote Assist         True
D365_Sales                  Europe            Sales Enterprise      True
D365_SalesPro               Europe            Sales Pro             True
D365_SmbMarketing           Europe            SMB Marketing         True
```
