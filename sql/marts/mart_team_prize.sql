-- Динамика доходов команд

SELECT
    dy.year,
    dt.team_name,
    SUM(f.prize_usd) AS total_prize_usd
FROM dm.f_winners_top3 f
JOIN dds.dim_team dt   ON dt.team_id = f.team_id
JOIN dds.dim_year dy   ON dy.year_id = f.year_id
GROUP BY dy.year, dt.team_name
ORDER BY total_prize_usd DESC;
