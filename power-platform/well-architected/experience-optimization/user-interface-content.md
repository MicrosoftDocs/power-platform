---
title: Recommendations for writing user interface content
description: Learn how to write content for user interfaces to ensure consistent success with user experience optimization.
author: Denise-MSFT
ms.author: demora
ms.reviewer: robstand
ms.date: 03/29/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for writing content for user interfaces

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **Content must be easily understood and provide clear direction.** Use an approachable, consistent, and professional tone that facilitates task completion.** |
|---|---|

This guide describes the recommendations for crafting effective content tailored for user experiences. Content serves as the primary mode of communication in a user interface, holding more power in communicateing complex ideas compared to visual elements alone. Whether it's guiding users through a process or communicating essential system information, the words we choose profoundly impact how users interact with and perceive an application. 

## Key design strategies

### Make it scannable

When using a business application, people aren't interested in the features of the UI or being entertained by flowery language. They're focused on task completion. Help them by writing in short, scannable blocks. Divide text into shorter sentences and paragraphs. Avoid overly gushy language. Users often visit a UI with specific objectives in mind, and content should guide them seamlessly toward achieving those objectives.

Be concise. Content should be brief and to the point. Concise doesn't mean limited; it means efficient. Use as few words as possible without losing the meaning. When writing concisely, make sure every word on the screen has a job. Only provide the info needed in the moment, also keeping in mind that too much content is less likely to be read. Follow Mark Twain's advice: "Writing is easy. All you have to do is cross out the wrong words." 

Keep important info up front. Start with the most important piece of info—the value proposition. Then, if there's room, add a brief paragraph or two with info in order of importance. If you need to say more, use a 'Read more' link. Sometimes it's easier to write the body of the message first and then write the headline.

Use specific verbs whenever possible. Specific verbs are more meaningful to people than generic ones. Help your reader quickly understand available options or necessary actions by using specific words like get, update, choose, or change. You can avoid confusion and reduce ambiguity by eliminating words that have different meanings. 

### Keep it contextual and task-focused

Tell people what they need to know. The content should provides users with the essential information required to accomplish their tasks or make informed decisions within the UI. Users rely on content to guide their interactions and expect clear, relevant information that meets their needs. It should never cause confusion or frustration during their user journey.

Bite-sized chunks create a natural flow. Focus on the reader, the action taken, or what they can expect next. Don't include information that's irrelevant or distracts from the task at hand because it adds to frustration and cognitive load.

Put the benefit before the action or feature. This increases the reader's ability to quickly complete tasks by explaining the benefit first. What good thing will happen if they do the action? Explain the benefit before telling them to take an action, and avoid asking for an action before explaining why.

For task-level content, do not focus on boasting your company brand in obstructive ways (e.g., "The Microsoft Connector shuttle service will conveniently arrive at your campus location at 2:15 PM" vs "The shuttle will arrive at 2:15 PM").

### Speak in plain language

Use simple, clear language that is easily understood by the target audience, devoid of unnecessary jargon or technical terms. Users should be able to comprehend content effortlessly, reducing the likelihood of confusion or misinterpretation, ultimately improving engagement. Keeps reading levels no higher than tenth grade. Maintaining an appropriate reading level enhances accessibility and inclusivity, catering to a broader range of users.

Include sentences of 25 words or less. Sentences should be brief and succinct. Short sentences with sufficient information facilitate comprehension, making the content easier to read and understand. 

Avoid jargon and acronyms. Even most software engineers prefer simple, non-technical language. It's especially important to avoid jargon in error messages. It's also important to remember that many common phrases are colloquialisms and may not be meaningful to everyone.

Replace overly technical words with simpler ones. Using words like configure, activate, or invalid are unnecessarily technical. Keep it simple. Only use acronyms your readers are familiar with. Spell out acronyms on the first mention on each page and include the parenthetic reference. For example, call to action (CTA). If the spelled-out version of an acronym exceeds a character limit, consider writing around the phrase. 

Avoid double negatives. Double negatives increase cognitive load — they make people spend extra time decoding the message. Focus on direct, positive actions.

### Use a friendly, professional tone

Be polite, but not overly ingratiating. People expect to be given prompts and to act. Using 'please' throughout the UI is unnecessary and comes across as amateure. Use please and sorry sparingly, only when the task you're asking is onerous, is your mistake, or has serious consequences. However, it's never good practice to be rude, presumptuous, cocky, or cynical in UI content.

Write as if speaking directly to the reader. Second person often uses the pronoun 'you'. It supports a friendly, human tone and helps avoid passive voice by focusing on the reader. You should omit pronouns and accompanying auxiliary verbs, and start your sentence with a verb. Make a connection with the reader by using 'you' or 'your'.

Avoid using first-person possessive phrasing like 'My dashboard' while also writing in second person because it increases cognitive load. 

When it's the product or app speaking, use 'we' or your organization's name. This avoids confusion about who's doing the talking or who should act. For example, use 'We found these results', rather than 'I found these results'. The word 'we', which is a first person pronoun, can help create a more human experience with the UI. It can help demonstrate accountability for system or input errors to show people they're important every step of the way. However, avoid overusing it as it diverts attention from readers and what they need to do. To make your product more centered on the reader, consider only using 'we' for systems errors, status updates, and other system-related issues.

Use common contractions, such as it's, you're, that's, and don't, to create a friendly, informal tone. Never use your company's name in the possessive form, and avoid using it in a contraction. Avoid ambiguous or unpopular contractions such as there'd and what're. Avoid mixing contractions and spelled-out words in UI as it creates inconsistency and reduces trust. Using spelled-out words in place of common contractions introduces unnecessary formality.

### Maintain stylistic consistency

