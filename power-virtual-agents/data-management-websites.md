---
title: "Data Management Websites"
description: "Data management Manage website"
ms.reviewer: peterswimm
ms.date: 10/03/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: power-virtual-agents
ms.service: virtual-agent
---


# Managing Websites
### URL considerations

The URL you provide represents the scope of content that is used for generating responses. 

There are some requirements on the type and structure of the URL you use:

The URL can have up to two levels of depth (or "subpaths", indicated by forward slashes (/)). Your URL can have a trailing forward slash, which isn't included in the limit of two slashes: 
- The URLs *<span>www</span>.contoso.com*, *<span>www</span>.fabrikam.com/engines/rotary*, or *<span>www</span>.fabrikam.com/engines/rotary/* would be valid. 
    The URL *<span>www</span>.fabrikam.com/engines/rotary/dual-shaft* wouldn't.

If the URL you specify redirects to another top-level site, that content isn't included in results:
- If, when visited in a browser, *<span>www</span>.fabrikam.com* redirected to *<span>www</span>.contoso.fabrikam.com*, then the bot wouldn't generate responses from content on either of those URLs.  
  

The capability won't generate responses from a URL that points to a website that requires authentication or that isn't indexed by Bing:
- Wikis, SharePoint sites, and other types of websites that require authentication, for example *<span>fabrikam</span>.visualstudio.com/project/_wiki* or *<span>fabrikam</span>.sharepoint.com*, can't be used.  
  

You should also be aware of the following characteristics of the capability:
  
The bot generates responses from any publicly viewable content under the URL you specify, including subdomains under a top-level domain:
- If you were to use the URL *<span>www</span>.fabrikam.com/engines/rotary*, the content on *<span>www</span>.fabrikam.com/engines/rotary/dual-shaft* would also be used by the bot to generate responses.  
Content from *<span>www</span>.fabrikam.com/tools* wouldn't be used.  

- If you were to use *<span>www</span>.fabrikam.com*, the bot wouldn't generate responses from content on *<span>news</spam>.fabrikam.com*, as *news.* is a subdomain under the top-level domain *<span>fabrikam</span>.com*.  
 
- If you were to use *<span>fabrikam</span>.com*, then content from *<span>www</span>.fabrikam.com* and *<span>news</span>.fabrikam.com* would be used, as they sit "under" the top-level domain *<span>fabrikam</span>.com*.  

The bot may generate nonsensical, irrelevant, or inappropriate answers if you use a forum or social network site as your URL:  
- Community content on social networks can often increase the risk of more answers being rejected due to inappropriate, offensive, and malicious content that is more common on those sites.  
For more information, see the [AI response generation training, model, and usage notes](#ai-response-generation-training-model-and-usage-notes) for more information on how the AI is trained to avoid generating malicious and offensive responses.

The URL you specify should host the content you want the bot to generate answers from; it shouldn't be the URL for a search engine:
-  Using *<span>bing</span>.com* or other search engines in the URL won't provide useful responses.


