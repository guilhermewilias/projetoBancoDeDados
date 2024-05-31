CREATE PROCEDURE calcular_media_pontuacao_jogo(
    IN p_id_jogo INT,
    OUT p_media_pontuacao FLOAT
)
BEGIN
    SELECT AVG(ponto) INTO p_media_pontuacao
    FROM joga
    WHERE id = p_id_jogo;
END;