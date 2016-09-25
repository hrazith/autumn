DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BPersonalDetail1Insert`(IN `AppId` INT, IN `FirstName` VARCHAR(500), IN `MiddleName` VARCHAR(500), IN `LastName` VARCHAR(500), IN `MaidenName` VARCHAR(500), IN `AliasFirstName` VARCHAR(500), IN `AliasLastName` VARCHAR(500), IN `OtherName1` VARCHAR(500), IN `OtherName2` VARCHAR(500), IN `OtherName3` VARCHAR(500), IN `EmailAddress` VARCHAR(500), IN `WorkPhone` VARCHAR(50), IN `HomePhone` VARCHAR(50), IN `MobilePhone` VARCHAR(50), IN `Gender` VARCHAR(50), IN `DateofBirth` VARCHAR(100), IN `CityofBirth` VARCHAR(500), IN `StateofBirth` VARCHAR(500), IN `CountryofBirth` VARCHAR(500))
BEGIN

INSERT INTO personaldetail1
(CustAppInfoId,FirstName,MiddleName,LastName,MaidenName,AliasFirstName,AliasLastName,OtherName1,OtherName2,OtherName3,EmailAddress,WorkPhone,
HomePhone,MobilePhone,Gender,DateofBirth,CityofBirth,StateofBirth,CountryofBirth)
VALUES 
(AppId,FirstName,MiddleName,LastName,MaidenName,AliasFirstName,AliasLastName,OtherName1,OtherName2,OtherName3,EmailAddress,WorkPhone,
HomePhone,MobilePhone,Gender,DateofBirth,CityofBirth,StateofBirth,CountryofBirth);

END$$
DELIMITER ;