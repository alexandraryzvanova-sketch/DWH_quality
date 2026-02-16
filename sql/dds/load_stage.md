Загрузка данных в STAGE слой

Данные загружаются из подготовленных CSV (слой data/processed).

Так как PostgreSQL COPY читает файлы только с сервера, загрузка выполняется через клиент DBeaver.

Шаги загрузки

Для каждой таблицы выполнить:
 1. Открыть DBeaver
 2. Перейти в схему:

Database → Schemas → stage → Tables

 3. Выбрать таблицу (например winners_raw)
 4. Нажать ПКМ → Import Data
 5. Выбрать формат CSV
 6. Указать файл из папки проекта:

data/processed/winners_top3.csv

 7. Проверить настройки:
 Delimiter: ,
 Header: +
 Encoding: UTF-8
 8. Finish

Загружаемые соответствия

Таблица stage Файл processed
stage.winners_raw winners_top3.csv
stage.teams_raw teams.csv
stage.country_raw country.csv
stage.hero_picks_raw hero_picks.csv

После загрузки проверить:

select count(*) from stage.winners_raw;

STAGE слой хранит данные без трансформаций и используется как источник для DDS.
