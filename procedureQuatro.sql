CREATE PROCEDURE listar_alunos_turma(
    IN p_id_turma INT
)
BEGIN
    SELECT nome
    FROM usuario
    WHERE idturma = p_id_turma;
END;