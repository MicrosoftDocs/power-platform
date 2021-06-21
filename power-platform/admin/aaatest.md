---
title: Search resource availability and create bookings for requirement groups in Universal Resource Scheduling in Dynamics 365 Customer Service | Microsoft Docs
description: See how you can effectively search resource availability and create bookings for requirement groups in Universal Resource Scheduling in Customer Service Hub.
ms.date: 06/21/2021
ms.topic: article
author: lalexms
ms.author: laalexan
manager: shujoshi
search.audienceType: 
  - admin
  - customizer
  - enduser
search.app: 
  - D365CE
  - D365CS
ms.custom: 
  - dyn365-customerservice
---

# Search resource availability and create bookings for requirement groups

Use the Search Resource Availability for Requirement Group API and the Create Requirement Group Bookings API to book the resources that meet the needs you identify in your requirement groups. 

- The [Search Resource Availability for Requirement Group](#bkmk_sra_rg) API returns available time slots for resources when you search by using requirement groups.
- The [Create Requirement Group Bookings](#bkmk_crgb) API uses the available time slots for resources to generate booking records for your requirement groups.

You pass the details of a requirement group in your API calls and retrieve a list of available resources and their open time slots. This is helpful for self-scheduling scenarios, where a user wants to view the availability of resources, or for portal scheduling scenarios where a customer wants to view resource availability from a website or app.

### Prerequisites

- Dynamics 365 version 9.0 or above with Universal Resource Scheduling version 3.12.x.x

<a name="bkmk_sra_rg"></a>

## Search Resource Availability for Requirement Group API

Use the following input and output parameters for the Search Resource Availability for Requirement Group (**msdyn_SearchResourceAvailabilityForRequirementGroup**) API.

### Parameters

| Name  | Type | Required  | Description  |
|-----------------|---|---|---|
|Version | String | Yes |The version number of the API. The version number identifies the version of the API that should be invoked. The version number is a semantic version number of the format major.minor.patch. The request does not have to contain the complete version number.|
|RequirementGroup | | Yes | An entity reference to the requirement group entity.|
|RequirementSpecification |Integer| No | If left null, respects the targeting requirement group duration by default.|
|Settings |Entity<InputSettings> |No | Sets the settings for the request.|

### Inputsettings

| Name  | Type | Required  | Description  |
|-------|---|---|---|
| ConsiderSlotsWithLessThanRequiredDuration | Boolean | No | Specifies if a time slot with less than the required remaining duration should be considered when computing potential time slots. It is false`by default. |
| ConsiderSlotsWithOverlappingBooking | Boolean | No | Specifies if time slots with overlapping bookings should be considered when computing potential time slots. It is false` by default. |
| ConsiderSlotsWithProposedBooking | Boolean | No | Specifies if time slots with proposed bookings should be considered when computing potential time slots. It is false`by default. |
| MaxResourceTravelRadius | Distance | No | Specifies the maximum travel radius for resources when computing available time slots. |
| SortOrder | Integer | No | Specifies the requirement group order for the response. |
| PageSize |Integer | No | Numbers of item returned in a page. It is 20 by default. |
| PagingCookie | String | No | Paging cookie retrieved from previous searching result.|
| OrganizationUnits |List&#60;Guid&#62; | No | A collection of organization unit IDs. A qualified resource must be a member of one of the specified organization units. |
| RequiredResources |List&#60;Guid&#62; | No | Only the time slots of the passed list of resources will show in the resulted time slots. |
