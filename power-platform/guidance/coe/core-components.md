---
title: Use core components
description: "The CoE Starter Kit core components provide the core to get started with setting up a Center of Excellence (CoE). They sync all your resources into tables and build admin apps on top of that to help you get more visibility of the apps, flows, and makers in your environment."
author: manuelap-msft
ms.topic: concept-article
ms.date: 09/26/2024
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Use core components

These components provide the core to get started setting up a Center of Excellence (CoE). The components sync all your resources into tables and build admin apps on top of them to help you get more visibility of the apps, flows, and makers in your environment. Apps like **Manage Permissions** help with daily admin tasks. The core components solution contains assets relevant only to admins. For more information, see [Set up core components](setup-core-components.md) and [Watch](https://www.youtube.com/embed/l0kJQAeKthw) how to use the core components solution.

[Watch an overview](https://www.youtube.com/embed/l0kJQAeKthw) on how to use the core components solution.

## Inventory components

### Tables

> [!NOTE]
> To easily explore and manage data stored in Dataverse, we recommend you install the [Microsoft Power Apps Office Add-in](https://appsource.microsoft.com/product/office/WA104380330?tab=Overview). For more information, see [Working with data in Dataverse using the Excel Add-in!](https://powerapps.microsoft.com/blog/cds-for-apps-excel-importexport/).

#### Tenant objects

The [sync flows](#flows) of the CoE Starter Kit sync your tenant resources to the following Dataverse tables. All tables provide information about _created by_ or _created on_ and _modified by_ or _modified on_, plus resource-specific information.

- **AiBuilderModel** is an Ai Builder Model.

- **Business Process Flow** is a business process flow.

- **CoE Connection Reference** is the linking table for the many-to-many relationships among connectors (PowerApps Connector) and cloud flows (Flows) or apps (PowerApps App). This reference isn't currently available for data export architecture.

- **Desktop Flow** is a desktop flow.

- **Environment** is the Environment object, which contains apps, flows, and connectors.

- **Flow** is the cloud flow in the tenant.

- **PowerApps App** is an app, such as a canvas, model driven, or other type of app.

- **PowerApps Connector** is a standard or custom connector.

- **Power Pages Site** is a Power Page Site.

- **Power Platform Solution** is a solution.

- **PVA** is a bot in Copilot Studio.

- **PVA Component** is a Copilot Studio component, such as a _topic_.

- **PVA Component Flow Lookup** is a flow triggered as part of Copilot Studio.

#### Users

There are several concepts of _users_ in the inventory.

- **Connection Reference Identity** stores a list of a single instance of all user connections for each environment.

- **Environment Security Role Permission** is a permission to an environment. Including the user, the security role, the environment and other properties.

- **Maker** is a user who creates an object, such as an app, flow, custom connector, or other item.

- **Power Platform User** is who an app is shared with.

- **Power Platform User Role** represents the role a Microsoft Power Platform user has for a specific app. This has a one-to-many relationship with the Power Platform User and PowerApps App tables. The following information is available for each role:
  - App
  - Microsoft Power Platform user
  - Role name (Owner, CanEdit, CanView)
  - Friendly role name (Owner, Co-Owner, Viewer)

- **Microsoft Copilot Studio** represents a bot in Microsoft Copilot Studio. The following information is available for each bot:
  - Display name
  - ID
  - Created on
  - Owner
  - Modified on
  - Last launched on
  - Total number of sessions
  - Number of components (rollup)
  - Number of flows (rollup)
  - Status
  - Environment
  - Is bot orphaned (yes/no)

- **Microsoft Copilot Studio Component** represents a Microsoft Copilot Studio component, such as a topic. The following information is available for each bot component:
  - Name
  - ID
  - Component created on
  - Description
  - Display name
  - Environment
  - Modified on
  - State
  - Type (topic, table)
  - Uses flow (yes/no)

- **Microsoft Copilot Studio Component Flow Lookup** represents a flow triggered as part of Microsoft Copilot Studio. The following information is available for each bot component flow:
  - Name
  - ID
  - Created on/by

- **Desktop Flow** represents a desktop flow. The following information is available for each desktop flow:
  - Display name
  - ID
  - Created on
  - Owner
  - Modified on
  - Desktop flow type (Power Automate Desktop, Selenium IDE)
  - Status
  - Environment
  - Is desktop flow orphaned (yes/no)
  
- **RPA Session** represents a desktop flow session. The following information is available for each bot:
  - ID
  - Desktop Flow
  - Status Code
  - Started On
  - Completed On
  - Error Code
  - Error Message

#### Inventory Management Features

These tables store information about usage for management.

- **Data Policy Drafts** is a draft DLP that you're working through in the [DLP Impact Analysis](#dlp-impact-analysis) app.

- **DLP Impact Analysis** is an instance violating a draft DLP that you're working through with a Maker in the [DLP Impact Analysis](#dlp-impact-analysis) app.

- **Environment Business Area** is the owning business area of an environment, if cross-charging is required.

- **Flow Action Detail** is the set of actions that occur in a cloud flow. This table has a many-to-one link with the Flow table.

#### Solution Management

These tables are used to manage the CoE solution itself.

- **CoE Solution Metadata** holds meta-data about flows and apps part of the CoE Starter Kit in a table and is used in the [CoE Admin Command Center](#coe-admin-command-center).

- **Command Center Config** holds bookmark information to for the Bookmarks page of the [CoE Admin Command Center](#coe-admin-command-center).

- **Customized Email** holds metadata about emails sent from flows in the Core Solution to allow for admins to tailor them without making unmanaged layers on the flows.

- **Setup Wizard State metadata** represents the current state of the user in the Setup Wizard. This metadata is used to guide them through the steps.

- **Sync Flow Errors** represents the daily occurrence of sync flow errors to provide a summary email to an admin. The following information is available for each sync flow error.

  - Flow instance URL
  - Environment
  - Created on

- **Tenant Security Roles** are all security roles in the tenant and allow you to determine which ones you want to gather.

### Security roles

These security roles only grant permissions to the custom tables but not to the environment as a whole. If you want users to view apps and flows in the environment, grant them access individually to each object. You can add them to another security role like **System Admin** or **Environment Maker**.

For more information, see [Security roles and privileges](/power-platform/admin/security-roles-privileges).

- **Power Platform Admin SR** gives full access to create, read, write, and delete operations on the custom tables.

- **Power Platform Maker SR** gives read and write access to the custom tables, such as environments or apps.

- **Power Platform User SR** gives read-only access to resources in the custom tables.

### Flows

| Flow Name | Type | Interval | Description |
| ---- | ---- | --- | ---- |
| Admin \| Add Maker to Group | Automated | New makers added | This flow adds a user who created an app, flow, custom connector, or environment for the first time to your Maker group. This flow gets triggered when a new record is created in the maker table. |
| Admin \| Excuse Non-Inventoried Envts from Governance Flows | Automated | When the **Excuse from Inventory** column of an environment is changed | If you're only doing inventory for a subset of environments (not the default behavior), this flow ensures ignored environments have their _excuse from_ flags set correctly. |
| Admin \| Excuse Support Envts from Governance Flows | Automated | When an environment record is created in the **Environments** table | This flow checks if [support environments](/power-platform/admin/support-environment#what-are-support-environments) exist and excludes these environments from the [inactivity](governance-components.md#inactivity-processes) and [compliance](governance-components.md#compliance-processes) governance processes. |
| Admin \| Gather Tenant SRs | Schedule | Monthly | This flow retrieves the security roles in your tenant and ensures they're in the **Tenant Security Roles** table for management. |
| Admin \| Sync Template v3 (Call Updates) | Scheduled | Weekly | Used to trigger other flows to run on a weekly schedule. Needed so that those flows can be of type button and be used to run on demand or on a schedule.|
| Admin \| Sync Template v3 (Connectors) | Button | Triggered from **Admin \| Sync Template v3** (call updates) and manually from apps  | This flow gets connector information, by using [Get Connectors](/connectors/powerappsforappmakers/#get-connectors), and stores information such as the connector name, publisher, and tier. |
| Admin \| Sync Template v3 (Flow Action Details) | Automated | Triggered by **Admin \| Sync Template v4** (driver) | This flow gets the actions and triggers for all flows. This flow uses [Get Flow as Admin](/connectors/flowmanagement/#get-flow-as-admin) to get action and trigger details for each flow in your tenant, so it can be time-consuming and resource-consuming to run. Turning on this flow is optional. Turn on to perform action-level reporting or analysis, such as reporting on who's using the **Send Email** action of the Microsoft 365 Outlook connector. |
| Admin \| Sync Template v3 (Sync Flow Errors) | Scheduled | Daily | This flow sends an email to the admin about environments that failed to sync (with a link to the flow instance). |
| Admin \| Sync Template v3 CoE Solution Metadata | Button | Triggered from Admin \| Sync Template v3 (Call Updates) and manually from apps | Updates the CoE Solution Metadata table with values from CoE team after upgrades in order to track the solution contents of the CoE solutions. |
| Admin \| Sync Template v3 (Desktop Flow - Runs) | Scheduled | Daily | This flow gets desktop flow run history and session details. Turning on this flow is optional, only turn this flow on if a tenant-level overview of desktop flows is important. |
| Admin \| Sync Template v3 (Desktop Flow) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow retrieves desktop flow information. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. Turning on this flow is optional. Only turn this flow on if a tenant-level overview of desktop flows is important. |
| Admin \| Sync Template v3 (Environment Properties) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow retrieves add-on, capacity, and security role information for environments. This information is retrieved from the Power Platform admin connector and from underlying Dataverse tables, and requires the user running the flow to have system administrator privileges in the environment. |
| Admin \| Sync Template v3 (Flow Action Details) | Scheduled | Daily | This flow gets the actions and triggers for all flows. This flow uses [Get Flow as Admin](/connectors/flowmanagement/#get-flow-as-admin) to get action and trigger details for every individual flow in your tenant. Thus, it can be a very time-consuming and resource-consuming flow to run. Turning on this flow is optional, only do so to perform action-level reporting or analysis, such as reporting on who's using the Send Email action of the Microsoft 365 Outlook connector. |
| Admin \| Sync Template v3 (Flows) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow gets cloud flow information by using [List Flows as Admin](/connectors/flowmanagement/#list-flows-as-admin). Also updates the record if flows have been deleted. |
| Admin \| Sync Template v3 (Model Driven Apps) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow gets model-driven app information. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. |
| Admin \| Sync Template v3 (Portals) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow retrieves Power Pages information. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. Turning on this flow is optional, only turn this flow if you're using portals in your tenant and are interested in getting a tenant-wide overview. |
| Admin \| Sync Template v3 (Solutions) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow retrieves solution information. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. Turning on this flow is optional. Only turn this flow on if a tenant-level overview of solutions is important. |
| Admin \| Sync Template v3 (AI Models) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow retrieves Power Platform AI model information. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. Turning on this flow is optional. Only turn this flow on if you're using AI Builder models in your tenant and are interested in getting a tenant-wide overview. |
| Admin \| Sync Template v3 (Microsoft Copilot Studio) | Automated | triggered by Admin \| Sync Template v3 (Driver) | This flow retrieves Microsoft Copilot Studio (bot) information. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. Turning on this flow is optional. Only turn this flow on if a tenant-level overview of chatbots is important. |
| Admin \| Sync Template v3 (Microsoft Copilot Studio Usage) | Scheduled | Daily | This flow retrieves Microsoft Copilot Studio (bot) usage information on a daily basis. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. Turning on this flow is optional, and we recommend that you do so only if you're using Microsoft Copilot Studio in your tenant and are interested in getting a tenant-wide overview. |
| Admin \| Sync Template v3 (Sync Flow Errors) | Scheduled | Daily | This flow sends an email to the admin about environments that failed to sync (with a link to the flow instance). |
| Admin \| Sync Template v3 (Call Updates) | Scheduled | Daily | Used to trigger these three flows to run on a schedule. Needed so that those flows can be of type button and be used to be run on demand or on a schedule.|
| Admin \| Excuse Support Envts from Governance Flows | Automated | When an environment record is created in the Environments table | This flow checks if [support environments](/power-platform/admin/support-environment#what-are-support-environments) exist, and excludes those environments from the [inactivity](governance-components.md#inactivity-processes) and [compliance](governance-components.md#compliance-processes) governance processes. |
| CLEANUP - Admin \| Sync Template v3 (Check Deleted) | Scheduled | Every two weeks | This long running flow runs every other week, and compares CoE to the tenant to determine if any objects were deleted since last run. Either just marks them as deleted (if env var Also Delete from CoE = no) or deletes them from the CoE (if Also Delete from CoE = yes). The audit log solution is able to find this information in on a daily basis for apps and flows, but not for other resources such as environments, desktop flows and chatbots. Run this flow periodically to check for deleted resources. |
| CLEANUP - Admin \| Sync Template v3 (Connection Status) | Scheduled | Weekly | This flow runs weekly, and checks if any apps or flows have unresolved connections.|
| CLEANUP - Admin \| Sync Template v3 (Delete Bad Data) | Scheduled | Daily | This flow runs daily, and looks for data in the inventory that is not complete, for example flows without an environment, and removes this data. |
| CLEANUP - Admin \| Sync Template v3 (Orphaned Makers) | Scheduled | Weekly | This flow runs weekly, and checks if any makers have left the organization - if maker information can't be found in Microsoft Entra/Office 365 Users, any resources created by the maker (apps, cloud and desktop flows, environments, chatbots) are marked as orphaned. |
| CLEANUP - Admin \| Sync Template v3 (Apps User Shared With) | Scheduled | Every two weeks | This long running flow runs every other week, and gets who the app is shared with by using [Get App Role Assignments as Admin](/connectors/powerappsforadmins/#get-app-role-assignments-as-admin). |
| CLEANUP - Admin \| Sync Template v3 (PMicrosoft Copilot StudioVA Usage)  | Scheduled | Monthly | This flow rolls up Microsoft Copilot Studio (bot) information on a monthly basis. This information is retrieved from underlying Dataverse tables and requires the user running the flow to have system administrator privileges in the environment. Turning on this flow is optional, and we recommend that you do so only if you're using Microsoft Copilot Studio in your tenant and are interested in getting a tenant-wide overview. |
| CLEANUP HELPER - Check Deleted (Business Process Flows) | Child flow | called from Check Deleted | Does the check deleted work for a given environment for business process flows  |
| CLEANUP HELPER - Check Deleted (Canvas Apps) | Child flow | called from Check Deleted | Does the check deleted work for a given environment for canvas apps  |
| CLEANUP HELPER - Check Deleted (Cloud Flows) | Child flow | called from Check Deleted | Does the check deleted work for a given environment for cloud flows  |
| CLEANUP HELPER - Check Deleted (Model Driven Apps) | Child flow | called from Check Deleted | Does the check deleted work for a given environment for model driven apps  |
| CLEANUP HELPER - Check Deleted (Microsoft Copilot Studio) | Child Flow | called from Check Deleted | Does the check deleted work for a given environment for chatbots  |
| CLEANUP HELPER - Check Deleted (Solutions) | Child Flow | called from Check Deleted | Does the check deleted work for a given environment for solutions  |
| CLEANUP HELPER - Check Deleted (Custom Connectors) | Child Flow | called from Check Deleted | Does the check deleted work for a given environment for custom connectors  |
| CLEANUP HELPER - Check Deleted (Ai Models) | Child Flow | called from Check Deleted | Does the check deleted work for a given environment for Ai Models  |
| CLEANUP HELPER - Power Apps User Shared With | Child Flow | called from CLEANUP - Admin \| Sync Template v3 (Power Apps User Shared With) | runs once per environment to check |
| HELPER - Add User to Security Role | Child Flow | Instant | This flow adds users to security roles. This flow currently supports adding Microsoft Entra ID groups to security roles in the main organization of the current environment.  |
| HELPER - CanvasAppOperations | Child Flow | Instant | This flow takes in the environment, app, and operation to perform as well as the GUID for the new maker if the operation is to reassign ownership. The operations supported are Delete and Assign (which reassigns owner). It performs the action on the actual object in the tenant and also updates the inventory. |
| HELPER - CloudFlowOperations | Child Flow | Instant | This flow takes in the environment, flow, and operation to perform as well as the GUID for the new maker if the operation is to reassign ownership. The operations supported are Delete and Assign (which reassigns owner). It performs the action on the actual object in the tenant and also updates the inventory. |
| HELPER - ObjectOperations | Child Flow | Instant | This flow takes in the environment, flow, and operation to perform as well as the GUID for the new maker if the operation is to reassign ownership. It calls that the operations supported are Delete and Assign (which reassigns owner). It calls either the **HELPER - CloudFlowOperations** or the **HELPER - CanvasAppOperations** child flow depending on its last parameter, objectType. It is needed due to a product bug in which you cannot call child flows with the Dataverse Connector from Canvas Apps. |
| HELPER - Send Email | Child Flow | Instant | This flow is called from all other flows and handles sending emails. |
| SetupWizard > CallOrphan | Child Flow | Instant | This flow is triggered by a state in the Setup Wizard and calls the CLEANUP - **Admin \| Sync Template v3** (orphaned makers) to identify orphaned makers immediately after setup.  |
| SetupWizard > CreateGroup | Child Flow | Instant | This flow is triggered from the Setup Wizard if a new group is created when communication methods get configured. This flow creates a new Microsoft Entra security group and returns the group ID and email to the app. |
| SetupWizard > GetCurrentEnvironment | Child Flow | Instant | This flow triggers from the Setup Wizard and uses the `workflow()` expression in Power Automate to return the current environment ID to the app. |
| SetupWizard > GetTenantID | Child Flow | Instant | This flow triggers from the Setup Wizard and calls the [Graph API](/graph/api/organization-get) to return the current tenant ID to the app. |
| SetupWizard>GetUserDetails | Child Flow | Instant | This flow triggers from the Setup Wizard and calls the [Graph API](/graph/api/user-list-licensedetails) to return which licenses are assigned to the current user (the user running the Setup Wizard) to the app. |
| SetupWizard>RunInitialFlows | Child Flow | Instant | This flow triggers from the Setup Wizard and runs the flows required for the initial setup of the core components: **Admin \| Sync Template v3 CoE Solution Metadata**, A**dmin \| Sync Template v3 Configure Emails**, **Admin \| Sync Template v3** (connectors) |
| SetupWizard > ShareApps | Child Flow | Instant | This flow triggers if you share all apps from the Setup Wizard. This flow shares all apps, based on their persona, with the groups configured when setting up communication methods. |
| SetupWizard > UpdateDataflowEnvironment | Child Flow | Instant | This flow triggers from the Setup Wizard. This flow updates the environment variables with the unique IDs of the data flows that are part of the core components solution. |
| SetupWizard > UpdateInventoryTypeAppSetting | Child Flow | Instant | This flow triggers from the Setup Wizard. This flow configures what navigation options to show in the Power Platform Admin view app, based on your [inventory data source](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). |
| SYNC HELPER - Apps | Child Flow | Called by **Admin \| Sync Template v4** (apps) | This flow updates the inventory for a specific app based on current tenant properties for that app. |
| SYNC HELPER - Cloud Flows | Child Flow | Called by **Admin \| Sync Template v4** (flows) | This flow updates the inventory for a specific flow based on current tenant properties for that flow. |
| SYNC HELPER - Get Security Role Users | Child Flow | Called by **Admin \| Sync Template v4** (security roles) | Gets the **System Admin SR** users into inventory for a given environment. |

### Apps

#### CoE Setup and Upgrade Wizard

An app used by admins to set up and upgrade their CoE installs.
Launch after each clean install or upgrade to use.

Use this app to:

- Ensure all new environment variables are filled or exposed to you.
- Ensure all new flows are turned on in the correct order.
- Choose between settings the kit offers for solution management.

**Permission**: Intended to be used only by the admin identity that owns the kit install.

**Prerequisite**: This CoE solution is installed or upgraded before you boot. The app doesn't assist with the upgrade of components, only the configuration of them afterwards.

:::image type="content" source="media\coesetupwizard.png" alt-text="Screenshot that shows the CoE Upgrade Wizard list of prerequisites for the user to confirm." lightbox="media\coesetupwizard.png":::

#### CoE Admin Command Center

An app used by admins to manage their kit implementation.

Use this app to:

- Launch CoE Starter Kit apps and other bookmarks.
- Review CoE Starter Kit service health by checking sync flows recently failed.
- Manage the cloud flows used within the kit.
- Update environment variables used in the CoE Starter Kit.
- View Microsoft 365 Message Center news related to Power Platform.
- Download the latest CoE Starter Kit version and raise support tickets with the team.
- Launch learning paths to learn more about Microsoft Power Platform.
- Launch the latest posts of the Power Apps, Power Automate, Power BI and Microsoft Copilot Studio blogs.
- Configure email subject and body text for emails send through the CoE Starter Kit.

**Prerequisite**: This app uses Dataverse and other premium connectors. A premium license is required for every app user.

> [!NOTE]
> When you first launch the app, bookmarks to all apps included in the CoE Starter Kit get created. Add other relevant bookmarks such as links to the Power BI dashboard, your Power Platform wiki, and community by selecting **Edit bookmarks**.

:::image type="content" source="media\commandcenter1.png" alt-text="Screenshot showing the Bookmarks page of the Command Center menu." lightbox="media\commandcenter1.png":::

When you first launch the app, you might have to establish a connection for [HTTP with Microsoft Entra ID (preauthorized)](/connectors/webcontents/), and set **Base Resource URL** and **Microsoft Entra Resource URI (Application ID URI)** to [https://graph.microsoft.com](https://graph.microsoft.com) for commercial tenants. If your tenant is in GCC, GCC High, or DoD, check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

#### DLP Impact Analysis

DLP Impact Analysis is an app that allows you to experiment with changes to policy configurations. You can get a list of canvas apps and cloud flows impacted by those changes.

Use this app to:

- Make draft DLP policies with changes.
- See what effect each change has on existing canvas apps and cloud flows.
- Mitigate the risk by contacting and working with makers.

For more information, see [Data Loss Prevention policies](../../admin/wp-data-loss-prevention.md).

**Permission**: Intended to be used only by admins. Power Platform Service Admin or user accounts with admin permissions is required. Share this app with your CoE admins.

:::image type="content" source="media/dlp_new1.png" alt-text="Screenshot that shows the DLP Impact Analysis page of the Data policy impact analysis menu.":::

> [!NOTE]
> This app can't detect or work with endpoint filtering in DLP. For more information, see [Connector Endpoint Filtering](../../admin/connector-endpoint-filtering.md).
>
> This app can't check for DLP impact in other object types. However, you can get help to determine DLP impact of Desktop Flows [RPA CLI](https://github.com/rpapostolis/rpa-cli).

### Manage Permissions

Manage Permissions is an app that an admin can use to manage various permissions across the tenant.

Permissions you can change with this app include:

- Canvas app ownership
- Cloud flow ownership
- Security Roles in tenant environments
- Connections across the tenant

**Permission**: This app is intended to be used only by admins. Power Platform Service Admin or user accounts with admin permissions is required. Share this app with your CoE admins.

#### Power Platform Admin View

**Power Platform Admin View** is a model-driven app that provides an interface used to browse items in Dataverse custom tables. The app gives you access to views and forms for the custom tables in the solution.

Use this app to:

- Get a quick overview of resources in your tenant.
- Learn about your makers, connectors, apps, and flows.
- Find out to whom the apps are shared.
- Add more information, such as notes and risk assessments, to your resources.
- Set approved capacity for environments, and see capacity and add-on information per environment.
- Complete [app audits](example-processes.md).
- Manage capacity alerts.
- Set app and flow permissions for individual resources.

**Permission**: This app is intended to be used only by admins. Power Platform Service Admin or user accounts with admin permissions is required. Share this app with your CoE admins.

:::image type="content" source="media/coe-mda1.png" alt-text="Screenshot that shows the Power Platform Dashboard page from the Overview Dashboard menu of the Power Platform Admin View." lightbox="media/coe-mda1.png":::

You can use this app to see with whom an app is shared, what roles (editor or viewer) the users have, and for groups. You can check the size of the group.

:::image type="content" source="media/coe-mda2.png" alt-text="Screenshot that shows a PowerApps App page with the App Shared With (list) section highlighted." lightbox="media/coe-mda2.png":::

You can use this app to manage permissions for apps and flows by selecting **Manage Permissions** from the command bar.

:::image type="content" source="media/ppadmin-setapp.png" alt-text="Screenshot that shows the Manage Permissions pane from the Manage Permissions button in the menu bar." lightbox="media/ppadmin-setapp.png":::

You can use this app to email app owners and app users by selecting **Email Users** from the command bar.

:::image type="content" source="media/ppadmin-email.png" alt-text="Screenshot that shows the Email Users pane opened from the Email Users button on the menu bar." lightbox="media/ppadmin-email.png":::

### Power BI report

With Power BI reports, you can get a holistic view of Dataverse data. You can understand visualizations and insights for **Environment**, **PowerApps App**, **Flow**, **Connector**, **Connection Reference**, **Maker**, and **Audit Log** tables.

Follow the [setup instructions](setup-powerbi.md) to set up the Power BI dashboard. For more information, see [Gain deep insights into your Microsoft Power Platform adoption with the CoE Power BI dashboard](power-bi.md).

:::image type="content" source="media/pb-2.png" alt-text="Screenshot that shows how to filter your apps in the Overview - Power Apps page of Power BI." lightbox="media/pb-2.png":::

## Environment Request management components

[Watch a walk-through](https://www.youtube.com/watch?v=16mspbGz1zA&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the environment and DLP request process works.

### Environment Request Tables

- **Environment Creation Request** is a request submitted by nonadmins to create a new Environment. This request has a many-to-many relationship with the Maker and PowerApps Connector tables.

- **DLP Impact Analysis** is an instance of an object, which violates a draft DLP Policy.

- **DLP Policy** is a DLP Policy you can offer to makers for selection in an environment request.

- **DLP Policy Change Request** is a request to change the definition of an existing DLP policy in the tenant.

### Environment Request Flows

| Flow Name | Type | Interval | Description |
| ---- | ---- | --- | ---- |
| DLP Request \| Apply Policy to Environment (Child) | Instant | When creating an environment with a given policy | Helper function that takes the Power Platform Policy ID and an Environment ID as input and applies a policy to an environment. The function removes the environment from all other "Include" type policies and excludes it from all "Exclude" type policies.  |
| DLP Request \| Process Approved Policy Change | Automated | When a **DLP Policy Change Request** record is updated to the **Approved** state | Automated flow that triggers when the approval status of a **DLP Policy Change Request** is updated to an _Approved_ state. This flow calls a child flow to make the change on the Power Platform service, for example updates the DLP policy, then updates the Dataverse request record to the _Fulfilled_ state.  |
| DLP Request \| Sync new Policy | Automated | When a new DLP Policy row is created and _Is Shared_ is true | When a new DLP Policy row is created and _Is Shared_ is true, it triggers the **Sync Policy** child flow and syncs the blocked connectors to the Dataverse row. |
| DLP Request \| Sync Policy to Dataverse (Child) | Instant | Called from other flows in this solution area | Takes the DLP Policy identifier as input (Dataverse record) and syncs the blocked connectors to the Dataverse policy row. |
| DLP Request \| Sync Shared Policies | Scheduled | Daily | Runs daily to keep the Dataverse version of each DLP Policy marked as `"Is Shared" == True` updated with the real policy's blocked connectors.  |
| Env Request \| Clean up | Schedule | Daily | Runs daily to delete environments with an associated expired **Request** record, to send warning emails to upcoming deletions, and to close out associated **Request** records where the environment is manually deleted from the admin center. |
| Env Request \| Create approved environment | Automated | When an **Environment Creation Request**’s status is updated to an _Approved_ state | Provisions the environment and other resources identified in the request. |
| Env Request \| Notify admin when a new request is submitted | Automated | When a new E**nvironment Creation Request** record’s status is updated by a user to a _Pending_ state | Sends an email to the admin alias with instructions on how to review the request. |
| Env Request \| Notify requestor when rejected | Automated | When an **Environment Creation Request**’s status is updated to the _Rejected_ state | Sends an email notification to the requestor with the rejection status and reason, then changes the request to inactive. |

### Environment Request Apps

#### CoE Admin Environment Request

The CoE Admin Environment Request app is used by admins as an interface to view and approve or reject requests to create or modify Power Platform development resources. The app supports **Environment Creation Requests** and changes to DLP policies are logged in the **DLP Policy Change Request** table.

Use this app to:

- View all **Environment Creation Requests** in detail.
- Approve or reject **Environment Creation Requests**.
- Check if connectors are blocked or restricted by existing or modified DLP policies. Modifications made in the app update those policies.

**Permission**: Intended to be used only by admins. Power Platform Service Admin or user accounts with admin permissions is required. Share this app with your CoE admins.

**Prerequisite**: This app uses Dataverse. End-users must have a **Per User** license and the app must be assigned a **Per App** license or the environment must be covered by pay-as-you-go.

:::image type="content" source="media\dev-resources-admin-details.png" alt-text="Screenshot that shows the Environment Creation Requests details page." lightbox="media\dev-resources-admin-details.png":::

#### CoE Maker Command Center

An app designed to help makers interact with their Power Platform Admin in many ways, including submitting requests for Power Platform resources (such as **Environment Creation Requests**).

Use this app to:

- See apps shared with the makers by the Power Platform admin.
- Submit new **Environment Creation Requests**.
- View existing requests in any state submitted by that user. Here you can find an expiration timeline and link to the live environments.

**Permission**: As soon as you're using this process, you can share the app with all authorized makers or the entire organization, depending on which users you want to allow **Environment** ownership. Requires the Power Platform Maker SR (security role) to use the Dataverse tables.

**Prerequisite**: This app uses Dataverse. End-users must have a **Per User** license, the app must be assigned a **Per App** license, or the environment must be covered by pay-as-you-go.

:::image type="content" source="media\dev-resources-maker-env.png" alt-text="Screenshot that shows the Environment Creation Requests page." lightbox="media\dev-resources-maker-env.png":::

## Other core components

### Other Tables

- **App Catalog Feedback** represents feedback gathered for an app.

### Other Flows

| Flow Name | Type | Interval | Description |
| ---- | ---- | --- | ---- |
| Admin \| Add-ons Alerts | Scheduled | Daily | This flow checks add-on consumption and compares it with approved capacity that an admin sets. The flow sends an alert to the admin for environments that exceed the approved add-on consumption or are at 80% of approved capacity. The approved capacity can be set in the **Power Platform Admin View** model-driven app. |
| Admin \| Capacity Alerts | Scheduled | Daily | This flow checks capacity consumption and compares it with approved capacity that an admin sets. The flow sends an alert to the admin for environments that exceed the approved capacity or are at 80% of approved capacity. The approved capacity can be set in the **Power Platform Admin View** model-driven app. |
| Admin \| Welcome Email v3 | Automated | When any sync flow adds a new maker to the **Maker** table | This flow sends an email to a user who created an app, flow, custom connector, or environment. This flow triggers when a new record is created in the **Maker** table. You can customize the email sent out by the flow. |
| App Catalog > Request Access | Instant | From the App Catalog | This flow sends an access request approval to the maker. |

### Other Apps

#### App Catalog

An app gives visibility to some apps in the organization. Admins can choose which apps to highlight in the app catalog if the app meets admin requirements and is meant to be shared broadly.

When you first open the app catalog, you don't see any apps there. There's a field on the **Power Apps App** table called **In App Catalog**, which is a two-option set type field (Boolean). If the value is set to **Yes**, the app shows up in the catalog. To publish an app to the app catalog, follow the [app auditing process](example-processes.md) in the **Power Platform Admin View** app.

**Permission**: As soon as you use this process, you can share the app catalog with the entire organization.

**Prerequisite**: This app uses Dataverse. If you installed this solution in a production environment, end-users need to have a **Per User** license, or the app needs to be assigned a **Per App** license, or the environment needs to be covered by pay-as-you-go.

:::image type="content" source="media/coe67.png" alt-text="Screenshot that shows the App Catalog page of Power Apps." lightbox="media/coe67.png":::

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
