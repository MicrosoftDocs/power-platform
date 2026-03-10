---
title: "Tutorial: Assign roles to service principals (preview) | Microsoft Docs"
description: Learn how to use the Power Platform Authorization API and management SDKs to assign RBAC roles to service principals at the tenant scope.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/02/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType:
  - admin
---

# Tutorial: Assign roles to service principals (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Role-based access control (RBAC) in Power Platform lets administrators assign built-in roles to users, groups, and service principals at the tenant, environment group, or environment scope. This tutorial walks through a common automation scenario: assigning the **Contributor** role to a service principal at the **tenant scope** using the Authorization API.

To learn more about RBAC concepts, built-in roles, and scope inheritance, see [Role-based access control for Power Platform admin center](security/role-based-access-control.md).

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

In this tutorial, you'll learn to:

> [!div class="checklist"]
>
> + Authenticate with the Power Platform API.
> + List available role definitions.
> + Create a role assignment for a service principal at the tenant scope.
> + Verify the role assignment.

## Prerequisites

- A Microsoft Entra app registration configured for the Power Platform API, with a certificate or client secret for service principal authentication. For guidance, see [Authentication](programmability-authentication-v2.md).
- The **Enterprise Application Object ID** for the service principal (found in **Microsoft Entra ID** > **Enterprise applications**).
- The calling identity must have the **Power Platform Administrator** or **Power Platform role-based access control administrator** role.

## Built-in role definitions

Power Platform provides four built-in roles that can be assigned via RBAC. Each role has a fixed set of permissions and can be assigned at the tenant, environment group, or environment scope.

| Role name | Role ID | Permissions |
|-----------|---------|-------------|
| Power Platform owner | `0cb07c69-1631-4725-ab35-e59e001c51ea` | All permissions |
| Power Platform contributor | `ff954d61-a89a-4fbe-ace9-01c367b89f87` | Manage and read all resources, but can't make or change role assignments |
| Power Platform reader | `c886ad2e-27f7-4874-8381-5849b8d8a090` | Read-only access to all resources |
| Power Platform role-based access control administrator | `95e94555-018c-447b-8691-bdac8e12211e` | Read all resources + manage role assignments |

## Step 1. List available role definitions

First, authenticate and retrieve the available role definitions to confirm the contributor role ID.

# [PowerShell](#tab/PowerShell)

```powershell
# Install the Az.Accounts module if not already installed
Install-Module -Name Az.Accounts

# Set your tenant ID
$TenantId = "YOUR_TENANT_ID"

# Authenticate and obtain an access token
Connect-AzAccount
$AccessToken = Get-AzAccessToken -TenantId $TenantId -ResourceUrl "https://api.powerplatform.com/"

$headers = @{ 'Authorization' = 'Bearer ' + $AccessToken.Token }
$headers.Add('Content-Type', 'application/json')

# List all role definitions
$roleDefinitions = Invoke-RestMethod -Method Get -Uri "https://api.powerplatform.com/authorization/roleDefinitions?api-version=2024-10-01" -Headers $headers

$roleDefinitions.value | Format-Table roleDefinitionName, roleDefinitionId
```

Expected output:

```
roleDefinitionName                                          roleDefinitionId
------------------                                          ----------------
Power Platform owner                                        0cb07c69-1631-4725-ab35-e59e001c51ea
Power Platform contributor                                  ff954d61-a89a-4fbe-ace9-01c367b89f87
Power Platform reader                                       c886ad2e-27f7-4874-8381-5849b8d8a090
Power Platform role-based access control administrator      95e94555-018c-447b-8691-bdac8e12211e
```

# [C#](#tab/CSharp)

```csharp
using Microsoft.PowerPlatform.Management;
using Microsoft.PowerPlatform.Management.Models;

var client = ServiceClientFactory.Create(clientId);

// List all role definitions
var roleDefinitions = await client.Authorization.RoleDefinitions.GetAsync();

foreach (var role in roleDefinitions.Value)
{
    Console.WriteLine($"{role.RoleDefinitionName}: {role.RoleDefinitionId}");
}
```

Expected output:

```
Power Platform owner: 0cb07c69-1631-4725-ab35-e59e001c51ea
Power Platform contributor: ff954d61-a89a-4fbe-ace9-01c367b89f87
Power Platform reader: c886ad2e-27f7-4874-8381-5849b8d8a090
Power Platform role-based access control administrator: 95e94555-018c-447b-8691-bdac8e12211e
```

# [Python](#tab/Python)

```python
import asyncio
from azure.identity import InteractiveBrowserCredential
from kiota_authentication_azure.azure_identity_authentication_provider import AzureIdentityAuthenticationProvider
from kiota_http.httpx_request_adapter import HttpxRequestAdapter
from mspp_management.service_client_base import ServiceClientBase

credential = InteractiveBrowserCredential()
auth_provider = AzureIdentityAuthenticationProvider(
    credential,
    scopes=["https://api.powerplatform.com/.default"]
)
adapter = HttpxRequestAdapter(auth_provider)
adapter.base_url = "https://api.powerplatform.com"
client = ServiceClientBase(adapter)

# List all role definitions
role_definitions = await client.authorization.role_definitions.get()

for role in role_definitions.value:
    print(f"{role.role_definition_name}: {role.role_definition_id}")
```

Expected output:

```
Power Platform owner: 0cb07c69-1631-4725-ab35-e59e001c51ea
Power Platform contributor: ff954d61-a89a-4fbe-ace9-01c367b89f87
Power Platform reader: c886ad2e-27f7-4874-8381-5849b8d8a090
Power Platform role-based access control administrator: 95e94555-018c-447b-8691-bdac8e12211e
```

