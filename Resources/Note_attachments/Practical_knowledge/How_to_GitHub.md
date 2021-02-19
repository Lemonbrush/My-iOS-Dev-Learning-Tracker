# How to GitHub

- [Быстрый старт GitHub](https://vk.com/@lemonbrushcode-nachalo-raboty-s-github)  
- [Fancy and interactive titorials (MUST HAVE)](https://learngitbranching.js.org/?locale=ru_ENG)  
- [Хороший и подробный сет туториалов](https://vk.com/away.php?to=https%3A%2F%2Fgithowto.com%2Fru&utf=1)  

----

![Cover](https://github.com/Lemonbrush/My-iOS-Dev-Learning-Tracker/blob/main/Resources/Images/Covers/GithubCover.png)

## ⚙️ git config
Для соединения со своим Гитхаб аккаунтом нужно прописать следующую команду
```
git config --global user.email “[адрес_почты@mail.ru]
```
Чтобы задать одно имя пользователя для всех репозиториев на данном компьютере (оно будет отображаться в поле автора у выполняемых коммитов)
```
git config --global user.name“[ваше_имя]”
```
## 🔆 create a new repository 
Создание локального репозитория в текущей папке
```
git init
```
## 🛠 checkout a repository 
Добавить локальному репозиторий ссылку на удаленный репозиторий
```
git remote add origin [ссылка на ваш репозиторий]
```
Скачивает репозиторий вместе со всей его историей изменений
```
git clone [ссыдка_на_репозиторий_гитхаб]
```
Перечисляет все новые или изменённые файлы, которые нуждаются в фиксации
```
git status
```
## ♻️ update
Для обновления файов в папке на новую версию из репозитория. 
Второй вариант убирает запись о мердж-коммите и ставит локальный кормит поверх нового комита с сервера (для опрятного лога)
```
git pull
git pull origin master
git pull --rebase origin master
```
## ⏪ merge 
Слить другую ветку с текущей веткой
```
git merge <branch>
```
Перед слиянием можно посмотреть на различия меду ветками
```
git diff <source_branch> <target_branch>
```
## 💾 add & commit 
Индексирует указанный файл для последующего коммита
```
git add [имя_файла]
```
Индексирует все файлы для последующего коммита (2 варианта)
```
git add --all
git add .
```
Фиксирует проиндексированные изменения и сохраняет их в историю версий
```
git commit -m “[текст]“
```
## 📥 pushing changes 
Загружает все изменения локальной ветки в удалённый репозиторий
```
git push
```
Загрузить изменения на определенную ветку
```
git push origin master
```
## 🔀 branching 
Создать новую ветку под названием feature_x и переключиться на нее
```
git checkout -b feature_x
```
Переключиться на ветку
```
git checkout master
```
Удалить ветку feature_x
```
git branch -d feature_x
```
Запушить ветку на удаленный репозиторий
```
git push origin <branch>
```
При клонировании репозитория создается всего одна ветка (как правило master) и есть еще несколько отслеживаемых веток, которые не предназначены для работы. Чтобы создать в своем локальном репозитории ветку, присоединенную к отслеживаемой нужно вписать:
```
git branch <branch-name> origin/<branch-name> 
```
## 👁‍ log
Просмотреть историю репозитория
```
git log
```
Просмотреть только комментарии определенного автора
```
git log --author=bob
```
Посмотреть краткую историю, где каждый комит сжат в одну строку
```
git log --pretty=oneline
git log --oneline
```
Посмотреть графическое представление дерева текущего репозитория
```
git log --graph --oneline --decorate --all
```
Посмотреть только измененные файлы
```
git log --name-status
```
Больше параметров посмотреть можно по команде
```
git log --help
```
## 🔃 replace local changes
Откатить файл до состояния последнего локального комита
```
git checkout -- <filename>
```
Откатить все файлы до состояния последнего локального комита
```
git checkout .
```
## 🆘 reset — ЧЕРТ! НАЗАД НАЗАД НАЗАД!
Посмотреть список своих последних действий и найти HEAD@{X} действие к которому нужно откатиться
```
git reflog
```
Сделать откат к этому шагу (без изменений файлов в папке. Для отката еще и фалов нужно добавить --hard, как показано ниже)
```
git reset HEAD@{X}
```
Эта команда отменит последний коммит (но не изменения, которые вы внесли, они сохранятся)
```
git reset --soft HEAD^
```
Эта команда отменит последний коммит и изменения, которые были внесены
```
git reset --hard HEAD^
```
Допустим, вы сделали commit в git, но поняли, что он недостаточно хорош. В таком случае можно продолжить правки, а при следующем коммите набрать
(amend — улучшить)
```
git commit -a --amend
```
Если комит был отправлен в репозиторий, а его нужно убрать, то нужно просто удалить кормит так, как было показано выше, а потом силой перезаписать историю:
```
git push origin HEAD:main -f
```
----

## Терминал — команды для навигации
- ls — обзор доступных директорий
- cd <directory>— переход по директориям 
- cd .. — выйти в прошлую директорию
- cat <filename> — посмотреть содержимое файла в строке
- mkdir <filename>— создать папку

## Vi редактор — команды
- esc — перейти в режим команды
- u — отменить последнее действие
- :wq — сохранить и выйти
- :q — выйти без сохранения
- i — начать редактирование
- d — удалить следующий символ

----

# Статьи на тему

- [Официальный короткий туториал](https://guides.github.com/activities/hello-world/)
- [Как пользоваться GitHub-ом (Eng)](https://vk.com/away.php?to=https%3A%2F%2Fproduct.hubspot.com%2Fblog%2Fgit-and-github-tutorial-for-beginners&utf=1)
- [Как пользоваться GitHub-ом (Rus)](https://vk.com/away.php?to=https%3A%2F%2Fmedium.com%2Fnuances-of-programming%2Fзнакомство-с-git-и-github-руководство-для-начинающих-54ea2567d76c&utf=1)
- [Команды (кратко)](https://vk.com/away.php?to=https%3A%2F%2Ftraining.github.com%2Fdownloads%2Fru%2Fgithub-git-cheat-sheet%2F&utf=1)
- [Простой и короткий список основных командр без всякого мусора](https://vk.com/away.php?to=http%3A%2F%2Frogerdudler.github.io%2Fgit-guide%2F&utf=1)
- [Git push и Git pull](https://vk.com/away.php?to=https%3A%2F%2Fwebdevkin.ru%2Fcourses%2Fgit%2Fgit-push-pull&utf=1)
- [В чем разница Git pull и git fetch](https://vk.com/away.php?to=https%3A%2F%2Ftproger.ru%2Fexplain%2Fgit-pull-and-git-fetch-whats-the-difference%2F&utf=1)
- [Введение в Git. От установки до основных команд](https://vk.com/away.php?to=https%3A%2F%2Ftproger.ru%2Ftranslations%2Fbeginner-git-cheatsheet%2F%23part2&utf=1)
- [Use of Git Reset, Git Revert, Git Checkout & Squash Commit](https://vk.com/away.php?to=https%3A%2F%2Fmedium.com%2Fmindorks%2Fuse-of-git-reset-git-revert-git-checkout-squash-commit-2b721ca2d2d3&utf=1)
- [Что находится в .git каталоге](https://vk.com/away.php?to=https%3A%2F%2Fhabr.com%2Fru%2Fcompany%2Fmailru%2Fblog%2F493816%2F&utf=1)
- [Самые частые ошибки/вопросы и их ответы](https://vk.com/away.php?to=https%3A%2F%2Ftproger.ru%2Ftranslations%2Fmost-common-git-screwupsquestions-and-solutions%2F&utf=1)

## Форматирование текста на GitHub

- [Форматирование текста (подчеркивания, буллиты и тд) на гитхабе](https://vk.com/away.php?to=https%3A%2F%2Fdocs.github.com%2Fen%2Ffree-pro-team%40latest%2Fgithub%2Fwriting-on-github%2Fbasic-writing-and-formatting-syntax&utf=1)
- [Как делать таблицы на гитхабе](https://vk.com/away.php?to=https%3A%2F%2Fdocs.github.com%2Fen%2Ffree-pro-team%40latest%2Fgithub%2Fwriting-on-github%2Forganizing-information-with-tables%23further-reading&utf=1)
- [An open source Markdown editor for macOS with live preview](https://macdown.uranusjr.com)

## Официальная документация

- [Документация Git](https://vk.com/away.php?to=https%3A%2F%2Fgit-scm.com%2Fbook%2Fen%2Fv2&utf=1)
- [Документация GitHub](https://vk.com/away.php?to=https%3A%2F%2Fdocs.github.com%2Fen%2Ffree-pro-team%40latest%2Fgithub&utf=1)

## Other
- [An awesome Git/GitHub command line interface by terminal](https://github.com/donnemartin/gitsome)
- [Desktop GitHub (упрощает работу с гитом в разы)](https://vk.com/away.php?to=https%3A%2F%2Fdesktop.github.com&utf=1)
