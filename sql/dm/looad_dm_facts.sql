--  LOAD DM FACTS (идемпотентная загрузка)

-- Очищаем таблицы фактов перед загрузкой
truncate table dm.f_winners_top3 restart identity cascade;
truncate table dm.f_team_roster restart identity cascade;
truncate table dm.f_hero_picks restart identity cascade;
truncate table dm.f_player_country restart identity cascade;

-- f_winners_top3
-- Гранулярность: год + место, ключи: year_id, team_id

insert into dm.f_winners_top3 (year_id, team_id, place, prize_usd, prize_percent)
select 
    y.year_id,
    t.team_id,
    s.place,
    s.prize_usd,
    s.prize_percent
from stage.winners_raw s
join dds.dim_year y on s.year = y.year
join dds.dim_team t on s.team_name = t.team_name;

-- f_team_roster
-- Гранулярность: год + команда + игрок, ключи: year_id, team_id, player_id

insert into dm.f_team_roster (year_id, team_id, player_id, role)
select
    y.year_id,
    t.team_id,
    p.player_id,
    s.role
from stage.teams_raw s
join dds.dim_year y on s.year = y.year
join dds.dim_team t on s.team_name = t.team_name
join dds.dim_player p on s.player_name = p.player_name;

-- f_hero_picks
-- Гранулярность: год + герой, ключи: year_id, hero_id

insert into dm.f_hero_picks (year_id, hero_id, times_picked)
select
    y.year_id,
    h.hero_id,
    s.times_picked
from stage.hero_picks_raw s
join dds.dim_year y on s.year = y.year
join dds.dim_hero h on s.hero = h.hero_name;


-- f_player_country
-- Гранулярность: год + игрок, ключи: year_id, player_id, country_id

insert into dm.f_player_country (year_id, player_id, country_id)
select
    y.year_id,
    p.player_id,
    c.country_id
from stage.country_raw s
join dds.dim_year y on s.year = y.year
join dds.dim_player p on s.player_name = p.player_name
join dds.dim_country c on s.country = c.country_name;
