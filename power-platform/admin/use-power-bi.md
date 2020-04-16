---
title: "Use Power BI  | MicrosoftDocs"
description: Use Power BI
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/15/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use Power BI

The [!INCLUDE[pn_power_bi_for_office_365_long](../includes/pn-power-bi-for-office-365-long.md)] cloud service works with model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, to provide a self-service analytics solution. [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] automatically refreshes the data displayed. With [!INCLUDE[pn_power_bi_desktop](../includes/pn-power-bi-desktop.md)] or [!INCLUDE[pn_MS_Excel_Full](../includes/pn-ms-excel-full.md)] Power Query for authoring reports and [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] for sharing dashboards and refreshing data from model-driven apps in Dynamics 365, sales, marketing, and service personnel in your organization have a powerful new way to work with data.  
  
<a name="PowerBIGetstarted"></a>   
## Get started using Power BI with model-driven apps in Dynamics 365 
 The model-driven apps in Dynamics 365 content packs for [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] cloud service allow you to easily access and analyze your sales, service, or marketing data.  
  
 To create a [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] dashboard using a  content pack, follow these instructions.  
  
1. If you haven't already done so, [register with Power BI](https://powerbi.com/).  
  
2. After you have signed in to [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)], in the **Datasets** area click **Get Data**, under **Services** click **Get**, and then select from the following content packs.  
  
   - **Sales Analytics for Dynamics 365**  
  
   - **Customer Service Analytics for Dynamics 365**  
  
   - **Microsoft Dynamics 365 - Social Engagement**  
  
3. For the Sales Analytics and Service Analytics content packs, enter the URL of your environment, such as *<https://OrganizationName.crm.dynamics.com>*, where *OrganizationName* is the organization name of your environment, and click **Next**.  
  
   > [!NOTE]
   >  If your data center is outside of North America the crm.dynamics.com domain name may be different, such as crm2.dynamics.com, crm3.dynamics.com, crm4.dynamics.com, etc. To find the domain name, in the web app go to **Settings** > **Customizations** > **Developer Resources**. The URLs listed will indicate the correct domain name.  
  
    For the Marketing content pack, enter the URL as *<https://OrganizationName.marketing.dynamics.com/analytics>*, where *OrganizationName* is the organization name of your environment, and click **Next**  
  
4. Under **Authentication method**, select **oAuth2**.  
  
5. Your organization data is imported and several visualizations become available.  
  
> [!TIP]
>  If the content pack you select does not open in your web browser, in the left pane of your Power BI workspace click the content pack under **Dashboards**.  
  
### Content packs available for download.  
 The model-driven apps in Dynamics 365 content packs support the default out-of-box entities. However, you can customize  the following content packs by downloading the .PBIX file and then using [!INCLUDE[pn_power_bi_desktop](../includes/pn-power-bi-desktop.md)] to customize the content pack before uploading it to the [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] service.  
  
