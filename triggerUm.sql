CREATE TRIGGER registro_login AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO log_login (id_usuario, data_hora_login)
    VALUES (NEW.id, NOW());
END;