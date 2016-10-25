-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2016 at 01:19 AM
-- Server version: 5.5.42
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autumn`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCountryList`()
BEGIN

 SELECT CountryName,CountryCode FROM countrylist;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoCompletedUpdate`(IN `AppNumber` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
UPDATE custappinfo
SET Completed = 1
WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoInsert`(IN `CustProfileId` INT, IN `CountryListId` INT, IN `CountryVisaTypeListId` INT, IN `CustAppNumber` VARCHAR(200), IN `FormId` INT)
BEGIN
 
 INSERT INTO custappinfo
 (CustProfileInfoId,FormId,CountryListId,CountryVisaTypeListId,CustAppNumber)
 VALUES
 (CustProfileId,FormId,CountryListId,CountryVisaTypeListId,CustAppNumber);
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoModifiedOnUpdate`(IN `AppNumber` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

UPDATE custappinfo
SET ModifiedOn = NOW()
WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoSubmittedUpdate`(IN `AppNumber` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
UPDATE custappinfo
SET Submitted = 1
WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo1Insert`(IN `AppNumber` VARCHAR(200), IN `FatherSurname` VARCHAR(200), IN `FatherGivenName` VARCHAR(200), IN `FatherDateofBirth` VARCHAR(100), IN `IsYourFatherInUS` VARCHAR(50), IN `MotherSurname` VARCHAR(200), IN `MotherGivenName` VARCHAR(200), IN `IsYourMotherInUS` VARCHAR(50), IN `ImmediateRelativesInUS_ApartFatherMother` VARCHAR(50), IN `Relative_Name_1` VARCHAR(200), IN `Relationship_To_Relative_1` VARCHAR(200), IN `Relative_Status_1` VARCHAR(100), IN `Relative_Name_2` VARCHAR(200), IN `Relationship_To_Relative_2` VARCHAR(200), IN `Relative_Status_2` VARCHAR(100), IN `Relative_Name_3` VARCHAR(200), IN `Relationship_To_Relative_3` VARCHAR(200), IN `Relative_Status_3` VARCHAR(100))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
INSERT INTO custfamilyinfo1
(CustAppInfoId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3)
VALUES
(AppNumberId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo1Update`(IN `AppNumber` VARCHAR(200), IN `FatherSurname` VARCHAR(200), IN `FatherGivenName` VARCHAR(200), IN `FatherDateofBirth` VARCHAR(100), IN `IsYourFatherInUS` VARCHAR(50), IN `MotherSurname` VARCHAR(200), IN `MotherGivenName` VARCHAR(200), IN `IsYourMotherInUS` VARCHAR(50), IN `ImmediateRelativesInUS_ApartFatherMother` VARCHAR(50), IN `Relative_Name_1` VARCHAR(200), IN `Relationship_To_Relative_1` VARCHAR(200), IN `Relative_Status_1` VARCHAR(100), IN `Relative_Name_2` VARCHAR(200), IN `Relationship_To_Relative_2` VARCHAR(200), IN `Relative_Status_2` VARCHAR(100), IN `Relative_Name_3` VARCHAR(200), IN `Relationship_To_Relative_3` VARCHAR(200), IN `Relative_Status_3` VARCHAR(100))
BEGIN	

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
			
 UPDATE custfamilyinfo1
 SET FatherSurname = FatherSurname,
 FatherGivenName = FatherGivenName,
 FatherDateofBirth = FatherDateofBirth,
 IsYourFatherInUS = IsYourFatherInUS,
 MotherSurname = MotherSurname,
 MotherGivenName = MotherGivenName,
 IsYourMotherInUS = IsYourMotherInUS,
 ImmediateRelativesInUS_ApartFatherMother = ImmediateRelativesInUS_ApartFatherMother,
 Relative_Name_1 = Relative_Name_1,
 Relationship_To_Relative_1 = Relationship_To_Relative_1,
 Relative_Status_1 = Relative_Status_1,
 Relative_Name_2 = Relative_Name_2,
 Relationship_To_Relative_2 = Relationship_To_Relative_2,
 Relative_Status_2 = Relative_Status_2,
 Relative_Name_3 = Relative_Name_3,
 Relationship_To_Relative_3 = Relationship_To_Relative_3,
 Relative_Status_3 = Relative_Status_3
 WHERE CustAppInfoId = AppNumberId;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo2Insert`(IN `AppNumber` VARCHAR(200), IN `Relative_Name_4` VARCHAR(200), IN `Relationship_To_Relative_4` VARCHAR(200), IN `Relative_Status_4` VARCHAR(100), IN `Spouse_FullName` VARCHAR(200), IN `Spouse_DateOfBirth` VARCHAR(100), IN `Spouse_Nationality` VARCHAR(200), IN `Spouse_CityOfBirth` VARCHAR(200), IN `Spouse_CountryOfBirth` VARCHAR(200), IN `Spouse_Address` VARCHAR(500))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custfamilyinfo2
(CustAppInfoId,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,
Spouse_CountryOfBirth,Spouse_Address)
VALUES
(AppNumberId,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,
Spouse_CountryOfBirth,Spouse_Address);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo2Update`(IN `AppNumber` VARCHAR(200), IN `Relative_Name_4` VARCHAR(200), IN `Relationship_To_Relative_4` VARCHAR(200), IN `Relative_Status_4` VARCHAR(100), IN `Spouse_FullName` VARCHAR(200), IN `Spouse_DateOfBirth` VARCHAR(100), IN `Spouse_Nationality` VARCHAR(200), IN `Spouse_CityOfBirth` VARCHAR(200), IN `Spouse_CountryOfBirth` VARCHAR(200), IN `Spouse_Address` VARCHAR(500))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
 
 UPDATE custfamilyinfo2
 SET Relative_Name_4 = Relative_Name_4,
 Relationship_To_Relative_4 = Relationship_To_Relative_4,
 Relative_Status_4 = Relative_Status_4,
 Spouse_FullName = Spouse_FullName,
 Spouse_DateOfBirth = Spouse_DateOfBirth,
 Spouse_Nationality = Spouse_Nationality,
 Spouse_CityOfBirth = Spouse_CityOfBirth,
 Spouse_CountryOfBirth = Spouse_CountryOfBirth,
 Spouse_Address = Spouse_Address
 WHERE CustAppInfoId = AppNumberId;
 
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustLocalInfoInsert`(IN `AppNumber` VARCHAR(200), IN `CurrentLocation` VARCHAR(500))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custlocalinfo
(CustAppInfoId,CurrentLocation)
VALUES
(AppNumberId,CurrentLocation);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustLocalInfoUpdate`(IN `AppNumber` VARCHAR(200), IN `CurrentLocation` VARCHAR(500))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

 UPDATE custlocalinfo
 SET CurrentLocation = CurrentLocation
 WHERE CustAppInfoId = AppNumberId;

END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo1Update`(IN `AppNumber` VARCHAR(200), IN `First_Name` VARCHAR(500), IN `Last_Name` VARCHAR(500), IN `Full_Name_In_Native_Language` VARCHAR(500), IN `Other_Name_Used` VARCHAR(50), IN `Other_Name_1` VARCHAR(500), IN `Other_Name_2` VARCHAR(500), IN `Other_Name_3` VARCHAR(500), IN `Sex` VARCHAR(50), IN `Marital_Status` VARCHAR(50), IN `Date_Of_Birth` VARCHAR(100), IN `City_Of_Birth` VARCHAR(500), IN `State_Of_Birth` VARCHAR(500), IN `Nationality` VARCHAR(500), IN `Other_Nationalities` VARCHAR(500), IN `National_Identification_Number` VARCHAR(100), IN `US_Social_Security_Number` VARCHAR(100), IN `US_Taxpayer_ID_Number` VARCHAR(100), IN `Home_Address` VARCHAR(500), IN `City` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo2Insert`(IN `AppNumber` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZIPCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `Same_Mailing_Address` VARCHAR(50), IN `Mailing_Home_Address` VARCHAR(500), IN `Mailing_City` VARCHAR(200), IN `Mailing_State_Province` VARCHAR(200), IN `Mailing_PostalZone_ZIPCode` VARCHAR(50), IN `Mailing_Country` VARCHAR(500), IN `Home_Phone_Number` VARCHAR(50), IN `Work_Phone_Number` VARCHAR(50), IN `Work_Fax_Number` VARCHAR(50), IN `Mobile_Cell_Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Passport_Number` VARCHAR(100), IN `Passport_Book_Number` VARCHAR(100), IN `Country_Authority_Issued_Passport` VARCHAR(500), IN `City_Issued_Passport` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
INSERT INTO custpersonalinfo2
(CustAppInfoId,State_Province,PostalZone_ZIPCode,Country,Same_Mailing_Address,Mailing_Home_Address,Mailing_City,Mailing_State_Province,Mailing_PostalZone_ZIPCode,
Mailing_Country,Home_Phone_Number,Work_Phone_Number,Work_Fax_Number,Mobile_Cell_Phone_Number,Email_Address,Passport_Number,Passport_Book_Number,Country_Authority_Issued_Passport,
City_Issued_Passport)
VALUES
(AppNumberId,State_Province,PostalZone_ZIPCode,Country,Same_Mailing_Address,Mailing_Home_Address,Mailing_City,Mailing_State_Province,Mailing_PostalZone_ZIPCode,
Mailing_Country,Home_Phone_Number,Work_Phone_Number,Work_Fax_Number,Mobile_Cell_Phone_Number,Email_Address,Passport_Number,Passport_Book_Number,Country_Authority_Issued_Passport,
City_Issued_Passport);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo2Update`(IN `AppNumber` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZIPCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `Same_Mailing_Address` VARCHAR(50), IN `Mailing_Home_Address` VARCHAR(500), IN `Mailing_City` VARCHAR(200), IN `Mailing_State_Province` VARCHAR(200), IN `Mailing_PostalZone_ZIPCode` VARCHAR(50), IN `Mailing_Country` VARCHAR(500), IN `Home_Phone_Number` VARCHAR(50), IN `Work_Phone_Number` VARCHAR(50), IN `Work_Fax_Number` VARCHAR(50), IN `Mobile_Cell_Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Passport_Number` VARCHAR(100), IN `Passport_Book_Number` VARCHAR(100), IN `Country_Authority_Issued_Passport` VARCHAR(500), IN `City_Issued_Passport` VARCHAR(200))
BEGIN
 
 DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
 UPDATE custpersonalinfo2
 SET
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo3Insert`(IN `AppNumber` VARCHAR(200), IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
INSERT INTO custpersonalinfo3
(CustAppInfoId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost)
VALUES
(AppNumberId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo3Update`(IN `AppNumber` VARCHAR(200), IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50))
BEGIN
 
 DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
 UPDATE custpersonalinfo3
 SET State_Province_Issued_Passport = State_Province_Issued_Passport,
 Country_Issued_Passport = Country_Issued_Passport,
 Issuance_Date_Passport = Issuance_Date_Passport,
 Expiration_Date_Passport = Expiration_Date_Passport,
 Passport_Stolen_Lost = Passport_Stolen_Lost
 WHERE CustAppInfoId = AppNumberId;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPreparerappInfoInsert`(IN `AppNumber` VARCHAR(200), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custpreparerappinfo
(CustAppInfoId,AnyoneAssistInFillingApplication)
VALUES
(AppNumberId,AnyoneAssistInFillingApplication);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPreparerappInfoUpdate`(IN `AppNumber` VARCHAR(200), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

 UPDATE custpreparerappinfo
 SET AnyoneAssistInFillingApplication = AnyoneAssistInFillingApplication
 WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo1Insert`(IN `AppNumber` VARCHAR(200), IN `Principal_Applicant` VARCHAR(50), IN `Trip_Purpose_1` VARCHAR(500), IN `Trip_Purpose_2` VARCHAR(500), IN `Trip_Purpose_3` VARCHAR(500), IN `Trip_Purpose_4` VARCHAR(500), IN `Intended_Date_Of_Arrival` VARCHAR(100), IN `Intended_Length_Of_Stay_US` VARCHAR(100), IN `Address_of_US_Stay` VARCHAR(500), IN `Person_Entity_Paying_US_Trip` VARCHAR(200), IN `Telephone` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Relationship_To_You` VARCHAR(100), IN `PayingPartyTripAddress_SameAsHomeMailingAddress` VARCHAR(50), IN `PartyPayingAddress` VARCHAR(500), IN `PartyPayingCity` VARCHAR(200), IN `PartyPayingState_Province` VARCHAR(200), IN `PostalZone_ZIPcode` VARCHAR(50), IN `Country` VARCHAR(500), IN `OtherPersonTravellingWithYou` VARCHAR(100))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custtravelinfo1
(CustAppInfoId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,PostalZone_ZIPcode,Country,OtherPersonTravellingWithYou)
VALUES
(AppNumberId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,PostalZone_ZIPcode,Country,OtherPersonTravellingWithYou);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo1Update`(IN `AppNumber` VARCHAR(200), IN `Principal_Applicant` VARCHAR(50), IN `Trip_Purpose_1` VARCHAR(500), IN `Trip_Purpose_2` VARCHAR(500), IN `Trip_Purpose_3` VARCHAR(500), IN `Trip_Purpose_4` VARCHAR(500), IN `Intended_Date_Of_Arrival` VARCHAR(100), IN `Intended_Length_Of_Stay_US` VARCHAR(100), IN `Address_of_US_Stay` VARCHAR(500), IN `Person_Entity_Paying_US_Trip` VARCHAR(200), IN `Telephone` VARCHAR(50), IN `Travel_Email_Address` VARCHAR(500), IN `Relationship_To_You` VARCHAR(100), IN `PayingPartyTripAddress_SameAsHomeMailingAddress` VARCHAR(50), IN `PartyPayingAddress` VARCHAR(500), IN `PartyPayingCity` VARCHAR(200), IN `PartyPayingState_Province` VARCHAR(200), IN `PostalZone_ZIPcode` VARCHAR(50), IN `Country` VARCHAR(500), IN `OtherPersonTravellingWithYou` VARCHAR(10))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
 
 UPDATE custtravelinfo1
 SET Principal_Applicant = Principal_Applicant,
 Trip_Purpose_1 = Trip_Purpose_1,
 Trip_Purpose_2 = Trip_Purpose_2,
 Trip_Purpose_3 = Trip_Purpose_3,
 Trip_Purpose_4 = Trip_Purpose_4,
 Intended_Date_Of_Arrival = Intended_Date_Of_Arrival,
 Intended_Length_Of_Stay_US = Intended_Length_Of_Stay_US,
 Address_of_US_Stay = Address_of_US_Stay,
 Person_Entity_Paying_US_Trip = Person_Entity_Paying_US_Trip,
 Telephone = Telephone,
 Email_Address = Travel_Email_Address,
 Relationship_To_You = Relationship_To_You,
 PayingPartyTripAddress_SameAsHomeMailingAddress = PayingPartyTripAddress_SameAsHomeMailingAddress,
 PartyPayingAddress = PartyPayingAddress,
 PartyPayingCity = PartyPayingCity,
 PartyPayingState_Province = PartyPayingState_Province,
 PostalZone_ZIPcode = PostalZone_ZIPcode,
 Country = Country,
 OtherPersonTravellingWithYou = OtherPersonTravellingWithYou
 WHERE CustAppInfoId = AppNumberId;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo2Insert`(IN `AppNumber` VARCHAR(200), IN `TravellingPartofGroup_Organizantion` VARCHAR(100), IN `PersonTravellingWithYou_Name_1` VARCHAR(200), IN `PersonTravellingWithYou_Name_2` VARCHAR(200), IN `PersonTravellingWithYou_Name_3` VARCHAR(200), IN `PersonTravellingWithYou_Name_4` VARCHAR(200), IN `PersonTravellingWithYou_Name_5` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_1` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_2` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_3` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_4` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_5` VARCHAR(200), IN `EverBeenToUS` VARCHAR(50), IN `EverBeenIssuedUSVisa` VARCHAR(50), IN `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custtravelinfo2
(CustAppInfoId,TravellingPartofGroup_Organizantion,PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,
PersonTravellingWithYou_Name_5,PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication)
VALUES
(AppNumberId,TravellingPartofGroup_Organizantion,PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,
PersonTravellingWithYou_Name_5,PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo2Update`(IN `AppNumber` VARCHAR(200), IN `TravellingPartofGroup_Organizantion` VARCHAR(100), IN `PersonTravellingWithYou_Name_1` VARCHAR(200), IN `PersonTravellingWithYou_Name_2` VARCHAR(200), IN `PersonTravellingWithYou_Name_3` VARCHAR(200), IN `PersonTravellingWithYou_Name_4` VARCHAR(200), IN `PersonTravellingWithYou_Name_5` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_1` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_2` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_3` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_4` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_5` VARCHAR(200), IN `EverBeenToUS` VARCHAR(50), IN `EverBeenIssuedUSVisa` VARCHAR(50), IN `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
 
 UPDATE custtravelinfo2
 SET TravellingPartofGroup_Organizantion = TravellingPartofGroup_Organizantion,
 PersonTravellingWithYou_Name_1 = PersonTravellingWithYou_Name_1,
 PersonTravellingWithYou_Name_2 = PersonTravellingWithYou_Name_2,
 PersonTravellingWithYou_Name_3 = PersonTravellingWithYou_Name_3,
 PersonTravellingWithYou_Name_4 = PersonTravellingWithYou_Name_4,
 PersonTravellingWithYou_Name_5 = PersonTravellingWithYou_Name_5,
 PersonTravellingWithYou_Relationship_1 = PersonTravellingWithYou_Relationship_1,
 PersonTravellingWithYou_Relationship_2 = PersonTravellingWithYou_Relationship_2,
 PersonTravellingWithYou_Relationship_3 = PersonTravellingWithYou_Relationship_3,
 PersonTravellingWithYou_Relationship_4 = PersonTravellingWithYou_Relationship_4,
 PersonTravellingWithYou_Relationship_5 = PersonTravellingWithYou_Relationship_5,
 EverBeenToUS = EverBeenToUS,
 EverBeenIssuedUSVisa = EverBeenIssuedUSVisa,
 EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication = EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication
 WHERE CustAppInfoId = AppNumberId;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactInfoInsert`(IN `AppNumber` VARCHAR(200), IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInU` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Contact_Email_Address` VARCHAR(50))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custuscontactinfo
(CustAppInfoId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Email_Address)
VALUES
(AppNumberId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Contact_Email_Address);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactInfoUpdate`(IN `AppNumber` VARCHAR(200), IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInU` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(50))
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

END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustWorkEducationTrainingInfoInsert`(IN `AppNumber` VARCHAR(200), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` VARCHAR(50), IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

INSERT INTO custworkeducationtraininginfo
(CustAppInfoId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties)
VALUES
(AppNumberId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustWorkEducationTrainingInfoUpdate`(IN `AppNumber` VARCHAR(200), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` VARCHAR(50), IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procEventLogInsert`(IN `Username` VARCHAR(200), IN `EventType` VARCHAR(200), IN `EventDescription` VARCHAR(8000), IN `EventLogDate` DATETIME)
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO eventlog
(CustProfileInfoId,EventType,EventDescription,EventLogDate)
VALUES
(ProfileId,EventType,EventDescription,EventLogDate);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetAppId`(IN `AppNumber` VARCHAR(200))
BEGIN

SELECT CustAppInfoId FROM custappinfo
WHERE CustAppNumber = AppNumber;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetProfileInfo`(IN `UserName` VARCHAR(200))
BEGIN

SELECT app.CustAppNumber AppNumber,
       CONCAT(cl.CountryName,' (',cl.CountryCode,')') CountryName,
       CONCAT(cvl.CountryVisaType,' (',cvl.CountryVisaTypeDescription,')') VisaTypeName,
       IF(app.Activated = '1','Yes','No') Active,
       IF(app.Completed = '1','Yes','No') Completed,
       IF(app.Submitted = '1','Yes','No') Submitted,
       app.CreatedOn AppCreationDate,
       app.ModifiedOn AppLastModificationDate
FROM custappinfo app 
INNER JOIN countrylist cl ON app.CountryListId = cl.CountryListId
INNER JOIN countryvisatypelist cvl ON app.CountryVisaTypeListId = cvl.CountryVisaTypeListId
INNER JOIN custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
WHERE cp.UserName = UserName;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetProfileInfoWithAppPercentageCompleted`(IN `UserName` VARCHAR(255))
BEGIN

DECLARE ProfileId INT;
SET ProfileId = (SELECT CustprofileInfoId FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO apppercent
(CustAppInfoId,CustProfileInfoId,CountryListId,
 CountryVisaTypeListId,FormId)

SELECT CustAppInfoId,CustProfileInfoId,CountryListId,
CountryVisaTypeListId,FormId
FROM custappinfo where CustprofileInfoId = ProfileId;

SET @x = 1;
SET @cnt = (SELECT COUNT(*) FROM apppercent WHERE FormId = 1);
SET @cnt1 = (SELECT COUNT(*) + @cnt FROM apppercent WHERE FormId = 2);

WHILE @x <= @cnt DO

SET @AppId = (Select CustAppInfoId FROM apppercent WHERE Id = @x);

SET @AppPercent = fnCalculateAppPercentageCompleted(@AppId);

UPDATE apppercent
SET AppPercentageCompleted = @AppPercent
WHERE CustAppInfoId = @AppId;
                            
SET @x = @x + 1;
END WHILE;

WHILE @x <= @cnt1 DO

SET @AppId = (Select CustAppInfoId FROM apppercent WHERE Id = @x);

SET @AppPercent = fnCalculateH1bAppPercentageCompleted(@AppId);

UPDATE apppercent
SET AppPercentageCompleted = @AppPercent
WHERE CustAppInfoId = @AppId;
                            

SET @x = @x + 1;
END WHILE;

SELECT app.CustAppNumber AppNumber,
       CONCAT(cl.CountryName,' (',cl.CountryCode,')') CountryName,
       CONCAT(cvl.CountryVisaType,' (',cvl.CountryVisaTypeDescription,')') VisaTypeName,
       ap.AppPercentageCompleted,
       IF(app.Activated = '1','Yes','No') Active,
       IF(app.Completed = '1','Yes','No') Completed,
       IF(app.Submitted = '1','Yes','No') Submitted,
       app.CreatedOn AppCreationDate,
       app.ModifiedOn AppLastModificationDate,
       f.FormType
FROM custappinfo app 
INNER JOIN countrylist cl ON app.CountryListId = cl.CountryListId
INNER JOIN countryvisatypelist cvl ON app.CountryVisaTypeListId = cvl.CountryVisaTypeListId
INNER JOIN custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
INNER JOIN form f ON app.FormId = f.FormId
INNER JOIN apppercent ap ON app.CustAppInfoId = ap.CustAppInfoId
WHERE cp.UserName = UserName;


TRUNCATE TABLE apppercent;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BEmployment1Insert`(IN `AppId` INT, IN `EmploymentType` VARCHAR(100), IN `EmploymentDateFrom` VARCHAR(100), IN `EmploymentDateTo` VARCHAR(100), IN `StreetAddress` VARCHAR(500), IN `Address2` VARCHAR(500), IN `City` VARCHAR(500), IN `StateProvinceRegion` VARCHAR(500), IN `ZipCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `EmployerIsUniversityOrNonProfit` VARCHAR(50), IN `TypeOfBusiness` VARCHAR(500), IN `HoursPerWeek` VARCHAR(50), IN `IsPositionPartTime` VARCHAR(50), IN `JobTitle` VARCHAR(200), IN `CurrentAnnualBaseSalary` VARCHAR(100), IN `DetailJobDuties` VARCHAR(8000), IN `TechnologiesUsed` VARCHAR(8000))
BEGIN


INSERT INTO employment1
(CustAppInfoId,EmploymentType,EmploymentDateFrom,EmploymentDateTo,StreetAddress,Address2,City,StateProvinceRegion,
ZipCode,Country,EmployerIsUniversityOrNonProfit,TypeOfBusiness,HoursPerWeek,IsPositionPartTime,JobTitle,
CurrentAnnualBaseSalary,DetailJobDuties,TechnologiesUsed
)
VALUES
(AppId,EmploymentType,EmploymentDateFrom,EmploymentDateTo,StreetAddress,Address2,City,StateProvinceRegion,
ZipCode,Country,EmployerIsUniversityOrNonProfit,TypeOfBusiness,HoursPerWeek,IsPositionPartTime,JobTitle,
CurrentAnnualBaseSalary,DetailJobDuties,TechnologiesUsed);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BEmployment2Insert`(IN `AppId` INT, IN `SupervisorName` VARCHAR(500), IN `SupervisorPhoneNumber` VARCHAR(100), IN `SuperVisorJobTitle` VARCHAR(200), IN `AnyInterruptionsInEmploymentWithEmployer` VARCHAR(50), IN `WorkingOutsideTheUS` VARCHAR(50), IN `IfWorkingOutsideDoesItInvolveSupervision` VARCHAR(50))
BEGIN


INSERT INTO employment2
(CustAppInfoId,SupervisorName,SupervisorPhoneNumber,SuperVisorJobTitle,AnyInterruptionsInEmploymentWithEmployer,
WorkingOutsideTheUS,IfWorkingOutsideDoesItInvolveSupervision
)
VALUES
(AppId,SupervisorName,SupervisorPhoneNumber,SuperVisorJobTitle,AnyInterruptionsInEmploymentWithEmployer,
WorkingOutsideTheUS,IfWorkingOutsideDoesItInvolveSupervision);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BOverSeasPermanentAddressEducationInsert`(IN `AppId` INT, IN `OverseasPermanentAddressDateFrom` VARCHAR(100), IN `OverseasPermanentAddressDateTo` VARCHAR(100), IN `StreetAddress` VARCHAR(500), IN `Address2` VARCHAR(500), IN `City` VARCHAR(500), IN `StateProvinceRegion` VARCHAR(500), IN `ZipCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `PlanOfChangingPlaceOfResidenceInNext4Months` VARCHAR(50), IN `InstitutionFullName` VARCHAR(500), IN `InstitutionType` VARCHAR(500), IN `InstitutionAccreditationStatus` VARCHAR(500), IN `DateAttendedFrom` VARCHAR(100), IN `DateAttendedTo` VARCHAR(100), IN `MajorOrFieldOfStudy` VARCHAR(500), IN `DegreeReceived` VARCHAR(200), IN `Notes` VARCHAR(1000))
BEGIN


INSERT INTO overseaspermanentaddress 
(
CustAppInfoId,OverseasPermanentAddressDateFrom,OverseasPermanentAddressDateTo,StreetAddress,Address2,City,
StateProvinceRegion,ZipCode,Country,PlanOfChangingPlaceOfResidenceInNext4Months
)
VALUES
(
AppId,OverseasPermanentAddressDateFrom,OverseasPermanentAddressDateTo,StreetAddress,Address2,City,
StateProvinceRegion,ZipCode,Country,PlanOfChangingPlaceOfResidenceInNext4Months
);

INSERT INTO education
(
CustAppInfoId,InstitutionFullName,InstitutionType,
InstitutionAccreditationStatus,DateAttendedFrom,
DateAttendedTo,MajorOrFieldOfStudy,DegreeReceived,Notes
)
VALUES
(
AppId,InstitutionFullName,InstitutionType,
InstitutionAccreditationStatus,DateAttendedFrom,
DateAttendedTo,MajorOrFieldOfStudy,DegreeReceived,Notes
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BPersonalDetail1Insert`(IN `AppId` INT, IN `FirstName` VARCHAR(500), IN `MiddleName` VARCHAR(500), IN `LastName` VARCHAR(500), IN `MaidenName` VARCHAR(500), IN `AliasFirstName` VARCHAR(500), IN `AliasLastName` VARCHAR(500), IN `OtherName1` VARCHAR(500), IN `OtherName2` VARCHAR(500), IN `OtherName3` VARCHAR(500), IN `EmailAddress` VARCHAR(500), IN `WorkPhone` VARCHAR(50), IN `HomePhone` VARCHAR(50), IN `MobilePhone` VARCHAR(50), IN `Gender` VARCHAR(50), IN `DateofBirth` VARCHAR(100), IN `CityofBirth` VARCHAR(500), IN `StateofBirth` VARCHAR(500), IN `CountryofBirth` VARCHAR(500))
BEGIN

INSERT INTO personaldetail1
(CustAppInfoId,FirstName,MiddleName,LastName,MaidenName,AliasFirstName,AliasLastName,OtherName1,OtherName2,OtherName3,EmailAddress,WorkPhone,
HomePhone,MobilePhone,Gender,DateofBirth,CityofBirth,StateofBirth,CountryofBirth)
VALUES 
(AppId,FirstName,MiddleName,LastName,MaidenName,AliasFirstName,AliasLastName,OtherName1,OtherName2,OtherName3,EmailAddress,WorkPhone,
HomePhone,MobilePhone,Gender,DateofBirth,CityofBirth,StateofBirth,CountryofBirth);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BPersonalDetail2Insert`(IN `AppId` INT, IN `Nationality` VARCHAR(500), IN `PermanentResident_Immigrant` VARCHAR(500), IN `RecentCitizenship_PR_Immigrant` VARCHAR(500), IN `PassportNumber` VARCHAR(100), IN `PassportIssueDate` VARCHAR(100), IN `PassportExpirationDate` VARCHAR(100), IN `PassportIssuedCity` VARCHAR(200), IN `PassportIssuedState` VARCHAR(200), IN `PassportIssuedCountry` VARCHAR(200), IN `BlankPagesInPassport` VARCHAR(100))
BEGIN


INSERT INTO personaldetail2
(CustAppInfoId,Nationality,PermanentResident_Immigrant,RecentCitizenship_PR_Immigrant,PassportNumber,PassportIssueDate,
PassportExpirationDate,PassportIssuedCity,PassportIssuedState,PassportIssuedCountry,BlankPagesInPassport
)
VALUES
(AppId,Nationality,PermanentResident_Immigrant,RecentCitizenship_PR_Immigrant,PassportNumber,PassportIssueDate,
PassportExpirationDate,PassportIssuedCity,PassportIssuedState,PassportIssuedCountry,BlankPagesInPassport);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BUSHomeAddressInsert`(IN `AppId` INT, IN `HaveUSHomeAddress` VARCHAR(50), IN `USHomeAddressDateFrom` VARCHAR(100), IN `USHomeAddressDateTo` VARCHAR(100), IN `StreetAddress` VARCHAR(500), IN `Address2` VARCHAR(500), IN `City` VARCHAR(500), IN `StateProvinceRegion` VARCHAR(500), IN `ZipCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `SameAsCurrentmaiingAddress` VARCHAR(50), IN `Address2_1` VARCHAR(500), IN `City_1` VARCHAR(500), IN `StateProvinceRegion_1` VARCHAR(500), IN `ZipCode_1` VARCHAR(50), IN `Country_1` VARCHAR(500), IN `PhoneNumberWithThisAddress` VARCHAR(50), IN `PlanOfChangingPlaceOfResidenceInNext4Months` VARCHAR(50), IN `IfYesMovingDateAndNewAddress` VARCHAR(2000))
BEGIN


INSERT INTO ushomeaddress
(
CustAppInfoId,HaveUSHomeAddress,USHomeAddressDateFrom,USHomeAddressDateTo,StreetAddress,Address2,
City,StateProvinceRegion,ZipCode,Country,SameAsCurrentmaiingAddress,Address2_1,City_1,StateProvinceRegion_1,
ZipCode_1,Country_1,PhoneNumberWithThisAddress,PlanOfChangingPlaceOfResidenceInNext4Months,IfYesMovingDateAndNewAddress
)
VALUES
(
AppId,HaveUSHomeAddress,USHomeAddressDateFrom,USHomeAddressDateTo,StreetAddress,Address2,
City,StateProvinceRegion,ZipCode,Country,SameAsCurrentmaiingAddress,Address2_1,City_1,StateProvinceRegion_1,
ZipCode_1,Country_1,PhoneNumberWithThisAddress,PlanOfChangingPlaceOfResidenceInNext4Months,IfYesMovingDateAndNewAddress
);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BVisaApplicationInternationInsert`(IN `AppId` INT, IN `PossibilityOfInternationTravelIn6Months` VARCHAR(50), IN `DateofIntendedDeparture` VARCHAR(100), IN `ExpectedLengthOfTrip` VARCHAR(200), IN `PurposeOfTripIncludingTravelersName` VARCHAR(1000), IN `ResidingOutsideUS` VARCHAR(50), IN `USConsulateLocationOutsideUS` VARCHAR(500), IN `AppliedNonImmigrantUSVisa` VARCHAR(50), IN `VisaCancelledDeniedRejected` VARCHAR(50))
BEGIN


INSERT INTO internationtravel
(CustAppInfoId,PossibilityOfInternationTravelIn6Months,DateofIntendedDeparture,ExpectedLengthOfTrip,PurposeOfTripIncludingTravelersName)
VALUES
(AppId,PossibilityOfInternationTravelIn6Months,DateofIntendedDeparture,ExpectedLengthOfTrip,PurposeOfTripIncludingTravelersName);


INSERT INTO visaapplication
(CustAppInfoId,ResidingOutsideUS,USConsulateLocationOutsideUS,AppliedNonImmigrantUSVisa,VisaCancelledDeniedRejected)
VALUES
(AppId,ResidingOutsideUS,USConsulateLocationOutsideUS,AppliedNonImmigrantUSVisa,VisaCancelledDeniedRejected);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BVisaInformation1Insert`(IN `AppId` VARCHAR(200), IN `EverEnteredUS` VARCHAR(50), IN `DateofLastEntryUS` VARCHAR(100), IN `I94Number` VARCHAR(50), IN `CurrentUSImmigrationStatus` VARCHAR(100), IN `LastEntryUSCity` VARCHAR(500), IN `LastEntryUSState` VARCHAR(500), IN `ExpirationStatusI94_I688` VARCHAR(100), IN `VisaNumber` VARCHAR(100), IN `VisaIssuanceCity` VARCHAR(500), IN `VisaIssuanceCountry` VARCHAR(500), IN `ViaIssuanceDate` VARCHAR(100), IN `VisaExpirationDate` VARCHAR(100), IN `EverFiledI140ImmigrationPetition` VARCHAR(50), IN `I140ApprovedDenied` VARCHAR(50), IN `I140PriorityDate` VARCHAR(100), IN `I140ReceiptCategoryPriorityDate` VARCHAR(1000), IN `EverAppliedGreenCardOrPermanentResidencyByYou_Family` VARCHAR(50), IN `DatePlaceOutcomeOfGreenCardOrPermanentResidency` VARCHAR(1000))
BEGIN

INSERT INTO visainformation1
(CustAppInfoId,EverEnteredUS,DateofLastEntryUS,I94Number,CurrentUSImmigrationStatus,LastEntryUSCity,
LastEntryUSState,ExpirationStatusI94_I688,VisaNumber,VisaIssuanceCity,VisaIssuanceCountry,ViaIssuanceDate,
VisaExpirationDate,EverFiledI140ImmigrationPetition,I140ApprovedDenied,I140PriorityDate,I140ReceiptCategoryPriorityDate,
EverAppliedGreenCardOrPermanentResidencyByYou_Family,DatePlaceOutcomeOfGreenCardOrPermanentResidency
)
VALUES
(AppId,EverEnteredUS,DateofLastEntryUS,I94Number,CurrentUSImmigrationStatus,LastEntryUSCity,
LastEntryUSState,ExpirationStatusI94_I688,VisaNumber,VisaIssuanceCity,VisaIssuanceCountry,ViaIssuanceDate,
VisaExpirationDate,EverFiledI140ImmigrationPetition,I140ApprovedDenied,I140PriorityDate,I140ReceiptCategoryPriorityDate,
EverAppliedGreenCardOrPermanentResidencyByYou_Family,DatePlaceOutcomeOfGreenCardOrPermanentResidency);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BVisaInformation2Insert`(IN `AppId` VARCHAR(200), IN `F1Status_CPTTraining` VARCHAR(50), IN `CPTWithGraduateDegree` VARCHAR(50), IN `StartedCPTAfterDegreeProgram` VARCHAR(50), IN `IfinF1_AppliedOTP` VARCHAR(50), IN `I765Approved_Pending` VARCHAR(50), IN `I765ReceiptNumber` VARCHAR(100), IN `IfI765Approved_NoOfDaysUnemployedAfterEAD` VARCHAR(50), IN `J1orJ2Visa` VARCHAR(50), IN `TwoYrHomeResidencyRequirement` VARCHAR(50), IN `J1orJ2SubmittedApplicationForWaiver` VARCHAR(50), IN `F1OrJ1SEVISNumber` VARCHAR(100), IN `EverBeenInUSInHOrLStatus` VARCHAR(50), IN `EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus` VARCHAR(50), IN `FiledH1BDuringPreviousFiscalYear` VARCHAR(50), IN `AppliedH1BPursuantToApprovedPetitionAndEnterUS` VARCHAR(50), IN `StartedEmploymentInUS` VARCHAR(50), IN `NotStartedEmploymentSelectReason` VARCHAR(500), IN `HOrLPetitionDenied` VARCHAR(50), IN `IfYesEnterReason` VARCHAR(8000))
BEGIN


INSERT INTO visainformation2
(CustAppInfoId,F1Status_CPTTraining,CPTWithGraduateDegree,StartedCPTAfterDegreeProgram,IfinF1_AppliedOTP,I765Approved_Pending,
I765ReceiptNumber,IfI765Approved_NoOfDaysUnemployedAfterEAD,J1orJ2Visa,TwoYrHomeResidencyRequirement,J1orJ2SubmittedApplicationForWaiver,
F1OrJ1SEVISNumber,EverBeenInUSInHOrLStatus,EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus,FiledH1BDuringPreviousFiscalYear,
AppliedH1BPursuantToApprovedPetitionAndEnterUS,StartedEmploymentInUS,NotStartedEmploymentSelectReason,HOrLPetitionDenied,IfYesEnterReason
)
VALUES
(AppId,F1Status_CPTTraining,CPTWithGraduateDegree,StartedCPTAfterDegreeProgram,IfinF1_AppliedOTP,I765Approved_Pending,
I765ReceiptNumber,IfI765Approved_NoOfDaysUnemployedAfterEAD,J1orJ2Visa,TwoYrHomeResidencyRequirement,J1orJ2SubmittedApplicationForWaiver,
F1OrJ1SEVISNumber,EverBeenInUSInHOrLStatus,EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus,FiledH1BDuringPreviousFiscalYear,
AppliedH1BPursuantToApprovedPetitionAndEnterUS,StartedEmploymentInUS,NotStartedEmploymentSelectReason,HOrLPetitionDenied,IfYesEnterReason);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadDS160`(IN `ProfileId` INT, IN `CountryId` INT, IN `VisaTypeId` INT)
BEGIN

 
 SELECT cp1.First_Name,
       cp1.Last_Name,
       cp1.Full_Name_In_Native_Language,
       cp1.Other_Name_Used,
       cp1.Other_Name_1,
       cp1.Other_Name_2,
       cp1.Other_Name_3,
       cp1.Sex,
       cp1.Marital_Status,
       cp1.Date_Of_Birth,
       cp1.City_Of_Birth,
       cp1.State_Of_Birth,
       cp1.Nationality,
       cp1.Other_Nationalities,

       cp1.National_Identification_Number,
       cp1.US_Social_Security_Number,
       cp1.US_Taxpayer_ID_Number,
       cp1.Home_Address,
       cp1.City,
       cp2.State_Province,
       cp2.PostalZone_ZIPCode,
       cp2.Country,
       cp2.Same_Mailing_Address,
       cp2.Mailing_Home_Address,
       cp2.Mailing_City,
       cp2.Mailing_State_Province,
       cp2.Mailing_PostalZone_ZIPCode,
       cp2.Mailing_Country,
       cp2.Home_Phone_Number,
       cp2.Work_Phone_Number,
       cp2.Work_Fax_Number,
       cp2.Mobile_Cell_Phone_Number,
       cp2.Email_Address,
       cp2.Passport_Number,
       cp2.Passport_Book_Number,
       cp2.Country_Authority_Issued_Passport,
       cp2.City_Issued_Passport,
       cp3.State_Province_Issued_Passport,
       cp3.Country_Issued_Passport,
       cp3.Issuance_Date_Passport,
       cp3.Expiration_Date_Passport,
       cp3.Passport_Stolen_Lost,
       ct1.Principal_Applicant,
	   ct1.Trip_Purpose_1,
	   ct1.Trip_Purpose_2,
	   ct1.Trip_Purpose_3,
	   ct1.Trip_Purpose_4,
	   ct1.Intended_Date_Of_Arrival,
	   ct1.Intended_Length_Of_Stay_US,
	   ct1.Address_of_US_Stay,
	   ct1.Person_Entity_Paying_US_Trip,
	   ct1.Telephone,
	   ct1.Email_Address Travel_Email_Address,
	   ct1.Relationship_To_You,
	   ct1.PayingPartyTripAddress_SameAsHomeMailingAddress,
	   ct1.PartyPayingAddress,
	   ct1.PartyPayingCity,
	   ct1.PartyPayingState_Province,
	   ct1.PostalZone_ZIPcode Travel_PostalZone_ZIPcode,
	   ct1.Country Travel_Country,
	   ct1.OtherPersonTravellingWithYou,
	   ct2.TravellingPartofGroup_Organizantion,
	   ct2.PersonTravellingWithYou_Name_1,
	   ct2.PersonTravellingWithYou_Name_2,
	   ct2.PersonTravellingWithYou_Name_3,
	   ct2.PersonTravellingWithYou_Name_4,
	   ct2.PersonTravellingWithYou_Name_5,
	   ct2.PersonTravellingWithYou_Relationship_1,
	   ct2.PersonTravellingWithYou_Relationship_2,
	   ct2.PersonTravellingWithYou_Relationship_3,
	   ct2.PersonTravellingWithYou_Relationship_4,
	   ct2.PersonTravellingWithYou_Relationship_5,
	   ct2.EverBeenToUS,
       ct2.EverBeenIssuedUSVisa,
	   ct2.EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication,
	   cu.ContactPersonNameInUS,
	   cu.OrganizationNameInUS,
	   cu.Relationship,
	   cu.ContactAddressUS,
	   cu.Phone_Number,
	   cu.Email_Address Contact_Email_Address,
	   cf1.FatherSurname,
	   cf1.FatherGivenName,
	   cf1.FatherDateofBirth,
	   cf1.IsYourFatherInUS,
	   cf1.MotherSurname,
	   cf1.MotherGivenName,
	   cf1.IsYourMotherInUS,
	   cf1.ImmediateRelativesInUS_ApartFatherMother,
	   cf1.Relative_Name_1,
	   cf1.Relationship_To_Relative_1,
	   cf1.Relative_Status_1,
	   cf1.Relative_Name_2,
	   cf1.Relationship_To_Relative_2,
	   cf1.Relative_Status_2,
	   cf1.Relative_Name_3,
	   cf1.Relationship_To_Relative_3,
	   cf1.Relative_Status_3,
	   cf2.Relative_Name_4,
	   cf2.Relationship_To_Relative_4,
	   cf2.Relative_Status_4,
	   cf2.Spouse_FullName,
	   cf2.Spouse_DateOfBirth,
	   cf2.Spouse_Nationality,
	   cf2.Spouse_CityOfBirth,
	   cf2.Spouse_CountryOfBirth,
	   cf2.Spouse_Address,
	   cw.Primary_Occupation,
	   cw.PresentEmployer_SchoolName,
	   cw.Address,
	   cw.City Work_City,
	   cw.State_Province Work_State_Province,
	   cw.PostalZone_ZipCode Work_PostalZone_ZipCode,
	   cw.Country Work_Country,
	   cw.MonthSalary_LocalCurrency,
	   cw.BrifelyDescribeYourDuties,
	   cl.CurrentLocation,
	   cpa.AnyoneAssistInFillingApplication 
 FROM custpersonalinfo1 cp1
 LEFT JOIN custpersonalinfo2 cp2 ON cp1.CustAppInfoId = cp2.CustAppInfoId
 LEFT JOIN custpersonalinfo3 cp3 ON cp1.CustAppInfoId = cp3.CustAppInfoId
 LEFT JOIN custtravelinfo1 ct1 ON cp1.CustAppInfoId = ct1.CustAppInfoId
 LEFT JOIN custtravelinfo2 ct2 ON cp1.CustAppInfoId = ct2.CustAppInfoId
 LEFT JOIN custuscontactinfo cu ON cp1.CustAppInfoId = cu.CustAppInfoId
 LEFT JOIN custfamilyinfo1 cf1 ON cp1.CustAppInfoId = cf1.CustAppInfoId
 LEFT JOIN custfamilyinfo2 cf2 ON cp1.CustAppInfoId = cf2.CustAppInfoId
 LEFT JOIN custworkeducationtraininginfo cw ON cp1.CustAppInfoId = cw.CustAppInfoId
 LEFT JOIN custlocalinfo cl ON cp1.CustAppInfoId = cl.CustAppInfoId
 LEFT JOIN custpreparerappinfo cpa ON cp1.CustAppInfoId = cpa.CustAppInfoId
 WHERE cp1.CustAppInfoId = (SELECT CustAppInfoId FROM (SELECT CustProfileInfoId,MAX(CustAppInfoId) CustAppInfoId 
FROM custappinfo
WHERE CustProfileInfoId = ProfileId AND countryListId = CountryId AND CountryVisaTypeListid = VisaTypeId
AND Activated = '1' AND FormId = 1
GROUP BY CustProfileInfoId)A);



 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadDS160Menu`()
BEGIN

SELECT MenuDescription FROM ds160menuinfo;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadEventLog`(IN `UserName` VARCHAR(200))
BEGIN

SELECT EventType,EventDescription FROM eventlog
WHERE CustProfileInfoId IN (SELECT CustProfileInfoId FROM custprofileinfo WHERE UserName = 'hrazith');

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadH1B`(IN `UserName` VARCHAR(200), IN `AppId` INT)
BEGIN


                       SELECT p1.FirstName,
                   p1.MiddleName,
                   p1.LastName,
                   p1.MaidenName,
                   p1.AliasFirstName,
                   p1.AliasLastName,
                   p1.OtherName1,
                   p1.OtherName2,
                   p1.OtherName3,
                   p1.EmailAddress,
                   p1.WorkPhone,
                   p1.HomePhone,
                   p1.MobilePhone,
                   p1.Gender,
                   p1.DateofBirth,
                   p1.CityofBirth,
                   p1.StateofBirth,
                   p1.CountryofBirth,
                   p2.Nationality,
                   p2.PermanentResident_Immigrant,
                   p2.RecentCitizenship_PR_Immigrant,
                   p2.PassportNumber,
                   p2.PassportIssueDate,
                   p2.PassportExpirationDate,
                   p2.PassportIssuedCity,
                   p2.PassportIssuedState,
                   p2.PassportIssuedCountry,
                   p2.BlankPagesInPassport,
                   ha.HaveUSHomeAddress,
                   ha.USHomeAddressDateFrom,
                   ha.USHomeAddressDateTo,
                   ha.StreetAddress USStreetAddress,
                   ha.Address2 USAddress2 ,
                   ha.City USCity,
                   ha.StateProvinceRegion USStateProvinceRegion,
                   ha.ZipCode USZipCode,
                   ha.Country USCountry,
                   ha.SameAsCurrentmaiingAddress,
                   ha.Address2_1,
                   ha.City_1,
                   ha.StateProvinceRegion_1,
                   ha.ZipCode_1,
                   ha.Country_1,
                   ha.PhoneNumberWithThisAddress,
                   ha.PlanOfChangingPlaceOfResidenceInNext4Months USPlanOfChangingPlaceOfResidenceInNext4Months,
                   ha.IfYesMovingDateAndNewAddress,
                   oa.OverseasPermanentAddressDateFrom,
                   oa.OverseasPermanentAddressDateTo,
                   oa.StreetAddress OSStreetAddress,
                   oa.Address2 OSAddress2,
                   oa.City OSCity,
                   oa.StateProvinceRegion OSStateProvinceRegion,
                   oa.ZipCode OSZipCode,
                   oa.Country OSCountry,
                   oa.PlanOfChangingPlaceOfResidenceInNext4Months OSPlanOfChangingPlaceOfResidenceInNext4Months,
                   e.InstitutionFullName,
                   e.InstitutionType,
                   e.InstitutionAccreditationStatus,
                   e.DateAttendedFrom,
                   e.DateAttendedTo,
                   e.MajorOrFieldOfStudy,
                   e.DegreeReceived,
                   e.Notes,
                   e1.EmploymentType,
                   e1.EmploymentDateFrom,
                   e1.EmploymentDateTo,
                   e1.StreetAddress EmpStreetAddress,
                   e1.Address2 EmpAddress2,
                   e1.City EmpCity,
                   e1.StateProvinceRegion EmpStateProvinceRegion,
                   e1.ZipCode EmpZipCode,
                   e1.Country EmpCountry,
                   e1.EmployerIsUniversityOrNonProfit,
                   e1.TypeOfBusiness,
                   e1.HoursPerWeek,
                   e1.IsPositionPartTime,
                   e1.JobTitle,
                   e1.CurrentAnnualBaseSalary,
                   e1.DetailJobDuties,
                   e1.TechnologiesUsed,
                   e2.SupervisorName,
                   e2.SupervisorPhoneNumber,
                   e2.SuperVisorJobTitle,
                   e2.AnyInterruptionsInEmploymentWithEmployer,
                   e2.WorkingOutsideTheUS,
                   e2.IfWorkingOutsideDoesItInvolveSupervision,
                   v1.EverEnteredUS,
                   v1.DateofLastEntryUS,
                   v1.I94Number,
                   v1.CurrentUSImmigrationStatus,
                   v1.LastEntryUSCity,
                   v1.LastEntryUSState,
                   v1.ExpirationStatusI94_I688,
                   v1.VisaNumber,
                   v1.VisaIssuanceCity,
                   v1.VisaIssuanceCountry,
                   v1.ViaIssuanceDate,
                   v1.VisaExpirationDate,
                   v1.EverFiledI140ImmigrationPetition,
                   v1.I140ApprovedDenied,
                   v1.I140PriorityDate,
                   v1.I140ReceiptCategoryPriorityDate,
                   v1.EverAppliedGreenCardOrPermanentResidencyByYou_Family,
                   v1.DatePlaceOutcomeOfGreenCardOrPermanentResidency,
                   v2.F1Status_CPTTraining,
                   v2.CPTWithGraduateDegree,
                   v2.StartedCPTAfterDegreeProgram,
                   v2.IfinF1_AppliedOTP,
                   v2.I765Approved_Pending,
                   v2.I765ReceiptNumber,
                   v2.IfI765Approved_NoOfDaysUnemployedAfterEAD,
                   v2.J1orJ2Visa,
                   v2.TwoYrHomeResidencyRequirement,
                   v2.J1orJ2SubmittedApplicationForWaiver,
                   v2.F1OrJ1SEVISNumber,
                   v2.EverBeenInUSInHOrLStatus,
                   v2.EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus,
                   v2.FiledH1BDuringPreviousFiscalYear,
                   v2.AppliedH1BPursuantToApprovedPetitionAndEnterUS,
                   v2.StartedEmploymentInUS,
                   v2.NotStartedEmploymentSelectReason,
                   v2.HOrLPetitionDenied,
                   v2.IfYesEnterReason,
                   va.ResidingOutsideUS,
                   va.USConsulateLocationOutsideUS,
                   va.AppliedNonImmigrantUSVisa,
                   va.VisaCancelledDeniedRejected
                FROM personaldetail1 p1 
                LEFT JOIN personaldetail2 p2 ON p1.CustAppInfoId = p2.CustAppInfoId
                LEFT JOIN ushomeaddress ha ON p1.CustAppInfoId = ha.CustAppInfoId
                LEFT JOIN overseaspermanentaddress oa ON p1.CustAppInfoId = oa.CustAppInfoId
                LEFT JOIN education e ON p1.CustAppInfoId = e.CustAppInfoId
                LEFT JOIN employment1 e1 ON p1.CustAppInfoId = e1.CustAppInfoId
                LEFT JOIN employment2 e2 ON p1.CustAppInfoId = e2.CustAppInfoId
                LEFT JOIN internationtravel i ON p1.CustAppInfoId = i.CustAppInfoId
                LEFT JOIN visainformation1 v1 ON p1.CustAppInfoId = v1.CustAppInfoId
                LEFT JOIN visainformation2 v2 ON p1.CustAppInfoId = v2.CustAppInfoId
                LEFT JOIN visaapplication va ON p1.CustAppInfoId = va.CustAppInfoId
                LEFT JOIN custappinfo app ON p1.CustAppInfoId = app.CustAppInfoId
                LEFT JOIN custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
                WHERE p1.CustAppInfoId = AppId 
                      AND cp.UserName = UserName;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadH1BFromDS160`(IN `UserName` VARCHAR(200))
BEGIN


SELECT DS.FirstName,
       p1.MiddleName,
	   DS.LastName,
       DS.MaidenName,
       p1.AliasFirstName,
       p1.AliasLastName,
       DS.OtherName1,
       DS.OtherName2,
       DS.OtherName3,
       DS.EmailAddress,
       DS.WorkPhone,
       DS.HomePhone,
       DS.MobilePhone,
       DS.Gender,
       DS.DateofBirth,
       DS.CityofBirth,
       DS.StateofBirth,
       p1.CountryofBirth,
       DS.Nationality,
       p2.PermanentResident_Immigrant,
       p2.RecentCitizenship_PR_Immigrant,
       DS.PassportNumber,
       DS.PassportIssuedDate,
       DS.PassportExpirationDate,
       DS.PassportIssuedCity,
       DS.PassportIssuedState,
       DS.PassportIssuedCountry,
       p2.BlankPagesInPassport,
       ha.HaveUSHomeAddress,
       ha.USHomeAddressDateFrom,
       ha.USHomeAddressDateTo,
       ha.StreetAddress USStreetAddress,
       ha.Address2 USAddress2 ,
       ha.City USCity,
       ha.StateProvinceRegion USStateProvinceRegion,
       ha.ZipCode USZipCode,
       ha.Country USCountry,
       ha.SameAsCurrentmaiingAddress,
       ha.Address2_1,
       ha.City_1,
       ha.StateProvinceRegion_1,
       ha.ZipCode_1,
       ha.Country_1,
       ha.PhoneNumberWithThisAddress,
       ha.PlanOfChangingPlaceOfResidenceInNext4Months USPlanOfChangingPlaceOfResidenceInNext4Months,
       ha.IfYesMovingDateAndNewAddress,
       oa.OverseasPermanentAddressDateFrom,
       oa.OverseasPermanentAddressDateTo,
       oa.StreetAddress OSStreetAddress,
       oa.Address2 OSAddress2,
       oa.City OSCity,
       oa.StateProvinceRegion OSStateProvinceRegion,
       oa.ZipCode OSZipCode,
       oa.Country OSCountry,
       oa.PlanOfChangingPlaceOfResidenceInNext4Months OSPlanOfChangingPlaceOfResidenceInNext4Months,
       e.InstitutionFullName,
       e.InstitutionType,
       e.InstitutionAccreditationStatus,
       e.DateAttendedFrom,
       e.DateAttendedTo,
       e.MajorOrFieldOfStudy,
       e.DegreeReceived,
       e.Notes,
       e1.EmploymentType,
       e1.EmploymentDateFrom,
       e1.EmploymentDateTo,
       e1.StreetAddress EmpStreetAddress,
       e1.Address2 EmpAddress2,
       e1.City EmpCity,
       e1.StateProvinceRegion EmpStateProvinceRegion,
       e1.ZipCode EmpZipCode,
       e1.Country EmpCountry,

       e1.EmployerIsUniversityOrNonProfit,
       e1.TypeOfBusiness,
       e1.HoursPerWeek,
       e1.IsPositionPartTime,
       e1.JobTitle,
       e1.CurrentAnnualBaseSalary,
       e1.DetailJobDuties,
       e1.TechnologiesUsed,
       e2.SupervisorName,
       e2.SupervisorPhoneNumber,
       e2.SuperVisorJobTitle,
       e2.AnyInterruptionsInEmploymentWithEmployer,
       e2.WorkingOutsideTheUS,
       e2.IfWorkingOutsideDoesItInvolveSupervision,
       v1.EverEnteredUS,
       v1.DateofLastEntryUS,
       v1.I94Number,
       v1.CurrentUSImmigrationStatus,
       v1.LastEntryUSCity,
       v1.LastEntryUSState,
       v1.ExpirationStatusI94_I688,
       v1.VisaNumber,
       v1.VisaIssuanceCity,
       v1.VisaIssuanceCountry,
       v1.ViaIssuanceDate,
       v1.VisaExpirationDate,
       v1.EverFiledI140ImmigrationPetition,
       v1.I140ApprovedDenied,
       v1.I140PriorityDate,
       v1.I140ReceiptCategoryPriorityDate,
       v1.EverAppliedGreenCardOrPermanentResidencyByYou_Family,
       v1.DatePlaceOutcomeOfGreenCardOrPermanentResidency,
       v2.F1Status_CPTTraining,
       v2.CPTWithGraduateDegree,
       v2.StartedCPTAfterDegreeProgram,
       v2.IfinF1_AppliedOTP,
       v2.I765Approved_Pending,
       v2.I765ReceiptNumber,
       v2.IfI765Approved_NoOfDaysUnemployedAfterEAD,
       v2.J1orJ2Visa,
       v2.TwoYrHomeResidencyRequirement,
       v2.J1orJ2SubmittedApplicationForWaiver,
       v2.F1OrJ1SEVISNumber,
       v2.EverBeenInUSInHOrLStatus,
       v2.EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus,
       v2.FiledH1BDuringPreviousFiscalYear,
       v2.AppliedH1BPursuantToApprovedPetitionAndEnterUS,
       v2.StartedEmploymentInUS,
       v2.NotStartedEmploymentSelectReason,
       v2.HOrLPetitionDenied,
       v2.IfYesEnterReason,
       va.ResidingOutsideUS,
       va.USConsulateLocationOutsideUS,
       va.AppliedNonImmigrantUSVisa,
       va.VisaCancelledDeniedRejected
        FROM (
                SELECT c1.First_Name FirstName,
                       c1.Last_Name LastName,
                       c1.Full_Name_In_Native_Language MaidenName,
                       c1.Other_Name_1 OtherName1,
                       c1.Other_Name_2 OtherName2,
                       c1.Other_Name_3 OtherName3,
                       c2.Email_Address EmailAddress,
                       c2.Work_Phone_Number WorkPhone,
                       c2.Home_Phone_Number HomePhone,
                       c2.Mobile_Cell_Phone_Number MobilePhone,
                       c1.Sex Gender,
                       c1.Date_Of_Birth DateofBirth,
                       c1.City_Of_Birth CityofBirth,
                       c1.State_Of_Birth StateofBirth,
                       c1.Nationality,
                       c2.Passport_Number PassportNumber,
                       c3.Issuance_Date_Passport PassportIssuedDate,
                       c3.Expiration_Date_Passport PassportExpirationDate,
                       c2.City_Issued_Passport PassportIssuedCity,
                       c3.State_Province_Issued_Passport PassportIssuedState,
                       c3.Country_Issued_Passport PassportIssuedCountry,
                       A.CustAppInfoId,
                       cp.UserName
                FROM custpersonalinfo1 c1 
                LEFT JOIN custpersonalinfo2 c2 ON c1.CustAppInfoId = c2.CustAppInfoId
                LEFT JOIN custpersonalinfo3 c3 ON c1.CustAppInfoId = c3.CustAppInfoId
                LEFT JOIN (SELECT cp.CustProfileInfoId,MAX(app.CustAppInfoId)CustAppInfoId FROM custappinfo app 
                           inner join custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
                           WHERE cp.UserName = 'hrazith' AND FormId = 1 AND CountryListID IN (SELECT CountryListId FROM countrylist WHERE CountryName = 'United States')
                           GROUP BY cp.CustProfileInfoId)A ON c1.CustAppInfoId = A.CustAppInfoId
                LEFT JOIN custprofileinfo cp ON cp.UserName = 'hrazith'
                WHERE A.CustAppInfoId IS NOT NULL)DS
                LEFT JOIN personaldetail1 p1 ON DS.CustAppInfoId = p1.CustAppInfoId
                LEFT JOIN personaldetail2 p2 ON p1.CustAppInfoId = p2.CustAppInfoId
                LEFT JOIN ushomeaddress ha ON p1.CustAppInfoId = ha.CustAppInfoId
                LEFT JOIN overseaspermanentaddress oa ON p1.CustAppInfoId = oa.CustAppInfoId
                LEFT JOIN education e ON p1.CustAppInfoId = e.CustAppInfoId
                LEFT JOIN employment1 e1 ON p1.CustAppInfoId = e1.CustAppInfoId
                LEFT JOIN employment2 e2 ON p1.CustAppInfoId = e2.CustAppInfoId
                LEFT JOIN internationtravel i ON p1.CustAppInfoId = i.CustAppInfoId
                LEFT JOIN visainformation1 v1 ON p1.CustAppInfoId = v1.CustAppInfoId
                LEFT JOIN visainformation2 v2 ON p1.CustAppInfoId = v2.CustAppInfoId
                LEFT JOIN visaapplication va ON p1.CustAppInfoId = va.CustAppInfoId
                WHERE DS.UserName = UserName;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procTableRelations`()
BEGIN

SELECT 
  `TABLE_SCHEMA`,                            `TABLE_NAME`,                              `COLUMN_NAME`,                             `REFERENCED_TABLE_SCHEMA`,                 `REFERENCED_TABLE_NAME`,                   `REFERENCED_COLUMN_NAME`                 FROM
  `INFORMATION_SCHEMA`.`KEY_COLUMN_USAGE` 
WHERE
  `TABLE_SCHEMA` = 'autumn'               
  AND `REFERENCED_TABLE_NAME` IS NOT NULL;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fnCalculateAppPercentageCompleted`(`AppID` INT) RETURNS varchar(255) CHARSET latin1
BEGIN

SET @TotalColumnCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME IN ('custpersonalinfo1','custpersonalinfo2','custpersonalinfo3','custtravelinfo1','custtravelinfo2','custfamilyinfo1','custfamilyinfo2',
                                             'custuscontactinfo','custworkeducationtraininginfo','custlocalinfo','custpreparerappinfo')
                         AND Column_Name NOT IN ('CustAppInfoId','CustPersonalInfoId','CustTravelInfoId','CustFamilyInfoId','CustUSContactInfoId','CustWorkEducationTrainingInfoId',
                                                 'CustLocalInfoId',
                                                 'CustPrepareAppInfoId'));
                                                

											
SET @custpersonalInfo1BaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custpersonalinfo1'
                         AND Column_Name NOT IN ('CustAppInfoId','CustPersonalInfoId'));
                         
SET @custpersonalInfo2BaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custpersonalinfo2'
                         AND Column_Name NOT IN ('CustAppInfoId','CustPersonalInfoId'));
                         
SET @custpersonalInfo3BaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custpersonalinfo3'
                         AND Column_Name NOT IN ('CustAppInfoId','CustPersonalInfoId'));
                         
SET @custtravelInfo1BaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custtravelinfo1'
                         AND Column_Name NOT IN ('CustAppInfoId','CustTravelInfoId'));
                         
SET @custtravelInfo2BaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custtravelinfo2'
                         AND Column_Name NOT IN ('CustAppInfoId','CustTravelInfoId'));
                         
SET @custfamilyInfo1BaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custfamilyinfo1'
                         AND Column_Name NOT IN ('CustAppInfoId','CustFamilyInfoId'));
                         
SET @custfamilyInfo2BaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custfamilyinfo2'
                         AND Column_Name NOT IN ('CustAppInfoId','CustFamilyInfoId'));
                         
SET @custuscontactInfoBaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custuscontactInfo'
                         AND Column_Name NOT IN ('CustAppInfoId','CustUSContactInfoId'));
                         
SET @custworkeducationtrainingInfoBaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custworkeducationtrainingInfo'
                         AND Column_Name NOT IN ('CustAppInfoId','CustWorkEducationTrainingInfoId'));
                         
