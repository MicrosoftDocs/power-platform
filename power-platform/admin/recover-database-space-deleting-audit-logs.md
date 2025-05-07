---
title: "Recover database space by deleting audit logs  | MicrosoftDocs"
description: Recover database space by deleting audit logs
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/29/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
- paulliew 
---
# Recover database space by deleting audit logs

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

When you enable auditing, customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), store the change history for transactions in the form of audit logs in the database. You can delete old or unwanted logs to restore database space. You can choose to delete audit logs by table, by access logs, or by date range. 

## Find out audit storage by table
To assist you in determining which audit logs to delete, we have created the [GetAuditStorageDetails Action](/power-apps/developer/data-platform/webapi/reference/getauditstoragedetails?view=dataverse-latest) where you can get audit storage sizes by table.

Using a tool like [Insomnia](/power-apps/developer/data-platform/webapi/insomnia?view=dataverse-latest), you can retrieve the audit storage information.

**Request**
```http
POST [Organization Uri]/api/data/v9.2/GetAuditStorageDetails
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0
```

**Response**
```http
  HTTP/1.1 200 OK
  Content-Type: application/json; odata.metadata=minimal
  OData-Version: 4.0
  
  {
      "@odata.context":  [Organization Uri]/api/data/v9.1/$metadata#Microsoft.Dynamics.CRM.GetAuditStorageDetailsResponse,
      "Result": {
          "Status": "Completed",
          "AuditStorageDetails": {
              "Count": 3,
              "Keys": [
                  "organization",
                  "deletedentity_10928",
                  "new_entity_02272411082222785"
              ],
              "Values": [
                  {
                      "SizeInBytes": 3835,
                      "ObjectTypeCode": 1019
                  },
                  {
                      "SizeInBytes": 3113,
                      "ObjectTypeCode": 10928
                  },
                  {
                      "SizeInBytes": 2012,
                      "ObjectTypeCode": 10990
                  }
              ]
          }
      }
  }
  ```

  
> [!CAUTION]
> When you delete an audit log, you can no longer view the audit history for the period covered by that audit log. **Deleted logs are not recoverable**.

1. Open the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.

1. In the navigation pane, select **Environments**.
  
1. Select an environment. 

1. In the **Auditing** section, under **Free up capacity**, select **Delete audit logs**.  
  
1. In the **Select logs to delete** pane, select one of the following options:
    - **By table**
    - **Access logs, by people and systems**
    - **All logs up to and including the selected date**.
  
6. Select **Delete**.
  
   > [!NOTE]
   >  You can only delete the oldest audit log in the system. To delete more than one audit log, continue to delete the oldest audit log until you have deleted enough logs.  
  
### See also

[Manage Dataverse auditing](manage-dataverse-auditing.md)<br />
[Dataverse developer guide: Delete audit data](/power-apps/developer/data-platform/auditing/delete-audit-data)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
