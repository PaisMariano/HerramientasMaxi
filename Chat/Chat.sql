SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, 
SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `CHAT` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `CHAT`;

CREATE TABLE IF NOT EXISTS `CHAT`.`CHAT` (
  `ID` INT(4) NOT NULL AUTO_INCREMENT,
  `TELEFONO` INT(10) NOT NULL,
  `NOMBRE` CHAR(10) NOT NULL,
  `CHAT` CHAR(50) NOT NULL,
  `IMAGEN` CHAR(50) NOT NULL,
  PRIMARY KEY (`ID`))
  
  ENGINE = InnoDB
  AUTO_INCREMENT = 73,
  DEFAULT CHARACTER SET = latin1
  COLLATE = latin1_spanish_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;