SET @custlocalInfoBaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custlocalInfo'
                         AND Column_Name NOT IN ('CustAppInfoId','CustLocalInfoId'));
                         
SET @custpreparerappInfoBaseCount = (SELECT COUNT(*) ColumnCount FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'custpreparerappInfo'
                         AND Column_Name NOT IN ('CustAppInfoId','CustPrepareAppInfoId'));
                         


SET @custpersonalInfo1 = (  SELECT IF(First_Name = '',1,0) + IF(First_Name = NULL,1,0) + IF(First_Name = 'NULL',1,0) + 
                                   IF(Last_Name = '',1,0) + IF(Last_Name = NULL,1,0) + IF(Last_Name = 'NULL',1,0) + 
                                   IF(Full_Name_In_Native_Language = '',1,0) + IF(Full_Name_In_Native_Language = NULL,1,0) + IF(Full_Name_In_Native_Language = 'NULL',1,0) +
                                   IF(Other_Name_Used = '',1,0) + IF(Other_Name_Used = NULL,1,0) + IF(Other_Name_Used = 'NULL',1,0) +
                                   IF(Other_Name_1 = '',1,0) + IF(Other_Name_1 = NULL,1,0) + IF(Other_Name_1 = 'NULL',1,0) +
                                   IF(Other_Name_2 = '',1,0) + IF(Other_Name_3 = NULL,1,0) + IF(Other_Name_3 = 'NULL',1,0) +
                                   IF(Other_Name_3 = '',1,0) + IF(Other_Name_3 = NULL,1,0) + IF(Other_Name_3 = 'NULL',1,0) +
                                   IF(Sex = '',1,0) + IF(Sex = NULL,1,0) + IF(Sex = 'NULL',1,0) + 
                                   IF(Marital_Status = '',1,0) + IF(Marital_Status = NULL,1,0) + IF(Marital_Status = 'NULL',1,0) +
                                   IF(Date_Of_Birth = '',1,0) + IF(Date_Of_Birth = NULL,1,0) + IF(Date_Of_Birth = 'NULL',1,0) +
                                   IF(City_Of_Birth = '',1,0) + IF(City_Of_Birth = NULL,1,0) + IF(City_Of_Birth = 'NULL',1,0) +
                                   IF(State_Of_Birth = '',1,0) + IF(State_Of_Birth = NULL,1,0) + IF(State_Of_Birth = 'NULL',1,0) + 
                                   IF(Nationality = '',1,0) + IF(Nationality = NULL,1,0) + IF(Nationality = 'NULL',1,0) + 
                                   IF(Other_Nationalities = '',1,0) + IF(Other_Nationalities = NULL,1,0) + IF(Other_Nationalities = 'NULL',1,0) +
                                   IF(National_Identification_Number = '',1,0) + IF(National_Identification_Number = NULL,1,0) + IF(National_Identification_Number = 'NULL',1,0) +
                                   IF(US_Social_Security_Number = '',1,0) + IF(US_Social_Security_Number = NULL,1,0) + IF(US_Social_Security_Number = 'NULL',1,0) +
                                   IF(US_Taxpayer_ID_Number = '',1,0) + IF(US_Taxpayer_ID_Number = NULL,1,0) + IF(US_Taxpayer_ID_Number = 'NULL',1,0) + 
                                   IF(Home_Address = '',1,0) + IF(Home_Address = NULL,1,0) + IF(Home_Address = 'NULL',1,0) +
                                   IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custpersonalinfo1
                            WHERE CustappInfoId = AppId);
                            
                            