- [Download the Dynamics CRM Online Sales Manager .PBIX](https://download.microsoft.com/download/9/2/B/92BCBDCE-CE01-4BC9-A306-2A92653B683E/Sales%20Manager.pbix)  
  
- [Download the Service Manager .PBIX](https://download.microsoft.com/download/9/2/B/92BCBDCE-CE01-4BC9-A306-2A92653B683E/Customer%20Service%20Manager.pbix)  
  
  The [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] Report Template for [!INCLUDE[pn_connected_field_service_msdyn365](../includes/pn-connected-field-service-msdyn365.md)] enables users to publish a [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] report that displays the live heart beat of connected devices.  
  
- [Download the Power BI Report Template for Connected Field Service](https://download.microsoft.com/download/E/B/5/EB5ED97A-A36A-4CAE-8C04-333A1E463B4F/PowerBI%20Report%20Template%20for%20Connected%20Field%20Service%20for%20Microsoft%20Dynamics%20365.pbix)  
  
  For information about how to customize the content packs, see [Customize Power BI content packs](https://docs.microsoft.com/powerapps/maker/model-driven-apps/customize-power-bi-content-packs).  
  
<a name="BPI_embed"></a>   
## Embed [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualizations on personal dashboards  
 Before users can embed [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualizations on personal dashboards, the organization-wide setting must be enabled.  
  
> [!NOTE]
>  This feature was first introduced in [!INCLUDE[pn_crm_8_1_0_online_subsequent](../includes/pn-crm-8-1-0-online-subsequent.md)].  
> 
>  By default, [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualization embedding is disabled and must be enabled before users can embed them in personal dashboards.  
  
### Enable [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualizations in the organization  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Product** > **Features**.  
  
3. Under **Embedded content** set **Power BI visualization embedding** to **On** to enable or **Off** to disable.  
  
4. Click **Save**.  
  
To learn more about how to add [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] tiles to personal dashboards, see [Embed Power BI tiles on your personal dashboard  ](https://docs.microsoft.com/powerapps/user/add-powerbi-dashboards#embed--power-bi-tiles-on-your-personal-dashboard).  
  
To learn more about how to add [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] dashboards to personal dashboards, see [Add a Power BI dashboard on your personal dashboard](https://docs.microsoft.com/powerapps/user/add-powerbi-dashboards).  
  
<a name="CRMOnline_PBIDesktop"></a>   
## Use Power BI Desktop to connect directly to your Dynamics 365 environment  
 You can connect to model-driven apps in Dynamics 365 with [!INCLUDE[pn_power_bi_desktop](../includes/pn-power-bi-desktop.md)] to create custom  reports and dashboards for use with the [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] service.  
  
### Requirements  
  
- [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] service registration  
  
- [Power BI Desktop](https://powerbi.microsoft.com/desktop).  
  
- Common Data Service environment  
  
### Connect to [!INCLUDE[pn_crm_online_subsequent](../includes/pn-crm-online-subsequent.md)] apps  
  
1. Start [!INCLUDE[pn_power_bi_desktop](../includes/pn-power-bi-desktop.md)].  
  
2. From the Home tab, click **Get Data**, and then click **More**.  
  
3. In the Get Data list, select **Dynamics 365 Online**.  
  
4. Enter the [!INCLUDE[pn_crm_online_subsequent](../includes/pn-crm-online-subsequent.md)] apps OData endpoint URL. It should look similar to this URL, where *OrganizationName* is the name of your [!INCLUDE[pn_crm_online_subsequent](../includes/pn-crm-online-subsequent.md)] apps organization, and **v8.1** is the version. Click **OK**.  
  
    https://<em>OrganizationName</em>.api.crm.dynamics.com/api/data/*v8.1*  
  
> [!IMPORTANT]
> For more information about the different endpoint versions, see [Web API URL and versions]( https://msdn.microsoft.com/library/gg334391.aspx#bkmk_url_and_versions).
 
> [!TIP]
>  You can find your OData endpoint URL in the web client. Go to **Settings** > **Customizations** > **Developer Resources** and locate the URL under **Instance Web API**.  
  
5. In the Access an OData feed dialog click **Organizational account**, and then click **Connect**.  
  
   > [!NOTE]
   >  If you aren't signed in to your environment, click **Sign-in** on the Access OData feed dialog before you click Connect.  
  
6. The organization database entity tables appear in the [!INCLUDE[pn_power_bi_desktop](../includes/pn-power-bi-desktop.md)] Navigator window. You can select both default and custom entities. For more information about creating reports with [!INCLUDE[pn_power_bi_desktop](../includes/pn-power-bi-desktop.md)], see [Power BI Support: Report View in Power BI Desktop](https://powerbi.microsoft.com/documentation/powerbi-desktop-report-view/).  
  
   ![Select entity table](../admin/media/pbi-select-entity-table.PNG "Select entity table")  
  
   > [!TIP]
   >  You can use similar steps to connect to model-driven apps in Dynamics 365 using [!INCLUDE[pn_MS_Excel_Full](../includes/pn-ms-excel-full.md)] Power Query by selecting **From Other Sources** on the **Power Query** tab in [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)].  
  
### See also  
