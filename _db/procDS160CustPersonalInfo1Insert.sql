DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo1Insert`(IN `AppNumber` VARCHAR(200), IN `First_Name` VARCHAR(500), IN `Last_Name` VARCHAR(500), IN `Full_Name_In_Native_Language` VARCHAR(500), IN `Other_Name_Used` VARCHAR(50), IN `Other_Name_1` VARCHAR(500), IN `Other_Name_2` VARCHAR(500), IN `Other_Name_3` VARCHAR(500), IN `Sex` VARCHAR(50), IN `Marital_Status` VARCHAR(50), IN `Date_Of_Birth` VARCHAR(100), IN `City_Of_Birth` VARCHAR(500), IN `State_Of_Birth` VARCHAR(500), IN `Nationality` VARCHAR(500), IN `Other_Nationalities` VARCHAR(500), IN `National_Identification_Number` VARCHAR(100), IN `US_Social_Security_Number` VARCHAR(100), IN `US_Taxpayer_ID_Number` VARCHAR(100), IN `Home_Address` VARCHAR(500), IN `City` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custpersonalinfo1
(CustAppInfoId,First_Name,Last_Name,Full_Name_In_Native_Language,Other_Name_Used,Other_Name_1,Other_Name_2,Other_Name_3,Sex,Marital_Status,Date_Of_Birth,City_Of_Birth,
State_Of_Birth,Nationality,Other_Nationalities,National_Identification_Number,US_Social_Security_Number,US_Taxpayer_ID_Number,Home_Address,City)
VALUES
(AppNumberId,First_Name,Last_Name,Full_Name_In_Native_Language,Other_Name_Used,Other_Name_1,Other_Name_2,Other_Name_3,Sex,Marital_Status,Date_Of_Birth,City_Of_Birth,
State_Of_Birth,Nationality,Other_Nationalities,National_Identification_Number,US_Social_Security_Number,US_Taxpayer_ID_Number,Home_Address,City);
END$$
DELIMITER ;