SET @custpersonalInfo2 = (  SELECT IF(State_Province = '',1,0) + IF(State_Province = NULL,1,0) + IF(State_Province = 'NULL',1,0) + 
                                   IF(PostalZone_ZIPCode = '',1,0) + IF(PostalZone_ZIPCode = NULL,1,0) + IF(PostalZone_ZIPCode = 'NULL',1,0) + 
                                   IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) +
                                   IF(Same_Mailing_Address = '',1,0) + IF(Same_Mailing_Address = NULL,1,0) + IF(Same_Mailing_Address = 'NULL',1,0) +
                                   IF(Mailing_Home_Address = '',1,0) + IF(Mailing_Home_Address = NULL,1,0) + IF(Mailing_Home_Address = 'NULL',1,0) +
                                   IF(Mailing_City = '',1,0) + IF(Mailing_City = NULL,1,0) + IF(Mailing_City = 'NULL',1,0) +
                                   IF(Mailing_State_Province = '',1,0) + IF(Mailing_State_Province = NULL,1,0) + IF(Mailing_State_Province = 'NULL',1,0) +
                                   IF(Mailing_PostalZone_ZIPCode = '',1,0) + IF(Mailing_PostalZone_ZIPCode = NULL,1,0) + IF(Mailing_PostalZone_ZIPCode = 'NULL',1,0) + 
                                   IF(Mailing_Country = '',1,0) + IF(Mailing_Country = NULL,1,0) + IF(Mailing_Country = 'NULL',1,0) +
                                   IF(Home_Phone_Number = '',1,0) + IF(Home_Phone_Number = NULL,1,0) + IF(Home_Phone_Number = 'NULL',1,0) +
                                   IF(Work_Phone_Number = '',1,0) + IF(Work_Phone_Number = NULL,1,0) + IF(Work_Phone_Number = 'NULL',1,0) +
                                   IF(Work_Fax_Number = '',1,0) + IF(Work_Fax_Number = NULL,1,0) + IF(Work_Fax_Number = 'NULL',1,0) + 
                                   IF(Mobile_Cell_Phone_Number = '',1,0) + IF(Mobile_Cell_Phone_Number = NULL,1,0) + IF(Mobile_Cell_Phone_Number = 'NULL',1,0) + 
                                   IF(Email_Address = '',1,0) + IF(Email_Address = NULL,1,0) + IF(Email_Address = 'NULL',1,0) +
                                   IF(Passport_Number = '',1,0) + IF(Passport_Number = NULL,1,0) + IF(Passport_Number = 'NULL',1,0) +
                                   IF(Passport_Book_Number = '',1,0) + IF(Passport_Book_Number = NULL,1,0) + IF(Passport_Book_Number = 'NULL',1,0) +
                                   IF(Country_Authority_Issued_Passport = '',1,0) + IF(Country_Authority_Issued_Passport = NULL,1,0) + IF(Country_Authority_Issued_Passport = 'NULL',1,0) + 
                                   IF(City_Issued_Passport = '',1,0) + IF(City_Issued_Passport = NULL,1,0) + IF(City_Issued_Passport = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custpersonalinfo2
                            WHERE CustappInfoId = AppId);
                            
                            
