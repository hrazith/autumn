DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo2Insert`(IN `AppNumber` VARCHAR(200), IN `Relative_Name_4` VARCHAR(200), IN `Relationship_To_Relative_4` VARCHAR(200), IN `Relative_Status_4` VARCHAR(100), IN `Spouse_FullName` VARCHAR(200), IN `Spouse_DateOfBirth` VARCHAR(100), IN `Spouse_Nationality` VARCHAR(200), IN `Spouse_CityOfBirth` VARCHAR(200), IN `Spouse_CountryOfBirth` VARCHAR(200), IN `Spouse_Address` VARCHAR(500))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custfamilyinfo2
(CustAppInfoId,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,
Spouse_CountryOfBirth,Spouse_Address)
VALUES
(AppNumberId,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,
Spouse_CountryOfBirth,Spouse_Address);

END$$
DELIMITER ;