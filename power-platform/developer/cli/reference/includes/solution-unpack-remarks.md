### `solution unpack` remarks

By default, `pac solution unpack` extracts solution components from a `.zip` file into the **XML format**, creating an `Other\Solution.xml` hierarchy.

> [!IMPORTANT]
> YAML source control format support requires **Microsoft.PowerApps.CLI version 2.4.1 or later**. Download from [NuGet](https://www.nuget.org/packages/Microsoft.PowerApps.CLI/2.4.1) or update with `pac install latest`.

When you work with solutions managed through native [Dataverse Git integration](../../../../alm/git-integration/overview.md) or extracted by using `pac solution clone`, the resulting folder uses the **YAML source control format** instead:

```
<folder>/
├── solutions/
│   └── <SolutionUniqueName>/
│       ├── solution.yml
│       ├── solutioncomponents.yml
│       ├── rootcomponents.yml
│       └── missingdependencies.yml
├── publishers/
│   └── <PublisherUniqueName>/
│       └── publisher.yml
└── [component folders — entities/, workflows/, canvasapps/, ...]
```

To repack a folder in this YAML layout, use `pac solution pack --folder <rootFolder>`. The presence of the `solutions/` subdirectory automatically signals the YAML format.

> [!IMPORTANT]
> If you list a component in `rootcomponents.yml` but don't include its source files in the folder (for example, a canvas app `.msapp` file under `canvasapps/<name>/`), the pack operation still succeeds but omits that component from the output `.zip`. To ensure all component files are present, re-export and unpack the full solution from Dataverse.

For more information about the YAML folder structure and component support, see [SolutionPackager tool — Source control file formats](../../../../alm/solution-packager-tool.md#source-control-file-formats).