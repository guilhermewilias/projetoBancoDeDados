CREATE PROCEDURE calcular_media_pontuacao_jogo()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE jogo_id INT;
    DECLARE media_pontuacao FLOAT;
    DECLARE cur CURSOR FOR SELECT id, AVG(ponto) FROM joga GROUP BY id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    CREATE TEMPORARY TABLE IF NOT EXISTS media_pontuacao_jogo_temp (
        id_jogo INT,
        media_pontuacao FLOAT
    );

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO jogo_id, media_pontuacao;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO media_pontuacao_jogo_temp (id_jogo, media_pontuacao) VALUES (jogo_id, media_pontuacao);
    END LOOP;

    CLOSE cur;

    -- Agora você pode usar a tabela temporária 'media_pontuacao_jogo_temp' conforme necessário.
END;