### Remarks

Each environment has an [Organization table](/power-apps/developer/data-platform/reference/entities/organization) with a single row that stores settings for the environment.

Unless you apply the `--filter` parameter, this command returns all the columns from the first and only row of the [organization entity type](xref:Microsoft.Dynamics.CRM.organization). 

Use the [pac env update-settings](#pac-env-update-settings) command to change the values for some of these settings.

[Learn more about reading and updating environment settings](/power-apps/developer/data-platform/organization-table)