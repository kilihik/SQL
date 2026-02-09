#  Методы REST API (HTTP-методы)
---
| HTTP-метод | Описание | Аналог в SQL | Идемпотентность | Безопасность | Пример c (user) |
| :---: | :---: | :---: | :---: | :---: | :---:|
| GET |   Получить   ресурс или список ресурсов. | SELECT | Да | Да | GET /user()  - Получить список всех пользователей.<br>GET /user/123 - Получить пользователя с ID=123.  |
| POST |   Создать   новый ресурс. Тело запроса содержит данные. | INSERT | Нет | Нет | POST /user - Создать нового пользователя (тело запроса содержит данные пользователя).|
| PUT |   Полностью обновить   существующий ресурс. Или создать, если его нет. | UPDATE (или INSERT) | Да | Нет | PUT /user/123 - Обновить ВСЕ данные пользователя с ID=123. |
| PATCH |   Частично обновить   существующий ресурс. | UPDATE (только указанные поля) | Нет | Нет |PATCH /user/123 - Обменить только email пользователя с ID=123. |
| DELETE |   Удалить   ресурс. | DELETE | Да | Нет | DELETE /user/123 - Удалить пользователя с ID=123. |
---
# Преимущества JSON над XML и YAML

| Характеристика | JSON | XML | YAML |
| :--- | :--- | :--- | :--- |
|   Читаемость   | Хорошая | Низкая (из-за тегов) |   Очень высокая   (ориентирован на человека) |
|   Размер   |   Компактный   | Громоздкий (закрывающие теги) | Компактный (без скобок/кавычек) |
|   Скорость   |   Быстрая   парсинг/сериализация | Медленная | Медленнее JSON |
|   Простота   |   Очень простая   структура | Сложная (пространства имен, схемы) | Средняя (важен отступ) |
|   Основное применение   |   Передача данных   в Web-API | Сложные документы (HTML, SVG), конфиги |   Конфигурационные файлы   (Docker Compose, CI/CD) |

---
# JSON Schema

| Описание | Припер |
| :----: | :----: |
| JSON Schema — это язык описания структуры и валидации JSON-документов.<br> Это мощный инструмент для: | - Валидации данных<br>- Документирования API<br>- Тестирования структур данных<br>- Обеспечения консистентности данных |
| Минимальная валидная схема | {<br>"$schema": "https://json-schema.org/draft/2020-12/schema",<br>  "$id": "https://example.com/schema.json",<br>  "title": "Product",<br>  "description": "Схема для описания товара",<br>  "type": "object"<br>} |
| Валидация строк | {<br>  "type": "string",<br>  "minLength": 2,<br>  "maxLength": 100,<br>  "pattern": "^[A-Za-z ]+$",<br>  "format": "email"<br>} |
|  Валидация чисел | {<br>  "type": "number",<br>  "minimum": 0,<br>  "maximum": 100,<br>  "exclusiveMinimum": 0,<br>  "exclusiveMaximum": 100,<br>  "multipleOf": 0.5<br>} |
|Валидация массивов |{<br>  "type": "array",<br>  "items": {<br>  "type": "string"<br>  },<br>  "minItems": 1,<br>  "maxItems": 10,<br>  "uniqueItems": true<br>} |
---
# Детализация процессов сериализации/десериализации

| Процесс | Определение | Когда используется | Пример (Python) | Пример (JavaScript) | Результат | Особенности |
|---------|-------------|-------------------|-----------------|---------------------|-----------|-------------|
|   Сериализация   | Преобразование объекта языка программирования в JSON-строку | При отправке данных в API (POST, PUT запросы), сохранении в localStorage | python<br>import json<br>data = {"id": 123, "name": "Alice"}<br>json_str = json.dumps(data)<br> | javascript<br>const data = {id: 123, name: "Alice"};<br>const jsonStr = JSON.stringify(data);<br> | {"id": 123, "name": "Alice"} | Подготовка данных для передачи или хранения |
|   Десериализация   | Преобразование JSON-строки в объект языка программирования | При получении данных от API (GET запросы), чтении из localStorage | python<br>import json<br>json_str = '{"id": 456, "name": "Bob"}'<br>data = json.loads(json_str)<br> | javascript<br>const jsonStr = '{"id": 456, "name": "Bob"}';<br>const data = JSON.parse(jsonStr);<br>| {"id": 456, "name": "Bob"} (объект/словарь) | Разбор полученных данных для работы в программе |
---

# Сравнительная таблица: Postman Echo API vs Ozon Seller API

