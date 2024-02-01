### Example

To merge files containing localized content for one or more copilots.

```PowerShell
pac copilot merge-translation --environment 2e250e7a-5607-4fea-aa4e-1aeb7bf79118 --file ms_store_newTestCopilot.de-DE.json --solution SolutionName
```

Returns output like the following (for updating the language German):

```Text
Connected as user@contoso.org

Loading language German into bot 'ms_store_newTestCopilot' (New Test Copilot) from file 'C:\Users\user\ms_store_newTestCopilot'. 0 key(s) were missing, 0 value(s) were not used. Use the --verbose switch to get more details.

Updated 16 out of 16 components.
```

If one error exist in the file used to update the copilot the output looks like:

```Text
Connected as user@contoso.org

Loading language German into bot 'ms_store_newTestCopilot' (New Test Copilot) from file 'C:\Users\user\ms_store_newTestCopilot'. 1 key(s) were missing, 1 value(s) were not used. Use the --verbose switch to get more details.

Updated 16 out of 16 components.
```

Adding the `--verbose` flag adds details about the error:

```Text
Connected as user@contoso.org

Missing translation key: 'dialog(ms_store_newTestCopilot.topic.Lesson2)'.'trigger(main)'.'action(LbWwpD)'.Entity.Definition.'closedListItem(Redmond)'.DisplayName.

Unused translation: 'dialog(ms_store_newTestCopilot.topic.Lesson2)'.'trigger(main)'.'action(LbWwpD)'.Entity.Definition.'closedListItem(Redmont)'.DisplayName, value: Redmond

Loading language German into bot 'ms_store_newTestCopilot' (New Test Copilot) from file 'C:\Users\user\ms_store_newTestCopilot'. 1 key(s) were missing, 1 value(s) were not used. Use the --verbose switch to get more details.

Updated 16 out of 16 components.
```
