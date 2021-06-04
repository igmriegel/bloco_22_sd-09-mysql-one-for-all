USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(50))
BEGIN
	SELECT 
        a.artist AS 'artista',
        alb.album AS 'album'
    FROM
        SpotifyClone.artists AS a
            JOIN
        SpotifyClone.albuns AS alb ON a.artist_id = alb.artist_id
	WHERE a.artist LIKE CONCAT('%', artist, '%')
    ORDER BY `album` ASC;
END $$

DELIMITER ;