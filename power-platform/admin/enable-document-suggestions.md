---
title: "Enable document suggestions for Dynamics 365 for Customer Engagement apps | MicrosoftDocs"
description: Enable document suggestions for Dynamics 365 for Customer Engagement apps
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/27/2020
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enable document suggestions to recommend related documents

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

> [!IMPORTANT]
> The document suggestions feature has been deprecated for all tables, except the case table. The case table is available with Dynamics 365 Customer Service. More information: [Create a case](/dynamics365/customer-service/customer-service-hub-user-guide-create-a-case)

Enabling Document Suggestions helps your Dynamics 365 apps web browser and mobile users be aware of important documents related to what they're working on in Dynamics 365 apps such as a big sales opportunity. You, as the admin, define relevant fields. A recommendation engine using Azure text analytics uses keyword matching to associate related records to find similar documents. You create similarity rules in Dynamics 365 apps to provide your own similarity logic. Dynamics 365 apps then presents a list of suggested documents to the user while the user works in the current record.  
  
 <!-- Removed diagram because it uses an opportunity entity example that is no longer supported. ![Document recommendations feature diagram](media/document-recommendations.png "Document recommendations feature diagram")   -->
  
> [!NOTE]
>  The Document Suggestions feature doesn't require a connection to the Azure Text Analytics service. If you choose not to use Azure Text Analytics, Document Suggestions will use the built-in keyword matching  logic available in Dynamics 365 apps. However, we recommend that you use Azure Text Analytics service for more advanced keyword matching.  
  
 Document Suggestions searches other like-records to determine similarities found in documents located on a SharePoint site, OneDrive, or external location. Suggested documents can be in several different formats such as Word, Excel, PowerPoint, OneNote, Adobe PDF, and text files. When similar documents are found Document Suggestions presents them offering  you  the ability to open the document or make a copy.  
  
## Requirements  
 The following are required to use Document Suggestions with Dynamics 365 apps.  
  
- Dynamics 365 Customer Service.
  
- To suggest documents located on SharePoint:  
  
  - Access to SharePoint Online, SharePoint 2013, or SharePoint 2016.  
  
  - Document management must be set up in Dynamics 365 apps. See [Set up SharePoint integration](set-up-sharepoint-integration.md).  
  
- Relevance Search must be enabled. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Configure Relevance Search for the organization](../admin/configure-relevance-search-organization.md)  
  
- Document Suggestions works with Web browser, Dynamics 365 for tablets and Dynamics 365 for phones.  
  
- To use Azure text analytics with Document Suggestions:  
  
  - An Azure subscription is required to use the Azure Text Analytics service.  
  
  - A system administrator must enable the text analytics connection in Dynamics 365 apps. 
  
- A system administrator must define a similarity rule for each entity type that is to be included in Document Suggestions. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Use advanced similarity rules to view similar case suggestions](https://docs.microsoft.com/dynamics365/customer-service/suggest-similar-cases-for-a-case).
  
## How it works  
 You use Document Suggestions with the Case entity.  
  
 You can use the built-in pattern matching that is included natively with the Document Suggestions feature, but we recommend that you use Azure Text Analytics service for more advanced keyword matching.  
  
 Document Suggestions searches only the locations and documents that the user has access to.  
  
 Locations where documents are found are searched in the following order:  
  
1. SharePoint default site.  
  
2. Other SharePoint sites.  
  
3. OneDrive.
  
4. Microsoft 365 Groups (when solution is installed).  
  
5. External URL (when configured).  
  
Document Suggestions does not search attachments that are added to Notes in Dynamics 365 apps records.  
  
### Adding an external URL to search another site  
External sites, such as an on-premises SharePoint document library can be included in Document Suggestions by adding an external URL for the site to be searched.  
  
> [!NOTE]
> For the best results when using an external site for document suggestions, we recommend that you use Azure Text Analytics, which provides more advanced keyword matching logic. 
  
 Once you add the external URL to the enabled document suggestions feature, here is what your users will experience.  
  
- Web browsers. When you run Dynamics 365 apps from a Web browser, after selecting **Document Suggestions**, users can then select **Other Recommendations** in the **Document Suggestions** page to display another page that may include more document suggestions found on the external site. Notice that the user may be prompted to sign in to the external site.  
  
- Mobile apps. For the Dynamics 365 for tablets and Dynamics 365 for phones apps, after selecting **Document Suggestions**, users can select **Other Recommendations**, which opens the external site in the devices default web browser that may include more document suggestions found on the external site. Notice that the user may be prompted to sign in to the external site.  
  
#### Constructing the external URL  
 The external URL should be constructed in a format that is understood by the external site. For example, for sites that use a construct similar to <em>https://contoso.com/search?{0}</em>, where **<https://contoso.com/search?>** is the search URL structure and {0} is the keyword string, Document Suggestions passes the keywords in the {0} parameter. The keywords that are passed to the URL are derived from similar record rules that include entity mappings of **Text Match**. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Use advanced similarity rules to view similar case suggestions](https://docs.microsoft.com/dynamics365/customer-service/suggest-similar-cases-for-a-case).
  
 The values found in the text fields of the similarity rule mappings are used as keywords to build the query that is passed to the external site, similar to the below URL, where *keyword* is the text values found in the similarity rules mappings and *&* represents a whitespace that Document Suggestions uses to separate each keyword.  
  
 *https://contoso.com/search?keywordA&keywordB&keywordC*  
  
 For an on-premises SharePoint server, you can add an external URL that points to a subsite similar to this, where *mysharepoint* is the web site name *sites* is the site name and *subsitename* is the subsite name.  
  
 <em>https://mysharepoint/sites/subsitename/_layouts/15/osssearchresults.aspx?&k={0}</em>  
  
## Set up the Azure text analytics connection  
 To use Azure text analytics with Document Suggestions, an Azure text analytics connection must be configured.   
  
> [!NOTE]
> The Document Suggestions feature doesn't require a connection to the Azure Text Analytics service. If you choose not to use Azure Text Analytics, Document Suggestions will use the built-in keyword matching  logic available in Dynamics 365 apps. However, we recommend that you use Azure Text Analytics service for more advanced keyword matching.  
  
## Define and activate similarity rules  
 If you have not already defined similarity rules, see [Use advanced similarity rules to view similar case suggestions](https://docs.microsoft.com/dynamics365/customer-service/suggest-similar-cases-for-a-case).

## Enable Document Suggestions  
 To enable Document Suggestions, do the following:  
  
1. Browse to the Power Platform admin center and sign in using administrator credentials.
  
2. Go to **Environments** > [select an environment] > **Settings** > **Integration** > **Document management settings** > **Manage Document Suggestions**.
  
3. In the **Select Entities** area, select the **Case** entity to include in Document Suggestions, and then select **Apply**.  
  
   > [!TIP]
   > If the case entity isn't listed in the **Select Entities** area, it is because similarity rules for the case entity have not been defined and activated.  [Use advanced similarity rules to view similar case suggestions](https://docs.microsoft.com/dynamics365/customer-service/suggest-similar-cases-for-a-case).
  
4. Set external URL to include in Document Suggestions. By default, Document Suggestions searches in Microsoft 365 services like SharePoint or OneDrive. If you want to search  an external site in addition to the available Microsoft 365 services, such as an on-premises SharePoint site, enter the base URL to the external system. Dynamics 365 apps will append a search query string to the base URL you provide. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Adding an external URL to search another site](#adding-an-external-url-to-search-another-site).
