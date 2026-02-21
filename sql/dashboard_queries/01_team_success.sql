-- team_success_combined.sql
-- Три метрики успешности команд в одном запросе
SELECT 
    t.team_name,
    COUNT(CASE WHEN w.place = '1' THEN 1 END) AS wins,
    COUNT(*) AS top3_appearances,
    SUM(w.prize_usd) AS total_prize_usd
FROM dm.f_winners_top3 w
JOIN dds.dim_team t ON w.team_id = t.team_id
GROUP BY t.team_name
ORDER BY wins DESC, top3_appearances DESC, total_prize_usd DESC;

