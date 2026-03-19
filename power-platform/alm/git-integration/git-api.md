---
title: "Connect and disconnect Dataverse from a Git repository by using code"
description: "Learn how to use the ConnectToGit and DisconnectFromGit APIs to programmatically connect your Dataverse environment or solutions to Git repositories in Azure DevOps."
author: caburk
ms.subservice: alm
ms.author: caburk
ms.date: 03/18/2026
ms.topic: concept-article
ms.reviewer: mattp
---
# Connect and disconnect Dataverse from a Git repository by using code

Use the `ConnectToGit` and `DisconnectFromGit` APIs to programmatically integrate your Microsoft Dataverse environment with Git source control. By using these APIs, you can connect individual solutions or entire environments to Git repositories hosted on Azure DevOps, and manage those connections through code.

> [!IMPORTANT]
> GitHub isn't currently supported.

## Prerequisites

Before using these APIs, ensure you have:

- Access to a Microsoft Dataverse environment
- System administrator permissions
- Read and write access to a Git repository
- Valid credentials for your source control provider

## ConnectToGit API

Creates a connection between a Dataverse solution or environment and a Git repository. By using this connection, you can manage source control for your Dataverse components.

### Parameters

The `ConnectToGit` API accepts the following parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `GitFolder` | String | Yes | Name of the folder you want to bind your solution or environment to. |
| `Branch` | String | Yes | Name of the branch you want to connect to. |
| `ConnectionType` | Integer | No | Specifies what to connect to. See [ConnectionType parameter](#connectiontype-parameter). |
| `GitProvider` | Integer | No | The Git provider. See [GitProvider parameter](#gitprovider-parameter).|
| `Organization` | String | No | Name of the organization you want to connect to. |
| `Project` | String | No | Name of the project you want to connect to. |
| `Repository` | String | No | Name of the repository you want to connect to. |
| `RootFolder` | String | No | Name of the root folder where all your solutions reside in solution scope. |
| `SolutionUniqueName` | String | No | The unique name of the solution you wish to connect to git. |
| `UpstreamBranch` | String | No | Name of the upstream branch you want to connect to. Defaults to default branch of repository. |

### ConnectionType parameter

The `ConnectionType` parameter controls whether to connect to the entire Dataverse environment or a specific solution.

| Value | Label       | Description                                       |
|-------|-------------|---------------------------------------------------|
| 0     | Solution    | Connects a specific Dataverse solution to Git.     |
| 1     | Environment | Connects the entire Dataverse environment to Git.  |

### GitProvider parameter

Use the `GitProvider` parameter to specify the type of Git provider you're using, either Azure DevOps or GitHub.

| Value | Label         | Description                                    |
|-------|---------------|------------------------------------------------|
| 0     | Azure DevOps  | Use for repositories hosted on Azure DevOps    |
| 1     | GitHub        | Use for repositories hosted on GitHub          |

## DisconnectFromGit API

Removes the Git connection from a Dataverse solution or environment, and disables source control integration.

### Parameter

The `DisconnectFromGit` API has only one parameter.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `SolutionUniqueName` | String | No | The unique name of the solution you want to disconnect from Git. Omit to disconnect all solutions or the environment. |

### Behavior notes

- **Disconnect single solution**: Provide `SolutionUniqueName` to disconnect a specific solution.
- **Disconnect all solutions**: Provide no parameters to disconnect all solution-level connections.
- **Disconnect environment**: Provide no parameters to disconnect the environment-level connection.

## Examples

The following examples describe scenarios for using `ConnectToGit` and `DisconnectFromGit` APIs:

- [Connect your entire Dataverse environment to an Azure DevOps repository](#connect-your-entire-dataverse-environment-to-an-azure-devops-repository)
- [Disconnect your entire Dataverse environment from Git source control](#disconnect-your-entire-dataverse-environment-from-git-source-control)
- [Connect the first solution to a Git repository](#connect-the-first-solution-to-a-git-repository)
- [Connect extra solutions to the same Git repository after you connect the initial solution](#connect-extra-solutions-to-the-same-git-repository-after-you-connect-the-initial-solution)
- [Disconnect a specific solution from Git source control while keeping other solutions connected](#disconnect-a-specific-solution-from-git-source-control-while-keeping-other-solutions-connected)

### Connect your entire Dataverse environment to an Azure DevOps repository

This connection enables source control for all environment-level configurations and components.

Don't use these parameters with this connection:

- `RootFolder`
- `SolutionUniqueName`
- `UpstreamBranch`

#### [SDK for .NET](#tab/sdk)

This static `ConnectDataverseEnvironment` method shows how to use the `ConnectToGit` message to connect your entire Dataverse environment to an Azure DevOps repository.

```csharp
private const int GitProviderAzureDevOps = 0;
private const int GitProviderGitHub = 1;
private const int ConnectionTypeEnvironment = 1;

static void ConnectDataverseEnvironment(
    IOrganizationService service,
    string gitFolderName,
    string branchName,
    string organizationName,
    string projectName,
    string repositoryName,
    OptionSetValue? gitProvider = null)
{
    // Validate required parameters
    ArgumentNullException.ThrowIfNull(service);
    ArgumentException.ThrowIfNullOrWhiteSpace(gitFolderName);
    ArgumentException.ThrowIfNullOrWhiteSpace(branchName);
    ArgumentException.ThrowIfNullOrWhiteSpace(organizationName);
    ArgumentException.ThrowIfNullOrWhiteSpace(projectName);
    ArgumentException.ThrowIfNullOrWhiteSpace(repositoryName);

    // Default to Azure Dev Ops
    gitProvider ??= new OptionSetValue(GitProviderAzureDevOps);

    ParameterCollection parameters = new()
    {
        { "GitFolder", gitFolderName },
        { "Branch", branchName },
        { "ConnectionType", new OptionSetValue(ConnectionTypeEnvironment) },
        { "GitProvider", gitProvider },
        { "Organization", organizationName },
        { "Project", projectName },
        { "Repository", repositoryName }
    };

    OrganizationRequest request = new()
    {
        RequestName = "ConnectToGit", 
        Parameters = parameters
    };

     service.Execute(request);
}

```

[Learn how to invoke Dataverse messages using the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)

#### [Web API](#tab/webapi)

This example shows how to use the [ConnectToGit action](xref:Microsoft.Dynamics.CRM.ConnectToGit) to connect your entire Dataverse environment to an Azure DevOps repository.

**Request**

```http
POST [Organization URI]/api/data/v9.2/ConnectToGit HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
   "GitFolder": "yourGitfolderName",
   "Branch": "yourBranchName",
   "ConnectionType": 1,
   "GitProvider": 0,
   "Organization": "yourOrganizationName",
   "Project": "yourProjectName",
   "Repository": "yourRepositoryName"   
}
```

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
```

[Learn how to invoke Web API actions](/power-apps/developer/data-platform/webapi/use-web-api-actions)

---


### Disconnect your entire Dataverse environment from Git source control

This action removes the environment-level Git connection.  Don't use the `SolutionUniqueName` parameter for this operation. Dataverse automatically identifies and removes the environment-level Git connection.

#### [SDK for .NET](#tab/sdk)

The static `DisconnectDataverseEnvironment` method disconnects your entire Dataverse environment from Git source control.

```csharp
static void DisconnectDataverseEnvironment(IOrganizationService service) {

   // Validate required parameters
    ArgumentNullException.ThrowIfNull(service);

   OrganizationRequest request = new("DisconnectFromGit");

   service.Execute(request);

}
```

[Learn how to invoke Dataverse messages using the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)

#### [Web API](#tab/webapi)

This example shows how to use the [DisconnectFromGit action](xref:Microsoft.Dynamics.CRM.DisconnectFromGit) to disconnect your entire Dataverse environment from Git source control.

**Request**

```http
POST [Organization URI]/api/data/v9.2/DisconnectFromGit HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0
```

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
```

[Learn how to invoke Web API actions](/power-apps/developer/data-platform/webapi/use-web-api-actions)

---

### Connect the first solution to a Git repository

This connection establishes the repository link and folder structure for solution-level source control to the first solution in an environment.

You need to include values for these parameters to specify the solution:
 
- `RootFolder`
- `SolutionUniqueName`

#### [SDK for .NET](#tab/sdk)

The static `ConnectFirstSolution` method shows how to connect the first solution to a Git repository.

```csharp
private const int ConnectionTypeSolution = 0;

static void ConnectFirstSolution(
    IOrganizationService service,
    string gitFolderName,
    string branchName,
    string organizationName,
    string projectName,
    string repositoryName,
    string rootFolderName,
    string solutionUniqueName,
    OptionSetValue? gitProvider = null)
{
    // Validate required parameters
    ArgumentNullException.ThrowIfNull(service);
    ArgumentException.ThrowIfNullOrWhiteSpace(gitFolderName);
    ArgumentException.ThrowIfNullOrWhiteSpace(branchName);
    ArgumentException.ThrowIfNullOrWhiteSpace(organizationName);
    ArgumentException.ThrowIfNullOrWhiteSpace(projectName);
    ArgumentException.ThrowIfNullOrWhiteSpace(repositoryName);
    ArgumentException.ThrowIfNullOrWhiteSpace(rootFolderName);
    ArgumentException.ThrowIfNullOrWhiteSpace(solutionUniqueName);

    // Default to Azure Dev Ops
    gitProvider ??= new OptionSetValue(GitProviderAzureDevOps);

    ParameterCollection parameters = new()
    {
        { "GitFolder", gitFolderName },
        { "Branch", branchName },
        { "ConnectionType", new OptionSetValue(ConnectionTypeSolution) },
        { "GitProvider", gitProvider },
        { "Organization", organizationName },
        { "Project", projectName },
        { "Repository", repositoryName },
        { "RootFolder", rootFolderName },
        { "SolutionUniqueName", solutionUniqueName }
    };

    OrganizationRequest request = new()
    {
        RequestName = "ConnectToGit",
        Parameters = parameters
    };

    service.Execute(request);
}
```

[Learn how to invoke Dataverse messages using the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)

#### [Web API](#tab/webapi)

This example shows how to use the [ConnectToGit action](xref:Microsoft.Dynamics.CRM.ConnectToGit) to connect the first solution to a Git repository.


**Request**

```http
POST [Organization URI]/api/data/v9.2/ConnectToGit HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
   "GitFolder": "yourGitfolderName",
   "Branch": "yourBranchName",
   "ConnectionType": 1,
   "GitProvider": 0,
   "Organization": "yourOrganizationName",
   "Project": "yourProjectName",
   "Repository": "yourRepositoryName",
   "RootFolder": "yourRootFolderName",
   "SolutionUniqueName": "yourSolutionUniqueName"
}
```

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
```

[Learn how to invoke Web API actions](/power-apps/developer/data-platform/webapi/use-web-api-actions)

---

### Connect extra solutions to the same Git repository after you connect the initial solution

After you connect the first solution, you only need the solution-specific parameters. You inherit the repository connection details from the initial connection.

Set only these parameters:

- `SolutionUniqueName`
- `Branch`
- `GitFolder`

> [!IMPORTANT]
> You must first connect the first solution before this works. See [Connect the first solution to a Git repository](#connect-the-first-solution-to-a-git-repository).

#### [SDK for .NET](#tab/sdk)

The static `ConnectExtraSolution` method shows how to connect subsequent solutions to a Git repository.

```csharp
static void ConnectExtraSolution(
   IOrganizationService service,
   string gitFolderName,
   string branchName,
   string solutionUniqueName)
{
   // Validate required parameters
   ArgumentNullException.ThrowIfNull(service);
   ArgumentException.ThrowIfNullOrWhiteSpace(gitFolderName);
   ArgumentException.ThrowIfNullOrWhiteSpace(branchName);
   ArgumentException.ThrowIfNullOrWhiteSpace(solutionUniqueName);

   ParameterCollection parameters = new()
   {
         { "GitFolder", gitFolderName },
         { "Branch", branchName },
         { "SolutionUniqueName", solutionUniqueName }
   };

   OrganizationRequest request = new()
   {
         RequestName = "ConnectToGit",
         Parameters = parameters
   };

   service.Execute(request);
}
```

[Learn how to invoke Dataverse messages using the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)

#### [Web API](#tab/webapi)

This example shows how to use the [ConnectToGit action](xref:Microsoft.Dynamics.CRM.ConnectToGit) to connect subsequent solutions to a Git repository.

**Request**

```http
POST [Organization URI]/api/data/v9.2/ConnectToGit HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
   "GitFolder": "yourGitfolderName",
   "Branch": "yourBranchName",
   "SolutionUniqueName": "yourSolutionUniqueName"
}
```

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
```

[Learn how to invoke Web API actions](/power-apps/developer/data-platform/webapi/use-web-api-actions)

---

### Disconnect a specific solution from Git source control while keeping other solutions connected

Use this approach to remove source control for one solution without affecting others.

#### [SDK for .NET](#tab/sdk)

The static `DisconnectSolution` method removes source control for one solution without affecting others.

```csharp
static void DisconnectSolution(IOrganizationService service, 
    string solutionUniqueName)
{

   // Validate required parameters
    ArgumentNullException.ThrowIfNull(service);
    ArgumentException.ThrowIfNullOrWhiteSpace(solutionUniqueName);

    ParameterCollection parameters = new()
    {
        { "SolutionUniqueName", solutionUniqueName }
    };

    OrganizationRequest request = new()
    {
        RequestName = "DisconnectFromGit",
        Parameters = parameters
    };

    service.Execute(request);
}
```

[Learn how to invoke Dataverse messages using the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)

#### [Web API](#tab/webapi)

This example shows how to use the [DisconnectFromGit action](xref:Microsoft.Dynamics.CRM.DisconnectFromGit) to remove source control for one solution without affecting others.

**Request**

```http
POST [Organization URI]/api/data/v9.2/DisconnectFromGit HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
   "SolutionUniqueName": "yourSolutionUniqueName"
}
```

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
```

[Learn how to invoke Web API actions](/power-apps/developer/data-platform/webapi/use-web-api-actions)

---

## Error handling

Neither the `ConnectToGit` nor the `DisconnectFromGit` API returns a value when it completes successfully. When an API fails, it returns an error.

Common error scenarios include:

- **Invalid credentials**: Ensure you have valid authentication to the Git provider.
- **Repository not found**: Verify the organization, project, and repository names.
- **Permission denied**: Ensure your Dataverse account has source control management permissions.
- **Solution not found**: Verify the `SolutionUniqueName` exists in your environment.
- **Branch does not exist**: Confirm the specified branch exists in the repository.


## Support and additional resources

For more information about source control integration with Dataverse, see:

- [Overview of Git Integration in Power Platform](overview.md)
- [ConnectToGit Action](xref:Microsoft.Dynamics.CRM.ConnectToGit)
- [DisconnectFromGit Action](xref:Microsoft.Dynamics.CRM.DisconnectFromGit)
- [CommitToGit Action](xref:Microsoft.Dynamics.CRM.CommitToGit)
- [RefreshChangesFromGit Action](xref:Microsoft.Dynamics.CRM.RefreshChangesFromGit)
- [PullChangesFromGit Action](xref:Microsoft.Dynamics.CRM.PullChangesFromGit)
