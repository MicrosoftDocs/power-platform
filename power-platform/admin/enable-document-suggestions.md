---
title: Enable document suggestions for Dynamics 365 for Customer Engagement apps
description: Enable document suggestions for Dynamics 365 for Customer Engagement apps
author: sericks007
contributor: josaw1
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/21/2025
ms.subservice: admin
ms.author: sericks 
search.audienceType: 
  - admin
---
# Enable document suggestions to recommend related documents

> [!IMPORTANT]
> The document suggestions feature is deprecated for all tables except the case table. The case table is available with Dynamics 365 Customer Service. For more information, see [Create a case](/dynamics365/customer-service/customer-service-hub-user-guide-create-a-case).

When you enable document suggestions, your Dynamics 365 apps web browser and mobile users see important documents related to what they're working on in Dynamics 365 apps, such as a big sales opportunity. You, as the admin, define relevant fields. A recommendation engine that uses Azure Text Analytics and keyword matching associates related records to find similar documents. You create similarity rules in Dynamics 365 apps to provide your own similarity logic. Dynamics 365 apps then presents a list of suggested documents to the user while the user works in the current record.  
  
> [!NOTE]
> The Document Suggestions feature doesn't require a connection to the Azure Text Analytics service. If you choose not to use Azure Text Analytics, Document Suggestions uses the built-in keyword matching  logic available in Dynamics 365 apps. However, we recommend that you use Azure Text Analytics service for more advanced keyword matching.  
  
 Document Suggestions searches other comparable records to determine similarities found in documents located on a SharePoint site, OneDrive, or external location. Suggested documents can be in several different formats such as Word, Excel, PowerPoint, OneNote, Adobe PDF, and text files. When similar documents are found, Document Suggestions presents them and offers  you  the ability to open the document or make a copy.  
  
## Requirements

 Document Suggestions works with a web browser, Dynamics 365 for tablets, and Dynamics 365 for phones. To use Document Suggestions with Dynamics 365 apps, a system administrator needs to:

- Confirm subscriptions and access to:

  - **Dynamics 365 Customer Service**.
  - **SharePoint Online, SharePoint 2013, or SharePoint 2016**.
  - **Azure services** to use Azure Text Analytics.

- Confirm the following is set up:

  - **Dataverse search is enabled and configured**. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Configure Dataverse search for the organization](../admin/configure-relevance-search-organization.md)  
  - **Document management is set up in Dynamics 365 apps**. See [Set up SharePoint integration](set-up-sharepoint-integration.md).

- Complete the following tasks:

  - Enables the Azure Text Analytics connection in Dynamics 365 apps.
  - Defines a similarity rule for each entity type that's included in Document Suggestions. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Use advanced similarity rules to view similar case suggestions](/dynamics365/customer-service/suggest-similar-cases-for-a-case).

## How it works

 Use Document Suggestions with the Case entity.  
  
 You can use the built-in pattern matching that's included natively with the Document Suggestions feature, but for more advanced keyword matching, use Azure Text Analytics service.  
  
 Document Suggestions searches only the locations and documents that the user has access to.  
  
 It searches locations where documents are found in the following order:  
  
1. SharePoint default site.  
1. Other SharePoint sites.  
1. OneDrive.
1. Microsoft 365 Groups (when solution is installed).  
1. External URL (when configured).  
  
Document Suggestions doesn't search attachments that you add to Notes in Dynamics 365 apps records.  
  
### Adding an external URL to search another site

You can include external sites, such as an on-premises SharePoint document library, in Document Suggestions by adding an external URL for the site to be searched.  
  
> [!NOTE]
> For the best results when using an external site for document suggestions, use Azure Text Analytics, which provides more advanced keyword matching logic.
  
 When you add the external URL to the enabled document suggestions feature, your users experience the following features.  
  
- **Web browsers**: When users run Dynamics 365 apps from a web browser, after selecting **Document Suggestions**, they can select **Other Recommendations** in the **Document Suggestions** page to display another page that might include more document suggestions found on the external site. The user might be prompted to sign in to the external site.
  
- **Mobile apps**: For the Dynamics 365 for tablets and Dynamics 365 for phones apps, after selecting **Document Suggestions**, users can select **Other Recommendations**, which opens the external site in the device's default web browser. The site might include more document suggestions found on the external site. The user might be prompted to sign in to the external site.
  
#### Constructing the external URL

 You should construct the external URL in a format that the external site understands. For example, for sites that use a construct similar to <em>https://contoso.com/search?{0}</em>, where **<https://contoso.com/search?>** is the search URL structure and {0} is the keyword string, Document Suggestions passes the keywords in the {0} parameter. The keywords that are passed to the URL come from similar record rules that include entity mappings of **Text Match**. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Use advanced similarity rules to view similar case suggestions](/dynamics365/customer-service/suggest-similar-cases-for-a-case).
  
 The values found in the text fields of the similarity-rules mappings are the keywords used to build the query that's passed to the external site. In the following URL, *keyword* is the text value found in the similarity-rules mappings and *&* represents a whitespace that Document Suggestions uses to separate each keyword.
  
 *https://contoso.com/search?keywordA&keywordB&keywordC*  
  
 For an on-premises SharePoint server, you can add an external URL that points to a subsite similar to the following URL, where *mysharepoint* is the website name, *sites* is the site name, and *subsitename* is the subsite name.
  
   <em>https://mysharepoint/sites/subsitename/_layouts/15/osssearchresults.aspx?&k={0}</em>  
  
## Set up the Azure text analytics connection

 To use Azure text analytics with Document Suggestions, you need to configure an **Azure text analytics** connection.
  
> [!NOTE]
> The Document Suggestions feature doesn't require a connection to the Azure Text Analytics service. If you choose not to use Azure Text Analytics, Document Suggestions uses the built-in keyword matching logic available in Dynamics 365 apps. However, for more advanced keyword matching, use the Azure Text Analytics service.  
  
## Define and activate similarity rules

 If you have not already defined similarity rules, see [Use advanced similarity rules to view similar case suggestions](/dynamics365/customer-service/suggest-similar-cases-for-a-case).

## Enable Document Suggestions

To enable Document Suggestions, complete the following steps:
  
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in with administrator credentials.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. Select **Settings** > **Integration** > **Document management settings** > **Manage Document Suggestions**.
1. In the **Select Entities** area, select the **Case** entity to include in Document Suggestions, then select **Apply**.  
  
  > [!TIP]
  > If the case entity isn't listed in the **Select Entities** area, it's because similarity rules for the case entity aren't defined and activated.  [Use advanced similarity rules to view similar case suggestions](/dynamics365/customer-service/suggest-similar-cases-for-a-case).
  
1. Set external URL to include in Document Suggestions. By default, Document Suggestions searches in Microsoft 365 services like SharePoint or OneDrive. If you want to search an external site in addition to the available Microsoft 365 services, such as an on-premises SharePoint site, enter the base URL to the external system. Dynamics 365 apps append a search query string to the base URL you provide. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Adding an external URL to search another site](#adding-an-external-url-to-search-another-site).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
