CREATE SCHEMA IF NOT EXISTS `Optics` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS `Optics`.`provider` (
  `nif` INT NOT NULL,
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
  `provider_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `provided_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`glasses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `graduation_left` FLOAT(11) NOT NULL,
  `graduation_right` FLOAT(11) NOT NULL,
  `frames_type` ENUM('flotant', 'pasta', 'metalica') NOT NULL,
  `color_frame` VARCHAR(20) NOT NULL,
  `color_crystal_left` VARCHAR(20) NOT NULL,
  `color_crystal_right` VARCHAR(20) NOT NULL,
  `price` FLOAT(11) NOT NULL,
  `is_sold` TINYINT NOT NULL,
  `glasses_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `glasses_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `provider_nif` INT NOT NULL,
  PRIMARY KEY (`id`, `provider_nif`),
  INDEX `fk_glasses_provider1_idx` (`provider_nif` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_provider1`
    FOREIGN KEY (`provider_nif`)
    REFERENCES `Optics`.`provider` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`customer` (
  `phone` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `postal_adress` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `register_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `is_recommended` TINYINT NOT NULL,
  `customer_recommended` INT NULL DEFAULT NULL,
  `customer_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`phone`, `employee_id`),
  INDEX `fk_customer_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Optics`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `employee_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Optics`.`employee_has_sold_glasses` (
  `employee_id` INT NOT NULL,
  `glasses_id` INT NOT NULL,
  `glasses_provider_nif` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `glasses_id`, `glasses_provider_nif`),
  INDEX `fk_employee_has_glasses_glasses1_idx` (`glasses_id` ASC, `glasses_provider_nif` ASC) VISIBLE,
  INDEX `fk_employee_has_glasses_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_glasses_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Optics`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_glasses_glasses1`
    FOREIGN KEY (`glasses_id` , `glasses_provider_nif`)
    REFERENCES `Optics`.`glasses` (`id` , `provider_nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;