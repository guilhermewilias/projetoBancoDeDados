CREATE PROCEDURE atualizar_nome_usuario(
    IN p_id INT,
    IN p_novo_nome VARCHAR(200)
)
BEGIN
    UPDATE usuario
    SET nome = p_novo_nome
    WHERE id = p_id;
END;