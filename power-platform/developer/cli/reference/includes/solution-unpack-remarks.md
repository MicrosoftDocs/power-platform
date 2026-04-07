### Remarks

`pac solution unpack` extracts solution components from a `.zip` file into the **XML format** by default, creating an `Other\Solution.xml` hierarchy.

When working with solutions managed via native [Dataverse Git integration](../../alm/git-integration/overview.md) or extracted via `pac solution clone`, the resulting folder uses the **YAML source control format** instead:

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

To repack a folder in this YAML layout, use `pac solution pack --folder <rootFolder>` — the YAML format is detected automatically from the presence of the `solutions/` subdirectory.

> [!IMPORTANT]
> If a component is listed in `rootcomponents.yml` but its source files aren't present in the folder (for example, a canvas app `.msapp` file under `canvasapps/<name>/`), the pack operation still succeeds but that component is omitted from the output `.zip`. Re-export and unpack the full solution from Dataverse to ensure all component files are present.

For more information about the YAML folder structure and component support, see [SolutionPackager tool — Source control file formats](../../alm/solution-packager-tool.md#source-control-file-formats).