| Критерий | Postman Echo API | Ozon Seller API |
| :--- | :--- | :--- |
|  Ссылка на документацию  | [https://postman-echo.com](https://postman-echo.com) | [https://docs.ozon.ru/api/seller/](https://docs.ozon.ru/api/seller/) |
|  Назначение  | Тестовое API для отладки и обучения: возвращает отправленные данные, эмулирует различные HTTP-методы и статусы. | Интеграция с маркетплейсом Ozon для продавцов: управление товарами, заказами, ценами, акциями в рамках правил Ozon. |
|  Эндпоинты и основные методы  | Универсальные эндпоинты для тестирования:<br>- GET `/get` - тестирование GET запросов<br>- POST `/post` - тестирование POST запросов<br>- PUT `/put` - тестирование PUT запросов<br>- DELETE `/delete` - тестирование DELETE запросов<br>Методы: Поддерживает все основные HTTP методы. | Сфокусированы на операциях продавца:<br>- POST `/v2/product/list` - список товаров<br>- POST `/v2/products` - создание/обновление товаров<br>- POST `/v2/order/list` - список заказов<br>- POST `/v3/order/accept` - подтверждение заказа<br>Методы: В основном POST, даже для получения данных. |
|  Формы запроса и ответа  |  Запрос:  Любые параметры (query params, headers, body)<br> Ответ:  JSON структура, содержащая отправленные данные, headers, аргументы и информацию о запросе. Простая и предсказуемая структура. |  Запрос:  Тело запроса всегда в формате JSON. Строгая структура, определенная Ozon.<br> Ответ:  JSON. Содержит вложенные данные о товарах, заказах. Часто требует пагинации. |
|  Авторизация и аутентификация  |  Отсутствует <br>- Не требует аутентификации<br>- Открытый доступ для тестирования<br>- Идеально для обучения и отладки |  API-Key + Client-ID <br>- `Client-Id` и `Api-Key` передаются в заголовках<br>- Ключи генерируются в личном кабинете продавца<br>- Доступ привязан к конкретному аккаунту продавца |
|  Версия API  |  Без версионности <br>- Стабильный интерфейс<br>- Постоянно доступен<br>- Не требует обновлений |  Версионность через URL <br>- Версия указывается в пути эндпоинта (`/v2/`, `/v3/`, `/v4/`)<br>- Пример: `/v2/product/list`<br>- Одновременно доступны несколько версий |
|  Подход к дизайну (REST)  |  RESTful для тестирования <br>- Четкое соответствие HTTP методам<br>- Эндпоинты соответствуют методам (`/get`, `/post`, etc.)<br>- Возвращает метаданные о запросе<br>- Идеален для изучения REST принципов |  REST-like (RPC-стиль) <br>- Часто использует POST для всех операций, даже для получения данных<br>- Эндпоинты называются как действия (`/product/list`)<br>- Ресурсы четко определены платформой |
|  Провайдер и бизнес-модель  |  Провайдер:  Postman (инструменты для разработки API)<br> Бизнес-модель:  Бесплатная услуга для сообщества разработчиков. Помогает в тестировании и обучении работе с API. |  Провайдер:  Ozon (маркетплейс)<br> Бизнес-модель:  Продавец арендует "витрину" на площадке. API — это инструмент для эффективной работы в рамках правил Ozon. Лимиты на запросы строгие. |

---

### Пример JSON-запроса для GET метода

 Запрос: 
```http
GET https://postman-echo.com/get?foo=bar&name=John
```

 Ответ: 
```json
{
  "args": {
    "foo": "bar",
    "name": "John"
  },
  "headers": {
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "postman-echo.com",
    "user-agent": "PostmanRuntime/7.32.3",
    "accept": "*/*",
    "accept-encoding": "gzip, deflate, br"
  },
  "url": "https://postman-echo.com/get?foo=bar&name=John"
}
```

### Пример JSON-запроса для POST метода

 Запрос: 
```http
POST https://postman-echo.com/post
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "age": 30
}
```

 Ответ: 
```json
{
  "args": {},
  "data": {
    "name": "John Doe",
    "email": "john@example.com",
    "age": 30
  },
  "files": {},
  "form": {},
  "headers": {
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "postman-echo.com",
    "content-length": "65",
    "user-agent": "PostmanRuntime/7.32.3",
    "accept": "*/*",
    "content-type": "application/json",
    "accept-encoding": "gzip, deflate, br"
  },
  "json": {
    "name": "John Doe",
    "email": "john@example.com",
    "age": 30
  },
  "url": "https://postman-echo.com/post"
}
```

### Анализ структуры JSON Postman Echo API: ключи и типы данных

#### Основная структура ответа:
| Ключ | Тип данных | Описание |
|------|------------|-----------|
|  args  | object | Параметры query string из URL |
|  headers  | object | Заголовки HTTP запроса |
|  url  | string | Полный URL запроса |
|  data  | string/object | Тело запроса в сыром виде |
|  json  | object | Тело запроса, распарсенное как JSON |
|  files  | object | Загруженные файлы (для multipart/form-data) |
|  form  | object | Данные формы (для application/x-www-form-urlencoded) |

#### Объект args (query parameters):
| Ключ | Тип данных | Описание |
|------|------------|-----------|
|  args.* | string | Динамические ключи, соответствующие query параметрам |

#### Объект headers:
| Ключ | Тип данных | Описание |
|------|------------|-----------|
|  headers.host  | string | Хост запроса |
|  headers.user-agent  | string | Информация о клиенте |
|  headers.accept  | string | Accept-заголовок |
|  headers.content-type  | string | Тип содержимого (для POST/PUT) |
|  headers.content-length  | string | Длина содержимого |
