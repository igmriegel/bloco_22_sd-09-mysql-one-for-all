CREATE VIEW perfil_artistas AS
    SELECT 
        a.artist AS 'artista',
        alb.album AS 'album',
        COUNT(fllw.user_id) AS 'seguidores'
    FROM
        SpotifyClone.artists AS a
            JOIN
        SpotifyClone.followed_artists AS fllw ON a.artist_id = fllw.artist_id
            JOIN
        SpotifyClone.albuns AS alb ON a.artist_id = alb.artist_id
    GROUP BY `album` , `artista`
    ORDER BY `seguidores` DESC , `artista` ASC;
