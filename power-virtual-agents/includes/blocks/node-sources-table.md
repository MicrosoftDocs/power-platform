| Name | Source | Description | Number of Inputs | Authentication |
| --- | --- | --- | --- | --- |
| Bing Search | External | Searches the query input on Bing; returning results only from provided websites | 4 public URLs (for example, _microsoft.com_) | None |
| Bing Custom Search | External | Query input filtered based on a website configuration external to Microsoft Copilot Studio | Each search ID can use more than 4 URLs (Bing Custom Search also provides other functionality) but you can only connect to one search ID | None |
| Azure OpenAI on your data | Internal |  | Defined by your Azure OpenAI Service connection | Bot user's Microsoft Entra ID authentication |
| Documents | Internal | Searches documents uploaded to Dataverse, returning results from the document contents | Limited by Dataverse file storage allocation | None |
| SharePoint | Internal | Connects to a SharePoint URL, uses GraphSearch to return results | 4 URLs | Bot user's Microsoft Entra ID authentication |
| OneDrive for Business | Internal | Connects to a OneDrive for Business URL, uses GraphSearch to return results | 4 URLs | Bot user's Microsoft Entra ID authentication |
| Custom data | Internal | Uses a JSON code block to define the URLs and content to use | One variable, populated with the JSON results to be summarized | Dependent on source |


Bot user authentication for information sources means that when a specific user asks a question of the bot, the bot will only surface content that that specific user can access.