create schema if not exists dds;

--Измерение ГОД

create table if not exists dds.dim_year (
    year_id serial primary key,
    year int unique not null
);


--Измерение КОМАНДА

create table if not exists dds.dim_team (
    team_id serial primary key,
    team_name text unique not null
);


--Измерение ИГРОК

create table if not exists dds.dim_player (
    player_id serial primary key,
    player_name text unique not null
);


--Измерение СТРАНА

create table if not exists dds.dim_country (
    country_id serial primary key,
    country text unique not null
);


--Измерение ГЕРОЙ

create table if not exists dds.dim_hero (
    hero_id serial primary key,
    hero text unique not null
);
