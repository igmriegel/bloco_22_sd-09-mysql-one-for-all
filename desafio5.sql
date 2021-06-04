CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        m.music AS 'cancao', COUNT(hist.user_id) AS 'reproducoes'
    FROM
        SpotifyClone.reprodution_history AS hist
            INNER JOIN
        SpotifyClone.musics AS m ON hist.music_id = m.music_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC , `cancao` ASC
    LIMIT 2;