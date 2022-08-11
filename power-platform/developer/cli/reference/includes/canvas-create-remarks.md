### Remarks

Considerations and limitations:

- The custom connector referenced with the `connector-display-name` or `connector-id` parameters must be part of a [Solution](/power-platform/alm/solution-concepts-alm).
- After importing the app to Studio, there will be no association to the custom connector.  The maker must manually add a reference to the custom connector from which the app was generated before the app can be played.  See [Add data connections to canvas apps](/power-apps/maker/canvas-apps/add-data-connection) for steps.  Until this is done, you may see formula errors in the app which will resolve once the connector reference is added.  The name of the custom connector you add to the app must match the display name of the custom connector referenced in the `canvas create` command.
- The app will contain one screen for each `POST` and `GET` action that the connector defines.
   - Other verbs available in custom connectors are not supported.
- The controls rendered on each action's screen are dynamically generated based on how the input and output types of each action are defined.  Certain types of input and output defined in the custom connector are not supported by `canvas create`.  The command will generate warnings in the console when these are encountered.  Specific cases:
   - Arrays of objects and arrays of arrays are not supported as inputs
   - Controls are not generated for objects or nested arrays beyond a depth of 20
   - "File" and "binary format" types are not supported for input or output.
