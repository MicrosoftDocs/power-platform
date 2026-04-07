### Remarks

`pac solution pack` supports two source folder layouts when reading component files: the **XML format** (legacy) and the **YAML source control format**.

The format is auto-detected based on the folder contents:

- If the folder contains a `solutions/` subdirectory with `*solution.yml` files → **YAML format** is used.
- If no `solutions/` subdirectory is found → **XML format** (legacy) is used, which requires `Other\Solution.xml` and `Other\Customizations.xml`.

**YAML format example:**

```powershell
pac solution pack --zipfile C:\output\MySolution.zip --folder C:\repos\myrepo
```

**Working with a multi-solution repository:**

When the folder contains more than one solution under `solutions/*/solution.yml`, use the SolutionPackager.exe directly with `/SolutionName`:

```
SolutionPackager.exe /action:Pack /zipfile:SolutionA.zip /folder:C:\repos\myrepo /SolutionName:SolutionA
```

> [!NOTE]
> The YAML source control format is the format written by native [Dataverse Git integration](../../alm/git-integration/overview.md) when you commit solutions from Power Apps. If you're manually packing a folder from a Git-integrated repository, use `pac solution pack` with the `--folder` pointing at the repository root.

For more information about the YAML folder structure and which components are supported, see [SolutionPackager tool — Source control file formats](../../alm/solution-packager-tool.md#source-control-file-formats).