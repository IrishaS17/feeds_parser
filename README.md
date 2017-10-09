## Описание
Скрипт парсит новости формата rss и atom, а также статьи с сайта irish-blog.herokuapp.com

На выходе возвращает массив элементов — новостей или статей в формате JSON. 

Примеры ссылок:

-------------atom-----------------
http://fletcherpenney.net/atom.xml
http://www.pauldix.net/atom.xml
-------------rss------------------
http://megacat.by/rss-45
https://news.tut.by/rss/index.rss
-----------IrishBlog--------------
https://irish-blog.herokuapp.com/by/posts
-----------facebook---------------
https://fbrss.com/feed/a03c631ac78f5cd42de3ac30acd43ed0d7ad5c94_309880712466330.atom
https://fbrss.com/feed/a03c631ac78f5cd42de3ac30acd43ed0d7ad5c94_309880712466330.xml

## Запуск
На вход получает ссылку
```
$ ruby run.rb https://news.tut.by/rss/index.rss
```
