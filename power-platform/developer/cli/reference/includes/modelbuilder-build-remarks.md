### Remarks

The following are recommendations for using the `pac modelbuilder build` command.

#### Set the `entitynamesfilter` and `messagenamesfilter` parameters

> [!CAUTION]
> We **strongly recommend** that you use the [entitynamesfilter](../modelbuilder.md#--entitynamesfilter--enf) and [messagenamesfilter](../modelbuilder.md#--messagenamesfilter--mnf) parameters to limit the generated files to those you will use in your project. Otherwise, the build command will attempt to generate code for all tables and messages from Dataverse. This will take a significant amount of time to process.

Classes for the messages found in the [Microsoft.Crm.Sdk.Messages](xref:Microsoft.Crm.Sdk.Messages) and [Microsoft.Xrm.Sdk.Messages](xref:Microsoft.Xrm.Sdk.Messages) namespace are not generated using this command. You should only include messages not found there in the `messagenamesfilter` parameter, such as custom actions.

#### Set `suppressINotifyPattern` if you aren't building a WPF application

The `INotify` wrappers that are suppressed by this command are used for databinding scenarios with WPF applications. If you aren't building a WPF application with the generated code, you don't need them. Use the [suppressINotifyPattern](../modelbuilder.md#--suppressinotifypattern) parameter to suppress them.

#### Include `serviceContextName` when generating message classes

If you are generating message classes, you should always include the [serviceContextName](../modelbuilder.md#--servicecontextname--sctx) parameter to generate a <xref:Microsoft.Xrm.Sdk.Client.OrganizationServiceContext>, even if you aren't using it. The generated message classes require a property set in this file. [Learn more about the error that occurs if you don't set this](/power-apps/developer/data-platform/org-service/generate-early-bound-classes#include-servicecontextname-when-generating-message-classes).