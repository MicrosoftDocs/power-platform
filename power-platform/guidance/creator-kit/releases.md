# Relase Life Cycle

Creator Kit components are released in phases to ensure the feature has been thoroughly tested before considered stable, or an underlying platform capibility is in preview that an individual component is dependent on. Users can refer to the release phase of each component to determine whether the component can be used in production.

The preview status of a component is indicated on each component's documentation page.

## Release phases

- **Experimental**. New component that are subject to change. Might not ever make it to production.
- **Preview**. Should be used with caution in an isolated development environment.
- **Stable Release**. Is considered stable and can be used in a production application.

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