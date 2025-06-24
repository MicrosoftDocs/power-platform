---
title: Copy an environment
description: Learn how to copy apps and data from an environment. Review next steps for administrators in the target environment.
ms.topic: how-to
ms.date: 06/24/2025
author: ChrisGarty
ms.author: cgarty
contributors:
- matapg007
- ellenwehrle
ms.reviewer: sericks
---
# Copy an environment

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can use the **Copy** option in the Microsoft Power Platform admin center to copy data between environments. You can select two levels of copy: **Everything** or **Customizations and schemas only**.  

> [!NOTE]
>
> - The target environment will be listed in the **Select environment to overwrite** drop-down. If you don't see an environment, that means you can't overwrite it. For example, you can't overwrite production environments so you won't see any environments of type production.  
>   :::image type="content" source="media/copy-environment/copy-environment-no-target.png" alt-text="No target for copying environment.":::
> - You can only copy to an environment in the same tenant and region.
> - If an environment is [enabled for Virtual Network support](vnet-support-overview.md), you can only copy to an environment in the same enterprise policy.
> - Components that have not been added to a solution (including canvas apps, flows, custom connectors, and connections) might not be part of the copy. You should validate your apps post copy.
> - For each canvas App only up to 20 of the most recent revisions will be copied over.
> - You can't copy from or to a default or trial type environment.
> - Copy and restore operations can take up to 8 hours unless a lot of data, including audit data, needs to be copied or restored, in which case they could take up to 24 hours.
  
## Copy over everything

 An **Everything** copy includes all application data, users, and customizations, and schemas from the source environment and is suitable for:  
  
- User acceptance testing  
- Upgrade testing  
- Preview in production (TAP/EA)  
- Training  
  
**An example scenario**  
  
Isaac, a business application developer, received a request from the sales department to configure and deploy a social media integration solution from another company vendor. Isaac never installed a solution from this vendor and is unsure what impact this would have on the production application. Isaac would like to import the solution into an environment that is nearly identical to, but isolated from, production to learn about the solution and make the appropriate configuration changes. Isaac submits a request to Thomas, the IT Manager for Contoso, to create an Everything copy sandbox environment for Isaac.  
  
After the Everything copy is complete, Isaac receives a mail from Thomas telling that the sandbox environment is ready. Isaac logs into the sandbox environment and makes the necessary changes to make sure that production external services isn't be impacted by the sandbox environment. Once changes are complete, Isaac turns off administration mode and enables background services. Isaac is able to use the Everything copy sandbox environment to do the testing and later manually import the solution into production.  
  
## Copy over customizations and schemas only

 Customizations and schemas copy only includes users, customizations, and schema from the source environment and is suitable for:  
  
- Iterative team development  
- Partner/ISV solutions  
- Proof of concept  
  
**An example scenario**  
  
Isaac has a large development project starting next week for the sales department. Isaac has a team of developers ready to start on the project, some of whom are internal to Contoso and some are external vendors. The Contoso sales application contains personal data that the sales manager stated must not be made available to any external parties for privacy and legal liability reasons. Isaac requests customizations and schemas only copy sandbox environment that doesn't contain any production data or users. In addition, Isaac creates a Microsoft 365 security group to give the development team access to the sandbox environment.  
  
After modifying and enabling some of the plug-ins, the developer sandbox environment functions the same and is isolated from the production application. The development team works on their modifications in this environment for several weeks. They package their changes into a solution and export/import to deploy to the Everything copy sandbox environment. After a successful round of testing and signoffs, the changes are manually deployed to production.  
  
### Tables truncated in customizations and schemas only copy

 The following tables are truncated when you do customizations and schemas only copy:  

