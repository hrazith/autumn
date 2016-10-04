DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactWorkLocalContactPrepareInfoInsert`(IN `AppNumber` VARCHAR(200), IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInUS` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Contact_Email_Address` VARCHAR(50), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` VARCHAR(50), IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500), IN `CurrentLocation` VARCHAR(500), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custuscontactinfo
(CustAppInfoId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Email_Address)
VALUES
(AppNumberId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Contact_Email_Address);

INSERT INTO custworkeducationtraininginfo
(CustAppInfoId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties)
VALUES
(AppNumberId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties);

INSERT INTO custlocalinfo
(CustAppInfoId,CurrentLocation)
VALUES
(AppNumberId,CurrentLocation);

INSERT INTO custpreparerappinfo
(CustAppInfoId,AnyoneAssistInFillingApplication)
VALUES
(AppNumberId,AnyoneAssistInFillingApplication);

END$$
DELIMITER ;