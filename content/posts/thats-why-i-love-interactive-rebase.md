---
title: "That's Why I Love Interactive Rebase"
date: 2023-11-09T15:23:06-03:00
draft: false
image: "/images/banners/thats-why-i-love-interactive-rebase.png"
tags: ["git", "rebase"]
---

You probably already struggled to change a specific commit, rename it, remove it, and anything else. I’m glad to welcome you to the interactive rebase power!

## What is interactive rebase?

In my words, interactive rebasing allows you to manage anything you want to your commits. You can navigate through the history, pick the commit, and change it as you wish.

Here's everything you can do to every single commit:

![linter](/images/thats-why-i-love-interactive-rebase/git-commands.png "Linter output")

It lets you choose between the options (aka rebase commands) and perform the desired action without running many git commands manually, so you'll have less work and headache.

My top ones are:

1. `fixup` (similar to `squash`)
2. `reword`
3. `drop`
4. `edit`
5. `pick`

You can also change history by changing the order of the commits!

## Putting into practice

Given this highly complex javascript code:

```jsx
function foo() {
  console.log('Foo')
}

function math() {
  console.log(5 / 1)
}

function year() {
  console.log(new Date().getFullYear())
}
```

And the following commits for each function:

```bash
# git log --oneline

eaefd90 (HEAD -> main) add year
f576984 add math
1e2458e add foo
```

I want to:

- Edit the `math` function
- Rename the `year` function commit

Firstly, we must tell the rebase command the range of commits we want to pick from the [HEAD](https://www.geeksforgeeks.org/git-head/). There are various ways, but I'll use the command I most use

Range from the top (but the initial)

```bash
git rebase -i HEAD~2
```

`~X` is the count of commits from the latest one

Result:

```bash
pick 7d0bb76 add math
pick 6227988 add year
```

Do you remember the rebase commands from the screenshot? Let's use them now. Rename the `pick` by the option you want to apply to a specific commit:

```bash
edit 7d0bb76 add math
reword 6227988 add year
```

Now save, edit your `math` commit changes, commit again, and continue the rebase

- `git add .`
- `git commit --amend`
- `git rebase --continue`

A new prompt will open, asking you to insert the update for the `add year` commit message.

<video loop controls style="width: 100%; height: auto;">
  <source src="/videos/thats-why-i-love-interactive-rebase/rebase.mp4" type="video/mp4">
</video>

## Risk of data loss

Since everything has pros and cons, It wouldn't be different with interactive rebase, but don't worry!

There's a chance to break the commit history and lose all of your changes. No problem, though. Let's continue using the git power to help us in this case. I have already failed thousands of times doing this, and here are my takeaways:

1. If you are unsure about your rebase, create a backup branch before changing your working one
2. Save the commit hash you will change (copy it into a text file, etc.)
3. Push your changes to the remote (GitHub, Git Lab, etc…)
4. Be aware of `git reflog` superpower. With this fantastic tool, you can track all of your changes in your git branch and pull them easily by `git cherry-pick <<COMMIT HASH>>`

## Conclusion

Interactive rebase has way more functions and utilities than this example. Create your experimental repository, play with all the commands from there, and start using it daily.

Also, don't be afraid of losing any work. The git tracks ALL the things for you, and the only thing you'll need to do for a worst-case scenario is figure out how to pull your commit again (`git reflog` is the best starting point).

Commits are malleable, git provides all the tooling, and we are in the ChatGPT age, so why not try out new things? We have countless sources for research and learning.

Feel free to search and learn more about this fantastic tool! ✨
