### Remarks

You be connected to an environment using the [pac auth](../auth.md) command to use `pac solution import`.

#### convert-to-managed

The `convert-to-managed` parameter doesn't take an unmanaged solution and import it as managed. This parameter allows a managed solution that is being imported into an environment convert unmanaged components to managed. 

If this flag isn't explicitly set, the solution system will fail the import request because managed layers can't go on top of unmanaged base components. This switch allows the solution import to succeed and the net result is that the inbound managed solution will be the base layer for each of these components – the components in the destination environment are converted from being an unmanaged component to being a managed component.
