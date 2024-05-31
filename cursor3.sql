CREATE PROCEDURE listar_jogos_pontuacoes()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE jogo_id INT;
    DECLARE jogo_nome VARCHAR(200);
    DECLARE pontuacao INT;
    DECLARE cur CURSOR FOR SELECT jogo.id, jogo.nome, joga.ponto FROM jogo INNER JOIN joga ON jogo.id = joga.idjogo;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO jogo_id, jogo_nome, pontuacao;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Utilize as variáveis do jogo como desejar, por exemplo, mostrando ou processando-as.
        SELECT jogo_id, jogo_nome, pontuacao;
    END LOOP;

    CLOSE cur;
END;