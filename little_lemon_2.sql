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
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomersID` INT NOT NULL,
  `ContactNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomersID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrdersID` INT NOT NULL,
  `TotalCost` FLOAT NULL,
  `CustomersID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrdersID`),
  INDEX `fk_Orders_Customers_idx` (`CustomersID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`CustomersID`)
    REFERENCES `mydb`.`Customers` (`CustomersID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuMenuName` VARCHAR(225) NULL,
  `Cuisine` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuID`),
  CONSTRAINT `fk_Menus_Orders1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Orders` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(225) NULL,
  `StaterName` VARCHAR(225) NULL,
  `DesertName` VARCHAR(225) NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus_8MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menus_8MenuItems` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NOT NULL,
  PRIMARY KEY (`MenuID`, `MenuItemsID`),
  INDEX `fk_Menus_has_MenuItems_MenuItems1_idx` (`MenuItemsID` ASC) VISIBLE,
  INDEX `fk_Menus_has_MenuItems_Menus1_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_has_MenuItems_Menus1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_has_MenuItems_MenuItems1`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `mydb`.`MenuItems` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
