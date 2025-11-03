# Dev Stack

Простий стек для розробки з MySQL, Redis та Traefik.

## Сервіси

- **Traefik** - Reverse proxy + dashboard
- **MySQL 8.0** - База даних
- **Redis 7** - Кеш

## Швидкий старт

```bash
cp .env.example .env
./start.sh
```

## Команди

```bash
./start.sh   # Запустити всі сервіси
./stop.sh    # Зупинити сервіси
./status.sh  # Статус сервісів
./logs.sh    # Переглянути логи
./backup.sh  # Бекап MySQL
./clean.sh   # Зупинити + видалити всі дані
```

## Доступ до сервісів

| Сервіс | URL/Порт | Логін | Пароль |
|--------|----------|-------|--------|
| Traefik Dashboard | http://localhost:8080 | - | - |
| MySQL | localhost:3311 | admin | admin |
| Redis | localhost:6379 | - | - |

## Налаштування

Змініть порти та паролі в `.env` файлі:

```bash
MYSQL_PORT=3311
REDIS_PORT=6379
TRAEFIK_PORT=8080
MYSQL_PASSWORD=admin
```

## Бекапи

Бекапи MySQL зберігаються в папці `dump/` з датою:
```bash
./backup.sh  # Створює dump/backup_20231201_143022.sql
```

## Підключення додатків

### Docker Compose для вашого додатку

```yaml
services:
  app:
    build: .
    container_name: my-app
    labels:
      - traefik.enable=true
      - "traefik.http.routers.my-app.rule=Host(`app.localhost`)"
    ports:
      - '81:80'
    networks:
      - app-network

networks:
  app-network:
    name: app-network
    external: true
```

### Підключення до баз даних

**MySQL:**
```bash
Host: db_mysql
Port: 3306
User: admin
Password: admin
Database: app_db
```

**Redis:**
```bash
Host: redis
Port: 6379
```

**Приклад для Laravel (.env):**
```bash
DB_CONNECTION=mysql
DB_HOST=db_mysql
DB_PORT=3306
DB_DATABASE=app_db
DB_USERNAME=admin
DB_PASSWORD=admin

REDIS_HOST=redis
REDIS_PORT=6379
```