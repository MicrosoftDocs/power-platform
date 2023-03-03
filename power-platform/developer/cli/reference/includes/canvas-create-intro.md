This command will generate an `.msapp` canvas app based on the OpenAPI definition of an existing [custom connector](/connectors/custom-connectors/).  The app will contain screens, control layout, and Power Fx code generated based on how the actions of the custom connector are defined, with a predefined look and feel.  The app can be used to directly exercise the actions defined in the custom connector.

Makers can import the generated `.msapp` into Power Apps Studio to play the app, or to do edits and make further customizations.  Import the generated app to Power Apps Studio by navigating to **File** > **Open** > **Browse** within Studio.

### Examples

The following examples show the use of the `pac canvas create` command.

- [Create a canvas app based on an Open API Definition by display name](#create-a-canvas-app-based-on-an-open-api-definition-by-display-name)
- [Create a canvas app based on an Open API Definition by id](#create-a-canvas-app-based-on-an-open-api-definition-by-id)

#### Create a canvas app based on an Open API Definition by display name

This example creates a canvas app (as a *.msapp file) based on an Open API Definition by using the display name of the connector.

```powershell
pac canvas create --msapp HelloWorld.msapp --connector-display-name "My Custom Connector"
```

#### Create a canvas app based on an Open API Definition by id

This example creates a canvas app (as a *.msapp file) based on an Open API Definition by using the ID of the connector.

```powershell
pac canvas create --msapp HelloWorld.msapp --connector-id 00000000-0000-0000-0000-000000000000
```

Either `connector-display-name` or `connector-id` are required.
