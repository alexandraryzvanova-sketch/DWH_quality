-- country_earnings.sql
-- Сколько заработали игроки из каждой страны

WITH player_earnings AS (
    SELECT
        pc.country_id,
        (w.prize_usd / 5) AS player_share
    FROM dm.f_winners_top3 w
    JOIN dm.f_team_roster r ON w.year_id = r.year_id AND w.team_id = r.team_id
    JOIN dm.f_player_country pc ON r.player_id = pc.player_id AND w.year_id = pc.year_id
    WHERE r.role = 'player'  -- только игроки, не тренеры
)
SELECT
    c.country_name,
    SUM(player_share) AS total_prize_usd
FROM player_earnings pe
JOIN dds.dim_country c ON pe.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_prize_usd DESC;
