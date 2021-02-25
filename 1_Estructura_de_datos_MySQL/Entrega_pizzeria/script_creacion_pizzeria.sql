SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname1` VARCHAR(45) NOT NULL,
  `surname2` VARCHAR(45) NULL DEFAULT NULL,
  `adress` VARCHAR(50) NOT NULL,
  `postal_code` INT NOT NULL,
  `locality_id` INT UNSIGNED NOT NULL,
  `province_id` INT UNSIGNED NOT NULL,
  `phone` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`customer_id`, `locality_id`, `province_id`),
  INDEX `fk_customer_locality1_idx` (`locality_id` ASC, `province_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_locality1`
    FOREIGN KEY (`locality_id` , `province_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id` , `province_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`locality` (
  `locality_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `province_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`locality_id`, `province_id`),
  INDEX `fk_locality_province1_idx` (`province_id` ASC) VISIBLE,
  CONSTRAINT `fk_locality_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `province_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_hour` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type_order` ENUM('domicilio', 'recollir') NOT NULL,
  `quantity_pizza` INT NOT NULL,
  `quantity_burger` INT NOT NULL,
  `quantity_drink` INT NOT NULL,
  `total_price` FLOAT(11) NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  `shop_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`, `shop_id`),
  INDEX `fk_order_shop1_idx` (`shop_id` ASC) VISIBLE,
  INDEX `fk_orders_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `pizzeria`.`shop` (`shop_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pizzeria`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`product` (
  `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `price` FLOAT(11) NOT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `pizzeria`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`shop` (
  `shop_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `adress` VARCHAR(45) NOT NULL,
  `postal_code` INT NOT NULL,
  `locality_id` INT UNSIGNED NOT NULL,
  `province_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`shop_id`, `locality_id`, `province_id`),
  INDEX `fk_shop_locality1_idx` (`locality_id` ASC, `province_id` ASC) VISIBLE,
  CONSTRAINT `fk_shop_locality1`
    FOREIGN KEY (`locality_id` , `province_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id` , `province_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname1` VARCHAR(45) NOT NULL,
  `surname2` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  `phone` INT NOT NULL,
  `type_employee` ENUM('cuiner', 'repartidor') NOT NULL,
  `shop_id` INT UNSIGNED NOT NULL,
  `shop_locality_id` INT UNSIGNED NOT NULL,
  `shop_province_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_shop1_idx` (`shop_id` ASC, `shop_locality_id` ASC, `shop_province_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_shop1`
    FOREIGN KEY (`shop_id` , `shop_locality_id` , `shop_province_id`)
    REFERENCES `pizzeria`.`shop` (`shop_id` , `locality_id` , `province_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`delivery` (
  `delivery_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_hour` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`delivery_id`, `employee_id`, `order_id`),
  INDEX `fk_delivery_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_delivery_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pizzeria`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizzeria`.`product_order` (
  `product_order_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  INDEX `fk_product_order_orders1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_order_product1_idx` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`product_order_id`),
  CONSTRAINT `fk_product_order_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_order_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `pizzeria`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
