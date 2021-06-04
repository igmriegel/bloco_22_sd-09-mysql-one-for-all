CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        usr.user_name AS 'usuario', m.music AS 'nome'
    FROM
        SpotifyClone.reprodution_history AS hist
            INNER JOIN
        SpotifyClone.users AS usr ON hist.user_id = usr.user_id
            INNER JOIN
        SpotifyClone.musics AS m ON hist.music_id = m.music_id
    ORDER BY usr.user_name , m.music ASC; 
