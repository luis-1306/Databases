CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `dni` char(9) UNIQUE,
  `full_name` varchar(255),
  `account_id` int UNIQUE NOT NULL,
  `freelance` bit NOT NULL DEFAULT 0,
  `gender` varchar(255),
  `date_of_birth` date,
  `customer_since` date,
  `customer_city` varchar(255),
  `customer_street` varchar(255),
  `branch_id` int,
  PRIMARY KEY (`customer_id`, `dni`)
);

CREATE TABLE `bank` (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `cif` int UNIQUE,
  `description` varchar(50),
  `email` varchar(255),
  `phone_number` numeric,
  `website` varchar(255),
  `country` varchar(255),
  `services_id` varchar(255),
  PRIMARY KEY (`bank_id`, `cif`)
);

CREATE TABLE `credit_card` (
  `card_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `proprietary_name` varchar(255),
  `type_card` varchar(255),
  `card_number` int,
  `pin_code` int(4),
  `cvc_code` int,
  `expiry_date` date,
  `bank_id` int,
  `balance` numeric(30,2),
  `status` ENUM ('activated', 'deactived', 'expired', 'blocked')
);

CREATE TABLE `branch` (
  `branch_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `address` varchar(255),
  `email` varchar(255) UNIQUE,
  `phone_number` int,
  `created_at` date,
  `country` varchar(255),
  `city` varchar(255),
  `bank_id` int,
  `workers_id` int,
  `atm_id` int
);

CREATE TABLE `loan` (
  `loan_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `interest_rate` numeric(4,2),
  `created_at` date,
  `time_limit` date,
  `borrower_id` int,
  `creditor` int,
  `amount` numeric(10,2),
  `documentary_support` varchar(255)
);

CREATE TABLE `transactions` (
  `transactions_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `num_transaction` int,
  `quantity` numeric(30,2),
  `pin_code` int,
  `transmitter` varchar(255),
  `destinatary` varchar(255),
  `bank_id` varchar(255),
  `status_transaction` int DEFAULT 1
);

CREATE TABLE `account` (
  `account_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `num_account` int,
  `type_account` varchar(255),
  `proprietary_name` varchar(255),
  `balance` numeric(30,2),
  `app_user` int UNIQUE,
  `app_code` varchar(255),
  `bank_passbook_id` int,
  `card_id` int,
  `transactions_id` int,
  `loan_id` int
);

CREATE TABLE `atm_machine` (
  `atm_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `number_machine` int,
  `branch_id` varchar(255),
  `country` varchar(255),
  `city` varchar(255),
  `num_account` int,
  `pin_code` int,
  `id_card` int,
  `pass_card` int,
  `breakdown_atm` set('lack_of_paper', 'broken_screen', 'general_failure')
);

CREATE TABLE `workers` (
  `workers_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `dni` char(9) UNIQUE,
  `full_name` varchar(255),
  `gender` varchar(255),
  `branch_id` varchar(255),
  `employee_code` int UNIQUE,
  `employee_position` varchar(255),
  `employee_since` date,
  `employee_schedule_start` time,
  `employee_schedule_end` time,
  `salary` numeric(7,2)
);

ALTER TABLE `customers` ADD FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);

ALTER TABLE `branch` ADD FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`);

ALTER TABLE `credit_card` ADD FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`);

ALTER TABLE `loan` ADD FOREIGN KEY (`creditor`) REFERENCES `bank` (`bank_id`);

ALTER TABLE `account` ADD FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`transactions_id`);

ALTER TABLE `account` ADD FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`);

ALTER TABLE `customers` ADD FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

ALTER TABLE `account` ADD FOREIGN KEY (`card_id`) REFERENCES `credit_card` (`card_id`);

ALTER TABLE `branch` ADD FOREIGN KEY (`atm_id`) REFERENCES `atm_machine` (`atm_id`);

ALTER TABLE `branch` ADD FOREIGN KEY (`workers_id`) REFERENCES `workers` (`workers_id`);

CREATE INDEX `IDX_payment` ON `transactions` (`quantity`, `transmitter`, `destinatary`);
