---
title: Tenant-to-tenant migrations
description: Learn how to prepare for, perform, and validate an environment migration from one tenant to another.
ms.date: 10/30/2026
ms.topic: concept-article
ai-usage: ai-assisted
author: parkumar-msft
contributors:
  - thedsk8-microsoft
  - SatishKumarkannanMs
  - val-bc
  - brsova
  - ImadYanni
  - bevans
  - LaurentPepin
  - udmehta
  - dkhurana
ms.contributors:
  - ralinga
  - laneswenka
ms.subservice: admin
ms.author: parkumar
ms.reviewer: ellenwehrle
search.audienceType:
  - admin
---

# Tenant-to-tenant migrations

Use tenant-to-tenant migration to transfer an environment from one tenant to another, such as when you consolidate tenants or acquire a company. The migration doesn't change the user interface or version.

For environments without finance and operations apps, the environment doesn't physically move. Its Dataverse organization moves to a new environment in the destination tenant, and the original environment remains in the source tenant without Dataverse. For environments that include finance and operations apps, the source environment moves to the destination tenant and isn't preserved in the source tenant.

## Before you get started

Review these considerations before you start a tenant-to-tenant migration:

- **Supported environment types**: Only production and sandbox environments are supported.
- **Unsupported environment types**: Default, developer, trial, and Teams environments aren't supported. Migrations between Government Community Cloud (GCC) and public clouds aren't supported in either direction.
- The following components aren't supported: Dynamics 365 Customer Voice, Omnichannel for Customer Service, and component libraries.
- Dynamics 365 Customer Insights - Journeys, Dynamics 365 Customer Insights - Data, Power Apps, Power Automate, Power Pages, and Microsoft Copilot Studio require specific preparation and post-migration steps. Review the applicable sections in this article.
- Environments that include finance and operations apps are supported when they meet the [additional prerequisites for finance and operations apps](#additional-prerequisites-for-finance-and-operations-apps). This feature is rolling out and might not be available in your region yet.
- You might need to reconfigure applications and settings after migration, such as Dynamics 365 for Outlook, server-side synchronization, and SharePoint.
- After you create and configure users, [create a user-mapping file](#create-a-user-mapping-file).
- If a mapped user has a mailbox in the destination tenant, the migration configures it automatically. For all other users, reconfigure the mailbox.
  - If the destination tenant uses the same mailbox address, such as `test@microsoft.com`, the migration uses that mailbox by default. Migrate and configure mailboxes in the destination tenant before you start the tenant-to-tenant migration.
  - If you use the default `onmicrosoft.com` domain, an address such as `test@sourcecompanyname.onmicrosoft.com` changes to `test@targetcompanyname.onmicrosoft.com` after migration. Reconfigure the mailbox. For more information, see [Connect to Exchange Online](connect-exchange-online.md).
- Test the migration before you migrate a production environment. A test migration helps you validate the preparation steps and understand what to expect before you migrate production. [Copy the production environment](copy-environment.md) to a new sandbox environment, and then migrate the sandbox environment to the destination tenant.

## Prerequisites

Complete the following prerequisites before you start the migration process:

- Confirm that you have Power Platform administrator or Dynamics 365 administrator privileges.
- Create users in Microsoft 365 and Microsoft Entra ID in the destination tenant, and assign licenses to them.
- Use the recommended PowerShell for Power Platform Administrators module if you migrate with PowerShell. For more information, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

### Additional prerequisites for finance and operations apps

> [!TIP]
> A tenant-to-tenant migration changes the finance and operations source environment itself. Unlike a tenant migration for a Lifecycle Services-managed environment, this process doesn't preserve the source environment. To keep the source environment intact, [copy the environment](copy-environment.md) and migrate the copy.

Complete these additional prerequisites for an environment that includes finance and operations apps:

- Confirm that the environment has no finance and operations add-ins installed.

  > [!WARNING]
  > Tenant-to-tenant migration isn't supported when finance and operations add-ins are installed. Don't proceed with the migration because it can cause unexpected behavior.

- Obtain updated license files from your independent software vendor (ISV). Existing ISV licenses aren't valid after migration. Import the updated license files after migration.
- Create the finance and operations administrator's user account in the destination tenant. Enter this user's email address in **New FinOps Admin Email** when you start the preparation process. The migration fails if the user doesn't exist in the destination tenant.

> [!IMPORTANT]
> Before you migrate a production environment, first migrate a sandbox environment and test all functionality. Don't migrate the production environment until the sandbox migration and validation are successful.

> [!NOTE]
> The PowerShell for Power Platform Administrators module requires Windows PowerShell 5.x. It isn't compatible with PowerShell 6.0 and later, which use .NET Core. For more information, see [Install PowerShell for Power Platform Administrators](powershell-installation.md).

## Preparation process

Complete the applicable procedures for Power Automate, Power Apps, Copilot Studio, and Power Pages before migration. You must also create a user-mapping file.

### Prepare Power Automate

If your flows are already defined in Dataverse, you don't need to do any extra preparation.

Add the definitions of any Power Automate flows that you want to migrate into Dataverse solutions in the source environment. For more information, see [Add an existing cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution). You can run the [Add-AdminFlowsToSolution](/powershell/module/microsoft.powerapps.administration.powershell/add-adminflowstosolution?view=pa-ps-latest&preserve-view=true) cmdlet to add these definitions in bulk.

### Prepare Power Apps

Manually export your Power Apps apps. Migration of custom connectors, connections, and gateways isn't supported. If you use these components, manually reconfigure them after migration.

#### For solution-aware apps

Export solution-aware apps before you delete them from the source environment.

1. Go to [Power Apps](https://make.powerapps.com), select **Solutions**, and export all apps and solutions. Export them individually or group them in a single solution.
2. After you export the apps, delete them from the source environment. To delete apps in a managed solution, you must delete the solution.

    > [!CAUTION]
    > Before you delete a managed solution, review its contents carefully. If the solution contains Dataverse tables, deleting it also permanently deletes all data in those tables. This risk is especially important for solutions that contain model-driven apps, which typically rely on Dataverse tables. Export and back up any data you need to keep before you proceed.

3. To delete apps in an unmanaged solution, use **Delete from this environment**.

    > [!IMPORTANT]
    > If you don't delete solution-aware canvas apps, custom pages, or component libraries from an environment before migration, they won't work after migration.

#### For apps that aren't solution aware

Export apps that aren't solution aware as app packages.

1. Go to [Power Apps](https://make.powerapps.com), and then select **Apps**.
2. For each app that you want to move, select **More Commands**, and then select **Export package (preview)**.
3. Enter the required export details, and then select **Export**. When the export finishes, the app package downloads.
4. Repeat steps 2 and 3 until you export all apps.
5. Delete the exported apps from the source environment.

As an administrator, you can also view or delete canvas apps in the Power Platform admin center:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and then select the environment under **Manage**.
2. Under **Resources**, select **Power Apps** to view or delete the apps.

### Prepare Copilot Studio

Manually export your Copilot Studio agents. During or after migration, manually reconfigure dependent components, such as connections, environment variables, and custom connectors.

Agents are solution aware. Go to [Power Apps](https://make.powerapps.com), select **Solutions**, and export all agent solutions, either individually or grouped in a single solution. For more information, see [Export and import agents using solutions](/microsoft-copilot-studio/authoring-export-import-bots?tabs=webApp).

### Prepare Power Pages

Complete the following steps for each website in an environment:

1. Sign in to the environment.
2. Open the [admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
3. [Delete the website](/power-pages/admin/delete-website).

### Create a user-mapping file

Create a separate user-mapping file for each environment that you migrate. Ensure users exist, are active, and are authorized in both the source and destination tenants. Their domains can differ between tenants.

1. Create a user-mapping file named `usermapping.csv`.

   > [!NOTE]
   > The file name is case-sensitive. Separate values with a comma, not a semicolon.

2. Record each user's source and destination email addresses. Don't add spaces before or after the header values. Use the following format:

    ```csv
    Source,Destination
    SourceUser@sourcetenant.com,DestinationUser@targettenant.com
    ```

#### For full access users

Create mappings for users with full access:

1. Sign in to the source environment.
2. Use **Advanced Find** to find users.
3. Select **Use Saved View** > **Full Access Users**, and then select **Edit Columns**.
4. Remove all columns except **Full Name**.
5. Select **Add Columns** > **Windows Live ID**.
6. Select **OK** > **Results** to see the list of full access users.
7. Select all records, select **Export Users** on the ribbon, and then select **Static Worksheet**.
8. Repeat steps 1-7 for the destination tenant, if possible. You now have two Excel worksheets: one for the source tenant and one for the destination tenant.
9. Open the Excel files for editing.
10. Copy the records from the **Windows Live ID** column in the source worksheet into Notepad. Don't copy the header.
11. Save the Notepad file.
12. Enter each destination Windows Live ID (user principal name, or UPN) to the right of the corresponding source UPN. Separate the source and destination UPNs with a comma, without spaces.

    For example:

    ```csv
    user001@source.com,user001@destination.com
    user002@source.com,user002@destination.com
    user003@source.com,user003@destination.com
    ```

13. Save the file as a CSV file.

#### For administrative access users

Decide whether to include users with administrative access in the mapping file:

1. Sign in to the source environment.
2. Use **Advanced Find** to find users.
3. Select **Use Saved View** > **Administrative Access Users**, and then select **Results** to see the list of administrative access users.
4. If you don't want to include these users in the mapping file, skip the remaining steps. Otherwise, complete these steps:
    1. Find the corresponding users in the destination tenant.
    2. Ensure each destination user has a valid license.

       > [!NOTE]
       > If a destination user doesn't have a license, the migration fails.

    3. Save the CSV file with mappings for both full access users and administrative access users.

> [!NOTE]
> Security groups aren't migrated. Update them in the destination tenant after migration.

## Migrate using Power Platform admin center

Complete the [preparation process](#preparation-process) before you migrate using the Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Manage**.
3. In the **Manage** pane, select **Environments**.
4. On the **Environments** page, select the environment to move. Tenant-to-tenant moves support sandbox and production environments with Dataverse.
5. On the command bar, select **Move environment**. The **Request tenant to tenant move** pane opens.
6. Enter the destination tenant ID in **Target tenant ID**, and then select **Submit request**.

    The destination tenant receives the migration request for approval. A pending request banner appears on the **Environments** page.

### Migration requests list

Notification banners appear at the top of the **Environments** page when:

- You have a [request to approve as a destination tenant](#request-to-approve-as-destination-tenant).
- You submitted a [request to review as a source tenant](#request-to-review-as-source-tenant).

#### Request to approve as destination tenant

Review and respond to migration requests in the destination tenant:

1. Select **Review moves** on the banner.

    A pane lists the migration requests that need approval. Search by environment ID or request status.

2. Select the environment ID.
3. Review the request, and then approve or reject it.

> [!NOTE]
> Requests expire after seven days.

#### Request to review as source tenant

Select **Review moves** on the banner. A pane lists the migration requests you submitted.

Search by environment ID or request status.

### Migration preparation after approval

After the migration request is approved, a banner with the **Begin move** button appears on the environment's details page.

:::image type="content" source="media/move-environment-tenant/beginmovebanner.jpg" alt-text="Screenshot of the environment's details page with green approval banner, Begin move and Cancel move buttons.":::

1. Select **Begin move** to open the **Get ready for this tenant-to-tenant move** pane, which lists the pre-move steps. The **Move environment** button on the command bar also opens this pane.

    :::image type="content" source="media/move-environment-tenant/prevaldationmovepanel.jpg" alt-text="Screenshot of the Get ready for this tenant-to-tenant move pane showing pre-move steps.":::

2. Upload the user-mapping file for validation. Name the file `usermapping.csv`.
3. If the environment includes finance and operations apps, enter the destination tenant user's email address in **New FinOps Admin Email**. This user becomes the finance and operations administrator after migration. The user must exist in the destination tenant, or the migration fails.

    :::image type="content" source="media/move-environment-tenant/newfinopsadminemail.png" alt-text="Screenshot of the Get ready for this tenant-to-tenant move pane showing the New FinOps Admin Email box.":::

4. Select **Validate** to start validation. Wait for the operation to finish.

#### When validation fails

If validation fails, a banner with a **Download errors** button appears. Download the error file, fix the issues in the user-mapping file, and repeat the upload and validation steps.

:::image type="content" source="media/move-environment-tenant/downloadusermappingerrfile.jpg" alt-text="Screenshot of the Environments page showing error banner with Download errors button.":::

Use the following table to troubleshoot user-mapping results.

| Error code | Description | Action |
| --- | --- | --- |
| `SourceUserIdMissingInUserMap` | `SourceUserId` is empty in the mapping. | Correct the source user entry in the mapping file. |
| `TargetUserIdMissingInUserMap` | `TargetUserId` is empty in the mapping. | Correct the destination user entry in the mapping file. |
| `SourceUserIdIsNotValidGuid` | `SourceUserId` isn't a valid GUID. | Enter a valid GUID for the source user in the mapping file. |
| `SourceUserDoesNotExistInOrgDB` | `SourceUserId` doesn't match any `SystemUserId` in the organization's `SystemUsers` table. | Remove the entry from the mapping file. |
| `TargetUPNDoesNotExistInAAD` | The `TargetUserId` UPN isn't found in the destination tenant's Microsoft Entra ID. | Correct the destination user entry to identify a valid user in the destination tenant, or remove the entry. |
| `RetryableError` | An error occurred while mapping the user. The operation might succeed on retry. | Rerun the user-mapping command with a mapping file that lists the users with this error. |
| `ApplicationUserCannotBeMapped` | The source user is an application user, which the mapping operation doesn't support. | No action is required for the mapping operation. Create application users in the destination tenant because you can't migrate them from the source tenant. |
| `SkippedMapping` | The source user doesn't exist in the organization, and the destination user already exists. | No action is required. The source user was already mapped to the destination user, either in a previous run or manually. |

#### When validation succeeds

After validation succeeds, a banner with the **Move environment** button appears on the environment's details page.

1. Select **Move environment** to open the **Move this environment to another tenant** pane. You can validate again by using a new user-mapping file.
2. Review the pre-move steps, and then select the checkbox to confirm that you completed them.

    :::image type="content" source="media/move-environment-tenant/postvalidationmovepanel.jpg" alt-text="Screenshot of the move environment panel showing target tenant ID, user mapping upload, pre-move steps checkbox, and Move environment button.":::

3. Select **Move environment** to start the move. Wait for the operation to finish.

### Move completion

After the move finishes:

- The process moves the Dataverse organization from the source tenant to the destination tenant.
- For an environment without finance and operations apps, the original environment remains in the source tenant without the Dataverse organization. The process creates an environment in the destination tenant with the same name as the source environment. This environment includes the moved Dataverse organization.
- For an environment that includes finance and operations apps, the process moves the source environment to the destination tenant. The source environment isn't preserved in the source tenant.
- Update security groups in the destination tenant. Security groups aren't migrated.
- Re-enable managed environments in the destination tenant if the source environment was a managed environment. Ensure the destination tenant has the required license.
- Update any environment settings that weren't copied.
- The generative AI feature uses default values at the environment level.

### Cancel move

You can cancel a move after you submit the request and before the move finishes. Select **Cancel move** on the banner to open the **Cancel move** dialog box, and then cancel the move.

## Migrate using PowerShell

Complete the [preparation process](#preparation-process) before you migrate using PowerShell. The following sections identify which steps the source and destination tenant administrators perform.

### Install PowerShell for Power Platform Administrators (both source and target admins)

Both administrators must install the PowerShell for Power Platform Administrators module. For more information, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md) and [Install PowerShell for Power Platform Administrators](powershell-installation.md).

> [!NOTE]
> The PowerShell for Power Platform Administrators module requires Windows PowerShell 5.x. It isn't compatible with PowerShell 6.0 and later, which use .NET Core. To check your version, run `$PSVersionTable.PSVersion`. For installation instructions, see [Install PowerShell for Power Platform Administrators](powershell-installation.md).

Install or update the necessary module by using one of the following commands:

```PowerShell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Update-Module -Name Microsoft.PowerApps.Administration.PowerShell
```

### Install Azure PowerShell on Windows (both source and target admins)

Both administrators must install Azure PowerShell. The `Az` rollup module installs the generally available Azure PowerShell modules and makes their cmdlets available. For more information, see [Install Azure PowerShell on Windows](/powershell/azure/install-azps-windows?view=azps-11.6.0&tabs=powershell&pivots=windows-psgallery&preserve-view=true).

Use `Install-Module` to install Azure PowerShell:

```PowerShell
Install-Module -Name Az -Repository PSGallery -Force
```

### Sign in to Microsoft Power Platform (both source and target admins)

Sign in to Power Platform in your tenant:

```PowerShell
Add-PowerAppsAccount
```

### Submit migration request (source admin)

As a Power Platform administrator or Dynamics 365 administrator in the source tenant, submit a migration request to the destination tenant. Provide the environment ID and destination tenant ID:

```PowerShell
TenantToTenant-SubmitMigrationRequest -EnvironmentName {EnvironmentId} -TargetTenantID {TenantID}
```

To view the status and migration ID, run:

```PowerShell
TenantToTenant-ViewMigrationRequest
```

> [!NOTE]
> Save the `MigrationID` so you can use it in later migration commands. The source and destination tenants have different migration IDs.

### View and approve migration request (target admin)

As the destination tenant administrator, sign in and review the migration requests and their status. Then approve or reject the request by using its migration ID:

```PowerShell
Add-PowerAppsAccount

TenantToTenant-ViewApprovalRequest

TenantToTenant-ManageMigrationRequest -MigrationId {MigrationId from above command to approve or deny}
```

After you approve the request, notify the source tenant administrator to continue.

### Upload the user-mapping file (source admin)

Run the following command with the user-mapping file. Replace `{EnvironmentId}` with the environment ID and `{FileLocation}` with the full file path. The command returns a shared access signature (SAS) URI for the file.

> [!NOTE]
> Include the file name `usermapping.csv` in the path, such as `C:\Filelocation\usermapping.csv`.

```PowerShell
TenantToTenant-UploadUserMappingFile -EnvironmentName {EnvironmentId} -UserMappingFilePath {FileLocation}
```

Copy the `Read Only UserMapping File ContainerUri` value returned by the command. Use this SAS URI for the `-ReadOnlyUserMappingFileContainerUri` parameter of `TenantToTenant-PrepareMigration`.

### Prepare the environment migration (source admin)

Validate that every user in the user-mapping file is active in the destination tenant.

Use `TenantToTenant-ViewMigrationRequest` in the source tenant to view the migration ID.

```PowerShell
TenantToTenant-PrepareMigration -MigrationId {MigrationId} -TargetTenantId {TargetTenantId} -ReadOnlyUserMappingFileContainerUri {SasUri}
```

> [!NOTE]
> Replace `{SasUri}` with the URI returned by `TenantToTenant-UploadUserMappingFile`.

#### Sample output

The command returns an acceptance response:

```output
Code        : 202
Description : Accepted
```

Validation time depends on the number of users in the user-mapping file. Use `TenantToTenant-GetMigrationStatus`, as shown in the following section, to monitor progress.

### Check status (source admin)

Run the following command to check validation status:

```PowerShell
TenantToTenant-GetMigrationStatus -MigrationId {MigrationId}
```

#### Sample output

The status can include the following messages:

```output
Validate Tenant To Tenant Migration: Running
Validate Tenant To Tenant Migration: Succeeded
Validation Failed, Errors are updated on the blob here: SASURI
```

### Errors and how to resolve them

Use the following guidance to resolve user-mapping errors:

- **The User mapping file provided for Tenant To Tenant migration is invalid**: Ensure the file is named `usermapping.csv` and uses commas to separate values.
- **Line '{line numbers}' have the same '{email ID}'**: Make sure there aren't any duplicate entries.
- **Invalid Email Format '{email ID}'**: Use a valid email address format, such as `testuser@tenantdomain.com`.
- **Target on line '{line number}' is same as source email ID**: Ensure the destination email address differs from the source email address.
- **Each line must have exactly two columns: '{line numbers}'**: Make sure each row has only two columns: the source and destination columns. Remove any extra commas.

After you fix the errors, upload the user-mapping file again by using the same SAS URI.

### Download the error report (source admin)

If the user-mapping file contains errors, download the error report. Copy the `SasUrl` returned by `TenantToTenant-GetMigrationStatus` into your browser. Alternatively, use the following procedure to download the report with PowerShell.

1. Run the following commands in Windows PowerShell ISE. Replace the `$sasUri` placeholder with the SAS URI from the status response, and set `$destinationPath` to your download folder.

    ```powershell
    Import-Module Az.Storage
    # Define the SAS URI of the blob
    $sasUri = " Update the SAS Uri from previous step "
    # Define the path where the blob will be downloaded
    $destinationPath = "C:\Downloads\Failed\"
    # Split the SAS URI on the '?' character to separate the URL and the SAS token
    $url, $sasToken = $sasUri -split '\?', 2
    $containerName = $url.Split('/')[3]
    $storageAccountName = $url.Split('/')[2].Split('.')[0]
    $storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -SasToken $sasToken
    Get-AzStorageBlobContent -Blob "usermapping.csv" -Container $containerName -Destination $destinationPath -Context $storageContext
    ```

2. Fix the issues in the user-mapping file.
3. Upload the file again by following [Upload the user-mapping file (source admin)](#upload-the-user-mapping-file-source-admin).

After you successfully complete [Prepare the environment migration (source admin)](#prepare-the-environment-migration-source-admin), continue with [Migrate the environment (source admin)](#migrate-the-environment-source-admin). Complete the migration within seven days. Otherwise, repeat the preparation procedure.

## Migrate the environment (source admin)

Use `TenantToTenant-ViewMigrationRequest` in the source tenant to view the migration ID. Then run the migration command:

```PowerShell
TenantToTenant-MigratePowerAppEnvironment -MigrationId {MigrationId} -TargetTenantId {TargetTenantId}
```

### Get status (source admin)

Run the following command to check migration status:

```PowerShell
TenantToTenant-GetMigrationStatus -MigrationId {MigrationId}
```

#### Sample output

The status can include the following messages:

```output
Migrate Environment: Running
Migrate Environment: Succeeded
```

> [!NOTE]
> If you encounter any problems running the preceding commands, [submit a support request](get-help-support.md) for help.

## Post-migration process

After you migrate an environment to another tenant:

- The environment URL, organization ID (OrgID), and name stay the same.
- For an environment without finance and operations apps, the source environment no longer includes Dataverse. For an environment that includes finance and operations apps, the source environment isn't preserved in the source tenant.
- Users who aren't in the mapping file aren't migrated or mapped after migration.
- Update security groups in the destination tenant. Security groups aren't migrated.
- Re-enable managed environments in the destination tenant if the source environment was a managed environment. Ensure the destination tenant has the required license.
- Update any environment settings that weren't copied.
- The generative AI feature uses default values at the environment level.

> [!WARNING]
> After the move finishes, [assign the **System Administrator** role](assign-security-roles.md) in the destination environment to the administrators who validate the migration. Security groups aren't migrated, so an administrator who wasn't included in the user-mapping file sees an empty environment. This is a permissions issue, not data loss. Confirm the role assignment before you open a support request.

Complete the applicable post-migration procedures for Power Automate, Power Apps, Copilot Studio, Power Pages, and finance and operations apps.

### Post-migration process for Power Automate

After migration, review the imported components and complete these steps to ensure flows and other assets work correctly:

1. Create or map connections for all connection references.
    - Open the solution in the destination environment.
    - Go to the connection references and reauthenticate or link each one to an existing connection.
2. Turn on all flows.
    - Imported flows are turned off by default.
    - To avoid errors, turn on child flows before the parent flows that call them.
3. Update HTTP trigger URLs.
    - HTTP-triggered flows generate a new URL after import.
    - Update any calling apps, parent flows, or external systems to use the new URL.

### Post-migration process for Power Apps

Import the apps that you exported during preparation.

#### For solution-aware apps

Use solutions to import solution-aware apps.

1. In [Power Apps](https://make.powerapps.com), select the destination environment, and then select **Solutions**.
2. Select **Import**, and then select the packages that you exported during preparation.
3. Check the solution contents in the destination environment to confirm that the import succeeded.

#### For apps that aren't solution aware

Import each app package into the destination environment.

1. Go to [Power Apps](https://make.powerapps.com).
2. Select the destination environment from the environment list.
3. Select **Apps**.
4. Select **Import canvas app**.
5. Upload the app package file.
6. Configure the import options, and then select **Import**.
7. Repeat steps 4-6 until you import all apps.

### Post-migration process for Copilot Studio

Import the agent solutions that you exported during preparation.

1. In [Power Apps](https://make.powerapps.com), select the destination environment, and then select **Solutions**.
2. Select **Import**, and then select the packages that you exported during preparation.
3. Check the solution contents in the destination environment to confirm that the import succeeded.

### Post-migration process for Power Pages

Complete these steps for each website in the destination environment:

1. Sign in to the environment.
2. Open the [admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
3. Provision the website with the same portal type and language.

### Post-migration process for finance and operations apps

Complete these steps in the destination tenant:

1. Reimport the users.
2. Import the updated ISV license files that you obtained from your vendors before the migration.

### Post-migration process for Customer Insights

Complete the post-migration steps for Dynamics 365 Customer Insights - Journeys to restore functionality in the destination tenant. For more information, see [Migrate Dynamics 365 Customer Insights - Journeys between tenants](/dynamics365/customer-insights/journeys/tenant-to-tenant#customer-insights---journeys-app-status-after-migration).

After you complete migration and all applicable post-migration steps, validate the environment in the destination tenant. For environments without finance and operations apps, delete the source environment as described in the following section.

### Delete the source environment

For environments without finance and operations apps, the original environment in the source tenant becomes an orphan environment after migration: it retains its name and URL but no longer contains a Dataverse organization. Delete this orphan environment after you verify that migration succeeded. For environments that include finance and operations apps, the source environment isn't preserved in the source tenant, so this cleanup step doesn't apply.

Before you delete the orphan environment, confirm that:

- Apps, flows, and Power Pages sites work correctly in the destination tenant.
- Any data you need to keep is exported or present in the destination tenant.
- You no longer need the source environment as a fallback.

To delete the orphan environment, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with your source tenant credentials, select the orphan environment, and then select **Delete** on the command bar. For more information, see [Delete an environment](delete-environment.md).

### Frequently asked questions

Find answers to common questions about tenant-to-tenant migration.

#### Are background operations enabled during tenant-to-tenant migration?

Background operations don't run during tenant-to-tenant migration because administration mode is enabled. For more information, see [Administration mode](admin-mode.md).

#### Can all users of the Dataverse organization be migrated?

You can migrate users only if they exist in the destination tenant. For example, the following mappings require both destination users to exist:

```csv
user001@source.com,user001@destination.com
user002@source.com,user002@destination.com
```

#### What environments are supported for migration?

Only production and sandbox environments are supported. Default, developer, trial, and Teams environments aren't supported.

#### Will the environment physically move to the new tenant?

For environments without finance and operations apps, the environment remains in place, but its Dataverse organization moves to a new environment in the destination tenant. Manage the Dataverse organization and its data in the destination tenant. After you validate the migration and confirm that you no longer need the source environment, [delete the orphan environment](#delete-the-source-environment).

For environments that include finance and operations apps, the source environment moves to the destination tenant and isn't preserved in the source tenant.

#### Are there any components that aren't fully supported?

For more information about which components are supported and which components aren't supported, see [Before you get started](#before-you-get-started).

#### What happens to mailbox configurations?

If a user in the user-mapping file has a mailbox in the destination tenant, the migration configures it automatically. Otherwise, reconfigure the mailbox manually.

#### How do I initiate a migration?

Start a tenant-to-tenant migration by using the Power Platform admin center or PowerShell. Both methods are supported:

- **Power Platform admin center**: Go to **Manage** > **Environments**, select the environment, and then select **Move environment** on the command bar. For more information, see [Migrate using Power Platform admin center](#migrate-using-power-platform-admin-center).
- **PowerShell**: Use the `TenantToTenant-SubmitMigrationRequest` cmdlet with the environment ID and target tenant ID. For more information, see [Migrate using PowerShell](#migrate-using-powershell).

With either method, the destination tenant administrator must approve the request before the move can proceed.

#### How long will the migration take?

Migration time depends on the number of users in the user-mapping file. A migration that doesn't appear to be making progress hasn't necessarily failed. Allow up to 24 hours for migration to finish.

#### Is there a self-serve UI option?

Yes. You can submit, approve, and complete the migration entirely through the Power Platform admin center without using PowerShell. For more information, see [Migrate using Power Platform admin center](#migrate-using-power-platform-admin-center).
