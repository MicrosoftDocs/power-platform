# Handling of locally relevant formats

Bots built on Power Virtual Agents are being used in more and more markets around the world. With that, comes the need for the bots to be usable for local scenarios and content. This includes being to handle and display locally relevant formats. 

Based on the end user's browser locale setting, the bot will understand and display content that is locally relevant to the user.

## Supported locales:

In addition to en-US, we initially support the following new locales:
* en-GB
* en-CA
* en-AU
* en-IN

## Supported entities:

We're updating the globalization support in phases and initially, we're adding support for localized handling and formats for the following entities:
* Date-Time
* Number
* Zip code
* Money
* Speed

This means that if the end user's browser locale setting is set to en-GB, the bot knows that **the date 2/3** should be understood as **March 2nd** whereas if the browser locale setting is en-US, the same date would be understood as **February 3rd**. 
