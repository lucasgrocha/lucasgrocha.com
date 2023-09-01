---
title: "Better Code QA - Benefit of Unit Testing"
date: 2023-08-31T20:48:53-03:00
draft: false
image: "/images/banners/better-code-qa-benefit-of-unit-testing.png"
tags: ["code", "qa", "unit-test"]
---

Did you already find yourself trying to understand a complete rabbit hole code, or do you want to test your brand new bug fix without running a bunch of flows and business rules that may involve third-party endpoint calls?

Let's try tasting small pieces instead of eating the whole pie.

<div style="width:100%;height:0;padding-bottom:75%;position:relative;"><iframe src="https://giphy.com/embed/IAJBKTMu3NSbm" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/homer-perfectloops-pie-IAJBKTMu3NSbm"></a></p>

## Why? What's the benefit?

I already spent countless hours of my day just trying to prove that my code works by running the step-by-step to reproduce the issue, and in the end, I found myself very stressed because most of the time, you'll miss setting some attributes that will conditionally trigger your fix. V*oila*, you get your stress level increased.

In my personal experience, the benefits are these:

- Faster development/understanding
- Faster QAing
- Faster CI/CD

## The painful process

*I need to create a new user, set their config to this, update this row, update this other thing, and make sure the payload is that… And while you are thinking through all of this, you must answer some DM's, monitor logs, etc.*

There may be a more straightforward way to test your code that doesn't require all these painful steps.

## Let's play with some code

Consider this concise ruby class that calculates the BMI number and returns `true/false` if the user is underweight (you just added this functionality).

```ruby
class User
  def initialize(weight:, height:)
    @weight = weight
    @height = height
  end

  def bmi
    (@weight / (@height * @height)).round(2)
  end

  def underweight?
    bmi < 18.5
  end
end
```

Here's the unit tests:

- Test if the BMI amount is the expected one for the given weight and height
- Test if the given weight and height is underweight or not

```ruby
class TestUser < Test::Unit::TestCase
  def test_bmi
    assert_equal(15.43, User.new(weight: 50, height: 1.80).bmi)
  end

  def test_underweight
    assert_equal(true, User.new(weight: 50, height: 1.80).underweight?)
    assert_equal(false, User.new(weight: 80, height: 1.80).underweight?)
  end
end
```

So, how can I prove that this `#underweight?` method work as expected? You may say: "It's easy. I know exactly the inputs I need to give to test that method, and I know the output value by calling the `#bmi` method.” Yes, you're completely right, you already know all the business rules and the flow as well:

```ruby
user = User.new(weight: 50, height: 1.80)

user.bmi
#> 15.43
user.underweight? # 15.43 is less than 18.5
#> true
```

Let's forget about the `#bmi` for a brief moment so that it doesn't exist anymore. Now, you're entirely blind about what the calculation is. So, how can you prove the `#underweight?` method works?

## Take It Easy

You don't need to know the math behind the BMI calculation. You only need to know the conditions that make the `#underweight?` respond precisely to what you want. If the BMI amount is `15`, the expected output is `true` since you have this condition: `x < 18.5` .

We already know this condition, so we can hard-code the BMI amount and test our method again:

```ruby
def underweight?
  15 < 18.5
end
```

That looks simple and weird at first view, and it is what it is supposed to be, though. That’s the essence of unit testing: mocking a bunch of values to make X method respond to what our automated tests are expecting.

Now you have proven that `#underweight?` the method works without having to instance the class, providing the right inputs, learning the calculation behind it, and so on. You get the target condition and hard-code the expected information to see Its desired behavior.

Unit testing involves testing small pieces of code to ensure proper functionality overall.

Either `15` or `< 18.5` could be a completely different condition that could call a bunch of methods in the chain, and you would need to know precisely the inputs, Their formats, and conditions behind the scenes.

This is primarily useful when you need a front end for your functionality or your QA person to test it at a code level.

## Conclusion

I've been doing this practice for a long time whenever I need to, and since I got this insight, I always try to use this approach in my tickets. It's effortless and helps me to have an overall view depending on the case because I can keep iterating the perspective like:

- Understanding the small pieces
- Take a step further and understand the small pieces from a different code
- Understand the whole thing without needing to understand the entire thing at once

Sometimes, you can't test things this way and must try the whole thing. It's no problem, though. The most crucial point is that you understand how to unit test your code quickly in a real scenario.
