---
title: Remapping Movement
description: Using place and movement in a recent project
pubDate: 2023-11-11T01:34:44Z
heroImage: mapping-movement.webp
---

_This essay was written for the publication of a rebuild of <a href="https://mappingmovement.newberry.org" target="_blank">mappingmovement.newberry.org</a>_

## 0. Representation.

It was the goal of the original design of Mapping Movement to feel like you were reading a book. When we began making plans for our rebuild at the end of 2022, we took this notion as our north star, returning to it to orient ourselves in our redesign. While we did end up throwing out most of the map, we continually returned to that idea when we became lost.

The user experience of a physical book is something we’ve been missing ever since digital interfaces started to replace them. Their texture of the pages, the feel of their heft, their …floppiness? (You know how some books just fall open, and some seem to complain every time the cover is lifted? That.) The way you can hold your place with a finger to jump back to find some detail you want to reconsider, or to go to the end to see if your hunch about the murderer is correct — or, as in the case of books about maps: to the familiar section of bright white page edges amid the beige — the plates, the high quality representations of the maps — and how easily we could return to where we left off. Having, literally, left something of ourselves there, we never feel like our sense of place has been lost.

That strong sense of place of a physical book is something digital interfaces lack. Every time you click a link, we are sent to a new space; taken as a whole, the frequency with which we traverse through these minor spaces drains them of a sense of place.

![Colored Blocks in Chicago](/blog/colored-blocks.webp)

## 1. Inhabitation.

Is it possible to imbue a digital space with a sense of place?

The book, Mapping Movement, may have some answers. Maps, as 2-dimensional, frozen representations of physical space, from impossible perspectives, are easy to misunderstand as noisy: they are detail-centric; large patterns can only be found by examining the details — as opposed to, say, a bar graph or a pie chart, whose ability to display larger trends can obscure their details. The Mapping Movement project uses them in that way: using maps of a location from different times, different purposes, to show the movement of people — turning data into knowledge, turning noise into flow, turning spaces into places.

(Of course it’s not merely movement that transforms space into place. A place is a space that you inhabit, an essential being-within; you can “be” in a space (eg airports), and we can briefly glimpse a place, like the inside of your crush’s house when they open the door — an intimately understood but infinitely distant place.)

While designing the updated Mapping Movement, we used a smooth-scroll effect on navigation: when a user clicks a link, rather than the page content disappearing and the new content appearing out of nowhere, the page scrolls back to the top, the blurring speed of which disguises the changing of the content. We did this, in part, to bring the feeling of turning the page, but also to retain the sense of place. The moment of page changes in web development, insofar as they seem instant, feel digital — unreal, fleeting figments of electricity flashing through flattened rock. To retain the flow, we disguised the content switch and carried the user from where they were to the place where they arrived.

While they are slightly more technologically complex, and more unique, we used a couple of other design innovations to retain a sense of place.

The most noticeable is the way we transform the article title into the page header as the user scrolls. The text begins in the middle of the page in a large font, and then, as the user scrolls, the text shrinks until it is in line with the header, and stays there, sticking to the top. This presented a number of technical challenges: first was the layering, the “stacking order”, and secondly, managing the layout to account for the changing size of the title element — this impacted not only the essay text around the title, but also the sidebar, which depends on screen width to show and hide on smaller screens. I will write a more detailed, technical documentation on this design (including codepen) but it is out of scope for this document.

The other element we designed with this in mind is the sidebar. On smaller screens, the sidebar shifts off-screen to the left. There are a lot of ways to handle toggling a sidebar; it is usually done with some combination of visibility or opacity, or by toggling its display altogether. We felt that these approaches devalued our efforts to provide motion, place, continuity. Instead, we envisioned the page like a road map: when the sidebar isn’t needed, it is still present, but off-screen; when it appears and disappears, it slides smoothly in or out of view. An easy route to manage this is to set the width to 0, and increase the width until it reaches its intended size. However, in practice, this can have odd side effects: text elements will show up as the container grows, causing either the text to wrap — resulting in misshapen list item elements — and an unpleasant visual effect — or to be truncated at the edge of the list item. There are ways to manage this: in the past I have used multiple animations, in conjunction with animation delays, so display the text only once the container could contain it comfortably — but this still serves as coming from nowhere to the user; alternatively, you might try to clip the text on the left side instead of the right, so it appears to arrive from off-screen — but this has the consequence of right-justified text, which is not the intended presentation.