---

Power Platform API reference: [Role-Based Access Control - List Role Definitions](/rest/api/power-platform/authorization/role-based-access-control/list-role-definitions)

## Step 2. Assign the Contributor role to a service principal

Create a role assignment that grants the **Power Platform contributor** role to a service principal at the tenant scope. Replace `YOUR_TENANT_ID` with your tenant GUID and `YOUR_ENTERPRISE_APP_OBJECT_ID` with the enterprise application object ID from Microsoft Entra ID.

# [PowerShell](#tab/PowerShell)

```powershell
$TenantId = "YOUR_TENANT_ID"
$EnterpriseAppObjectId = "YOUR_ENTERPRISE_APP_OBJECT_ID"

$body = @{
    roleDefinitionId = "ff954d61-a89a-4fbe-ace9-01c367b89f87"
    principalObjectId = $EnterpriseAppObjectId
    principalType = "ApplicationUser"
    scope = "/tenants/$TenantId"
} | ConvertTo-Json

$roleAssignment = Invoke-RestMethod -Method Post -Uri "https://api.powerplatform.com/authorization/roleAssignments?api-version=2024-10-01" -Headers $headers -Body $body

$roleAssignment
```

Expected output:

```
roleAssignmentId   : a1b2c3d4-e5f6-7890-abcd-ef1234567890
principalObjectId  : <your-enterprise-app-object-id>
roleDefinitionId   : ff954d61-a89a-4fbe-ace9-01c367b89f87
scope              : /tenants/<your-tenant-id>
principalType      : ApplicationUser
createdOn          : 2026-03-02T12:00:00.0000000+00:00
```

# [C#](#tab/CSharp)

```csharp
var request = new RoleAssignmentRequest
{
    RoleDefinitionId = "ff954d61-a89a-4fbe-ace9-01c367b89f87",
    PrincipalObjectId = "YOUR_ENTERPRISE_APP_OBJECT_ID",
    PrincipalType = "ApplicationUser",
    Scope = "/tenants/YOUR_TENANT_ID"
};

var roleAssignment = await client.Authorization.RoleAssignments.PostAsync(request);

Console.WriteLine($"Assignment ID: {roleAssignment.Value[0].RoleAssignmentId}");
Console.WriteLine($"Scope: {roleAssignment.Value[0].Scope}");
Console.WriteLine($"Principal: {roleAssignment.Value[0].PrincipalObjectId}");
```

# [Python](#tab/Python)

```python
from mspp_management.models.role_assignment_request import RoleAssignmentRequest

request = RoleAssignmentRequest(
    role_definition_id="ff954d61-a89a-4fbe-ace9-01c367b89f87",
    principal_object_id="YOUR_ENTERPRISE_APP_OBJECT_ID",
    principal_type="ApplicationUser",
    scope="/tenants/YOUR_TENANT_ID",
)

role_assignment = await client.authorization.role_assignments.post(request)

print(f"Assignment ID: {role_assignment.value[0].role_assignment_id}")
print(f"Scope: {role_assignment.value[0].scope}")
print(f"Principal: {role_assignment.value[0].principal_object_id}")
```

---

Power Platform API reference: [Role-Based Access Control - Create Role Assignment](/rest/api/power-platform/authorization/role-based-access-control/create-role-assignment)

## Step 3. Verify the role assignment

Retrieve all role assignments to confirm the new assignment exists.

# [PowerShell](#tab/PowerShell)

```powershell
$roleAssignments = Invoke-RestMethod -Method Get -Uri "https://api.powerplatform.com/authorization/roleAssignments?api-version=2024-10-01" -Headers $headers

# Filter for the service principal's assignments
$roleAssignments.value | Where-Object { $_.principalObjectId -eq $EnterpriseAppObjectId } | Format-Table roleAssignmentId, roleDefinitionId, scope, principalType
```

Expected output:

```
roleAssignmentId                        roleDefinitionId                        scope                          principalType
----------------                        ----------------                        -----                          -------------
a1b2c3d4-e5f6-7890-abcd-ef1234567890    ff954d61-a89a-4fbe-ace9-01c367b89f87    /tenants/<your-tenant-id>      ApplicationUser
```

# [C#](#tab/CSharp)

```csharp
var roleAssignments = await client.Authorization.RoleAssignments.GetAsync();

var myAssignments = roleAssignments.Value
    .Where(a => a.PrincipalObjectId == "YOUR_ENTERPRISE_APP_OBJECT_ID");

foreach (var assignment in myAssignments)
{
    Console.WriteLine($"ID: {assignment.RoleAssignmentId}");
    Console.WriteLine($"Role: {assignment.RoleDefinitionId}");
    Console.WriteLine($"Scope: {assignment.Scope}");
    Console.WriteLine($"Type: {assignment.PrincipalType}");
}
```

# [Python](#tab/Python)

```python
role_assignments = await client.authorization.role_assignments.get()

my_assignments = [
    a for a in role_assignments.value
    if a.principal_object_id == "YOUR_ENTERPRISE_APP_OBJECT_ID"
]

for assignment in my_assignments:
    print(f"ID: {assignment.role_assignment_id}")
    print(f"Role: {assignment.role_definition_id}")
    print(f"Scope: {assignment.scope}")
    print(f"Type: {assignment.principal_type}")
```

---

Power Platform API reference: [Role Based Access Control - List Role Assignments](/rest/api/power-platform/authorization/role-based-access-control/list-role-assignments)

### Related content

- [Role-based access control for Power Platform admin center](security/role-based-access-control.md)
- [Permission reference](programmability-permission-reference.md)
- [Authentication - create your first app registration](programmability-authentication-v2.md)
