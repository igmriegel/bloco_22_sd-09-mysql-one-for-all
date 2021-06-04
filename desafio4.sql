CREATE VIEW top_3_artistas AS
    SELECT 
        a.artist AS 'artista', COUNT(fllw.user_id) AS 'seguidores'
    FROM
        SpotifyClone.followed_artists AS fllw
            INNER JOIN
        SpotifyClone.artists AS a ON fllw.artist_id = a.artist_id
    GROUP BY `artista`
    ORDER BY `seguidores` DESC , `artista` ASC
    LIMIT 3;