We used a less-performant approach — which we felt was acceptable given the generally low resource requirements of the content. The page is, in fact, the full width of the screen, plus the width of the sidebar; the main content section increases to require the full width, pushing the sidebar off-screen; when the user chooses to show the sidebar, the main content section narrows, to require the full width of the screen minus the width of the sidebar. Only by literally moving the sidebar on and off the screen were we satisfied with the permanence and continuity of the element. (Again, these details will be described in another document.)

![Western New York (aka West York)](/blog/west-york.webp)

## 2. Inhibition.

Displaying the maps themselves was a contentious issue. It was the opinion of the original designers that the essays should be emphasized, as they represented original, peer reviewed work, while the images, as beautiful as they are, were not original to the project; to provide this emphasis, to “sideline” (literally, to put links to them in a sidebar) the images — but to provide them with another access point which was unfortunately never constructed. Additionally, since the text wasn’t always precisely relative to only one of the maps, it is, admittedly, misleading in our version; their presence implies a specific connection between image and text which is not there.

It was our feeling that, while the presence of images interspersed within in the text of a book is disruptive book experience, there were more reasons to do it than to not do it. First, it is (and was, in 2007), the expectation of the reader. Readers approaching a body of text expect to have breaks; and it isn’t just an idle expectation, but one that provides human comfort — rest for the eyes, points of reference to return to after a distraction, etc. While subverting expectations can be a vital aspect of innovative design, there’s no sense in subverting expectations only to present an alternative which is worse. Secondly, we consider that, far more essential to the book-experience than the absence of images, is the presence of pages. The turning of a page represent the same breaks in text that users expect. As socially responsible, self-respecting web developers, we would never require our users click a “next page” link within an article, but we felt we could replicate that moment of disruption by adding the large, intriguing, and beautiful, maps, about which the book was written. In other words, we decided that the intense unnaturalness, the extended, uninterrupted textual experience was more unbookish than the images.

And, finally, we felt we could do more with the images than merely present them.

The presentation of the images is, in our estimation, the most defining characteristic of our approach to imbue the site with the sense of the real world objects. The techniques we used were not particularly challenging, complex, or unique, but the details of how we used them provided a valuable link to the real.

At its core, our approach was to simply employ a parallax effect on the maps. Parallax is not just the top design trend of 2014, it’s been used to convey the illusion of space in video games since the nineteen hundreds. (My daughter calls them that. I hate it.)

The parallax effect has a lot of power. While it does, on its own, give a page a sense of depth and space, its status as known, but not entirely commonplace, makes it noteworthy, but probably not remarkable. And that was our intention — to make the user take note. The parallax effect catches the eye, drawing the user into the image. As vital companions to the content, we felt it was important to let the maps shine.

![The Jolla](/blog/jolla.webp)

## 3. Noise.

The maps featured in the Mapping Movement project are presented for their details; the authors walk us through their ideas and findings on the maps — but the maps, as whole objects, are noisy. Their value begins in their details, in their minutia. We intentionally provided the user with a limited window into the images — a window which they are able to reposition — and which will, upon a complete scroll, reveal almost all of the map — but it only ever provides access to details.

Another aspect of maps — which is so easy to forget in a digital interface — is that they can be large — physically, we associate them with this notion of a large, unmanageable, cumbersome document, whether its the vision of a tourist attempting to refold it in the same way it had been folded, or of a scholar in a library, having to find the largest table in the building just to lay out the map in its entirety. We are forced to reposition our body to suit the map, and not the other way around — as little as a craned neck, or as much as walking to the other side of the table. This image — the “signified” to use the term from semiotics — of real life maps has deeply embedded connotations of using our bodies with the map — smoothing it out with wide sweeps of a flat palm, tracing a route with a finger. As your finger touches the route, its as if imbued with magic, your fingertip transforms spaces into places.

By “fixing” their position, so that the maps appear to hold still as the user moves, we hoped to evoke that vision: we have laid the map out on the table, and have given you the power to navigate it, transforming the absent scroll into an active, empowered scroll; intentional; aware. Instead of merely an obstacle, a forced interruption, it becomes a space you inhabit, a place.

We hoped that with these techniques we were able to do justice to the original design guidance, to the books and maps we’ve experienced, and to the content of Mapping Movement.
