CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb`;

-- Use the `mydb` schema
USE `mydb`;

-- Disable foreign key checks to avoid potential issues
SET FOREIGN_KEY_CHECKS = 0;

-- Generate and execute drop table statements for all tables in the current database
SET GROUP_CONCAT_MAX_LEN = 1000000;
SET @tables = NULL;
SELECT GROUP_CONCAT('`', table_name, '`') INTO @tables
  FROM information_schema.tables
  WHERE table_schema = 'mydb'; -- Replace 'mydb' with your database name

SET @tables = CONCAT('DROP TABLE IF EXISTS ', @tables);

-- Execute the drop table statements
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `mydb`.`Carinha` (
  `idCarinha` INT NOT NULL AUTO_INCREMENT,
  `Capacidade_Maxima` INT NULL,
  `Detalhes_Adicionais` VARCHAR(100) NULL,
  `Tipo_de_Carinha` VARCHAR(45) NULL,
  `Foto` VARCHAR(220) NULL,
  `Data_de_Criacao` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCarinha`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Genero` VARCHAR(45) NULL,
  `Telefone_do_responsavel` INT NULL,
  `Endereco` VARCHAR(100) NULL,
  `Senha` INT NULL,
  `codigo_da_escola` INT NULL,
  `QRCode` VARCHAR(220) NULL,
  `FaceId` VARCHAR(220) NULL,
  `Barcode` INT NULL,
  `Foto` VARCHAR(220) NULL,
  `Id_carrinha` INT NOT NULL,
  `Data_de_Criacao` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAluno`),
  INDEX `id_carinha_idx` (`Id_carrinha` ASC) VISIBLE,
  CONSTRAINT `id_carinha`
    FOREIGN KEY (`Id_carrinha`)
    REFERENCES `mydb`.`Carinha` (`idCarinha`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Genero` VARCHAR(45) NULL,
  `Email` VARCHAR(220) NULL,
  `Telefone_do_responsavel` INT NULL,
  `Endereco` VARCHAR(100) NULL,
  `Senha` INT NULL,
  `Cargo` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NULL,
  `id_Carrinha` INT NULL,
  `Data_de_Criacao` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFuncionario`),
  INDEX `id_Carrinha_idx` (`id_Carrinha` ASC) VISIBLE,
  CONSTRAINT `id_Carrinha`
    FOREIGN KEY (`id_Carrinha`)
    REFERENCES `mydb`.`Carinha` (`idCarinha`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Presenca` (
  `idPresenca` INT NOT NULL AUTO_INCREMENT,
  `Tipo_de_marcacao_subida_casa_escola` VARCHAR(220) NULL,
  `Local_subida_escola_casa` VARCHAR(220) NULL,
  `Local_descida_escola_casa` VARCHAR(220) NULL,
  `Tipo_de_marcacao_descida_casa_escola` VARCHAR(45) NULL,
  `Tipo_de_marcacao_subida_escola_casa` VARCHAR(45) NULL,
  `Tipo_de_marcacao_descida_escola_casa` VARCHAR(45) NULL,
  `Local_descida_casa_escola` VARCHAR(220) NULL,
  `Local_subida_casa_escola` VARCHAR(220) NULL,
  `Data_de_Criacao` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `IdAluno` INT NOT NULL,
  PRIMARY KEY (`idPresenca`),
  INDEX `fk_idAluno_idx` (`IdAluno` ASC) VISIBLE,
  CONSTRAINT `fk_idAluno`
    FOREIGN KEY (`IdAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Momento_de_marcacao` (
  `Data_de_marcacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idFuncionario` INT NOT NULL,
  `idPresenca` INT NULL,
  INDEX `fk_idfuncionario_idx` (`idFuncionario` ASC) VISIBLE,
  INDEX `fk_idpresenca_idx` (`idPresenca` ASC) VISIBLE,
  PRIMARY KEY (`Data_de_marcacao`),
  CONSTRAINT `fk_idfuncionario`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `mydb`.`Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Responsavel` (
  `idResponsavel` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Genero` VARCHAR(45) NULL,
  `Email` VARCHAR(220) NULL,
  `Endereco` VARCHAR(100) NULL,
  `Relacao_com_aluno` VARCHAR(45) NULL,
  `id_Aluno` INT NULL,
  `Data_de_Criacao` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idResponsavel`),
  INDEX `id_Aluno_idx` (`id_Aluno` ASC) VISIBLE,
  CONSTRAINT `id_Aluno`
    FOREIGN KEY (`id_Aluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;