---
title: "Important changes (deprecations) coming in Dynamics 365 Customer Engagement"
ms.date: "09/10/2019"
ms.topic: "article"
applies_to: 
 - "Dynamics 365 (online)"
 - "Dynamics 365 9.x"
ms.assetid: 994cc854-17f6-45d6-bc20-fcf1a3f2d6d6
searchScope:
  - "Dynamics 365"
  - "Customer Engagement"
ms.custom:
 - dyn365-hub
ms.service: dynamics-365-crossapp
author: shellyhaverkamp
ms.author: shellyha
manager: annbe
---

Important changes (deprecations) coming in Dynamics 365 Customer Engagement
============================================================

The announcements and deprecations described in this topic apply to [!INCLUDE [pn-ms-dyn-365](../../../includes/pn-ms-dyn-365.md)]
Customer Engagement as of version 9. This article was first published on June 27, 2017.

Administrators and IT
professionals should use this information to prepare for future releases of
[!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)]. Customer Engagement refers to the applications that make up the
CRM portion of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)], which includes the Sales, Customer Service, [!INCLUDE [pn-field-service.md](../../../includes/pn-field-service.md)], and [!INCLUDE [pn-project-service-auto.md](../../../includes/pn-project-service-auto.md)] applications.

“Deprecated” means we intend to remove the feature or capability from a future
major release of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)]. The feature or capability will continue to work
and is fully supported until it is officially removed. This deprecation
notification can span a few years. After removal, the feature or capability will
no longer work. We are notifying you now so you have sufficient time to plan and
update your code before the feature or capability is removed.

