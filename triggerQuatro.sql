CREATE TRIGGER calcula_media_pontuacao AFTER INSERT ON joga
FOR EACH ROW
BEGIN
    DECLARE total_pontos INT;
    DECLARE total_jogadas INT;

    SELECT SUM(ponto), COUNT(*) INTO total_pontos, total_jogadas
    FROM joga
    WHERE idjogo = NEW.id;

    UPDATE jogo
    SET media_pontuacao = total_pontos / total_jogadas
    WHERE id = NEW.id;
END;