---
title: "Recover database space by deleting audit logs  | MicrosoftDocs"
description: Recover database space by deleting audit logs
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/28/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
- paulliew 
---
# Recover database space by deleting audit logs

When you enable auditing, customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), store the change history for transactions in the form of audit logs in the database. You can delete the old or unwanted logs to clean up the database space. You can choose to delete audit by table, by access logs, or by date range. 

## Find out audit storage by table
To assist you to determine which audit log by table to delete, we have created the [GetAuditStorageDetails Action](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/webapi/reference/getauditstoragedetails?view=dataverse-latest) where you can get audit storage sizes by table.

Using a tool like [Insomnia](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/webapi/insomnia?view=dataverse-latest), you can retrieve the audit storage information.

  POST: [orgUrl]/api/data/v9.1/GetAuditStorageDetails 
   Parameters: 
    { 
        RequestName = "GetAuditStorageDetails", 
    }

 Response:
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
  
> [!CAUTION]
>  When you delete an audit log, you can no longer view the audit history for the period covered by that audit log. **Deleted logs are not recoverable**.

1. Make sure that you have the System Administrator permission.
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Under the Auditing section/Free up capacity, click on **Delete audit logs**.  
  
4. Select a Delete logs option - **By table**, **Access logs, by people and systems**, or **All logs up to and including the selected date**.
  
5. Click the **Delete** button.
  
   > [!NOTE]
   >  You can only delete the oldest audit log in the system. To delete more than one audit log, continue to delete the oldest audit log until you have deleted enough logs.  
  
### See also

[Manage Dataverse auditing](manage-dataverse-auditing.md)<br />
[Dataverse developer guide: Delete audit data](/power-apps/developer/data-platform/auditing/delete-audit-data)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
