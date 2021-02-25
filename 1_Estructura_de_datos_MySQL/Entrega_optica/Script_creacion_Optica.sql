SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Optics` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS `Optics`.`provider` (
  `provider_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `number` VARCHAR(10) NOT NULL,
  `floor` VARCHAR(10) NULL DEFAULT NULL,
  `door` VARCHAR(10) NULL DEFAULT NULL,
  `city` VARCHAR(25) NOT NULL,
  `postal_code` INT NOT NULL,
  `country` VARCHAR(25) NOT NULL,
  `phone` INT NOT NULL,
  `fax` INT NULL DEFAULT NULL,
  `nif` INT NOT NULL,
  `provider_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `provided_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`provider_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`glasses` (
  `glasses_id` INT NOT NULL AUTO_INCREMENT,
  `brand_id` INT NOT NULL,
  `graduation_left` FLOAT(11) NOT NULL,
  `graduation_right` FLOAT(11) NOT NULL,
  `frame_id` INT NOT NULL,
  `crystal_color_id` INT NOT NULL,
  `price` FLOAT(11) NOT NULL,
  `glasses_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `glasses_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_brand1_idx` (`brand_id` ASC) VISIBLE,
  INDEX `fk_glasses_frame1_idx` (`frame_id` ASC) VISIBLE,
  INDEX `fk_glasses_color_crystal1_idx` (`crystal_color_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `Optics`.`brand` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_glasses_frame1`
    FOREIGN KEY (`frame_id`)
    REFERENCES `Optics`.`frame` (`frame_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_glasses_color_crystal1`
    FOREIGN KEY (`crystal_color_id`)
    REFERENCES `Optics`.`color_crystal` (`crystal_color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `postal_adress` VARCHAR(100) NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `register_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_recommended` INT NULL DEFAULT NULL,
  `customer_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_customer_idx` (`customer_recommended` ASC) VISIBLE,
  CONSTRAINT `fk_customer_customer`
    FOREIGN KEY (`customer_recommended`)
    REFERENCES `Optics`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `employee_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`brand` (
  `brand_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `provider_id` INT NOT NULL,
  `brand_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `brand_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand_id`),
  INDEX `fk_brand_provider1_idx` (`provider_id` ASC) VISIBLE,
  CONSTRAINT `fk_brand_provider1`
    FOREIGN KEY (`provider_id`)
    REFERENCES `Optics`.`provider` (`provider_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`frame` (
  `frame_id` INT NOT NULL,
  `frame_type` ENUM('flotant', 'pasta', 'metalica') NOT NULL,
  `frame_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `frame_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `frame_color_id` INT NOT NULL,
  PRIMARY KEY (`frame_id`),
  INDEX `fk_frame_color_frame1_idx` (`frame_color_id` ASC) VISIBLE,
  CONSTRAINT `fk_frame_color_frame1`
    FOREIGN KEY (`frame_color_id`)
    REFERENCES `Optics`.`color_frame` (`frame_color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`color_frame` (
  `frame_color_id` INT NOT NULL,
  `color_frame` VARCHAR(20) NOT NULL,
  `color_frame_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `color_frame_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`frame_color_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`color_crystal` (
  `crystal_color_id` INT NOT NULL,
  `color_crystal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`crystal_color_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`orders` (
  `order_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` FLOAT(11) NOT NULL,
  `order_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `order_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_order_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Optics`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Optics`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`product_order` (
  `product_order_id` INT NOT NULL AUTO_INCREMENT,
  `glasses_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price` FLOAT(11) NOT NULL,
  `order_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `order_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `fk_product_order_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_order_glasses1_idx` (`glasses_id` ASC) VISIBLE,
  PRIMARY KEY (`product_order_id`),
  CONSTRAINT `fk_product_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Optics`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_order_glasses1`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `Optics`.`glasses` (`glasses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
