# docker-chef-mysql
Required files and explanation to provision docker image with chef-solo using custom cookbooks

For extended documentation read:
[http://www.what2web.com/building-nginx-cookbook-in-dockerized-container](http://www.what2web.com/building-nginx-cookbook-in-dockerized-container)

Published on:
https://hub.docker.com/r/majdarbash/mysql/

On your local machine try:
> docker build -t majdarbash/mysql .

> docker run -p 3306:3306 -d majdarbash/mysql

> docker run --name ma_testdb -p 3306:3306 -d majdarbash/mysql

> docker pull majdarbash/mysql
