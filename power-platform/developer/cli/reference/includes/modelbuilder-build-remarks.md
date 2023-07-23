### Remarks

The following are recommendations for using the `pac modelbuilder build` command.

#### Set the `entitynamesfilter` and `messagenamesfilter` parameters

> [!CAUTION]
> We **strongly recommend** that you use the `entitynamesfilter` and `messagenamesfilter` parameters to limit the generated files to those you will use in your project. Otherwise, the build command will attempt to generate code for all tables and messages from Dataverse. This will take a significant amount of time tor process.

Classes for the messages found in the [Microsoft.Crm.Sdk.Messages](xref:Microsoft.Crm.Sdk.Messages) and [Microsoft.Xrm.Sdk.Messages](xref:Microsoft.Xrm.Sdk.Messages) namespace are not generated using this command. You should only include messages not found there in the `messagenamesfilter` parameter, such as custom actions.

#### Set suppressINotifyPattern if you aren't building a WPF application

The `INotify` wrappers that are suppressed by this command are used for databinding scenarios with WPF applications. If you aren't building a WPF application with the generated code, you don't need them.

<!-- I don't know if this is good guidance, but as noted in the PR, I think we could provide more information about the scenario where people might want to have these `INotify` wrappers included. -->