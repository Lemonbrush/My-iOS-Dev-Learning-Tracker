# How to GitHub
 
- [Fancy and interactive titorials (MUST HAVE)](https://learngitbranching.js.org/?locale=ru_ENG)  
- [Great tutorials set (also must have)](https://gitimmersion.com)  

----

![Cover](https://github.com/Lemonbrush/My-iOS-Dev-Learning-Tracker/blob/main/Resources/Images/Covers/GithubCover.png)

### Glossary

| Keywords                     | Description                                                                                                             |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| git                          | Open-source distributed version-control system, used to store code in repositories                                      |
| GitHub, GitLab and Bitbucket | Platform for hosting and collaborating on Git repositories                                                              |
| staging                      | Proposed files/directories that you'd like to commit                                                                    |
| commit                       | Saving all staged files/directories to your local repository                                                            |
| branch                       | An independent line of development, so you can develop features isolated from each other. Master branch is the default. |
| clone                        | Local version of a repository, including all commits and branches                                                       |
| remote                       | Common repository on eg. Github that all team members to keep that changes in sync with                                 |
| fork                         | Copy of a repository owned by a different user                                                                          |
| pull request                 | A method of submitting contributions to a repository                                                                    |
| HEAD                         | Represents your current working directory                                                                               |

### Configuration

| Key/Command                              | Description                                         |
| ---------------------------------------- | --------------------------------------------------- |
| `git config --global user.name [name]`   | Set author name to be used for all commits          |
| `git config --global user.email [email]` | Set author email to be used for all commits         |
| `git config color.ui true`               | Enables helpful colorization of command line output |

### Core Commands

| Key/Command                 | Description                                              |
| --------------------------- | -------------------------------------------------------- |
| `git init [directory]`      | Creates new local repository                             |
| `git clone [repo]`          | Creates local copy of remote repository                  |
| `git add [directory]`       | Stages specific [directory]                              |
| `git add [file]`            | Stages specific [file]                                   |
| `git add -A`                | Stages all changed files                                 |
| `git add .`                 | Stages new and changed files, NOT deleted files          |
| `git add -u`                | Stages changed and deleted files, NOT new files          |
| `git commit -m "[message]"` | Commit everything that is staged                         |
| `git status`                | Shows status of changes as untracked, modified or staged |

### Synchronization of Changes

| Key/Command   | Description                                                                           |
| ------------- | ------------------------------------------------------------------------------------- |
| `git fetch`   | Downloads all history from the remote branches                                        |
| `git merge`   | Merges remote branch into current local branch                                        |
| `git pull`    | Downloads all history from the remote branch and merges into the current local branch |
| `git push`    | Pushes all the commits from the current local branch to its remote equivalent         |

*Tip: `git pull` is the combination of `git fetch` and `git merge`*

### Commit manipulation

| Key/Command                 | Description                                                                                 |
| --------------------------- | ------------------------------------------------------------------------------------------- |
| `git reflog`                | Show full history of your actions (X)                                                       |
| `git reset HEAD@{X}`        | Go to the action (X)                                                                        |
| `git checkout -- [file]`    | Replace file with contents from HEAD                                                        |
| `git checkout .`            | Reset working directory to the current commit                                               |
| `git revert [commit]`       | Create new commit that undoes changes made in [commit], then apply it to the current branch |
| `git reset [file]`          | Remove [file] from staging area                                                             |
| `git reset --hard HEAD `    | Removes all local changes in working directory                                              |
| `git reset --hard [commit]` | Reset your HEAD pointer to previous commit and discard all changes since then               |
| `git reset --soft HEAD^`    | Undo last commit but not the changes in the working directory                               |
| `git commit -a --amend`     | Amend last commit                                                                           |
| `git diff [file name]`      | Show difference between the file and this file in the last commit                           |
| `git cherry-pick [commit reference]`      | In case you want to copy some commits and place them in the history after current HEAD        |
| `git rebase -i HEAD~X`     | If you want thoroughly clean git history or change some commits use this and change them via Vim interface. All aptions listed above*    |  

*  
fixup - like "squash", but discard this commit's log message  
squash - use commit, but meld into previous commit  
reword - use commit, but edit its message   
pick - use commit  
edit - use commit, but stop for amending  

### Branches

| Key/Command                | Description                        |
| -------------------------- | ---------------------------------- |
| `git branch [branch]`      | Create a new branch                |
| `git checkout [branch]`    | Switch to that branch              |
| `git checkout [branch] -b` | Create and checkout new branch     |
| `git merge [branch]`       | Merge [branch] into current branch |
| `git branch -d [branch]`   | Deletes the [branch]               |
| `git push origin [branch]` | Push [branch] to remote            |
| `git branch`               | Lists local branches               |
| `git branch -r`            | Lists remote branches              |
| `git branch -a`            | Lists local and remote branches    |

### History

| Key/Command                | Description                                                      |
| -------------------------- | ---------------------------------------------------------------- |
| `git log`                  | Lists version history for the current branch                     |
| `git log --oneline`        | Lists compressed version history for the current branch          |
| `git log --graph`          | Lists version history as a graph                                 |
| `git log --all`            | Lists full version                                               |
| `git show [commit]`        | Outputs metadata and content changes of the specified commit     |

### Gitignore

You can list files/directories that you want to explicitely exclude from Git in a `.gitignore` file. This file should be placed at the root of your repository.

```
touch .gitignore
```

then    

```
open .gitignore
```

and add files you don't want to be staged  

```
secrets.txt
.DS_Store

# It is a simple comment
# add this [ * .text ] to ignore all text files  
```  

It is noted that people usually exclude dependency caches, such as `node_modules`, system files, such as `.DS_Store`, among others.

You can see the `.gitignore` file of [this repository](https://github.com/0nn0/git-basics-cheatsheet/blob/master/.gitignore) or [more examples](https://github.com/github/gitignore) provided by GitHub.

----

### Short Command line hint
- ls — обзор доступных директорий
- cd <directory>— переход по директориям 
- cd .. — выйти в прошлую директорию
- cat <filename> — посмотреть содержимое файла в строке
- mkdir <filename>— создать папку

### Short Vi editor hint
- esc — перейти в режим команды
- u — отменить последнее действие
- :wq — сохранить и выйти
- :q — выйти без сохранения
- i — начать редактирование
- d — удалить следующий символ

----

# Resources

- [Official short tutorial by GitHub (ho to use GitHub)](https://guides.github.com/activities/hello-world/)
- [How to use GitHub](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)  
- [Flight rules for Git](https://github.com/k88hudson/git-flight-rules) - What to do when things go wrong...
 
**Cheatsheets**  

- [Short Git Cheatsheet by GitHub](https://training.github.com/downloads/github-git-cheat-sheet/)
- [Basic Git Cheatsheet site (just a simple guide for getting started with git)](http://rogerdudler.github.io/git-guide/)
- [Basic Git Cheatsheet](https://github.com/0nn0/git-basics-cheatsheet)

**Other**   

- [Use of Git Reset, Git Revert, Git Checkout & Squash Commit](https://vk.com/away.php?to=https%3A%2F%2Fmedium.com%2Fmindorks%2Fuse-of-git-reset-git-revert-git-checkout-squash-commit-2b721ca2d2d3&utf=1)  
- [Что находится в .git каталоге](https://vk.com/away.php?to=https%3A%2F%2Fhabr.com%2Fru%2Fcompany%2Fmailru%2Fblog%2F493816%2F&utf=1)  
- [Самые частые ошибки/вопросы и их ответы](https://vk.com/away.php?to=https%3A%2F%2Ftproger.ru%2Ftranslations%2Fmost-common-git-screwupsquestions-and-solutions%2F&utf=1)   
- [How To Write Proper Git Commit Messages](https://medium.com/@steveamaza/how-to-write-a-proper-git-commit-message-e028865e5791)  
- [Learn Git concepts, not commands](https://dev.to/unseenwizzard/learn-git-concepts-not-commands-4gjc)  
- [Syncing a Fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork)  
- [*Pro Git*](https://book.git-scm.com/book/en/v2)  
- [Git Flow](https://guides.github.com/introduction/flow/)  
- [Git and Github in Plain English](https://blog.red-badger.com/2016/11/29/gitgithub-in-plain-english)  
- [Learn Git Version Control using Interactive Browser-Based Scenarios](https://www.katacoda.com/courses/git)  

**Utilies**  

- [An awesome Git/GitHub command line interface by terminal](https://github.com/donnemartin/gitsome)

**Platforms**  

The following platforms can be used to host your repositories.

| Platform                           | Price |
| ---------------------------------- | ----- |
| [GitHub](https://github.com)       | Free  |
| [GitLab](https://gitlab.com)       | Free  |
| [Bitbucket](https://bitbucket.org) | Free  |

**Graphical User Interface (GUI)**  

| Clients                                      | Operational System | Price      |
| -------------------------------------------- | ------------------ | ---------- |
| [Github](https://desktop.github.com)         | Mac and Windows    | Free       |
| [Source Tree](https://www.sourcetreeapp.com) | Mac and Windows    | Free       |
| [Tower](https://www.git-tower.com)           | MacOS and Windows  | $69 to $99 |
