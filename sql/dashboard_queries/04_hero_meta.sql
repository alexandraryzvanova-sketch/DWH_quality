-- hero_meta.sql
-- Топ-5 самых популярных героев в каждом году

WITH hero_picks AS (
    SELECT
        y.year,
        h.hero_name,
        SUM(f.times_picked) AS picks
    FROM dm.f_hero_picks f
    JOIN dds.dim_hero h ON f.hero_id = h.hero_id
    JOIN dds.dim_year y ON f.year_id = y.year_id
    GROUP BY y.year, h.hero_name
),
ranked_heroes AS (
    SELECT
        year,
        hero_name,
        picks,
        ROW_NUMBER() OVER (PARTITION BY year ORDER BY picks DESC) AS rank
    FROM hero_picks
)
SELECT 
    year,
    hero_name,
    picks,
    rank
FROM ranked_heroes
WHERE rank <= 5  -- только топ-5
ORDER BY year, rank;
