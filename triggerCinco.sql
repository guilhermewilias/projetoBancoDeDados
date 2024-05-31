CREATE TRIGGER verifica_escola_existente BEFORE INSERT ON escola
FOR EACH ROW
BEGIN
    DECLARE escola_existe INT;
    
    SELECT COUNT(*) INTO escola_existe
    FROM escola
    WHERE nome = NEW.nome;

    IF escola_existe > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Escola já existe.';
    END IF;
END;