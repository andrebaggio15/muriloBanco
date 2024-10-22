create database mydb;
-- MySQL Script generated by MySQL Workbench
-- Tue Oct 22 10:04:58 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Senha` VARCHAR(45) NULL,
  `Login` VARCHAR(45) NULL,
  `DataCadastro` TIMESTAMP NULL,
  `DataLogin` TIMESTAMP NULL,
  `Ativo` BINARY NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Estado` VARCHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Endereco` VARCHAR(100) NULL,
  `Documento` VARCHAR(45) NULL,
  `Bairro` VARCHAR(45) NULL,
  `Cidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cliente_Cidade1_idx` (`Cidade_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Cidade1`
    FOREIGN KEY (`Cidade_id`)
    REFERENCES `mydb`.`Cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Data` TIMESTAMP NULL,
  `ValorTotal` DECIMAL(10,2) NULL,
  `Usuario_id` INT NOT NULL,
  `Cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Venda_Usuario_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Usuario`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `mydb`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Grupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Preco` DECIMAL(10,2) NULL,
  `Quantidade` INT NULL,
  `DataCompra` DATE NULL,
  `UnidadeVenda` VARCHAR(10) NULL,
  `Grupo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Produto_Grupo1_idx` (`Grupo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Grupo1`
    FOREIGN KEY (`Grupo_id`)
    REFERENCES `mydb`.`Grupo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VendaItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VendaItem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Quantidade` INT NULL,
  `ValorUnitario` DECIMAL(10,2) NULL,
  `ValorTotal` DECIMAL(10,2) NULL,
  `Venda_id` INT NOT NULL,
  `Produto_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_VendaItem_Venda1_idx` (`Venda_id` ASC) VISIBLE,
  INDEX `fk_VendaItem_Produto1_idx` (`Produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_VendaItem_Venda1`
    FOREIGN KEY (`Venda_id`)
    REFERENCES `mydb`.`Venda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VendaItem_Produto1`
    FOREIGN KEY (`Produto_id`)
    REFERENCES `mydb`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
