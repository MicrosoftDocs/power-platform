---
title: "Microsoft Dataverse language collations | MicrosoftDocs"
description: "Understand the Microsoft Dataverse language collations"
keywords: ""
ms.date: 06/30/2020
ms.service: powerapps
ms.custom: 
ms.topic: article
author: "NHelgren"
ms.author: nhelgren
manager: kvivek
ms.reviewer: matp
search.audienceType: 
  - maker
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Microsoft Dataverse language collations

When a Dataverse environment is created, admins are asked to select which default language they would like to use. This sets the dictionary, time and date
format, number format, and indexing properties for the environment.

Language selections for Dataverse also include collation settings that are applied to the SQL database, which stores entities and relational data. These collation settings affect things such as recognized characters, sorting, quick find, and filtering. The collations applied to Dataverse environments are chosen based on the default language selected at the time of environment creation and aren't user configurable. After a collation is in place, it can't be changed.

Collations contain the following case-sensitivity and accent-sensitivity options that can vary from language to language.

|Case and accent option  |Collation  |Description  |
|---------|---------|---------|
|Case insensitive     | _CI        | All languages have *case insensitive* enabled, which means that "Cafe" and "cafe" are considered the same word.        |
|Accent sensitive     | _AS        |  Some languages are *accent sensitive*, which means that "cafe" and "café" are treated as different words.       |
|Accent insensitive     | _AI        | Some languages are *accent insensitive*, which means that "cafe" and "café" are treated as the same word.        |


## Language details

A language includes the following information: 

- **LCID**: This is an identification number applied to languages in the Microsoft .NET framework to easily identify which language is being used. For example, 1033 is US English.

- **Language**: The actual language. In some cases, names, country, and character dataset information have been added for disambiguation.

- **Collation**: The language collation uses the case-sensitivity and accent-sensitivity options associated with the language (_CI, _AS, _AI) described earlier. 

## Language and associated collation used with Dataverse

| **LCID and language**                       | **Collation** |
|--------------------------------------------------------|---------------|
| 1025 Arabic                                            | \_CI_AI       |
| 1026 Bulgarian - Cyrillic dataset                      | \_CI_AI       |
| 1027 Catalan (Spain)                                   | \_CI_AI       |
| 1028 Traditional Chinese Taiwan - Stroke 90 dataset    | \_CI_AI       |
| 1029 Czech                                             | \_CI_AI       |
| 1030 Danish Norwegian                                  | \_CI_AI       |
| 1031 German Standard (Germany)                         | \_CI_AI       |
| 1032 Greek                                             | \_CI_AI       |
| 1033 English (United States)                           | \_CI_AI       |
| 1035 Finnish Swedish (Finland)                         | \_CI_AS       |
| 1036 French (France)                                   | \_CI_AI       |
| 1037 Hebrew                                            | \_CI_AI       |
| 1038 Hungarian                                         | \_CI_AI       |
| 1040 Italian (Italy)                                   | \_CI_AI       |
| 1041 Japanese - Stoke 90 dataset                       | \_CI_AI       |
| 1042 Korean                                            | \_CI_AI       |
| 1043 Dutch (Netherlands)                               | \_CI_AI       |
| 1044 Danish Norwegian - Bokmaal                        | \_CI_AI       |
| 1045 Polish                                            | \_CI_AI       |
| 1046 Brazilian Portuguese                              | \_CI_AI       |
| 1048 Romanian                                          | \_CI_AS       |
| 1049 Russian (Russia) - Cyrillic dataset               | \_CI_AI       |
| 1050 Croatian                                          | \_CI_AS       |
| 1051 Slovak                                            | \_CI_AS       |
| 1053 Finnish Swedish (Sweden)                          | \_CI_AS       |
| 1054 Thai                                              | \_CI_AS       |
| 1055 Turkish                                           | \_CI_AI       |
| 1057 Indonesian                                        | \_CI_AS       |
| 1058 Ukrainian                                         | \_CI_AS       |
| 1060 Slovenian                                         | \_CI_AS       |
| 1061 Estonian                                          | \_CI_AS       |
| 1062 Latvian                                           | \_CI_AS       |
| 1063 Lithuanian                                        | \_CI_AS       |
| 1066 Vietnamese                                        | \_CI_AS       |
| 1069 Basque (Spain)                                    | \_CI_AS       |
| 1081 Hindi - Latin character dataset                   | \_CI_AS       |
| 1086 Malay                                             | \_CI_AS       |
| 1087 Kazakh                                            | \_CI_AS       |
| 1110 Galician (Spain)                                  | \_CI_AS       |
| 2052 Simplified Chinese (China) - Stroke 90 dataset    | \_CI_AI       |
| 2055 German (Switzerland)                              | \_CI_AS       |
| 2064 Italian (Switzerland)                             | \_CI_AS       |
| 2070 Portuguese (Portugal)                             | \_CI_AI       |
| 2074 Serbian - Latin character set                     | \_CI_AS       |
| 3076 Traditional Chinese Hong Kong - Stroke 90 dataset | \_CI_AI       |
| 3079 German (Austria)                                  | \_CI_AS       |
| 3081 English (Australia)                               | \_CI_AS       |
| 3081 English (UK)                                      | \_CI_AS       |
| 3082 Modern Spanish (Spain)                            | \_CI_AI       |
| 3084 French (Canada)                                   | \_CI_AI       |
| 3098 Serbian - Cyrillic dataset                        | \_CI_AI       |
| 4108 French (Switzerland)                              | \_CI_AI       |

### See also

[Environments overview](environments-overview.md)
