DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo3Insert`(IN `AppNumber` VARCHAR(200), IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
INSERT INTO custpersonalinfo3
(CustAppInfoId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost)
VALUES
(AppNumberId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost);

END$$
DELIMITER ;