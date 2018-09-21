-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema amineSQL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema amineSQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `amineSQL` DEFAULT CHARACTER SET utf8 ;
USE `amineSQL` ;

-- -----------------------------------------------------
-- Table `amineSQL`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amineSQL`.`year` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `amineSQL`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amineSQL`.`module` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_year_idx` (`year` ASC),
  CONSTRAINT `fk_year`
    FOREIGN KEY (`year`)
    REFERENCES `amineSQL`.`year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `amineSQL`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amineSQL`.`student` (
  `id` INT NOT NULL,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `amineSQL`.`assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amineSQL`.`assessment` (
  `attempted` DATETIME NOT NULL,
  `id_module` INT NOT NULL,
  `id_student` INT NOT NULL,
  `passed` DATETIME NULL,
  `grade` INT NULL,
  PRIMARY KEY (`attempted`, `id_module`, `id_student`),
  INDEX `fk_assessment_module1_idx` (`id_module` ASC),
  INDEX `fk_assessment_student1_idx` (`id_student` ASC),
  CONSTRAINT `fk_assessment_module1`
    FOREIGN KEY (`id_module`)
    REFERENCES `amineSQL`.`module` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assessment_student1`
    FOREIGN KEY (`id_student`)
    REFERENCES `amineSQL`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amineSQL`.`enrolment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amineSQL`.`enrolment` (
  `id_student` INT NOT NULL,
  `id_year` INT NOT NULL,
  `from` DATETIME NOT NULL,
  `to` DATETIME NULL,
  PRIMARY KEY (`id_student`, `id_year`),
  INDEX `fk_enrolment_year1_idx` (`id_year` ASC),
  CONSTRAINT `fk_enrolment_student1`
    FOREIGN KEY (`id_student`)
    REFERENCES `amineSQL`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrolment_year1`
    FOREIGN KEY (`id_year`)
    REFERENCES `amineSQL`.`year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

