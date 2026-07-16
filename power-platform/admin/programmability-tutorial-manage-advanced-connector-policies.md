---
title: Manage advanced connector policies programmatically
description: Learn how to create, assign, copy, modify, and remove advanced connector policies (ACP) by using the Power Platform API and the administration (Admin) SDKs for PowerShell, C#, and Python.
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/14/2026
author: laneswenka
ms.author: laswenka
ms.reviewer: sericks
ms.subservice: admin
search.audienceType:
  - admin
---

# Tutorial: Manage advanced connector policies programmatically

[Advanced connector policies](advanced-connector-policies.md) (ACP) govern connector usage with a strict allowlist that blocks connectors by default. In addition to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) experience, you can manage ACP with code by using the [Power Platform API](/rest/api/power-platform/governance/rule-based-policies) and the administration (Admin) SDKs. Automating ACP is useful when you standardize governance across many environment groups, replicate a baseline policy between groups, or manage policies as part of a deployment pipeline.

In this tutorial, learn how to:

1. [Authenticate using Power Platform API](#step-1-authenticate-using-power-platform-api).
1. [Understand the ACP policy shape](#step-2-understand-the-acp-policy-shape).
1. [Create a policy and add it to an environment group](#step-3-create-a-policy-and-add-it-to-an-environment-group).
1. [Enable an individual connector action](#step-4-enable-an-individual-connector-action).
1. [Apply or update a policy on a single environment](#step-5-apply-or-update-a-policy-on-a-single-environment).
1. [Copy a policy from one environment group to another](#step-6-copy-a-policy-from-one-environment-group-to-another).
1. [Remove ACP from an environment group](#step-7-remove-acp-from-an-environment-group).

Advanced connector policies are exposed through the `governance/ruleBasedPolicies` operations of the Power Platform API. A *policy* contains one or more *rule sets*; the rule set with the ID `ConnectorManagement` holds the ACP connector allowlist. All examples in the article use API version `2024-10-01`.

## Prerequisites

- An [app registration configured for Power Platform API](programmability-authentication-v2.md). Note the app registration's **application (client) ID** and **directory (tenant) ID**.
- Permission to manage governance policies. For service principals, assign an RBAC role that can write resources, such as **Power Platform contributor** or **Power Platform owner**. For more information, see [Tutorial: Assign roles to service principals](programmability-tutorial-rbac-role-assignment.md).
- For the SDK examples, install the SDK that ships monthly on its public gallery:
  - **C#**: the [Microsoft.PowerPlatform.Management](https://www.nuget.org/packages/Microsoft.PowerPlatform.Management/) NuGet package.
  - **Python**: the [powerplatform-management](https://pypi.org/project/powerplatform-management/) PyPI package.

  ```dotnetcli
  dotnet add package Microsoft.PowerPlatform.Management
  ```

  ```bash
  pip install powerplatform-management
  ```

## Step 1. Authenticate using Power Platform API

All examples authenticate with your app registration's **client ID**, following the guidance in [Authentication](programmability-authentication-v2.md). The following examples sign in interactively as the current user. To run unattended as a service principal, see the confidential client flow in the [Authentication](programmability-authentication-v2.md#confidential-client-service-principal) article and assign the service principal an [RBAC role](programmability-tutorial-rbac-role-assignment.md).

### [PowerShell](#tab/powershell)

```powershell
# Requires the MSAL.PS module: Install-Module MSAL.PS -Scope CurrentUser
Import-Module "MSAL.PS"

$clientId  = "<application (client) ID of your app registration>"
$apiBaseUrl = "https://api.powerplatform.com"
$apiVersion = "2024-10-01"

# Sign in interactively and request a token for the Power Platform API
$auth = Get-MsalToken -ClientId $clientId -Scope "https://api.powerplatform.com/.default" -Interactive
$headers = @{ Authorization = "Bearer $($auth.AccessToken)" }
```

### [C#](#tab/csharp)

```csharp
using Microsoft.PowerPlatform.Management;
using Microsoft.PowerPlatform.Management.Models;

// Create an interactive client using your app registration's client ID.
// A browser window opens for sign-in.
var factory = new ServiceClientFactory();
var client = factory.Create("YOUR_CLIENT_ID");
```

### [Python](#tab/python)

```python
import asyncio
from azure.identity import InteractiveBrowserCredential
from kiota_authentication_azure.azure_identity_authentication_provider import (
    AzureIdentityAuthenticationProvider,
)
from kiota_http.httpx_request_adapter import HttpxRequestAdapter
from mspp_management.service_client_base import ServiceClientBase

# Sign in interactively using your app registration's client ID.
credential = InteractiveBrowserCredential(client_id="YOUR_CLIENT_ID")
auth_provider = AzureIdentityAuthenticationProvider(
    credentials=credential,
    scopes=["https://api.powerplatform.com/.default"],
)
adapter = HttpxRequestAdapter(authentication_provider=auth_provider)
client = ServiceClientBase(adapter)
```

---

## Step 2. Understand the ACP policy shape

An advanced connector policy is a rule-based policy that contains a rule set with the ID `ConnectorManagement`. That rule set carries a `version` and its `inputs` hold an `AllowedConnectorList`, where each entry allows a connector and sets how its actions and connection types are governed:

```json
{
  "name": "Contoso ACP baseline",
  "ruleSets": [
    {
      "id": "ConnectorManagement",
      "version": "1.0",
      "inputs": {
        "AllowedConnectorList": [
          {
            "AllowedConnector": "/providers/Microsoft.PowerApps/apis/shared_office365",
            "AllowedActionsMode": "AllAllowed",
            "AllowedConnectionTypesMode": "AllAllowed"
          },
          {
            "AllowedConnector": "/providers/Microsoft.PowerApps/apis/shared_commondataserviceforapps",
            "AllowedActionsMode": "SomeAllowed",
            "AllowedActions": ["GetItem", "CreateRecord"],
            "AllowedConnectionTypesMode": "AllAllowed"
          }
        ]
      }
    }
  ]
}
```

Keep the following semantics in mind:

- A connector that isn't in `AllowedConnectorList` is **blocked** (default-deny).
- Each entry sets `AllowedActionsMode`. `AllAllowed` permits every action on the connector. `SomeAllowed` restricts the connector to the actions listed in the entry's `AllowedActions` array. [Step 4](#step-4-enable-an-individual-connector-action) shows how to add an action and set this mode.
- `AllowedConnectionTypesMode` governs which connection types are allowed and follows the same `AllAllowed` pattern.
- Include the rule set's `version` when you create or update a policy. Read it from an existing policy and preserve the value that the service returns.

> [!TIP]
> The exact value of `AllowedConnector` is the connector's resource identifier. The most reliable way to learn the shape for connectors already in your tenant is to read an existing policy first ([Step 4](#step-4-enable-an-individual-connector-action) shows how) or use the connector catalog (described next), then mirror that shape when you create or update policies.

### Find connector and action IDs with the connector catalog

To discover which connectors and actions you can allow, use the [Connector Catalog API](/rest/api/power-platform/connectivity/connectors/list-connectors). It lists the connectors available in an environment, along with the identifiers you place in `AllowedConnector` and `AllowedActions`.

> [!NOTE]
> The connector catalog operations require an **environment ID in the path** *and* an OData `$filter` that specifies the **same** environment - for example, `$filter=environment eq '<environmentId>'`. Both are required.

```powershell
$environmentId = "<environment ID>"
$filter = [uri]::EscapeDataString("environment eq '$environmentId'")

# List connectors available in the environment
$connectors = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/connectivity/environments/$environmentId/connectors?`$filter=$filter&api-version=$apiVersion" `
    -Headers $headers
$connectors.value | Select-Object name, @{ n = "displayName"; e = { $_.properties.displayName } }

# Get a single connector by ID (the connector's name, such as shared_office365)
$connectorId = "shared_office365"
$connector = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/connectivity/environments/$environmentId/connectors/$connectorId?`$filter=$filter&api-version=$apiVersion" `
    -Headers $headers
$connector.id   # full resource path to use as AllowedConnector
```

Use the connector's `id` (its full resource path, such as `/providers/Microsoft.PowerApps/apis/shared_office365`) as the `AllowedConnector` value, and the connector's operation IDs as the values in `AllowedActions`. You can access the same catalog through the `connectivity` namespace of the Admin SDKs.

## Step 3. Create a policy and add it to an environment group

Adding ACP to an environment group is a two-part operation: create the policy, then assign it to the group. The create call returns the new policy `id`, which you use in the assignment call.

To assign the policy to the whole group, send an assignment request with an empty body (`{}`). Every environment in the group inherits the policy and stays in sync with it.

### [PowerShell](#tab/powershell)

```powershell
$environmentGroupId = "<environment group ID>"

# 1. Create the policy with a ConnectorManagement rule set
$policyBody = @{
    name     = "Contoso ACP baseline"
    ruleSets = @(
        @{
            id      = "ConnectorManagement"
            version = "1.0"
            inputs  = @{
                AllowedConnectorList = @(
                    @{
                        AllowedConnector           = "/providers/Microsoft.PowerApps/apis/shared_office365"
                        AllowedActionsMode         = "AllAllowed"
                        AllowedConnectionTypesMode = "AllAllowed"
                    }
                )
            }
        }
    )
} | ConvertTo-Json -Depth 10

$policy = Invoke-RestMethod -Method Post `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body $policyBody
Write-Host "Created policy $($policy.id)"

# 2. Assign the policy to the environment group (empty body = whole group)
Invoke-RestMethod -Method Post `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$($policy.id)/environmentGroups/$environmentGroupId/assignments?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body "{}"
Write-Host "Assigned policy $($policy.id) to group $environmentGroupId"
```

### [C#](#tab/csharp)

```csharp
var environmentGroupId = "<environment group ID>";

// 1. Create the policy with a ConnectorManagement rule set
var ruleSet = new RuleSet { Id = "ConnectorManagement", Version = "1.0", Inputs = new RuleSet_inputs() };
ruleSet.Inputs.AdditionalData["AllowedConnectorList"] = new List<object>
{
    new Dictionary<string, object>
    {
        ["AllowedConnector"] = "/providers/Microsoft.PowerApps/apis/shared_office365",
        ["AllowedActionsMode"] = "AllAllowed",
        ["AllowedConnectionTypesMode"] = "AllAllowed"
    }
};

var policyRequest = new PolicyRequest
{
    Name = "Contoso ACP baseline",
    RuleSets = new List<RuleSet> { ruleSet }
};

var policy = await client.Governance.RuleBasedPolicies.PostAsync(policyRequest);
Console.WriteLine($"Created policy {policy.Id}");

// 2. Assign the policy to the environment group (empty request = whole group)
await client.Governance.RuleBasedPolicies[policy.Id]
    .EnvironmentGroups[environmentGroupId]
    .Assignments.PostAsync(new PolicyAssignmentRequest());
Console.WriteLine($"Assigned policy {policy.Id} to group {environmentGroupId}");
```

### [Python](#tab/python)

```python
from mspp_management.models.policy_request import PolicyRequest
from mspp_management.models.rule_set import RuleSet
from mspp_management.models.rule_set_inputs import RuleSet_inputs
from mspp_management.models.policy_assignment_request import PolicyAssignmentRequest

async def create_and_assign(client, environment_group_id: str):
    # 1. Create the policy with a ConnectorManagement rule set
    rule_set = RuleSet()
    rule_set.id = "ConnectorManagement"
    rule_set.version = "1.0"
    rule_set.inputs = RuleSet_inputs()
    rule_set.inputs.additional_data = {
        "AllowedConnectorList": [
            {
                "AllowedConnector": "/providers/Microsoft.PowerApps/apis/shared_office365",
                "AllowedActionsMode": "AllAllowed",
                "AllowedConnectionTypesMode": "AllAllowed",
            }
        ]
    }

    policy_request = PolicyRequest()
    policy_request.name = "Contoso ACP baseline"
    policy_request.rule_sets = [rule_set]

    policy = await client.governance.rule_based_policies.post(policy_request)
    print(f"Created policy {policy.id}")

    # 2. Assign the policy to the environment group (empty request = whole group)
    await (
        client.governance.rule_based_policies
        .by_policy_id(policy.id)
        .environment_groups.by_group_id(environment_group_id)
        .assignments.post(PolicyAssignmentRequest())
    )
    print(f"Assigned policy {policy.id} to group {environment_group_id}")
```

---

## Step 4. Enable an individual connector action

To allow only specific actions on a connector, set its `AllowedActionsMode` to `SomeAllowed` and list the permitted actions in `AllowedActions`. This example adds an action, such as a hidden action that isn't selectable in the admin center, to a connector's allowlist and sets the connector to `SomeAllowed`. Read the policy, update the connector entry, and send the updated rule set back by using *patch*. Patch updates a rule set by ID and leaves the policy's other rule sets untouched.

### [PowerShell](#tab/powershell)

```powershell
$policyId     = "<policy ID>"
$connectorId  = "shared_commondataserviceforapps"   # last segment of AllowedConnector
$actionToAdd  = "aibuilderpredict_customprompt"

# 1. Read the current policy
$policy = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId`?api-version=$apiVersion" `
    -Headers $headers

# 2. Find the ConnectorManagement rule set and the connector entry
$ruleSet = $policy.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }
$entry = $ruleSet.inputs.AllowedConnectorList |
    Where-Object { ($_.AllowedConnector -split "/")[-1] -eq $connectorId }

# 3. Restrict the connector to specific actions: add the action and set SomeAllowed
if ($entry) {
    $actions = @()
    if ($entry.PSObject.Properties.Name -contains "AllowedActions") { $actions = @($entry.AllowedActions) }
    if ($actions -notcontains $actionToAdd) { $actions += $actionToAdd }
    $entry | Add-Member -NotePropertyName AllowedActions -NotePropertyValue $actions -Force
    $entry.AllowedActionsMode = "SomeAllowed"

    # 4. Patch only the modified rule set back to the policy
    $patchBody = @{ name = $policy.name; ruleSets = @($ruleSet) } | ConvertTo-Json -Depth 10
    Invoke-RestMethod -Method Patch `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId`?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body $patchBody
    Write-Host "Set '$connectorId' to SomeAllowed with '$actionToAdd' in policy $policyId"
}
```

### [C#](#tab/csharp)

```csharp
var policyId = "<policy ID>";
var connectorId = "shared_commondataserviceforapps";   // last segment of AllowedConnector
var actionToAdd = "aibuilderpredict_customprompt";

// 1. Read the current policy
var policy = await client.Governance.RuleBasedPolicies[policyId].GetAsync();

// 2. Find the ConnectorManagement rule set and the connector entry
var ruleSet = policy.RuleSets.First(r => r.Id == "ConnectorManagement");
var connectorList = (List<object>)ruleSet.Inputs.AdditionalData["AllowedConnectorList"];
var entry = connectorList
    .Cast<Dictionary<string, object>>()
    .First(e => ((string)e["AllowedConnector"]).Split('/').Last() == connectorId);

// 3. Restrict the connector to specific actions: add the action and set SomeAllowed
if (!(entry.TryGetValue("AllowedActions", out var actionsObj) && actionsObj is List<object> actions))
{
    actions = new List<object>();
}
if (!actions.Contains(actionToAdd)) actions.Add(actionToAdd);
entry["AllowedActions"] = actions;
entry["AllowedActionsMode"] = "SomeAllowed";

// 4. Patch only the modified rule set back to the policy
var patch = new PolicyRequest { Name = policy.Name, RuleSets = new List<RuleSet> { ruleSet } };
await client.Governance.RuleBasedPolicies[policyId].PatchAsync(patch);
Console.WriteLine($"Set '{connectorId}' to SomeAllowed with '{actionToAdd}' in policy {policyId}");
```

### [Python](#tab/python)

```python
async def enable_action(client, policy_id: str, connector_id: str, action_to_add: str):
    # 1. Read the current policy
    policy = await client.governance.rule_based_policies.by_policy_id(policy_id).get()

    # 2. Find the ConnectorManagement rule set and the connector entry
    rule_set = next(r for r in policy.rule_sets if r.id == "ConnectorManagement")
    connector_list = rule_set.inputs.additional_data["AllowedConnectorList"]
    entry = next(
        e for e in connector_list
        if e["AllowedConnector"].split("/")[-1] == connector_id
    )

    # 3. Restrict the connector to specific actions: add the action and set SomeAllowed
    actions = entry.get("AllowedActions") or []
    if action_to_add not in actions:
        actions.append(action_to_add)
    entry["AllowedActions"] = actions
    entry["AllowedActionsMode"] = "SomeAllowed"

    # 4. Patch only the modified rule set back to the policy
    from mspp_management.models.policy_request import PolicyRequest
    patch = PolicyRequest()
    patch.name = policy.name
    patch.rule_sets = [rule_set]
    await client.governance.rule_based_policies.by_policy_id(policy_id).patch(patch)
    print(f"Set '{connector_id}' to SomeAllowed with '{action_to_add}' in policy {policy_id}")
```

---

## Step 5. Apply or update a policy on a single environment

You can target a policy at a single environment instead of an environment group. This approach is useful for high-risk, pilot, or regulated environments. Assign the policy to the environment, and use the same patch pattern from Step 4 to modify it later. Each environment supports one effective ACP policy.

### [PowerShell](#tab/powershell)

```powershell
$policyId       = "<policy ID>"
$environmentId  = "<environment ID>"

# Assign the policy directly to the environment
Invoke-RestMethod -Method Post `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId/environments/$environmentId/assignments?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body "{}"
Write-Host "Assigned policy $policyId to environment $environmentId"
```

### [C#](#tab/csharp)

```csharp
var policyId = "<policy ID>";
var environmentId = "<environment ID>";

// Assign the policy directly to the environment
await client.Governance.RuleBasedPolicies[policyId]
    .Environments[environmentId]
    .Assignments.PostAsync(new PolicyAssignmentRequest());
Console.WriteLine($"Assigned policy {policyId} to environment {environmentId}");
```

### [Python](#tab/python)

```python
async def assign_to_environment(client, policy_id: str, environment_id: str):
    from mspp_management.models.policy_assignment_request import PolicyAssignmentRequest
    await (
        client.governance.rule_based_policies
        .by_policy_id(policy_id)
        .environments.by_environment_id(environment_id)
        .assignments.post(PolicyAssignmentRequest())
    )
    print(f"Assigned policy {policy_id} to environment {environment_id}")
```

---

## Step 6. Copy a policy from one environment group to another

When you replicate a governance baseline to another group, choose how much to copy by using the `CopyAllRules` flag:

- **`CopyAllRules = true`**: Create a new policy from *all* of the source group's rule sets and assign it to the target group. The target group's governance becomes an independent copy of the source.
- **`CopyAllRules = false`**: Extract only the `ConnectorManagement` rule set from the source policy and merge it into the target group's existing policy. The patch operation adds or updates the rule set by ID, so the target group keeps its other rules.

### [PowerShell](#tab/powershell)

```powershell
$sourceGroupId = "<source environment group ID>"
$targetGroupId = "<target environment group ID>"
$CopyAllRules  = $true

# 1. Find and read the policy assigned to the source group
$sourceAssignments = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/environmentGroups/$sourceGroupId/assignments?api-version=$apiVersion" `
    -Headers $headers
$sourcePolicyId = $sourceAssignments.value[0].policyId
$source = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$sourcePolicyId`?api-version=$apiVersion" `
    -Headers $headers

if ($CopyAllRules) {
    # 2a. Copy ALL rule sets into a new policy and assign it to the target group
    $copyBody = @{ name = "$($source.name) (copy)"; ruleSets = $source.ruleSets } | ConvertTo-Json -Depth 20
    $copy = Invoke-RestMethod -Method Post `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body $copyBody
    Invoke-RestMethod -Method Post `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$($copy.id)/environmentGroups/$targetGroupId/assignments?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body "{}"
    Write-Host "Copied all rules to policy $($copy.id) and assigned it to group $targetGroupId"
}
else {
    # 2b. Merge ONLY the ConnectorManagement rule into the target group's existing policy
    $sourceCm = $source.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }

    $targetAssignments = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/environmentGroups/$targetGroupId/assignments?api-version=$apiVersion" `
        -Headers $headers
    $targetPolicyId = $targetAssignments.value[0].policyId
    $targetPolicy = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$targetPolicyId`?api-version=$apiVersion" `
        -Headers $headers

    # Patch adds or updates the ConnectorManagement rule set by ID, keeping the target's other rules
    $patchBody = @{ name = $targetPolicy.name; ruleSets = @($sourceCm) } | ConvertTo-Json -Depth 20
    Invoke-RestMethod -Method Patch `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$targetPolicyId`?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body $patchBody
    Write-Host "Merged the ConnectorManagement rule into target policy $targetPolicyId"
}
```

### [C#](#tab/csharp)

```csharp
var sourceGroupId = "<source environment group ID>";
var targetGroupId = "<target environment group ID>";
var copyAllRules = true;

// 1. Find and read the policy assigned to the source group
var sourceAssignments = await client.Governance.RuleBasedPolicies
    .EnvironmentGroups[sourceGroupId].Assignments.GetAsync();
var sourcePolicyId = sourceAssignments.Value.First().PolicyId;
var source = await client.Governance.RuleBasedPolicies[sourcePolicyId].GetAsync();

if (copyAllRules)
{
    // 2a. Copy ALL rule sets into a new policy and assign it to the target group
    var copyRequest = new PolicyRequest { Name = $"{source.Name} (copy)", RuleSets = source.RuleSets };
    var copy = await client.Governance.RuleBasedPolicies.PostAsync(copyRequest);
    await client.Governance.RuleBasedPolicies[copy.Id]
        .EnvironmentGroups[targetGroupId]
        .Assignments.PostAsync(new PolicyAssignmentRequest());
    Console.WriteLine($"Copied all rules to policy {copy.Id} and assigned it to group {targetGroupId}");
}
else
{
    // 2b. Merge ONLY the ConnectorManagement rule into the target group's existing policy
    var sourceCm = source.RuleSets.First(r => r.Id == "ConnectorManagement");

    var targetAssignments = await client.Governance.RuleBasedPolicies
        .EnvironmentGroups[targetGroupId].Assignments.GetAsync();
    var targetPolicyId = targetAssignments.Value.First().PolicyId;
    var targetPolicy = await client.Governance.RuleBasedPolicies[targetPolicyId].GetAsync();

    // Patch adds or updates the ConnectorManagement rule set by ID, keeping the target's other rules
    var patch = new PolicyRequest { Name = targetPolicy.Name, RuleSets = new List<RuleSet> { sourceCm } };
    await client.Governance.RuleBasedPolicies[targetPolicyId].PatchAsync(patch);
    Console.WriteLine($"Merged the ConnectorManagement rule into target policy {targetPolicyId}");
}
```

### [Python](#tab/python)

```python
async def copy_policy(client, source_group_id: str, target_group_id: str, copy_all_rules: bool = True):
    from mspp_management.models.policy_request import PolicyRequest
    from mspp_management.models.policy_assignment_request import PolicyAssignmentRequest

    # 1. Find and read the policy assigned to the source group
    source_assignments = await (
        client.governance.rule_based_policies
        .environment_groups.by_environment_group_id(source_group_id)
        .assignments.get()
    )
    source_policy_id = source_assignments.value[0].policy_id
    source = await client.governance.rule_based_policies.by_policy_id(source_policy_id).get()

    if copy_all_rules:
        # 2a. Copy ALL rule sets into a new policy and assign it to the target group
        copy_request = PolicyRequest()
        copy_request.name = f"{source.name} (copy)"
        copy_request.rule_sets = source.rule_sets
        copy = await client.governance.rule_based_policies.post(copy_request)
        await (
            client.governance.rule_based_policies
            .by_policy_id(copy.id)
            .environment_groups.by_group_id(target_group_id)
            .assignments.post(PolicyAssignmentRequest())
        )
        print(f"Copied all rules to policy {copy.id} and assigned it to group {target_group_id}")
    else:
        # 2b. Merge ONLY the ConnectorManagement rule into the target group's existing policy
        source_cm = next(r for r in source.rule_sets if r.id == "ConnectorManagement")

        target_assignments = await (
            client.governance.rule_based_policies
            .environment_groups.by_environment_group_id(target_group_id)
            .assignments.get()
        )
        target_policy_id = target_assignments.value[0].policy_id
        target_policy = await client.governance.rule_based_policies.by_policy_id(target_policy_id).get()

        # Patch adds or updates the ConnectorManagement rule set by ID, keeping the target's other rules
        patch = PolicyRequest()
        patch.name = target_policy.name
        patch.rule_sets = [source_cm]
        await client.governance.rule_based_policies.by_policy_id(target_policy_id).patch(patch)
        print(f"Merged the ConnectorManagement rule into target policy {target_policy_id}")
```

---

## Step 7. Remove ACP from an environment group

While a group has an active ACP rule, every environment in the group matches the group's policy. How you remove enforcement depends on whether you want those environments to keep their current configuration or clear ACP entirely:

- **Remove the rule from the group's policy** to stop the group from managing ACP. Use the `removeRule` operation to remove the `ConnectorManagement` rule set from the group's policy. The environments keep their last-applied ACP configuration, but they're no longer kept in sync with the group. You can manage each environment individually and let them diverge.
- **Remove ACP from the group and from every environment** to turn ACP off everywhere. Remove the rule from the group's policy, then loop through the group's environments and remove the `ConnectorManagement` rule set from each environment's policy as well.

> [!NOTE]
> Removing the rule from a group's policy doesn't automatically clear ACP from the environments that inherited it. Those environments retain their last-applied configuration to avoid an enforcement gap. To clear ACP everywhere, remove it from each environment, as shown in the loop example. For more information, see [Advanced connector policies](advanced-connector-policies.md).

### Remove the rule from the group's policy

The following example removes the `ConnectorManagement` rule set from a policy by using the `removeRule` operation.

### [PowerShell](#tab/powershell)

```powershell
$policyId = "<policy ID>"

# Read the policy, then send the rule set to remove
$policy = Invoke-RestMethod -Method Get `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId`?api-version=$apiVersion" `
    -Headers $headers
$ruleSet = $policy.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }

$body = @{ name = $policy.name; ruleSets = @($ruleSet) } | ConvertTo-Json -Depth 10
Invoke-RestMethod -Method Patch `
    -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$policyId/removeRule?api-version=$apiVersion" `
    -Headers $headers -ContentType "application/json" -Body $body
Write-Host "Removed the ConnectorManagement rule set from policy $policyId"
```

### [C#](#tab/csharp)

```csharp
var policyId = "<policy ID>";

// Remove the ConnectorManagement rule set from the policy
var policy = await client.Governance.RuleBasedPolicies[policyId].GetAsync();
var ruleSet = policy.RuleSets.First(r => r.Id == "ConnectorManagement");

var removeRequest = new PolicyRequest { Name = policy.Name, RuleSets = new List<RuleSet> { ruleSet } };
await client.Governance.RuleBasedPolicies[policyId].RemoveRule.PatchAsync(removeRequest);
Console.WriteLine($"Removed the ConnectorManagement rule set from policy {policyId}");
```

### [Python](#tab/python)

```python
async def remove_rule(client, policy_id: str):
    from mspp_management.models.policy_request import PolicyRequest

    # Remove the ConnectorManagement rule set from the policy
    policy = await client.governance.rule_based_policies.by_policy_id(policy_id).get()
    rule_set = next(r for r in policy.rule_sets if r.id == "ConnectorManagement")

    remove_request = PolicyRequest()
    remove_request.name = policy.name
    remove_request.rule_sets = [rule_set]
    await client.governance.rule_based_policies.by_policy_id(policy_id).remove_rule.patch(remove_request)
    print(f"Removed the ConnectorManagement rule set from policy {policy_id}")
```

---

### Remove ACP from every environment in the group

To turn off ACP across all environments in a group, first remove the rule from the group's policy (previous example), then repeat the removal for each environment's own policy. Read each environment's assigned policy from its environment assignment, then call `removeRule` on that policy. Provide the environment IDs that belong to the group, or enumerate them by using the [environment management APIs](/rest/api/power-platform/environmentmanagement/environment-groups).

```powershell
# Environment IDs that belong to the group
$environmentIds = @("<environment ID 1>", "<environment ID 2>")

foreach ($environmentId in $environmentIds) {
    # Find the policy currently assigned to the environment
    $envAssignments = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/environments/$environmentId/assignments?api-version=$apiVersion" `
        -Headers $headers
    if (-not $envAssignments.value) { continue }
    $envPolicyId = $envAssignments.value[0].policyId

    # Remove the ConnectorManagement rule set from that environment's policy
    $envPolicy = Invoke-RestMethod -Method Get `
        -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$envPolicyId`?api-version=$apiVersion" `
        -Headers $headers
    $ruleSet = $envPolicy.ruleSets | Where-Object { $_.id -eq "ConnectorManagement" }
    if ($ruleSet) {
        $body = @{ name = $envPolicy.name; ruleSets = @($ruleSet) } | ConvertTo-Json -Depth 10
        Invoke-RestMethod -Method Patch `
            -Uri "$apiBaseUrl/governance/ruleBasedPolicies/$envPolicyId/removeRule?api-version=$apiVersion" `
            -Headers $headers -ContentType "application/json" -Body $body
        Write-Host "Removed ACP from environment $environmentId"
    }
}
```

The same per-environment `removeRule` call works with the C# and Python SDKs shown earlier. Wrap the call in a loop over the group's environment IDs.

## Related content

[Advanced connector policies](advanced-connector-policies.md)<br/>
[Rule Based Policies - REST API reference](/rest/api/power-platform/governance/rule-based-policies)<br/>
[Authentication](programmability-authentication-v2.md)<br/>
[Tutorial: Assign roles to service principals](programmability-tutorial-rbac-role-assignment.md)<br/>
[Programmability and extensibility overview](programmability-extensibility-overview.md)