SET @custpersonalInfo3 = (  SELECT IF(State_Province_Issued_Passport = '',1,0) + IF(State_Province_Issued_Passport = NULL,1,0) + 
                                      IF(State_Province_Issued_Passport = 'NULL',1,0) + 
                                   IF(Country_Issued_Passport = '',1,0) + IF(Country_Issued_Passport = NULL,1,0) + IF(Country_Issued_Passport = 'NULL',1,0) + 
                                   IF(Issuance_Date_Passport = '',1,0) + IF(Issuance_Date_Passport = NULL,1,0) + IF(Issuance_Date_Passport = 'NULL',1,0) +
                                   IF(Expiration_Date_Passport = '',1,0) + IF(Expiration_Date_Passport = NULL,1,0) + IF(Expiration_Date_Passport = 'NULL',1,0) +
                                   IF(Passport_Stolen_Lost = '',1,0) + IF(Passport_Stolen_Lost = NULL,1,0) + IF(Passport_Stolen_Lost = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custpersonalinfo3
                            WHERE CustappInfoId = AppId);
                            

                            
SET @custravelInfo1 = ( SELECT IF(Principal_Applicant = '',1,0) + IF(Principal_Applicant = NULL,1,0) + IF(Principal_Applicant = 'NULL',1,0) + 
                               IF(Trip_Purpose_1 = '',1,0) + IF(Trip_Purpose_1 = NULL,1,0) + IF(Trip_Purpose_1 = 'NULL',1,0) + 
                               IF(Trip_Purpose_2 = '',1,0) + IF(Trip_Purpose_2 = NULL,1,0) + IF(Trip_Purpose_2 = 'NULL',1,0) +
                               IF(Trip_Purpose_3 = '',1,0) + IF(Trip_Purpose_3 = NULL,1,0) + IF(Trip_Purpose_3 = 'NULL',1,0) +
                               IF(Trip_Purpose_4 = '',1,0) + IF(Trip_Purpose_4 = NULL,1,0) + IF(Trip_Purpose_4 = 'NULL',1,0) +
                               IF(Intended_Date_Of_Arrival = '',1,0) + IF(Intended_Date_Of_Arrival = NULL,1,0) + IF(Intended_Date_Of_Arrival = 'NULL',1,0) + 
                               IF(Intended_Length_Of_Stay_US = '',1,0) + IF(Intended_Length_Of_Stay_US = NULL,1,0) + IF(Intended_Length_Of_Stay_US = 'NULL',1,0) +
                               IF(Address_of_US_Stay = '',1,0) + IF(Address_of_US_Stay = NULL,1,0) + IF(Address_of_US_Stay = 'NULL',1,0) +
                               IF(Person_Entity_Paying_US_Trip = '',1,0) + IF(Person_Entity_Paying_US_Trip = NULL,1,0) + IF(Person_Entity_Paying_US_Trip = 'NULL',1,0) +
                               IF(Telephone = '',1,0) + IF(Telephone = NULL,1,0) + IF(Telephone = 'NULL',1,0) + 
                               IF(Email_Address = '',1,0) + IF(Email_Address = NULL,1,0) + IF(Email_Address = 'NULL',1,0) + 
                               IF(Relationship_To_You = '',1,0) + IF(Relationship_To_You = NULL,1,0) + IF(Relationship_To_You = 'NULL',1,0) +
                               IF(PayingPartyTripAddress_SameAsHomeMailingAddress = '',1,0) + IF(PayingPartyTripAddress_SameAsHomeMailingAddress = NULL,1,0) +
                               IF(PayingPartyTripAddress_SameAsHomeMailingAddress = 'NULL',1,0) +
                               IF(PartyPayingAddress = '',1,0) + IF(PartyPayingAddress = NULL,1,0) + IF(PartyPayingAddress = 'NULL',1,0) +
                               IF(PartyPayingCity = '',1,0) + IF(PartyPayingCity = NULL,1,0) + IF(PartyPayingCity = 'NULL',1,0) + 
                               IF(PartyPayingState_Province = '',1,0) + IF(PartyPayingState_Province = NULL,1,0) + IF(PartyPayingState_Province = 'NULL',1,0) +
                               IF(PostalZone_ZIPcode = '',1,0) + IF(PostalZone_ZIPcode = NULL,1,0) + IF(PostalZone_ZIPcode = 'NULL',1,0) + 
                               IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) +
                               IF(OtherPersonTravellingWithYou = '',1,0) + IF(OtherPersonTravellingWithYou = NULL,1,0) + IF(OtherPersonTravellingWithYou = 'NULL',1,0) ColumnCountWithNULLORBlank
                        FROM custtravelinfo1
                        WHERE CustappInfoId = AppId);
                        
                        
SET @custravelInfo2 = ( SELECT IF(TravellingPartofGroup_Organizantion = '',1,0) + IF(TravellingPartofGroup_Organizantion = NULL,1,0) + 
                                   IF(TravellingPartofGroup_Organizantion = 'NULL',1,0) + 
                               IF(PersonTravellingWithYou_Name_1 = '',1,0) + IF(PersonTravellingWithYou_Name_1 = NULL,1,0) + IF(PersonTravellingWithYou_Name_1 = 'NULL',1,0) + 
                               IF(PersonTravellingWithYou_Name_2 = '',1,0) + IF(PersonTravellingWithYou_Name_2 = NULL,1,0) + IF(PersonTravellingWithYou_Name_2 = 'NULL',1,0) +
                               IF(PersonTravellingWithYou_Name_3 = '',1,0) + IF(PersonTravellingWithYou_Name_3 = NULL,1,0) + IF(PersonTravellingWithYou_Name_3 = 'NULL',1,0) +
                               IF(PersonTravellingWithYou_Name_4 = '',1,0) + IF(PersonTravellingWithYou_Name_4 = NULL,1,0) + IF(PersonTravellingWithYou_Name_4 = 'NULL',1,0) +
                               IF(PersonTravellingWithYou_Name_5 = '',1,0) + IF(PersonTravellingWithYou_Name_5 = NULL,1,0) + IF(PersonTravellingWithYou_Name_5 = 'NULL',1,0) +
                               IF(PersonTravellingWithYou_Relationship_1 = '',1,0) + IF(PersonTravellingWithYou_Relationship_1 = NULL,1,0) + 
                               IF(PersonTravellingWithYou_Relationship_1 = 'NULL',1,0) +
                               IF(PersonTravellingWithYou_Relationship_2 = '',1,0) + IF(PersonTravellingWithYou_Relationship_2 = NULL,1,0) + 
                               IF(PersonTravellingWithYou_Relationship_2 = 'NULL',1,0) +
                               IF(PersonTravellingWithYou_Relationship_3 = '',1,0) + IF(PersonTravellingWithYou_Relationship_3 = NULL,1,0) + 
                               IF(PersonTravellingWithYou_Relationship_3 = 'NULL',1,0) +

                               IF(PersonTravellingWithYou_Relationship_4 = '',1,0) + IF(PersonTravellingWithYou_Relationship_4 = NULL,1,0) + 
                               IF(PersonTravellingWithYou_Relationship_4 = 'NULL',1,0) +
                               IF(PersonTravellingWithYou_Relationship_5 = '',1,0) + IF(PersonTravellingWithYou_Relationship_5 = NULL,1,0) + 
                               IF(PersonTravellingWithYou_Relationship_5 = 'NULL',1,0) +
                               IF(EverBeenToUS = '',1,0) + IF(EverBeenToUS = NULL,1,0) + IF(EverBeenToUS = 'NULL',1,0) +
                               IF(EverBeenIssuedUSVisa = '',1,0) + IF(EverBeenIssuedUSVisa = NULL,1,0) + IF(EverBeenIssuedUSVisa = 'NULL',1,0) + 
                               IF(EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication = '',1,0) + IF(EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication = NULL,1,0) + 
                               IF(EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication = 'NULL',1,0) ColumnCountWithNULLORBlank
                        FROM custtravelinfo2
                        WHERE CustappInfoId = AppId);
                        
                        
SET @custfamilyInfo1 = (SELECT IF(FatherSurname = '',1,0) + IF(FatherSurname = NULL,1,0) + IF(FatherSurname = 'NULL',1,0) + 
                               IF(FatherGivenName = '',1,0) + IF(FatherGivenName = NULL,1,0) + IF(FatherGivenName = 'NULL',1,0) + 
                               IF(FatherDateofBirth = '',1,0) + IF(FatherDateofBirth = NULL,1,0) + IF(FatherDateofBirth = 'NULL',1,0) +
                               IF(IsYourFatherInUS = '',1,0) + IF(IsYourFatherInUS = NULL,1,0) + IF(IsYourFatherInUS = 'NULL',1,0) +
                               IF(MotherSurname = '',1,0) + IF(MotherSurname = NULL,1,0) + IF(MotherSurname = 'NULL',1,0) +
                               IF(MotherGivenName = '',1,0) + IF(MotherGivenName = NULL,1,0) + IF(MotherGivenName = 'NULL',1,0) + 
                               IF(IsYourMotherInUS = '',1,0) + IF(IsYourMotherInUS = NULL,1,0) + IF(IsYourMotherInUS = 'NULL',1,0) +
                               IF(ImmediateRelativesInUS_ApartFatherMother = '',1,0) + IF(ImmediateRelativesInUS_ApartFatherMother = NULL,1,0) + 
                               IF(ImmediateRelativesInUS_ApartFatherMother = 'NULL',1,0) +
                               IF(Relative_Name_1 = '',1,0) + IF(Relative_Name_1 = NULL,1,0) + IF(Relative_Name_1 = 'NULL',1,0) +
                               IF(Relationship_To_Relative_1 = '',1,0) + IF(Relationship_To_Relative_1 = NULL,1,0) + IF(Relationship_To_Relative_1 = 'NULL',1,0) + 
                               IF(Relative_Status_1 = '',1,0) + IF(Relative_Status_1 = NULL,1,0) + IF(Relative_Status_1 = 'NULL',1,0) + 
                               IF(Relative_Name_2 = '',1,0) + IF(Relative_Name_2 = NULL,1,0) + IF(Relative_Name_2 = 'NULL',1,0) +
                               IF(Relationship_To_Relative_2 = '',1,0) + IF(Relationship_To_Relative_2 = NULL,1,0) + IF(Relationship_To_Relative_2 = 'NULL',1,0) +
                               IF(Relative_Status_2 = '',1,0) + IF(Relative_Status_2 = NULL,1,0) + IF(Relative_Status_2 = 'NULL',1,0) +
                               IF(Relative_Name_3 = '',1,0) + IF(Relative_Name_3 = NULL,1,0) + IF(Relative_Name_3 = 'NULL',1,0) + 
                               IF(Relationship_To_Relative_3 = '',1,0) + IF(Relationship_To_Relative_3 = NULL,1,0) + IF(Relationship_To_Relative_3 = 'NULL',1,0) +
                               IF(Relative_Status_3 = '',1,0) + IF(Relative_Status_3 = NULL,1,0) + IF(Relative_Status_3 = 'NULL',1,0) ColumnCountWithNULLORBlank
                        FROM custfamilyinfo1
                        WHERE CustappInfoId = AppId);
                        
                        
