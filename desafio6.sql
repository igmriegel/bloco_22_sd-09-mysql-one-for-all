CREATE VIEW faturamento_atual AS
    SELECT 
        ROUND(MIN(plans.plan_price), 2) AS faturamento_minimo,
        ROUND(MAX(plans.plan_price), 2) AS faturamento_maximo,
        ROUND(AVG(plans.plan_price), 2) AS faturamento_medio,
        ROUND(SUM(plans.plan_price), 2) AS faturamento_total
    FROM
        SpotifyClone.users AS usr
            INNER JOIN
        SpotifyClone.plans ON usr.plan_id = plans.plan_id;
