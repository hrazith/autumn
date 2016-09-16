<<<<<<< HEAD
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoInsert`( CustProfileId INT,
                                         CountryListId INT,
                                         CountryVisaTypeListId INT,
                                         CustAppNumber VARCHAR(200),
                                         Activated ENUM('0','1'),
                                         Completed ENUM('0','1'),
                                         Submitted ENUM('0','1'),
                                         CreatedOn DATETIME,
                                         ModifiedOn DATETIME
                                       )
BEGIN
 
 INSERT INTO custappinfo
 (CustProfileInfoId,CountryListId,CountryVisaTypeListId,CustAppNumber,Activated,Completed,Submitted,CreatedOn,ModifiedOn)
 VALUES
 (CustProfileId,CountryListId,CountryVisaTypeListId,CustAppNumber,Activated,Completed,Submitted,CreatedOn,ModifiedOn);
 
 END$$
=======
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoInsert`(IN `CustProfileId` INT, IN `CountryListId` INT, IN `CountryVisaTypeListId` INT, IN `CustAppNumber` VARCHAR(200))
BEGIN
 
 INSERT INTO custappinfo
 (CustProfileInfoId,CountryListId,CountryVisaTypeListId,CustAppNumber)
 VALUES
 (CustProfileId,CountryListId,CountryVisaTypeListId,CustAppNumber);
 
 END$$
>>>>>>> origin/master
DELIMITER ;