SET @custfamilyInfo2 = (SELECT IF(Relative_Name_4 = '',1,0) + IF(Relative_Name_4 = NULL,1,0) + IF(Relative_Name_4 = 'NULL',1,0) + 
                               IF(Relationship_To_Relative_4 = '',1,0) + IF(Relationship_To_Relative_4 = NULL,1,0) + IF(Relationship_To_Relative_4 = 'NULL',1,0) + 
                               IF(Relative_Status_4 = '',1,0) + IF(Relative_Status_4 = NULL,1,0) + IF(Relative_Status_4 = 'NULL',1,0) +
                               IF(Spouse_FullName = '',1,0) + IF(Spouse_FullName = NULL,1,0) + IF(Spouse_FullName = 'NULL',1,0) +
                               IF(Spouse_DateOfBirth = '',1,0) + IF(Spouse_DateOfBirth = NULL,1,0) + IF(Spouse_DateOfBirth = 'NULL',1,0) +
                               IF(Spouse_Nationality = '',1,0) + IF(Spouse_Nationality = NULL,1,0) + IF(Spouse_Nationality = 'NULL',1,0) + 
                               IF(Spouse_CityOfBirth = '',1,0) + IF(Spouse_CityOfBirth = NULL,1,0) + IF(Spouse_CityOfBirth = 'NULL',1,0) +
                               IF(Spouse_CountryOfBirth = '',1,0) + IF(Spouse_CountryOfBirth = NULL,1,0) + IF(Spouse_CountryOfBirth = 'NULL',1,0) +
                               IF(Spouse_Address = '',1,0) + IF(Spouse_Address = NULL,1,0) + IF(Spouse_Address = 'NULL',1,0) ColumnCountWithNULLORBlank
                        FROM custfamilyinfo2
                        WHERE CustappInfoId = AppId);
                        
                        
SET @custuscontactInfo = (  SELECT IF(ContactPersonNameInUS = '',1,0) + IF(ContactPersonNameInUS = NULL,1,0) + IF(ContactPersonNameInUS = 'NULL',1,0) + 
                                   IF(OrganizationNameInUS = '',1,0) + IF(OrganizationNameInUS = NULL,1,0) + IF(OrganizationNameInUS = 'NULL',1,0) + 
                                   IF(Relationship = '',1,0) + IF(Relationship = NULL,1,0) + IF(Relationship = 'NULL',1,0) +
                                   IF(ContactAddressUS = '',1,0) + IF(ContactAddressUS = NULL,1,0) + IF(ContactAddressUS = 'NULL',1,0) +
                                   IF(Phone_Number = '',1,0) + IF(Phone_Number = NULL,1,0) + IF(Phone_Number = 'NULL',1,0) +
                                   IF(Email_Address = '',1,0) + IF(Email_Address = NULL,1,0) + IF(Email_Address = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custuscontactinfo
                            WHERE CustappInfoId = AppId);
                            
                            
SET @custworkeducationtraininginfo = (SELECT IF(Primary_Occupation = '',1,0) + IF(Primary_Occupation = NULL,1,0) + IF(Primary_Occupation = 'NULL',1,0) + 
                                       IF(PresentEmployer_SchoolName = '',1,0) + IF(PresentEmployer_SchoolName = NULL,1,0) + IF(PresentEmployer_SchoolName = 'NULL',1,0) + 
                                       IF(Address = '',1,0) + IF(Address = NULL,1,0) + IF(Address = 'NULL',1,0) +
                                       IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) +
                                       IF(State_Province = '',1,0) + IF(State_Province = NULL,1,0) + IF(State_Province = 'NULL',1,0) +
                                       IF(PostalZone_ZipCode = '',1,0) + IF(PostalZone_ZipCode = NULL,1,0) + IF(PostalZone_ZipCode = 'NULL',1,0) + 
                                       IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) +
                                       IF(MonthSalary_LocalCurrency = '',1,0) + IF(MonthSalary_LocalCurrency = NULL,1,0) + IF(MonthSalary_LocalCurrency = 'NULL',1,0) +
                                       IF(BrifelyDescribeYourDuties = '',1,0) + IF(BrifelyDescribeYourDuties = NULL,1,0) + IF(BrifelyDescribeYourDuties = 'NULL',1,0) ColumnCountWithNULLORBlank
                                    FROM custworkeducationtraininginfo
                                    WHERE CustappInfoId = AppId);
                                    
                                    
SET @custlocalinfo = (  SELECT IF(CurrentLocation = '',1,0) + IF(CurrentLocation = NULL,1,0) + IF(CurrentLocation = 'NULL',1,0) ColumnCountWithNULLORBlank

                        FROM custlocalinfo
                        WHERE CustappInfoId = AppId);
                        
                       
