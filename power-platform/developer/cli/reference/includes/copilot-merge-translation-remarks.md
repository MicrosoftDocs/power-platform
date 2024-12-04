### merge-translation errors

Based on the example above, if one error exists in the file used to update the copilot, the output looks like:

```Text
Connected as user@contoso.org

Loading language German into bot 'ms_store_newTestCopilot' (New Test Copilot) from file 'C:\Users\user\ms_store_newTestCopilot'. 1 key(s) were missing, 1 value(s) were not used. Use the --verbose switch to get more details.

Updated 16 out of 16 components.
```

The `--verbose` flag adds details about the error:

```Text
Connected as user@contoso.org

Missing translation key: 'dialog(ms_store_newTestCopilot.topic.Lesson2)'.'trigger(main)'.'action(LbWwpD)'.Entity.Definition.'closedListItem(Redmond)'.DisplayName.

Unused translation: 'dialog(ms_store_newTestCopilot.topic.Lesson2)'.'trigger(main)'.'action(LbWwpD)'.Entity.Definition.'closedListItem(Redmont)'.DisplayName, value: Redmond

Loading language German into bot 'ms_store_newTestCopilot' (New Test Copilot) from file 'C:\Users\user\ms_store_newTestCopilot'. 1 key(s) were missing, 1 value(s) were not used. Use the --verbose switch to get more details.

Updated 16 out of 16 components.
```
