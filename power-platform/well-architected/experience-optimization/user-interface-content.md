---
title: Recommendations for writing user interface content
description: Learn how to write clear, approachable, and consistent content for user interfaces to optimize the user experience.
author: Denise-MSFT
ms.author: demora
ms.reviewer: jhaskett-msft
ms.date: 08/05/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for writing user interface content

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:09](checklist.md)| **Content must be easily understood and provide clear direction. Use an approachable, consistent, and professional tone that facilitates task completion.** |
|---|---|

This guide describes the recommendations for crafting effective content tailored for user experiences. Content serves as the primary mode of communication in a user interface, holding more power in communicating complex ideas than visual elements alone. The words we use in an application influence how users navigate and perceive it, whether we're guiding them through a process or sharing important system information.

## Key design strategies

Writing content that's part of the user interface design is both an art and a science. Combining these copywriting best practices with visual design best practices will improve the user experience.

### Make the content scannable

When using a business application, people aren't interested in the features of the UI or being entertained by flowery language. They're focused on task completion. Help them by writing in short, scannable blocks. Divide text into shorter sentences and paragraphs. Avoid overly effusive language. Users often visit a UI with specific objectives in mind, and content should guide them seamlessly toward achieving those objectives.

Be concise. Content should be brief and to the point. Concise doesn't mean limited&mdash;it means efficient. Use as few words as possible while maintaining meaning. Ensure that every word in your content serves a purpose. Provide only the necessary information at the right time. Remember, too much content is less likely to be read. Follow Mark Twain's advice: "Writing is easy. All you have to do is cross out the wrong words."

Start with the most important piece of information: the value proposition. If space allows, add a brief paragraph or two with details in order of importance. If you need to say more, use a "Read more" link. Sometimes, it's easier to write the body of the message first and then write the headline.

Use specific verbs whenever possible. Specific verbs are more meaningful to people than generic ones. Help your user quickly understand available options or necessary actions by using specific words like "get," "update," "choose," or "change." You can avoid confusion and reduce ambiguity by eliminating words that have multiple meanings.

### Keep it contextual and task-focused

Tell people what they need to know. The content should provide users with the essential information required to accomplish their tasks or to make informed decisions within the UI. Users rely on content to guide their interactions and expect clear, relevant information that meets their needs. Content should never cause confusion or frustration.

Bite-sized chunks create a natural flow. Focus on the user, the action taken, or what they can expect next. To avoid frustration and cognitive load, don't include information that's irrelevant or that distracts from the immediate task.

Put the benefit before the action or feature. This approach increases the user's ability to quickly complete tasks by explaining the benefit first. What positive outcome will result when they complete the action? Explain the benefit before telling them to take an action, and avoid asking for an action before explaining why.

For task-level content, don't focus on boasting your company brand in obstructive ways. For example, discard "The Microsoft Connector shuttle service will conveniently arrive at your campus location at 2:15 PM" in favor of "The shuttle will arrive at 2:15 PM."

### Speak in plain language

Use simple, clear language that's easily understood by the target audience, devoid of unnecessary jargon or technical terms. Users should be able to comprehend content effortlessly, reducing the likelihood of confusion or misinterpretation, ultimately improving engagement. Keeps reading levels no higher than tenth grade. Maintaining an appropriate reading level enhances accessibility and inclusivity, catering to a broader range of users.

Include sentences of 25 words or less. Sentences should be brief and succinct. Short sentences with sufficient information facilitate comprehension, making the content easier to read and understand.

Avoid jargon and acronyms. Even most software engineers prefer simple, non-technical language. It's especially important to avoid jargon in error messages. It's also important to remember that many common phrases are colloquialisms and might not be meaningful to everyone.

Replace overly technical words with simpler ones. Words like "configure," "activate," or "invalid" are unnecessarily technical. Keep it simple. Only use acronyms that your users are familiar with. Spell out acronyms on the first mention on each page and include the parenthetic reference; for example, "call to action (CTA)."

Avoid double negatives. Double negatives increase cognitive load. They make people spend extra time decoding the message. Focus on direct, positive actions.

### Use a polite and friendly tone

Be polite, but not overly ingratiating. People expect to be given prompts and to act. Using "please" throughout the UI is unnecessary. Use terms like "please" and "sorry' sparingly, reserving them for tasks that are burdensome, result from an error on your part, or have serious consequences. However, it's never good practice to be rude, presumptuous, arrogant, or cynical in UI content.

Write as if speaking directly to the user. Using "you" supports a friendly tone by focusing on the user and helps avoid passive voice. Omit pronouns and accompanying auxiliary verbs, and start your sentence with a verb. Again, focus on making a connection by using "you" or "your."

Avoid mixing first-person possessive ("My dashboard") and second-person language to reduce cognitive load.

When the product or application is addressing the user, use "we" or your organization's name. Avoid confusion by being clear about who is speaking or acting. For instance, use "We found these results" instead of "I found these results." Using "we" can make the UI feel more human and demonstrate accountability for system errors, emphasizing the user's importance every step of the way. However, avoid overusing "we" as it can distract from the user's needs. To keep the focus centered on the user, reserve "we" for system errors, status updates, and other system-related issues.

Use common contractions, such as "it's," "you're," "that's," and "don't," to create a friendly, informal tone. Never use your company's name in the possessive form, and avoid using it in a contraction. Avoid ambiguous contractions such as "there'd" and "what're." Avoid mixing contractions and spelled-out words in the UI, as it creates inconsistency and reduces trust. Using spelled-out words in place of common contractions introduces unnecessary formality.

