-- Частота попадания в топ3

SELECT
    dt.team_name,
    COUNT(*) AS top3_appearances
FROM dm.f_winners_top3 f
JOIN dds.dim_team dt ON dt.team_id = f.team_id
GROUP BY dt.team_name
ORDER BY top3_appearances DESC;
