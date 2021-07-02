-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SalesOrder
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SalesOrder
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SalesOrder` DEFAULT CHARACTER SET utf8 ;
USE `SalesOrder` ;

-- -----------------------------------------------------
-- Table `SalesOrder`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Location` (
  `LocationID` INT NOT NULL,
  `AddressLine1` VARCHAR(40) NOT NULL,
  `AddressLine2` VARCHAR(40) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Country` VARCHAR(3) NOT NULL,
  `Territory` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`LocationID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(65) NOT NULL,
  `ContactLastName` VARCHAR(30) NOT NULL,
  `ContactFirstName` VARCHAR(30) NOT NULL,
  `PhoneNumber` VARCHAR(10) NOT NULL,
  `LocationID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `LocationID_idx` (`LocationID` ASC) ,
  CONSTRAINT `LocationID`
    FOREIGN KEY (`LocationID`)
    REFERENCES `SalesOrder`.`Location` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Product` (
  `ProductID` INT NOT NULL,
  `Sales` VARCHAR(30) NOT NULL,
  `PriceEach` VARCHAR(10) NOT NULL,
  `ProductLine` VARCHAR(9) NOT NULL,
  `ProductCode` VARCHAR(5) NOT NULL,
  `MSRP` VARCHAR(20) NOT NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC),
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `SalesOrder`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Order` (
  `OrderID` INT NOT NULL,
  `OrderNumber` VARCHAR(12) NOT NULL,
  `OrderDate` VARCHAR(6) NOT NULL,
  `QuantityOrdered` VARCHAR(8) NOT NULL,
  `OrderLineNumber` VARCHAR(10) NOT NULL,
  `ProductID` INT NOT NULL,
  `SizeID` INT NULL,
  `TimeID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `ProductID_idx` (`ProductID` ASC),
  CONSTRAINT `ProductID`
    FOREIGN KEY (`ProductID`)
    REFERENCES `SalesOrder`.`Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
