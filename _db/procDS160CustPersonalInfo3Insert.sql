DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo3Insert`(IN `AppNumberId` INT, IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50))
BEGIN

INSERT INTO custpersonalinfo
(CustAppInfoId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost)
VALUES
(AppNumberId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost);

END$$
DELIMITER ;