| Tables    |  &nbsp;    |  &nbsp;   |
|-----------|-----------|-----------|
| Account | InterProcessLock | SocialActivity |
| AccountLeads | Invoice | SocialInsightsConfiguration |
| ActivityMimeAttachment | InvoiceDetail | SocialProfile |
| ActivityParty | KnowledgeArticle | SqlEncryptionAudit |
| ActivityPointer | KnowledgeArticlesCategories | Subscription |
| AdvancedSimilarityRule | KbArticle | SubscriptionClients |
| Annotation | KbArticleComment | SubscriptionManuallyTrackedObject |
| AnnualFiscalCalendar | KnowledgeSearchModel | SubscriptionStatisticsOffline |
| Appointment | Lead | SubscriptionStatisticsOutlook |
| Attachment | LeadAddress | SubscriptionSyncEntryOffline |
| Audit | LeadCompetitors | SubscriptionSyncEntryOutlook |
| AzureServiceConnection | LeadProduct | SubscriptionSyncInfo |
| BulkDeleteFailure | Letter | SystemApplicationMetadata |
| BulkOperation | License | SystemUserBusinessUnitEntityMap |
| BulkOperationLog | List | SystemUserLicenses |
| BusinessProcessFlowInstance | ListMember | Task |
| BusinessUnitNewsArticle | MailboxStatistics | TeamProfiles |
| Campaign | MonthlyFiscalCalendar | TeamRoles |
| CampaignActivity | Notification | Territory
| CampaignActivityItem | Opportunity | TimeZoneLocalizedName |
| CampaignItem | OpportunityClose | Topic |
| CampaignResponse | OpportunityCompetitors | TopicHistory |
| Competitor | OpportunityProduct | TopicModel |
| ChannelAccessProfile | OrderClose | TopicModelConfiguration |
| CompetitorAddress | OrganizationUI | TopicModelExecutionHistory |
| CompetitorProduct | OwnerMapping | TraceAssociation |
| CompetitorSalesLiterature | PhoneCall | TraceLog |
| Connection | PluginTypeStatistic | TraceRegarding |
| Contact | PluginTraceLog | UnresolvedAddress |
| ContactInvoices | Post | UntrackedEmail |
| ContactLeads | PostComment | UserApplicationMetadata |
| ContactOrders | PostFollow | UserEntityInstanceData |
| ContactQuotes | PostLike | UserEntityUISettings |
| Contract | PostRegarding | UserFiscalCalendar |
| ContractDetail | PostRole | UserForm |
| CustomerAddress | PriceLevel | UserQueryVisualization |
| CustomerOpportunityRole | PrincipalObjectAccess | WizardAccessPrivilege |
| CustomerRelationship | PrincipalObjectAttributeAccess | WorkflowLog |
| DelveActionHub | ProcessSession | WorkflowWaitSubscription |
| Discount | Product | BusinessDataLocalizedLabel |
| DiscountType | ProductAssociation | DynamicProperty |
| DocumentIndex | ProductPriceLevel | ChannelPropertyGroup |
| DuplicateRecord | ProductSalesLiterature | DynamicPropertyAssociation |
| Email | ProductSubstitute | DynamicPropertyInstance |
| EmailHash  | QueueItem | Position |
| EmailSearch | Quote | ChannelProperty |
| Entitlement | QuoteClose | RollupJob |
| EntitlementChannel | QuoteDetail | SLAKPIInstance |
| EntitlementContacts  | RecurrenceRule | SystemUserManagerMap |
| EntitlementProducts | TextAnalyticsEntityMapping | SystemUserSyncMappingProfiles |
| EntitlementTemplate | RecurringAppointmentMaster | OfficeGraphDocument |
| EntitlementTemplateChannel | RelationshipRole | SimilarityRule |
| EntitlementTemplateProducts | RelationshipRoleMap | BookableResource |
| ExchangeSyncIdMapping | ReplicationBacklog | BookableResourceGroup |
| BookableResourceBookingExchangeSyncIdMapping | SalesLiterature | BookableResourceBooking |
| ExternalParty | SalesLiteratureItem | BookableResourceBookingHeader |
| ExternalPartyItem | SalesOrder | BookableResourceCategory |
| Fax | SalesOrderDetail | BookableResourceCharacteristic |
| FixedMonthlyFiscalCalendar | SdkMessageProcessingStepSecureConfig | BookableResourceCategoryAssn |
| Goal | SemiAnnualFiscalCalendar | Characteristic |
| GoalRollupQuery | Service | RatingValue |
| Import | ServiceAppointment | RatingModel |
| ImportData | ServiceContractContacts | BookingStatus |
| ImportFile | SharePointData | RecommendedDocument |
| ImportLog | SharePointDocument | EmailSignature |
| Incident | SharePointDocumentLocation | UserSearchFacet |
| IncidentResolution | SharePointSite | GlobalSearchConfiguration |
| IntegrationStatus | SLA | |

