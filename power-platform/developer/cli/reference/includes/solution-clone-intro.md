### Examples

The following examples show the use of the `pac solution clone` command.

- [Basic clone](#basic-clone)
- [Clone with general and auto numbering settings included](#clone-with-general-and-auto-numbering-settings-included)

#### Basic clone

This example clones the solution `sampleSolution` to the current directory.

```powershell
pac solution clone --name sampleSolution
```

#### Clone with general and auto numbering settings included

This example clones the solution `sampleSolution` to the current directory with the general and auto numbering settings included.

```powershell
pac solution clone --name sampleSolution --include general,autonumbering
```
