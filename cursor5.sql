CREATE PROCEDURE listar_perguntas_alternativas()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pergunta_id INT;
    DECLARE alternativa_id INT;
    DECLARE alternativa1 INT;
    DECLARE alternativa2 INT;
    DECLARE alternativa3 INT;
    DECLARE alternativa4 INT;
    DECLARE resposta INT;
    DECLARE etapa INT;
    DECLARE dica INT;
    DECLARE cur CURSOR FOR SELECT id, alternativa1, alternativa2, alternativa3, alternativa4, resposta, etapa, dica FROM alternativa;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO pergunta_id, alternativa1, alternativa2, alternativa3, alternativa4, resposta, etapa, dica;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Utilize as variáveis da pergunta e das alternativas como desejar, por exemplo, mostrando ou processando-as.
        SELECT pergunta_id, alternativa1, alternativa2, alternativa3, alternativa4, resposta, etapa, dica;
    END LOOP;

    CLOSE cur;
END;