use mydb; 

-- Inserir dados fictícios na tabela 'Carinha'
INSERT INTO `Carinha` (`Capacidade_Maxima`, `Detalhes_Adicionais`, `Tipo_de_Carinha`, `Foto`)
VALUES (50, 'Carinha 1', 'Tipo 1', 'carinha1.jpg'),
       (40, 'Carinha 2', 'Tipo 2', 'carinha2.jpg'),
       (60, 'Carinha 3', 'Tipo 1', 'carinha3.jpg');

-- Inserir dados fictícios na tabela 'Responsavel'
INSERT INTO `Responsavel` (`Nome`, `Genero`, `Email`, `Endereco`, `Relacao_com_aluno`)
VALUES ('Responsavel 1', 'Feminino', 'resp1@example.com', 'Endereco 1', 'Pai'),
       ('Responsavel 2', 'Masculino', 'resp2@example.com', 'Endereco 2', 'Mãe'),
       ('Responsavel 3', 'Feminino', 'resp3@example.com', 'Endereco 3', 'Avô');

-- Inserir dados fictícios na tabela 'Funcionario'
INSERT INTO `Funcionario` (`Nome`, `Genero`, `Email`, `Telefone_do_responsavel`, `Endereco`, `Senha`, `Cargo`, `Departamento`, `id_Carrinha`)
VALUES ('Funcionario 1', 'Masculino', 'func1@example.com', 123456789, 'Endereco 4', 12345, 'Cargo 1', 'Departamento 1', 1),
       ('Funcionario 2', 'Feminino', 'func2@example.com', 987654321, 'Endereco 5', 54321, 'Cargo 2', 'Departamento 2', 2),
       ('Funcionario 3', 'Masculino', 'func3@example.com', 111222333, 'Endereco 6', 67890, 'Cargo 3', 'Departamento 1', 1);

-- Inserir dados fictícios na tabela 'Aluno'
INSERT INTO `Aluno` (`Nome`, `Genero`, `Telefone_do_responsavel`, `Endereco`, `Senha`, `codigo_da_escola`, `QRCode`, `FaceId`, `Barcode`, `Foto`, `Id_carrinha`, `id_Responsavel`)
VALUES ('Aluno 1', 'Masculino', 111111111, 'Endereco 7', 67890, 1234, 'QRCode 1', 'FaceId 1', 9876, 'aluno1.jpg', 1, 1),
       ('Aluno 2', 'Feminino', 222222222, 'Endereco 8', 54321, 5678, 'QRCode 2', 'FaceId 2', 1234, 'aluno2.jpg', 2, 2),
       ('Aluno 3', 'Masculino', 333333333, 'Endereco 9', 67890, 9012, 'QRCode 3', 'FaceId 3', 5678, 'aluno3.jpg', 1, 3);

-- Inserir dados fictícios na tabela 'Presenca'
INSERT INTO `Presenca` (`Tipo_de_marcacao_subida_casa_escola`, `Local_subida_escola_casa`, `Local_descida_escola_casa`, `Tipo_de_marcacao_descida_casa_escola`, `Tipo_de_marcacao_subida_escola_casa`, `Tipo_de_marcacao_descida_escola_casa`, `Local_descida_casa_escola`, `Local_subida_casa_escola`, `idAluno`)
VALUES ('Subida Casa-Escola', 'Escola', 'Casa', 'Descida Escola-Casa', 'Subida Escola-Casa', 'Descida Casa-Escola', 'Casa', 'Escola', 1),
       ('Subida Casa-Escola', 'Escola', 'Casa', 'Descida Escola-Casa', 'Subida Escola-Casa', 'Descida Casa-Escola', 'Casa', 'Escola', 2),
       ('Subida Casa-Escola', 'Escola', 'Casa', 'Descida Escola-Casa', 'Subida Escola-Casa', 'Descida Casa-Escola', 'Casa', 'Escola', 3);

-- Inserir dados fictícios na tabela 'Momento_de_marcacao'
INSERT INTO `Momento_de_marcacao` ( `idFuncionario`, `idPresenca`)
VALUES ( 1, 1 );
  
     
