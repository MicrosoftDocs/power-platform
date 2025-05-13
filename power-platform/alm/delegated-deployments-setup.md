---
title: Deploy pipelines as a service principal or pipeline owner
description: Deploy pipelines with a service principal or pipeline stage owner’s identity.
author: caburk
ms.author: caburk
ms.reviewer: pehecke
ms.topic: overview
ms.date: 10/10/2024
ms.custom: 
---
# Deploy pipelines as a service principal or pipeline owner

Delegated deployments can be run as a service principal or pipeline stage owner. When enabled, the pipeline stage deploys as the delegate (service principal or pipeline stage owner) instead of the requesting maker.

## Deploy with a service principal

### Prerequisites

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- One of the following Microsoft Entra roles: Cloud Application Administrator, or Application Administrator.
- You must be an owner of the enterprise application (service principal) in Microsoft Entra ID.

For a delegated deployment with a service principal, follow these steps.

1. Create an enterprise application (service principal) in Microsoft Entra ID.

   > [!IMPORTANT]
   > Anyone enabling or modifying service principal configurations in pipelines must be an owner of the enterprise application (service principal) in Microsoft Entra ID.  
1. Add the enterprise application as a server-to-server (S2S) user in your pipelines host environment and each target environment it deploys to.
1. Assign the Deployment Pipeline Administrator security role to the S2S user within the pipelines host, and System Administrator security role within target environments. Lower permission security roles can't deploy plug-ins and other code components.
1. Choose (check) **Is delegated deployment** on a pipeline stage, select **Service Principal**, and enter the Client ID. Select **Save**.
1. Optionally, **Allow sharing requests** so that deployment requestors can specify which security groups can access deployed objects within the target environment. Sharing requests are part of the deployment request and can be approved or rejected.
  > [!IMPORTANT]
  > Deployment approvers are responsible for carefully reviewing sharing and security role information. When a deployment is approved, pipelines automatically assigns permissions using the deploying service principal's identity.  
    > 
1. Create a cloud flow within the pipelines host environment. Alternative systems can be integrated using pipelines' Microsoft Dataverse APIs.
1. Select the **OnApprovalStarted** trigger. 
1. Add steps for your desired custom logic.
1. Insert an approval step. Use Dynamic content for sending deployment request information to the approver(s).
1. Insert a condition.
1. Create a Dataverse connection for the service principal. You need a client ID and secret.
1. Add Dataverse **Perform an unbound action** using the settings shown here.  
    Action Name: UpdateApprovalStatus
    ApprovalComments: Insert Dynamic Content. Comments are visible to the requestor of the deployment.
    ApprovalStatus: 20 = approved, 30 = rejected
    ApprovalProperties: Insert Dynamic Content. Admin information accessible from within the pipelines host.

    > [!IMPORTANT]
    > The UpdateApprovalStatus action must use the service principal’s connection. 
    > 
    > :::image type="content" source="media/spn-connection.png" alt-text="Connect with service principal":::
    
    > [!TIP]
    > To improve the debug experience, select ApprovalProperties and insert workflow() from the dynamic content menu. This links the flow run to the pipeline stage run (run history).
    
1. Save, and then test the pipeline.

Here's a screenshot of a canonical approval flow.

:::image type="content" source="media/canonical-approval-flow.png" alt-text="Canonical Approval Flow":::

## Deploy as the pipeline stage owner

Regular users, including those used as service accounts, can also serve as delegates. Configuration is more straightforward when compared to service principals, but solutions containing connection references for oAuth connections can't be deployed.

To deploy as the pipeline stage owner, follow these steps.

1.	Assign the Deployment Pipeline Administrator security role to the pipeline stage owner within the pipelines host, and assign System Administrator security role within target environments.
    
    Lower permission security roles can't deploy plug-ins and other code components.

1. Sign in as the pipeline stage owner. Only the owner can enable or modify these settings. Team ownership isn't allowed.
2.	Select **Is delegated deployment** on a pipeline stage, and select **Stage Owner**.
    - The pipeline stage owner’s identity is used for all deployments to this stage.
    - Similarly, this identity must be used to approve deployments.
1.	Create a cloud flow in a solution within the pipelines host environment.
    1. Select the **OnApprovalStarted** trigger.
    1. Insert actions as desired. For example, an approval.
    1. Add Dataverse **Perform an unbound action**.  
      Action Name: UpdateApprovalStatus (20 = completed, 30 = rejected)

