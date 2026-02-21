-- prize_dynamics.sql
-- Суммарные призовые по годам (все призовые места)

SELECT 
    y.year,
    SUM(w.prize_usd) AS total_prize_usd
FROM dm.f_winners_top3 w
JOIN dds.dim_year y ON w.year_id = y.year_id
GROUP BY y.year
ORDER BY y.year;
