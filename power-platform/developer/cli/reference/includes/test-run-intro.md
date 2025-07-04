### Example

The following example runs the test plan for a canvas application defined within the `testplan.te.yaml` in the environment with ID `00aa00aa-bb11-cc22-dd33-44ee44ee44ee` that exists in the tenant with ID `aaaabbbb-0000-cccc-1111-dddd2222eeee`

```powershell
pac test run `
   -p "canvas" `
   -test "testplan.te.yaml" `
   -t aaaabbbb-0000-cccc-1111-dddd2222eeee `
   -env 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```
