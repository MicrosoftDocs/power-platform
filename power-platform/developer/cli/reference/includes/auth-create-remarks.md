### Remarks

For the `cloud` parameter, the values to use map to these other common acronyms or names:

- GCC = `UsGov`
- GCC High = `UsGovHigh`
- DoD = `UsGovDod`

#### WSL2 Authentication Issues

When using Windows Subsystem for Linux version 2 (WSL2), you might have authentication issues such as `Error: Unable to open a web page using xdg-open, gnome-open, kfmclient or wslview tools` when there's no default browser set in your WSL2 environment. 

To work around this issue, you can use device code authentication by adding the `--deviceCode` flag to your `auth create` command: `pac auth create --environment {env-id} --deviceCode`. You'll need to enter a code in a browser outside of WSL2 to complete the authentication process.