## How to copy an environment
  
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.
  
   > [!NOTE]
   > Environment Admins or System Administrators can copy all available environments. System administrators can copy environments for which they have the Environment Admin or System Administrator role.  
  
2. From the left-side menu, select **Environments**, and then select a source environment to copy.

3. Select **Copy** from the top menu bar.
  
4. Select the desired copy over level.
  
   > [!div class="mx-imgBorder"]
   > ![Select the desired copy over level.](media/copy-environment1.png "Select the desired copy over level.")

5. If you selected **Everything** to copy, select whether to copy over audit logs. See the [Copying audit logs](#copying-audit-logs) section.

6. Select a target environment.
  
   A target environment can be a sandbox or preview environment, not a production environment. A sandbox or preview environment can be promoted to a production environment type later after the copy environment operation. If you're copying an environment of type **Trial (subscription-based)**, you'll be able to see and select target environments of the same type that is **Trial (subscription-based)**.
  
   > [!WARNING]
   > The data, components, and customizations in target environment will be deleted and replaced with a copy of the data, components, and customizations from the source environment. You won't be able to recover any deleted data.  

7. To restrict environment access to people in a security group select **Edit** (![Edit.](media/edit-button.png)).

8. Edit the details for the copied environment, and then select **Copy**.

   > [!div class="mx-imgBorder"]
   > ![Select Copy.](media/copy-environment2.png "Select Copy.")

9. Select **Confirm** to overwrite the target environment.

The overwrite process starts.

> [!div class="mx-imgBorder"] 
> ![Copy environment status.](media/copy-environment-status.png "Copy environment status.")
  
Once the copy process is complete, the target environment is placed in [Administration mode](sandbox-environments.md#administration-mode) and background operations are disabled. The next section describes recommended Administrator actions for the newly created copy (target) environment.  

### How to copy audit logs

Copying audit logs can significantly add to the time it takes to copy an environment and by default isn't done. To include audit logs in the environment copy, take these steps.

1. Complete steps 1-5 above.

2. Under **Audit logs**, select **Click here**.

   :::image type="content" source="media/copy-environment/copy-environment-audit-logs.png" alt-text="Select click here to include audit logs.":::

3. Enable copying audit logs.

   :::image type="content" source="media/copy-environment/copy-environment-audit-logs-enable.png" alt-text="Enable copying audit logs.":::

4. Continue with steps 6-9 above.

### Next steps after copying an environment

 To ensure the newly created copy (target) environment doesn't impact your production environment, once the copy operation is complete, two things happen:  
  
- The newly created copy environment is placed in administration mode. Only those with System Administrator security roles can sign in and manage the copy environment. Regular users can't sign in and use the copy environment.  
  
- Background operations are disabled in the copy environment. Disabled operations include workflows and synchronization with Microsoft Exchange.  
  
### Review components
  
 You should review the status of application components in the copy environment with external connections such as Yammer, email, plug-ins, custom workflow activities, etc. Review these and consider what action to take:  
  
- Disable the component.  
- Redirect the component to another service environment such as one running Exchange or SharePoint.
- Do nothing – leave the component as is in the copy environment. For example, you might decide to allow Yammer posting to both the copy and production environments.  
  
Here are some possible application components in the copy environment that could have external connections and therefore could impact services with the same connections in your production environment.  

#### Email

A mailbox can't be synced with two different environments. For an Everything copy environment, the user mailboxes in the copy environment must be disabled so the mailboxes don't attempt to send or receive email, or track appointments, contacts, or tasks. Set synchronization for the following to None.  
  
- Incoming Email  
- Outgoing Email  
- Appointments, Contacts, Tasks  
  
  More information: [Set the delivery method for incoming and outgoing email](set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)  
  
#### SharePoint

Deactivate or redirect SharePoint to a sandbox SharePoint environment to prevent impacting documents managed by SharePoint. Go to **Settings** > **Documentation Management** > **SharePoint Sites**. Select your site, and then select **Deactivate**.  
  
#### Yammer

Disable Yammer or redirect to a separate Yammer service to prevent posts made in the copy environment conflicting with posts made in the production environment. Go to **Settings** > **Administration** > **Yammer Configuration**.  
  
After creating a new sandbox environment, workflows and system jobs might be pending execution. Apart from these jobs, if you've connected Yammer to customer engagement apps there will be Yammer activity streams posted from customer engagement apps to Yammer asynchronously. Such activity streams aren't visible through the system jobs. If there were any pending Yammer activity streams before the Disable Background Process is turned on, activity streams will be posted to the current Yammer configuration once the Disable Background Process is turned back off. In the sandbox environment, if you have your current Yammer configuration connected to the same Yammer network as your production environment, you might see duplicate activity streams. To avoid duplicate Yammer activity streams, redirect your sandbox environment to another Yammer network (possibly a test network) before turning background processes back on.  
  
#### Platform extensibility

Consider disabling anything that could be running in the copy environment and impacting external service components:
  
- **Server-side plug-ins**.  
- **Workflow custom activity**.  

#### Client extensibility

Review:
  
- **Client-side JavaScript**. Take a look at your JavaScript and HTML web resources for read/write operations that could impact external services.  
- **IFRAMES**. Determine if the target of an IFRAME is a production environment.  

#### Dataverse search

Confirm that search returns expected results. If results aren't accurate, you can turn off Dataverse search for 12 hours and then turn Dataverse search back on again to refresh the index. You may contact [Microsoft support](get-help-support.md) if you're still experiencing issues.

#### Flows

- In the target environment, existing solution flows are deleted but existing nonsolution flows remain.
- Flows are initially disabled.
- When enabling a flow, if an error is encountered, then open the flow in the designer to review errors and flow checker warnings. Adjust and resave the flow as needed.
- Flow run history won't be copied to the target environment.
- Flows with a "When an HTTP request is received" trigger has a new HTTP URL.
- If the source environment was a default environment, then integrating services like SharePoint, Excel, Teams, Power BI, and OneDrive continue to point at any related flows in the source environment. Consider if those integration flows can remain in the source default environment. Remove any integration flows from the target environment that stays behind in the source default environment.

Action items:

- Review the flows in the target environment to ensure that triggers and actions are pointing at the correct locations.
- Review flows that use custom connectors to ensure they're pointing at the new custom connector in the target environment. For more details, see [Custom Connectors](#custom-connectors) below.
- Before enabling flows in the target environment, consider if the corresponding flows should be disabled in the source environment and if appropriate, then disable those flows. Ensure that flow runs have completed before disabling flows.
- Enable flows as needed. Any child flows need to be enabled before parent flows can be enabled.
- For any flows using the "When an HTTP request is received" trigger, adjust any dependent flows or apps to call the new HTTP URL. If the flows in the source environment are disabled, then testing that the dependent apps have been redirected correctly becomes easier.

#### Connection References

Connection References require new connections. To review a full list of connection references:

1. Open **Solutions**.
1. Search for the **Default Solution**.
1. Select on the objects filter for **Connection references** and select on each one to view its properties and connection.

Action item:

Create or set connections on all Connection References. Ensure that the connections are created by the appropriate user.

#### Custom Connectors

- Custom connectors have a new identifier in the target environment and appear to be a new connector, so flows need to be adjusted to point to the new custom connector.

Action item:

Review all custom connectors in the custom connectors page to ensure they were published correctly.

### Cleaning up source environment after copy

Once the target environment is running correctly with the environment copy from the source environment, consider if the source environment should remain running. In some cases, a duplicate environment is desired, but in other cases, the source environment can now be deleted. Ensure that all components in target environment are running correctly before deleting a source environment. An [environment backup](/power-platform/admin/backup-restore-environments) of the source environment can be made if needed.

Action items:

- Delete duplicate items.
- If needed, delete source environment.

### See also

[What's new about storage](whats-new-storage.md) <br />
[New Microsoft Dataverse storage capacity](capacity-storage.md) <br />
[Legacy storage capacity](legacy-capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
