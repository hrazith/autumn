DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactWorkLocalContatPrepareInfoUpdate`(IN `AppNumber` VARCHAR(200), IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInUS` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(50), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` VARCHAR(50), IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500), IN `CurrentLocation` VARCHAR(500), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
 
 UPDATE custuscontactinfo
 SET ContactPersonNameInUS = ContactPersonNameInUS,
 OrganizationNameInUS = OrganizationNameInUS,
 Relationship = Relationship,
 ContactAddressUS = ContactAddressUS,
 Phone_Number = Phone_Number,
 Email_Address = Email_Address
 WHERE CustAppInfoId = AppNumberId;
 
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
 
 UPDATE custlocalinfo
 SET CurrentLocation = CurrentLocation
 WHERE CustAppInfoId = AppNumberId;
 
 UPDATE custpreparerappinfo
 SET AnyoneAssistInFillingApplication = AnyoneAssistInFillingApplication
 WHERE CustAppInfoId = AppNumberId;
 
 END$$
DELIMITER ;