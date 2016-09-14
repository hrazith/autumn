DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoInsert`(IN `CustProfileId` INT, IN `CountryListId` INT, IN `CountryVisaTypeListId` INT, IN `CustAppNumber` VARCHAR(200))
BEGIN
 
 INSERT INTO custappinfo
 (CustProfileInfoId,CountryListId,CountryVisaTypeListId,CustAppNumber)
 VALUES
 (CustProfileId,CountryListId,CountryVisaTypeListId,CustAppNumber);
 
 END$$
DELIMITER ;