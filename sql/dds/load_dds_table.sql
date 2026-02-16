-- FULL RELOAD DDS (идемпотентная загрузка)

truncate table dds.dim_year restart identity cascade;
truncate table dds.dim_team restart identity cascade;
truncate table dds.dim_player restart identity cascade;
truncate table dds.dim_country restart identity cascade;
truncate table dds.dim_hero restart identity cascade;

-- LOAD DIMENSIONS

-- YEAR
insert into dds.dim_year (year)
select year from (
    select distinct year from stage.winners_raw
    union
    select distinct year from stage.teams_raw
    union
    select distinct year from stage.country_raw
    union
    select distinct year from stage.hero_picks_raw
) as all_years
order by year asc;

-- TEAM
insert into dds.dim_team (team_name)
select team_name from (
    select distinct team_name from stage.winners_raw
    union
    select distinct team_name from stage.teams_raw
) as all_teams
order by team_name ASC;

-- PLAYER
insert into dds.dim_player (player_name)
select player_name from (
    select distinct player_name from stage.teams_raw
) as all_players
order by player_name ASC;

-- COUNTRY
insert into dds.dim_country (country_name)
select country from (
    select distinct country from stage.country_raw
) as all_countries
order by country ASC;

-- HERO
insert into dds.dim_hero (hero_name)
select hero from (
    select distinct hero from stage.hero_picks_raw
) as all_heroes
order by hero ASC;
