CREATE PROCEDURE verificar_email_cadastrado(
    IN p_email VARCHAR(200),
    OUT p_existe BOOLEAN
)
BEGIN
    DECLARE num_emails INT;
    
    SELECT COUNT(*) INTO num_emails
    FROM usuario
    WHERE email = p_email;
    
    IF num_emails > 0 THEN
        SET p_existe = TRUE;
    ELSE
        SET p_existe = FALSE;
    END IF;
END;