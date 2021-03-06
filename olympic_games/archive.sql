-- MySQL Script generated by MySQL Workbench
-- mié 02 mar 2022 21:57:44
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Athletes_results
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Athletes_results` ;

-- -----------------------------------------------------
-- Schema Athletes_results
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Athletes_results` ;
USE `Athletes_results` ;

-- -----------------------------------------------------
-- Table `Athletes_results`.`Noc_Regions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Athletes_results`.`Noc_Regions` ;

CREATE TABLE IF NOT EXISTS `Athletes_results`.`Noc_Regions` (
  `NOC` VARCHAR(3) NOT NULL,
  `regions` VARCHAR(45) NOT NULL,
  `notes` VARCHAR(45) NULL,
  PRIMARY KEY (`NOC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Athletes_results`.`athlete_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Athletes_results`.`athlete_events` ;

CREATE TABLE IF NOT EXISTS `Athletes_results`.`athlete_events` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Sex` VARCHAR(2) NOT NULL,
  `Age` VARCHAR(2) NULL,
  `Height` VARCHAR(45) NULL,
  `Weight` VARCHAR(45) NOT NULL DEFAULT 'NA',
  `Team` VARCHAR(30) NOT NULL,
  `NOC` VARCHAR(3) NOT NULL,
  `Games` VARCHAR(45) NOT NULL,
  `Year` INT NOT NULL,
  `Season` VARCHAR(45) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `Sport` VARCHAR(30) NOT NULL,
  `Event` VARCHAR(45) NOT NULL,
  `Medal` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `Name`, `Sex`, `Weight`, `Team`, `NOC`, `Games`, `Year`, `Season`, `City`, `Sport`, `Event`),
  INDEX `fk_athlete_events_Noc_Regions_idx` (`NOC` ASC) VISIBLE,
  CONSTRAINT `fk_athlete_events_Noc_Regions`
    FOREIGN KEY (`NOC`)
    REFERENCES `Athletes_results`.`Noc_Regions` (`NOC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
