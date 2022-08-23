# Relase Life Cycle

Creator Kit components are released in phases to ensure the feature has been thoroughly tested before considered stable. Users can refer to the release phase of each component to determine whether the component can be used in production.

## Release phases

- **Preview**. Should be used with caution in an isolated development environment.
- **Generally Available**. Can be used in a production application.

## Updating components
When a component is updated in a new version of the Creator Kit solution, install the latest version of the solution in the environment.

If a component is being used in an existing application, the instances of the component must be deleted from the app, then completely uninstalled from the app.

## Deprecated components

Here is a list of components that have been deprecated:

### Canvas components

These components are no longer available in the canvas component library of the Creator Kit:

| Control | Notes |
|-|-|
| Spinner | This has been replaced by the Fluent UI code component [Spinner](). |
| ProgressIndicator | This has been replaced by the Fluent UI code component [ProgressBar](). |