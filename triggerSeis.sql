CREATE TRIGGER atualiza_ranking AFTER INSERT ON joga
FOR EACH ROW
BEGIN
    INSERT INTO ranking (id_usuario, id_jogo, pontuacao)
    VALUES (NEW.id_usuario, NEW.id_jogo, NEW.pontuacao);
END;