Use one word or phrase to refer to a specific action or thing across the experience every time. For example, if you call the process of securing a reservation 'booking' in one place, don't call it 'planning' or 'scheduling' somewhere else. To help drive consistency, check word usage across your organization and then keep a term list that you and your team agree to. 

Use the proper capitalization. Sentence casing means you only capitalize the first word in a sentence. Proper nouns—names of people, places, and some products—also get capitalized. For subheads, buttons, and hyperlinks, use sentence casing without punctuation. When in doubt, don't capitalize. Use title case for titles (e.g., Chief Financial Officer), organization names (e.g., Human Resources), branded products or programs, and names of people and places. All caps is not recommended under any circumstance; for stylistic usage, it's recommended to use different typography styling (size, font weight and color) rather than all caps.

### Prioritize correct sentence structure
How people react to and feel about your appication depends partly on the quality of the writing and the overall voice and tone in which you speak. When writing in general, there are four types of statements (or sentence structures) that you can use. Typically, UI content uses three of the four, depending on the purpose of the content and the nature of the product.

- Use _declarative_ statements regularly. A description of the features of a component is an example of when you'd use a declarative statement.
- Use _imperatives_ freely. These are prompts and commands. For example, when asking the reader to review changes and then submit.
- Use caution with _interrogative_ statements. These are questions. They are okay in product flows where people must make choices. They can help uncover solutions or clarify a reader's needs.
- Occasionally, _exclamatory_ statements can be used in UI content. Use judiciously, keeping in mind the more you use them, the smaller the positive impact.

### Know when to use active voice 

In an _active_ voice, the subject performs the action. It starts with the person or thing that's taking the action. For example, "Enter a few letters" is a simple, direct request for the reader to take action.

In _passive_ voice, the subject receives the action (as opposed to performing it). The past participle of the action verb follows some form of the verb to be (e.g., has been, will be). Passive voice obscures or omits the actor, making the sentence less direct and sometimes ambiguous. For example, "A few letters should be entered" lacks clarity and authority.

**Active vs Passive voice examples**

| Active | Passive |
| ------ | ------- |
| "Click the 'Submit' button to save your changes." | "Your changes will be saved when the 'Submit' button is clicked." |
| "Enter your email address to receive updates." | "Updates will be received once the email address is entered." |
| "Select your preferred language from the dropdown menu." | "The preferred language can be selected from the dropdown menu." |
| "Fill out the form with your contact information." | "The form should be filled out with contact information." |
| "Review the terms and conditions before proceeding." | "The terms and conditions should be reviewed before proceeding." |
| "Click on the image to view it in full size." | "The image can be viewed in full size by clicking on it." |

In each of these examples, the active voice provides clear instructions to the user (the subject) by specifying the action they need to take. This clarity helps users understand what they need to do more efficiently as it gives better direction. In the passive examples, no actor is indicated, so it's unclear who should be performing the action on the subject. The user should be aware when they need to take action. 

Passive voice can be used to soften messages or avoid being too direct, such as when errors occur. For example, when the focus is on conveying information about what happened rather than assigning blame or responsibility. People find failures frustrating regardless of who's at fault. Never imply blame or accuse the reader.

| Active | Passive | 
| ------ | ------- |
| "You entered the password incorrectly." | "The password was entered incorrectly." |
| "We couldn't find the file." | "The file could not be found." |
| "You submitted the form." | "The form has been submitted." |
| "We encountered an error while processing your request." | "An error occurred while processing your request." |
| "We saved the changes." | "The changes have been saved." |

For best practices and standards, lean heavily into active voice. For general guidelines (especially when recommending things to avoid or error messages), use passive voice.

### Equally plan content for assistive technologies

Accessibility involves ensuring that content is perceivable, operable, and understandable by all users, including those with disabilities. Features such as descriptive alternative (alt) text for images ensures that the UI content can be accessed and easily understood by people depending on assistive technologies. Alt text is primarily associated with images, as it serves as a textual alternative to convey the content and purpose of an image using screen readers. However, alt text can also be used for other non-text content elements on web pages, such as videos, audio files, charts, graphs, and interactive elements like buttons or icons.

When writing alt text, provide concise and descriptive text that conveys the purpose and content of the content. It should be clear, informative, and relevant to the context of the image, avoiding overly technical language or unnecessary details. Focus on conveying the essential information, such as key objects, actions, or visual elements, while avoiding subjective interpretations about the image. Keep it concise to ensure it is efficiently read by screen readers (the standard recommendation for maximum length of alt text is typically around 125 characters). Write in a neutral tone and ensure the text is grammatically correct.

### Writing for international audiences

When writing content for an internationally used app, consider cultural diversity and sensitivity to ensure inclusivity and relevance for users from different backgrounds. Use culturally neutral language that can be easily understood by a global audience. Avoiding colloquialisms, slang, or cultural-specific references helps ensure that the content remains universally accessible and does not inadvertently exclude or alienate users from different regions or linguistic backgrounds. Provide localized versions of the interface with translations tailored to each target audience's language and dialect preferences to enhance user engagement and comprehension.

Understand cultural norms, values, and preferences when designing content for an international audience. Different cultures have distinct communication styles, etiquette, and social norms that influence user behavior and expectations. Consider factors such as color symbolism, iconography, and content presentation formats specific to each cultural context helps create interfaces that resonate with users. Visual elements such as icons and imagery should be carefully chosen to resonate with users across diverse cultural contexts. While certain symbols may carry universal meanings, others may vary significantly in interpretation depending on cultural norms and beliefs. Collaborating with local experts or conducting user testing during the design and localization process can provide valuable insights and ensure that the interface reflects the cultural nuances and preferences of the target audience.

## Power Platform facilitation

Power Platform details here ...

## Related links

Related links here.

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
