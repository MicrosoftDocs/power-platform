### Remarks

`--patchversion` will only take value of the third part of the version tuple: `Major.Minor.Patch`.

For `--strategy` the available values have these meanings:

|Value  |Description  |
|---------|---------|
|`gittags`|Use Git tags to decide whether a particular component's patch version needs to be updated.|
|`filetracking`|Use a .csv file to decide whether a particular component's patch version needs to be updated.|
|`manifest`|Increments the patch version by 1 for all the components.|


