CREATE PROCEDURE listar_turmas_alunos()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE turma_id INT;
    DECLARE turma_nome VARCHAR(200);
    DECLARE aluno_nome VARCHAR(200);
    DECLARE cur CURSOR FOR SELECT turma.id, turma.turma, usuario.nome FROM turma INNER JOIN usuario ON turma.idusuario = usuario.id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO turma_id, turma_nome, aluno_nome;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Utilize as variáveis da turma e do aluno como desejar, por exemplo, mostrando ou processando-as.
        SELECT turma_id, turma_nome, aluno_nome;
    END LOOP;

    CLOSE cur;
END;