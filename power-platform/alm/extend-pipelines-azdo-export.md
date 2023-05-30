---
title: Extend pipelines in Power Platform with Azure DevOps Source Control
description: Export, unpack and commit a solution using a Azure DevOps pipeline called from a Power Automate Flow.
author: mikefactorial
ms.author: caburk
ms.reviewer: kvivek
ms.topic: overview
ms.date: 05/29/2023
ms.custom: 
---

# Download, Unpack and Commit a Pipeline Artifact to an Azure DevOps Repository

This Azure DevOps pipeline downloads a pipeline artifact from Dataverse and unpacks and commits the source code to a branch in Azure DevOps when a pipeline artifact is created in Dataverse. The pipeline can be invoked manually or triggered by a pipeline artifact creation event in Dataverse as shown in the example Power Automate Flow. For more information on how to create a Azure DevOps pipeline, see [Create your first pipeline](azure/devops/pipelines/create-first-pipeline).

## Workflow Details

The pipeline is triggered via a `pipeline_dispatch` event. The pipeline runs on `ubuntu-latest` and has the `contents: write` permission to be able to commit changes to the Azure DevOps repository branch.

The pipeline consists of the following steps:

1. `actions/checkout@v3`: Checks out the repository.
2. `export-managed-solution-from-artifact`: Exports the managed solution from the artifact created by pipelines.
3. `unpack-managed-solution`: Unpacks the solution.
4. `commit changes`: Commits changes to the existing or new branch.
5. `push to`: Pushes the committed changes to the source branch.

## Workflow Inputs

The following inputs are required:

- `artifact_id`: The Dataverse record ID of the Artifact created by the pipelines.
- `solution_name`: Name of the Solution in Dataverse environment.
- `environment_url`: Https endpoint of your pipeline host Dataverse environment.
- `source_branch`: Branch for the solution commit.
- `target_branch`: Branch to create for the solution commit. If not specified, the source_branch will be used.
- `commit_message`: Message to provide for the commit.

## Workflow Secrets

