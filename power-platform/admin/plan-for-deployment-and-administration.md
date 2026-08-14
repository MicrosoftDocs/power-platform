---
title: Plan for deployment and administration
description: As an administrator, learn about the considerations when planning for deployment. 
author: EllenWehrle
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/08/2020
ms.subservice: admin
ms.author: ellenwehrle
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.custom: sfi-ga-nochange
---
# Plan for deployment and administration

Your deployment will go more smoothly with some preliminary planning.  The following table lists some of the items to consider before you start the actual deployment process.  


| Item | Description | Considerations |
| --- | --- | --- |
| Environment discovery | Create a detailed description of your organization's environment, including the number of users, groups or teams, and the number and type of business units or divisions. Identify the data that you want to bring into customer engagement apps and your overall data storage requirements. Include a business requirements analysis that describes your organization's expectations or requirements for a service level agreement (SLA). An SLA describes the deliverables, support, and communication that each party provides. Specify your security and privacy policies. | Determine whether customers and products overlap across business units enough for the units to work in the same data. Review the organization's existing security policies and any special requirements. Consider whether anticipated business growth could affect the number of users.<br><br>Allow enough time for this discovery because the findings can affect how you implement the service. |
| Single sign-on | Single sign-on enables a user to access multiple systems or services through one set of credentials. After a user signs in to the network, they don't need to enter their credentials again when they access customer engagement apps.<br><br>**Note:** For Microsoft 365 subscribers, the environment must be in the same tenant as the Microsoft 365 subscription. A user account in Active Directory can synchronize with only one tenant. | Implementing single sign-on has additional requirements. Consider how important single sign-on is to your organization.<br><br>For more information, see [Manage user account synchronization](manage-user-account-synchronization.md). |
| Integration with Microsoft 365 applications | You can enhance your company's online collaboration by integrating Microsoft 365 applications with your subscription. This integration requires a separate Microsoft 365 subscription. You'll have the best integration experience when the Microsoft 365 subscription and environment are in the same tenant.<br><br>For full Microsoft 365 feature integration with Dynamics 365 and Customer Engagement (on-premises), you need Microsoft 365 Enterprise E3 or later. Skype for Business [PSTN calling and conferencing](https://support.office.com/article/What-is-PSTN-calling-3dc773b9-95e0-4448-b2f1-887c54022429) requires Microsoft 365 Enterprise E5. Other Microsoft 365 plans aren't supported.<br><br>For licensing and pricing information, see [Dynamics 365 pricing](https://www.microsoft.com/dynamics365/pricing) and the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544). | For more information, see [Compare Microsoft 365 plans for business](https://www.microsoft.com/microsoft-365/business/compare-more-office-365-for-business-plans). |
| Administrative roles in the Microsoft Online Services environment | If you manage your subscription in the Microsoft Online Services environment, you can assign administrative roles to users. These roles define responsibilities for subscription management activities such as billing administration, password administration, and user management. | Review the available administrative roles and your environment's needs to determine which roles to use and which users to assign. The Global Administrator role has permission to manage every part of the subscription process. Assign this role to more than one person so that someone is always available to manage the subscription.<br><br>**Note:** Administrative roles cover subscription management functions. They aren't the same as the security roles that govern user access to resources in the service. |
| Security roles | Customer engagement apps use role-based security. A user's security role determines the tasks that the user can perform and the data that the user can view. | Every user must have at least one security role to access customer engagement apps.<br><br>**Note:** Security roles aren't the same as administrative roles in the Microsoft Online Services environment, which cover subscription management and related activities in the Microsoft 365 admin portal. |
| Importing data | Customer engagement apps provide a wizard for importing data from other applications and services. | If you import data from other systems, consider how you'll process the data to minimize errors. For more information, see [Import data (all record types)](import-data-all-record-types.md). |
| Product updates | Some releases include optional product updates that you can choose to enable. | Product updates can affect existing customizations. Review the documentation for each update before you enable it in a production environment. Some product updates can't be removed or easily reverted to their previous functionality.<br><br>**Tip:** If you're unsure whether to enable an update in a production environment, use a trial environment to evaluate the new functionality. For more information, see [About trial environments](trial-environments.md). |

### See also 
 [Requirements](online-requirements.md)   
 [Grant users access](grant-users-access.md)