For information on *past* deprecations, see:
- [Important changes coming in future releases of Dynamics 365](https://docs.microsoft.com/previous-versions/dynamicscrm-2016/administering-dynamics-365/dn265924(v=crm.8))

- [Important changes coming in future releases of Dynamics 365 (Developers)](https://docs.microsoft.com/previous-versions/dynamicscrm-2016/developers-guide/dn281891(v=crm.8))

Legacy web client is deprecated
-------------------------------
As of September 2019, Microsoft Dynamics 365 legacy web client is deprecated for online customers. Customers must transition to Unified Interface before October 1, 2020. Microsoft will continue to provide support, security and other critical updates to the Dynamics 365 legacy web client until October 1, 2020 but won't release any additional functionality beyond what has already been announced.
  
On October 1, 2020, the Dynamics 365 legacy web client will no longer be available. Organizations should make the transition to the Unified Interface as soon as possible to take advantage of Microsoft’s ongoing investments in reliability, performance, and functionality. 
 
In the coming months, for those that have not already made the transition, we will be sending reminders and scheduling updates to transition customers to Unified Interface prior to October 1, 2020. 
For further information and steps to make a smooth transition, view our helpful resources and community site: 

-   [Unified Interface Community
    Group](https://community.dynamics.com/365/unified-interface/) including a
    Blog and Forum

-   [Getting Started Unified Interface
    Playbook](https://docs.microsoft.com/powerapps/maker/model-driven-apps/unified-interface-playbook)

-   [User Experience and Unified Interface transition
    whitepaper](https://docs.microsoft.com/powerapps/maker/model-driven-apps/approaching-unified-interface)

-   [Quick Start Guide – add Unified Interface App to existing
    environment](https://docs.microsoft.com/powerapps/maker/model-driven-apps/transition-web-app-existing)

-   [Quick Start Guide – set an environment to Unified Interface as
    default](https://docs.microsoft.com/powerapps/maker/model-driven-apps/transition-web-app)

Task flows are deprecated
-------------------------
[Task flows](/dynamics365/customer-engagement/customize/create-mobile-task-flow) are used to create a step-by-step data entry form for common tasks, such as after-meeting follow-ups. 

Task flows are deprecated and will be removed by October 1, 2020. They will be
replaced by the immersive experience for business process flows that is planned
for release. More information: [Business process flow immersive
experiences](https://docs.microsoft.com/power-platform-release-plan/2019wave2/microsoft-flow/business-process-immersive-experiences)

Process Dialogs are deprecated
------------------------------

You can use a process dialog to create an interactive step-by-step data entry
form that requires user input to start and run to completion. When you start the
dialog process, a wizard-like interface is presented; users make selections or
enter data as they progress through each page of the wizard.

Process dialogs are deprecated and will be removed by October 1, 2020. Suggested
replacement options include Business Process Flows or Canvas Apps. More information: [Replace dialogs with business process flows or canvas
apps](https://docs.microsoft.com/flow/replace-dialogs)


Voice of the Customer is deprecated 
-----------------------------------
The Voice of the Customer solution is used to create and send surveys for collecting feedback.  

As of July 1, 2019, the Voice of the Customer solution is deprecated. Users can create and distribute new surveys and collect responses from live surveys till July 1, 2020. Please read this [blog post](https://go.microsoft.com/fwlink/p/?linkid=2097704) for more details. 

A new solution, Microsoft Forms Pro, is generally available to capture customer feedback using surveys. Customers can learn more about Forms Pro [here](https://formspro.microsoft.com). 

Dynamics 365 for Blackberry is deprecated
------------------------------------------
As of December 3, 2018, Microsoft Dynamics 365 for Blackberry App is deprecated and will be removed from the iOS App Store on October 31, 2019. The mobile app is currently available on the iOS App Store and is designed for Dynamics 365 customers that utilize Blackberry Mobile Application Management. See more details about the Dynamics 365 for Blackberry app here: [Secure your mobile data with Microsoft Dynamics 365 for Good](/dynamics365/customer-engagement/mobile-app/v8/go-mobile/admin-troubleshoot/secure-mobile-data-dynamics-365-good). After October 31, 2019, Microsoft Intune will be the only supported mobile application management solution for the [Dynamics 365 for phones application](/dynamics365/customer-engagement/mobile-app/install-dynamics-365-for-phones-and-tablets). 

Microsoft will continue to provide security and other critical updates to the Dynamics 365 for Blackberry App until October 31, 2019, but will not release any additional features or functionalities within the app. After October 31, 2019, the Dynamics 365 for Blackberry App will be removed from the App Store, and support will end.

**What should you do?**

If you are currently using the Dynamics 365 for Blackberry App together with Mobile Application Management for Blackberry, plan to migrate to Dynamics 365 for phones by October 31, 2019. We encourage you to migrate as soon as possible to take advantage of Microsoft’s ongoing investments in the reliability, performance, and functionality of the Dynamics 365 mobile app.

Dynamics 365 for Outlook (Outlook add-in) is deprecated
-------------------------------------------------------

> [!IMPORTANT]
> As of 1/29/2018, based on overwhelming customer feedback and our desire to continue supporting our customers, we have **decided not to deprecate [!INCLUDE [pn-crm-2016-outlook-shortest](../../../includes/pn-crm-2016-outlook-shortest.md)]** ([!INCLUDE [pn-outlook](../../../includes/pn-outlook.md)] add-in). Please read [this blog post](https://blogs.msdn.microsoft.com/crm/2018/01/29/continued-support-for-outlook-add-in-dynamics-365-for-outlook/) for more details.

[!INCLUDE [pn-crm-app-for-outlook-short](../../../includes/pn-crm-app-for-outlook-short.md)], introduced with Dynamics CRM 2016 (version 8.0),
is our most up-to-date offering for pairing [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)] with [!INCLUDE [pn-ms-outlook-short](../../../includes/pn-ms-outlook-short.md)].
With [!INCLUDE [pn-crm-app-for-outlook-short](../../../includes/pn-crm-app-for-outlook-short.md)], you can see contextual information from
[!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)] right inside your [!INCLUDE [pn-outlook](../../../includes/pn-outlook.md)] Inbox. With a single click, you can link
an [!INCLUDE [pn-outlook](../../../includes/pn-outlook.md)] email message or appointment to a specific [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)] record.
[!INCLUDE [pn-crm-app-for-outlook-short](../../../includes/pn-crm-app-for-outlook-short.md)] works together with server-side sync.

As such, the legacy [!INCLUDE [pn-outlook](../../../includes/pn-outlook.md)] add-in—[!INCLUDE [pn-crm-2016-outlook-shortest](../../../includes/pn-crm-2016-outlook-shortest.md)]—is deprecated with
the [!INCLUDE [pn-crm-9-0-0-online](../../../includes/pn-crm-9-0-0-online.md)] and will be removed in a future major
release. This deprecation includes Offline mode and synchronization in [!INCLUDE [pn-crm-2016-outlook-shortest](../../../includes/pn-crm-2016-outlook-shortest.md)].

More information:

- [Help & Training: [!INCLUDE [pn-crm-app-for-outlook-short](../../../includes/pn-crm-app-for-outlook-short.md)] User’s
  Guide](/dynamics365/customer-engagement/outlook-app/v8/dynamics-365-app-outlook-user-s-guide-v8)

- [TechNet: Deploy [!INCLUDE [pn-ms-dyn-365](../../../includes/pn-ms-dyn-365.md)] App for
  Outlook](https://technet.microsoft.com/library/dn946901.aspx)


Service scheduling in Dynamics 365 for Customer Service is deprecated
---------------------------------------------------------------------

The existing service scheduling functionality is deprecated and will be removed in a future major release. The new scheduling experience, built atop Universal Resource Scheduling (URS), is now available on the Unified Interface.

Existing service scheduling users will be provided advance notice for a timebound migration to the new scheduling capabilities.

More information: [Service Scheduling Guide](/dynamics365/customer-engagement/customer-service/basics-service-service-scheduling)


Usage of [!INCLUDE [pn-parature](../../../includes/pn-parature.md)] knowledgebase as the [!INCLUDE [pn-ms-dyn-365](../../../includes/pn-ms-dyn-365.md)] knowledge management solution is deprecated
-----------------------------------------------------------------------------------------------

Usage of [!INCLUDE [pn-parature-from-microsoft](../../../includes/pn-parature-from-microsoft.md)] knowledgebase as the [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)] knowledge
management solution is deprecated. This feature is replaced by Knowledge
Management features in [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)].

The **Knowledge Solution** setting in the **Knowledge Base Management Settings**
dialog box, which provides a connection between [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)] and [!INCLUDE [pn-parature-from-microsoft](../../../includes/pn-parature-from-microsoft.md)], will be removed in a future major release of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)].

![Knowledge Base Management Settings dialog ](media/deprecated-knowledge-management-settings.png "Knowledge Base Management Settings dialog")

Project Service Finder app is deprecated
----------------------------------------

The Project Service Finder App, available for use with [!INCLUDE [pn-ms-dyn-365](../../../includes/pn-ms-dyn-365.md)] for [!INCLUDE [pn-project-service-auto](../../../includes/pn-project-service-auto.md)], is deprecated. The legacy application will be supported for
associated legacy [!INCLUDE [pn-project-service-auto](../../../includes/pn-project-service-auto.md)] releases in accordance with
Microsoft’s [Modern Lifecycle
Policy](https://support.microsoft.com/help/30881). The functionality
available through this app will be available in a future release of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)]
in the [!INCLUDE [pn-ms-dyn-365](../../../includes/pn-ms-dyn-365.md)] for [!INCLUDE [pn-project-service-auto](../../../includes/pn-project-service-auto.md)] application.

Contracts, Contract Line Items, and Contract Templates entities are deprecated
------------------------------------------------------------------------------

The Contracts, Contract Line Items, and Contract Templates entities are
deprecated and will be removed in a future major release of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)]. This
functionality has been replaced by entitlements in [!INCLUDE [pn-ms-dyn-365](../../../includes/pn-ms-dyn-365.md)] for Customer
Service.

Standard SLAs in [!INCLUDE [pn-ms-dyn-365-for-customer-service](../../../includes/pn-ms-dyn-365-for-customer-service.md)] are deprecated
-----------------------------------------------------------------

Standard service level agreements (**SLA Type** field is set to **Standard**)
are deprecated and will be removed in a future major release of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)].
Standard SLAs are replaced by enhanced SLAs. More information: [TechNet:
Enhanced service level agreements](https://technet.microsoft.com/library/dn887187.aspx)

Relationship Roles are deprecated
---------------------------------

Relationship Roles (**Settings\>Business Management\>Relationship Roles**) are
deprecated and will be removed in a future major release of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)]. This
feature is replaced by **Connection Roles**. More information: [Help and
Training: Create connections to view relationships between
records](https://docs.microsoft.com/previous-versions/dynamicscrm-2016/admins-customizers-dynamics-365/mt826690(v=crm.8)).

Mail Merge is deprecated
------------------------

In Dynamics CRM 2016 (version 8.0), we introduced server-side document
generation using Word and [!INCLUDE [pn-excel-short](../../../includes/pn-excel-short.md)] templates. You can use these templates to
provide standardized documents or customized data analysis for your
organization.

Mail merge from previous versions is deprecated. This includes the mail-merge
Word add-in as well as mail-merge templates (**Settings\>Templates\>Mail Merge
Templates**).

More information: [Help & Training: Create Word and Excel templates from Dynamics 365
data](https://docs.microsoft.com/previous-versions/dynamicscrm-2016/admins-customizers-dynamics-365/mt826692(v=crm.8))

Announcements are deprecated
----------------------------

Announcements (**Settings\>Administration\>Announcements**) are deprecated and
will be removed in a future major release of [!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)].

Ready-to-use business processes available through Add Ready to Use Business Processes setting are deprecated
------------------------------------------------------------------------------------------------------------

Ready-to-use business processes available through the Add Ready-to-Use Business
Processes setting (<strong>Settings\>Data Management\>Add Ready-to-Use Business
Processes</strong>) are deprecated and will be removed in a future major release of
[!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)]. You can find ready-to-use business processes on [!INCLUDE [pn-microsoft-appsource.md](../../../includes/pn-microsoft-appsource.md)].

