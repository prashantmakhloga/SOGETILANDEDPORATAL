-- MySQL Script generated by MySQL Workbench
-- 06/15/15 15:57:44
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema landedempinfo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema landedempinfo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `landedempinfo` DEFAULT CHARACTER SET utf8 ;
USE `landedempinfo` ;

-- -----------------------------------------------------
-- Table `landedempinfo`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`customer` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`customer` (
  `cid` INT(11) NOT NULL AUTO_INCREMENT,
  `customername` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`user_role` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`user_role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `RoleName` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`users` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`users` (
  `uid` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(20) NULL DEFAULT NULL,
  `lastlogin` DATETIME NULL DEFAULT NULL,
  `DOB` DATE NULL DEFAULT NULL,
  `landed_date` DATE NULL DEFAULT NULL,
  `emp_id` VARCHAR(20) NULL DEFAULT NULL,
  `emp_photo` BLOB NULL DEFAULT NULL,
  `role_Id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`),
  INDEX `role_id_user_idx` (`role_Id` ASC),
  CONSTRAINT `role_id_user`
    FOREIGN KEY (`role_Id`)
    REFERENCES `landedempinfo`.`user_role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`customer_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`customer_details` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`customer_details` (
  `cid` INT(11) NOT NULL,
  `uid` INT(11) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`cid`),
  INDEX `user_id_customer_deatils_idx` (`uid` ASC),
  CONSTRAINT `customer_id`
    FOREIGN KEY (`cid`)
    REFERENCES `landedempinfo`.`customer` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `user_id_customer_deatils`
    FOREIGN KEY (`uid`)
    REFERENCES `landedempinfo`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`knowledge_base`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`knowledge_base` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`knowledge_base` (
  `kid` INT(11) NOT NULL,
  `cid` INT(11) NULL DEFAULT NULL,
  `uid` INT(11) NULL DEFAULT NULL,
  `question` VARCHAR(150) NULL DEFAULT NULL,
  `answer` VARCHAR(250) NULL DEFAULT NULL,
  `interview_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`kid`),
  INDEX `customer_id_kb_idx` (`cid` ASC),
  INDEX `user_id_kb_idx` (`uid` ASC),
  CONSTRAINT `customer_id_kb`
    FOREIGN KEY (`cid`)
    REFERENCES `landedempinfo`.`customer` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id_kb`
    FOREIGN KEY (`uid`)
    REFERENCES `landedempinfo`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`user_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`user_address` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`user_address` (
  `aid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `address` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`aid`),
  INDEX `user_id_address_idx` (`uid` ASC),
  CONSTRAINT `user_id_address`
    FOREIGN KEY (`uid`)
    REFERENCES `landedempinfo`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`user_motivation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`user_motivation` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`user_motivation` (
  `mid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `motivation` BLOB NULL DEFAULT NULL,
   PRIMARY KEY (`mid`),
  INDEX `user_id_motivation_idx` (`uid` ASC),
  CONSTRAINT `user_id_motivation`
    FOREIGN KEY (`uid`)
    REFERENCES `landedempinfo`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`user_phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`user_phone` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`user_phone` (
  `pid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `contactno` VARCHAR(20) NULL DEFAULT NULL,
   PRIMARY KEY (`pid`),
  INDEX `user_id_phone_idx` (`uid` ASC),
  CONSTRAINT `user_id_phone`
    FOREIGN KEY (`uid`)
    REFERENCES `landedempinfo`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `landedempinfo`.`user_resumes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `landedempinfo`.`user_resumes` ;

CREATE TABLE IF NOT EXISTS `landedempinfo`.`user_resumes` (
  `rid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `Resume` BLOB NULL DEFAULT NULL,
    PRIMARY KEY (`rid`),
  INDEX `user_id_resume_idx` (`uid` ASC),
  CONSTRAINT `user_id_resume`
    FOREIGN KEY (`uid`)
    REFERENCES `landedempinfo`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
