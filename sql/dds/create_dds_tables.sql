create schema if not exists dds;

-- Измерение: годы
create table if not exists dds.dim_year (
    year_id serial primary key,
    year int unique
);

-- Измерение: команды
create table if not exists dds.dim_team (
    team_id serial primary key,
    team_name text unique
);

-- Измерение: игроки
create table if not exists dds.dim_player (
    player_id serial primary key,
    player_name text unique
);

-- Измерение: страны
create table if not exists dds.dim_country (
    country_id serial primary key,
    country_name text unique
);

-- Измерение: герои
create table if not exists dds.dim_hero (
    hero_id serial primary key,
    hero_name text unique
);
