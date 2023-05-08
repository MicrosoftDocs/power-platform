# Boost conversations with Search and summarize content

## Search and Summarize

You can add GPT Answers functionality to your bot by adding a "Search and summarize content" node in the flow of your topic.

1. Open the authoring canvas for your topic

1. Identify the point in your topic's flow where you want to use Search and summarize content.

1. Click on the '+' where you would like to add the Search and Summarize node.

1. Add a Search and Summarize content node.

(image: *plus with options menu; display S&S option*)

1. On the Search and summarize node, select Properties from the node menu and select Data source
 
1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](#information-sources).

Note here about the other options (Variable or PowerFX) - what is the integration?

(image: data sources menu)

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.
 
(image: save topic?)

Your bot will use the collected information in line with the topic flow to provide a response.

### Information Sources

This table summarizes knowledge resources GPT Answers can use to boost conversations.

| Name | Source | Description | Number of Inputs | Authentication |
| --- | --- | --- | --- | --- |
| Bing Search | External | Searches the query in put on Bing; returning results only from provided websites | 4 public urls (for example, microsoft.com) | None |
| [Bing Custom Search](https://www.customsearch.ai/) | External | Query input filtered based on a website configuration external to PVA | More than 4 urls (Bing Custom Search also provides other functionality) | None |
| Sharepoint | Internal | Connects to a SharePoint url, uses GraphSearch to return results | 4 urls | C2 Azure Active Directory authentication |
| OneDrive | Internal | Connects to a OneDrive url, uses GraphSearch to return results | 4 urls | C2 Azure Active Directory authentication |
| Other internal data | Internal | ... | ... | ... |
| Project Wednesday | Internal | Azure Open AI knowledge repository | ... | ... |
