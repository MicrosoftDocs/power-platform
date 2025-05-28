---
title: Important changes (deprecations) coming in Power Platform
description: Important changes (deprecations) coming in Power Platform 
ms.date: 05/20/2025
ms.topic: concept-article
ms.subservice: admin
searchScope:
  - "Power Platform"  
ms.custom:
 - dyn365-hub
author: sericks007
contributors:
  - sbasi19
  - v-aangie
ms.author: sericks
ms.reviewer: sericks
---
# Important changes (deprecations) coming in Power Platform

The announcements and deprecations described in this article apply to Power Apps and Power Automate. Admins and IT professionals can use this information to prepare for future releases. This article was first published on June 27, 2017.

For deprecation information of other products, see [Other deprecation articles](#other-deprecation-articles) later in this article.

> [!IMPORTANT]
> "Deprecated" means we intend to remove the feature or capability from a future release. The feature or capability is fully supported until it's officially removed. This deprecation notification can span a few months or years. After removal, the feature or capability will no longer work. This notice is to allow you sufficient time to plan and update your code before the feature or capability is removed.

## Deprecation of support for personal Microsoft service accounts in Power Automate

Starting May 27, 2025, support for personal Microsoft service accounts will be deprecated in Power Automate. This deprecation will end July 26, 2025. To continue using Power Automate, users must perform the procedure in the [Replacement feature](#replacement-feature) section before deprecation ends.

Power Automate for desktop won't be affected and will continue to work with personal email accounts.

### Why is this needed?

The deprecation of personal accounts in Power Automate is aimed at enhancing security and aligning the platform with professional, enterprise-grade standards. Work or school accounts offer the robust authentication, enterprise-level security, and advanced functionality needed to ensure a seamless and secure experience for managing automation workflows in modern environments. This transition reflects a commitment to delivering a more reliable and focused tool for professional use.

### Impact

After deprecation ends, Microsoft service account users will experience the following changes:

- Users can't log into the Power Automate portal or mobile app with personal email accounts, such as gmail.com or outlook.com.
- Users can't create, edit, or manage cloud flows on the portal or mobile app.
- Access to any cloud flows associated with Microsoft service accounts are permanently removed, and these cloud flows are deleted.

### Replacement feature

To continue using Power Automate, we recommend that you transition to the Power Apps Developer Plan. This transition provides access to modern features and allows for seamless management of your workflows. The Power Apps Developer Plan includes flow creation and integration with Microsoft Dataverse, making it an excellent option for automation enthusiasts and professionals.

1. If you don't have a [trial Azure account](https://azure.microsoft.com/pricing/purchase-options/azure-account), create one.
1. Using the Azure account you just created, [set up a new Microsoft Entra tenant](/entra/identity-platform/quickstart-create-new-tenant).
1. Using the Azure account and Entra tenant you set up in this procedure, create a [Power Apps developer environment](developer/create-developer-environment.md).

    Learn more about capabilities in [About the Developer Plan](developer/plan.md).

1. [Export your cloud flows](/power-automate/export-import-flow-non-solution#export-a-flow-package) created using your Microsoft account.
1. [Import the cloud flows you exported](/power-automate/export-import-flow-non-solution#import-a-flow) in the previous step into the newly created Power Apps developer environment.

## Deprecation of SQL server connector's V1 actions

The [SQL server connector's V1 actions](/connectors/sql/#migrate-v1-operations-to-v2-equivalent) are being retired and starting 30 June 2025 these actions will no longer be supported and will be disabled.

We have V2 actions already available in the SQL server connector which can be used as an alternative. You can find more details about the new V2 actions here: [SQL server actions](/connectors/sql/#migrate-v1-operations-to-v2-equivalent). We strongly encourage you to migrate to the new V2 actions as soon as possible to take full advantage of these improvements.

### How does this affect me?

If action isn't taken, beginning 30 June 2025, the application(s) using the V1 actions of SQL server will be impacted and might no longer function as expected.

### Required action

Please make sure you replace the V1 actions with the new V2 actions of the SQL server connector in all of the applications utilizing it. If you need assistance in Migrating V1 operations to V2 equivalent. Please check here: [SQL server actions](/connectors/sql/#migrate-v1-operations-to-v2-equivalent)

## Deprecation of rich text editor classic experience

Starting April 18, 2025, the classic rich text editor experience will be deprecated and no longer supported in Dynamics 365 apps. The new, modernized rich text editor is the default experience, and customers who use the classic experience will be upgraded automatically. Learn more in [Modern text editor enhancements](/power-apps/maker/model-driven-apps/rich-text-editor-control#modern-text-editor-enhancements).

## Deprecation of Cards for Power Apps

Effective August 29, 2025, [Cards for Power Apps](/power-apps/cards/overview) will be deprecated and no longer supported. As a result, any Cards for Power Apps that have been built and shared in Microsoft Teams won't function. Users won't be able to create new cards or execute existing ones.

We recommend migrating any functionality you rely on from Cards for Power Apps before the deprecation date. Consider transitioning to either [Adaptive Cards in Copilot Studio](/microsoft-copilot-studio/guidance/adaptive-cards-overview) or [adaptive cards for Microsoft Teams](/power-automate/overview-adaptive-cards) for similar functionality.

## Deprecation of Train with examples to transform examples to Power Fx formulas

Effective February 19, 2025, the **Train with examples** feature to transform examples to Power Fx formulas is deprecated and no longer supported. We recommend using [Transform natural language to Power Fx formulas](/power-apps/maker/canvas-apps/power-apps-ideas-transform).

## Deprecation of Snowflake connector [Deprecated]

The [Snowflake (Deprecated)](/connectors/snowflakepa/) connector will be discontinued on May 26, 2025. A new and improved version with more features is now available. For more details, visit the new [Snowflake (Preview)](/connectors/snowflakev2/) connector reference article. We strongly encourage you to switch soon to take advantage of the upgrades.  

## What action do I need to take?

Make sure you replace your existing connections of the deprecated Snowflake connector with the new [Snowflake (Preview)](/connectors/snowflakev2/) connector in all of the applications utilizing this connector. If you need assistance in replacing your connections in Power Automate Flows or Power Apps, please refer to the below following documentation:

- [Manage connections in Power Automate - Power Automate | Microsoft Learn](/power-automate/add-manage-connections)
- [Manage connections in canvas apps - Power Apps | Microsoft Learn](/power-apps/maker/canvas-apps/add-manage-connections)

### Impact 
If action isn't taken by May 26, 2025, the application(s) utilizing [Snowflake (Deprecated)](/connectors/snowflakepa/) connector will no longer function as expected.

## Deprecation of Ask a virtual agent

Effective March 11, 2025, the **Ask a virtual agent** feature in Power Apps is deprecated and no longer supported. We recommend using [Copilot in Power Apps](/power-apps/maker/canvas-apps/ai-overview) for assistance when creating an app. For general help in Power Apps, select **Help** (question mark icon in the upper right) > **Support** > **Problem**.

## Deprecation of bring-your-own-key (BYOK) Dataverse service

Starting January 6, 2026, we will discontinue support for the bring-your-own-key (BYOK) feature. Customers are encouraged to transition to [customer-managed keys (CMK)](admin/customer-managed-key.md), an enhanced solution that offers improved functionality, broader support for data sources, and better performance.

### What happens if migration isn't completed?

Effective June 1, 2025, customers will be unable to apply BYOK to production environments.

If your migration to CMK isn't completed by January 6, 2026, your environment will automatically revert to Microsoft-managed keys. While this ensures continuity of encryption, it limits the control and flexibility you currently enjoy with BYOK. To avoid disruption and take full advantage of the enhanced features and security offered by CMK, we strongly recommend beginning your migration process as soon as possible.

We recommend starting your transition to CMK (customer-managed keys) at your earliest convenience. For more information, go to [Manage your customer-managed encryption key](admin/customer-managed-key.md) and [Migrate bring-your-own-key (BYOK) environments to customer-managed key](admin/cmk-migrate-from-byok.md).

## Deprecation of Organization Insights Dashboard

The Organization Insights dashboard has been deprecated from the Microsoft Power Apps Default Solution dashboards. Similar organization insights are available in [Microsoft Dataverse analytics](admin/analytics-common-data-service.md).

As part of a service update to enhance security in Power Apps, we're removing Highcharts version 4.2.3.

## Deprecation of support for multitenant apps without a service principal in the Microsoft Entra ID tenant

To boost security and system performance, we're updating authentication protocols for multitenant apps in the Dataverse platform. Starting October 2024, app-only tokens for apps without a service principal in the target tenant aren't supported. This change is essential for mitigating vulnerabilities and safeguarding your data from potential threats.

### Why is this needed?

[Multitenant apps](/entra/identity-platform/single-and-multi-tenant-apps/) that don't have a client service principal have been recognized as vulnerable. They pose a significant risk of acquiring cross-tenant, open authorization (OAuth) app-only tokens for multitenant services across arbitrary tenants. To address this security vulnerability, apps without a service principal in the tenant are no longer authenticated. Dataverse APIs fail from these apps in deprecated environments.

### Impact

Token generation for multitenant apps fail if the service principal for that app isn't present in the target tenant.

### Action required by you

To ensure the security and integrity of your system and data, we encourage customers to provision the multitenant apps in their Microsoft Entra ID tenant. Learn more in [Create an enterprise application from a multitenant application](/entra/identity/enterprise-apps/create-service-principal-cross-tenant?pivots=msgraph-powershell). 

> [!NOTE]
> If application onboarding isn't expected, remove that app or replace it with a compliant app that has a client service principal in the tenant.
>
> Make sure that the access token being acquired is from your tenant endpoint (`https://login.microsoftonline.com/{yourtenant}`), not your organization endpoint (`https://login.microsoftonline.com/organizations`).

### When is this change coming into effect?

Support for app-only tokens by multitenant apps that don't have a service principal ID in the Target Tenant will be removed by October 2024.

## Deprecation of hierarchy control in model-driven apps

Effective October 2024, the hierarchy control, which is used to define and query hierarchically related data in model-driven apps, is deprecated. The control will continue to work in existing apps until October 2025, at which time it will be removed from the product.

The hierarchy control allows users to visualize relationships between records for a table. This is applicable for any table that has a self-referential relationship.

### Why is this needed?

Due to low usage, issues with accessibility, and incompatibility with the modern look, the hierarchy control will no longer be supported.

### Impact

After its removal, end users won't be able to view the visual representation of the hierarchical relationships of records.

### Action required by you

You can temporarily enable the control until its removed in the product by editing the app settings. Go to Power Apps (make.powerapps.com) and open the app you want for editing. Then go to **Settings** > **Features** tab and enable the **Enable the "View hierarchy" capability** setting.

This feature will be fully removed October 2025.

If the hierarchy view is essential to your app, a custom PCF control that handles the hierarchy view must be created and deployed. For information about how to create a code component, go to [Create and build a code component](/power-apps/developer/component-framework/create-custom-controls-using-pcf).

## Deprecation of schema for DLP activity logging

The schema DLP activity logging is deprecated and won't be available starting in July 2024. You can use the new schema available at [Activity category: Data policy events](admin/admin-activity-logging.md#activity-category-data-policy-events).

## Deprecation of schema for Lockbox audit events

The schema for Lockbox audit events is deprecated and won't be available starting in July 2024. You can audit Customer Lockbox events using the new schema available at [Activity category: Lockbox operations](admin/admin-activity-logging.md#activity-category-lockbox-operations).

## ISV Studio removed

ISV Studio was a preview analytics portal that showed limited install data for ISV solutions built on Dynamics CE or Power Platform and deployed from AppSource. It also provided another access point to the connector certification wizard.  

Thanks to our ISV partners for trying out ISV Studio during the preview. After careful consideration and extensive review of partner feedback, we recognized the limitations of the service over time and acknowledged that it didn't provide the expected value. ISV Studio was deprecated on April 1, 2024 and removed on May 31, 2024.

To continue accessing analytics related to your AppSource solutions, use the reporting features in Partner Center. Although this alternative might not offer the same data from ISV Studio, Partner Center serves as a valuable resource for insights and tools to empower your business growth and success.

## Connector Certification Portal Deprecation

The Connector Certification Portal was a preview portal that allowed partners to submit and certify connectors created using the Power Query SDK. Once certified, these connectors would ship in products such as Power BI Desktop, On-Premises Data Gateway and Power Query Online in general.

After careful consideration, and thanks to the feedback from partners, a decision was made to decommission the portal starting January 15, 2025.

While the portal will be decommissioned, the program will continue. For the latest information on the status of the program and how to certify your connector, learn more about the [Data Factory Connector Certification](/fabric/data-factory/connector-certification).


## DLP resource exemption feature

Effective March 2024, the data loss prevention (DLP) [resource exemption feature](/admin/dlp-resource-exemption.md) is deprecated for tenants that never used it. By October 2024, the resource exemption feature will be deprecated for all customers.

## Activity Editor was removed in model-driven apps

As part of a service update designed to improve security within Power Apps, we removed the deprecated Activity Editor control, and recommend the use of the [rich text editor control](/power-apps/maker/model-driven-apps/rich-text-editor-control). This change rolled out in January and February 2024.

Learn more about [adding the rich text editor control to a model-driven app](/power-apps/maker/model-driven-apps/rich-text-editor-control). If you're using the Activity Editor control in a customized email or appointment experience in a model-driven app, learn more about [switching to the rich text editor control](/dynamics365/customer-service/administer/customer-service-hub-user-guide-email-font-admin#enable-the-rte-control-in-the-email-form).

## Classic app, form, and view designers are deprecated

Starting in October 2023, the classic app, form, and view designers are deprecated, by default. This means that, by default, all model-driven apps, forms, and views only open via the modern designers. By default, the **Switch to classic** option to revert back to the classic designers from the modern designers is no longer available.

### Impact

Depending on your geographic location and rollout cadence, this change impacts you in mid-October 2023. Makers have to reach out to their admin to access the classic designers.

### Re-enabling the classic designers

Admins can turn the **Switch to classic** option back on in the Power Platform admin center for specific environments. The modern app, form, and view designers are at core feature parity with the deprecated classic designers. As such, makers are expected to fully transition to use only the modern designers to build model-driven apps and components. More information: [Manage behavior settings](admin/settings-behavior.md)

## Dynamics 365 for phones and tablets will be deprecated for online users and replaced by Power Apps

Effective April 2024, Dynamics 365 for phones and tablets (iOS and Android) are deprecated for online users. Online users must [migrate to the Power Apps mobile app](/dynamics365/mobile-app/migration). The Power Apps mobile app provides updated capabilities, a modern user experience, and fast load times.

## Deprecation of support of unregistered MSA and External Microsoft Entra users in Dataverse

As part of our ongoing efforts to enhance the security and performance of Dataverse platform, we're announcing deprecation of support to unregistered MSA and externals Microsoft Entra users in Dataverse due to its relative obscurity and complexity associated with this feature in authorization scenario.

### What's changing?

If [Microsoft Accounts (MSA)](/azure/active-directory/external-identities/microsoft-account) or [Microsoft Entra accounts](/azure/active-directory/external-identities/default-account) aren't registered in your Microsoft Entra tenant, you can't access Dataverse on the common endpoint. 

You might see an error message similar to this one:

*Microsoft EntraSTS50020: user account `<contoso@contoso.com>`; from identity provider `https://sts.windows.net/{tenant ID}/` doesn't exist in tenant '{tenant name}' and can't access the application '{application ID}'(Dataverse org name) in that tenant.* 

The account must be added as an external user in the tenant. Sign out and sign in again with a different Microsoft Entra user account. Previously, Dataverse denied access to these accounts, but now they're blocked at the Microsoft Entra tenant level. This change doesn't affect [GDAP](/partner-center/gdap-introduction) or CSP users.

### What do you need to do?

If a user who isn't part of your Microsoft Entra ID needs access to a Dataverse organization, the user needs to be added to the tenant as an external user or guest user. Learn more in [Add B2B collaboration users in the Microsoft Entra admin center](/azure/active-directory/external-identities/add-users-administrator). Additionally, you can restrict access to the Dataverse organization by reviewing the access granted to external users by following the steps below.

**Disable sharing apps with everyone:** You can assess if sharing applications with everyone (including guests) is a requirement for cross-team collaboration. If it isn't, then you can disable sharing with everyone using the following PowerShell script:

```powershell
$tenantSettings = Get-TenantSettings
$tenantSettings.powerPlatform.powerApps.disableShareWithEveryone = $true
Set-TenantSettings $tenantSettings
```

**Disable guests from making apps:** You can review if guests making apps in your organization are required. You can disable it if guests aren't expected to be makers (such as, customizing SharePoint forms). This option already defaults to `$false`.

```powershell
$tenantSettings = Get-TenantSettings
$tenantSettings.powerPlatform.powerApps.enableGuestsToMake = $false
Set-TenantSettings $tenantSettings
```
  
### When is this change coming into effect?

We removed support of unregistered MSA and external Microsoft Entra users in the Dataverse in **October 2023**.

<a name="#jquery-211-to-be-removed-in-model-driven-apps" ></a>

## jQuery 2.1.1 was removed in model-driven apps

As part of a service update designed to improve security within Microsoft Power Apps, we removed jQuery version 2.1.1 from model-driven applications. One year after announcing the plan to remove this library, in October 2023 we removed the library located here: `/_static/_common/scripts/jquery-2.1.1.min.js`.

If custom code in web resources had a dependency on this library, it stopped working when this library was removed. This was unsupported pattern as use of any model-driven application client-side code isn't supported, including libraries that model-driven apps depend on. These libraries might change without warning. More information: [Unsupported customizations](/power-apps/developer/model-driven-apps/supported-customizations#unsupported-customizations).

### Are you impacted?

Now that the library is removed, you'll see errors in any web resources that depended on this library.
You can search your web resource code for this line: `/_static/_common/scripts/jquery-2.1.1.min.js`.

If your code isn't already in a source code repository, you should export your solutions and extract the contents. There are many tools you might use to search the contents. For example, you can use the search capabilities of Visual Studio Code. More information: [Visual Studio Code: Basic Editing > Search across files](https://code.visualstudio.com/docs/editor/codebasics#_search-across-files)

### What to do if you're impacted?

If your web resources had a dependency on this library, you should replace the reference with a newer version of JQuery.

Note, there might be breaking changes between versions. For information about upgrading, see [jQuery Core Upgrade Guides](https://jquery.com/upgrade-guide/).

Choose one of these options:

- Create a new JavaScript web resource with the minified version of jQuery. The library is available here: [jQuery Core – All Versions](https://releases.jquery.com/jquery/). More information: [Create or edit model-driven app web resources to extend an app](/power-apps/maker/model-driven-apps/create-edit-web-resources).
- Locate the URL of a CDN for a newer version of jQuery. For example: [jQuery-libraries-cdnjs](https://cdnjs.com/libraries/jquery).

Replace the reference to `/_static/_common/scripts/jquery-2.1.1.min.js` with the name of the web resource you created or the URL to the CDN resource with a newer version of jQuery.

## AI Builder image classification model by Lobe is deprecated

Effective January 2023, the image classification model by Lobe (preview) was deprecated.

The model allowed you to quickly create and train models to classify images into different categories. This was useful for classifying objects in images, such as animals, plants, and vehicles. The deprecation of this capability was needed because the model wasn't aligned with other models in AI Builder, which offer an in-browser training and model usage experience. These other models don't require a download and install.

The impact of the deprecation of this capability is that you'll no longer be able to use the model to classify images and you won't be able to download the Lobe application. Models built with Lobe might continue to work and serve their purpose, but they won't be supported by the AI Builder team. Your Lobe installation might also continue to function, but won't be supported.

 If you're impacted by the deprecation of this feature, you can use other methods to classify images, such as [Azure Cognitive Services for Custom Vision](/azure/cognitive-services/Custom-Vision-Service/overview). Custom Vision is a cloud-based image classification service that enables you to quickly and easily create custom image classifiers. With Custom Vision, you can upload your own images and label them with the categories you want the model to recognize. The service then uses machine learning to train a custom model that can accurately identify the categories in new images. The service also provides a range of tools to evaluate and improve your models, such as testing accuracy and providing feedback on how to improve the model. You can also create custom image classifiers that can be used for a variety of applications, such as object recognition, facial recognition, and more.

## Model-driven app controls deprecation

Effective January 2023, the following controls for model-driven apps are deprecated: autocomplete, input mask, multimedia player, number input, and star rating.

### Why is this needed?

We'll be introducing new Fluent UI controls that have better usability, accessibility, and dark mode support.

### Impact

- Starting April 2023, these controls can no longer be added to forms.
- No more support or fixes will be provided on these controls after April 2024.

### Action required by you

Evaluate existing forms that include a deprecated control and replace them with a newer control.

## Microsoft Dataverse (legacy) connector for Power Automate flows is deprecated

Effective October 2022, the [Microsoft Dataverse (legacy)](/connectors/commondataservice/) connector (previously referred to as the CDS 2.0 connector) is deprecated. The connector will continue to work in existing flows until a final date is announced. You'll have one year from the date of announcement to move to the [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector.

### Why is this needed?

The [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector has replaced the [Microsoft Dataverse (legacy)](/connectors/commondataservice/) as the main connector for automating data, events, and actions in Microsoft Dataverse. It provides more actions, triggers, and improvements to working with Dataverse, including better reliability and faster performance when used in the same Power Platform environment.

### Impact

Cloud flows that use the [Microsoft Dataverse (legacy)](/connectors/commondataservice/) connector need to be updated to use the [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector instead.

### Action required by you

Review the cloud flows you own that use the [Microsoft Dataverse (legacy)](/connectors/commondataservice/) connector and identify which are ready to update. As of January 2024, most flows using the legacy connector are recommended for migration with the exception of flows triggering based on changes in other environments.

A migration assistant is available on the detail page of cloud flows that are able to be automatically updated. The assistant creates a copy of the flow with the legacy connector's triggers, actions, and dynamic content references replaced.

## Microsoft Dataverse (legacy) connector for Azure Logic Apps will be deprecated and replaced with another connector

Effective October 2022, the [Microsoft Dataverse (legacy)](/connectors/commondataservice/) connector (also referred to as the CDS 2.0 connector) was deprecated. This connector was used to connect to Dataverse for use in multiple clients and components. The [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector was made available for use in Azure Logic Apps starting August 2022. The Dataverse connector provides both legacy triggers and actions and new preview triggers and actions for the newest connector. Dates for when previews will be generally available will be provided by November 2023.

There will be a phased-in approach before deprecation takes place. Here's the timeline:

- **August 30, 2022:** The actions and triggers in Dataverse legacy connector became available in the Dataverse connector.
  - Existing Dataverse Legacy connector triggers and actions can continue to be used in existing logic apps for backward compatibility for a period of time with more timelines available in August 2023.
  - All new logic apps will be created using the new actions.
- **August 2022 through preview period:** Both new and legacy actions and triggers will be available during new flow creation. By January 2024, a date for the move to general availability will be provided.
- **Date TBD:** No new logic apps can be created using the legacy actions and triggers, but existing logic apps with those actions and triggers will continue to work. Updates will be provided in January 2024.

In August 2023, we provided a timeline when all existing logic apps using the deprecated legacy actions and triggers will stop working. Users need to review their existing logic apps to update them to the new Azure Logic Apps triggers by the specified timeline (typically one year from the announcement date).

## Internet Explorer 11 support for Dynamics 365 and Microsoft Power Platform is deprecated

Dynamics 365 and Microsoft Power Platform will be blocked in Internet Explorer starting October 31. From early October 2022, users will be redirected to Microsoft Edge if they have Microsoft Edge currently installed on their device. Otherwise, they'll receive a nondismissible message informing them why they're blocked and to try using the site on Microsoft Edge. Starting October 31, Internet Explorer will be blocked on Dynamics 365 and Microsoft Power Platform and users will see a blocking message informing them to use Microsoft Edge. If users are trying to access Dynamics 365 and Microsoft Power Platform on a Microsoft Edge version that is no longer supported, they'll be prompted to use the latest version of Microsoft Edge.

We recommend that customers transition to [Microsoft Edge](https://www.microsoft.com/edge).

We recommend Dynamics 365 App for Outlook users that are using the Outlook desktop client upgrade their clients to Microsoft Outlook versions that use Microsoft Edge WebView2 or  Microsoft Outlook on the web (OWA).

More information: [Support end for Internet Explorer](admin/support-end-internet-explorer.md).

If you have more questions, contact your Microsoft Customer Service representative or Microsoft Partner.

## The legacy read-only grid in model-driven apps is deprecated

The legacy read-only grid control has been deprecated in model-driven apps with the 2022 release wave 1. This control is being replaced by the **Power Apps read-only grid**, which became the default read-only grid experience for all environments for model-driven apps with the 2022 release wave 1.  

### Why is this needed?

The legacy read-only grid:

- Doesn't support the latest Microsoft accessibility standards.
- Doesn't align with the latest in Microsoft design guidance.
- Has limited extensibility options.

### Impact

Tables configured to use the *Read-only Grid (Default)* control are replaced with the *Power Apps read-only grid* for views and subgrids. This change started with the 2022 release wave 1.

When the Power Apps read-only grid is originally enabled, the jump bar row isn't visible; however, makers can re-enable this as needed. More information: [Configure the Power Apps read-only grid control](/power-apps/maker/model-driven-apps/power-apps-grid-control#configure-the-power-apps-read-only-grid-control)

## Dynamics 365 (Preview) app for Windows is deprecated

The Microsoft Dynamics 365 (Preview) app for Windows was deprecated on June 20, 2022. The app is no longer supported.  

You can still run your Dynamics 365 apps on Powers Apps for Windows with the same set of features and capabilities. For more information, see [Install Powers Apps for Windows](/power-apps/mobile/windows-app-install).

## Admin mode custom message deprecated

Effective July 1, 2022, the Custom message field is deprecated from the environment Edit details page.

## Power Apps for Windows 8 will be deprecated and replaced with a new app

Effective September 2022, [Power Apps for Windows 8](https://apps.microsoft.com/store/detail/power-apps/9NBLGGH5Z8F3?hl) will be deprecated. Microsoft will continue to provide security and other critical updates for the app until Sept 20, 2022. We won't release any other features or functionalities for the app.

After Sept 20, 2022, Power Apps for Windows 8 will be removed from the Microsoft Store, and will no longer be supported.

On June 20, 2022 [Power Apps for Windows](https://apps.microsoft.com/store/detail/power-apps-preview/9MVC8P1Q3B29?hl) will be available. For more information about the new app, see [Install Powers Apps for Windows](/power-apps/mobile/windows-app-install).

## Data Export Service deprecation

Effective November 2021, Data Export Service was deprecated. Data Export Service will continue to work and will be fully supported until it reaches end-of-support and end-of-life in November 2022. This will impact Dynamics 365 and Power Platform customers who use Data Export Service add-on from Microsoft AppSource. The Data Export Service add-on won't be available for download for all customers. We recommend that customers transition to [Azure Synapse Link for Dataverse](/powerapps/maker/data-platform/export-to-data-lake). For more information, see our [blog](https://powerapps.microsoft.com/blog/do-more-with-data-from-data-export-service-to-azure-synapse-link-for-dataverse/) or download [the deprecation playbook](https://aka.ms/DESDeprecationPlaybook).

## Dataverse OData v2.0 Service removal

We plan to remove the Organization Data Service. Any code that uses the Organization Data Service should be migrated to use the Web API before that time.

The original removal date was November 11, 2022, but this was extended to April 30, 2023. We have decided not to remove the service on April 30, 2023.

We're going to defer the removal of this service to allow people more time to complete the transition of their code to use the Web API. If you have detected that you're still using this endpoint, you must prioritize transitioning this code to use Web API so you'll be prepared when the final removal date is announced.

> [!NOTE]
> This announcement doesn't involve the deprecated SDK for .NET SOAP endpoint. At this time, no date has been announced for the removal of the SOAP endpoint.

The Organization Data Service is an OData v2.0 endpoint introduced with Dynamics CRM 2011. The Organization Data Service was deprecated with Dynamics 365 Customer Engagement v8.0 in favor of the Web API, an OData v4.0 service. Today, less than .06% of requests to Dataverse use this endpoint. Removing this endpoint will enable Dataverse to improve overall performance.

More information: [OData v2.0 Service removal date announcement](https://aka.ms/DataverseODataV2EndpointRemoval).

## Support for Microsoft 365 Groups and Yammer in Dynamics 365 is deprecated

Effective February 2022, support for Microsoft 365 Groups (previously known as Office Groups) and Yammer in Dynamics 365 will be deprecated. This will impact customers who use Microsoft 365 Groups and/or Yammer for collaboration in Dynamics 365. We recommend that customers transition to Microsoft Teams for more advanced collaboration functionalities. For information about integrating Dynamics 365 with Teams, see [Integrate customer engagement apps in Dynamics 365 with Microsoft Teams](/dynamics365/teams-integration/teams-integration).

Existing customers can create teams from their existing Microsoft 365 Groups and map them to individual records as per the requirements. They can also continue to use Microsoft 365 Groups but have a custom experience to host it inside Dynamics 365.

If you have questions about the deprecation, contact your Microsoft Customer Service representative or Microsoft Partner.

## Support for viewing and managing application users in legacy web client is deprecated

Effective February 2022, the list of "Application Users" won't be available under **Advanced Settings** > **Security** > **Users**. You can use the Power Platform admin center to view and manage application users. See [Manage application users in the Power Platform admin center](admin/manage-application-users.md).

## The Analyze section, in mobile offline profiles is deprecated

Effective September 2021, the **Analyze** action and the **Offline profile** report that is used to configure mobile offline profiles is deprecated.
The Analyze feature is being removed because of Cross-Site Scripts (XSS) vulnerabilities. The report is used to identify components that aren't available when you're working in offline mode. The capabilities will be reimagined as part of the ongoing enhancements of the mobile offline configuration experience. There's no action required by you.

## Dynamics 365 - Gamification is deprecated

Effective April 1, 2021, Dynamics 365 – Gamification is deprecated. Until September 30, 2021, Microsoft provided limited support for this solution. From October 1, 2021, the Dynamics 365 – Gamification solution won't be functional. To uninstall Gamification, delete the **GamificationUpdater** and **Gamification** solutions from the Dynamics 365 organization. Note that you must first delete the **GamificationUpdater** solution followed by the **Gamification** solution. More information: [Delete a preferred solution](/previous-versions/dynamicscrm-2016/administering-dynamics-365/dn878909(v=crm.8)#Delete%20a%20preferred%20solution).

## Skype integration with customer engagement apps is deprecated

Effective July 2019, Skype integration feature with customer engagement apps has been deprecated and is no longer supported after July 31, 2021. Skype is retired on July 31, 2021; more information: [Skype for Business Online retirement - Microsoft Teams](/microsoftteams/skype-for-business-online-retirement)

The presence indication backed by Skype for Business will no longer function. This deprecation includes presence indication in hover cards, lookup fields, and lookup columns in grids. There are currently plans to support these locations via Teams. In the meantime, presence indication can be found in Live Person Cards.

Plan to transition to Microsoft Teams, because the Team's capabilities go beyond those of Skype for Business Online. Teams is the next chapter in enterprise communication solution from Microsoft.

## Low-density headers in model-driven apps won't be supported with the 2021 release wave 2

With the upcoming 2021 release wave 2 (public preview in August 2021 and GA in October 2021), the low-density header option, and runtime experience won't be supported in model-driven app forms.

### Why is this needed?

- Makers have moved away from low-density headers and usage is low.
- Low-density headers don't promote a highly dense experience and require users to always use the flyout for all controls across view-port sizes from small to very-wide.

### Impact

Any current form that is configured to be "low-density" is automatically updated to render in a [high density with flyout](/powerapps/maker/model-driven-apps/form-designer-header-properties#high-density-header-flyout) mode in a model driven app. Below is an example of high-density header with flyout:

> [!div class="mx-imgBorder"]
> ![Header flyout with high-density header.](media/form-header-flyout-high-density.png "Header flyout with high-density header")

### Action required by you

To meet the October 2021 deadline, be sure you update any of your forms from a low-density format to a high density with flyout mode using the modern form designer. More information: [Configure header density](/powerapps/maker/model-driven-apps/form-designer-header-properties#configuring-header-density).

If you don't make this change, the form no longer honors this setting at runtime. It also defaults to high density with flyout.

## Form footers in model-driven apps won't be supported with the 2021 release wave 2

With the upcoming 2021 release wave 2 (public preview in August 2021 and GA in October 2021), form footers won't be supported in a model-driven app form.

#### Why is this needed?

- The footer doesn't meet the Microsoft [Web Content Accessibility Guidelines (WCAG) 2.0](/compliance/regulatory/offering-WCAG-2-1) compliance for accessibility.
- Data density is highly impacted by the form footer and doesn't support a good customer experience. Controls aren't discoverable and lead to many customer usability issues.
- Makers have moved away from adding controls into the footer and there's low usage of other controls, out of box or custom, in the current form footer experiences.
- Components created using Power Apps component framework aren't fully compatible with form footers, which cause usability issues when added to a form footer.
- Form footers aren't included in the mobile experience or on the view and dashboard pages.  This change will align the form experience with other pages in a model-driven app.

#### Impact

Main forms will no longer include the footer when a record is opened. Any out of box or custom controls that have been added to the form footer will no longer be available and you'll need to remove the fields if they're no longer necessary or move the fields to the header and use the [high-density header with flyout](/powerapps/maker/model-driven-apps/form-designer-header-properties#high-density-header-flyout) or add them onto the main form. The recommended approach is to move fields that users need to access regardless of the form tab a user is on to the header and set it to use the [high-density header with flyout](/powerapps/maker/model-driven-apps/form-designer-header-properties#high-density-header-flyout).  If there's only one tab, the recommendation is to move them into a new section on the form.

#### Action required by you

- To meet the October 2021 deadline, be sure you move fields or controls added to a form footer to either the header or a section on the form.
- If you do nothing, the footer fields or controls that you've added no longer render on the form and aren't available to users.

The out of box fields currently on the footer is removed and included on the form as part of the 2021 release wave 2 updates. So, you don't lose status, unsaved changes, or the option to open a form in a new window. The **Save** option is already available in the command bar and is always visible to the user.

While we understand that these types of changes can be disruptive for makers that use the footer today, we always evaluate the experiences. We do this to ensure they provide a modern experience that improves usability, support accessibility requirements, and improves discoverability for highly used fields and controls on a page.

## Model-driven app controls deprecation (2021 Release Wave 1)

With the upcoming 2021 release wave 1 (public preview in February 2021 and GA in April 2021), some older controls for model-driven apps will be deprecated. These controls include Flip Switch, Calendar Control (V1), Linear Slider, Radial Knob, Arc Knob, Linear Gauge; along with the Website Preview control, MultiSelectPicklistControl (V1), and the Flip Label (two radio buttons format option).

#### Why is this needed?

- These controls are outdated and don't conform to our current standards for useability and accessibility.
- For example, we've received feedback that the Flip Label control is difficult to determine its intended use and users commonly don't see the options available to choose from, such as "yes / no" or "enable / disable."

#### Impact

- Starting April 2021, these controls can no longer be added to forms.
- For instances of Flip Label control, the control will be replaced with a dropdown control.
- For all other controls, they'll continue to work within existing forms until April 2022.

#### Action required by you

We won't make other changes to forms or controls.  Makers are encouraged to make updates:

- Use the Toggle control as a replacement for Flip Label and Flip Switch.
- Use the Calendar Control (V2) as a replacement for Calendar Control (V1).
- Evaluate other deprecated controls to determine if they're still useful within existing forms.

## Microsoft Dynamics 365 Email Router is deprecated

The Email Router was deprecated on July 17, 2018 and it will no longer function starting April 12, 2021. Although the Email Router might still have worked with Dynamics 365 on-premises, this configuration is no longer supported. All email routing functionality should be migrated to use server-side synchronization. For information on migrating email routing functionality to use the server-side synchronization feature, see: [Migrate settings from the Email Router to server-side synchronization](/previous-versions/dynamicscrm-2016/administering-dynamics-365/dn832114(v=crm.8)).

## The Microsoft Dynamics 365 application for Windows is deprecated

Effective April 2021, the [Microsoft Dynamics 365 app for Windows](https://go.microsoft.com/fwlink/?linkid=838618) that lets you run customer engagement apps (such as Dynamics 365 Sales, Dynamics 365 Customer Service, and Dynamics 365 Marketing) has been deprecated.

Microsoft continues to provide security and other critical updates for the Microsoft Dynamics 365 app for Windows until January 29, 2021. We won't release any other features or functionalities for the app. After April 1, 2021, the app is removed from the Microsoft Store, and is no longer supported.

We recommend that you start using your web browser as soon as possible to run your customer engagement apps, such as Dynamics 365 Sales, Dynamics 365 Customer Service, and Dynamics 365 Marketing. Run them on Windows to take advantage of the ongoing improvements for the web app.

## Organization data download filters for mobile offline are deprecated

Effective February 2021, **Organization data download filter** option that filters the data when you set up mobile offline are deprecated. We recommend that you start preparing your organization and move relevant data filters from **Organization data download filter** to the offline profile option, which lets you determine what data is available when users work in offline mode. For more information, see [Create a mobile offline synchronization](/dynamics365/mobile-app/preview-setup-mobile-offline#step-2-create-a-mobile-offline-profile-to-determine-what-data-will-be-available-while-offline). Once the old filter criteria have been moved to offline profile, you can clear or delete the filters set in **Organization data download filter**.

## TLS RSA cipher suites are deprecated

Effective October 30, 2020, the following cipher suites are being deprecated from our servers.

- "TLS_RSA_WITH_AES_256_GCM_SHA384"
- "TLS_RSA_WITH_AES_128_GCM_SHA256"
- "TLS_RSA_WITH_AES_256_CBC_SHA256"
- "TLS_RSA_WITH_AES_128_CBC_SHA256"

Cipher suites are used to encrypt messages to secure a network connection between clients/servers and other servers. We're removing the above list of cipher suites to comply with our current security protocols.

Beginning March 1, 2021, customers can only use our [standard cipher suites](admin/server-cipher-tls-requirements.md). This change impacts your clients and servers that communicate with our servers, for example, syncing emails from your Microsoft Exchange server, running outbound plug-ins, using native (local) clients to access our servers.

Customers must upgrade their servers before March 1, 2021.  For more information about configuring TLS Cipher Suite order, see [Manage Transport Layer Security (TLS)](/windows-server/security/tls/manage-tls).

## Document suggestions for all entities except case are deprecated

Effective October 20, 2020, the document suggestions feature has been deprecated for all entities, except the case entity. The case entity is available with Dynamics 365 Customer Service. More information: [Enable document suggestions to recommend related documents](admin/enable-document-suggestions.md)

## Automatic record creation rules and SLA items in web client are deprecated

Effective October 1, 2020, the automatic record creation and update rules and service-level agreements (SLAs) have been deprecated in the web client. For more information, go to [Deprecations in Customer Service](/dynamics365/customer-service/deprecations-customer-service).

## TimeZoneRule entity and some attributes of TimeZoneDefinition entity are deprecated

Effective September 24, 2020, the `TimeZoneRule` entity and the `Bias` and `RetiredOrder` attributes of the `TimeZoneDefinition` entity are deprecated and will be removed in a future release. For all client-side time zone calculations, use the `LocalTimeFromUtcTime` and `UtcTimeFromLocalTime` functions in Web API or the [TimeZoneInfo](/dotnet/api/system.timezoneinfo) class in the .NET SDK. More information: [Blog: Deprecation of time zone entities in Microsoft Dataverse](https://powerapps.microsoft.com/blog/deprecation-of-time-zone-entities-in-common-data-service/)

## Online management API PowerShell module and REST API are deprecated

Effective August 26, 2020, the online management API PowerShell module, and the underlying [Online Management REST API] are  deprecated. The [online management API PowerShell module](/powershell/powerapps/get-started-onlinemanagementapi) will be updated in October 2020 to point to newer underlying APIs and won't receive further updates. We recommend that you use the Power Apps administration module. More information: [Get started using the Power Apps admin module](/powershell/powerapps/get-started-powerapps-admin)

## Company News Timeline solution is deprecated

Effective July 10, 2020, the [Company News Timeline](/dynamics365/company-news-timeline/get-company-news-timeline-dynamics-365-phones-tablets) solution, is deprecated. Until September 10, 2020, Microsoft will continue to provide support for the feature, but won't release any other functionality beyond what is already present. Starting September 10, 2020, you'll need to uninstall the solution, which will remove the news widget from the Account record pages.

1. To remove the solution, go to **Advanced settings** and select **Solutions**.
2. Select **CompanyNewsTimeline** and then select **Delete**.

As an alternative you can install news Power Apps component framework control. For more information, see [Set up and use the news control](/powerapps/maker/model-driven-apps/stay-current-with-news-control).

## Dynamic 365 Sales bot is deprecated

Effective June 2, 2020, the Dynamics 365 Sales bot, a feature that enables users to retrieve sales information through a bot within Dynamics 365 Sales app for Teams will be deprecated. Until July 31, 2020, Microsoft will continue to provide support for the feature, but won't release any more functionality beyond what is already present.  After July 31, 2020, you'll no longer be able to receive responses to conversations. The bot won't be available for new customers; existing customers may still be able to access the bot from the Chat, however the bot won't respond to questions.

It is our goal to deliver a powerful bot experience that allows users to retrieve and manage information. Based on usage data and feedback from our customers, we're working on a powerful, extensible set of capabilities and features that will allow you to intuitively access and interact with sales information—among other entities—through a bot interface. We'll keep you updated on timing for when this will be available.

## Dynamics 365 Connector is deprecated

Effective May 5, 2020, the [Dynamics 365 connector](/connectors/dynamicscrmonline/) used for data integrations, flows, Azure Logic Apps, and canvas apps is officially deprecated. We recommend that you don't create new connections using this connector.

### Impact

As of October 31, 2022, this connector was shut down for Power Automate flows and canvas apps using the Power Apps player in Windows. All flows and canvas apps must be migrated to the Microsoft Dataverse or Dataverse Legacy connector per recommended actions below.

As of October 31, 2022, this connector is in the process of shutting down for Logic Apps. You must migrate all Logic Apps  as soon as possible to the Microsoft Dataverse or Dataverse Legacy connector per recommended actions below.

You can't create new connections for data integrations using the Dynamics 365 connector. For these components, shut down is in progress. We recommend use of the Dynamics 365 connector be replaced with an option below as soon as possible.

This connector is shut down for new Power Automate flows; all newly created flows must use the [Microsoft Dataverse (legacy)](/connectors/commondataservice/) connector (also referred to as the CDS 2.0 connector) or the [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector.

Canvas apps can no longer use the Power Apps player in Windows. All Canvas apps must migrate to the new player.

### Behaviors that will be observed

#### Data integrator

- Dynamics 365 connector can't be selected for creating a new integration.
- Editing an existing integration won't be allowed, if you attempt to edit you'll be required to choose a different connector.

#### Power Automate

- Dynamics 365 connector can't be added to new or existing flows.
- Existing flows will continue to run until the final deprecation date.

#### Logic Apps

- Dynamics 365 connector can't be selected for creating a new Logic App.
- Existing Logic Apps will continue to run but must be migrated as soon as possible.
- You'll be able to edit an existing Logic App.

#### Canvas apps

The Windows Player for canvas apps will no longer be able to be used.

### Action required by you

You must replace usage of the Dynamics 365 connector with the Microsoft Dataverse connector.

- **Microsoft Dataverse**: This is the newest connector and the main connector available for Dataverse usage. All new features, performance work, and enhancements will be available on this connector. A

**Mapping of common actions**

|Action |Dynamics 365 | Dataverse Legacy  |Microsoft Dataverse |
|---------|---------|---------|---------|
|Create Trigger |When a Record is Created (deprecated) |When a row is added |When a row is added, modified, or deleted |
|Update Trigger |When a Record is Updated (deprecated) |When a row is modified |When a row is added, modified, or deleted |
|Delete Trigger |When a Record is Deleted (deprecated) |When a row is deleted |When a row is added, modified, or deleted |
|Create Action |Create a new record (deprecated) |Add a new row (legacy) |Add a new row (preview) |
|Update Action |Update a record (deprecated) |Update a row (legacy) |Update a row (preview)|
|Delete Action | Delete a record (deprecated) |Delete a row (legacy) |Delete a row (preview) |
|Retrieve Action |Get record (deprecated)|Get row (legacy) |Get a row by ID (preview) |
|Retrieve Multiple Action |List records (deprecated) |List rows (legacy) |List rows (preview) |

### Recommended action by usage

#### Data integrator

- All new integrations should be created with the Microsoft Dataverse (Legacy) connector.
- Dynamics 365 connectors should be replaced with the Microsoft Dataverse (legacy) connector. The Microsoft Dataverse connector isn't yet available.
- Data Integrations will need to be recreated in the Data Integrator using the Microsoft Dataverse (legacy) connector and then completing setup.

#### Logic Apps

- All new Logic Apps should be created with the Microsoft Dataverse connector. This connector includes legacy actions, and preview actions. Legacy actions are in GA. The preview action GA date will be announced in January 2024.
- Logic Apps using the Dynamics 365 connector are recommended to move to the Microsoft Dataverse (legacy) connector until the Microsoft Dataverse connector is available.
- Logic Apps will either need to be recreated to use the Microsoft Dataverse connector or be edited to change the Dynamics 365 connector to the Microsoft Dataverse connector and then validating all triggers and actions.

#### Canvas apps

If you're using the Power Apps Player to launch Power Apps in Windows, you'll need to switch over to Power Apps for Windows.

## AI Builder text classification models are deprecated

Effective April 24, 2020, any text classification models created using AI Builder before this date will be deprecated. Until May 15, 2020, these models will continue to function, and Microsoft will continue to provide support, however some functionality may be disabled. After May 15, 2020, these models will no longer work.

Beginning April 24, 2020, customers will need to recreate their existing text classification models with the new model versions. Any models created after this date will automatically use the new model versions and require no further action.

After April 24, 2020, customers are encouraged to transition to the new model versions as soon as possible.

## Dynamic 365 for Outlook is deprecated

Effective March 2020, the legacy Dynamics 365 for Outlook (also referred to as Outlook COM add-in) was deprecated, and is no longer available for customer engagement apps (Dynamics 365 Sales, Customer Service, Marketing, and Field Service). Use the modern [Dynamics 365 App for Outlook](/dynamics365/outlook-app/overview) instead.

[Dynamics 365 Customer Engagement (on-premises)](/dynamics365/customerengagement/on-premises/overview) users can continue to use the legacy Dynamics 365 for Outlook. However, we recommend that you transition to the modern Dynamics 365 App for Outlook at the earliest. For information and steps to make a smooth transition, download [Dynamics 365 for Outlook (COM add-in) Playbook](https://aka.ms/OutlookCOMPlaybook).

## Dynamics 365 Home is deprecated

Effective March 2020, the home page for Dynamics 365 applications (`https://home.dynamics.com`) is deprecated and won't be available on or after June 30, 2021. The Microsoft 365 apps page (<https://www.office.com/apps>) will replace it and provide users with a single page for productivity and business applications.  

Dynamics 365 Home users will see notification about the new location and recommendation to change browser bookmarks starting October 1, 2020. On or after June 30, 2021, users will no longer be able to navigate to `https://home.dynamics.com` from the Office 365 applications list or the Office 365 [application launcher](admin/quickly-navigate-office-365-app-launcher.md#quickly-move-between-apps-with-the-app-launcher). After June 2021, users who navigate to `https://home.dynamics.com` will see an error page.

More information: <https://aka.ms/business-apps-discovery-docs>  

## Form processing and object detection preview models in AI Builder are deprecated

Effective March 5, 2020, any form processing and object detection models created using AI Builder before this date will be deprecated. Until June 8, 2020, these models will continue to function, and Microsoft will continue to provide support, however some functionality may be disabled. After June 8, 2020, these models will no longer work.

Beginning March 5, 2020, customers will need to recreate their existing form processing and object detection models with the new model versions. Any models created after this date will automatically use the new model versions and require no further action.

After March 5, 2020, customers are encouraged to transition to the new model versions as soon as possible.

More information:

- [Transition to use a new form processing model version](/ai-builder/form-processing-transition)
- [Transition to use a new object detection model version](/ai-builder/object-detection-transition)

## Old Dataverse environment URL redirector service is deprecated

When you access your Dataverse environment for the first time or every time after you have signed out from a prior session, you're directed to Microsoft Entra ID signing in. In the sign-in page URL, it contains a set of internal values/codes that include a link to the URL redirector service. Upon successful login, the URL redirector service directs you to your Dataverse environment.

The old URL redirector service, cloudredirector.crm.dynamics.com, was replaced in September 2019 with the new one, bn1--namcrlivesg614.crm.dynamics.com (just an example; the URL will differ based on your environment region). The old URL redirector service is deprecated, and will be removed on **March 31, 2020**.

This change will impact you if you have created a bookmark of the sign-in page before September 2019 that contained the link to the old URL redirector service. The users impacted by this change will see a notification starting February 17, 2020, with instructions to resolve the issue.<!--this link doesn't exist - For detailed information about this issue and how to resolve it, see <https://support.microsoft.com/help/4541747>-->

## Deprecation of Office365 authentication type and OrganizationServiceProxy class for connecting to Dataverse

Effective February 4, 2020, the **WS-Trust** authentication type that is used by
custom clients to connect to Dataverse is deprecated. This change
affects applications that utilize
[Microsoft.Xrm.Sdk.Client.OrganizationServiceProxy](/dotnet/api/microsoft.xrm.sdk.client.organizationserviceproxy)
and
[Microsoft.Xrm.Tooling.Connector.CrmServiceClient](/dotnet/api/microsoft.xrm.tooling.connector.crmserviceclient)
classes for the authentication type of "Office365".

We're making this change to remove a security protocol (WS-Trust) that is
inherently insecure by current encryption standards. While Microsoft has worked
hard to protect users who choose to use this authentication type for
the convenience of login process, it has become an increasing source of concern
for Microsoft security and identity protection systems. The WS-Trust security
protocol, when used in conjunction with a user account and password, implements
an authentication flow that presents both the user ID and password to the
authenticating resource in 'clear text' form, relying solely on the transport
encryption to provide security for the initial leg of the authentication, until
such point as the token service returns an authentication token to use.
Additionally, the WS-Trust protocol doesn't support modern forms of
Multi-Factor Authentication and conditional access controls to customer data.

With this change, the intent is to guide developers away from this
authentication flow and help application developers to utilize the capabilities
of Microsoft Entra to secure and protect access to their applications and
customers in Dataverse.

To allow for transition of customers and partner applications:

- Effective October 2020, the authentication protocol will be retired for all new tenants.
- Effective October 2020, the authentication protocol won't be available in all new [regions](admin/regions-overview.md#what-regions-are-available).
- Effective April 2021<sup>1</sup>, the authentication protocol will be retired for all new environments within a tenant.
- Effective April 2022, the authentication protocol will be retired for all new and existing environments within a tenant.

<sup>1</sup>The retirement of new environments starts April 1, 2021 and rolls out gradually in all regions within a 6-week window.

More information: [Use of Office365 authentication with the WS-Trust security protocol](/powerapps/developer/common-data-service/authenticate-office365-deprecation)

## Regional Discovery Service is deprecated

Effective March 2, 2020, the *regional* [Discovery Service](/powerapps/developer/common-data-service/org-service/discovery-service) is deprecated. Microsoft will continue to provide support, security, and other critical updates for the *regional* Discovery Service, but won't release any more functionality beyond what has already been announced. After April 21, 2021, the *regional* Discovery Service will be shut down.

Customers must transition to using the [global OData V4 Discovery Service](/powerapps/developer/common-data-service/webapi/discover-url-organization-web-api#global-discovery-service) before April 21, 2021 so their applications aren't impacted. More information: [Modify your code to use global Discovery Service](/powerapps/developer/common-data-service/webapi/discovery-orgsdk-to-webapi).

## Legacy web client is deprecated

As of September 2019, the legacy web client is deprecated. Customers must transition to Unified Interface before December 4, 2020. Microsoft will continue to provide support, security, and other critical updates to the legacy web client until December 4, 2020 but won't release any more functionality beyond what has already been announced.
  
On December 4, 2020, the legacy web client will no longer be available. Organizations should make the transition to Unified Interface as soon as possible to take advantage of Microsoft's ongoing investments in reliability, performance, and functionality.

In the coming months, for those that have not already made the transition, we'll be sending reminders and scheduling updates to transition customers to Unified Interface prior to December 4, 2020.
For more information and steps to make a smooth transition, see:

- [Unified Interface Community
    Group](https://community.dynamics.com/forums/thread/?partialUrl=user-interface) including a
    Blog and Forum

- [Getting Started Unified Interface
    Playbook](/powerapps/maker/model-driven-apps/unified-interface-playbook)

- [User Experience and Unified Interface transition
    whitepaper](/powerapps/maker/model-driven-apps/approaching-unified-interface)

- [Quick Start Guide – add Unified Interface App to existing
    environment](/powerapps/maker/model-driven-apps/transition-web-app-existing)

- [Quick Start Guide – set an environment to Unified Interface as
    default](/powerapps/maker/model-driven-apps/transition-web-app)

## Task flows are deprecated

[Task flows](/power-automate/create-mobile-task-flow) are used to create a step-by-step data entry form for common tasks, such as after-meeting follow-ups.

Task flows are deprecated and will be removed by October 1, 2021. They'll be replaced by the immersive experience for business process flows that is planned for release. More information: [Business process flow immersive experiences](/power-platform-release-plan/2019wave2/microsoft-flow/business-process-immersive-experiences)

## Process Dialogs are deprecated

You can use a process dialog to create an interactive step-by-step data entry form that requires user input to start and run to completion. When you start the dialog process, a wizard-like interface is presented; users make selections or enter data as they progress through each page of the wizard.

Process dialogs are deprecated and will be removed by December 1, 2020. Suggested replacement options include Business Process Flows or Canvas Apps. More information: [Replace dialogs with business process flows or canvas apps](/power-automate/replace-dialogs)

## Legacy process-related attributes in entities are deprecated

The legacy process-related attributes (such as **StageId**, and **TraversedPath**) on entities enabled for business process flows are now deprecated. The **SetProcess** action for business process flows is also deprecated. Manipulating these legacy process-related attributes for target entity records doesn't guarantee consistency of the business process flow state, and isn't a supported scenario. The recommended way is to use the attributes of the business process flow entity. More information: [Create, retrieve, update, and delete business process flow entity records](/dynamics365/customer-engagement/developer/model-business-process-flows#create-retrieve-update-and-delete-business-process-flow-entity-records-process-instances)

## Some client APIs are deprecated

The following client APIs are deprecated to reorganize the Xrm client API object model to better align with the need of using the same
client scripts without having to change them based on the context or the client
(web client or the new Unified Interface) where they run. You should plan to use
the new client APIs mentioned in the **Replacement Client API** column instead
of the deprecated ones. The deprecated client APIs will continue to be available
and supported until they're officially removed from a future major release. *A public announcement here in the documentation, on the Dynamics 365 blog, and in many other places will be made at least six months before removal.*

|Deprecated Client API |Replacement Client API |Comments |
|-----|-----|-----|
|[Xrm.Page](/previous-versions/dynamicscrm-2015/developers-guide/gg328474(v%3dcrm.7))| **Forms**: ExecutionContext.[getFormContext](/dynamics365/customer-engagement/developer/clientapi/reference/executioncontext/getformcontext)<br/>**Commands**: Send it as the [PrimaryControl](/dynamics365/customer-engagement/developer/customize-dev/pass-dynamics-365-data-page-parameter-ribbon-actions#form-and-grid-context-in-ribbon-actions) parameter |Use of the **Xrm.Page** object as a static access to the primary form context is still supported to maintain backward compatibility with the existing scripts. Based on the feedback, we understand that the usage of **Xrm.Page** is high, and it won't be removed as soon as some other client API methods listed in this section. We encourage you to use the new way of getting form content where possible. More information: [Client API form context](/dynamics365/customer-engagement/developer/clientapi/clientapi-form-context)<br/>Although **Xrm.Page** is deprecated, **parent.Xrm.Page** will continue to work in case of HTML web resources embedded in forms as this is the only way to access the form context from the HTML web resource.|
|[Xrm.Page.context](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v%3dcrm.7))|Xrm.Utility.[getGlobalContext](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-utility/getglobalcontext)|Allows access to the global context without going through the form context.|
|Xrm.Page.context.<br />[getQueryStringParameters](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v%3dcrm.7)#getquerystringparameters) |formContext.data.attributes| The formContext.data.attributes API will make retrieval of nonentity bound data consistent across entity forms, metadata-driven dialogs, and task-based flows. The data will be a combination of custom values sent using the query string and what was specified in the parameters in the [openForm](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openform) method. |
|Xrm.Page.context.<br />[getTimeZoneOffsetMinutes](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#gettimezoneoffsetminutes) |globalContext.<br />userSettings.<br />getTimeZoneOffsetMinutes| Moved to:<br />globalContext.<br />userSettings|
|Xrm.Page.context.<br />[getUserId](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getuserid) |globalContext.<br />userSettings.<br />userId| Moved to:<br />globalContext.<br />userSettings|
|Xrm.Page.context.<br />[getUserLcid](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getuserlcid)|globalContext.<br />userSettings.<br />languageId | Moved to:<br />globalContext.<br />userSettings|
|Xrm.Page.context.<br />[getUserName](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getusername)| globalContext.<br />userSettings.<br />userName | Moved to:<br />globalContext.<br />userSettings|
|Xrm.Page.context.<br />[getUserRoles](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getuserroles) | globalContext.<br />userSettings.<br />securityRoles| Moved to:<br />globalContext.<br />userSettings|
|Xrm.Page.context.<br />[getIsAutoSaveEnabled](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getisautosaveenabled)| globalContext.<br />organizationSettings.isAutoSaveEnabled|Moved to:<br />globalContext.<br />organizationSettings |
|Xrm.Page.context.<br />[getOrgLcid](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getorglcid)|globalContext.<br />organizationSettings.languageId|Moved to:<br />globalContext.<br />organizationSettings |
|Xrm.Page.context.<br />[getOrgUniqueName](/previous-versions/dynamicscrm-2015/developers-guide/gg334511(v=crm.7)#getorguniquename)|globalContext.<br />organizationSettings.uniqueName|Moved to:<br />globalContext.<br />organizationSettings |
|[Xrm.Page.data.entity.getDataXml](/previous-versions/dynamicscrm-2015/developers-guide/gg334720(v%3dcrm.7)#getdataxml) | No change in the method, but use `typename` instead of `type` for lookup attributes.||
|[GridRow.getData](/previous-versions/dynamicscrm-2015/developers-guide/dn932126(v%3dcrm.7)#getdata) |GridRow.data | GridRow is essentially a form context. This change unifies the interface of GridRow with formContext.|
|[GridRowData.getEntity](/previous-versions/dynamicscrm-2015/developers-guide/dn932126(v=crm.7)#getentity) |GridRowData.entity | GridRowData is form data. This change unifies the interface of GridRowData with formContextData. |
|[Xrm.Mobile.offline](/previous-versions/dynamicscrm-2016/developers-guide/mt787123(v=crm.8)) |[Xrm.WebApi.offline](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-webapi/offline)|Moved the offline-related methods under **Xrm.WebApi.offline**|
|[parent.Xrm](/previous-versions/dynamicscrm-2015/developers-guide/gg309536(v%3dcrm.7)#reference-other-web-resources-from-an-html-web-resource)| Use one of the following: <br/><br/>a) Use a custom control created using [Power Apps component framework](/powerapps/developer/component-framework/overview) instead of HTML web resources.<br/><br/>b) On forms, use the [getContentWindow](/powerapps/developer/model-driven-apps/clientapi/reference/controls/getcontentwindow) method of the web resource control.<br/><br/>c) If the [getContentWindow](/powerapps/developer/model-driven-apps/clientapi/reference/controls/getcontentwindow) method doesn't work, you can use `parent.Xrm` to get to the `Xrm` object inside an HTML web resource. If the HTML web resource is opened in a new window, then you should use `opener.Xrm` instead.|**Earlier**: An HTML web resource may interact with the **Xrm.Page** or **Xrm.Utility** objects within the form by using **parent.Xrm.Page** or **parent.Xrm.Utility**. <br/><br>**Now**: parent.Xrm.\* will work if the HTML web resource is loaded in a form container. It won't work for HTML web resources that are stand alone, or referenced from the site map or any other places.|
|[addOnKeyPress](/previous-versions/dynamicscrm-2016/developers-guide/gg334266(v=crm.8)#addonkeypress)|Use a custom control created using [Power Apps component framework](/powerapps/developer/component-framework/overview)||
|[fireOnKeyPress](/previous-versions/dynamicscrm-2016/developers-guide/gg334266(v=crm.8)#fireonkeypress)|Use a custom control created using [Power Apps component framework](/powerapps/developer/component-framework/overview)||
|[removeOnKeyPress](/previous-versions/dynamicscrm-2016/developers-guide/gg334266(v=crm.8)#removeonkeypress)|Use a custom control created using [Power Apps component framework](/powerapps/developer/component-framework/overview)||
|[showAutoComplete](/previous-versions/dynamicscrm-2016/developers-guide/gg334266(v=crm.8)#showautocomplete)| Use a custom control created using [Power Apps component framework](/powerapps/developer/component-framework/overview) ||
|[hideAutoComplete](/previous-versions/dynamicscrm-2016/developers-guide/gg334266(v=crm.8)#hideautocomplete)| Use a custom control created using [Power Apps component framework](/powerapps/developer/component-framework/overview) ||
|[alertDialog](/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#alertdialog) |Xrm.Navigation.<br />[openAlertDialog](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openalertdialog)|The new signature is consistent with other APIs (openForm) and takes a new set of parameters for flexibility. |
|Xrm.Utility.<br />[confirmDialog](/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#confirmdialog)| Xrm.Navigation.<br />[openConfirmDialog](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openconfirmdialog) |The new signature is consistent with other APIs (openForm) and takes a new set of parameters for flexibility. |
|Xrm.Utility.<br />[getBarcodeValue](/previous-versions/dynamicscrm-2016/developers-guide/jj602956(v=crm.8)#getbarcodevalue)| Xrm.Device.[getBarcodeValue](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-device/getbarcodevalue) |Moving device-related actions to Xrm.Device |
|Xrm.Utility.<br />[getCurrentPosition](/previous-versions/dynamicscrm-2016/developers-guide/jj602956(v=crm.8)#getcurrentposition)| Xrm.Device.[getCurrentPosition](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-device/getcurrentposition) | Moving device-related actions to Xrm.Device|
|Xrm.Utility.<br />[isActivityType](/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#isactivitytype)| Xrm.Utility.<br />[getEntityMetadata](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-utility/getentitymetadata) |The `isActivityType` method is synchronous so it was suitable for ribbon rules. However, the replacement method, [getEntityMetadata](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-utility/getentitymetadata), is asynchronous, and isn't suitable for ribbon rules.|
|Xrm.Utility.<br />[openEntityForm](/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#openentityform) | Xrm.Navigation.<br />[openForm](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openform) |Moving navigation actions to Xrm.Navigation |
|Xrm.Utility.<br />[openQuickCreate](/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#openquickcreate)| Xrm.Navigation.<br />[openForm](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openform) |Moving navigation actions to Xrm.Navigation |
|Xrm.Utility.<br />[openWebResource](/previous-versions/dynamicscrm-2015/developers-guide/jj602956(v%3dcrm.7)#openwebresource)|Xrm.Navigation.<br />[openWebResource](/dynamics365/customer-engagement/developer/clientapi/reference/xrm-navigation/openwebresource)|Moving navigation actions to Xrm.Navigation<br/>**Note**: This API returns VOID in Unified Interface. |
|globalContext.<br />organizationSettings.<br />[baseCurrencyId](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-utility/getglobalcontext/organizationsettings#basecurrencyid)|globalContext.<br />organizationSettings.<br />[baseCurrency](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-utility/getglobalcontext/organizationsettings#basecurrency)|The replacement method lets you access the display name along with the ID of transaction currency. |
|globalContext.<br />userSettings.<br />[securityRoles](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-utility/getglobalcontext/usersettings#securityroles)|globalContext.<br />userSettings.<br />[roles](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-utility/getglobalcontext/usersettings#roles)|The replacement method lets you access the display name along with the ID of the security roles.|
|globalContext.<br />userSettings.<br />[transactionCurrencyId](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-utility/getglobalcontext/usersettings#transactioncurrencyid)|globalContext.<br />userSettings.<br />[transactionCurrency](/powerapps/developer/model-driven-apps/clientapi/reference/xrm-utility/getglobalcontext/usersettings#transactioncurrency)|The replacement method lets you access the display name along with the ID of transaction currency.|
|[getData](/powerapps/developer/model-driven-apps/clientapi/reference/controls/getdata) and [setData](/powerapps/developer/model-driven-apps/clientapi/reference/controls/setdata) for Silverlight web resources|None |Silverlight is no longer supported. These methods won't be available after October 2020.|
|formContext.<br />data.<br />entity.[save](/powerapps/developer/model-driven-apps/clientapi/reference/formcontext-data-entity/save)|formContext.<br />data.<br />[save](/powerapps/developer/model-driven-apps/clientapi/reference/formcontext-data/save)||
|[getObject](/powerapps/developer/model-driven-apps/clientapi/reference/getglobalcontext-clientglobalcontext.js.aspx#clientglobalcontextjsaspx)|[getContentWindow](/powerapps/developer/model-driven-apps/clientapi/reference/controls/getcontentwindow)||

For information about the new client APIs, see [Apply business logic using client scripting in model-driven apps using JavaScript](/powerapps/developer/model-driven-apps/client-scripting)

## EntityMetadata.IsInteractionCentricEnabled property is deprecated

All entities supported in Unified Interface are now enabled for the interactive experience in the new Customer Service Hub app. This implies that
the **EntityMetadata**.[IsInteractionCentricEnabled](/dotnet/api/microsoft.xrm.sdk.metadata.entitymetadata.isinteractioncentricenabled)
property, which indicates whether an entity can be enabled for interactive experience, is no longer relevant. The corresponding setting for this property
in the Customization tool, **Enable for interactive experience**, is removed, and the
**EntityMetadata**.[IsInteractionCentricEnabled](/dotnet/api/microsoft.xrm.sdk.metadata.entitymetadata.isinteractioncentricenabled) property will be removed from the future version.

## Voice of the Customer is deprecated

The Voice of the Customer solution is used to create and send surveys for collecting feedback.  

As of July 1, 2019, the Voice of the Customer solution is deprecated. Users can create and distribute new surveys and collect responses from live surveys until July 1, 2020.  

A new solution, Dynamics 365 Customer Voice, is generally available to capture customer feedback using surveys. Customers can learn more about Customer Voice [here](/dynamics365/customer-voice/help-hub).

## Dynamics 365 for Blackberry is deprecated

As of December 3, 2018, Microsoft Dynamics 365 for Blackberry App is deprecated and will be removed from the iOS App Store on October 31, 2019. The mobile app is currently available on the iOS App Store and is designed for Dynamics 365 customers that utilize Blackberry Mobile Application Management. See more details about the Dynamics 365 for Blackberry app here: [Secure your mobile data with Microsoft Dynamics 365 for Good](/dynamics365/customer-engagement/mobile-app/v8/go-mobile/admin-troubleshoot/secure-mobile-data-dynamics-365-good). After October 31, 2019, Microsoft Intune will be the only supported mobile application management solution for the [Dynamics 365 for phones application](/dynamics365/customer-engagement/mobile-app/install-dynamics-365-for-phones-and-tablets).

Microsoft will continue to provide security and other critical updates to the Dynamics 365 for Blackberry App until October 31, 2019, but won't release any more features or functionalities within the app. After October 31, 2019, the Dynamics 365 for Blackberry App will be removed from the App Store, and support will end.

**What should you do?**

If you're currently using the Dynamics 365 for Blackberry App together with Mobile Application Management for Blackberry, plan to migrate to Dynamics 365 for phones by October 31, 2019. We encourage you to migrate as soon as possible to take advantage of Microsoft's ongoing investments in the reliability, performance, and functionality of the Dynamics 365 mobile app.

## Usage of Parature knowledgebase as the knowledge management solution is deprecated

Usage of Parature knowledgebase as the knowledge management solution is deprecated. This feature is replaced by Knowledge Management features in Dynamics 365 Customer Service.

The **Knowledge Solution** setting in the **Knowledge Base Management Settings** dialog box, which provides a connection to Parature, will be removed in a future major release.

![Knowledge Base Management Settings dialog.](media/deprecated-knowledge-management-settings.png "Knowledge Base Management Settings dialog")

## Project Service Finder app is deprecated

The Project Service Finder App, available for use with Dynamics 365 Project Service Automation, is deprecated. The legacy application will be supported for associated legacy Project Service Automation releases in accordance with Microsoft's [Modern Lifecycle Policy](https://support.microsoft.com/help/30881). The functionality available through this app will be available in a future release of Dynamics 365 Project Service Automation application.

## Relationship Roles are deprecated

Relationship Roles (**Settings \> Business Management \> Relationship Roles**) are
being deprecated along with their user interface components. These will be removed in a future major release.
This feature is replaced by **Connection Roles**. For more information, go to [Create connections to view relationships between
records](/previous-versions/dynamicscrm-2016/admins-customizers-dynamics-365/mt826690(v=crm.8)).

## Mail Merge is deprecated

In Dynamics CRM 2016 (version 8.0), we introduced server-side document
generation using Word and Excel templates. You can use these templates to
provide standardized documents or customized data analysis for your
organization.

Mail merge from previous versions is deprecated. This includes the mail-merge Word add-in and mail-merge templates (**Settings \> Templates \> Mail Merge
Templates**).

More information: [Create Word and Excel templates](/previous-versions/dynamicscrm-2016/admins-customizers-dynamics-365/mt826692(v=crm.8))

## Announcements are deprecated

Announcements (**Settings \> Administration \> Announcements**) are deprecated and
will be removed in a future major release.

## Ready-to-use business processes available through Add Ready to Use Business Processes setting are deprecated

Ready-to-use business processes available through the Add Ready-to-Use Business
Processes setting (<strong>Settings \> Data Management \> Add Ready-to-Use Business
Processes</strong>) are deprecated and will be removed in a future major release. You can find ready-to-use business processes on Microsoft AppSource.

## Silverlight (XAP) web resource is deprecated <a name="BKMK_Silverlight"></a>

The Silverlight (XAP) web resource is deprecated on the web client, and isn't
supported on Unified Interface. Instead of Silverlight web resources, you must use custom
controls created using the HTML web resources
with HTML5 to create UI components to visualize and interact with data.

## Gateways for desktop flows are deprecated

Gateways for desktop flows are deprecated. Direct connectivity is the preferred option to run attended and unattended desktop flows on your machine(s). This feature is no longer supported from June 30, 2023, and for China regions from September 30, 2023. Switch to our machine-management capabilities. Learn more about [switching from gateways to direct connectivity](/power-automate/desktop-flows/manage-machines#switch-from-gateways-to-direct-connectivity).


## Canvas apps

See [Important upcoming changes and deprecations in canvas apps](/powerapps/maker/canvas-apps/important-changes-deprecations).

## Power Pages

See [Important changes coming in Power Pages](/power-pages/important-changes-deprecations).

## Other deprecation articles

[Deprecated features in Dynamics 365 Sales](/dynamics365/sales/deprecations-sales)<br/>
[Deprecated features in Dynamics 365 Customer Service](/dynamics365/customer-service/deprecations-customer-service)<br/>
[Deprecated features in Dynamics 365 Field Service](/dynamics365/field-service/deprecations-field-service)<br/>
[Deprecated features in Universal Resource Scheduling](/dynamics365/common-scheduler/deprecations)<br/>
[Removed or deprecated features in Finance and Operations apps](/dynamics365/fin-ops-core/fin-ops/get-started/removed-deprecated-features-home-page)<br/>

[!INCLUDE[footer-include](includes/footer-banner.md)]
