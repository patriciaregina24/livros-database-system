-- -----------------------------------------------------
-- Schema registro_livros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema registro_livros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `registro_livros` DEFAULT CHARACTER SET utf8mb4 ;
USE `registro_livros` ;

-- -----------------------------------------------------
-- Table `registro_livros`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro_livros`.`editora` (
  `id_editora` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id_editora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registro_livros`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro_livros`.`livro` (
  `id_livro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(1000) NULL,
  `ano_publicacao` DATE NULL,
  `id_editora` INT NOT NULL,
  PRIMARY KEY (`id_livro`),
  INDEX `fk_livro_editora1_idx` (`id_editora` ASC) VISIBLE,
  CONSTRAINT `fk_editora`
    FOREIGN KEY (`id_editora`)
    REFERENCES `registro_livros`.`editora` (`id_editora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registro_livros`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro_livros`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registro_livros`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro_livros`.`autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `nacionalidade` VARCHAR(45) NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registro_livros`.`autor_livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro_livros`.`autor_livro` (
  `id_autor` INT NOT NULL,
  `id_livro` INT NOT NULL,
  INDEX `fk_autor_livro_autor_idx` (`id_autor` ASC) VISIBLE,
  INDEX `fk_autor_livro_livro1_idx` (`id_livro` ASC) VISIBLE,
  PRIMARY KEY (`id_autor`, `id_livro`),
  CONSTRAINT `fk_autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `registro_livros`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro`
    FOREIGN KEY (`id_livro`)
    REFERENCES `registro_livros`.`livro` (`id_livro`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registro_livros`.`livro_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro_livros`.`livro_genero` (
  `id_livro` INT NOT NULL,
  `id_genero` INT NOT NULL,
  INDEX `fk_livro_genero_livro1_idx` (`id_livro` ASC) VISIBLE,
  INDEX `fk_livro_genero_genero1_idx` (`id_genero` ASC) VISIBLE,
  PRIMARY KEY (`id_livro`, `id_genero`),
  CONSTRAINT `fk_livro`
    FOREIGN KEY (`id_livro`)
    REFERENCES `registro_livros`.`livro` (`id_livro`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genero`
    FOREIGN KEY (`id_genero`)
    REFERENCES `registro_livros`.`genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
