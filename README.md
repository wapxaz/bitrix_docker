# 1С-Bitrix + Docker ( MySQL + PHP + Nginx + Apache + phpMyAdmin )

![1c_bitrix_logo.svg.png](info%2Fimg%2F1c_bitrix_logo.svg.png)

Готовая среда для разработки под битрикс, поднимается за 5 минут через докер.

# По умолчанию настроены
* php - 7.4.33 (поменять версию можно в docker-compose.yml, хранятся они в папке dockerfiles)
* mysql - 5.7
* nginx - stable-alpine
* apache - httpd:2.4
* phpmyadmin - 5.2

# Порядок установки

1. Проверить наличие .env , если его нет, то скопировать из .env_example в .env
2. В .env настроить параметры MySQL
   * Настроить название проекта (APP_NAME)
   * Настроить параметры MySQL
   * Настроить порты
3. Из корневой папки запустить команду `docker compose up --build` (ключ --build для пересборки)
4. Открыть страницу по адресу http://localhost
   Настроить проект (Описание настройки базы данных описано ниже)

5. Из корневой папки запустить команды
   - `sudo chmod -R 777 src` (Меняет права доступа папки /src)
   - `sudo chmod -R 777 dbdata` (Меняет права доступа папки /dbdata)
   
6. Файлы проекта размещать в /src/public (это конревая папка)

**Всё готово**

# Ссылки

**Главная страница:** http://localhost

**phpMyAdmin:** http://localhost:8001/

# MySQL

![logo-mysql.png](info%2Fimg%2Flogo-mysql.png)

В локальной системе порт 3316, в контейнерах 3306

Имя хоста такое же, как у контейнера (`mysql`)

Настройка базы данных

![db-settings.png](info%2Fimg%2Fdb-settings.png)

---

# Команды

## Docker-compose

### Запустить

`docker-compose up -d`

`-d` - запуск, чтобы пользоваться консолью


### Запустить только контейнер nginx

`docker-compose up -d nginx`

### Остановить

Просто остановить

`docker-compose down`

Остановить и удалить

`docker-compose down -v`

### Логи

`docker-compose logs mysql`

### Изменять права доступа для проекта на текущего пользователя в текущей папки

`chown -R $USER:$USER .`

### Изменить права доступа для папки src в проекте

`chmod -R 777 src`

### xdebug
xdebug - не донастроен(не отрабатывают брейкпоинты), как будет время доразобраться и выгрузить в гит