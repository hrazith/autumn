DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo2Update`(IN `AppNumberId` INT, IN `State_Province` VARCHAR(200), IN `PostalZone_ZIPCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `Same_Mailing_Address` VARCHAR(50), IN `Mailing_Home_Address` VARCHAR(500), IN `Mailing_City` VARCHAR(200), IN `Mailing_State_Province` VARCHAR(200), IN `Mailing_PostalZone_ZIPCode` VARCHAR(50), IN `Mailing_Country` VARCHAR(500), IN `Home_Phone_Number` VARCHAR(50), IN `Work_Phone_Number` VARCHAR(50), IN `Work_Fax_Number` VARCHAR(50), IN `Mobile_Cell_Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Passport_Number` VARCHAR(100), IN `Passport_Book_Number` VARCHAR(100), IN `Country_Authority_Issued_Passport` VARCHAR(500), IN `City_Issued_Passport` VARCHAR(200))
BEGIN
 
 UPDATE custpersonalinfo2
 SET City = City,
 State_Province = State_Province,
 PostalZone_ZIPCode = PostalZone_ZIPCode,
 Country = Country,
 Same_Mailing_Address = Same_Mailing_Address,
 Mailing_Home_Address = Mailing_Home_Address,
 Mailing_City = Mailing_City,
 Mailing_State_Province = Mailing_State_Province,
 Mailing_PostalZone_ZIPCode = Mailing_PostalZone_ZIPCode,
 Mailing_Country = Mailing_Country,
 Home_Phone_Number = Home_Phone_Number,
 Work_Phone_Number = Work_Phone_Number,
 Work_Fax_Number = Work_Fax_Number,
 Mobile_Cell_Phone_Number = Mobile_Cell_Phone_Number,
 Email_Address = Email_Address,
 Passport_Number = Passport_Number,
 Passport_Book_Number = Passport_Book_Number,
 Country_Authority_Issued_Passport = Country_Authority_Issued_Passport,
 City_Issued_Passport = City_Issued_Passport
 WHERE CustAppInfoId = AppNumberId;
 
 END$$
DELIMITER ;