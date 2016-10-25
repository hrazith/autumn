DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustWorkEducationTrainingInfoUpdate`(IN `AppNumberId` INT,
    														   IN `Primary_Occupation` VARCHAR(200), 
                                                               IN `PresentEmployer_SchoolName` VARCHAR(200), 
                                                               IN `Address` VARCHAR(500), 
                                                               IN `City` VARCHAR(200), 
                                                               IN `State_Province` VARCHAR(200), 
                                                               IN `PostalZone_ZipCode` VARCHAR(50), 
                                                               IN `Country` VARCHAR(200), 
                                                               IN `MonthSalary_LocalCurrency` VARCHAR(100), 
                                                               IN `BrifelyDescribeYourDuties` VARCHAR(500))
BEGIN

 UPDATE custworkeducationtraininginfo
 SET Primary_Occupation = Primary_Occupation,
 PresentEmployer_SchoolName = PresentEmployer_SchoolName,
 Address = Address,
 City = City,
 State_Province = State_Province,
 PostalZone_ZipCode = PostalZone_ZipCode,
 Country = Country,
 MonthSalary_LocalCurrency = MonthSalary_LocalCurrency,
 BrifelyDescribeYourDuties = BrifelyDescribeYourDuties
 WHERE CustAppInfoId = AppNumberId;
 
END$$
DELIMITER ;