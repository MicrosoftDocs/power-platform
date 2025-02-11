---
title: Overview of the Power Platform admin center
description: The Power Platform admin center is a unified portal for administrators to manage environments and settings.
author: sericks007
ms.topic: overview
ms.date: 02/11/2025
ms.author: sericks
---

# Overview of the Power Platform admin center

The Power Platform admin center (<https://admin.powerplatform.microsoft.com>) provides a unified portal for administrators to manage environments and settings for Power Apps, Power Automate, Power Pages, and Microsoft Copilot Studio.

The Power Platform admin center is also used by administrators of some Dynamics 365 apps, such as Dynamics 365 Sales, Dynamics 365 Customer Service, and Dynamics 365 Marketing, to manage environments and settings.

> [!Note]
> Power BI administrators use the Power BI admin portal (<https://app.powerbi.com>) to manage a Power BI tenant including the configuration of governance policies, usage monitoring, and provisioning of licenses, capacities, and organizational resources. Learn more about Power BI admin portal at [What is Power BI administration?](/power-bi/service-admin-administering-power-bi-in-your-organization).

## Understand the user interface (UI)
[The new and improved Power Platform admin center](new-admin-center.md) is designed with an outcome-driven approach, where all functionality is intuitively organized in pages based on administrative tasks. The new admin center isn't just task-oriented, it also helps you achieve specific outcomes and goals. The design focuses on providing an optimal user experience, catering to a wide range of stakeholders with varying needs.

The classic Power Platform admin center is avaiable and pages are organized according to functions.

# [New admin center](#tab/new)

:::image type="content" source="media/new-ppac-callouts.png" alt-text="The new and improved Power Platform admin center.":::

Legend:
1. Navigation pane
2. Settings icon
3. Admin center links
4. Power Platform page

## 1. Navigation pane
Find what you need with the left navigation pane. You can easily navigate to Power Platform pages that help you deploy, manage, and secure you Power Platform implementation.

## 2. Settings icon
Select the gear icon to perform tasks such as managing tenant settings, view your session details, and change the theme of the user interface.

## 3. Admin center links
Easily navigate to related admin centers, such as the [Microsoft 365 admin center](https://admin.microsoft.com/Adminportal/Home#/homepage), [Microsoft Entra admin center](https://entra.microsoft.com/#home), and [Power BI admin portal](https://dxt.powerbi.com/admin-portal/capacities?experience=power-bi). 

## 4. Power Platform page
Complete administrative functions on each Power Platform page.

# [Classic admin center](#tab/classic)

:::image type="content" source="media/classic-ppac-callouts.png" alt-text="The classic Power Platform admin center.":::

Legend:
1. Navigation pane
2. Settings icon
3. Power Platform page

## 1. Navigation pane
Find what you need with the left navigation pane. You can easily navigate to Power Platform pages that help you deploy, manage, and secure you Power Platform implementation.

## 2. Settings icon
Select the gear icon to perform tasks such as managing tenant settings, view your session details, and change the theme of the user interface.

## 3. Power Platform page
Complete administrative functions on each Power Platform page.

---

## Manage your environments and settings

The Power Platform admin center provides the following capabilities.

# [New admin center](#tab/new)

|Feature area  |Description  | Learn more |
|---------|---------|----------------|
|Actions | View recommendations about your Power Platform implementation. The recommendations enhance security, reliability, and overall health of your implementation.  |[Use Power Platform Advisor](power-platform-advisor.md)|
| Manage |  Manage your environments, environment groups, and tenant settings.| - [Power Platform environments overview](environments-overview.md)<br>- [Environment groups](environment-groups.md)<br>- [Tenant settings](tenant-settings.md)<br>  |
| Monitor | Measure and improve operational health metrics of resources built or deployed in Power Platform, such as apps. | [Monitor page (preview)](monitoring/monitoring-overview.md) |
|Security | Run your organizational workloads in the safest way possible with a wide set of security features available. | [Security overview](security/security-overview.md) |
|Deployment     | The Deployment page in the Power Platform admin center provides a streamlined experience to help administrators navigate the complexities of managing Power Platform application lifecycle management (ALM) workloads, including managing pipelines deployments at enterprise scale. Admins have visibility to all the deployments in their tenant and can approve deployment requests and troubleshoot issues.| [Admin deployment page (preview)](../alm/admin-deployment-hub.md) |
|Licensing  |  View a summary of environments in your tenant requiring licensing attention and license consumption for your environments. |[View license consumption](view-license-consumption-issues.md) |
| Copilot | Access educational resources, track usage, and access governance controls about Copilot features. | [Manage Copilot](copilot/copilot-hub.md) |
|Support     | Get a list of self-help solutions or create a support ticket for technical support.<br/><br/>**Note**: Although you administer Power BI using the Power BI admin portal, you request support for Power BI through support in the Power Platform admin center.| [Get Help + Support](./get-help-support.md).  |

# [Classic admin center](#tab/classic)

|Feature area  |Description  | Learn more |
|---------|---------|----------------|
|Environments | View, create, and manage your environments. Select an environment to see details and manage its setting. |[Manage environment settings](./admin-settings.md)|
| Environment groups |  Similar to folders, _environment groups_ are designed to help administrators organize their flat list of environments into structured groups based on different criteria, such as business unit, project, and location | [Environment groups](environment-groups.md) |
| Advisor | Power Platform Advisor is your guide to personalized recommendations to optimize your Power Platform tenant. Advisor analyzes all Managed Environments and the apps in these environments within your Power Platform tenant. Advisor offers solutions to enhance security, reliability, and overall health. | [Use Power Platform Advisor](power-platform-advisor.md) |
|Security | Run your organizational workloads in the safest way possible with a wide set of security features available. | [Security overview](security/security-overview.md) |
|Analytics     | Get a detailed view of key metrics for Microsoft Power Platform apps. |[Microsoft Dataverse analytics](./analytics-common-data-service.md)    |
|Billing  |  View a summary of environments in your tenant requiring licensing attention and license consumption for your environments. |[Business subscription and billing documentation](/microsoft-365/commerce) and [View license consumption](view-license-consumption-issues.md) |
|Settings  |  Manage settings for all environments in your tenant.|[Tenant settings](tenant-settings.md) |
| Copilot | Access educational resources, track usage, and access governance controls about Copilot features. | [Manage Copilot](copilot/copilot-hub.md) |
|Resources  |  View and manage resources in your tenant and environments. |[View and manage resources](view-manage-resources.md)  |
|Help + support     | Get a list of self-help solutions or create a support ticket for technical support.<br/><br/>**Note**: Although you administer Power BI using the Power BI admin portal, you request support for Power BI through Help + support in the Power Platform admin center.| [Get Help + Support](./get-help-support.md).  |
|Data integration| The Data Integrator (for Admins) is a point-to-point integration service used to integrate data into Dataverse. | [Integrate data into Dataverse](data-integrator.md)|
|Data| Manage your cloud and data gateway connections.| [Set up data transfer between on-premises data and cloud services](onpremises-data-gateway-management.md) |
|Policies     | View and manage various policies for your tenant and environments. | <br/>- [Manage data policies](prevent-data-loss.md)<br/>- [Tenant isolation policy](cross-tenant-restrictions.md)<br/>- [Customer Lockbox policy](about-lockbox.md)<br/>- [Enterprise policies](customer-managed-key.md)<br/>- [Billing policies](pay-as-you-go-overview.md)|

---

## Personalize your Home page

You can personalize your **Home** page by selecting a theme, setting your language, and timezone from the **Settings** gear.

To personalize your dashboard, select **+ Add cards** on top of the homepage and drag any card onto the dashboard to the location you want.

:::image type="content" source="media/home-page.png" alt-text="Power Platform admin center Home page":::

The following are the cards you can add to the dashboard.

### Monitor service health

This card shows whether your Microsoft services are healthy, or if they're experiencing an active advisory or incident. For more info about an advisory or incident, select it to open the **Service health** page of the Microsoft 365 admin center.

### Message center

This card helps you manage upcoming changes to our Microsoft services. Select a post to open it in the details panel. To view the full list of messages across all Microsoft services, select **Show all**. [More info about the message center](/office365/admin/manage/message-center).

### Resources for documentation and training

This card provides links to related documentation and information sources.

### Related content

[Working with various admin portals](wp-work-with-admin-portals.md) <br />
[Training: Microsoft Power Platform Fundamentals](/training/paths/power-plat-fundamentals)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
