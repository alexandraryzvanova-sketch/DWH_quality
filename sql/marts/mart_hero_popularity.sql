-- Популярность героев

SELECT
    dy.year,
    dh.hero,
    SUM(f.times_picked) AS picks
FROM dm.f_hero_picks f
JOIN dds.dim_hero dh ON dh.hero_id = f.hero_id
JOIN dds.dim_year dy ON dy.year_id = f.year_id
GROUP BY dy.year, dh.hero
ORDER BY dy.year, picks DESC;
