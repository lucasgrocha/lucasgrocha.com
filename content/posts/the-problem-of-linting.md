---
title: "The Problem of Linting"
date: 2023-07-12T19:00:00-03:00
draft: false
image: "/images/banners/the-problem-of-linting.png"
tags: ["code", "styling", "linting"]
---

Have you already spent precious time of your day fixing a code syntax style just because your code linter didn’t like that? Well, everyone already did, but don’t let it delay and distract you.

<div style="width:100%;height:0;padding-bottom:56%;position:relative;"><iframe src="https://giphy.com/embed/woWQA2I7xqRMI" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>

## What is linting?

Linting is basically a tool that will make the code look prettier by following a sort of code stylish, rules, and patterns, developers use that to make the codebase style the same for everyone, it also can help to prevent some mistaken code that may reduce the performance or cause any syntax issue in the future.

### Short example

```ruby
puts "Hello, world!"
```
Will result in this ruby’s linter feedback
![linter](/images/the-problem-of-linting/rubocop.png "Linter feedback")

## The problem

Most of the time, using that is a very simple thing because we only need to run to check, fix the code, and re-check, fortunately, the tool fixes the code for us as well, and hopefully, it will fix it in the first or second try, there could be a problem though.

Sometimes the linter is not able to fix the code and starts complaining about a developer’s action to re-write the code, the issue is usually in this step here, the developer starts fixing, and the linter continues complaining over and over again until you notice you spent the most of your day in a rabbit hole just trying to make that tool happy.

## Behind the scenes

I’ve already seen a lot of people in the developers’ community caring about how their code should look (e.g., as perfect as possible), I know there also could have a “slightly” self-imposition to make a beautiful code because a lot of teachers teach us in this way for the whole life for every single thing we do! Which is wrong because they forget to teach how to prioritize certain things.

*Assembly programming language runs faster than any other language, but using that in a business is unsustainable due to its high complexity and comprehensibility, that’s why we use high level programming languages, they are slower, but they make us faster to deliver a lot of things, everything in computing is based on trade-offs.*

I’m not saying these things are useless or not important, making a good code is awesome for everyone, the issue is prioritizing the linter stuff than all the remaining work.

It does not mean you should make a poor code with a lot of inconveniences or hard to read, no. You should always do your best to also bring value to the codebase, specially the things you make because they are like your children, and you should take care, oversee and understand what’s going on as well, also make that easy for your teammates to be able to continue improving what you made without any major blockers due the code quality.

## So what should we do?

Getting straight to the point, just **skip** the linter issues. This is the best decision we can make in some scenarios like that which the code will not directly affect the expected results, we should not spend time of our day in just beautification that will not aggregate any kind of value to the customer/company, because they are the target of the product we make.

The linter is not your mentor or even a stakeholder who urgently wants your code perfect to make money (*except if work at [Oracle](https://www.oracle.com/br/java/)*), It’s just a tool, make a tech debt ticket and go ahead with your work. Do what matters instead!

> *“Why don’t you show the total number of people in the room at a given time?” Answer: It just doesn’t matter. Everyone’s name is listed so you know who’s there, but what difference does it make if there’s 12 or 16 people? If it doesn’t change your behavior, then it just doesn’t matter.*
> *Would these things be nice to have? Sure. But are they essential? Do they really matter? Nope.*
>
> *And that’s why we left them out. The best designers and the best programmers aren’t the ones with the best skills, or the nimblest fingers, or the ones who can rock and roll with Photoshop or their environment of choice, they are the ones that can determine what just doesn’t matter.*
>
> *That’s where the real gains are made.*
<p style="text-align: right">
  <strong><a href="https://basecamp.com/gettingreal/05.2-it-just-doesnt-matter" target="_blank">Getting Real – It Just Doesn't Matter (37signals)</a></strong>
</p>

## Conclusion

Linting is an awesome tool for every single developer and codebase, but we should always be attentive to how much time of our day we are allocating to work on that, if that's a quick and easy thing (98% of the time it is), just go ahead, but if you're spending more time than just the necessary to rename a misspelled variable or replace some built-in method call you should consider creating a tech debt and do not let you get distracted with just unnecessary stuff.