### Maintain stylistic consistency

Use one word or phrase consistently to refer to a specific action across the experience. For example, if you call the process of securing a reservation "booking" in one area of the interface, don't call it "planning" or "scheduling" elsewhere. To help drive consistency, check word usage across your organization. Create a list of agreed-on terms for your style guide that your team can refer to.

Use proper capitalization. For example, agree to use sentence casing throughout the UI, capitalizing only the first word in a sentence, with proper nouns&mdash;names of people, places, and some products&mdash;always capitalized. For subheads, buttons, and hyperlinks, use sentence casing without punctuation. When in doubt, don't capitalize. Use title case for position titles (Chief Financial Officer), organization names or departments (Human Resources), branded products or programs, and names of people and places. All caps is not recommended under any circumstances. If you need to emphasize text, consider using different typography styles like size, font weight, or color instead of all caps.

### Prioritize correct sentence structure

How people react to and feel about your application depends partly on the quality of the writing and the overall voice and tone in which you communicate. In general, when writing, there are four types of statements, or sentence structures. Typically, UI content uses three of the four, depending on the purpose of the content and the nature of the product.

- Use *declarative* statements regularly. A description of the features of a component is an example of when you might use a declarative statement.
- Use *imperatives* freely. These are prompts and commands, such as asking the user to review changes and then submit.
- Use caution with *interrogative* statements. These are questions. They're acceptable in product flows when users must make choices. They can help uncover solutions or clarify a user's needs.
- Use *exclamatory* statements sparingly, as their positive impact diminishes with overuse.

### Know when to use active voice

In the active voice, the subject performs the action of the sentence; for example, "Enter a few letters." In the passive voice, the subject receives the action; for example, "A few letters should be entered."

Passive voice obscures or omits the actor, making the sentence less direct and sometimes ambiguous. It lacks clarity and authority.

The following table illustrates active vs passive voice.

| Active | Passive |
| ------ | ------- |
| "Click the 'Submit' button to save your changes." | "Your changes will be saved when the 'Submit' button is clicked." |
| "Enter your email address to receive updates." | "Updates will be received after the email address is entered." |
| "Select your preferred language from the dropdown menu." | "The preferred language can be selected from the dropdown menu." |
| "Fill out the form with your contact information." | "The form should be filled out with contact information." |
| "Review the terms and conditions before proceeding." | "The terms and conditions should be reviewed before proceeding." |
| "Click on the image to view it in full size." | "The image can be viewed in full size by clicking on it." |

In each of these examples, the active voice provides clear instructions to the user (the subject) by specifying the action they need to take. This clarity helps users understand what they need to do more efficiently because it gives better direction. In the passive examples, no actor is indicated, so it's unclear who should be performing the action on the subject. The user should be aware when they need to take action.

Passive voice can be used to soften messages or avoid being too direct, such as when errors occur; for example, when the focus is on conveying information about what happened rather than assigning blame or responsibility, use the passive voice. We find failures frustrating regardless of who is at fault. Never imply blame or accuse the user.

The following table illustrates active vs passive voice in error messages.

| Active | Passive |
| ------ | ------- |
| "You entered the password incorrectly." | "The password was entered incorrectly." |
| "We couldn't find the file." | "The file could not be found." |
| "You submitted the form." | "The form has been submitted." |
| "We encountered an error while processing your request." | "An error occurred while processing your request." |
| "We saved the changes." | "The changes have been saved." |

For best practices and standards, rely on the active voice. However, for general guidelines (especially when recommending things to avoid or error messages), use passive voice.

### Be mindful of content needed for assistive technologies

Accessibility involves ensuring that content is perceivable, operable, and understandable by all users, including those with disabilities. Features such as descriptive alternative, or alt, text for images ensures that the UI content can be accessed and easily understood by users who are dependent on assistive technologies. While alt text is commonly used with images to provide a text description for screen readers, it can also be used for non-text elements on a web page, such as videos, audio files, charts, graphs, and interactive components like buttons or icons.

When writing alt text, provide concise and descriptive text that conveys the purpose and content of the image. It should be clear, informative, and relevant to the context of the image. Avoid overly technical language or unnecessary details. Focus on conveying the essential information, such as key objects, actions, or visual elements, while avoiding subjective interpretations of the image. Keep it concise to ensure that it's efficiently read by screen readers. Keep in mind that the standard recommendation for the maximum length of alt text is around 125 characters. Write in a neutral tone and ensure that the content is grammatically correct.

### Write for international audiences

When writing content for an application that's used worldwide, consider cultural diversity and sensitivity to ensure inclusivity and relevance for users from different backgrounds. Use culturally neutral language that's easily understood by a global audience. Avoid colloquialisms, slang, or culture-specific references. This way, you won't accidentally exclude or offend users from different regions or linguistic backgrounds. Provide localized versions of the interface with translations tailored to each target audience's language and dialect preferences to enhance user engagement and comprehension.

Understand cultural norms, values, and preferences when designing content for an international audience. Different cultures have distinct communication styles, etiquette, and social norms that influence user behavior and expectations. Creating interfaces that resonate with users involves considering factors like color symbolism, iconography, and content presentation formats specific to each culture. Choose visual elements like icons and images that are meaningful to users across diverse cultural contexts. While certain symbols might carry universal meanings, others might vary significantly in interpretation depending on cultural norms and beliefs. Collaborating with local experts or conducting user testing during the design and localization process can provide valuable insights and ensure that the interface reflects the cultural nuances and preferences of the target audience.

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
