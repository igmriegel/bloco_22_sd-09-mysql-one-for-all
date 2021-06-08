CREATE VIEW cancoes_premium AS
SELECT 
    m.music AS 'nome',
    COUNT(*) AS 'reproducoes'
FROM
    SpotifyClone.reprodution_history AS h
    LEFT JOIN SpotifyClone.users AS j
        ON h.user_id = j.user_id
    LEFT JOIN SpotifyClone.plans AS p
        ON j.plan_id = p.plan_id
    LEFT JOIN SpotifyClone.musics AS m
        ON h.music_id = m.music_id
    WHERE p.plan IN ('familiar', 'universitário')
GROUP BY `nome`
ORDER BY `nome`;