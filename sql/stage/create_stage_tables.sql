create schema if not exists stage;

create table if not exists stage.winners_raw (
    year int,
    place int,
    team_name text,
    prize_usd numeric,
    prize_percent numeric
);

create table if not exists stage.teams_raw (
    player_name text,
    team_name text,
    year int,
    role text
);

create table if not exists stage.country_raw (
    player_name text,
    country text,
    year int
);

create table if not exists stage.hero_picks_raw (
    hero text,
    times_picked int,
    year int
);
