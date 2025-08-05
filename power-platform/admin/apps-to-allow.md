---
title: Commonly used Microsoft first-party services and portal apps
description: Learn more about what apps you might want to allow.
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.component: pa-admin
ms.subservice: admin
ms.topic: how-to
ms.date: 12/12/2024
search.audienceType: 
  - admin
---

# Commonly used Microsoft first-party services and portal apps

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The following apps are Microsoft first-party services. This list might vary based on your environment and installed solutions. Most of these apps can be allowed or blocked using the [client app access control feature](control-app-access-environment.md).

Certain [apps are automatically allowed](#commonly-used-microsoft-first-party-services-and-portal-apps) in all environments, such as Dataverse. You can manage access to other apps by assigning the appropriate user license or Dataverse security role. For example, to use the Power Apps maker portal, a maker must be assigned to an Environment Maker, System Customizer, or System Administrator security role. Apps automatically allowed in all environments aren't listed on the **Security** page.

| Application ID | Application name |
|----------------|------------------|
| 00000007-0000-0000-c000-000000000000 | Dataverse |
| 065d9450-1e87-434e-ac2f-69af271549ed | PowerPlatformAdminCenter |
| 4e291c71-d680-4d0e-9640-0a3358e31177 | Power Apps |
| 8c1a9936-578e-4d13-9bd9-9afe53ef7de8 | Finance Copilot |
| d024ca46-2708-4d20-903e-b18b7e1d95dc | Dynamics365Assistant |   
| 61ccfc51-60d1-470a-9dca-f78fcf640d23 | MicrosoftServiceCopilot-Prod |
| e97edbaf-39b2-4546-ba61-0a24e1bef890 | EHRTeleHealth | 
| 7c4f9118-450a-4e75-b96b-df2d0cac4c0d | d365-dani-exceladdinprod |
| 7f67af8a-fedc-4b08-8b4e-37c4d127b6cf | Power BI Desktop |
| 871c010f-5e61-4fb1-83ac-98610a7e9110 | MicrosoftPowerBI |
| 8463278f-7a65-4b3d-903c-5e66a2ad1164 | Mix Tools API |
| 5e72ef24-048b-4aae-8fd6-8653ce2d6760 | PowerPlatform-commondataserviceforapps-Connector |
| d0af0b2c-272b-4820-80ce-af3cc751950f | sophia.api.microsoft.com |
| d8fa9ca8-15de-4a33-b719-9c944b9b2e3e | Sophia Platform Service API |
| 66a88757-258c-4c72-893c-3e8bed4d6899 | QueryFormulationService |
| 325e8307-defd-47df-aeff-15152ea6e5bf | Prod M365FLWPService Prod |
| 226e4631-c980-4b11-9c96-5e26bb14dafc | Prod M365FLWPClient Prod |
| 9e6d7425-da52-4c9d-a3bf-48ce4670f9ef | Prod M365FLWPService FirstRelease |
| e582717c-581c-4a51-a8d7-5cd28f59497a | Prod M365FLWPClient FirstRelease |
| 2f29638c-34d4-4cf2-a16a-7caf612cee15 | Microsoft Dynamics CRM for Microsoft Office Outlook |
| ebf6b2b7-c635-4217-b6b7-21de4ac65764 | WPSTrialSignUpService_Prod |
| 46e9667d-34e6-43d8-a494-6759b3ae6a5e | Biz Apps Demo Hub Prod |
| 04f0c124-f2bc-4f59-8241-bf6df9866bbd | Visual Studio |
| c84a0f23-a0f8-4e8e-918b-57db620d110a | Power Platform Admin Center Client Test |
| 719640cd-0337-4b0c-8e6a-431271371fab | make.test.powerapps.com |
| 3e050dd7-7815-46a0-8263-b73168a42c10 | Teams Approvals |
| 08e18876-6177-487e-b8b5-cf950c1e598c | SharePointOnlineWebClientExtensibility |
| bee5ee7b-22c7-4e94-9b8b-031319e230a3 | Viva Goals Integrations |
| 6f459c5d-d670-409b-83a6-68b040f4cb78 | Customer Experience Platform FRE PROD |
| f10573e9-a3c7-41b4-b203-4b1baed8fc8c | Customer Experience Platform FRE TIP Non-Prod |
| 60f38cf4-a0bf-4fdf-b0b5-14d3131bc031 | make.test.powerapps.com |
| a0fe4328-8965-437b-a350-cf71409d002f | Cloud for Nonprofit Installer |
| 5c17a0cf-5493-4b86-b23d-dabc1cc46f5a | Minit Desktop for Windows |
| 04d97d71-f71f-450b-8b44-f638d5d1b5d6 | PhysOps.Clients.Worker |
| 2fd908ad-0664-4344-b9be-cd3e8b574c38 | Microsoft.Data.SqlClient |
| 929cb005-cba1-40c4-a962-ef441029cb6c | make.gov.powerpages.microsoft.us |
| 73a510c3-9946-46dd-b5ae-a8f0ae68fd04 | Azure API Management Portal extension |
| 38ec0b21-8bde-4473-950b-819ceb3ed233 | SuplariDev |
| ea62c1c6-550b-4238-8ea7-c55a85d86be8 | Teams Work Report |
| bd414a4d-005a-4a51-a63e-12097e3dcd19 | LobeClientDev |
| aebc6443-996d-45c2-90f0-388ff96faa56 | Visual Studio Code |
| 4787c7ff-7cea-43db-8d0d-919f15c6354b | D365SalesProductivityProvisioning |
| f9a5ac11-cab3-45f0-9d0f-83463ba2e34c | make.test.powerpages.microsoft.com |
| 75eb2b80-011a-4693-9a47-7971c853603c | make.powerpages.microsoft.com |
| a8adde6c-aeb4-4fd6-9d8f-c2dfdecac60a | Dynamics 365 collaboration with Microsoft Teams |
| 996def3d-b36c-4153-8607-a6fd3c01b89f | Project Madeira |
| 9cee029c-6210-4654-90bb-17e6e9d36617 | Power Platform CLI - pac |
| 6b91db1b-f05b-405a-a0b2-e3f60b28d645 | M365AdminServices |
| 2f7b4d11-d621-4079-9798-27f548d681f1 | Power Cards |
| 8b66798c-a359-423d-8d71-567ee6da1016 | Dynamics 365 Customer Insights - Consent - DEV |
| 50d9b7e0-07b6-4615-a8ae-f7f017db392a | Supply Chain Windblade Development |
| d6037e40-282c-493d-8f63-f255e36c6ef4 | Microsoft Dynamics 365 Supply Chain Visibility |
| 37ff607d-6be1-4c1b-a5f8-e5ad92b55975 | Lobe |
| 22618bd1-b6aa-45f0-8ebd-718d158d888d | TrustedPublishersProxyService-DoD |
| e8c38929-689f-4155-96f7-ab45b0f67cec | TrustedPublishersProxyService-GccModerate |
| 2b61b865-d0bd-4c60-9efa-6fa934eefaac | TrustedPublishersProxyService |
| 9f4bb91b-347a-47ab-aba4-06db0dcb89e3 | Unify Portal Prod |
| de490f5e-b798-48d8-ae3b-c220d7494cef | BAGSolutionsInstaller |
| 9315aedd-209b-43b3-b149-2abff6a95d59 | PowerVirtualAgentsUSGovGCC |
| fdd7719f-d61e-4592-b501-793734eb8a0e | SharePointMigrationTool |
| ef47e344-4bff-4e28-87da-6551a21ffbe0 | BingTest |
| 9ea1ad79-fdb6-4f9a-8bc3-2b70f96e34c7 | Bing |
| 09be0be4-1874-4f49-bc5c-78e6fc2a8065 | Power Apps Portals - Development |
| 386ce8c0-7421-48c9-a1df-2a532400339f | Power Automate Desktop For Windows |
| 9e3b502c-b4a1-441d-98fd-28e482bf7e88 | Dynamics 365 Customer Insights - Consent |
| 9c60a40b-b5c5-4d01-8588-776209c80db3 | Search Federation Connector - Dataverse |
| 03509b1f-54e9-4557-a555-19a090903b84 | CRM Power BI Integration GCC High |
| f448d7e5-e313-4f90-a3eb-5dbb3277e4b3 | Media Recording for Dynamics 365 Sales |
| 883d98cb-7d92-43b7-a194-07e51a2fa5bb | Media Recording for Dynamics 365 Sales - TIP |
| 88c57617-94ff-4043-a396-8a85a8d38922 | Business Central to Common Data Service |
| 19679030-48d8-445f-b27c-311bb3be8a2c | eSeal |
| 19a92965-3c11-4ed7-a1bd-9b66785dd4c6 | PADWAMigratorGCC |
| cb47b44e-c0a3-47a5-85ce-3dc039c85e80 | PADWAMigratorGCCHigh |
| 133c4dc0-9d5f-4826-9f7b-6bb3d3867e6a | PADWAMigrator |
| 8ad75a3e-ae97-457c-baab-65bd5c95389f | BAGSolutionsInstallerTest |
| ae7deb89-ca76-4073-bf3e-b72165ac58e9 | Power Automate Desktop DoD |
| f1a1e36a-d61f-4283-9f48-0867636e332c | Power Automate Desktop GCC High |
| 041e4c2d-ba3e-46a1-9347-5bc4054c8af4 | Power Automate Desktop GCC |
| 3852314e-aab9-42c3-a859-5b5b88a90000 | ConnectedFieldServiceDeployment |
| 2f6713e6-1e21-4a83-91b4-5bf9a2378f81 | RSOProvisioningCustomerDashboard |
| 257fc75b-c7b8-434b-a467-fcfc16cb7ab6 | Dynamics CRM TIP SRS |
| a6d2002e-7db6-4da0-94e8-73765fdbc7fb | ProcessSimpleDoD |
| ee90a17f-1cb7-4909-be27-dfc2dcc4dc15 | Power Automate Desktop |
| 3a225c96-d62a-44ce-b3ec-bd4e8e9befef | Dynamics 365 Human Resources LinkedIn Adapter App |
| f0b72488-7082-488a-a7e8-eada97bd842d | Power BI Report Builder |
| 291bcb22-15e5-4341-8f91-feb152d655ee | Dynamics 365 Connected Store |
| 363a906a-1ceb-41ea-9f20-884c694f2fc2 | ApiHub-Connectors-DoD |
| 7abdc2e3-67d5-4ccf-8138-e133192788e3 | MicrosoftFlowDoD |
| 470d0752-cb06-49b2-ac83-5023fc23adae | MicrosoftFlowGCCHigh |
| 50351660-e7b1-4621-8bc8-8503296a5535 | MicrosoftFlowGCC |
| 0bfc4568-a4ba-4c58-bd3e-5d3e76bd7fff | Dynamics365AICustomerInsights |
| 38c77d00-5fcb-4cce-9d93-af4738258e3c | MicrosoftUnifiedCustomerIntelligence |
| ec245c98-4a90-40c2-955a-88b727d97151 | AzureADIdentityGovernanceUserManagement |
| 810dcf14-1858-4bf2-8134-4c369fa3235b | AzureADIdentityGovernanceEntitlementManagement |
| 19dd5b37-d116-48cb-90d2-4aa56696cba1 | MicrosoftFormsProTest |
| 8c8fbf21-0ef3-4f60-81cf-0df811ff5d16 | Power Query Online GCC-L5 |
| adc59501-b8c1-453a-a88b-9f4b244c1631 | PowerApps Web Player Service - play.apps.appsplatform.us |
| dc426ec9-396a-46fd-8445-564554907e34 | PowerApps Web Player Service - high.apps.powerapps.us |
| 282c9137-f94e-4287-8223-9b60f2974e5c | PowerApps Web Player Service - apps.gov.powerapp.us |
| 9362bc14-3e81-4ef9-8b77-f1c40afe68e0 | apps.powerapps.com |
| 065d9450-1e87-434e-ac2f-69af271549ed | PowerPlatformAdminCenter |
| ef947699-9b52-4b31-9a37-ef325c6ffc47 | Power Query Online GCC-L4 |
| fcf50ee5-8107-45e4-9a37-838727a360f5 | Omnichannel for CS Admin App Prod |
| d93420f9-abc8-46b7-b7fc-30ec1f007ee2 | Azure API Hub - GCC-Med |
| 939fe80f-2eef-464f-b0cf-705d254a2cf2 | Power Query Online GCC-L2 |
| d9ce8cfa-8bd8-4ff1-b39b-5e5dd5742935 | OmnichannelCRMClient |
| 2c37df23-0c28-4fbf-9b2a-d5fd6277bf92 | OmnichannelEngagementHubAdminApp |
| 3957683c-3a48-4a6c-8706-a6e2d6883b02 | DYN365_CS_MESSAGING |
| 36ee54ac-414c-41ef-afde-2ddfd25d5408 | ApiHub-Connectors-GCCHigh |
| 7f15f9d9-cad0-44f1-bbba-d36650e07765 | Azure Synapse Link for Dataverse |
| 9856e8dd-37b6-4749-a54b-8f6503ea93b7 | PrcessSimpleGCCHigh |
| bb0fc165-b959-4e50-a8fc-309c1193e396 | CRM Power BI Integration GCC |
| 44a34657-125d-4be1-b08d-87a07b336d24 | PowerApps - play.apps.appsplatform.us |
| b145fb8f-d278-464f-8de1-894b596ecbde | PowerApps - apps.high.powerapps.us |
| a81833f1-fd18-490b-8598-60cd7b6b0382 | PowerApps - apps.gov.powerapps.us |
| d7e0a6a1-dde5-4f6e-81ce-781fa7483834 | mil.create.powerapps.us |
| 58acb57d-f51b-4993-8f4a-4e41ad77e481 | high.create.powerapps.us |
| a4b559be-784e-49ec-9b63-7208442255e1 | PowerApps Fairfax |
| 0cb2a3b9-c0b0-4f92-95e2-8955085f78c2 | PowerApps |
| 3e62f81e-590b-425b-9531-cad6683656cf | PowerApps - apps.powerapps.com |
| cd34d57a-a3ef-48b1-b84b-9686f0f7c099 | Aria |
| 6e7d203a-179d-4ae0-87da-a77dd8aa3135 | CrmSalesInsightsRA |
| fac5b0fe-9b16-4ae3-b20b-324ec3f033d3 | make.mil.powerapps.us |
| 5d21c8e8-6d68-4b62-a3a5-bc1900513fad | make.high.powerapps.us |
| feb2c8aa-4f70-4881-abec-521141627b04 | make.gov.powerapps.us |
| 0ef09fa7-413d-4a9f-a7a5-32f8f62b7598 | Field Service Mobile |
| 32166110-0424-4622-8b0d-4e50f4da7a74 | MR.Mty.App |
| 9a375489-421a-4af5-9f4a-3dd5a8f7b0d8 | APIHub-Connectors-GCC_notUsed |
| 38a893b6-d74c-4786-8fe7-bc3b4318e881 | ProcessSimpleGCC |
| 11f6c209-c042-4da5-acb9-8d3546fe506f | DYN365AISERVICEINSIHTSPPE |
| b80a77b1-a78c-4655-9283-e40bbc285af0 | CrmSalesInsightsTIP |
| c6d1e3ad-0185-40e0-a11b-0542b185d12c | PowerAppsGov |
| 96ff4394-9197-43aa-b393-6a41652e21f8 | ccibotsprod |
| fca5a20d-55aa-4395-9c2f-c6147f3c9ffa | MSRemoteAssist |
| 110797d6-4a5e-4e58-a06d-f1bf3f3a8069 | Field Service Mobile |
| 655db33f-4580-4e63-bad1-4618764badb9 | MicrosoftDynamics365MRGuidesCoreClient |
| a59cef1e-2e32-4703-8dab-810d9807efeb | ccibots |
| a522f059-bb65-47c0-8934-7db6e5286414 | CCIBot |
| 44a02aaa-7145-4925-9dcd-79e6e1b94eff | MicrosoftDynamics365OfficeAppsIntegration |
| 4e291c71-d680-4d0e-9640-0a3358e31177 | PowerApps |
| b20d0d3a-dc90-485b-ad11-6031e769e221 | CrmSalesInsights |
| 5a24b264-c8f3-474d-92f6-a998cca942c1 | Dynamics 365 for Marketing |
| 60d240cc-7621-469e-80f1-584c53e9cafa | DYN365AISERVICEINSIGHTS |
| a8f7a65c-f5ba-4859-b2d6-df772c264e9d | make.powerapps.com |
| 48af08dc-f6d2-435f-b2a7-069abd99c086 | Connectors | 
| b15cc146-2b25-46c7-90c1-daa6c3e8386b | CRM Groups Integration |
| 945d3a88-db20-40bd-a9e3-8f2383a17c88 | make.powerpages.microsoft.com |
| b861dbcc-a7ef-4219-a005-0e4de4ea7dcf | CrmExporter | 
| 0b820e0a-8d08-45d1-8740-bde894f7e1c2 | Lobe Client |
| 3d3f56ed-9c38-4480-b172-0fa5d8838516 | TrustedPublishersProxyServicePPE |
| 00000009-0000-0000-c000-000000000000 | Power BI |
| aeb01831-b358-4750-92ce-722e4f3ea7e8 | BizQA for CDS |
| 8d25f88c-09fe-41eb-9ee1-0545adf985df | Dynamics 365 Field Service |
| c495cfdc-814f-46a1-89f0-657921c9fbe0 | Azure AD Identity Governance - Dynamics 365 Management |
| 8578e004-a5c6-46e7-913e-12f58912df43 | Power Platform API |
| 7ab7862c-4c57-491e-8a45-d52a7e023983 | App Service | 
| ce9f9f18-dd0c-473e-b9b2-47812435e20d | Microsoft Dynamics CRM for tablets and phones |
| e64aa8bc-8eb4-40e2-898b-cf261a25954f | CRM Power BI Integration |
| 71234da4-b92f-429d-b8ec-6e62652e50d7 | Microsoft Customer Engagement Portal |
| a672d62c-fc7b-4e81-a576-e60dc46e951d | Microsoft Power Query for Excel |
| 6204c1d1-4712-4c46-a7d9-3ed63d992682 | Microsoft Flow Portal |
| f53895d3-095d-408f-8e93-8f94b391404e | Portfolios |
| b52893c8-bc2e-47fc-918b-77022b299bbc | Power BI Data Refresh |
| 2ad88395-b77d-4561-9441-d0e40824f9bc | Dynamics 365 Development Tools |
| 7df0a125-d3be-4c96-aa54-591f83ff541c | Microsoft Flow Service |
| f3b07414-6bf4-46e6-b63f-56941f3f4128 | Microsoft Power Query |
| d3590ed6-52b3-4102-aeff-aad2292ab01c | Microsoft Office |
| 51f81489-12ee-4a9e-aaae-a2591f45987d | Dynamics 365 Example Client Application |
| 2bc50526-cdc3-4e36-a970-c284c34cbd6e | Microsoft Business Office Add-in |
| 60216f25-dbae-452b-83ae-6224158ce95e | Microsoft Dynamics CRM App for Outlook |
| 1fec8e78-bce4-4aaf-ab1b-5451cc387264 | Microsoft Teams |
| 4906f920-9f94-4f14-98aa-8456dd5f78a8 | Dynamics CRM Unified Service Desk |
| 4d079b4c-cab7-4b7c-a115-8fd51b6f8239 | SQL DotNet Client |
| 04b07795-8ddb-461a-bbee-02f9e1bf7b46 | Microsoft Azure CLI |
| 2c1229aa-16c5-4ff5-b46b-4f7fe2a2a9c8 | ODBC Client Driver |
| 2e49aa60-1bd3-43b6-8ab6-03ada3d9f08b | Dynamics Data Integration |
| a94f9c62-97fe-4d19-b06d-472bed8d2bcf | Azure SQL Database and Data Warehouse |
| 7f98cb04-cd1e-40df-9140-3bf7e2cea4db | JDBC Client Driver |
| d6b5a0bd-bf3f-4a8c-b370-619fb3d0e1cc | Dynamics Retail Modern POS |
| 5e3ce6c0-2b1f-4285-8d4b-75ee78787346 | Microsoft Teams Web Client |
| 1950a258-227b-4e31-a9cf-717495945fc2 | Microsoft Azure PowerShell |
| 2f3b013e-5dc4-4b2a-831f-47ba08353237 | Microsoft Dynamics 365 Project Service Automation Add-in for Microsoft Project |
| d326c1ce-6cc6-4de2-bebc-4591e5e13ef0 | SharePoint |
| 27922004-5251-4030-b22d-91ecd9a37ea4 | Outlook Mobile |
| d7813711-9094-4ad3-a062-cac3ec74ebe8 | Microsoft.Azure.Services.AppAuthentication |
| 872cd9fa-d31f-45e0-9eab-6e460a02d1f1 | Visual Studio |
| a306baf0-5ad8-4f6f-babf-6a286b0142ba | Azure Data Factory |
| 4813382a-8fa7-425e-ab75-3b753aab3abb | Microsoft Authenticator App |
| fc4979e5-0aa5-429f-b13a-5d1365be5566 | Microsoft Power BI Government Community Cloud |
| 34cc6120-8c17-428c-b5aa-bede141fb74a | Power BI Data Refresh |
| ea0616ba-638b-4df5-95b9-636659ae5121 | Power BI Gateway |
| f40b99cd-675e-4ce8-ae86-47b77d2a9c4d | Microsoft Mashup Engine |
| f05ff7c9-f75a-4acd-a3b5-f4b6a870245d | SharePoint Android |
| 091c98b0-a1c9-4b02-b62c-7753395ccabe | Dynamics RCS Workload |
| 57fcbcfa-7cee-4eb1-8b25-12d2030b4ee0 | Microsoft Flow |
| c0d2a505-13b8-4ae0-aa9e-cddd5eab0b12 | Microsoft Power BI |
| 22098786-6e16-43cc-a27d-191a01a1e3b5 | Microsoft To-Do client |
| f44b1140-bc5e-48c6-8dc0-5cf5a53c0e34 | Microsoft Edge |
| 2db8cb1d-fb6c-450b-ab09-49b6ae35186b | Microsoft Dynamics CRM Learning Path |
| b26aadf8-566f-4478-926f-589f601d9c74 | OneDrive |
| dd63a01a-ae84-4d07-bf60-69dadeaa8c89 | Project Finder Mobile |
| cc15fd57-2c6c-4117-a88c-83b1d56b4bbe | Microsoft Teams Services |
| c44b4083-3bb0-49c1-b47d-974e53cbdf3c | Azure Portal |
| 1b730954-1685-4b74-9bfd-dac224a7b894 | Azure Active Directory PowerShell |
| 0eda3b13-ddc9-4c25-b7dd-2f6ea073d6b7 | Microsoft Flow CDS Integration Service |
| 66375f6b-983f-4c2c-9701-d680650f588f | Microsoft Planner |
| 9ba1a5c7-f17a-4de9-a1f1-6178c8d51223 | Microsoft Intune Company Portal |
| 00b41c95-dab0-4487-9791-b9d2c32c80f2 | Office 365 Management |
| 26a7ee05-5602-4d76-a7ba-eae8b7b67941 | Windows Search |
| 60c8bde5-3167-4f92-8fdb-059f6176dc0f | Enterprise Roaming and Backup |
| 90f610bf-206d-4950-b61d-37fa6fd1b224 | Aadrm Admin Powershell |
| cb1056e2-e479-49de-ae31-7812af012ed8 | Microsoft Azure Active Directory Connect |
| 89bee1f7-5e6e-4d8a-9f3d-ecd601259da7 | Office365 Shell WCSS-Client |
| 00000015-0000-0000-c000-000000000000 | Microsoft Dynamics ERP |
| cf8f0657-7610-4b05-8723-a4322ae045c6 | Microsoft Dynamics Document Routing Agent |
| 637fcc9f-4a9b-4aaa-8713-a2a3cfda1505 | Dynamics CRM Online Administration |
| 00000002-0000-0ff1-ce00-000000000000 | Office 365 Exchange Online |
| 9bc3ab49-b65d-410a-85ad-de819febfddc | Microsoft SharePoint Online Management Shell |
| a69788c6-1d43-44ed-9ca3-b83e194da255 | Azure Data Studio |
| cf710c6e-dfcc-4fa8-a093-d47294e44c66 | Azure Analysis Services Client |
| 57336123-6e14-4acc-8dcf-287b6088aa28 | Microsoft Whiteboard Client |
| ab9b8c07-8f02-4f72-87fa-80105867a763 | OneDrive SyncEngine |
| af124e86-4e96-495a-b70a-90f90ab96707 | OneDrive iOS App |
| e9c51622-460d-4d3d-952d-966a5b1da34c | Microsoft Edge |
| c58637bb-e2e1-4312-8a00-04b5ffcd3403 | SharePoint Online Client Extensibility |
| dd762716-544d-4aeb-a526-687b73838a22 | Microsoft Device Registration Client |
| 268761a2-03f3-40df-8a8b-c3db24145b6b | Universal Store Native Client |
| 1b3c667f-cde3-4090-b60b-3d2abd0117f0 | Windows Spotlight |
| fc0f3af4-6835-4174-b806-f7db311fd2f3 | Microsoft Intune Windows Agent |
| 59d7fccf-1f97-4a79-bb78-e722112f9862 | Dynamics 365 Sales |
| 600def3d-4cdb-465f-9dad-dce96b255d6a | DeflectionTest |
| db966cd2-032b-4f21-b7c2-eadd3d68c2f2 | CDSUserManagementNonProd |
| 5443ef98-eb7c-4354-8367-f35dffe3cba7 | DeflectionPreProd |
| 585738fa-4b8c-4f90-b926-7eab8c498c69 | PowerAppsCustomerManagementPlaneBackend |
| ab9468a9-c559-47ec-86f6-2f1b48612c09 | DataSyncService |
| dad3c6de-ed58-42ef-989f-9c0303aaeedc | PowerAutomate-ProcessMining |
| 886d9650-b672-4531-b16f-4617b5492d2f | AppDeploymentOrchestration |
| f034940d-60b7-4587-afc9-ac1786ad7419 | RelevanceSearch |
| edfdd43b-26b5-498b-b89f-515ddf78dcc2 | CCaaSCRMClient |
| c4c008ec-e9c5-455c-b7e3-92c49982bc84 | PowerAutomate-ProcessMining-PPE |
| 630e0ac2-6aa6-41bd-b950-5ade41828d3a | PowerAutomate-ProcessMining-DEV |
| e1255f48-529f-4573-8ad2-8b13d784cd1c | PowerAutomate-ProcessMining-TEST |
| dac3dc4c-8be0-4972-8c97-e0a8500927f3 | PowerAppsDataPlaneBackend |
| de8e0d25-0c9e-4230-87d6-cf379be2f1bd | Flow-CDSNativeConnectorTIP2US |
| b9f7f9ce-78c7-4651-8663-c2ba51a2556a | SIAutoCapture |
| 079013fb-85d0-4d99-87d0-aeca060231e3 | DynamicsInstallerTest |
| fa69122a-0a5e-41f1-beed-ca317370fb56 | JobsServicePreProd |
| 0527d918-8aec-4c44-9f4e-86cc8b88d87b | AIBuilder_StructuredML_PreProd_CDS |
| c9b24c1a-09c1-4726-a288-709c86a12a9b | Omnichannel |
| a7d42dcf-5f3b-41b0-8ad5-e7c5808c617a | PowerPlatformEnvironmentManagement |
| bdb3d4c5-dc11-426e-8f04-2621dbcce738 | Flow-RP |
| de9fe347-3128-4a28-9b19-cd4ecca1f526 | TPSProxyServiceTST |
| 7255edad-9269-44d0-b153-92ceffbf86fa | InsightsAppsPlatform |
| 7a7f0ba2-519f-49eb-9b86-1a967ba231f3 | CatalogServiceTest |
| 71684101-1068-40b0-a0da-062710e1040d | Finance and Operations Runtime Integration User - TST Geo |
| ce384d7c-6755-471d-91aa-1b48cc519c49 | AppDeploymentOrchestration-Preprod |
| 978b42f5-e03a-4695-b8df-454959d032c8 | BAP CDS Application |
| c92229fa-e4e7-47fc-81a8-01386459c021 | Common Data Service User Management |
| 44f229e1-5c76-4d68-8b7c-83cbfd54ab7a | Dynamics 365 Sales Service |
| 1884bdbf-452a-4a11-9c76-afdbdb1b3768 | Relevance Search Service |
| 27f13ec4-0f4e-4840-b547-1a0181666256 | PowerApps CDS Service |
| ffa7d2fe-fc04-4599-9f6d-7ca06dd0c4fd | Product Insights - CDS to Azure data lake - app |
| 265378aa-7259-4b82-af51-0c97c6cbc0ca | ApolloNonProdFirstParty |
| 8b62382d-110e-4db8-83a6-c7e8ee84296a | AI Builder Prod - CDS to Azure data lake |
| 97d27433-255e-498c-a280-0cbc9aee407e | GlobalDiscoService2 |
| 546068c3-99b1-4890-8e93-c8aeadcfe56a | Common Data Service Managed Data Lake Service |
| 6eb29b24-9d89-4f26-bf2f-9a84ed2499b8 | Common Data Service Global Discovery Service |
| 299fa2bd-f53a-45b1-b501-1056398454bc | Dynamics 365 CCA Prod - CDS to Azure data lake |
| e8ab36af-d4be-4833-a38b-4d6cf1cfd525 | MicrosoftSocialEngagement@microsoft.com |
| fbc61429-7762-4b4a-8f9d-c728a1a5e792 | Flow Xrm System User |
| 7a575ec8-8d12-42eb-9edc-b93f3aa92c48 | MicrosoftCrmDataSync@microsoft.com |
| 6ec6a75c-d04e-4613-92da-069f88c74a13 | Dynamics 365 Customer Insights Prod - CDS to Azure data lake |
| 87684a6d-f115-436c-a231-6a4d08eb01a6 | Dynamics 365 CCA Data analytics Prod - CDS to Azure data lake |
| 8c04f0eb-27fc-44cc-9e48-914b9202890a | ApolloProdFirstParty |
| d4a55fa7-2c20-434d-8942-689200452979 | DynamicsCRMCortanaCacheService@microsoft.com |
| e548fb5c-c385-41a6-a31d-6dbc2f0ca8a3 | Microsoft Dynamics Jobs Service |
