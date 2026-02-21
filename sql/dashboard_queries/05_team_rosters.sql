-- team_rosters_by_player.sql
-- Каждый игрок в команде-победителе с указанием страны

SELECT
    y.year,
    t.team_name,
    p.player_name,
    c.country_name
FROM dm.f_winners_top3 w
JOIN dm.f_team_roster r ON w.year_id = r.year_id AND w.team_id = r.team_id
JOIN dds.dim_year y ON w.year_id = y.year_id
JOIN dds.dim_team t ON w.team_id = t.team_id
JOIN dds.dim_player p ON r.player_id = p.player_id
LEFT JOIN dm.f_player_country pc ON p.player_id = pc.player_id AND w.year_id = pc.year_id
LEFT JOIN dds.dim_country c ON pc.country_id = c.country_id
WHERE w.place = '1' AND r.role = 'player'
ORDER BY y.year, t.team_name, p.player_name;
