create schema if not exists dm;

-- Факт победителей
create table if not exists dm.f_winners_top3 (
    year_id int not null,
    team_id int not null,
    place varchar(10),
    prize_usd numeric,
    prize_percent numeric,
    primary key (year_id, team_id, place)
);

-- Факт состава команд
create table if not exists dm.f_team_roster (
    year_id int not null,
    team_id int not null,
    player_id int not null,
    role text
);

-- Факт пиков героев
create table if not exists dm.f_hero_picks (
    year_id int not null,
    hero_id int not null,
    times_picked int
);

-- Факт игрок-страна
create table if not exists dm.f_player_country (
    year_id int not null,
    player_id int not null,
    country_id int not null
);
