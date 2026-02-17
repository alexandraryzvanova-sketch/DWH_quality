-- Топ самых заработавших игроков по странам

SELECT
    dp.player_name,
    dc.country,
    SUM(f.prize_usd / 5.0) AS estimated_income
FROM dm.f_winners_top3 f
JOIN dm.f_team_roster r   ON r.team_id = f.team_id AND r.year_id = f.year_id
JOIN dm.f_player_country pc ON pc.player_id = r.player_id AND pc.year_id = r.year_id
JOIN dds.dim_player dp ON dp.player_id = r.player_id
JOIN dds.dim_country dc ON dc.country_id = pc.country_id
GROUP BY dp.player_name, dc.country
ORDER BY estimated_income DESC;
