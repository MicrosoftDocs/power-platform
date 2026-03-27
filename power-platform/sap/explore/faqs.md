---
title: Integrating SAP with Power Platform FAQs
description: Get answers to the most frequently asked questions about SAP integration with Microsoft Power Platform.
author: haowusky
ms.author: hawu1
contributors:
- EllenWehrle
- tverhasselt
- galitskyd
- microsoft-dustin
- Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: faq
ms.date: 03/17/2026
ms.custom: bap-template
ms.service: power-platform
---

# Frequently asked questions about SAP procurement integration with Power Platform

This article provides answers to some of the most frequently asked questions (FAQs) about SAP integration with Microsoft Power Platform.

## Versions and licensing

### What versions of SAP does the SAP ERP connector support?

The [SAP ERP connector](/connectors/saperp/) supports all SAP versions from R/3 (early 1990s) forward, including SAP ECC and SAP S4/HANA.

### What licensing do I need to integrate SAP with Power Platform?

At a minimum, you need the following for each user:

- A Power Apps Premium license
- An SAP indirect named user license

If you already have SAP direct named user licenses, you can use these licenses with Power Apps. It's worth noting, however, that SAP indirect named user licenses cost less than direct named user licenses.

### Does this integration work with other SAP core products like BW, SRM, and CRM?

Yes, Power Platform's SAP ERP connector works with any SAP product that runs on the NetWeaver stack.

### How can I connect to SAP's other products that came through acquisitions?

For products such as Ariba, Concur, and any other SAP product that doesn't run on the NetWeaver stack, you can use our custom REST and SOAP connectors.

### If I integrate Power Platform with SAP ECC and then upgrade to S/4HANA, will my integrations break?

No, hundreds of customers upgrade from SAP ECC to S/4HANA without any problems. Some of the core data models change in S/4HANA (customer, vendor, financial posting), but the prebuilt Power Automate flows account for these data model changes. Additionally, SAP ensures their published APIs are carried over to new versions.

## Data and integration

### How does Power Platform access SAP data?

The SAP ERP connector uses the message server to invoke APIs that create, read, and update SAP data. This traffic typically flows over port 33XX for single application servers or port 39XX for load-balanced connections, where XX is the system number of the SAP instance.

### Can Power Platform consume OData services in SAP?

Yes. To learn more, see [Get started with the SAP OData connector](../connect/sap-odata-connector.md). You can also create a custom connector in Power Automate to consume OData services.

### Can Power Platform access views in S/4HANA?

Yes, the SAP ERP connector can read Core Data Services views by using the action, _Read SAP Table with Parsing_.

### Can Power Platform access custom SAP tables (Z-tables)?

Yes, the SAP ERP connector can read custom tables by using the action, _Read SAP Table with Parsing_.

### What if SAP doesn't provide an API for a data object?

In this case, consider these options:

