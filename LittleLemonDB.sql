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
-- Table `mydb`.`Contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contacts` (
  `ContactID` INT NOT NULL,
  `Email` VARCHAR(225) NULL,
  `PhoneNumber` VARCHAR(255) NULL,
  PRIMARY KEY (`ContactID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles` (
  `RoleID` INT NOT NULL,
  `RoleName` VARCHAR(225) NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staffs` (
  `StaffID` INT NOT NULL,
  `Salary` FLOAT NULL,
  `ContactID` INT NOT NULL,
  `RoleID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `fk_Staffs_Contacts1_idx` (`ContactID` ASC) VISIBLE,
  INDEX `fk_Staffs_Roles1_idx` (`RoleID` ASC) VISIBLE,
  CONSTRAINT `fk_Staffs_Contacts1`
    FOREIGN KEY (`ContactID`)
    REFERENCES `mydb`.`Contacts` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Staffs_Roles1`
    FOREIGN KEY (`RoleID`)
    REFERENCES `mydb`.`Roles` (`RoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Drinks` (
  `DrinkID` INT NOT NULL,
  `DrinkName` VARCHAR(225) NULL,
  PRIMARY KEY (`DrinkID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cuisines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cuisines` (
  `CuisineID` INT NOT NULL,
  `CuisineName` VARCHAR(225) NULL,
  PRIMARY KEY (`CuisineID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Starters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Starters` (
  `StarterID` INT NOT NULL,
  `StarterName` VARCHAR(225) NULL,
  PRIMARY KEY (`StarterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Courses` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(225) NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Desserts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Desserts` (
  `DessertID` INT NOT NULL,
  `DessertName` VARCHAR(225) NULL,
  PRIMARY KEY (`DessertID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menus` (
  `MenuID` INT NOT NULL,
  `Price` FLOAT NULL,
  `StaffID` INT NOT NULL,
  `DrinkID` INT NOT NULL,
  `CuisineID` INT NOT NULL,
  `StarterID` INT NOT NULL,
  `CourseID` INT NOT NULL,
  `DessertID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_Menus_Staffs1_idx` (`StaffID` ASC) VISIBLE,
  INDEX `fk_Menus_Drinks1_idx` (`DrinkID` ASC) VISIBLE,
  INDEX `fk_Menus_cuisines1_idx` (`CuisineID` ASC) VISIBLE,
  INDEX `fk_Menus_Starters1_idx` (`StarterID` ASC) VISIBLE,
  INDEX `fk_Menus_Courses1_idx` (`CourseID` ASC) VISIBLE,
  INDEX `fk_Menus_Desserts1_idx` (`DessertID` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_Staffs1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`Staffs` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Drinks1`
    FOREIGN KEY (`DrinkID`)
    REFERENCES `mydb`.`Drinks` (`DrinkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_cuisines1`
    FOREIGN KEY (`CuisineID`)
    REFERENCES `mydb`.`cuisines` (`CuisineID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Starters1`
    FOREIGN KEY (`StarterID`)
    REFERENCES `mydb`.`Starters` (`StarterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Courses1`
    FOREIGN KEY (`CourseID`)
    REFERENCES `mydb`.`Courses` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Desserts1`
    FOREIGN KEY (`DessertID`)
    REFERENCES `mydb`.`Desserts` (`DessertID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(225) NULL,
  `LastName` VARCHAR(225) NULL,
  `ContactID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `ContactID`),
  INDEX `fk_Customers_Contacts1_idx` (`ContactID` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Contacts1`
    FOREIGN KEY (`ContactID`)
    REFERENCES `mydb`.`Contacts` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NULL,
  `StaffID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_Staffs1_idx` (`StaffID` ASC) VISIBLE,
  INDEX `fk_Bookings_Menus1_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Bookings_Customers1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Staffs1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`Staffs` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Menus1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Customers1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` FLOAT NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Customers_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Orders_Menus1_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Menus1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Delivery` (
  `DeliveryId` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(225) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryId`, `DeliveryDate`, `DeliveryStatus`, `OrderID`),
  INDEX `fk_Delivery_Orders1_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Delivery_Orders1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
