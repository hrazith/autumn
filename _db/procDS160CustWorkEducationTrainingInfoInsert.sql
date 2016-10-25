DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustWorkEducationTrainingInfoInsert`(IN `AppNumberId` INT, IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` VARCHAR(50), IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500))
BEGIN

INSERT INTO custworkeducationtraininginfo
(CustAppInfoId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties)
VALUES
(AppNumberId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties);

END$$
DELIMITER ;