- [Intermediate Document (IDoc)](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/7b24a64d9d0941bda1afa753263d9e39/3854b753128eb44ce10000000a174cb4.html) – Power Automate provides a generic API that can synchronously invoke an IDoc for any object type.
- [Batch input](https://help.sap.com/doc/saphelp_snc70/7.0/en-US/69/c250274ba111d189750000e8322d00/content.htm?no_cache=true#:~:text=Batch%20input%20is%20one%20of%20the%20primary%20ways,legacy%20system%20into%20a%20newly%20installed%20SAP%20system.) – Power Automate has a generic API that can synchronously process a batch input recording.
- [Legacy System Migration Workbench (LSMW)](https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/4d/afeb6ad8f66d57e10000000a42189e/content.htm?no_cache=true) – Power Automate can create a file that you can drop on the SAP application server and process within transaction LSMW.
- [Custom Function Module](https://help.sap.com/doc/saphelp_nw75/7.5.5/en-US/c8/19764143b111d1896f0000e8322d00/content.htm?no_cache=true) – You can create a custom remote-enabled function module in SAP and call it by using a Power Automate cloud flow.

### Will Power Platform affect the performance of our SAP system?

The SAP ERP connector runs on SAP's API layer, which typically provides better system performance than running the same activity in the SAP GUI. As more users transition off the SAP GUI and to an external user interface like a canvas app, CPU consumption on the SAP servers drops significantly.

### Are there any performance bottlenecks in the SAP ERP connector?

No, typically the bottleneck is in the SAP system itself. You can configure the number of concurrent API threads to match the session limits on your SAP servers. You can also arrange [clusters](/data-integration/gateway/service-gateway-install#add-another-gateway-to-create-a-cluster) for the on-premises data gateway.

### Can Power Automate flows be used by other applications like Dynamics CRM?

Yes, your own custom applications or any software capable of REST integration can trigger the Power Automate flows that integrate with SAP.

### Will the SAP ERP connector work with non-UNICODE systems?

Yes.

### How are errors in SAP handled?

You display errors to users in a canvas app by using Power Apps in a similar fashion to SAP's red text with the details of the error that occurred. Canvas apps users can correct errors if they're data-related and resubmit their work to SAP.

### How does Power Automate handle file attachments?

Power Automate can attach files to objects in SAP by using [Generic Object Services (GOS)](https://help.sap.com/doc/saphelp_scm700_ehp01/7.0.1/en-US/1e/31a40415b711d4a39200a0c943858e/frameset.htm) and/or [ArchiveLink](https://help.sap.com/docs/ABAP_PLATFORM_NEW/345ce26100fc4ba49fd3dc9b424495c4/4ce65a717e173ec6e10000000a42189b.html?q=ArchiveLink), depending on your requirements.

## Security

### How does authentication work with SAP?

The Power Platform supports multiple authentication methods for SAP:

1. Username and password - the app prompts users for their SAP username and password on the canvas app screen in Power Apps, and sends these credentials to SAP.
1. [Set up Microsoft Entra ID with Kerberos for SSO](../connect/entra-id-kerberos.md).
1. [Set up Microsoft Entra ID with certificates for SSO](../connect/entra-id-certs.md).
1. [Set up Microsoft Entra ID, Azure API Management, and SAP for SSO from SAP OData connector](../connect/entra-id-apim-oauth.md).
1. [Set up Microsoft Entra ID using SuccessFactors](../connect/entra-id-using-successfactors.md).

### How do we make sure Power Apps users can't do things they can't do in SAP?

SAP's published APIs perform the same security checks that SAP GUI does. Also, you can configure Power Automate flows to query user authorization objects so apps, fields, and buttons are conditionally hidden or revealed to match the user experience in SAP.

### How do we ensure traffic between Power Platform and SAP is encrypted?

Use SAP's [Secure Network Communication (SNC)](https://help.sap.com/doc/saphelp_nw74/7.4.16/en-us/e6/56f466e99a11d1a5b00000e835363f/content.htm?no_cache=true). You can enable this feature through a connection setting when you configure authentication.

## Customization

### How does Power Platform handle custom fields in SAP?

The answer depends on where the custom fields reside in SAP:

- Appended to SAP-Standard Table - Use Business Application Programming Interface (BAPI) Extension Structures to populate the fields in Power Automate flows.
- Custom SAP Table - To update these tables, you need to remote-enable the function modules so the SAP connector can invoke them.

### How easy is it to add custom fields to canvas apps?

 You can easily insert and copy/paste fields in canvas apps by using the WYSIWYG (What You See Is What You Get) editor.

### Can Power Platform call custom function modules?

Yes, if you remote-enable a function module, the SAP connector can invoke it. However, SAP doesn't respond to a support ticket if your custom function module isn't working correctly, since it's your own code.

### How can Power Platform handle custom processes that you built in SAP because you had no other option?

You can read your custom database tables by using the _Read SAP Table with Parsing_ action for all read operations. For _create_ and _update_ operations, you need to remote-enable your custom function modules that maintain this data. After you remote-enable the function modules, the SAP ERP connector can call them.

## Implementation and support

### Where can I get started?

Review the documentation: [Power Platform and SAP](../index.yml).

### Where can I get a demo SAP environment to test the SAP integration solutions?

You have a couple of options:

- [SAP Cloud Appliance Library](https://aka.ms/sap/cal). Create your own SAP demo instances on Azure by following the instructions in [Deploy with SAP Cloud Appliance Library](/azure/sap/sap-on-azure-overview).
- [SandboxSAP](https://idesremote.com/). Be sure to select the add-on for RFCs/BAPIs to allow Power Automate to connect to their instances. Microsoft isn't affiliated with IDES Remote. Use these services at your own risk.

### Where do I turn if I get stuck with SAP integration with Power Platform?

Nearly 100% of the issues encountered are due to a step or prerequisite being overlooked in the [Power Platform and SAP](../index.yml) documentation. If you're still having problems, you have a couple of options:

- Submit a question on our forum at: [Power Platform Community](https://powerusers.microsoft.com/)
- Send an email to: <sap_ecc_powerapps@service.microsoft.com>.

### Do I need to install anything on our SAP servers to get Power Platform to work with SAP?

No.

### Do I need to install anything on our users' PCs for SAP integration with Power Platform?

No. All canvas apps are accessed through a web browser.

### Is there anything I need to provision to set up SAP integration with Power Platform?

Yes. You need to provision a Windows virtual machine (VM) with at least 8 GB of RAM for the on-premises data gateway. This gateway acts as a proxy server that listens for requests from your Power Platform tenant and relays them to SAP. One Windows machine is sufficient for testing. However, set up a cluster of Windows VMs for deployment to production to avoid single points of failure.

### How quickly can a canvas app on SAP be up and running?

The prebuilt canvas app on SAP can transact against your SAP system immediately. However, you'll likely want to modify these canvas app templates by adding your custom fields or any SAP-standard fields that aren't included in our solution templates. Typically, within a few weeks you can have something ready for your business users to test.

### Can I build mobile canvas apps on top of SAP?

You can use Power Apps to build canvas apps for mobile devices. You can also build native canvas apps on Power Platform.

### Can Fiori apps coexist with Power Apps?

You can embed Fiori apps in canvas app menus. You can also embed canvas apps in the Fiori launchpad.
