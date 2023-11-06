Use the [pac modelbuilder build](#pac-modelbuilder-build) command to generate early-bound .NET classes for Dataverse tables, custom messages, and a class that is derived from the [OrganizationServiceContext Class](xref:Microsoft.Xrm.Sdk.Client.OrganizationServiceContext). [Learn more about using this command to generate early bound classes](/power-apps/developer/data-platform/org-service/generate-early-bound-classes)

The class derived from <xref:Microsoft.Xrm.Sdk.Client.OrganizationServiceContext>:

- Maintains state on the client to support features such as change management.
- Implements the [System.Linq.IQueryable Interface](xref:System.Linq.IQueryable) and a .NET Language-Integrated Query (LINQ) query provider so you can write LINQ queries using Dataverse data.

For more information about the capabilities that this code generation tool enables:

- [Late-bound and early-bound programming using the Organization service](/power-apps/developer/data-platform/org-service/early-bound-programming)
- [Use OrganizationServiceContext](/power-apps/developer/data-platform/org-service/organizationservicecontext)
- [Build queries with LINQ](/power-apps/developer/data-platform/org-service/build-queries-with-linq-net-language-integrated-query)

> [!NOTE]
> The `pac modelbuilder build` command replaces the `CrmSvcUtil.exe` distributed with the [Microsoft.CrmSdk.CoreTools](https://www.nuget.org/packages/Microsoft.CrmSdk.CoreTools) NuGet package.