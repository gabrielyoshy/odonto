--
-- NeoInvoice Database
--
DROP DATABASE IF EXISTS odonto;
CREATE DATABASE odonto;

USE odonto;
/*
CREATE TABLE `affiliate` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(63) NOT NULL,
   `email` VARCHAR(63) NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `commission` DECIMAL(3,2) NOT NULL DEFAULT '0.00',
   PRIMARY KEY (`id`),
   UNIQUE KEY (`email`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
*/

CREATE TABLE `ci_sessions` (
   `session_id` VARCHAR(40) NOT NULL DEFAULT '0',
   `ip_address` VARCHAR(16) NOT NULL DEFAULT '0',
   `user_agent` VARCHAR(50) NOT NULL,
   `last_activity` INT(10) UNSIGNED NOT NULL DEFAULT '0',
   `user_data` VARCHAR(512) NOT NULL,
   PRIMARY KEY (`session_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


CREATE TABLE `Estudiantes` (
   `estudiante_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `activo` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
   `apynom` VARCHAR(64) NOT NULL,
   `correo` VARCHAR(64) NOT NULL,
   `celular` VARCHAR(16) NOT NULL,
   `direccion` VARCHAR(64) NOT NULL,
   `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `modificado` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   PRIMARY KEY (`estudiante_id`),
   KEY `activo` (`activo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE `area` (
   `area_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `codigo_area` VARCHAR(127) NOT NULL,
   `nombre` VARCHAR(127) NOT NULL,
   `creado` TIMESTAMP NOT NULL DEFAULT NOW(),
   `modificado` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `direccion_factura` VARCHAR(512) NOT NULL,
   PRIMARY KEY (`area_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*CREATE TABLE `coupon` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(16) NOT NULL,
   `price` DECIMAL(5,2) NOT NULL,
   `default_service_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
   `default_service_expire` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
   `affiliate_id` INT(10) UNSIGNED,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`name`),
   KEY `default_service_id` (`default_service_id`),
   KEY `affiliate_id` (`affiliate_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
*/
/*CREATE TABLE `emailsent` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `company_id` INT(10) UNSIGNED NOT NULL,
   `invoice_id` INT(10) UNSIGNED,
   `email` VARCHAR(63) NOT NULL,
   `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `invoice_id` (`invoice_id`),
   KEY `company_id` (`company_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
*/

/*CREATE TABLE `expense` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `company_id` INT(10) UNSIGNED NOT NULL,
   `project_id` INT(10) UNSIGNED NOT NULL,
   `invoice_id` INT(10) UNSIGNED,
   `expensetype_id` INT(10) UNSIGNED NOT NULL,
   `billable` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
   `amount` DECIMAL(8,2) NOT NULL DEFAULT '0.00',
   `date` DATE NOT NULL DEFAULT '0000-00-00',
   `content` TEXT NOT NULL,
   PRIMARY KEY (`id`),
   KEY `project_id` (`project_id`,`billable`,`date`),
   KEY `invoice_id` (`invoice_id`),
   KEY `company_id` (`company_id`),
   KEY `expensetype_id` (`expensetype_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
*/
/*CREATE TABLE `expensetype` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `company_id` INT(10) UNSIGNED NOT NULL,
   `name` VARCHAR(64) NOT NULL,
   `content` TEXT NOT NULL,
   `taxable` INT(2) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
*/

CREATE TABLE `Facturas` (
   `factura_id` int(10) unsigned not null auto_increment,
   `usuario_id` int(10) unsigned not null,
   `area_id` int(10) unsigned not null,
   `Estudiante_id` int(10) unsigned not null,
   `nombre` varchar(127) not null,
   `pagado` tinyint(3) unsigned not null default '0',
   `enviado` tinyint(3) unsigned not null default '0',
   `fechadepago` date not null default '0000-00-00',
   `total` decimal(8,2) unsigned not null,
   `content` text not null,
   `creado` timestamp not null default CURRENT_TIMESTAMP,
   `modificado` timestamp not null default '0000-00-00 00:00:00',
   PRIMARY KEY (`factura_id`)
   /*KEY `project_id` (`paid`,`duedate`,`amount`,`created`,`modified`),
   KEY `company_id` (`company_id`),
   KEY `sent` (`sent`),
   KEY `client_id` (`client_id`),
   KEY `remind` (`remind`)*/
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*CREATE TABLE `language` (
   `id` int(10) unsigned not null auto_increment,
   `name` varchar(63) not null,
   `filename` varchar(63) not null,
   `code` char(2) not null,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

INSERT INTO `language` (`id`, `name`, `filename`, `code`) VALUES 
('1', 'English', 'english', 'en'),
('2', 'Deutsch', 'german', 'de');
*/

CREATE TABLE `pagos` (
   `pago_id` int(10) unsigned not null auto_increment,
   `area_id` int(10) unsigned not null,
   `factura_id` int(10) unsigned not null,
   `total` decimal(8,2) not null,
   `content` text not null,
   `date_received` date not null,
   PRIMARY KEY (`pago_id`)
   /*KEY `company_id` (`company_id`),
   KEY `invoice_id` (`invoice_id`),
   KEY `date_received` (`date_received`)*/
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `posgrado` (
   `posgrado_id` int(10) unsigned not null auto_increment,
   
   
   `activo` tinyint(3) unsigned not null default '1',
   `nombre` varchar(127) not null,
   `notas` text not null,
   `creado` timestamp not null default CURRENT_TIMESTAMP,
   `modificado` timestamp not null default '0000-00-00 00:00:00',
   PRIMARY KEY (`posgrado_id`),
   KEY `activo` (`activo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*CREATE TABLE `segment` (
   `id` int(10) unsigned not null auto_increment,
   `company_id` INT(10) UNSIGNED NOT NULL,
   `project_id` INT(10) UNSIGNED NOT NULL,
   `user_id` INT(10) UNSIGNED NOT NULL,
   `worktype_id` INT(10) UNSIGNED NOT NULL,
   `invoice_id` INT(10) UNSIGNED,
   `ticket_id` INT(10) UNSIGNED,
   `billable` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
   `date` DATE NOT NULL DEFAULT '0000-00-00',
   `time_start` TIME NOT NULL DEFAULT '00:00:00',
   `duration` TIME NOT NULL DEFAULT '00:00:00',
   `content` TEXT NOT NULL,
   PRIMARY KEY (`id`),
   KEY `project_id` (`project_id`,`user_id`,`worktype_id`,`billable`,`date`,`time_start`),
   KEY `invoice_id` (`invoice_id`),
   KEY `company_id` (`company_id`),
   KEY `user_id` (`user_id`),
   KEY `worktype_id` (`worktype_id`),
   KEY `ticket_id` (`ticket_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
*/
/*
CREATE TABLE `service` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(127) NOT NULL,
   `price` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT '0.00',
   `pref_max_user` MEDIUMINT(9) UNSIGNED NOT NULL,
   `pref_max_email` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
   `pref_custom_logo` TINYINT(4) NOT NULL DEFAULT '0',
   `pref_custom_motd` TINYINT(4) NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4;

INSERT INTO `service` (`id`, `name`, `price`, `pref_max_user`, `pref_max_email`, `pref_custom_logo`, `pref_custom_motd`) VALUES 
('1', 'Free', '0.00', '10', '100', '1', '0'),
('2', 'Agency', '9.99', '100', '250', '1', '0'),
('3', 'Corporation', '49.99', '1000', '1500', '1', '1');
*/

CREATE TABLE `cuotas` (
   `cuota_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `posgrado_id` INT(10) UNSIGNED NOT NULL,
   `mes` VARCHAR(127) NOT NULL,
   `estudiante_id` INT(10) UNSIGNED NOT NULL,
   `factura_id` INT(10) UNSIGNED,
   `usuario_id` INT(10) UNSIGNED,
   
   `descripcion` TEXT NOT NULL,
   
   `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `modificado` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   
   PRIMARY KEY (`cuota_id`)
  
) ENGINE=INNODB DEFAULT CHARSET=latin1;



CREATE TABLE `usuario` (
   `usuario_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `area_id` INT(10) UNSIGNED NOT NULL,
   `usergroup_id` INT(10) UNSIGNED,
   `activo` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
   `username` VARCHAR(32) NOT NULL,
   `password` VARCHAR(40) NOT NULL,
   `lost_password` VARCHAR(40) NOT NULL,
   `nombre` VARCHAR(64) NOT NULL,
   `permisos` TEXT NOT NULL,
   `preferencias` TEXT NOT NULL,
   `email` VARCHAR(64) NOT NULL,
   `warning` INT(10) UNSIGNED NOT NULL DEFAULT '0',
   `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   PRIMARY KEY (`usuario_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE `usergroup` (
   `usergroup_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   
   `nombre` VARCHAR(127) NOT NULL,
   `notas` TEXT NOT NULL,
   `permisos` TEXT NOT NULL,
   PRIMARY KEY (`usergroup_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE `inscriptos` (
   `inscripto_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `posgrado_id` INT(10) UNSIGNED NOT NULL,
   `estudiante_id` INT(10) UNSIGNED NOT NULL,
   `deudor` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
   `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   PRIMARY KEY (`inscripto_id`)
  
) ENGINE=INNODB DEFAULT CHARSET=latin1;