## Delegated deployment samples

> [!IMPORTANT]
> The functionality provided in these samples is now supported natively in the product, but these samples might provide insights into extending native sharing functionality.

This download contains sample cloud flows for managing approvals and sharing deployed canvas apps and flows within the target environment. [Download sample solution](https://aka.ms/DownloadDelegatedDeploymentSamples)

Download and import the managed solution to your pipelines host environment. The solution can then be customized to fit the needs of your organization. 

## Frequently asked questions

### How can makers access deployed objects within target environments?

Sharing during deployment is a native capability of delegated deployments with service principals. It avoids admins needing to manually assign security roles and share deployed apps, flows, Copilots, and so on, within the Power Platform admin center. Instead, admins only need to approve the deployment request and sharing is carried out automatically by the system. 

### Which object types can be shared during deployment?

Currently, security roles, canvas apps, and cloud flows are supported. Copilot sharing might also be available depending on your region. 

### Can I update sharing when new versions are deployed?

Sharing is available the first time an object is deployed to the target environment. Sharing cannot be updated when new versions are deployed. 
Be sure to select an appropriate security group during the first deployment. Manage ongoing access via security groups. 

### Which permissions are assigned for canvas apps and flows?

Pipelines assigns the minimum privileges required to run apps and flows. 
If higher privileges are desired, pipelines can be extended. We recommend you enable the 'Block unmanaged customizations' feature when assigning higher permissions.

### Can makers share with individual users?

Not currently. We recommend managing individual user access via security groups after the first deployment of the object.

### I'm getting an error _The deployment stage isn't an owner of the service principal (&lt;AppId&gt;). Only owners of the service principal may use it for delegated deployments._

Ensure you’re the owner of the Enterprise Application (Service Principal) in Microsoft Entra ID (formerly Azure AD). You might only be the owner of the App Registration, and not the Enterprise Application.

:::image type="content" source="media/enterprise-applications.png" alt-text="Enterprise applications" lightbox="media/enterprise-applications.png":::

### For stage owner based delegated deployments, why can't I assign another user as the deployer?

For security reasons, you must sign in as the user that will be set as the pipeline stage owner. This prevents adding a nonconsenting user as the deployer.

### For stage owner based delegated deployments, can I use a custom DeploymentSettings.json file?

Not currently within the maker experience. 

### Why are my delegated deployments stuck in a pending state?

All delegated deployments are pending until approved. Ensure your admin has configured a Power Automate approval flow or other automation, that it's working properly, and that the deployment was approved.

### Who owns deployed solution objects?

The deploying identity. For delegated deployments, the owner is the delegated service principal or pipeline stage owner.

### Can I add custom approval steps?

Yes. For example, Power Automate approvals can be customized to meet the needs of your organization. You might also integrate other approval systems.

### Why do I have to own the service principal?

This is enforced for security reasons. 
You might also create pipelines using a service account and add the same service account as the owner. 
Another option is assigning the service principal (application user) as the owner of the pipeline stage and as an owner of itself (Enterprise application) in Microsoft Entra. However, assigning pipeline stage ownership to an application must be done via the Dataverse API in the pipelines host.  

### I'm getting an error _Delegated deployments of type 'ServicePrincipal' may only be approved or rejected by the Service Principal configured in the deployment stage._

Ensure the Dataverse custom action `UpdateApprovalStatus` is called by the service principal. If using Power Automate approvals, ensure this action is configured to use the delegate service principal's connection.

### I'm getting an error _Delegated deployments of type 'Owner' may only be approved or rejected by the owner of the deployment stage._

Ensure the Dataverse custom action `UpdateApprovalStatus` is called by the pipeline stage owner. If using Power Automate approvals, ensure this action is configured to use the delegate pipeline stage owner's connection.

### I'm getting an error in my approval flow _Unable to find approval status attribute for stage run record._

This happens when the approval status isn't yet in the pending state. Make sure this is a delegated deployment and you're using the `OnApprovalStarted` trigger in your approval flow.

### Can I use different service principals for different pipelines and stages?

Yes.

## Related information

- [Deploy a Microsoft Power Platform solution by using a service principal - Learn Module](/training/modules/deploy-pipeline)
