CREATE PROCEDURE inserir_usuario(
    IN p_tipo VARCHAR(200),
    IN p_email VARCHAR(200),
    IN p_senha VARCHAR(200),
    IN p_nome VARCHAR(200)
)
BEGIN
    INSERT INTO usuario (tipo, email, senha, nome)
    VALUES (p_tipo, p_email, p_senha, p_nome);
END;