The following secrets are required to connect to Dataverse using an Application User configured in Dataverse and in Azure Active Directory. Configure these secrets in the Azure DevOps repository settings. For more information, see [Creating and using encrypted secrets](https://docs.Azure DevOps.com/en/actions/reference/encrypted-secrets) and [Create an application user](/power-platform/admin/manage-application-users#create-an-application-user)

- `CLIENT_ID`: The client ID of the registered Azure AD application
- `TENANT_ID`: The tenant ID of the Azure AD directory associated with the Azure AD application
- `CLIENT_SECRET`: The client secret of the registered Azure AD application

## Workflow Code

```Azure DevOps-actions-pipeline
name: Export, unpack and commit the solution to git
run-name: Getting ${{ Azure DevOps.event.inputs.solution_name }} solution from environment ${{ Azure DevOps.event.inputs.environment_url }} environment and committing
on:
  pipeline_dispatch:
    inputs:
      artifact_id:
        description: "The Dataverse record ID of the Artifact created by the pipelines."
        required: true
        default: yourartifactid
      solution_name:
        description: "Name of the Solution in Dataverse environment"
        required: true
        default: yoursolutionname
      environment_url:
        description: Https endpoint of your pipeline host Dataverse environment"
        required: true
        default: "https://[your-env].crm.dynamics.com"
      source_branch:
        description: "Branch for the solution commit"
        required: true
        default: main
      target_branch:
        description: "Branch to create for the solution commit. If not specified, the source_branch will be used."
        required: false
      commit_message:
        description: "Message to provide for the commit"
        required: true
permissions:
  contents: write
jobs:
  export-unpack-commit:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
        with:
            ref: ${{ Azure DevOps.event.inputs.source_branch }}

      # Commit changes to the existing or new branch
      - name: create new branch if specified
        shell: pwsh
        run: |
            if('${{ Azure DevOps.event.inputs.target_branch }}' -ne '') {
                git checkout -b ${{ Azure DevOps.event.inputs.target_branch }} ${{ Azure DevOps.event.inputs.source_branch }}
            }

      # Export the managed solution from the artifact created by pipelines
      - name: export-managed-solution-from-artifact
        env:
            CLIENT_ID: ${{secrets.CLIENT_ID}}   
            TENANT_ID: ${{secrets.TENANT_ID}}   
            PowerPlatformSPN: ${{secrets.PowerPlatformSPN}}
        shell: pwsh
        run: |
            $aadHost = "login.microsoftonline.com"
            $clientId = "$env:CLIENT_ID"
            $clientSecret = "$env:PowerPlatformSPN"
            $tenantId = "$env:TENANT_ID"
            
            $url = "${{ Azure DevOps.event.inputs.environment_url }}"
            $options = [System.StringSplitOptions]::RemoveEmptyEntries
            $dataverseHost = $url.Split("://", $options)[1].Split("/")[0]
            
            $body = @{client_id = $clientId; client_secret = $clientSecret; grant_type = "client_credentials"; scope = "https://$dataverseHost/.default"; }
            $OAuthReq = Invoke-RestMethod -Method Post -Uri "https://$aadHost/$tenantId/oauth2/v2.0/token" -Body $body
            $spnToken = $OAuthReq.access_token
            $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
            $headers.Add("Authorization", "Bearer $spnToken")
            $headers.Add("Content-Type", "application/json")
            $odataQueryForFileName = "deploymentartifacts(${{ Azure DevOps.event.inputs.artifact_id }})?`$select=name"
            $requestUrl = "https://$dataverseHost/api/data/v9.2/$odataQueryForFileName"    
            $reponse = Invoke-RestMethod $requestUrl -Method 'GET' -Headers $headers
            
            $solutionName = $reponse.name
            
            $odataQueryForFileContents = "deploymentartifacts(${{ Azure DevOps.event.inputs.artifact_id }})/artifactfile/$value"
            $requestUrl = "https://$dataverseHost/api/data/v9.2/$odataQueryForFileContents"
            $response = Invoke-RestMethod $requestUrl -Method 'GET' -Headers $headers
            $bytes = [Convert]::FromBase64String($response.value)
            [IO.File]::WriteAllBytes("${{ Azure DevOps.event.inputs.solution_name }}_managed.zip", $bytes)
      # Unpack the solution
      - name: unpack-managed-solution
        uses: microsoft/powerplatform-actions/unpack-solution@v0
        with:
          solution-file: "${{ Azure DevOps.event.inputs.solution_name }}_managed.zip"
          solution-folder: "${{ Azure DevOps.event.repository.name }}"
          solution-type: 'Managed'
          process-canvas-apps: true
          overwrite-files: true

      # Commit changes to the existing or new branch
      - name: commit changes
        shell: pwsh
        run: |
          rm -rf ${{ Azure DevOps.event.inputs.solution_name }}_managed.zip
          git config user.name "Azure DevOps Actions Bot"
          git config user.email "<>" 
          git pull 
          git add --all
          git commit -am "${{ Azure DevOps.event.inputs.commit_message }}" --allow-empty

      # Push the committed changes to the source branch
      - name: push to ${{ Azure DevOps.event.inputs.source_branch }}
        shell: pwsh
        run: |
          if('${{ Azure DevOps.event.inputs.target_branch }}' -ne '') {
              git push origin ${{ Azure DevOps.event.inputs.target_branch }}
          } else {
              git push origin ${{ Azure DevOps.event.inputs.source_branch }}
          }

```

## Example Power Automate Flow

To call this Azure DevOps pipeline, you can create a Power Automate Flow that is triggered when a pipeline artifact is created in Dataverse. The Flow can be configured to pass the required inputs to the Azure DevOps pipeline. For more information on how to create a Power Automate Flow, see [Create a flow](/power-automate/getting-started#create-a-flow).

## Flow Details

The Flow is triggered when a pipeline artifact is created in Dataverse. The Flow calls the HTTP connector to trigger the Azure DevOps pipeline. The Flow passes the required inputs to the Azure DevOps pipeline. Include the following inputs in the request body:

- `artifact_id`: The Dataverse record ID of the Artifact created by the pipelines.
- `solution_name`: Name of the Solution in Dataverse environment.
- `environment_url`: Https endpoint of your pipeline host Dataverse environment.
- `source_branch`: Branch for the solution commit.
- `commit_message`: Message to provide for the commit.

The Flow also uses a Azure DevOps Personal Access token to authenticate to Azure DevOps. For more information on how to create a Azure DevOps Personal Access token, see [Creating a personal access token](https://docs.Azure DevOps.com/en/Azure DevOps/authenticating-to-Azure DevOps/creating-a-personal-access-token). The PAT is passed in the `Authorization` header of the HTTP request.

Update the following values in the Flow:

- `[Your Azure DevOps Personal Access Token]` - Replace with your Azure DevOps Personal Access Token.
- `[Your Azure DevOps Organization]` - Replace with your Azure DevOps organization name.
- `[Your Azure DevOps Repository]` - Replace with your Azure DevOps repository name.
- `[Your Pipeline Host Environment]` - Replace with your pipeline host environment name.
- `[Your Azure DevOps Workflow YAML File]` - Replace with your Azure DevOps pipeline YAML file name.

![Power Automate Flow](./media/extend-pipelines-Azure DevOps-export-flow.png)

## Next step

[Run pipelines in Power Platform](run-pipeline.md)

### Related content

[Quickstart for Azure DevOps Actions](https://docs.Azure DevOps.com/en/actions/quickstart)<br/>
[Extend pipelines in Power Platform](extend-pipelines.md)<br/>
[What are cloud flows?](/power-automate/overview-cloud)
