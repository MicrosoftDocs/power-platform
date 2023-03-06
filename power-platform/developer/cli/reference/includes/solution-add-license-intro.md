### Example

This example shows how to add licensing info to a solution.

```powershell
pac solution add-license --planDefinitionFile ../ISV_Plan_Definition.csv --planMappingFile ../ISV_Plan_Mapping.csv
```

#### Plan Definition File

Below you'll find an example of the plan definition file:

```csv
ServiceID,Display name,More info URL
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.bronzeplan,Fabrikam Bronze Plan,http://www.microsoft.com
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.silverplan,Fabrikam Silver Plan,http://www.microsoft.com
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.goldplan,Fabrikam Gold Plan,http://www.microsoft.com
```

#### Plan Mapping File

Below you'll find an example of the plan mapping file:

```csv
Service ID,Component name
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.bronzeplan,crf36_BronzeApp
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.silverplan,crf36_BronzeApp
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.silverplan,crf36_SilverApp
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.goldplan,crf36_BronzeApp
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.goldplan,crf36_SilverApp
test_isvconnect1599092224747.d365_isvconnect_prod_licensable.goldplan,crf36_GoldApp
```
