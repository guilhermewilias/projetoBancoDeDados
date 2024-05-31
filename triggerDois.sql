CREATE TRIGGER atualiza_numero_alunos AFTER INSERT ON turma
FOR EACH ROW
BEGIN
    UPDATE turma
    SET numero_alunos = (SELECT COUNT(*) FROM usuario WHERE idturma = NEW.id);
END;