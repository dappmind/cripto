Как развернуть
==============

(если не под `root`, выполняем через `sudo`)
1. Запускаем сборку контейнера командой `docker-compose up -d --build`
2. Запускаем контейнер `docker-compose start`
3. Останавливаем контейнер `docker-compose stop`

- Установка docker (например debian): https://docs.docker.com/install/linux/docker-ce/debian/
- Установка docker-compose (требуется docker): https://docs.docker.com/compose/install/

Разворачиваем дамп БД:
==============
1. Меняем домен в файле `docker/run.sh` (4-я строка: `... domain='<Ваш_домен>'`)
2. Даём право на запуск скрипта `chmod +x ./docker/run.sh`
3. Разворачиваем базу данных `./docker/run.sh`