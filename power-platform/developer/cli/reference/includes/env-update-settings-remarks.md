### Remarks

The [pac env list-settings](#pac-env-list-settings) command indiscriminately returns all the columns from the first and only row of the [organization entity type](xref:Microsoft.Dynamics.CRM.organization). Consider the following items when using this command to update settings.

#### You can't update all settings

Not every setting returned by [pac env list-settings](#pac-env-list-settings) can be updated using this command. Some columns aren't valid for update. If you attempt to update these columns, this command indicates success, but the value isn't updated. Refer to the [Organization table Writable columns/attributes](/power-apps/developer/data-platform/reference/entities/organization#writable-columnsattributes) for settings that can be updated.

#### It isn't supported to update some settings this way

We don't support updating all settings returned by [pac env list-settings](#pac-env-list-settings) directly.

For example, the  [orgdborgsettings](/power-apps/developer/data-platform/reference/entities/organization#BKMK_OrgDbOrgSettings) column. Don't update the string value for this column directly. [Learn how to edit the settings stored in the orgdborgsettings column safely](../../../../admin/environment-database-settings.md)

Look to the documentation for the feature that the setting changes to understand whether we support updating the setting directly using this command.

#### Some settings are deprecated

You should review the descriptions of the settings in the [Organization table Writable columns/attributes](/power-apps/developer/data-platform/reference/entities/organization#writable-columnsattributes) reference documentation. Some of the settings returned by [pac env list-settings](#pac-env-list-settings) are deprecated.