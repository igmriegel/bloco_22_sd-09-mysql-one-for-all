DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usr_id INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE quantity_musics INT;
    SELECT 
        COUNT(*)
    FROM
        SpotifyClone.reprodution_history AS h
            LEFT JOIN
        SpotifyClone.users AS u ON h.user_id = u.user_id
    WHERE
        u.user_id = usr_id INTO quantity_musics;
    RETURN quantity_musics;
END $$

DELIMITER ;
