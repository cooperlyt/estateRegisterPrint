SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS ESTATE_PRINT.HOUSE_INFO;
DROP TABLE IF EXISTS ESTATE_PRINT.PERSION;
DROP TABLE IF EXISTS ESTATE_PRINT.POWER_CER;
DROP TABLE IF EXISTS ESTATE_PRINT.POWER_CARD;




/* Create Tables */

CREATE TABLE ESTATE_PRINT.HOUSE_INFO
(
	ID varchar(28) NOT NULL,
	OWNER_TYPE varchar(32) NOT NULL,
	LAND_ADDRESS varchar(512) NOT NULL,
	HOUSE_ADDRESS varchar(512) NOT NULL,
	LAND_POWER_TYPE varchar(50) NOT NULL,
	HOUSE_POWER_TYPE varchar(50) NOT NULL,
	LAND_POWER_PROPERTY varchar(50) NOT NULL,
	HOUSE_POWER_PROPERTY varchar(50) NOT NULL,
	LAND_USE_TYPE varchar(50) NOT NULL,
	HOUSE_USE_TYPE varchar(50) NOT NULL,
	LAND_AREA decimal(19,4) NOT NULL,
	HOUSE_AREA decimal(19,4) NOT NULL,
	LAND_DATE_FROM datetime NOT NULL,
	LAND_DATE_TO datetime NOT NULL,
	HOUSE_STRUCT varchar(50) NOT NULL,
	HOUSE_COMM_AREA decimal(19,4),
	HOUSE_USE_AREA decimal(19,4),
	FLOOR_COUNT int,
	IN_FLOOR_NAME varchar(32),
	POWER_CARD varchar(32) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE ESTATE_PRINT.PERSION
(
	ID varchar(128) NOT NULL,
	NAME varchar(32) NOT NULL,
	CARD varchar(32) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE ESTATE_PRINT.POWER_CARD
(
	ID varchar(32) NOT NULL,
	OWNER_TYPE varchar(50) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE ESTATE_PRINT.POWER_CER
(
	ID varchar(32) NOT NULL,
	POWER_PERSON varchar(50) NOT NULL,
	P_TYPE varchar(50) NOT NULL,
	MONEY decimal(19,4) NOT NULL,
	DATE_FROM datetime,
	DATE_TO datetime,
	CARD varchar(32) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;



/* Create Foreign Keys */

ALTER TABLE ESTATE_PRINT.PERSION
	ADD FOREIGN KEY (CARD)
	REFERENCES ESTATE_PRINT.POWER_CARD (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ESTATE_PRINT.HOUSE_INFO
	ADD FOREIGN KEY (POWER_CARD)
	REFERENCES ESTATE_PRINT.POWER_CARD (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ESTATE_PRINT.POWER_CER
	ADD FOREIGN KEY (CARD)
	REFERENCES ESTATE_PRINT.POWER_CARD (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


