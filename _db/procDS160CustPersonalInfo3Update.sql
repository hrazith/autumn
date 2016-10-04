DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo3Update`(IN `AppNumber` VARCHAR(200), IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50))
BEGIN
 
 DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
 UPDATE custpersonalinfo3
 SET State_Province_Issued_Passport = State_Province_Issued_Passport,
 Country_Issued_Passport = Country_Issued_Passport,
 Issuance_Date_Passport = Issuance_Date_Passport,
 Expiration_Date_Passport = Expiration_Date_Passport,
 Passport_Stolen_Lost = Passport_Stolen_Lost
 WHERE CustAppInfoId = AppNumberId;
 
 END$$
DELIMITER ;