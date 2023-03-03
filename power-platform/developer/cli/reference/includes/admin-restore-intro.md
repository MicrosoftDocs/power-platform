### Examples

The following examples show the use of the `pac admin restore` command:

- [Restore the latest backup](#restore-the-latest-backup)
- [Restore a backup based on a timestamp](#restore-a-backup-based-on-a-timestamp)

#### Restore the latest backup

This example restores the latest backup from the source environment with ID `00000000-0000-0000-0000-000000000000` to the environment that's currently selected in the currently active auth profile.

```powershell
pac admin restore --selected-backup latest --source-env 00000000-0000-0000-0000-000000000000
```

#### Restore a backup based on a timestamp

This example restores the backup that has been created on `12/01/2022 09:00` from the source environment with ID `00000000-0000-0000-0000-000000000000` to the environment that's currently selected in the currently active auth profile.

```powershell
pac admin restore --selected-backup '12/01/2022 09:00' --source-env 00000000-0000-0000-0000-000000000000
```
