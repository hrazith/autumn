DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo1Update`(IN `AppNumberId` INT, IN `First_Name` VARCHAR(500), IN `Last_Name` VARCHAR(500), IN `Full_Name_In_Native_Language` VARCHAR(500), IN `Other_Name_Used` VARCHAR(50), IN `Other_Name_1` VARCHAR(500), IN `Other_Name_2` VARCHAR(500), IN `Other_Name_3` VARCHAR(500), IN `Sex` VARCHAR(50), IN `Marital_Status` VARCHAR(50), IN `Date_Of_Birth` VARCHAR(100), IN `City_Of_Birth` VARCHAR(500), IN `State_Of_Birth` VARCHAR(500), IN `Nationality` VARCHAR(500), IN `Other_Nationalities` VARCHAR(500), IN `National_Identification_Number` VARCHAR(100), IN `US_Social_Security_Number` VARCHAR(100), IN `US_Taxpayer_ID_Number` VARCHAR(100), IN `Home_Address` VARCHAR(500), IN `City` VARCHAR(200))
BEGIN
 
 UPDATE custpersonalinfo1
 SET First_Name = First_Name,
 Last_Name = Last_Name,
 Full_Name_In_Native_Language = Full_Name_In_Native_Language,
 Other_Name_Used = Other_Name_Used,
 Other_Name_1 = Other_Name_1,
 Other_Name_2 = Other_Name_2,
 Other_Name_3 = Other_Name_3,
 Sex = Sex,
 Marital_Status = Marital_Status,
 Date_Of_Birth = Date_Of_Birth,
 City_Of_Birth = City_Of_Birth,
 State_Of_Birth = State_Of_Birth,
 Nationality = Nationality,
 Other_Nationalities = Other_Nationalities,
 National_Identification_Number = National_Identification_Number,
 US_Social_Security_Number = US_Social_Security_Number,
 US_Taxpayer_ID_Number = US_Taxpayer_ID_Number,
 Home_Address = Home_Address,
 City = City
 WHERE CustAppInfoId = AppNumberId;
 
 END$$
DELIMITER ;