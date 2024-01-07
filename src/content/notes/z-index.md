---
title: Z-Index
description: The Puzzle Stacked On an Enigma Stacked Under a Riddle
heroImage: z-index-hero.webp
pubDate: 2024-11-19T02:48:08Z
---
TL;DR: z-index works on ***positioned*** elements to raise or lower it relative to any ***siblings*** — but ***not parents*** or ***children***. See <a href="https://codepen.io/nick3white/pen/OJdQVzJ" target="_blank" >this pen</a> for an example.

## Part 0: A Startling Admission

Z-Index is confusing. I wanted to write an article that was like, “Z-Index is actually super simple, you just need to know this one trick!” And I did write that article — but the “One Trick” turned out to be like 6 tricks, each with several sub-tricks and caveats.

And, as I’m sure you know, there are probably hundreds of articles just like this one — but, as Gertrude Stein points out, over and over again, that when we repeat ourselves, we say things a little differently each time, and it’s in those differences that the important details live. So this one is mine. There are many just like it, but this one is mine. Also it will probably be the best one. Just kidding. Mostly.
Z-Index layers are like magnets: No one actually knows how they work.

If you aren’t familiar with that meme, it’s a fun one. It’s from an old song — and what I like about the line is, obviously it’s not true, scientists do understand how magnets work — but, for real, be honest: do you actually understand how they work? Maybe you do — that’s great. But most people actually don’t. For most people, it’s one of those things, like z-index, that we just kind of assume we understand, but only because we’ve never actually thought about it.

Today, you can join the club. Leave the clowns behind and join the science nerds.

## Part 1. Stacking.

The first thing to understand is stacking order. It’s pretty straightforward — the “floor” of the HTML file is the 0th element, the 0th layer. As the browser reads the file, top to bottom and left to right, it places elements in the stack — so, the later the element in the file, the higher in the stack it will be.
Children stack on top of parents; siblings stack in first to last order.

If you think about a pretty-printed HTML file, tab depth can really help you understand this. Each tabbed section represents a branch in the DOM tree, each branch eventually meeting the trunk, aka, the floor of the HTML file.

Z-Index allows you to change an element’s position in its stack, but, if you look at it sideways, one of the core limitations becomes visible: you can’t change an element’s z-axis level in relation to an element in a totally different branch of the DOM.

And when you move an element that has children — it’s not going to leave its children behind! They’re always coming along. The implication of this is another limitation of z-index: you can’t position an element above its own children — if you reposition the element, the children will just come with it to the new level.

Finally: parents. They’re weird. Also, just like your weird parents, HTML elements which are contained by other HTML elements can’t be positioned below the parent elements. There is an important exception here, though: negative z-index values.
If you catch this reference you probably have the same psychic scars as me. Twinsies!

Negative z-index values place an element at the floor of the stack. Because the floor of the stack isn’t always the parent element, this means that z-index _does_ allow you to place elements below their parents — but not objectively. Let’s go into this in detail, because, like your parents, it’s weird.

(I’m just kidding, your parents are very normal and they raised you in very normal ways, and all the things about you that seem strange are very normal and it’s everyone else that’s strange.)

So: if your element, #d is in a stack that starts at element #a (with #b and #c between), you can put #d directly on top of #a — in other words, at the very bottom of its stacking context— but you can’t put it between #b and #c.

Ok — now, imagine #d1, #d2, and #d3. They’re siblings, children of #c. Because they’re siblings, you can use z-index to alter their z-axis position relative to each other — positively or negatively. What I mean by that is, you can give them z-index values like so:

```css
    #d1 { z-index: 1; }
    #d2 { z-index: 2; }
    #d3 { z-index: 3; }
```

but you can also do:

```css
    #d1 { z-index: -1; }
    #d2 { z-index: -2; }
    #d3 { z-index: -3; }
```

The divs will respect that positioning —going down on the z-axis, starting at the 0th level element.

It makes sense, right??? I told you it would. Of course, we haven’t even gotten into stacking context.
Part 2. Stacking Context.

With no other interference, the floor of the stack is the floor of the HTML file. You can change the floor, however — and we often do, accidentally, and that’s usually why z-index isn’t behaving in the way you’d expect.

Creating a new floor is called creating a new _stacking context_. There are a lot of ways to do this. There are a bunch of CSS properties that do it that you might not expect — opacity, mix-blend-mode, transform… Here’s a link to the MDN page that talks about all of them.

The most commonly-known way is probably position: fixed — that one’s pretty obvious, but it’s often confusing why we can’t put a fixed-position element wherever we want.

Another significant way is with position: relative and absolute — but these two are weird (which itself is weird because the rest of this has been so straightforward!). Relative and absolute positioning allow you to set z-index values in order to move an element around — but they don’t start a new stacking context on their own. Relative and absolute positioning only create a new stacking context if you assign them a z-index value.

You’re very smart, so you’re probably thinking to yourself:

> _So if relative and absolute positioning don’t start a new stacking context unless you add a z-index value, but you can’t set a z-index value without setting a z-index value, then they basically always start a new stacking context, right?_

> **Yes! That’s true.**

> _So why do we have this weird fiction that they don’t start a new stacking context?_

> **Because not everything’s about z-index, ok?! There are situations where stacking context matters, but you’re not using z-index.**

> _What are they?_

> **Listen, nobody likes people who ask so many questions.**

You may also be wondering what happens when you add a z-index value to an element that causes it to start a new stacking context. In the CodePen linked at the top of the article (and here), this is actually what’s happening in the case of the numbered boxes — they all start a new stacking context, since they are positioned with either relative or absolute, and have z-indices assigned. So, as you can see, changing the z-index of the moveable element in the CodePen does work. The 0th element in a stacking context is still moveable as an 0+n element in the exterior stacking context.

Personally, I think of z-index as a moving around of stacking contexts themselves — but that understanding itself has caveats, so, if it doesn’t work for you, you’re not missing out on much.
To summarize:

1. Z-Index moves elements relative to its siblings only — not parents or children.
2. Z-Index alters elevation within its stacking context only — and creating a new stacking context is shockingly easy.
3. Adding a value of -1 places an element below its stacking context, not below its parent.
4. If it’s not doing what you think it should do, start looking for stacking context resets.

Z-Index is not as simple as I had hoped when starting this article — but it is comprehensible! I hope this article has helped you make sense of it a little.
## Addendum: Pro Tips.

### Box Shadow.

Most of the time, unless you’re some kind of CSS anarchist, elements don’t actually overlap — but their z-axis position can still be important to your design — so it can be hard to identify z-index layering. You can use box shadow to see how elements are overlapping: an element will only cast a shadow on elements if it is above them. See <a href="https://codepen.io/nick3white/pen/VwgbVax" target="_blank">this pen</a> for a demonstration

### Use Variables.

If you remember dinosaurs roaming the earth when you were a kid (or the Liquid Television reference earlier), you probably remember BASIC.

```BASIC
    10 PRINT “hi mom”
    20 GOTO 10
```

The reason we wrote line numbers in multiples of 10 was so you could add something if you forgot.

```BASIC
    10 PRINT “hi mom”
    15 PRINT “and dad”
    20 GOTO 10
```

The same thing goes for CSS variables; z-index values are notorious for being placed randomly super high. Did I set z-index to 999? or 9999? By using CSS variables, you can remember your stacking layers much more easily.


```css
    html {
      --layer-1: 10;
      --layer-2: 20;
      --layer-3: 30;
      --layer-4: 40;
      --layer-5: 50;
      --layer-999: 999;
      --layer-9999: 9999;
    }
```
