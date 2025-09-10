---
title: Virtual Network troubleshooting
description: Learn how to troubleshoot common scenarios for Virtual Network in PowerPlatform.
author: faix
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/09/2025
ms.subservice: admin
ms.author: osfaixat
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
---

# Virtual Network troubleshooting

This article provides guidance on troubleshooting common scenarios for Virtual Network in Power Platform. We have released a set of script that can help you identify and resolve issues related to Virtual Network configurations.

## Diagnostics PowerShell Module

The Diagnostics PowerShell Module is a tool designed to help you diagnose and troubleshoot issues related to Virtual Network configurations in Power Platform. The module can be used to check the connectivity between your Power Platform environment and your Virtual Network, as well as to identify any misconfigurations that may be causing issues. It is available from the Powershell Gallery as well as from our GitHub repository: [PowerPlatform-EnterprisePolicies](https://github.com/microsoft/PowerPlatform-EnterprisePolicies)

### Installing the module

To install the Diagnostics PowerShell Module, you can use the following command in PowerShell:

```powershell
Install-Module -Name Microsoft.PowerPlatform.EnterprisePolicies
```

### Running the functions included in the module

Once the module is installed, you can import it into your PowerShell session using the following command:

```powershell
Import-Module Microsoft.PowerPlatform.EnterprisePolicies
```

The module includes several functions that can be used to diagnose and troubleshoot issues related to Virtual Network configurations. Some of the key functions include:

- [Get-EnvironmentRegion](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/docs/en-US/Microsoft.PowerPlatform.EnterprisePolicies/Get-EnvironmentRegion.md): Retrieves the region of the specified Power Platform environment.
- [Get-EnvironmentUsage](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/docs/en-US/Microsoft.PowerPlatform.EnterprisePolicies/Get-EnvironmentUsage.md): Provides information about the usage of the specified Power Platform environment.
- [Test-DnsResolution](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/docs/en-US/Microsoft.PowerPlatform.EnterprisePolicies/Test-DnsResolution.md): Tests the DNS resolution for the specified domain name.
- [Test-NetworkConnectivity](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/docs/en-US/Microsoft.PowerPlatform.EnterprisePolicies/Test-NetworkConnectivity.md): Tests the network connectivity between the Power Platform environment and the specified Virtual Network.

### Issues with the diagnostic module

If you encounter issues while running the diagnostic module, please report them through the Github repository where the module is hosted. The repository is available at: [PowerPlatform-EnterprisePolicies](https://github.com/microsoft/PowerPlatform-EnterprisePolicies).

To report an issue go to the Issues section of the repository and create a [new issue](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/issues/new). Please provide detailed information about the problem you are facing, including any error messages or logs that may help in diagnosing the issue. The more information you provide, the easier it will be for us to assist you. Please do not include any sensitive information in your report.

## How to troubleshoot common scenarios

### Scenario 1: Hostname not found

If you are experiencing issues with hostname resolution, you can use the `Test-DnsResolution` function from the Diagnostics PowerShell Module to check if the hostname is being resolved correctly. You can run the following command:

```powershell
Test-DnsResolution -EnvironmentId "00000000-0000-0000-0000-000000000000" -HostName "microsoft.com"
```

This command will test the DNS resolution for the specified hostname in the context of the specified Power Platform environment. The request will initiate from the subnet that you have delegated and will attempt to resolve the hostname using the DNS server that is configured for your Virtual Network. If the hostname is not being resolved correctly, you may need to check your DNS settings and ensure that the hostname is correctly configured.

> [!IMPORTANT]
> If you notice that your DNS setup is incorrect and need to update the DNS server settings for your Virtual Network, this operation is not supported. In order to change the DNS server settings, you will need to remove the Enterprise Policy from each of your environments associated to that policy. After removing the policy, you can update the DNS server settings for your Virtual Network. Once the DNS server settings have been updated, you can reapply the Enterprise Policy to your environments.

### Scenario 2: Unable to connect to the resource

If you are experiencing issues with connectivity to a resource, you can use the `Test-NetworkConnectivity` function from the Diagnostics PowerShell Module to check if there is connectivity. You can run the following command:

```powershell
Test-NetworkConnectivity -EnvironmentId "00000000-0000-0000-0000-000000000000" -Destination "unknowndb.database.windows.net" -Port 1433
```

This command attempts to establish a TCP connection to the specified destination and port in the context of the specified Power Platform environment. The request will initiate from the subnet that you have delegated and will attempt to connect to the specified destination using the network configuration that is set up for your Virtual Network. If there is no connectivity, you may need to check your network settings and ensure that the destination is reachable from your Virtual Network. If the connection is successful, it indicates that there is network connectivity between the Power Platform environment and the specified resource. If the connection fails, it may indicate that there is a network issue or that the resource is not reachable from the Virtual Network.

> [!NOTE]
> This command only tests if a TCP connection can be established to the specified destination and port. It does not test if the resource is actually available or if there are any application-level issues that may be preventing access to the resource.
> Furthermore, some firewalls may be allowing TCP connections to be established but blocking actual traffic to the resource. Therefore, even if the command indicates that there is network connectivity, it does not guarantee that the resource is fully accessible.

### Scenario 3: Everything is correctly configured but it still doesn't work

If you have verified that everything is correctly configured but you are still experiencing issues, you can use the `Get-EnvironmentRegion` function from the Diagnostics PowerShell Module to check if the region of your Power Platform environment is the same as the regions where you have been configuring your Virtual Network. You can run the following command:

```powershell
Get-EnvironmentRegion -EnvironmentId "00000000-0000-0000-0000-000000000000"
```

Your environment belongs to a specific PowerPlatform region. However, a PowerPlatform region can span multiple Azure regions. You need to ensure that your Virtual Network is configured in both of the Azure regions that correspond to your PowerPlatform region. Your environment can be located in either of the two Azure regions, and it can also automatically failover between them. Therefore, to ensure high availability and connectivity, you should configure your Virtual Network in both Azure regions associated with your PowerPlatform region. You can find the mapping of the PowerPlatform regions to Azure regions that are support for the Virtual Network functionality at [Power Platform regions](./vnet-support-overview.md#supported-regions).