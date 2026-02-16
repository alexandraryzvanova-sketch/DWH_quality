-- ВНЕШНИЕ КЛЮЧИ ДЛЯ DM

-- f_winners_top3 → dim_year, dim_team
ALTER TABLE dm.f_winners_top3
ADD CONSTRAINT fk_winners_year
FOREIGN KEY (year_id)
REFERENCES dds.dim_year(year_id);

ALTER TABLE dm.f_winners_top3
ADD CONSTRAINT fk_winners_team
FOREIGN KEY (team_id)
REFERENCES dds.dim_team(team_id);


-- f_team_roster → dim_year, dim_team, dim_player
ALTER TABLE dm.f_team_roster
ADD CONSTRAINT fk_roster_year
FOREIGN KEY (year_id)
REFERENCES dds.dim_year(year_id);

ALTER TABLE dm.f_team_roster
ADD CONSTRAINT fk_roster_team
FOREIGN KEY (team_id)
REFERENCES dds.dim_team(team_id);

ALTER TABLE dm.f_team_roster
ADD CONSTRAINT fk_roster_player
FOREIGN KEY (player_id)
REFERENCES dds.dim_player(player_id);


-- f_hero_picks → dim_year, dim_hero
ALTER TABLE dm.f_hero_picks
ADD CONSTRAINT fk_hero_year
FOREIGN KEY (year_id)
REFERENCES dds.dim_year(year_id);

ALTER TABLE dm.f_hero_picks
ADD CONSTRAINT fk_hero_hero
FOREIGN KEY (hero_id)
REFERENCES dds.dim_hero(hero_id);


-- f_player_country → dim_year, dim_player, dim_country
ALTER TABLE dm.f_player_country
ADD CONSTRAINT fk_player_country_year
FOREIGN KEY (year_id)
REFERENCES dds.dim_year(year_id);

ALTER TABLE dm.f_player_country
ADD CONSTRAINT fk_player_country_player
FOREIGN KEY (player_id)
REFERENCES dds.dim_player(player_id);

ALTER TABLE dm.f_player_country
ADD CONSTRAINT fk_player_country_country
FOREIGN KEY (country_id)
REFERENCES dds.dim_country(country_id);