SET @custpreparerappinfo = (SELECT IF(AnyoneAssistInFillingApplication = '',1,0) + IF(AnyoneAssistInFillingApplication = NULL,1,0) + 
                             IF(AnyoneAssistInFillingApplication = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custpreparerappinfo
                            WHERE CustappInfoId = AppId);
                            

SET @custpersonalInfo1 = (select COALESCE(@custpersonalInfo1,@custpersonalInfo1BaseCount));

SET @custpersonalInfo2 = (select COALESCE(@custpersonalInfo2,@custpersonalInfo2BaseCount));

SET @custpersonalInfo3 = (select COALESCE(@custpersonalInfo3,@custpersonalInfo3BaseCount));

SET @custravelInfo1 = (select COALESCE(@custravelInfo1,@custtravelInfo1BaseCount));

SET @custravelInfo2 = (select COALESCE(@custravelInfo2,@custtravelInfo2BaseCount));

SET @custfamilyInfo1 = (select COALESCE(@custfamilyInfo1,@custfamilyInfo1BaseCount));

SET @custfamilyInfo2 = (select COALESCE(@custfamilyInfo2,@custfamilyInfo2BaseCount));

SET @custuscontactInfo = (select COALESCE(@custuscontactInfo,@custuscontactInfoBaseCount));

SET @custworkeducationtraininginfo = (select COALESCE(@custworkeducationtraininginfo,@custworkeducationtrainingInfoBaseCount));

SET @custlocalinfo = (select COALESCE(@custlocalinfo,@custlocalInfoBaseCount));

SET @custpreparerappinfo = (select COALESCE(@custpreparerappinfo,@custpreparerappInfoBaseCount));


SET @EffectiveColumnFilled = (SELECT @TotalColumnCount - (@custpersonalInfo1 + @custpersonalInfo2 + @custpersonalInfo3 + @custravelInfo1 + @custravelInfo2 + @custfamilyInfo1 + @custfamilyInfo2 + @custuscontactInfo + @custworkeducationtraininginfo + @custlocalinfo + @custpreparerappinfo));


SET @ApplicationPercentageCompletion = (@EffectiveColumnFilled*100)/@TotalColumnCount;

RETURN @ApplicationPercentageCompletion;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fnCalculateH1bAppPercentageCompleted`(`AppId` INT) RETURNS varchar(255) CHARSET latin1
BEGIN

SET @TotalColumnCount = (SELECT COUNT(*) ColumnCount 
                        FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME IN ('personaldetail1','personaldetail2','ushomeaddress','education','overseaspermanentaddress',
                                             'internationtravel','employment1','employment2','visainformation1','visainformation2','visaapplication')
                              AND COLUMN_NAME NOT IN ('personaldetailId','ushomeaddressId','educationId','overseaspermanentaddressId',
                                                     'internationaltravelId','employmentId','visainformationId','visaapplicationId','CustProfileInfoId'));
                                                     
                                                     
SET @personaldetail1BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('personaldetail1')
                                      AND COLUMN_NAME NOT IN ('personaldetailId','CustProfileInfoId'));
                                      
                                                     
SET @personaldetail2BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('personaldetail2')
                                      AND COLUMN_NAME NOT IN ('personaldetailId','CustProfileInfoId'));
                                     
                                     
SET @ushomeaddressBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('ushomeaddress')
                                      AND COLUMN_NAME NOT IN ('ushomeaddressId','CustProfileInfoId'));
                                      
                                      
SET @educationBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('education')
                                      AND COLUMN_NAME NOT IN ('educationId','CustProfileInfoId'));
                                      
                                      
SET @overseaspermanentaddressBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('overseaspermanentaddress')
                                      AND COLUMN_NAME NOT IN ('overseaspermanentaddressId','CustProfileInfoId'));
                                      
                                      
SET @internationaltravelBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('internationtravel')
                                      AND COLUMN_NAME NOT IN ('internationaltravelId','CustProfileInfoId'));
                                      
                                      
SET @employment1BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('employment1')
                                      AND COLUMN_NAME NOT IN ('employmentId','CustProfileInfoId'));
                                      
                                      
SET @employment2BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('employment2')
                                      AND COLUMN_NAME NOT IN ('employmentId','CustProfileInfoId'));
                                      
                                      
SET @visainformation1BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('visainformation1')
                                      AND COLUMN_NAME NOT IN ('visainformationId','CustProfileInfoId'));
                                      
                                      
SET @visainformation2BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('visainformation2')
                                      AND COLUMN_NAME NOT IN ('visainformationId','CustProfileInfoId'));
                                      
                                      
SET @visaapplicationBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('visaapplication')
                                      AND COLUMN_NAME NOT IN ('visaapplicationId','CustProfileInfoId'));
                                      
                                      
SET @personaldetail1 = ( SELECT IF(FirstName = '',1,0) + IF(FirstName = NULL,1,0) + IF(FirstName = 'NULL',1,0) +
                                IF(MiddleName = '',1,0) + IF(MiddleName = NULL,1,0) + IF(MiddleName = 'NULL',1,0) +
                                IF(LastName = '',1,0) + IF(LastName = NULL,1,0) + IF(LastName = 'NULL',1,0) +
                                IF(AliasFirstName = '',1,0) + IF(AliasFirstName = NULL,1,0) + IF(AliasFirstName = 'NULL',1,0) +
                                IF(AliasLastName = '',1,0) + IF(AliasLastName = NULL,1,0) + IF(AliasLastName = 'NULL',1,0) +
                                IF(OtherName1 = '',1,0) + IF(OtherName1 = NULL,1,0) + IF(OtherName1 = 'NULL',1,0) +
                                IF(OtherName2 = '',1,0) + IF(OtherName2 = NULL,1,0) + IF(OtherName2 = 'NULL',1,0) +
                                IF(OtherName3 = '',1,0) + IF(OtherName3 = NULL,1,0) + IF(OtherName3 = 'NULL',1,0) +
                                IF(Emailaddress = '',1,0) + IF(Emailaddress = NULL,1,0) + IF(Emailaddress = 'NULL',1,0) +
                                IF(WorkPhone = '',1,0) + IF(WorkPhone = NULL,1,0) + IF(WorkPhone = 'NULL',1,0) +
                                IF(HomePhone = '',1,0) + IF(HomePhone = NULL,1,0) + IF(HomePhone = 'NULL',1,0) +
                                IF(MobilePhone = '',1,0) + IF(MobilePhone = NULL,1,0) + IF(MobilePhone = 'NULL',1,0) +
                                IF(Gender = '',1,0) + IF(Gender = NULL,1,0) + IF(Gender = 'NULL',1,0) +
                                IF(DateofBirth = '',1,0) + IF(DateofBirth = NULL,1,0) + IF(DateofBirth = 'NULL',1,0) +
                                IF(CityofBirth = '',1,0) + IF(CityofBirth = NULL,1,0) + IF(CityofBirth = 'NULL',1,0) +
                                IF(StateofBirth = '',1,0) + IF(StateofBirth = NULL,1,0) + IF(StateofBirth = 'NULL',1,0) +
                                IF(CountryofBirth = '',1,0) + IF(CountryofBirth = NULL,1,0) + IF(CountryofBirth = 'NULL',1,0)
                         FROM personaldetail1
                         WHERE CustAppInfoId = AppId);
                        
                        
SET @personaldetail2 = ( SELECT IF(Nationality = '',1,0) + IF(Nationality = NULL,1,0) + IF(Nationality = 'NULL',1,0) +
                                IF(PermanentResident_Immigrant = '',1,0) + IF(PermanentResident_Immigrant = NULL,1,0) + IF(PermanentResident_Immigrant = 'NULL',1,0) +
                                IF(RecentCitizenship_PR_Immigrant = '',1,0) + IF(RecentCitizenship_PR_Immigrant = NULL,1,0) + IF(RecentCitizenship_PR_Immigrant = 'NULL',1,0) +
                                IF(PassportNumber = '',1,0) + IF(PassportNumber = NULL,1,0) + IF(PassportNumber = 'NULL',1,0) +
                                IF(PassportIssueDate = '',1,0) + IF(PassportIssueDate = NULL,1,0) + IF(PassportIssueDate = 'NULL',1,0) +
                                IF(PassportExpirationDate = '',1,0) + IF(PassportExpirationDate = NULL,1,0) + IF(PassportExpirationDate = 'NULL',1,0) +
                                IF(PassportIssuedCity = '',1,0) + IF(PassportIssuedCity = NULL,1,0) + IF(PassportIssuedCity = 'NULL',1,0) +
                                IF(PassportIssuedState = '',1,0) + IF(PassportIssuedState = NULL,1,0) + IF(PassportIssuedState = 'NULL',1,0) +
                                IF(PassportIssuedCountry = '',1,0) + IF(PassportIssuedCountry = NULL,1,0) + IF(PassportIssuedCountry = 'NULL',1,0) +
                                IF(BlankPagesInPassport = '',1,0) + IF(BlankPagesInPassport = NULL,1,0) + IF(BlankPagesInPassport = 'NULL',1,0) 
                         FROM personaldetail2
                         WHERE CustAppInfoId = AppId);
                        
                        
SET @ushomeaddress = ( SELECT IF(HaveUSHomeAddress = '',1,0) + IF(HaveUSHomeAddress = NULL,1,0) + IF(HaveUSHomeAddress = 'NULL',1,0) + 
                              IF(USHomeAddressDateFrom = '',1,0) + IF(USHomeAddressDateFrom = NULL,1,0) + IF(USHomeAddressDateFrom = 'NULL',1,0) +
                              IF(USHomeAddressDateTo = '',1,0) + IF(USHomeAddressDateTo = NULL,1,0) + IF(USHomeAddressDateTo = 'NULL',1,0) + 
                              IF(StreetAddress = '',1,0) + IF(StreetAddress = NULL,1,0) + IF(StreetAddress = 'NULL',1,0) +
                              IF(Address2 = '',1,0) + IF(Address2 = NULL,1,0) + IF(Address2 = 'NULL',1,0) + 
                              IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) +
                              IF(StateProvinceRegion = '',1,0) + IF(StateProvinceRegion = NULL,1,0) + IF(StateProvinceRegion = 'NULL',1,0) + 
                              IF(ZipCode = '',1,0) + IF(ZipCode = NULL,1,0) + IF(ZipCode = 'NULL',1,0) +
                              IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) + 
                              IF(SameAsCurrentmaiingAddress = '',1,0) + IF(SameAsCurrentmaiingAddress = NULL,1,0) + IF(SameAsCurrentmaiingAddress = 'NULL',1,0) +
                              IF(Address2_1 = '',1,0) + IF(Address2_1 = NULL,1,0) + IF(Address2_1 = 'NULL',1,0) + 
                              IF(City_1 = '',1,0) + IF(City_1 = NULL,1,0) + IF(City_1 = 'NULL',1,0) +
                              IF(StateProvinceRegion_1 = '',1,0) + IF(StateProvinceRegion_1 = NULL,1,0) + IF(StateProvinceRegion_1 = 'NULL',1,0) + 
                              IF(ZipCode_1 = '',1,0) + IF(ZipCode_1 = NULL,1,0) + IF(ZipCode_1 = 'NULL',1,0) +
                              IF(Country_1 = '',1,0) + IF(Country_1 = NULL,1,0) + IF(Country_1 = 'NULL',1,0) + 
                              IF(PhoneNumberWithThisAddress = '',1,0) + IF(PhoneNumberWithThisAddress = NULL,1,0) + IF(PhoneNumberWithThisAddress = 'NULL',1,0) +
            IF(PlanOfChangingPlaceOfResidenceInNext4Months = '',1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = NULL,1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = 'NULL',1,0) + 
                              IF(IfYesMovingDateAndNewAddress = '',1,0) + IF(IfYesMovingDateAndNewAddress = NULL,1,0) + IF(IfYesMovingDateAndNewAddress = 'NULL',1,0) 
                       FROM ushomeaddress
                       WHERE CustAppInfoId = AppId);
                       
                       
SET @education = ( SELECT IF(InstitutionFullName = '',1,0) + IF(InstitutionFullName = NULL,1,0) + IF(InstitutionFullName = 'NULL',1,0) +
                          IF(InstitutionType = '',1,0) + IF(InstitutionType = NULL,1,0) + IF(InstitutionType = 'NULL',1,0) +
                          IF(InstitutionAccreditationStatus = '',1,0) + IF(InstitutionAccreditationStatus = NULL,1,0) + IF(InstitutionAccreditationStatus = 'NULL',1,0) +
                          IF(DateAttendedFrom = '',1,0) + IF(DateAttendedFrom = NULL,1,0) + IF(DateAttendedFrom = 'NULL',1,0) +
                          IF(DateAttendedTo = '',1,0) + IF(DateAttendedTo = NULL,1,0) + IF(DateAttendedTo = 'NULL',1,0) +
                          IF(MajorOrFieldOfStudy = '',1,0) + IF(MajorOrFieldOfStudy = NULL,1,0) + IF(MajorOrFieldOfStudy = 'NULL',1,0) +
                          IF(DegreeReceived = '',1,0) + IF(DegreeReceived = NULL,1,0) + IF(DegreeReceived = 'NULL',1,0) +
                          IF(Notes = '',1,0) + IF(Notes = NULL,1,0) + IF(Notes = 'NULL',1,0) 
                   FROM education
                   WHERE CustAppInfoId = AppId);
                   
                   
SET @overseaspermanentaddress = ( SELECT IF(OverseasPermanentAddressDateFrom = '',1,0) + IF(OverseasPermanentAddressDateFrom = NULL,1,0) + IF(OverseasPermanentAddressDateFrom = 'NULL',1,0) +
                                         IF(OverseasPermanentAddressDateTo = '',1,0) + IF(OverseasPermanentAddressDateTo = NULL,1,0) + IF(OverseasPermanentAddressDateTo = 'NULL',1,0) +
                                         IF(StreetAddress = '',1,0) + IF(StreetAddress = NULL,1,0) + IF(StreetAddress = 'NULL',1,0) +
                                         IF(Address2 = '',1,0) + IF(Address2 = NULL,1,0) + IF(Address2 = 'NULL',1,0) +
                                         IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) +
                                         IF(StateProvinceRegion = '',1,0) + IF(StateProvinceRegion = NULL,1,0) + IF(StateProvinceRegion = 'NULL',1,0) +
                                         IF(ZipCode = '',1,0) + IF(ZipCode = NULL,1,0) + IF(ZipCode = 'NULL',1,0) +
                                         IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) +
             IF(PlanOfChangingPlaceOfResidenceInNext4Months = '',1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = NULL,1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = 'NULL',1,0) 
                                  FROM overseaspermanentaddress
                                  WHERE CustAppInfoId = AppId);
                        
SET @internationaltravel = ( SELECT IF(PossibilityOfInternationTravelIn6Months = '',1,0) + IF(PossibilityOfInternationTravelIn6Months = NULL,1,0) + IF(PossibilityOfInternationTravelIn6Months = 'NULL',1,0) + 
                                    IF(DateofIntendedDeparture = '',1,0) + IF(DateofIntendedDeparture = NULL,1,0) + IF(DateofIntendedDeparture = 'NULL',1,0) +
                                    IF(ExpectedLengthOfTrip = '',1,0) + IF(ExpectedLengthOfTrip = NULL,1,0) + IF(ExpectedLengthOfTrip = 'NULL',1,0) +
                                    IF(PurposeOfTripIncludingTravelersName = '',1,0) + IF(PurposeOfTripIncludingTravelersName = NULL,1,0) + IF(PurposeOfTripIncludingTravelersName = 'NULL',1,0) 
                             FROM internationtravel
                             WHERE CustAppInfoId = AppId);
                             
                             
SET @employment1 = ( SELECT IF(EmploymentType = '',1,0) + IF(EmploymentType = NULL,1,0) + IF(EmploymentType = 'NULL',1,0) +
                            IF(EmploymentDateFrom = '',1,0) + IF(EmploymentDateFrom = NULL,1,0) + IF(EmploymentDateFrom = 'NULL',1,0) +
                            IF(EmploymentDateTo = '',1,0) + IF(EmploymentDateTo = NULL,1,0) + IF(EmploymentDateTo = 'NULL',1,0) +
                            IF(StreetAddress = '',1,0) + IF(StreetAddress = NULL,1,0) + IF(StreetAddress = 'NULL',1,0) +
                            IF(Address2 = '',1,0) + IF(Address2 = NULL,1,0) + IF(Address2 = 'NULL',1,0) +
                            IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) +
                            IF(StateProvinceRegion = '',1,0) + IF(StateProvinceRegion = NULL,1,0) + IF(StateProvinceRegion = 'NULL',1,0) +
                            IF(ZipCode = '',1,0) + IF(ZipCode = NULL,1,0) + IF(ZipCode = 'NULL',1,0) +
                            IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) +
                            IF(EmployerIsUniversityOrNonProfit = '',1,0) + IF(EmployerIsUniversityOrNonProfit = NULL,1,0) + IF(EmployerIsUniversityOrNonProfit = 'NULL',1,0) +
                            IF(TypeOfBusiness = '',1,0) + IF(TypeOfBusiness = NULL,1,0) + IF(TypeOfBusiness = 'NULL',1,0) +
                            IF(HoursPerWeek = '',1,0) + IF(HoursPerWeek = NULL,1,0) + IF(HoursPerWeek = 'NULL',1,0) +
                            IF(IsPositionPartTime = '',1,0) + IF(IsPositionPartTime = NULL,1,0) + IF(IsPositionPartTime = 'NULL',1,0) +
                            IF(JobTitle = '',1,0) + IF(JobTitle = NULL,1,0) + IF(JobTitle = 'NULL',1,0) +
                            IF(CurrentAnnualBaseSalary = '',1,0) + IF(CurrentAnnualBaseSalary = NULL,1,0) + IF(CurrentAnnualBaseSalary = 'NULL',1,0) +
                            IF(DetailJobDuties = '',1,0) + IF(DetailJobDuties = NULL,1,0) + IF(DetailJobDuties = 'NULL',1,0) +
                            IF(TechnologiesUsed = '',1,0) + IF(TechnologiesUsed = NULL,1,0) + IF(TechnologiesUsed = 'NULL',1,0) 
                     FROM employment1
                     WHERE CustAppInfoId = AppId);
                     
                     
SET @employment2 = ( SELECT IF(SupervisorName = '',1,0) + IF(SupervisorName = NULL,1,0) + IF(SupervisorName = 'NULL',1,0) +
                            IF(SupervisorPhoneNumber = '',1,0) + IF(SupervisorPhoneNumber = NULL,1,0) + IF(SupervisorPhoneNumber = 'NULL',1,0) +
                            IF(SuperVisorJobTitle = '',1,0) + IF(SuperVisorJobTitle = NULL,1,0) + IF(SuperVisorJobTitle = 'NULL',1,0) +
                       IF(AnyInterruptionsInEmploymentWithEmployer = '',1,0) + IF(AnyInterruptionsInEmploymentWithEmployer = NULL,1,0) + IF(AnyInterruptionsInEmploymentWithEmployer = 'NULL',1,0) +
                            IF(WorkingOutsideTheUS = '',1,0) + IF(WorkingOutsideTheUS = NULL,1,0) + IF(WorkingOutsideTheUS = 'NULL',1,0) +
                       IF(IfWorkingOutsideDoesItInvolveSupervision = '',1,0) + IF(IfWorkingOutsideDoesItInvolveSupervision = NULL,1,0) + IF(IfWorkingOutsideDoesItInvolveSupervision = 'NULL',1,0) 
                     FROM employment2
                     WHERE CustAppInfoId = AppId);
                     
                     
SET @visainformation1 = ( SELECT IF(EverEnteredUS = '',1,0) + IF(EverEnteredUS = NULL,1,0) + IF(EverEnteredUS = 'NULL',1,0) +
                                 IF(DateofLastEntryUS = '',1,0) + IF(DateofLastEntryUS = NULL,1,0) + IF(DateofLastEntryUS = 'NULL',1,0) +
                                 IF(I94Number = '',1,0) + IF(I94Number = NULL,1,0) + IF(I94Number = 'NULL',1,0) +
                                 IF(CurrentUSImmigrationStatus = '',1,0) + IF(CurrentUSImmigrationStatus = NULL,1,0) + IF(CurrentUSImmigrationStatus = 'NULL',1,0) +
                                 IF(LastEntryUSCity = '',1,0) + IF(LastEntryUSCity = NULL,1,0) + IF(LastEntryUSCity = 'NULL',1,0) +
                                 IF(LastEntryUSState = '',1,0) + IF(LastEntryUSState = NULL,1,0) + IF(LastEntryUSState = 'NULL',1,0) +
                                 IF(ExpirationStatusI94_I688 = '',1,0) + IF(ExpirationStatusI94_I688 = NULL,1,0) + IF(ExpirationStatusI94_I688 = 'NULL',1,0) +
                                 IF(VisaNumber = '',1,0) + IF(VisaNumber = NULL,1,0) + IF(VisaNumber = 'NULL',1,0) +
                                 IF(VisaIssuanceCity = '',1,0) + IF(VisaIssuanceCity = NULL,1,0) + IF(VisaIssuanceCity = 'NULL',1,0) +
                                 IF(VisaIssuanceCountry = '',1,0) + IF(VisaIssuanceCountry = NULL,1,0) + IF(VisaIssuanceCountry = 'NULL',1,0) +
                                 IF(ViaIssuanceDate = '',1,0) + IF(ViaIssuanceDate = NULL,1,0) + IF(ViaIssuanceDate = 'NULL',1,0) +
                                 IF(VisaExpirationDate = '',1,0) + IF(VisaExpirationDate = NULL,1,0) + IF(VisaExpirationDate = 'NULL',1,0) +
                                 IF(EverFiledI140ImmigrationPetition = '',1,0) + IF(EverFiledI140ImmigrationPetition = NULL,1,0) + IF(EverFiledI140ImmigrationPetition = 'NULL',1,0) +
                                 IF(I140ApprovedDenied = '',1,0) + IF(I140ApprovedDenied = NULL,1,0) + IF(I140ApprovedDenied = 'NULL',1,0) +
                                 IF(I140PriorityDate = '',1,0) + IF(I140PriorityDate = NULL,1,0) + IF(I140PriorityDate = 'NULL',1,0) +
                                 IF(I140ReceiptCategoryPriorityDate = '',1,0) + IF(I140ReceiptCategoryPriorityDate = NULL,1,0) + IF(I140ReceiptCategoryPriorityDate = 'NULL',1,0) +
                                 IF(EverAppliedGreenCardOrPermanentResidencyByYou_Family = '',1,0) + IF(EverAppliedGreenCardOrPermanentResidencyByYou_Family = NULL,1,0) + IF(EverAppliedGreenCardOrPermanentResidencyByYou_Family = 'NULL',1,0) +
                                 IF(DatePlaceOutcomeOfGreenCardOrPermanentResidency = '',1,0) + IF(DatePlaceOutcomeOfGreenCardOrPermanentResidency = NULL,1,0) + IF(DatePlaceOutcomeOfGreenCardOrPermanentResidency = 'NULL',1,0)
                          FROM visainformation1
                          WHERE CustAppInfoId = AppId);
                        
                        
SET @visainformation2 = ( SELECT IF(F1Status_CPTTraining = '',1,0) + IF(F1Status_CPTTraining = NULL,1,0) + IF(F1Status_CPTTraining = 'NULL',1,0) +
                                 IF(CPTWithGraduateDegree = '',1,0) + IF(CPTWithGraduateDegree = NULL,1,0) + IF(CPTWithGraduateDegree = 'NULL',1,0) +
                                 IF(StartedCPTAfterDegreeProgram = '',1,0) + IF(StartedCPTAfterDegreeProgram = NULL,1,0) + IF(StartedCPTAfterDegreeProgram = 'NULL',1,0) +
                                 IF(IfinF1_AppliedOTP = '',1,0) + IF(IfinF1_AppliedOTP = NULL,1,0) + IF(IfinF1_AppliedOTP = 'NULL',1,0) +
                                 IF(I765Approved_Pending = '',1,0) + IF(I765Approved_Pending = NULL,1,0) + IF(I765Approved_Pending = 'NULL',1,0) +
                                 IF(I765ReceiptNumber = '',1,0) + IF(I765ReceiptNumber = NULL,1,0) + IF(I765ReceiptNumber = 'NULL',1,0) +
                    IF(IfI765Approved_NoOfDaysUnemployedAfterEAD = '',1,0) + IF(IfI765Approved_NoOfDaysUnemployedAfterEAD = NULL,1,0) + IF(IfI765Approved_NoOfDaysUnemployedAfterEAD = 'NULL',1,0) +
                                 IF(J1orJ2Visa = '',1,0) + IF(J1orJ2Visa = NULL,1,0) + IF(J1orJ2Visa = 'NULL',1,0) +
                                 IF(TwoYrHomeResidencyRequirement = '',1,0) + IF(TwoYrHomeResidencyRequirement = NULL,1,0) + IF(TwoYrHomeResidencyRequirement = 'NULL',1,0) +
                                 IF(J1orJ2SubmittedApplicationForWaiver = '',1,0) + IF(J1orJ2SubmittedApplicationForWaiver = NULL,1,0) + IF(J1orJ2SubmittedApplicationForWaiver = 'NULL',1,0) +
                                 IF(F1OrJ1SEVISNumber = '',1,0) + IF(F1OrJ1SEVISNumber = NULL,1,0) + IF(F1OrJ1SEVISNumber = 'NULL',1,0) +
                                 IF(EverBeenInUSInHOrLStatus = '',1,0) + IF(EverBeenInUSInHOrLStatus = NULL,1,0) + IF(EverBeenInUSInHOrLStatus = 'NULL',1,0) +
                                 IF(EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus = '',1,0) + IF(EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus = NULL,1,0) + IF(EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus = 'NULL',1,0) +
                                 IF(FiledH1BDuringPreviousFiscalYear = '',1,0) + IF(FiledH1BDuringPreviousFiscalYear = NULL,1,0) + IF(FiledH1BDuringPreviousFiscalYear = 'NULL',1,0) +
                                 IF(AppliedH1BPursuantToApprovedPetitionAndEnterUS = '',1,0) + IF(AppliedH1BPursuantToApprovedPetitionAndEnterUS = NULL,1,0) + IF(AppliedH1BPursuantToApprovedPetitionAndEnterUS = 'NULL',1,0) +
                                 IF(StartedEmploymentInUS = '',1,0) + IF(StartedEmploymentInUS = NULL,1,0) + IF(StartedEmploymentInUS = 'NULL',1,0) +
                                 IF(NotStartedEmploymentSelectReason = '',1,0) + IF(NotStartedEmploymentSelectReason = NULL,1,0) + IF(NotStartedEmploymentSelectReason = 'NULL',1,0) +
                                 IF(HOrLPetitionDenied = '',1,0) + IF(HOrLPetitionDenied = NULL,1,0) + IF(HOrLPetitionDenied = 'NULL',1,0) +
                                 IF(IfYesEnterReason = '',1,0) + IF(IfYesEnterReason = NULL,1,0) + IF(IfYesEnterReason = 'NULL',1,0)
                          FROM visainformation2
                          WHERE CustAppInfoId = AppId);
                        
                        
SET @visaapplication = ( SELECT IF(ResidingOutsideUS = '',1,0) + IF(ResidingOutsideUS = NULL,1,0) + IF(ResidingOutsideUS = 'NULL',1,0) +
                               IF(USConsulateLocationOutsideUS = '',1,0) + IF(USConsulateLocationOutsideUS = NULL,1,0) + IF(USConsulateLocationOutsideUS = 'NULL',1,0) +
                               IF(AppliedNonImmigrantUSVisa = '',1,0) + IF(AppliedNonImmigrantUSVisa = NULL,1,0) + IF(AppliedNonImmigrantUSVisa = 'NULL',1,0) +
                               IF(VisaCancelledDeniedRejected = '',1,0) + IF(VisaCancelledDeniedRejected = NULL,1,0) + IF(VisaCancelledDeniedRejected = 'NULL',1,0)
                        FROM visaapplication
                        WHERE CustAppInfoId = AppId);
                      
                      
SET @personaldetail1 = (select COALESCE(@personaldetail1,@personaldetail1BaseCount));

SET @personaldetail2 = (select COALESCE(@personaldetail2,@personaldetail2BaseCount));

SET @ushomeaddress = (select COALESCE(@ushomeaddress,@ushomeaddressBaseCount));

SET @education = (select COALESCE(@education,@educationBaseCount));

SET @overseaspermanentaddress = (select COALESCE(@overseaspermanentaddress,@overseaspermanentaddressBaseCount));

SET @internationaltravel = (select COALESCE(@internationaltravel,@internationaltravelBaseCount));

SET @employment1 = (select COALESCE(@employment1,@employment1BaseCount));

SET @employment2 = (select COALESCE(@employment2,@employment2BaseCount));

SET @visainformation1 = (select COALESCE(@visainformation1,@visainformation1BaseCount));

SET @visainformation2 = (select COALESCE(@visainformation2,@visainformation2BaseCount));

SET @visaapplication = (select COALESCE(@visaapplication,@visaapplicationBaseCount));
                        

SET @EffectiveColumnFilled = (SELECT @TotalColumnCount - (@personaldetail1 + @personaldetail2 + @ushomeaddress + @education + @overseaspermanentaddress + @internationaltravel + @employment1 + 										 @employment2 + @visainformation1 + @visainformation2 + @visaapplication));


SET @ApplicationPercentageCompletion = (@EffectiveColumnFilled*100)/@TotalColumnCount;

RETURN @ApplicationPercentageCompletion;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `apppercent`
--

CREATE TABLE `apppercent` (
  `Id` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `CountryListId` int(11) DEFAULT NULL,
  `CountryVisaTypeListId` int(11) DEFAULT NULL,
  `FormId` int(11) NOT NULL,
  `AppPercentageCompleted` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countrylist`
--

CREATE TABLE `countrylist` (
  `CountryListId` int(11) NOT NULL,
  `CountryName` varchar(500) DEFAULT NULL,
  `CountryCode` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countrylist`
--

INSERT INTO `countrylist` (`CountryListId`, `CountryName`, `CountryCode`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Albania', 'AL'),
(3, 'Algeria', 'DZ'),
(4, 'American Samoa', 'AS'),
(5, 'Andorra', 'AD'),
(6, 'Angola', 'AO'),
(7, 'Anguilla', 'AI'),
(8, 'Antarctica', 'AQ'),
(9, 'Antigua and Barbuda', 'AG'),
(10, 'Argentina', 'AR'),
(11, 'Armenia', 'AM'),
(12, 'Aruba', 'AW'),
(13, 'Australia', 'AU'),
(14, 'Austria', 'AT'),
(15, 'Azerbaijan', 'AZ'),
(16, 'Bahamas', 'BS'),
(17, 'Bahrain', 'BH'),
(18, 'Bangladesh', 'BD'),
(19, 'Barbados', 'BB'),
(20, 'Belarus', 'BY'),
(21, 'Belgium', 'BE'),
(22, 'Belize', 'BZ'),
(23, 'Benin', 'BJ'),
(24, 'Bermuda', 'BM'),
(25, 'Bhutan', 'BT'),
(26, 'Bolivia', 'BO'),
(27, 'Bosnia and Herzegovina', 'BA'),
(28, 'Botswana', 'BW'),
(29, 'Bouvet Island', 'BV'),
(30, 'Brazil', 'BR'),
(31, 'British Indian Ocean Territory', 'IO'),
(32, 'Brunei', 'BN'),
(33, 'Bulgaria', 'BG'),
(34, 'Burkina Faso', 'BF'),
(35, 'Burundi', 'BI'),
(36, 'Cambodia', 'KH'),
(37, 'Cameroon', 'CM'),
(38, 'Canada', 'CA'),
(39, 'Cape Verde', 'CV'),
(40, 'Cayman Islands', 'KY'),
(41, 'Central African Republic', 'CF'),
(42, 'Chad', 'TD'),
(43, 'Chile', 'CL'),
(44, 'China', 'CN'),
(45, 'Christmas Island', 'CX'),
(46, 'Cocos (Keeling) Islands', 'CC'),
(47, 'Colombia', 'CO'),
(48, 'Comoros', 'KM'),
(49, 'Congo', 'CG'),
(50, 'Cook Islands', 'CK'),
(51, 'Costa Rica', 'CR'),
(52, 'Cote D''Ivoire (Ivory Coast)', 'CI'),
(53, 'Croatia (Hrvatska)', 'HR'),
(54, 'Cuba', 'CU'),
(55, 'Cyprus', 'CY'),
(56, 'Czech Republic', 'CZ'),
(57, 'Denmark', 'DK'),
(58, 'Djibouti', 'DJ'),
(59, 'Dominica', 'DM'),
(60, 'Dominican Republic', 'DO'),
(61, 'East Timor', 'TP'),
(62, 'Ecuador', 'EC'),
(63, 'Egypt', 'EG'),
(64, 'El Salvador', 'SV'),
(65, 'Equatorial Guinea', 'GQ'),
(66, 'Eritrea', 'ER'),
(67, 'Estonia', 'EE'),
(68, 'Ethiopia', 'ET'),
(69, 'Falkland Islands (Malvinas)', 'FK'),
(70, 'Faroe Islands', 'FO'),
(71, 'Fiji', 'FJ'),
(72, 'Finland', 'FI'),
(73, 'France', 'FR'),
(74, 'French Guiana', 'GF'),
(75, 'French Polynesia', 'PF'),
(76, 'French Southern Territories', 'TF'),
(77, 'Gabon', 'GA'),
(78, 'Gambia', 'GM'),
(79, 'Georgia', 'GE'),
(80, 'Germany', 'DE'),
(81, 'Ghana', 'GH'),
(82, 'Gibraltar', 'GI'),
(83, 'Great Britain (UK)', 'GB'),
(84, 'Greece', 'GR'),
(85, 'Greenland', 'GL'),
(86, 'Grenada', 'GD'),
(87, 'Guadeloupe', 'GP'),
(88, 'Guam', 'GU'),
(89, 'Guatemala', 'GT'),
(90, 'Guinea', 'GN'),
(91, 'Guinea-Bissau', 'GW'),
(92, 'Guyana', 'GY'),
(93, 'Haiti', 'HT'),
(94, 'Heard and McDonald Islands', 'HM'),
(95, 'Honduras', 'HN'),
(96, 'Hong Kong', 'HK'),
(97, 'Hungary', 'HU'),
(98, 'Iceland', 'IS'),
(99, 'India', 'IN'),
(100, 'Indonesia', 'ID'),
(101, 'Iran', 'IR'),
(102, 'Iraq', 'IQ'),
(103, 'Ireland', 'IE'),
(104, 'Israel', 'IL'),
(105, 'Italy', 'IT'),
(106, 'Jamaica', 'JM'),
(107, 'Japan', 'JP'),
(108, 'Jordan', 'JO'),
(109, 'Kazakhstan', 'KZ'),
(110, 'Kenya', 'KE'),
(111, 'Kiribati', 'KI'),
(112, 'Kuwait', 'KW'),
(113, 'Kyrgyzstan', 'KG'),
(114, 'Laos', 'LA'),
(115, 'Latvia', 'LV'),
(116, 'Lebanon', 'LB'),
(117, 'Lesotho', 'LS'),
(118, 'Liberia', 'LR'),
(119, 'Libya', 'LY'),
(120, 'Liechtenstein', 'LI'),
(121, 'Lithuania', 'LT'),
(122, 'Luxembourg', 'LU'),
(123, 'Macau', 'MO'),
(124, 'Macedonia', 'MK'),
(125, 'Madagascar', 'MG'),
(126, 'Malawi', 'MW'),
(127, 'Malaysia', 'MY'),
(128, 'Maldives', 'MV'),
(129, 'Mali', 'ML'),
(130, 'Malta', 'MT'),
(131, 'Marshall Islands', 'MH'),
(132, 'Martinique', 'MQ'),
(133, 'Mauritania', 'MR'),
(134, 'Mauritius', 'MU'),
(135, 'Mayotte', 'YT'),
(136, 'Mexico', 'MX'),
(137, 'Micronesia', 'FM'),
(138, 'Moldova', 'MD'),
(139, 'Monaco', 'MC'),
(140, 'Mongolia', 'MN'),
(141, 'Montserrat', 'MS'),
(142, 'Morocco', 'MA'),
(143, 'Mozambique', 'MZ'),
(144, 'Myanmar', 'MM'),
(145, 'Namibia', 'NA'),
(146, 'Nauru', 'NR'),
(147, 'Nepal', 'NP'),
(148, 'Netherlands', 'NL'),
(149, 'Netherlands Antilles', 'AN'),
(150, 'Neutral Zone', 'NT'),
(151, 'New Caledonia', 'NC'),
(152, 'New Zealand (Aotearoa)', 'NZ'),
(153, 'Nicaragua', 'NI'),
(154, 'Niger', 'NE'),
(155, 'Nigeria', 'NG'),
(156, 'Niue', 'NU'),
(157, 'Norfolk Island', 'NF'),
(158, 'North Korea', 'KP'),
(159, 'Northern Mariana Islands', 'MP'),
(160, 'Norway', 'NO'),
(161, 'Oman', 'OM'),
(162, 'Pakistan', 'PK'),
(163, 'Palau', 'PW'),
(164, 'Panama', 'PA'),
(165, 'Papua New Guinea', 'PG'),
(166, 'Paraguay', 'PY'),
(167, 'Peru', 'PE'),
(168, 'Philippines', 'PH'),
(169, 'Pitcairn', 'PN'),
(170, 'Poland', 'PL'),
(171, 'Portugal', 'PT'),
(172, 'Puerto Rico', 'PR'),
(173, 'Qatar', 'QA'),
(174, 'Reunion', 'RE'),
(175, 'Romania', 'RO'),
(176, 'Russia', 'RU'),
(177, 'Rwanda', 'RW'),
(178, 'Saint Kitts and Nevis', 'KN'),
(179, 'Saint Lucia', 'LC'),
(180, 'Saint Vincent and the Grenadines', 'VC'),
(181, 'Samoa', 'WS'),
(182, 'San Marino', 'SM'),
(183, 'Sao Tome and Principe', 'ST'),
(184, 'Saudi Arabia', 'SA'),
(185, 'Senegal', 'SN'),
(186, 'Seychelles', 'SC'),
(187, 'Sierra Leone', 'SL'),
(188, 'Singapore', 'SG'),
(189, 'Slovak Republic', 'SK'),
(190, 'Slovenia', 'SI'),
(191, 'Solomon Islands', 'Sb'),
(192, 'Somalia', 'SO'),
(193, 'South Africa', 'ZA'),
(194, 'South Georgia and South Sandwich Islands ', 'GS'),
(195, 'South Korea', 'KR'),
(196, 'Spain', 'ES'),
(197, 'Sri Lanka', 'LK'),
(198, 'St. Helena', 'SH'),
(199, 'St. Pierre and Miquelon', 'PM'),
(200, 'Sudan', 'SD'),
(201, 'Suriname', 'SR'),
(202, 'Svalbard and Jan Mayen Islands', 'SJ'),
(203, 'Swaziland', 'SZ'),
(204, 'Sweden', 'SE'),
(205, 'Switzerland', 'CH'),
(206, 'Syria', 'SY'),
(207, 'Taiwan', 'TW'),
(208, 'Tajikistan', 'TJ'),
(209, 'Tanzania', 'TZ'),
(210, 'Thailand', 'TH'),
(211, 'Togo', 'TG'),
(212, 'Tokelau', 'TK'),
(213, 'Tonga', 'TO'),
(214, 'Trinidad and Tobago', 'TT'),
(215, 'Tunisia', 'TN'),
(216, 'Turkey', 'TR'),
(217, 'Turkmenistan', 'TM'),
(218, 'Turks and Caicos Islands', 'TC'),
(219, 'Tuvalu', 'TV'),
(220, 'Uganda', 'UG'),
(221, 'Ukraine', 'UA'),
(222, 'United Arab Emirates', 'AE'),
(223, 'United Kingdom', 'UK'),
(224, 'United States', 'US'),
(225, 'Uruguay', 'UY'),
(226, 'US Minor Outlying Islands', 'UM'),
(227, 'Uzbekistan', 'UZ'),
(228, 'Vanuatu', 'VU'),
(229, 'Vatican City State (Holy See)', 'VA'),
(230, 'Venezuela', 'VE'),
(231, 'Vietnam', 'VN'),
(232, 'Virgin Islands (British)', 'VG'),
(233, 'Virgin Islands (U.S.)', 'VI'),
(234, 'Wallis and Futuna Islands', 'WF'),
(235, 'Western Sahara', 'EH'),
(236, 'Yemen', 'YE'),
(237, 'Yugoslavia', 'YU'),
(238, 'Zaire', 'ZR'),
(239, 'Zambia', 'ZM'),
(240, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `countryvisatypelist`
--

CREATE TABLE `countryvisatypelist` (
  `CountryVisaTypeListId` int(11) NOT NULL,
  `CountryListId` int(11) NOT NULL,
  `CountryVisaType` varchar(500) DEFAULT NULL,
  `CountryVisaTypeDescription` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countryvisatypelist`
--

INSERT INTO `countryvisatypelist` (`CountryVisaTypeListId`, `CountryListId`, `CountryVisaType`, `CountryVisaTypeDescription`) VALUES
(2, 224, 'B-2', 'tourism, vacation, pleasure visitor, medical treatment'),
(3, 99, 'T', 'tourism, tourist, non-business, vacation'),
(4, 224, 'F-1', 'student visa, students, including high-school, universities, college, academic institutions and programs and language training');

-- --------------------------------------------------------

--
-- Table structure for table `custappinfo`
--

CREATE TABLE `custappinfo` (
  `CustAppInfoId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) NOT NULL,
  `FormId` int(11) DEFAULT NULL,
  `CountryListId` int(11) NOT NULL,
  `CountryVisaTypeListId` int(11) NOT NULL,
  `CustAppNumber` varchar(200) DEFAULT NULL,
  `Activated` enum('0','1') NOT NULL DEFAULT '1',
  `Completed` enum('0','1') NOT NULL DEFAULT '0',
  `Submitted` enum('0','1') NOT NULL DEFAULT '0',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custappinfo`
--

INSERT INTO `custappinfo` (`CustAppInfoId`, `CustProfileInfoId`, `FormId`, `CountryListId`, `CountryVisaTypeListId`, `CustAppNumber`, `Activated`, `Completed`, `Submitted`, `CreatedOn`, `ModifiedOn`) VALUES
(9, 1, 1, 224, 2, 'APP001224B-2', '1', '0', '0', '2016-10-22 17:40:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custfamilyinfo1`
--

CREATE TABLE `custfamilyinfo1` (
  `CustFamilyInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `FatherSurname` varchar(200) DEFAULT NULL,
  `FatherGivenName` varchar(200) DEFAULT NULL,
  `FatherDateofBirth` varchar(100) DEFAULT NULL,
  `IsYourFatherInUS` varchar(50) DEFAULT NULL,
  `MotherSurname` varchar(200) DEFAULT NULL,
  `MotherGivenName` varchar(200) DEFAULT NULL,
  `IsYourMotherInUS` varchar(50) DEFAULT NULL,
  `ImmediateRelativesInUS_ApartFatherMother` varchar(50) DEFAULT NULL,
  `Relative_Name_1` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_1` varchar(200) DEFAULT NULL,
  `Relative_Status_1` varchar(100) DEFAULT NULL,
  `Relative_Name_2` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_2` varchar(200) DEFAULT NULL,
  `Relative_Status_2` varchar(100) DEFAULT NULL,
  `Relative_Name_3` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_3` varchar(200) DEFAULT NULL,
  `Relative_Status_3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custfamilyinfo1`
--

INSERT INTO `custfamilyinfo1` (`CustFamilyInfoId`, `CustAppInfoId`, `FatherSurname`, `FatherGivenName`, `FatherDateofBirth`, `IsYourFatherInUS`, `MotherSurname`, `MotherGivenName`, `IsYourMotherInUS`, `ImmediateRelativesInUS_ApartFatherMother`, `Relative_Name_1`, `Relationship_To_Relative_1`, `Relative_Status_1`, `Relative_Name_2`, `Relationship_To_Relative_2`, `Relative_Status_2`, `Relative_Name_3`, `Relationship_To_Relative_3`, `Relative_Status_3`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custfamilyinfo2`
--

CREATE TABLE `custfamilyinfo2` (
  `CustFamilyInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `Relative_Name_4` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_4` varchar(200) DEFAULT NULL,
  `Relative_Status_4` varchar(100) DEFAULT NULL,
  `Spouse_FullName` varchar(200) DEFAULT NULL,
  `Spouse_DateOfBirth` varchar(100) DEFAULT NULL,
  `Spouse_Nationality` varchar(200) DEFAULT NULL,
  `Spouse_CityOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_CountryOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_Address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custfamilyinfo2`
--

INSERT INTO `custfamilyinfo2` (`CustFamilyInfoId`, `CustAppInfoId`, `Relative_Name_4`, `Relationship_To_Relative_4`, `Relative_Status_4`, `Spouse_FullName`, `Spouse_DateOfBirth`, `Spouse_Nationality`, `Spouse_CityOfBirth`, `Spouse_CountryOfBirth`, `Spouse_Address`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custlocalinfo`
--

CREATE TABLE `custlocalinfo` (
  `CustLocalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `CurrentLocation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custlocalinfo`
--

INSERT INTO `custlocalinfo` (`CustLocalInfoId`, `CustAppInfoId`, `CurrentLocation`) VALUES
(1, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `custpersonalinfo1`
--

CREATE TABLE `custpersonalinfo1` (
  `CustPersonalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `First_Name` varchar(500) DEFAULT NULL,
  `Last_Name` varchar(500) DEFAULT NULL,
  `Full_Name_In_Native_Language` varchar(500) DEFAULT NULL,
  `Other_Name_Used` varchar(50) DEFAULT NULL,
  `Other_Name_1` varchar(500) DEFAULT NULL,
  `Other_Name_2` varchar(500) DEFAULT NULL,
  `Other_Name_3` varchar(500) DEFAULT NULL,
  `Sex` varchar(50) DEFAULT NULL,
  `Marital_Status` varchar(50) DEFAULT NULL,
  `Date_Of_Birth` varchar(100) DEFAULT NULL,
  `City_Of_Birth` varchar(500) DEFAULT NULL,
  `State_Of_Birth` varchar(500) DEFAULT NULL,
  `Nationality` varchar(500) DEFAULT NULL,
  `Other_Nationalities` varchar(500) DEFAULT NULL,
  `National_Identification_Number` varchar(100) DEFAULT NULL,
  `US_Social_Security_Number` varchar(100) DEFAULT NULL,
  `US_Taxpayer_ID_Number` varchar(100) DEFAULT NULL,
  `Home_Address` varchar(500) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo1`
--

INSERT INTO `custpersonalinfo1` (`CustPersonalInfoId`, `CustAppInfoId`, `First_Name`, `Last_Name`, `Full_Name_In_Native_Language`, `Other_Name_Used`, `Other_Name_1`, `Other_Name_2`, `Other_Name_3`, `Sex`, `Marital_Status`, `Date_Of_Birth`, `City_Of_Birth`, `State_Of_Birth`, `Nationality`, `Other_Nationalities`, `National_Identification_Number`, `US_Social_Security_Number`, `US_Taxpayer_ID_Number`, `Home_Address`, `City`) VALUES
(1, 9, 'Harun', 'Razith', '', '', '', '', '', 'male', 'married', '', '', '', 'Choose...', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custpersonalinfo2`
--

CREATE TABLE `custpersonalinfo2` (
  `CustPersonalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `State_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZIPCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `Same_Mailing_Address` varchar(50) DEFAULT NULL,
  `Mailing_Home_Address` varchar(500) DEFAULT NULL,
  `Mailing_City` varchar(200) DEFAULT NULL,
  `Mailing_State_Province` varchar(200) DEFAULT NULL,
  `Mailing_PostalZone_ZIPCode` varchar(50) DEFAULT NULL,
  `Mailing_Country` varchar(500) DEFAULT NULL,
  `Home_Phone_Number` varchar(50) DEFAULT NULL,
  `Work_Phone_Number` varchar(50) DEFAULT NULL,
  `Work_Fax_Number` varchar(50) DEFAULT NULL,
  `Mobile_Cell_Phone_Number` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(500) DEFAULT NULL,
  `Passport_Number` varchar(100) DEFAULT NULL,
  `Passport_Book_Number` varchar(100) DEFAULT NULL,
  `Country_Authority_Issued_Passport` varchar(500) DEFAULT NULL,
  `City_Issued_Passport` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo2`
--

INSERT INTO `custpersonalinfo2` (`CustPersonalInfoId`, `CustAppInfoId`, `State_Province`, `PostalZone_ZIPCode`, `Country`, `Same_Mailing_Address`, `Mailing_Home_Address`, `Mailing_City`, `Mailing_State_Province`, `Mailing_PostalZone_ZIPCode`, `Mailing_Country`, `Home_Phone_Number`, `Work_Phone_Number`, `Work_Fax_Number`, `Mobile_Cell_Phone_Number`, `Email_Address`, `Passport_Number`, `Passport_Book_Number`, `Country_Authority_Issued_Passport`, `City_Issued_Passport`) VALUES
(1, 9, '', '', '', '', '', '', '', '', 'Choose...', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custpersonalinfo3`
--

CREATE TABLE `custpersonalinfo3` (
  `CustPersonalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `State_Province_Issued_Passport` varchar(200) DEFAULT NULL,
  `Country_Issued_Passport` varchar(200) DEFAULT NULL,
  `Issuance_Date_Passport` varchar(100) DEFAULT NULL,
  `Expiration_Date_Passport` varchar(100) DEFAULT NULL,
  `Passport_Stolen_Lost` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo3`
--

INSERT INTO `custpersonalinfo3` (`CustPersonalInfoId`, `CustAppInfoId`, `State_Province_Issued_Passport`, `Country_Issued_Passport`, `Issuance_Date_Passport`, `Expiration_Date_Passport`, `Passport_Stolen_Lost`) VALUES
(1, 9, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custpreparerappinfo`
--

CREATE TABLE `custpreparerappinfo` (
  `CustPrepareAppInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `AnyoneAssistInFillingApplication` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpreparerappinfo`
--

INSERT INTO `custpreparerappinfo` (`CustPrepareAppInfoId`, `CustAppInfoId`, `AnyoneAssistInFillingApplication`) VALUES
(1, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `custprofileinfo`
--

CREATE TABLE `custprofileinfo` (
  `CustProfileInfoId` int(11) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `EmailAddress` varchar(500) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `DateOfBirth` varchar(100) NOT NULL,
  `Activated` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custprofileinfo`
--

INSERT INTO `custprofileinfo` (`CustProfileInfoId`, `UserName`, `FirstName`, `LastName`, `EmailAddress`, `Password`, `DateOfBirth`, `Activated`) VALUES
(1, 'hrazith', 'Harun', 'Razith', 'hrazith@gmail.com', 'hr77', '12101948', '1');

-- --------------------------------------------------------

--
-- Table structure for table `custtravelinfo1`
--

CREATE TABLE `custtravelinfo1` (
  `CustTravelInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `Principal_Applicant` varchar(50) DEFAULT NULL,
  `Trip_Purpose_1` varchar(500) DEFAULT NULL,
  `Trip_Purpose_2` varchar(500) DEFAULT NULL,
  `Trip_Purpose_3` varchar(500) DEFAULT NULL,
  `Trip_Purpose_4` varchar(500) DEFAULT NULL,
  `Intended_Date_Of_Arrival` varchar(100) DEFAULT NULL,
  `Intended_Length_Of_Stay_US` varchar(100) DEFAULT NULL,
  `Address_of_US_Stay` varchar(500) DEFAULT NULL,
  `Person_Entity_Paying_US_Trip` varchar(200) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(500) DEFAULT NULL,
  `Relationship_To_You` varchar(100) DEFAULT NULL,
  `PayingPartyTripAddress_SameAsHomeMailingAddress` varchar(50) DEFAULT NULL,
  `PartyPayingAddress` varchar(500) DEFAULT NULL,
  `PartyPayingCity` varchar(200) DEFAULT NULL,
  `PartyPayingState_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZIPcode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `OtherPersonTravellingWithYou` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custtravelinfo1`
--

INSERT INTO `custtravelinfo1` (`CustTravelInfoId`, `CustAppInfoId`, `Principal_Applicant`, `Trip_Purpose_1`, `Trip_Purpose_2`, `Trip_Purpose_3`, `Trip_Purpose_4`, `Intended_Date_Of_Arrival`, `Intended_Length_Of_Stay_US`, `Address_of_US_Stay`, `Person_Entity_Paying_US_Trip`, `Telephone`, `Email_Address`, `Relationship_To_You`, `PayingPartyTripAddress_SameAsHomeMailingAddress`, `PartyPayingAddress`, `PartyPayingCity`, `PartyPayingState_Province`, `PostalZone_ZIPcode`, `Country`, `OtherPersonTravellingWithYou`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custtravelinfo2`
--

CREATE TABLE `custtravelinfo2` (
  `CustTravelInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `TravellingPartofGroup_Organizantion` varchar(100) DEFAULT NULL,
  `PersonTravellingWithYou_Name_1` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_2` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_3` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_4` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_5` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_1` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_2` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_3` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_4` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_5` varchar(200) DEFAULT NULL,
  `EverBeenToUS` varchar(50) DEFAULT NULL,
  `EverBeenIssuedUSVisa` varchar(50) DEFAULT NULL,
  `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custtravelinfo2`
--

INSERT INTO `custtravelinfo2` (`CustTravelInfoId`, `CustAppInfoId`, `TravellingPartofGroup_Organizantion`, `PersonTravellingWithYou_Name_1`, `PersonTravellingWithYou_Name_2`, `PersonTravellingWithYou_Name_3`, `PersonTravellingWithYou_Name_4`, `PersonTravellingWithYou_Name_5`, `PersonTravellingWithYou_Relationship_1`, `PersonTravellingWithYou_Relationship_2`, `PersonTravellingWithYou_Relationship_3`, `PersonTravellingWithYou_Relationship_4`, `PersonTravellingWithYou_Relationship_5`, `EverBeenToUS`, `EverBeenIssuedUSVisa`, `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custuscontactinfo`
--

CREATE TABLE `custuscontactinfo` (
  `CustUSContactInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `ContactPersonNameInUS` varchar(200) DEFAULT NULL,
  `OrganizationNameInUS` varchar(200) DEFAULT NULL,
  `Relationship` varchar(200) DEFAULT NULL,
  `ContactAddressUS` varchar(500) DEFAULT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custuscontactinfo`
--

INSERT INTO `custuscontactinfo` (`CustUSContactInfoId`, `CustAppInfoId`, `ContactPersonNameInUS`, `OrganizationNameInUS`, `Relationship`, `ContactAddressUS`, `Phone_Number`, `Email_Address`) VALUES
(1, 9, '', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custworkeducationtraininginfo`
--

CREATE TABLE `custworkeducationtraininginfo` (
  `CustWorkEducationTrainingInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `Primary_Occupation` varchar(200) DEFAULT NULL,
  `PresentEmployer_SchoolName` varchar(200) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `State_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `MonthSalary_LocalCurrency` varchar(100) DEFAULT NULL,
  `BrifelyDescribeYourDuties` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custworkeducationtraininginfo`
--

INSERT INTO `custworkeducationtraininginfo` (`CustWorkEducationTrainingInfoId`, `CustAppInfoId`, `Primary_Occupation`, `PresentEmployer_SchoolName`, `Address`, `City`, `State_Province`, `PostalZone_ZipCode`, `Country`, `MonthSalary_LocalCurrency`, `BrifelyDescribeYourDuties`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ds160menuinfo`
--

CREATE TABLE `ds160menuinfo` (
  `DS160MenuInfoId` int(11) NOT NULL,
  `MenuDescription` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ds160menuinfo`
--

INSERT INTO `ds160menuinfo` (`DS160MenuInfoId`, `MenuDescription`) VALUES
(1, 'Personal, Address, Phone and Passport Information'),
(2, 'Travel Information'),
(3, 'U.S. Contact Information'),
(4, 'Family Information'),
(5, 'Work / Education / Training Information'),
(6, 'Security and Background Information'),
(7, 'Location Information'),
(8, 'Preparer of Application');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `EducationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `InstitutionFullName` varchar(500) DEFAULT NULL,
  `InstitutionType` varchar(500) DEFAULT NULL,
  `InstitutionAccreditationStatus` varchar(500) DEFAULT NULL,
  `DateAttendedFrom` varchar(100) DEFAULT NULL,
  `DateAttendedTo` varchar(100) DEFAULT NULL,
  `MajorOrFieldOfStudy` varchar(500) DEFAULT NULL,
  `DegreeReceived` varchar(200) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employment1`
--

CREATE TABLE `employment1` (
  `EmploymentId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `EmploymentType` varchar(100) DEFAULT NULL,
  `EmploymentDateFrom` varchar(100) DEFAULT NULL,
  `EmploymentDateTo` varchar(100) DEFAULT NULL,
  `StreetAddress` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(500) DEFAULT NULL,
  `StateProvinceRegion` varchar(500) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `EmployerIsUniversityOrNonProfit` varchar(50) DEFAULT NULL,
  `TypeOfBusiness` varchar(500) DEFAULT NULL,
  `HoursPerWeek` varchar(50) DEFAULT NULL,
  `IsPositionPartTime` varchar(50) DEFAULT NULL,
  `JobTitle` varchar(200) DEFAULT NULL,
  `CurrentAnnualBaseSalary` varchar(100) DEFAULT NULL,
  `DetailJobDuties` varchar(8000) DEFAULT NULL,
  `TechnologiesUsed` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employment2`
--

CREATE TABLE `employment2` (
  `EmploymentId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `SupervisorName` varchar(500) DEFAULT NULL,
  `SupervisorPhoneNumber` varchar(100) DEFAULT NULL,
  `SuperVisorJobTitle` varchar(200) DEFAULT NULL,
  `AnyInterruptionsInEmploymentWithEmployer` varchar(50) DEFAULT NULL,
  `WorkingOutsideTheUS` varchar(50) DEFAULT NULL,
  `IfWorkingOutsideDoesItInvolveSupervision` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eventlog`
--

CREATE TABLE `eventlog` (
  `EventlogId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) NOT NULL,
  `EventType` varchar(200) DEFAULT NULL,
  `EventDescription` varchar(8000) DEFAULT NULL,
  `EventLogDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `FormId` int(11) NOT NULL,
  `FormType` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`FormId`, `FormType`) VALUES
(1, 'DS160'),
(2, 'H1B');

-- --------------------------------------------------------

--
-- Table structure for table `internationtravel`
--

CREATE TABLE `internationtravel` (
  `InternationalTravelId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `PossibilityOfInternationTravelIn6Months` varchar(50) DEFAULT NULL,
  `DateofIntendedDeparture` varchar(100) DEFAULT NULL,
  `ExpectedLengthOfTrip` varchar(200) DEFAULT NULL,
  `PurposeOfTripIncludingTravelersName` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `overseaspermanentaddress`
--

CREATE TABLE `overseaspermanentaddress` (
  `OverseasPermanentAddressId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `OverseasPermanentAddressDateFrom` varchar(100) DEFAULT NULL,
  `OverseasPermanentAddressDateTo` varchar(100) DEFAULT NULL,
  `StreetAddress` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(500) DEFAULT NULL,
  `StateProvinceRegion` varchar(500) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `PlanOfChangingPlaceOfResidenceInNext4Months` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personaldetail1`
--

CREATE TABLE `personaldetail1` (
  `PersonalDetailId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `FirstName` varchar(500) DEFAULT NULL,
  `MiddleName` varchar(500) DEFAULT NULL,
  `LastName` varchar(500) DEFAULT NULL,
  `MaidenName` varchar(500) DEFAULT NULL,
  `AliasFirstName` varchar(500) DEFAULT NULL,
  `AliasLastName` varchar(500) DEFAULT NULL,
  `OtherName1` varchar(500) DEFAULT NULL,
  `OtherName2` varchar(500) DEFAULT NULL,
  `OtherName3` varchar(500) DEFAULT NULL,
  `EmailAddress` varchar(500) DEFAULT NULL,
  `WorkPhone` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(50) DEFAULT NULL,
  `MobilePhone` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `DateofBirth` varchar(100) DEFAULT NULL,
  `CityofBirth` varchar(500) DEFAULT NULL,
  `StateofBirth` varchar(500) DEFAULT NULL,
  `CountryofBirth` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personaldetail2`
--

CREATE TABLE `personaldetail2` (
  `PersonalDetailId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `Nationality` varchar(500) DEFAULT NULL,
  `PermanentResident_Immigrant` varchar(500) DEFAULT NULL,
  `RecentCitizenship_PR_Immigrant` varchar(500) DEFAULT NULL,
  `PassportNumber` varchar(100) DEFAULT NULL,
  `PassportIssueDate` varchar(100) DEFAULT NULL,
  `PassportExpirationDate` varchar(100) DEFAULT NULL,
  `PassportIssuedCity` varchar(200) DEFAULT NULL,
  `PassportIssuedState` varchar(200) DEFAULT NULL,
  `PassportIssuedCountry` varchar(200) DEFAULT NULL,
  `BlankPagesInPassport` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ushomeaddress`
--

CREATE TABLE `ushomeaddress` (
  `USHomeAddressId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `HaveUSHomeAddress` varchar(50) DEFAULT NULL,
  `USHomeAddressDateFrom` varchar(100) DEFAULT NULL,
  `USHomeAddressDateTo` varchar(100) DEFAULT NULL,
  `StreetAddress` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(500) DEFAULT NULL,
  `StateProvinceRegion` varchar(500) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `SameAsCurrentmaiingAddress` varchar(50) DEFAULT NULL,
  `Address2_1` varchar(500) DEFAULT NULL,
  `City_1` varchar(500) DEFAULT NULL,
  `StateProvinceRegion_1` varchar(500) DEFAULT NULL,
  `ZipCode_1` varchar(50) DEFAULT NULL,
  `Country_1` varchar(500) DEFAULT NULL,
  `PhoneNumberWithThisAddress` varchar(50) DEFAULT NULL,
  `PlanOfChangingPlaceOfResidenceInNext4Months` varchar(50) DEFAULT NULL,
  `IfYesMovingDateAndNewAddress` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visaapplication`
--

CREATE TABLE `visaapplication` (
  `VisaApplicationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `ResidingOutsideUS` varchar(50) DEFAULT NULL,
  `USConsulateLocationOutsideUS` varchar(500) DEFAULT NULL,
  `AppliedNonImmigrantUSVisa` varchar(50) DEFAULT NULL,
  `VisaCancelledDeniedRejected` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visainformation1`
--

CREATE TABLE `visainformation1` (
  `VisaInformationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `EverEnteredUS` varchar(50) DEFAULT NULL,
  `DateofLastEntryUS` varchar(100) DEFAULT NULL,
  `I94Number` varchar(50) DEFAULT NULL,
  `CurrentUSImmigrationStatus` varchar(100) DEFAULT NULL,
  `LastEntryUSCity` varchar(500) DEFAULT NULL,
  `LastEntryUSState` varchar(500) DEFAULT NULL,
  `ExpirationStatusI94_I688` varchar(100) DEFAULT NULL,
  `VisaNumber` varchar(100) DEFAULT NULL,
  `VisaIssuanceCity` varchar(500) DEFAULT NULL,
  `VisaIssuanceCountry` varchar(500) DEFAULT NULL,
  `ViaIssuanceDate` varchar(100) DEFAULT NULL,
  `VisaExpirationDate` varchar(100) DEFAULT NULL,
  `EverFiledI140ImmigrationPetition` varchar(50) DEFAULT NULL,
  `I140ApprovedDenied` varchar(50) DEFAULT NULL,
  `I140PriorityDate` varchar(100) DEFAULT NULL,
  `I140ReceiptCategoryPriorityDate` varchar(1000) DEFAULT NULL,
  `EverAppliedGreenCardOrPermanentResidencyByYou_Family` varchar(50) DEFAULT NULL,
  `DatePlaceOutcomeOfGreenCardOrPermanentResidency` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visainformation2`
--

CREATE TABLE `visainformation2` (
  `VisaInformationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `F1Status_CPTTraining` varchar(50) DEFAULT NULL,
  `CPTWithGraduateDegree` varchar(50) DEFAULT NULL,
  `StartedCPTAfterDegreeProgram` varchar(50) DEFAULT NULL,
  `IfinF1_AppliedOTP` varchar(50) DEFAULT NULL,
  `I765Approved_Pending` varchar(50) DEFAULT NULL,
  `I765ReceiptNumber` varchar(100) DEFAULT NULL,
  `IfI765Approved_NoOfDaysUnemployedAfterEAD` varchar(50) DEFAULT NULL,
  `J1orJ2Visa` varchar(50) DEFAULT NULL,
  `TwoYrHomeResidencyRequirement` varchar(50) DEFAULT NULL,
  `J1orJ2SubmittedApplicationForWaiver` varchar(50) DEFAULT NULL,
  `F1OrJ1SEVISNumber` varchar(100) DEFAULT NULL,
  `EverBeenInUSInHOrLStatus` varchar(50) DEFAULT NULL,
  `EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus` varchar(50) DEFAULT NULL,
  `FiledH1BDuringPreviousFiscalYear` varchar(50) DEFAULT NULL,
  `AppliedH1BPursuantToApprovedPetitionAndEnterUS` varchar(50) DEFAULT NULL,
  `StartedEmploymentInUS` varchar(50) DEFAULT NULL,
  `NotStartedEmploymentSelectReason` varchar(500) DEFAULT NULL,
  `HOrLPetitionDenied` varchar(50) DEFAULT NULL,
  `IfYesEnterReason` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apppercent`
--
ALTER TABLE `apppercent`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `countrylist`
--
ALTER TABLE `countrylist`
  ADD PRIMARY KEY (`CountryListId`);

--
-- Indexes for table `countryvisatypelist`
--
ALTER TABLE `countryvisatypelist`
  ADD PRIMARY KEY (`CountryVisaTypeListId`),
  ADD KEY `CountryListId` (`CountryListId`);

--
-- Indexes for table `custappinfo`
--
ALTER TABLE `custappinfo`
  ADD PRIMARY KEY (`CustAppInfoId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`),
  ADD KEY `CountryListId` (`CountryListId`),
  ADD KEY `CountryVisaTypeListId` (`CountryVisaTypeListId`),
  ADD KEY `FormId` (`FormId`);

--
-- Indexes for table `custfamilyinfo1`
--
ALTER TABLE `custfamilyinfo1`
  ADD PRIMARY KEY (`CustFamilyInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custfamilyinfo2`
--
ALTER TABLE `custfamilyinfo2`
  ADD PRIMARY KEY (`CustFamilyInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custlocalinfo`
--
ALTER TABLE `custlocalinfo`
  ADD PRIMARY KEY (`CustLocalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpersonalinfo1`
--
ALTER TABLE `custpersonalinfo1`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpersonalinfo2`
--
ALTER TABLE `custpersonalinfo2`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpersonalinfo3`
--
ALTER TABLE `custpersonalinfo3`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpreparerappinfo`
--
ALTER TABLE `custpreparerappinfo`
  ADD PRIMARY KEY (`CustPrepareAppInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custprofileinfo`
--
ALTER TABLE `custprofileinfo`
  ADD PRIMARY KEY (`CustProfileInfoId`);

--
-- Indexes for table `custtravelinfo1`
--
ALTER TABLE `custtravelinfo1`
  ADD PRIMARY KEY (`CustTravelInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custtravelinfo2`
--
ALTER TABLE `custtravelinfo2`
  ADD PRIMARY KEY (`CustTravelInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custuscontactinfo`
--
ALTER TABLE `custuscontactinfo`
  ADD PRIMARY KEY (`CustUSContactInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custworkeducationtraininginfo`
--
ALTER TABLE `custworkeducationtraininginfo`
  ADD PRIMARY KEY (`CustWorkEducationTrainingInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `ds160menuinfo`
--
ALTER TABLE `ds160menuinfo`
  ADD PRIMARY KEY (`DS160MenuInfoId`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`EducationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `employment1`
--
ALTER TABLE `employment1`
  ADD PRIMARY KEY (`EmploymentId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `employment2`
--
ALTER TABLE `employment2`
  ADD PRIMARY KEY (`EmploymentId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD PRIMARY KEY (`EventlogId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`FormId`);

--
-- Indexes for table `internationtravel`
--
ALTER TABLE `internationtravel`
  ADD PRIMARY KEY (`InternationalTravelId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  ADD PRIMARY KEY (`OverseasPermanentAddressId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `personaldetail1`
--
ALTER TABLE `personaldetail1`
  ADD PRIMARY KEY (`PersonalDetailId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `personaldetail2`
--
ALTER TABLE `personaldetail2`
  ADD PRIMARY KEY (`PersonalDetailId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  ADD PRIMARY KEY (`USHomeAddressId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `visaapplication`
--
ALTER TABLE `visaapplication`
  ADD PRIMARY KEY (`VisaApplicationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `visainformation1`
--
ALTER TABLE `visainformation1`
  ADD PRIMARY KEY (`VisaInformationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `visainformation2`
--
ALTER TABLE `visainformation2`
  ADD PRIMARY KEY (`VisaInformationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apppercent`
--
ALTER TABLE `apppercent`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countrylist`
--
ALTER TABLE `countrylist`
  MODIFY `CountryListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `countryvisatypelist`
--
ALTER TABLE `countryvisatypelist`
  MODIFY `CountryVisaTypeListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `custappinfo`
--
ALTER TABLE `custappinfo`
  MODIFY `CustAppInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `custfamilyinfo1`
--
ALTER TABLE `custfamilyinfo1`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custfamilyinfo2`
--
ALTER TABLE `custfamilyinfo2`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custlocalinfo`
--
ALTER TABLE `custlocalinfo`
  MODIFY `CustLocalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpersonalinfo1`
--
ALTER TABLE `custpersonalinfo1`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpersonalinfo2`
--
ALTER TABLE `custpersonalinfo2`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpersonalinfo3`
--
ALTER TABLE `custpersonalinfo3`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpreparerappinfo`
--
ALTER TABLE `custpreparerappinfo`
  MODIFY `CustPrepareAppInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custprofileinfo`
--
ALTER TABLE `custprofileinfo`
  MODIFY `CustProfileInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custtravelinfo1`
--
ALTER TABLE `custtravelinfo1`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custtravelinfo2`
--
ALTER TABLE `custtravelinfo2`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custuscontactinfo`
--
ALTER TABLE `custuscontactinfo`
  MODIFY `CustUSContactInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custworkeducationtraininginfo`
--
ALTER TABLE `custworkeducationtraininginfo`
  MODIFY `CustWorkEducationTrainingInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ds160menuinfo`
--
ALTER TABLE `ds160menuinfo`
  MODIFY `DS160MenuInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `EducationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employment1`
--
ALTER TABLE `employment1`
  MODIFY `EmploymentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employment2`
--
ALTER TABLE `employment2`
  MODIFY `EmploymentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventlog`
--
ALTER TABLE `eventlog`
  MODIFY `EventlogId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `FormId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `internationtravel`
--
ALTER TABLE `internationtravel`
  MODIFY `InternationalTravelId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  MODIFY `OverseasPermanentAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personaldetail1`
--
ALTER TABLE `personaldetail1`
  MODIFY `PersonalDetailId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personaldetail2`
--
ALTER TABLE `personaldetail2`
  MODIFY `PersonalDetailId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  MODIFY `USHomeAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visaapplication`
--
ALTER TABLE `visaapplication`
  MODIFY `VisaApplicationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visainformation1`
--
ALTER TABLE `visainformation1`
  MODIFY `VisaInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visainformation2`
--
ALTER TABLE `visainformation2`
  MODIFY `VisaInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `countryvisatypelist`
--
ALTER TABLE `countryvisatypelist`
  ADD CONSTRAINT `countryvisatypelist_ibfk_1` FOREIGN KEY (`CountryListId`) REFERENCES `countrylist` (`CountryListId`);

--
-- Constraints for table `custappinfo`
--
ALTER TABLE `custappinfo`
  ADD CONSTRAINT `custappinfo_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`),
  ADD CONSTRAINT `custappinfo_ibfk_2` FOREIGN KEY (`CountryListId`) REFERENCES `countrylist` (`CountryListId`),
  ADD CONSTRAINT `custappinfo_ibfk_3` FOREIGN KEY (`CountryVisaTypeListId`) REFERENCES `countryvisatypelist` (`CountryVisaTypeListId`),
  ADD CONSTRAINT `custappinfo_ibfk_4` FOREIGN KEY (`FormId`) REFERENCES `form` (`FormId`);

--
-- Constraints for table `custfamilyinfo1`
--
ALTER TABLE `custfamilyinfo1`
  ADD CONSTRAINT `custfamilyinfo1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custfamilyinfo2`
--
ALTER TABLE `custfamilyinfo2`
  ADD CONSTRAINT `custfamilyinfo2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custlocalinfo`
--
ALTER TABLE `custlocalinfo`
  ADD CONSTRAINT `custlocalinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpersonalinfo1`
--
ALTER TABLE `custpersonalinfo1`
  ADD CONSTRAINT `custpersonalinfo1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpersonalinfo2`
--
ALTER TABLE `custpersonalinfo2`
  ADD CONSTRAINT `custpersonalinfo2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpersonalinfo3`
--
ALTER TABLE `custpersonalinfo3`
  ADD CONSTRAINT `custpersonalinfo3_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpreparerappinfo`
--
ALTER TABLE `custpreparerappinfo`
  ADD CONSTRAINT `custpreparerappinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custtravelinfo1`
--
ALTER TABLE `custtravelinfo1`
  ADD CONSTRAINT `custtravelinfo1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custtravelinfo2`
--
ALTER TABLE `custtravelinfo2`
  ADD CONSTRAINT `custtravelinfo2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custuscontactinfo`
--
ALTER TABLE `custuscontactinfo`
  ADD CONSTRAINT `custuscontactinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custworkeducationtraininginfo`
--
ALTER TABLE `custworkeducationtraininginfo`
  ADD CONSTRAINT `custworkeducationtraininginfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `employment1`
--
ALTER TABLE `employment1`
  ADD CONSTRAINT `employment1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `employment2`
--
ALTER TABLE `employment2`
  ADD CONSTRAINT `employment2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD CONSTRAINT `eventlog_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `internationtravel`
--
ALTER TABLE `internationtravel`
  ADD CONSTRAINT `internationtravel_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  ADD CONSTRAINT `overseaspermanentaddress_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `personaldetail1`
--
ALTER TABLE `personaldetail1`
  ADD CONSTRAINT `personaldetail1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `personaldetail2`
--
ALTER TABLE `personaldetail2`
  ADD CONSTRAINT `personaldetail2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  ADD CONSTRAINT `ushomeaddress_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `visaapplication`
--
ALTER TABLE `visaapplication`
  ADD CONSTRAINT `visaapplication_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `visainformation1`
--
ALTER TABLE `visainformation1`
  ADD CONSTRAINT `visainformation1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `visainformation2`
--
ALTER TABLE `visainformation2`
  ADD CONSTRAINT `visainformation2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
