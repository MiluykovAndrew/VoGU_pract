-- MySQL Script generated by MySQL Workbench
-- Tue Oct  3 00:43:34 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pract
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pract
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pract` DEFAULT CHARACTER SET utf8 ;
USE `Pract` ;

-- -----------------------------------------------------
-- Table `Pract`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pract`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `date_start` DATE NOT NULL,
  `date_end` DATE NOT NULL,
  `link` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `link_UNIQUE` (`link` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pract`.`qustions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pract`.`qustions` (
  `q_id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`q_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pract`.`answers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pract`.`answers` (
  `answer_id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `questions_id` INT NOT NULL,
  `grade` INT NOT NULL,
  `comment` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`answer_id`),
  INDEX `event_idx` (`event_id` ASC) VISIBLE,
  INDEX `qustion_idx` (`questions_id` ASC) VISIBLE,
  CONSTRAINT `event`
    FOREIGN KEY (`event_id`)
    REFERENCES `Pract`.`event` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `qustion`
    FOREIGN KEY (`questions_id`)
    REFERENCES `Pract`.`qustions` (`q_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
