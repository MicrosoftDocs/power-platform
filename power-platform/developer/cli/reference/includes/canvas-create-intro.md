This command will generate an `.msapp` canvas app based on the OpenAPI definition of an existing [custom connector](/connectors/custom-connectors/).  The app will contain screens, control layout, and Power Fx code generated based on how the actions of the custom connector are defined, with a predefined look and feel.  The app can be used to directly exercise the actions defined in the custom connector.

Makers can import the generated `.msapp `into Power Apps Studio to play the app, or to do edits and make further customizations.  Import the generated app to Power Apps Studio by navigating to **File** > **Open** > **Browse** within Studio.

### Example

```powershell
pac canvas create --msapp HelloWorld.msapp --connector-display-name "My Custom Connector"
``` 

Either `connector-display-name` or `connector-id` are required.