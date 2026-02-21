-- Команды самые успешные в истории
SELECT 
    t.team_name,
    COUNT(*) AS top3_count,
    SUM(w.prize_usd) AS total_prize_usd
FROM dm.f_winners_top3 w
JOIN dds.dim_team t ON w.team_id = t.team_id
GROUP BY t.team_name
ORDER BY top3_count DESC, total_prize_usd DESC;