Legacy process-related attributes in entities are deprecated
------------------------------------------------------------

The legacy process-related attributes (such as **ProcessId**, **StageId**, and **TraversedPath**) on entities enabled for business process flows are now deprecated. The **SetProcess** action for business process flows is also deprecated. Manipulating these legacy process-related attributes for target entity records does not guarantee consistency of the business process flow state, and is not a supported scenario. The recommended way is to use the attributes of the business process flow entity. More information: [Create, retrieve, update, and delete business process flow entity records](/dynamics365/customer-engagement/developer/model-business-process-flows#create-retrieve-update-and-delete-business-process-flow-entity-records-process-instances)

Some client APIs are deprecated
-------------------------------

The following client APIs are deprecated in the current release to reorganize
the Xrm client API object model to better align with the need of using the same
client scripts without having to change them based on the context or the client
(web client or the new Unified Interface) where they run. You should plan to use
the new client APIs mentioned in the **Replacement Client API** column instead
of the deprecated ones. The deprecated client APIs will continue to be available
and supported until they are officially removed from a future major release of
[!INCLUDE [pn-ms-dyn-365.md](../../../includes/pn-ms-dyn-365.md)]. *A public announcement here in the documentation, on the Dynamics 365 blog, and in many other places will be made at least six months before removal.*


|Deprecated Client API |Replacement Client API |Comments |
|-----|-----|-----|
|[Xrm.Page](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg328474(v%3dcrm.7))                                 | **Forms**: ExecutionContext.[getFormContext](/dynamics365/customer-engagement/developer/clientapi/reference/executioncontext/getformcontext)  <br/>**Commands**: Send it as the [PrimaryControl](/dynamics365/customer-engagement/developer/customize-dev/pass-dynamics-365-data-page-parameter-ribbon-actions#form-and-grid-context-in-ribbon-actions) parameter |                                               Use of the **Xrm.Page** object as a static access to the primary form context is still supported to maintain backward compatibility with the existing scripts. Based on the feedback, we understand that the usage of **Xrm.Page** is high, and it won’t be removed as soon as some other client API methods listed in this section. We encourage you to use the new way of getting form content where possible. More information: [Client API form context](/dynamics365/customer-engagement/developer/clientapi/clientapi-form-context)<br/>Although **Xrm.Page** is deprecated, **parent.Xrm.Page** will continue to work in case of HTML web resources embedded in forms as this is the only way to access the form context from the HTML web resource.                                                |
|[Xrm.Page.context](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v%3dcrm.7))                             |                                                                                                                    Xrm.Utility.[getGlobalContext](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-utility/getglobalcontext)                                                                                                                    |                                                                                                                                                              Allows access to the global context without going through the form context.                                                                                                                                                               |
| [Xrm.Page.context.getQueryStringParameters](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v%3dcrm.7)#getquerystringparameters) |                                                                                                                                                                    formContext.data.attributes                                                                                                                                                                    | The formContext.data.attributes API will make retrieval of non-entity bound data consistent across entity forms, metadata-driven dialogs, and task-based flows. The data will be a combination of custom values sent using the query string and what was specified in the parameters in the [openForm](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openform) method. |
| [Xrm.Page.context.getTimeZoneOffsetMinutes](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#gettimezoneoffsetminutes) |                                                                                                                                                        globalContext.userSettings.getTimeZoneOffsetMinutes                                                                                                                                                        |                                                                                                                                                                                  Moved to globalContext.userSettings                                                                                                                                                                                   |
|                [Xrm.Page.context.getUserId](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getuserid)                |                                                                                                                                                                 globalContext.userSettings.userId                                                                                                                                                                 |                                                                                                                                                                                  Moved to globalContext.userSettings                                                                                                                                                                                   |
|              [Xrm.Page.context.getUserLcid](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getuserlcid)              |                                                                                                                                                               globalContext.userSetings.languageId                                                                                                                                                                |                                                                                                                                                                                  Moved to globalContext.userSettings                                                                                                                                                                                   |
|              [Xrm.Page.context.getUserName](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getusername)              |                                                                                                                                                                globalContext.userSettings.userName                                                                                                                                                                |                                                                                                                                                                                  Moved to globalContext.userSettings                                                                                                                                                                                   |
|             [Xrm.Page.context.getUserRoles](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getuserroles)             |                                                                                                                                                             globalContext.userSettings.securityRoles                                                                                                                                                              |                                                                                                                                                                                  Moved to globalContext.userSettings                                                                                                                                                                                   |
|     [Xrm.Page.context.getIsAutoSaveEnabled](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getisautosaveenabled)     |                                                                                                                                                       globalContext.organizationSettings.isAutoSaveEnabled                                                                                                                                                        |                                                                                                                                                                              Moved to globalContext.organizationSettings                                                                                                                                                                               |
|               [Xrm.Page.context.getOrgLcid](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getorglcid)               |                                                                                                                                                           globalContext.organizationSettings.languageId                                                                                                                                                           |                                                                                                                                                                              Moved to globalContext.organizationSettings                                                                                                                                                                               |
|         [Xrm.Page.context.getOrgUniqueName](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getorguniquename)         |                                                                                                                                                           globalContext.organizationSettings.uniqueName                                                                                                                                                           |                                                                                                                                                                              Moved to globalContext.organizationSettings                                                                                                                                                                               |
|             [Xrm.Page.data.entity.getDataXml](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg334720(v%3dcrm.7)#getdataxml)             |                                                                                                                                        No change in the method, but use "typename" instead of type for lookup attributes.                                                                                                                                         |                                                                                                                                                                                                                                                                                                                                                                                                        |
|                     [GridRow.getData](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/dn932126(v%3dcrm.7)#getdata)                      |                                                                                                                                                                           GridRow.data                                                                                                                                                                            |                                                                                                                                                 GridRow is essentially a form context. This change unifies the interface of GridRow with formContext.                                                                                                                                                  |
|            [GridRowData.getEntity ](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/dn932126(v=crm.7)#getentity)             |                                                                                                                                                                        GridRowData.entity                                                                                                                                                                         |                                                                                                                                                    GridRowData is form data. This change unifies the interface of GridRowData with formContextData.                                                                                                                                                    |
|                           Xrm.Mobile.offline                            |                                                                                                                              [Xrm.WebApi.offline](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-webapi/offline)                                                                                                                              |                                                                                                                                                                     Moved the offline-related methods under **Xrm.WebApi.offline**                                                                                                                                                                     |
|              [parent.Xrm](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/gg309536(v%3dcrm.7)#reference-other-web-resources-from-an-html-web-resource)               |                                                                                                                                                                                                                                                                                                                                                                   |                 **Earlier**: An HTML web resource may interact with the **Xrm.Page** or **Xrm.Utility** objects within the form by using **parent.Xrm.Page** or **parent.Xrm.Utility**. <br>**Now**: parent.Xrm.\* will work if the HTML web resource is loaded in a form container. It won't work for HTML web resources that are stand alone, or referenced from the site map or any other places.                  |
|                              addOnKeyPress                              |                                                                                                                                                                       Use a custom control                                                                                                                                                                        |                                                                                                                                                                                                                                                                                                                                                                                                        |
|                 removeOnKeyPress                  |                                                                                                                                                                       Use a custom control                                                                                                                                                                        |                                                                                                                                                                                                                                                                                                                                                                                                        |
|                 showAutoComplete                  |                                                                                                                                                             Use a custom control and corresponding UI                                                                                                                                                             |                                                                                                                                                                                                                                                                                                                                                                                                        |
|                 hideAutoComplete                  |                                                                                                                                                             Use a custom control and corresponding UI                                                                                                                                                             |                                                                                                                                                                                                                                                                                                                                                                                                        |
|                [Xrm.Utility.alertDialog ](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#alertdialog)                |                                                                                                                  Xrm.Navigation.[openAlertDialog](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openalertdialog)                                                                                                                  |                                                                                                                                             The new signature is consistent with other APIs (openForm) and takes a new set of parameters for flexibility.                                                                                                                                              |
|              [Xrm.Utility.confirmDialog](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#confirmdialog)               |                                                                                                                Xrm.Navigation.[openConfirmDialog](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openconfirmdialog)                                                                                                                |                                                                                                                                             The new signature is consistent with other APIs (openForm) and takes a new set of parameters for flexibility.                                                                                                                                              |
|                       [Xrm.Utility.isActivityType](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#isactivitytype)                        |                                                                                                                   Xrm.Utility.[getEntityMetadata](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-utility/getentitymetadata)                                                                                                                   |                                                        The isActivityType method is synchronous so it was suitable for ribbon rules. However, the replacement method, [getEntityMetadata](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-utility/getentitymetadata), is asynchronous, and is not suitable for ribbon rules.                                                        |
|             [Xrm.Utility.openEntityForm ](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#openentityform)             |                                                                                                                         Xrm.Navigation.[openForm](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openform)                                                                                                                         |                                                                                                                                                                              Moving navigation actions to Xrm.Navigation                                                                                                                                                                               |
|                       [Xrm.Utility.openQuickCreate](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#openquickcreate)                       |                                                                                                                         Xrm.Navigation.[openForm](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openform)                                                                                                                         |                                                                                                                                                                              Moving navigation actions to Xrm.Navigation                                                                                                                                                                               |
|                       [Xrm.Utility.openWebResource](https://docs.microsoft.com/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#openwebresource)                       |                                                                                                                  Xrm.Navigation.[openWebResource](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openwebresource)                                                                                                                  |                                                                                                                                                Moving navigation actions to Xrm.Navigation  <br/>**Note**: This API returns VOID in Unified Interface.                                                                                                                                                 |

For information about the new client APIs, see [Client scripting in Customer Engagement using JavaScript](/dynamics365/customer-engagement/developer/clientapi/client-scripting)

EntityMetadata.IsInteractionCentricEnabled property is deprecated
-----------------------------------------------------------------

All entities supported in the Unified Interface are now enabled for the
interactive experience in the new Customer Service Hub app. This implies that
the
**EntityMetadata**.[IsInteractionCentricEnabled](https://msdn.microsoft.com/library/microsoft.xrm.sdk.metadata.entitymetadata.isinteractioncentricenabled.aspx)
property, which indicates whether an entity can be enabled for interactive
experience, is no longer relevant. The corresponding setting for this property
in the Customization tool, **Enable for interactive experience**, is removed in
the current release, and the
**EntityMetadata**.[IsInteractionCentricEnabled](https://msdn.microsoft.com/library/microsoft.xrm.sdk.metadata.entitymetadata.isinteractioncentricenabled.aspx)
property will be removed from the future version of [!INCLUDE [pn-ms-dyn-365](../../../includes/pn-ms-dyn-365.md)] SDK for
Customer Engagement.

<a name="BKMK_Silverlight"></a> 
[!INCLUDE [pn-silverlight-short](../../../includes/pn-silverlight-short.md)] (XAP) web resource is deprecated
--------------------------------------------

The [!INCLUDE [pn-silverlight-short](../../../includes/pn-silverlight-short.md)] (XAP) web resource is deprecated on the web client, and is not
supported on the new Unified Interface introduced in the 
[!INCLUDE [pn-crm-9-0-0-online](../../../includes/pn-crm-9-0-0-online.md)]. Instead of [!INCLUDE [pn-silverlight-short](../../../includes/pn-silverlight-short.md)] web resources, you must use custom
controls created using the HTML web resources
with HTML5 to create UI components to visualize and interact with data.
