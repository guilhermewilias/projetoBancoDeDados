CREATE PROCEDURE listar_usuarios()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_id INT;
    DECLARE user_tipo VARCHAR(200);
    DECLARE user_email VARCHAR(200);
    DECLARE user_nome VARCHAR(200);
    DECLARE cur CURSOR FOR SELECT id, tipo, email, nome FROM usuario;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO user_id, user_tipo, user_email, user_nome;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Utilize as variáveis do usuário como desejar, por exemplo, mostrando ou processando-as.
        SELECT user_id, user_tipo, user_email, user_nome;
    END LOOP;

    CLOSE cur;
END;