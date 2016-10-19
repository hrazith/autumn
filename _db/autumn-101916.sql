-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 19, 2016 at 10:43 PM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE ` procGetProfileInfoWithAppPercentageCompleted`(IN `UserName` VARCHAR(255))
BEGIN

INSERT INTO apppercent
(CustAppInfoId,CustProfileInfoId,CountryListId,CountryVisaTypeListId)

SELECT CustAppInfoId,CustProfileInfoId,CountryListId,CountryVisaTypeListId
FROM custappinfo where CustprofileInfoId IN 
(SELECT CustprofileInfoId FROM custprofileinfo WHERE UserName = UserName);

SET @x = 1;
SET @cnt = (SELECT COUNT(*) FROM apppercent);

WHILE @x <= @cnt DO

SET @AppId = (Select CustAppInfoId FROM apppercent WHERE Id = @x);

SET @AppPercent = fnCalculateAppPercentageCompleted(@AppId);

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
       app.ModifiedOn AppLastModificationDate
FROM custappinfo app 
INNER JOIN countrylist cl ON app.CountryListId = cl.CountryListId
INNER JOIN countryvisatypelist cvl ON app.CountryVisaTypeListId = cvl.CountryVisaTypeListId
INNER JOIN custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
INNER JOIN apppercent ap ON app.CustAppInfoId = ap.CustAppInfoId
WHERE cp.UserName = UserName;

TRUNCATE TABLE apppercent;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCalculateAppPercentageCompletion`(IN `ProfileId` INT, IN `CountryId` INT, IN `VisaTypeId` INT)
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
                            WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                                   and CountryVisaTypeListId = VisaTypeId));
                            
                            
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
                            WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                                   and CountryVisaTypeListId = VisaTypeId));
                            
                            
SET @custpersonalInfo3 = (  SELECT IF(State_Province_Issued_Passport = '',1,0) + IF(State_Province_Issued_Passport = NULL,1,0) + 
                                      IF(State_Province_Issued_Passport = 'NULL',1,0) + 
                                   IF(Country_Issued_Passport = '',1,0) + IF(Country_Issued_Passport = NULL,1,0) + IF(Country_Issued_Passport = 'NULL',1,0) + 
                                   IF(Issuance_Date_Passport = '',1,0) + IF(Issuance_Date_Passport = NULL,1,0) + IF(Issuance_Date_Passport = 'NULL',1,0) +
                                   IF(Expiration_Date_Passport = '',1,0) + IF(Expiration_Date_Passport = NULL,1,0) + IF(Expiration_Date_Passport = 'NULL',1,0) +
                                   IF(Passport_Stolen_Lost = '',1,0) + IF(Passport_Stolen_Lost = NULL,1,0) + IF(Passport_Stolen_Lost = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custpersonalinfo3
                            WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                                   and CountryVisaTypeListId = VisaTypeId));
                            
                            
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
                        WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                               and CountryVisaTypeListId = VisaTypeId));
                        
                        
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
                        WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                               and CountryVisaTypeListId = VisaTypeId));
                        
                        
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
                        WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                               and CountryVisaTypeListId = VisaTypeId));
                        
                        
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
                        WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                               and CountryVisaTypeListId = VisaTypeId));
                        
                        
SET @custuscontactInfo = (  SELECT IF(ContactPersonNameInUS = '',1,0) + IF(ContactPersonNameInUS = NULL,1,0) + IF(ContactPersonNameInUS = 'NULL',1,0) + 
                                   IF(OrganizationNameInUS = '',1,0) + IF(OrganizationNameInUS = NULL,1,0) + IF(OrganizationNameInUS = 'NULL',1,0) + 
                                   IF(Relationship = '',1,0) + IF(Relationship = NULL,1,0) + IF(Relationship = 'NULL',1,0) +
                                   IF(ContactAddressUS = '',1,0) + IF(ContactAddressUS = NULL,1,0) + IF(ContactAddressUS = 'NULL',1,0) +
                                   IF(Phone_Number = '',1,0) + IF(Phone_Number = NULL,1,0) + IF(Phone_Number = 'NULL',1,0) +
                                   IF(Email_Address = '',1,0) + IF(Email_Address = NULL,1,0) + IF(Email_Address = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custuscontactinfo
                            WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                                   and CountryVisaTypeListId = VisaTypeId));
                            
                            
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
                                    WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                                           and CountryVisaTypeListId = VisaTypeId));
                                    
                                    
SET @custlocalinfo = (  SELECT IF(CurrentLocation = '',1,0) + IF(CurrentLocation = NULL,1,0) + IF(CurrentLocation = 'NULL',1,0) ColumnCountWithNULLORBlank
                        FROM custlocalinfo
                        WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                               and CountryVisaTypeListId = VisaTypeId));
                        
                       
SET @custpreparerappinfo = (SELECT IF(AnyoneAssistInFillingApplication = '',1,0) + IF(AnyoneAssistInFillingApplication = NULL,1,0) + 
                             IF(AnyoneAssistInFillingApplication = 'NULL',1,0) ColumnCountWithNULLORBlank
                            FROM custpreparerappinfo
                            WHERE CustappInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId 
                                                   and CountryVisaTypeListId = VisaTypeId));
                            

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


SELECT (@EffectiveColumnFilled*100)/@TotalColumnCount ApplicationPercentageCompletion;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCountryList`()
BEGIN

 SELECT CountryName,CountryCode FROM countrylist;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoInsert`(IN `CustProfileId` INT, IN `CountryListId` INT, IN `CountryVisaTypeListId` INT, IN `CustAppNumber` VARCHAR(200))
BEGIN
 
 INSERT INTO custappinfo
 (CustProfileInfoId,CountryListId,CountryVisaTypeListId,CustAppNumber)
 VALUES
 (CustProfileId,CountryListId,CountryVisaTypeListId,CustAppNumber);
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoModifiedOnUpdate`(IN `AppNumberId` INT)
BEGIN

UPDATE custappinfo
SET ModifiedOn = NOW()
WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo1Insert`(IN `AppNumberId` INT, IN `FatherSurname` VARCHAR(200), IN `FatherGivenName` VARCHAR(200), IN `FatherDateofBirth` VARCHAR(100), IN `IsYourFatherInUS` VARCHAR(50), IN `MotherSurname` VARCHAR(200), IN `MotherGivenName` VARCHAR(200), IN `IsYourMotherInUS` VARCHAR(50), IN `ImmediateRelativesInUS_ApartFatherMother` VARCHAR(50), IN `Relative_Name_1` VARCHAR(200), IN `Relationship_To_Relative_1` VARCHAR(200), IN `Relative_Status_1` VARCHAR(100), IN `Relative_Name_2` VARCHAR(200), IN `Relationship_To_Relative_2` VARCHAR(200), IN `Relative_Status_2` VARCHAR(100), IN `Relative_Name_3` VARCHAR(200), IN `Relationship_To_Relative_3` VARCHAR(200), IN `Relative_Status_3` VARCHAR(100))
BEGIN

INSERT INTO custfamilyinfo1
(CustAppInfoId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3)
VALUES
(AppNumberId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo1Update`(IN `AppNumberId` INT, IN `FatherSurname` VARCHAR(200), IN `FatherGivenName` VARCHAR(200), IN `FatherDateofBirth` VARCHAR(100), IN `IsYourFatherInUS` VARCHAR(50), IN `MotherSurname` VARCHAR(200), IN `MotherGivenName` VARCHAR(200), IN `IsYourMotherInUS` VARCHAR(50), IN `ImmediateRelativesInUS_ApartFatherMother` VARCHAR(50), IN `Relative_Name_1` VARCHAR(200), IN `Relationship_To_Relative_1` VARCHAR(200), IN `Relative_Status_1` VARCHAR(100), IN `Relative_Name_2` VARCHAR(200), IN `Relationship_To_Relative_2` VARCHAR(200), IN `Relative_Status_2` VARCHAR(100), IN `Relative_Name_3` VARCHAR(200), IN `Relationship_To_Relative_3` VARCHAR(200), IN `Relative_Status_3` VARCHAR(100))
BEGIN	
			
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo2Insert`(IN `AppNumberId` INT, IN `Relative_Name_4` VARCHAR(200), IN `Relationship_To_Relative_4` VARCHAR(200), IN `Relative_Status_4` VARCHAR(100), IN `Spouse_FullName` VARCHAR(200), IN `Spouse_DateOfBirth` VARCHAR(100), IN `Spouse_Nationality` VARCHAR(200), IN `Spouse_CityOfBirth` VARCHAR(200), IN `Spouse_CountryOfBirth` VARCHAR(200), IN `Spouse_Address` VARCHAR(500))
BEGIN

INSERT INTO custfamilyinfo2
(CustAppInfoId,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,
Spouse_CountryOfBirth,Spouse_Address)
VALUES
(AppNumberId,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,
Spouse_CountryOfBirth,Spouse_Address);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo2Update`(IN `AppNumberId` INT, IN `Relative_Name_4` VARCHAR(200), IN `Relationship_To_Relative_4` VARCHAR(200), IN `Relative_Status_4` VARCHAR(100), IN `Spouse_FullName` VARCHAR(200), IN `Spouse_DateOfBirth` VARCHAR(100), IN `Spouse_Nationality` VARCHAR(200), IN `Spouse_CityOfBirth` VARCHAR(200), IN `Spouse_CountryOfBirth` VARCHAR(200), IN `Spouse_Address` VARCHAR(500))
BEGIN
 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustLocalInfoInsert`(IN `AppNumberId` INT,
                                             IN `CurrentLocation` VARCHAR(500))
BEGIN


INSERT INTO custlocalinfo
(CustAppInfoId,CurrentLocation)
VALUES
(AppNumberId,CurrentLocation);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustLocalInfoUpdate`(IN `AppNumberId` INT,
                                             IN `CurrentLocation` VARCHAR(500))
BEGIN


 UPDATE custlocalinfo
 SET CurrentLocation = CurrentLocation
 WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo1Insert`(IN `AppNumberId` INT, IN `First_Name` VARCHAR(500), IN `Last_Name` VARCHAR(500), IN `Full_Name_In_Native_Language` VARCHAR(500), IN `Other_Name_Used` VARCHAR(50), IN `Other_Name_1` VARCHAR(500), IN `Other_Name_2` VARCHAR(500), IN `Other_Name_3` VARCHAR(500), IN `Sex` VARCHAR(50), IN `Marital_Status` VARCHAR(50), IN `Date_Of_Birth` VARCHAR(100), IN `City_Of_Birth` VARCHAR(500), IN `State_Of_Birth` VARCHAR(500), IN `Nationality` VARCHAR(500), IN `Other_Nationalities` VARCHAR(500), IN `National_Identification_Number` VARCHAR(100), IN `US_Social_Security_Number` VARCHAR(100), IN `US_Taxpayer_ID_Number` VARCHAR(100), IN `Home_Address` VARCHAR(500), IN `City` VARCHAR(200))
BEGIN

INSERT INTO custpersonalinfo1
(CustAppInfoId,First_Name,Last_Name,Full_Name_In_Native_Language,Other_Name_Used,Other_Name_1,Other_Name_2,Other_Name_3,Sex,Marital_Status,Date_Of_Birth,City_Of_Birth,
State_Of_Birth,Nationality,Other_Nationalities,National_Identification_Number,US_Social_Security_Number,US_Taxpayer_ID_Number,Home_Address,City)
VALUES
(AppNumberId,First_Name,Last_Name,Full_Name_In_Native_Language,Other_Name_Used,Other_Name_1,Other_Name_2,Other_Name_3,Sex,Marital_Status,Date_Of_Birth,City_Of_Birth,
State_Of_Birth,Nationality,Other_Nationalities,National_Identification_Number,US_Social_Security_Number,US_Taxpayer_ID_Number,Home_Address,City);
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo2Insert`(IN `AppNumberId` INT, IN `State_Province` VARCHAR(200), IN `PostalZone_ZIPCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `Same_Mailing_Address` VARCHAR(50), IN `Mailing_Home_Address` VARCHAR(500), IN `Mailing_City` VARCHAR(200), IN `Mailing_State_Province` VARCHAR(200), IN `Mailing_PostalZone_ZIPCode` VARCHAR(50), IN `Mailing_Country` VARCHAR(500), IN `Home_Phone_Number` VARCHAR(50), IN `Work_Phone_Number` VARCHAR(50), IN `Work_Fax_Number` VARCHAR(50), IN `Mobile_Cell_Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Passport_Number` VARCHAR(100), IN `Passport_Book_Number` VARCHAR(100), IN `Country_Authority_Issued_Passport` VARCHAR(500), IN `City_Issued_Passport` VARCHAR(200))
BEGIN

INSERT INTO custpersonalinfo2
(CustAppInfoId,State_Province,PostalZone_ZIPCode,Country,Same_Mailing_Address,Mailing_Home_Address,Mailing_City,Mailing_State_Province,Mailing_PostalZone_ZIPCode,
Mailing_Country,Home_Phone_Number,Work_Phone_Number,Work_Fax_Number,Mobile_Cell_Phone_Number,Email_Address,Passport_Number,Passport_Book_Number,Country_Authority_Issued_Passport,
City_Issued_Passport)
VALUES
(AppNumberId,State_Province,PostalZone_ZIPCode,Country,Same_Mailing_Address,Mailing_Home_Address,Mailing_City,Mailing_State_Province,Mailing_PostalZone_ZIPCode,
Mailing_Country,Home_Phone_Number,Work_Phone_Number,Work_Fax_Number,Mobile_Cell_Phone_Number,Email_Address,Passport_Number,Passport_Book_Number,Country_Authority_Issued_Passport,
City_Issued_Passport);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo2Update`(IN `AppNumberId` INT, IN `State_Province` VARCHAR(200), IN `PostalZone_ZIPCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `Same_Mailing_Address` VARCHAR(50), IN `Mailing_Home_Address` VARCHAR(500), IN `Mailing_City` VARCHAR(200), IN `Mailing_State_Province` VARCHAR(200), IN `Mailing_PostalZone_ZIPCode` VARCHAR(50), IN `Mailing_Country` VARCHAR(500), IN `Home_Phone_Number` VARCHAR(50), IN `Work_Phone_Number` VARCHAR(50), IN `Work_Fax_Number` VARCHAR(50), IN `Mobile_Cell_Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Passport_Number` VARCHAR(100), IN `Passport_Book_Number` VARCHAR(100), IN `Country_Authority_Issued_Passport` VARCHAR(500), IN `City_Issued_Passport` VARCHAR(200))
BEGIN
 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo3Insert`(IN `AppNumberId` INT, IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50))
BEGIN

INSERT INTO custpersonalinfo3
(CustAppInfoId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost)
VALUES
(AppNumberId,State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPersonalInfo3Update`(IN `AppNumberId` INT, IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50))
BEGIN
 
 UPDATE custpersonalinfo3
 SET State_Province_Issued_Passport = State_Province_Issued_Passport,
 Country_Issued_Passport = Country_Issued_Passport,
 Issuance_Date_Passport = Issuance_Date_Passport,
 Expiration_Date_Passport = Expiration_Date_Passport,
 Passport_Stolen_Lost = Passport_Stolen_Lost
 WHERE CustAppInfoId = AppNumberId;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPreparerappInfoInsert`(IN `AppNumberId` INT,
                                                    IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

INSERT INTO custpreparerappinfo
(CustAppInfoId,AnyoneAssistInFillingApplication)
VALUES
(AppNumberId,AnyoneAssistInFillingApplication);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPreparerappInfoUpdate`(IN `AppNumberId` INT,
                                                    IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

 UPDATE custpreparerappinfo
 SET AnyoneAssistInFillingApplication = AnyoneAssistInFillingApplication
 WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo1Insert`(IN `AppNumberId` INT, IN `Principal_Applicant` VARCHAR(50), IN `Trip_Purpose_1` VARCHAR(500), IN `Trip_Purpose_2` VARCHAR(500), IN `Trip_Purpose_3` VARCHAR(500), IN `Trip_Purpose_4` VARCHAR(500), IN `Intended_Date_Of_Arrival` VARCHAR(100), IN `Intended_Length_Of_Stay_US` VARCHAR(100), IN `Address_of_US_Stay` VARCHAR(500), IN `Person_Entity_Paying_US_Trip` VARCHAR(200), IN `Telephone` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Relationship_To_You` VARCHAR(100), IN `PayingPartyTripAddress_SameAsHomeMailingAddress` VARCHAR(50), IN `PartyPayingAddress` VARCHAR(500), IN `PartyPayingCity` VARCHAR(200), IN `PartyPayingState_Province` VARCHAR(200), IN `PostalZone_ZIPcode` VARCHAR(50), IN `Country` VARCHAR(500), IN `OtherPersonTravellingWithYou` VARCHAR(100))
BEGIN

INSERT INTO custtravelinfo1
(CustAppInfoId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,PostalZone_ZIPcode,Country,OtherPersonTravellingWithYou)
VALUES
(AppNumberId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,PostalZone_ZIPcode,Country,OtherPersonTravellingWithYou);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo1Update`(IN `AppNumberId` INT, IN `Principal_Applicant` VARCHAR(50), IN `Trip_Purpose_1` VARCHAR(500), IN `Trip_Purpose_2` VARCHAR(500), IN `Trip_Purpose_3` VARCHAR(500), IN `Trip_Purpose_4` VARCHAR(500), IN `Intended_Date_Of_Arrival` VARCHAR(100), IN `Intended_Length_Of_Stay_US` VARCHAR(100), IN `Address_of_US_Stay` VARCHAR(500), IN `Person_Entity_Paying_US_Trip` VARCHAR(200), IN `Telephone` VARCHAR(50), IN `Travel_Email_Address` VARCHAR(500), IN `Relationship_To_You` VARCHAR(100), IN `PayingPartyTripAddress_SameAsHomeMailingAddress` VARCHAR(50), IN `PartyPayingAddress` VARCHAR(500), IN `PartyPayingCity` VARCHAR(200), IN `PartyPayingState_Province` VARCHAR(200), IN `PostalZone_ZIPcode` VARCHAR(50), IN `Country` VARCHAR(500), IN `OtherPersonTravellingWithYou` VARCHAR(10))
BEGIN
 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo2Insert`(IN `AppNumberId` INT, IN `TravellingPartofGroup_Organizantion` VARCHAR(100), IN `PersonTravellingWithYou_Name_1` VARCHAR(200), IN `PersonTravellingWithYou_Name_2` VARCHAR(200), IN `PersonTravellingWithYou_Name_3` VARCHAR(200), IN `PersonTravellingWithYou_Name_4` VARCHAR(200), IN `PersonTravellingWithYou_Name_5` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_1` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_2` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_3` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_4` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_5` VARCHAR(200), IN `EverBeenToUS` VARCHAR(50), IN `EverBeenIssuedUSVisa` VARCHAR(50), IN `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` VARCHAR(50))
BEGIN

INSERT INTO custtravelinfo2
(CustAppInfoId,TravellingPartofGroup_Organizantion,PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,
PersonTravellingWithYou_Name_5,PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication)
VALUES
(AppNumberId,TravellingPartofGroup_Organizantion,PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,
PersonTravellingWithYou_Name_5,PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo2Update`(IN `AppNumberId` INT, IN `TravellingPartofGroup_Organizantion` VARCHAR(100), IN `PersonTravellingWithYou_Name_1` VARCHAR(200), IN `PersonTravellingWithYou_Name_2` VARCHAR(200), IN `PersonTravellingWithYou_Name_3` VARCHAR(200), IN `PersonTravellingWithYou_Name_4` VARCHAR(200), IN `PersonTravellingWithYou_Name_5` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_1` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_2` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_3` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_4` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_5` VARCHAR(200), IN `EverBeenToUS` VARCHAR(50), IN `EverBeenIssuedUSVisa` VARCHAR(50), IN `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` VARCHAR(50))
BEGIN
 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactInfoInsert`(IN AppNumberId INT, 
                                                   IN ContactPersonNameInUS VARCHAR(200), 
                                                   IN OrganizationNameInU VARCHAR(200), 
                                                   IN Relationship VARCHAR(200), 
                                                   IN ContactAddressUS VARCHAR(500), 
                                                   IN Phone_Number VARCHAR(50), 
                                                   IN Contact_Email_Address VARCHAR(50))
BEGIN

INSERT INTO custuscontactinfo
(CustAppInfoId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Email_Address)
VALUES
(AppNumberId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Contact_Email_Address);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactInfoUpdate`(IN AppNumberId INT, 
                                                   IN ContactPersonNameInUS VARCHAR(200), 
                                                   IN OrganizationNameInU VARCHAR(200), 
                                                   IN Relationship VARCHAR(200), 
                                                   IN ContactAddressUS VARCHAR(500), 
                                                   IN Phone_Number VARCHAR(50), 
                                                   IN Email_Address VARCHAR(50))
BEGIN

 UPDATE custuscontactinfo
 SET ContactPersonNameInUS = ContactPersonNameInUS,
 OrganizationNameInUS = OrganizationNameInUS,
 Relationship = Relationship,
 ContactAddressUS = ContactAddressUS,
 Phone_Number = Phone_Number,
 Email_Address = Email_Address
 WHERE CustAppInfoId = AppNumberId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactWorkLocalContactPrepareInfoInsert`(IN `AppNumberId` INT, IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInUS` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Contact_Email_Address` VARCHAR(50), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` VARCHAR(50), IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500), IN `CurrentLocation` VARCHAR(500), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactWorkLocalContatPrepareInfoUpdate`(IN `AppNumberId` INT, IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInUS` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(50), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` INT, IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500), IN `CurrentLocation` VARCHAR(500), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN
 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustWorkEducationTrainingInfoInsert`(IN `AppNumberId` INT, IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZipCode` VARCHAR(50), IN `Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500))
BEGIN

INSERT INTO custworkeducationtraininginfo
(CustAppInfoId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties)
VALUES
(AppNumberId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties);

END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160Insert`(IN `AppNumberId` INT, IN `First_Name` VARCHAR(500), IN `Last_Name` VARCHAR(500), IN `Full_Name_In_Native_Language` VARCHAR(500), IN `Other_Name_Used` VARCHAR(50), IN `Other_Name_1` VARCHAR(500), IN `Other_Name_2` VARCHAR(500), IN `Other_Name_3` VARCHAR(500), IN `Sex` VARCHAR(50), IN `Marital_Status` VARCHAR(50), IN `Date_Of_Birth` VARCHAR(100), IN `City_Of_Birth` VARCHAR(500), IN `State_Of_Birth` VARCHAR(500), IN `Nationality` VARCHAR(500), IN `Other_Nationalities` VARCHAR(500), IN `National_Identification_Number` VARCHAR(100), IN `US_Social_Security_Number` VARCHAR(100), IN `US_Taxpayer_ID_Number` VARCHAR(100), IN `Home_Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZIPCode` INT, IN `Country` VARCHAR(500), IN `Same_Mailing_Address` VARCHAR(50), IN `Mailing_Home_Address` VARCHAR(500), IN `Mailing_City` VARCHAR(200), IN `Mailing_State_Province` VARCHAR(200), IN `Mailing_PostalZone_ZIPCode` INT, IN `Mailing_Country` VARCHAR(500), IN `Home_Phone_Number` VARCHAR(50), IN `Work_Phone_Number` VARCHAR(50), IN `Work_Fax_Number` VARCHAR(50), IN `Mobile_Cell_Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Passport_Number` VARCHAR(100), IN `Passport_Book_Number` VARCHAR(100), IN `Country_Authority_Issued_Passport` VARCHAR(500), IN `City_Issued_Passport` VARCHAR(200), IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50), IN `Principal_Applicant` VARCHAR(50), IN `Trip_Purpose_1` VARCHAR(500), IN `Trip_Purpose_2` VARCHAR(500), IN `Trip_Purpose_3` VARCHAR(500), IN `Trip_Purpose_4` VARCHAR(500), IN `Intended_Date_Of_Arrival` VARCHAR(100), IN `Intended_Length_Of_Stay_US` VARCHAR(100), IN `Address_of_US_Stay` VARCHAR(500), IN `Person_Entity_Paying_US_Trip` VARCHAR(200), IN `Telephone` VARCHAR(50), IN `Travel_Email_Address` VARCHAR(500), IN `Relationship_To_You` VARCHAR(100), IN `PayingPartyTripAddress_SameAsHomeMailingAddress` VARCHAR(50), IN `PartyPayingAddress` VARCHAR(500), IN `PartyPayingCity` VARCHAR(200), IN `PartyPayingState_Province` VARCHAR(200), IN `Travel_PostalZone_ZIPcode` INT, IN `Travel_Country` VARCHAR(500), IN `OtherPersonTravellingWithYou` VARCHAR(100), IN `TravellingPartofGroup_Organizantion` VARCHAR(100), IN `PersonTravellingWithYou_Name_1` VARCHAR(200), IN `PersonTravellingWithYou_Name_2` VARCHAR(200), IN `PersonTravellingWithYou_Name_3` VARCHAR(200), IN `PersonTravellingWithYou_Name_4` VARCHAR(200), IN `PersonTravellingWithYou_Name_5` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_1` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_2` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_3` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_4` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_5` VARCHAR(200), IN `EverBeenToUS` VARCHAR(50), IN `EverBeenIssuedUSVisa` VARCHAR(50), IN `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` VARCHAR(50), IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInUS` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Contact_Email_Address` VARCHAR(50), IN `FatherSurname` VARCHAR(200), IN `FatherGivenName` VARCHAR(200), IN `FatherDateofBirth` VARCHAR(100), IN `IsYourFatherInUS` VARCHAR(50), IN `MotherSurname` VARCHAR(200), IN `MotherGivenName` VARCHAR(200), IN `IsYourMotherInUS` VARCHAR(50), IN `ImmediateRelativesInUS_ApartFatherMother` VARCHAR(50), IN `Relative_Name_1` VARCHAR(200), IN `Relationship_To_Relative_1` VARCHAR(200), IN `Relative_Status_1` VARCHAR(100), IN `Relative_Name_2` VARCHAR(200), IN `Relationship_To_Relative_2` VARCHAR(200), IN `Relative_Status_2` VARCHAR(100), IN `Relative_Name_3` VARCHAR(200), IN `Relationship_To_Relative_3` VARCHAR(200), IN `Relative_Status_3` VARCHAR(100), IN `Relative_Name_4` VARCHAR(200), IN `Relationship_To_Relative_4` VARCHAR(200), IN `Relative_Status_4` VARCHAR(100), IN `Spouse_FullName` VARCHAR(200), IN `Spouse_DateOfBirth` VARCHAR(100), IN `Spouse_Nationality` VARCHAR(200), IN `Spouse_CityOfBirth` VARCHAR(200), IN `Spouse_CountryOfBirth` VARCHAR(200), IN `Spouse_Address` VARCHAR(500), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `Work_City` VARCHAR(200), IN `Work_State_Province` VARCHAR(200), IN `Work_PostalZone_ZipCode` INT, IN `Work_Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500), IN `CurrentLocation` VARCHAR(500), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

INSERT INTO custpersonalinfo
(CustAppInfoId,First_Name,Last_Name,Full_Name_In_Native_Alphabet,Other_Name_Used,Other_Name1,Other_Name2,Other_Name3,Sex,Marital_Status,Date_Of_Birth,City_Of_Birth,
State_Of_Birth,Nationality,Other_Nationalities,National_Identification_Number,US_Social_Security_Number,US_Taxpayer_ID_Number,Home_Address,City,State_Province,
PostalZone_ZIPCode,Country,Same_Mailing_Address,Mailing_Home_Address,Mailing_City,Mailing_State_Province,Mailing_PostalZone_ZIPCode,Mailing_Country,Home_Phone_Number,
Work_Phone_Number,Work_Fax_Number,Mobile_Cell_Phone_Number,Email_Address,Passport_Number,Passport_Book_Number,Country_Authority_Issued_Passport,City_Issued_Passport,
State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost)
VALUES
(AppNumberId,First_Name,Last_Name,Full_Name_In_Native_Alphabet,Other_Name_Used,Other_Name1,Other_Name2,Other_Name3,Sex,Marital_Status,Date_Of_Birth,City_Of_Birth,
State_Of_Birth,Nationality,Other_Nationalities,National_Identification_Number,US_Social_Security_Number,US_Taxpayer_ID_Number,Home_Address,City,State_Province,
PostalZone_ZIPCode,Country,Same_Mailing_Address,Mailing_Home_Address,Mailing_City,Mailing_State_Province,Mailing_PostalZone_ZIPCode,Mailing_Country,Home_Phone_Number,
Work_Phone_Number,Work_Fax_Number,Mobile_Cell_Phone_Number,Email_Address,Passport_Number,Passport_Book_Number,Country_Authority_Issued_Passport,City_Issued_Passport,
State_Province_Issued_Passport,Country_Issued_Passport,Issuance_Date_Passport,Expiration_Date_Passport,Passport_Stolen_Lost);

INSERT INTO custtravelinfo
(CustAppInfoId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,PostalZone_ZIPcode,Country,OtherPersonTravellingWithYou,TravellingPartofGroup_Organizantion,
PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,PersonTravellingWithYou_Name_5,
PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication)
VALUES
(AppNumberId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Travel_Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,Travel_PostalZone_ZIPcode,Travel_Country,OtherPersonTravellingWithYou,TravellingPartofGroup_Organizantion,
PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,PersonTravellingWithYou_Name_5,
PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication);

INSERT INTO custuscontactinfo
(CustAppInfoId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Email_Address)
VALUES
(AppNumberId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Contact_Email_Address);

INSERT INTO custfamilyinfo
(CustAppInfoId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,
Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,Spouse_CountryOfBirth,Spouse_Address)
VALUES
(AppNumberId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3,Relative_Name_4,Relationship_To_Relative_4,Relative_Status_4,
Spouse_FullName,Spouse_DateOfBirth,Spouse_Nationality,Spouse_CityOfBirth,Spouse_CountryOfBirth,Spouse_Address);

INSERT INTO custworkeducationtraininginfo
(CustAppInfoId,Primary_Occupation,PresentEmployer_SchoolName,Address,City,State_Province,PostalZone_ZipCode,Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties)
VALUES
(AppNumberId,Primary_Occupation,PresentEmployer_SchoolName,Address,Work_City,Work_State_Province,Work_PostalZone_ZipCode,Work_Country,MonthSalary_LocalCurrency,BrifelyDescribeYourDuties);

INSERT INTO custlocalinfo
(CustAppInfoId,CurrentLocation)
VALUES
(AppNumberId,CurrentLocation);

INSERT INTO custpreparerappinfo
(CustAppInfoId,AnyoneAssistInFillingApplication)
VALUES
(AppNumberId,AnyoneAssistInFillingApplication);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160Update`(IN `AppNumberId` INT, IN `First_Name` VARCHAR(500), IN `Last_Name` VARCHAR(500), IN `Full_Name_In_Native_Language` VARCHAR(500), IN `Other_Name_Used` VARCHAR(50), IN `Other_Name_1` VARCHAR(500), IN `Other_Name_2` VARCHAR(500), IN `Other_Name_3` VARCHAR(500), IN `Sex` VARCHAR(50), IN `Marital_Status` VARCHAR(50), IN `Date_Of_Birth` VARCHAR(100), IN `City_Of_Birth` VARCHAR(500), IN `State_Of_Birth` VARCHAR(500), IN `Nationality` VARCHAR(500), IN `Other_Nationalities` VARCHAR(500), IN `National_Identification_Number` VARCHAR(100), IN `US_Social_Security_Number` VARCHAR(100), IN `US_Taxpayer_ID_Number` VARCHAR(100), IN `Home_Address` VARCHAR(500), IN `City` VARCHAR(200), IN `State_Province` VARCHAR(200), IN `PostalZone_ZIPCode` INT, IN `Country` VARCHAR(500), IN `Same_Mailing_Address` VARCHAR(50), IN `Mailing_Home_Address` VARCHAR(500), IN `Mailing_City` VARCHAR(200), IN `Mailing_State_Province` VARCHAR(200), IN `Mailing_PostalZone_ZIPCode` INT, IN `Mailing_Country` VARCHAR(500), IN `Home_Phone_Number` VARCHAR(50), IN `Work_Phone_Number` VARCHAR(50), IN `Work_Fax_Number` VARCHAR(50), IN `Mobile_Cell_Phone_Number` VARCHAR(50), IN `Email_Address` VARCHAR(500), IN `Passport_Number` VARCHAR(100), IN `Passport_Book_Number` VARCHAR(100), IN `Country_Authority_Issued_Passport` VARCHAR(500), IN `City_Issued_Passport` VARCHAR(200), IN `State_Province_Issued_Passport` VARCHAR(200), IN `Country_Issued_Passport` VARCHAR(200), IN `Issuance_Date_Passport` VARCHAR(100), IN `Expiration_Date_Passport` VARCHAR(100), IN `Passport_Stolen_Lost` VARCHAR(50), IN `Principal_Applicant` VARCHAR(50), IN `Trip_Purpose_1` VARCHAR(500), IN `Trip_Purpose_2` VARCHAR(500), IN `Trip_Purpose_3` VARCHAR(500), IN `Trip_Purpose_4` VARCHAR(500), IN `Intended_Date_Of_Arrival` VARCHAR(100), IN `Intended_Length_Of_Stay_US` VARCHAR(100), IN `Address_of_US_Stay` VARCHAR(500), IN `Person_Entity_Paying_US_Trip` VARCHAR(200), IN `Telephone` VARCHAR(50), IN `Travel_Email_Address` VARCHAR(500), IN `Relationship_To_You` VARCHAR(100), IN `PayingPartyTripAddress_SameAsHomeMailingAddress` VARCHAR(50), IN `PartyPayingAddress` VARCHAR(500), IN `PartyPayingCity` VARCHAR(200), IN `PartyPayingState_Province` VARCHAR(200), IN `Travel_PostalZone_ZIPcode` INT, IN `Travel_Country` VARCHAR(500), IN `OtherPersonTravellingWithYou` VARCHAR(100), IN `TravellingPartofGroup_Organizantion` VARCHAR(100), IN `PersonTravellingWithYou_Name_1` VARCHAR(200), IN `PersonTravellingWithYou_Name_2` VARCHAR(200), IN `PersonTravellingWithYou_Name_3` VARCHAR(200), IN `PersonTravellingWithYou_Name_4` VARCHAR(200), IN `PersonTravellingWithYou_Name_5` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_1` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_2` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_3` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_4` VARCHAR(200), IN `PersonTravellingWithYou_Relationship_5` VARCHAR(200), IN `EverBeenToUS` VARCHAR(50), IN `EverBeenIssuedUSVisa` VARCHAR(50), IN `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` VARCHAR(50), IN `ContactPersonNameInUS` VARCHAR(200), IN `OrganizationNameInUS` VARCHAR(200), IN `Relationship` VARCHAR(200), IN `ContactAddressUS` VARCHAR(500), IN `Phone_Number` VARCHAR(50), IN `Contact_Email_Address` VARCHAR(50), IN `FatherSurname` VARCHAR(200), IN `FatherGivenName` VARCHAR(200), IN `FatherDateofBirth` VARCHAR(100), IN `IsYourFatherInUS` VARCHAR(50), IN `MotherSurname` VARCHAR(200), IN `MotherGivenName` VARCHAR(200), IN `IsYourMotherInUS` VARCHAR(50), IN `ImmediateRelativesInUS_ApartFatherMother` VARCHAR(50), IN `Relative_Name_1` VARCHAR(200), IN `Relationship_To_Relative_1` VARCHAR(200), IN `Relative_Status_1` VARCHAR(100), IN `Relative_Name_2` VARCHAR(200), IN `Relationship_To_Relative_2` VARCHAR(200), IN `Relative_Status_2` VARCHAR(100), IN `Relative_Name_3` VARCHAR(200), IN `Relationship_To_Relative_3` VARCHAR(200), IN `Relative_Status_3` VARCHAR(100), IN `Relative_Name_4` VARCHAR(200), IN `Relationship_To_Relative_4` VARCHAR(200), IN `Relative_Status_4` VARCHAR(100), IN `Spouse_FullName` VARCHAR(200), IN `Spouse_DateOfBirth` VARCHAR(100), IN `Spouse_Nationality` VARCHAR(200), IN `Spouse_CityOfBirth` VARCHAR(200), IN `Spouse_CountryOfBirth` VARCHAR(200), IN `Spouse_Address` VARCHAR(500), IN `Primary_Occupation` VARCHAR(200), IN `PresentEmployer_SchoolName` VARCHAR(200), IN `Address` VARCHAR(500), IN `Work_City` VARCHAR(200), IN `Work_State_Province` VARCHAR(200), IN `Work_PostalZone_ZipCode` INT, IN `Work_Country` VARCHAR(200), IN `MonthSalary_LocalCurrency` VARCHAR(100), IN `BrifelyDescribeYourDuties` VARCHAR(500), IN `CurrentLocation` VARCHAR(500), IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN
 
 UPDATE custpersonalinfo
 SET First_Name = First_Name,
 Last_Name = Last_Name,
 Full_Name_In_Native_Alphabet = Full_Name_In_Native_Alphabet,
 Other_Name_Used = Other_Name_Used,
 Other_Name1 = Other_Name1,
 Other_Name2 = Other_Name2,
 Other_Name3 = Other_Name3,
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
 City = City,
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
 City_Issued_Passport = City_Issued_Passport,
 State_Province_Issued_Passport = State_Province_Issued_Passport,
 Country_Issued_Passport = Country_Issued_Passport,
 Issuance_Date_Passport = Issuance_Date_Passport,
 Expiration_Date_Passport = Expiration_Date_Passport,
 Passport_Stolen_Lost = Passport_Stolen_Lost
 WHERE CustAppInfoId = AppNumberId;
 
 UPDATE custtravelinfo
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
 PostalZone_ZIPcode = Travel_PostalZone_ZIPcode,
 Country = Travel_Country,
 OtherPersonTravellingWithYou = OtherPersonTravellingWithYou,
 TravellingPartofGroup_Organizantion = TravellingPartofGroup_Organizantion,
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
 
 UPDATE custuscontactinfo
 SET ContactPersonNameInUS = ContactPersonNameInUS,
 OrganizationNameInUS = OrganizationNameInUS,
 Relationship = Relationship,
 ContactAddressUS = ContactAddressUS,
 Phone_Number = Phone_Number,
 Email_Address = Contact_Email_Address
 WHERE CustAppInfoId = AppNumberId;
 
 UPDATE custfamilyinfo
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
 Relative_Status_3 = Relative_Status_3,
 Relative_Name_4 = Relative_Name_4,
 Relationship_To_Relative_4 = Relationship_To_Relative_4,
 Relative_Status_4 = Relative_Status_4,
 Spouse_FullName = Spouse_FullName,
 Spouse_DateOfBirth = Spouse_DateOfBirth,
 Spouse_Nationality = Spouse_Nationality,
 Spouse_CityOfBirth = Spouse_CityOfBirth,
 Spouse_CountryOfBirth = Spouse_CountryOfBirth,
 Spouse_Address = Spouse_Address
 WHERE CustAppInfoId = AppNumberId;
 
 UPDATE custworkeducationtraininginfo
 SET Primary_Occupation = Primary_Occupation,
 PresentEmployer_SchoolName = PresentEmployer_SchoolName,
 Address = Address,
 City = Work_City,
 State_Province = Work_State_Province,
 PostalZone_ZipCode = Work_PostalZone_ZipCode,
 Country = Work_Country,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetAppId`(IN AppNumber VARCHAR(200))
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadDS160`(IN `ProfileId` INT, IN `CountryId` INT, IN `VisaTypeId` INT)
BEGIN

 
 SELECT cp1.*,
       cp2.State_Province Personal_State_Province,
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
	   cw.State_Province,
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
 LEFT JOIN custfamilyinfo cf1 ON cp1.CustAppInfoId = cf1.CustAppInfoId
 LEFT JOIN custfamilyinfo cf2 ON cp1.CustAppInfoId = cf2.CustAppInfoId
 LEFT JOIN custworkeducationtraininginfo cw ON cp1.CustAppInfoId = cw.CustAppInfoId
 LEFT JOIN custlocalinfo cl ON cp1.CustAppInfoId = cl.CustAppInfoId
 LEFT JOIN custpreparerappinfo cpa ON cp1.CustAppInfoId = cpa.CustAppInfoId
 WHERE cp1.CustAppInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId and CountryVisaTypeListId = VisaTypeId);



 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadDS160Menu`()
BEGIN

SELECT MenuDescription FROM ds160menuinfo;

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
CREATE DEFINER=`root`@`localhost` FUNCTION `fnCalculateAppPercentageCompleted`(AppID INT) RETURNS varchar(255) CHARSET latin1
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
  `AppPercentageCompleted` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apppercent`
--

INSERT INTO `apppercent` (`Id`, `CustAppInfoId`, `CustProfileInfoId`, `CountryListId`, `CountryVisaTypeListId`, `AppPercentageCompleted`) VALUES
(1, 43, 8, 224, 2, NULL),
(2, 44, 28, 224, 2, NULL),
(3, 47, 21, 224, 2, NULL),
(4, 86, 8, 99, 3, NULL),
(5, 87, 20, 224, 2, NULL),
(6, 88, 29, 224, 2, NULL),
(7, 103, 30, 224, 2, NULL),
(8, 104, 8, 224, 2, NULL),
(16, 43, 8, 224, 2, NULL),
(17, 44, 28, 224, 2, NULL),
(18, 47, 21, 224, 2, NULL),
(19, 86, 8, 99, 3, NULL),
(20, 87, 20, 224, 2, NULL),
(21, 88, 29, 224, 2, NULL),
(22, 103, 30, 224, 2, NULL),
(23, 104, 8, 224, 2, NULL),
(31, 43, 8, 224, 2, NULL),
(32, 44, 28, 224, 2, NULL),
(33, 47, 21, 224, 2, NULL),
(34, 86, 8, 99, 3, NULL),
(35, 87, 20, 224, 2, NULL),
(36, 88, 29, 224, 2, NULL),
(37, 103, 30, 224, 2, NULL),
(38, 104, 8, 224, 2, NULL),
(46, 43, 8, 224, 2, NULL),
(47, 44, 28, 224, 2, NULL),
(48, 47, 21, 224, 2, NULL),
(49, 86, 8, 99, 3, NULL),
(50, 87, 20, 224, 2, NULL),
(51, 88, 29, 224, 2, NULL),
(52, 103, 30, 224, 2, NULL),
(53, 104, 8, 224, 2, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countryvisatypelist`
--

INSERT INTO `countryvisatypelist` (`CountryVisaTypeListId`, `CountryListId`, `CountryVisaType`, `CountryVisaTypeDescription`) VALUES
(2, 224, 'B-2', 'tourism, vacation, pleasure visitor, medical treatment'),
(3, 99, 'T', 'tourism, tourist, non-business, vacation');

-- --------------------------------------------------------

--
-- Table structure for table `custappinfo`
--

CREATE TABLE `custappinfo` (
  `CustAppInfoId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) NOT NULL,
  `CountryListId` int(11) NOT NULL,
  `CountryVisaTypeListId` int(11) NOT NULL,
  `CustAppNumber` varchar(200) DEFAULT NULL,
  `Activated` enum('0','1') NOT NULL DEFAULT '1',
  `Completed` enum('0','1') NOT NULL DEFAULT '0',
  `Submitted` enum('0','1') NOT NULL DEFAULT '0',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedOn` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custappinfo`
--

INSERT INTO `custappinfo` (`CustAppInfoId`, `CustProfileInfoId`, `CountryListId`, `CountryVisaTypeListId`, `CustAppNumber`, `Activated`, `Completed`, `Submitted`, `CreatedOn`, `ModifiedOn`) VALUES
(43, 8, 224, 2, 'APP008224B-2', '1', '0', '0', '2016-09-14 02:46:40', '2016-09-29 15:25:41'),
(44, 28, 224, 2, 'APP0028224B-2', '1', '0', '0', '2016-09-14 02:46:40', '2016-08-24 08:08:48'),
(47, 21, 224, 2, 'APP0021224B-2', '1', '0', '0', '2016-09-14 02:46:40', '2016-09-17 18:05:51'),
(86, 8, 99, 3, 'APP00899T', '1', '0', '0', '2016-09-16 09:35:05', NULL),
(87, 20, 224, 2, 'APP0020224B-2', '1', '0', '0', '2016-09-17 22:16:06', '2016-09-17 18:41:36'),
(88, 29, 224, 2, 'APP0029224B-2', '1', '0', '0', '2016-09-23 15:41:19', '2016-09-23 11:43:35'),
(103, 30, 224, 2, 'APP0030224B-2', '1', '0', '0', '2016-09-30 05:13:25', '2016-09-30 01:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `custfamilyinfo`
--

CREATE TABLE `custfamilyinfo` (
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
  `Relative_Status_3` varchar(100) DEFAULT NULL,
  `Relative_Name_4` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_4` varchar(200) DEFAULT NULL,
  `Relative_Status_4` varchar(100) DEFAULT NULL,
  `Spouse_FullName` varchar(200) DEFAULT NULL,
  `Spouse_DateOfBirth` varchar(100) DEFAULT NULL,
  `Spouse_Nationality` varchar(200) DEFAULT NULL,
  `Spouse_CityOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_CountryOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_Address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custfamilyinfo1`
--

INSERT INTO `custfamilyinfo1` (`CustFamilyInfoId`, `CustAppInfoId`, `FatherSurname`, `FatherGivenName`, `FatherDateofBirth`, `IsYourFatherInUS`, `MotherSurname`, `MotherGivenName`, `IsYourMotherInUS`, `ImmediateRelativesInUS_ApartFatherMother`, `Relative_Name_1`, `Relationship_To_Relative_1`, `Relative_Status_1`, `Relative_Name_2`, `Relationship_To_Relative_2`, `Relative_Status_2`, `Relative_Name_3`, `Relationship_To_Relative_3`, `Relative_Status_3`) VALUES
(1, 43, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 103, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custfamilyinfo2`
--

INSERT INTO `custfamilyinfo2` (`CustFamilyInfoId`, `CustAppInfoId`, `Relative_Name_4`, `Relationship_To_Relative_4`, `Relative_Status_4`, `Spouse_FullName`, `Spouse_DateOfBirth`, `Spouse_Nationality`, `Spouse_CityOfBirth`, `Spouse_CountryOfBirth`, `Spouse_Address`) VALUES
(1, 43, '', '', '', '', '', '', '', '', ''),
(2, 103, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custlocalinfo`
--

CREATE TABLE `custlocalinfo` (
  `CustLocalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `CurrentLocation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custlocalinfo`
--

INSERT INTO `custlocalinfo` (`CustLocalInfoId`, `CustAppInfoId`, `CurrentLocation`) VALUES
(20, 103, ''),
(24, 43, '');

-- --------------------------------------------------------

--
-- Table structure for table `custpersonalinfo`
--

CREATE TABLE `custpersonalinfo` (
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
  `Other_Nationalities` varchar(500) DEFAULT 'NULL',
  `National_Identification_Number` varchar(100) DEFAULT NULL,
  `US_Social_Security_Number` varchar(100) DEFAULT NULL,
  `US_Taxpayer_ID_Number` varchar(100) DEFAULT NULL,
  `Home_Address` varchar(500) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
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
  `City_Issued_Passport` varchar(200) DEFAULT NULL,
  `State_Province_Issued_Passport` varchar(200) DEFAULT NULL,
  `Country_Issued_Passport` varchar(200) DEFAULT NULL,
  `Issuance_Date_Passport` varchar(100) DEFAULT NULL,
  `Expiration_Date_Passport` varchar(100) DEFAULT NULL,
  `Passport_Stolen_Lost` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo`
--

INSERT INTO `custpersonalinfo` (`CustPersonalInfoId`, `CustAppInfoId`, `First_Name`, `Last_Name`, `Full_Name_In_Native_Language`, `Other_Name_Used`, `Other_Name_1`, `Other_Name_2`, `Other_Name_3`, `Sex`, `Marital_Status`, `Date_Of_Birth`, `City_Of_Birth`, `State_Of_Birth`, `Nationality`, `Other_Nationalities`, `National_Identification_Number`, `US_Social_Security_Number`, `US_Taxpayer_ID_Number`, `Home_Address`, `City`, `State_Province`, `PostalZone_ZIPCode`, `Country`, `Same_Mailing_Address`, `Mailing_Home_Address`, `Mailing_City`, `Mailing_State_Province`, `Mailing_PostalZone_ZIPCode`, `Mailing_Country`, `Home_Phone_Number`, `Work_Phone_Number`, `Work_Fax_Number`, `Mobile_Cell_Phone_Number`, `Email_Address`, `Passport_Number`, `Passport_Book_Number`, `Country_Authority_Issued_Passport`, `City_Issued_Passport`, `State_Province_Issued_Passport`, `Country_Issued_Passport`, `Issuance_Date_Passport`, `Expiration_Date_Passport`, `Passport_Stolen_Lost`) VALUES
(21, 43, 'Roon', 'Razith', NULL, '', NULL, NULL, NULL, 'male', 'divorced', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'New Jersey', '07306', 'US', '', '', 'Jersey City', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(49, 44, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 44, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 44, 'NULL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 44, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 44, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', ''),
(58, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, 'New Jersey', '07306', 'US', '', '', 'Jersey City', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(60, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(61, 43, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'New Jersey', '07306', 'US', '', '', 'Jersey City', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(62, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(63, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', NULL, NULL, NULL, NULL, NULL, 'New Jersey', '07306', 'US', '', '', 'Jersey City', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, 44, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo1`
--

INSERT INTO `custpersonalinfo1` (`CustPersonalInfoId`, `CustAppInfoId`, `First_Name`, `Last_Name`, `Full_Name_In_Native_Language`, `Other_Name_Used`, `Other_Name_1`, `Other_Name_2`, `Other_Name_3`, `Sex`, `Marital_Status`, `Date_Of_Birth`, `City_Of_Birth`, `State_Of_Birth`, `Nationality`, `Other_Nationalities`, `National_Identification_Number`, `US_Social_Security_Number`, `US_Taxpayer_ID_Number`, `Home_Address`, `City`) VALUES
(3, 43, 'Harun', 'Asaf Ali', '', 'no', '', '', '', 'male', 'married', '12/10/1977', 'Bangalore', 'Karnataka', 'India', 'N/A', '', '019784534', 'taxie', '571, 56 St', 'West New York'),
(4, 47, 'Brooke', 'Wells ', '', 'no', '', '', '', 'female', 'divorced', '', 'Barcelona', '', '', '', '', '', '', '', ''),
(23, 87, 'Jenn', 'Smith', 'n/a', 'no', '', '', '', '', '', '12/10/2000', 'Barcelona', 'Barx', 'Spanish', '', '', '', '', '', ''),
(26, 103, 'Suraya', 'Prakash', 'BSSP', 'no', '', '', '', 'male', 'married', '10/03/1978', 'Bangalore', 'Karnataka', 'Choose...', 'Iceland', 'IND231478ST1', '', '', '123, Thirt Street', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo2`
--

INSERT INTO `custpersonalinfo2` (`CustPersonalInfoId`, `CustAppInfoId`, `State_Province`, `PostalZone_ZIPCode`, `Country`, `Same_Mailing_Address`, `Mailing_Home_Address`, `Mailing_City`, `Mailing_State_Province`, `Mailing_PostalZone_ZIPCode`, `Mailing_Country`, `Home_Phone_Number`, `Work_Phone_Number`, `Work_Fax_Number`, `Mobile_Cell_Phone_Number`, `Email_Address`, `Passport_Number`, `Passport_Book_Number`, `Country_Authority_Issued_Passport`, `City_Issued_Passport`) VALUES
(1, 43, '', '', '', '', '', '', '', '', 'Choose...', '', '', '', '', '', '', '', '', ''),
(3, 47, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 87, 'North Carolina', '07093', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 88, 'Rome State', '098234', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 103, '', '', '', '', '', '', '', '', 'Choose...', '', '', '', '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo3`
--

INSERT INTO `custpersonalinfo3` (`CustPersonalInfoId`, `CustAppInfoId`, `State_Province_Issued_Passport`, `Country_Issued_Passport`, `Issuance_Date_Passport`, `Expiration_Date_Passport`, `Passport_Stolen_Lost`) VALUES
(1, 43, '', '', '', '', ''),
(2, 103, '', '', '', '', ''),
(3, 47, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custpreparerappinfo`
--

CREATE TABLE `custpreparerappinfo` (
  `CustPrepareAppInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `AnyoneAssistInFillingApplication` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpreparerappinfo`
--

INSERT INTO `custpreparerappinfo` (`CustPrepareAppInfoId`, `CustAppInfoId`, `AnyoneAssistInFillingApplication`) VALUES
(19, 103, ''),
(20, 43, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custprofileinfo`
--

INSERT INTO `custprofileinfo` (`CustProfileInfoId`, `UserName`, `FirstName`, `LastName`, `EmailAddress`, `Password`, `DateOfBirth`, `Activated`) VALUES
(8, 'hrazith', 'Harun', 'Razith', 'hrazith@gmail.com', 'roots', '12101977', '1'),
(15, 'hgwells', 'Hugh', 'Wells', 'hgwells@gmail.com', '12345', '12101984', '0'),
(16, 'broy', 'Bryan', 'Roy', 'broy@gmail.com', 'b12345', '12101977', '0'),
(17, 'broy', 'Bryan', 'Roy', 'broy@gmail.com', '12345', '12101977', '0'),
(20, 'jjames', 'Jesse', 'James', 'jjames@gmail.com', 'jj77', '', '1'),
(21, 'bwells', 'Brooke', 'Wells', 'bwells@gmail.com', 'bw77', '', '1'),
(24, 'jsmith', 'Jennifer ', 'Smith', 'jsmith@gmail.com', 'js77', '12101977', '1'),
(26, 'sgupta', 'Sachin', 'Gupta', 'sachin@gmail.com', 'sg1986', '8191986', '1'),
(27, 'suafzl', 'Sumaiya', 'Afzal', 'suafzl@gmail.com', 'sf1984', '10181984', '1'),
(28, 'stacy', 'Stacie', 'Tovar', 'stovar@gmail.com', 'st77', '8151984', '1'),
(29, 'jabbot', 'Jack', 'Abbot', 'jabbot@gmail.com', 'jb77', '121999', '1'),
(30, 'sprakash', 'Surya', 'Prakash', 'sprakash@gmail.com', 'sp77', '231996', '1'),
(31, '', '', '', '', '', 'Month', '1');

-- --------------------------------------------------------

--
-- Table structure for table `custtravelinfo`
--

CREATE TABLE `custtravelinfo` (
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
  `OtherPersonTravellingWithYou` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custtravelinfo1`
--

INSERT INTO `custtravelinfo1` (`CustTravelInfoId`, `CustAppInfoId`, `Principal_Applicant`, `Trip_Purpose_1`, `Trip_Purpose_2`, `Trip_Purpose_3`, `Trip_Purpose_4`, `Intended_Date_Of_Arrival`, `Intended_Length_Of_Stay_US`, `Address_of_US_Stay`, `Person_Entity_Paying_US_Trip`, `Telephone`, `Email_Address`, `Relationship_To_You`, `PayingPartyTripAddress_SameAsHomeMailingAddress`, `PartyPayingAddress`, `PartyPayingCity`, `PartyPayingState_Province`, `PostalZone_ZIPcode`, `Country`, `OtherPersonTravellingWithYou`) VALUES
(1, 43, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 103, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 47, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custtravelinfo2`
--

INSERT INTO `custtravelinfo2` (`CustTravelInfoId`, `CustAppInfoId`, `TravellingPartofGroup_Organizantion`, `PersonTravellingWithYou_Name_1`, `PersonTravellingWithYou_Name_2`, `PersonTravellingWithYou_Name_3`, `PersonTravellingWithYou_Name_4`, `PersonTravellingWithYou_Name_5`, `PersonTravellingWithYou_Relationship_1`, `PersonTravellingWithYou_Relationship_2`, `PersonTravellingWithYou_Relationship_3`, `PersonTravellingWithYou_Relationship_4`, `PersonTravellingWithYou_Relationship_5`, `EverBeenToUS`, `EverBeenIssuedUSVisa`, `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication`) VALUES
(1, 43, '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 103, '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custuscontactinfo`
--

INSERT INTO `custuscontactinfo` (`CustUSContactInfoId`, `CustAppInfoId`, `ContactPersonNameInUS`, `OrganizationNameInUS`, `Relationship`, `ContactAddressUS`, `Phone_Number`, `Email_Address`) VALUES
(10, 43, '', '', '', '', '', ''),
(16, 103, '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custworkeducationtraininginfo`
--

INSERT INTO `custworkeducationtraininginfo` (`CustWorkEducationTrainingInfoId`, `CustAppInfoId`, `Primary_Occupation`, `PresentEmployer_SchoolName`, `Address`, `City`, `State_Province`, `PostalZone_ZipCode`, `Country`, `MonthSalary_LocalCurrency`, `BrifelyDescribeYourDuties`) VALUES
(20, 103, '', '', '', '', '', '', '', '', ''),
(21, 43, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `DS160MenuInfo`
--

CREATE TABLE `DS160MenuInfo` (
  `DS160MenuInfoId` int(11) NOT NULL,
  `MenuDescription` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DS160MenuInfo`
--

INSERT INTO `DS160MenuInfo` (`DS160MenuInfoId`, `MenuDescription`) VALUES
(1, 'Personal, Address, Phone and Passport Information'),
(2, 'Travel Information'),
(3, 'U.S. Contact Information'),
(4, 'Family Informaation'),
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
  `CustProfileInfoId` int(11) DEFAULT NULL,
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
-- Table structure for table `employment`
--

CREATE TABLE `employment` (
  `EmploymentId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
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
  `HoursPerWeek` int(11) DEFAULT NULL,
  `IsPositionPartTime` varchar(50) DEFAULT NULL,
  `JobTitle` varchar(200) DEFAULT NULL,
  `CurrentAnnualBaseSalary` varchar(100) DEFAULT NULL,
  `DetailJobDuties` varchar(8000) DEFAULT NULL,
  `TechnologiesUsed` varchar(8000) DEFAULT NULL,
  `SupervisorName` varchar(500) DEFAULT NULL,
  `SupervisorPhoneNumber` varchar(100) DEFAULT NULL,
  `SuperVisorJobTitle` varchar(200) DEFAULT NULL,
  `AnyInterruptionsInEmploymentWithEmployer` varchar(50) DEFAULT NULL,
  `WorkingOutsideTheUS` varchar(50) DEFAULT NULL,
  `IfWorkingOutsideDoesItInvolveSupervision` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `internationtravel`
--

CREATE TABLE `internationtravel` (
  `InternationalTravelId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
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
  `CustProfileInfoId` int(11) DEFAULT NULL,
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
-- Table structure for table `personaldetail`
--

CREATE TABLE `personaldetail` (
  `PersonalDetailId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
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
  `CountryofBirth` varchar(500) DEFAULT NULL,
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
  `CustProfileInfoId` int(11) DEFAULT NULL,
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
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `ResidingOutsideUS` varchar(50) DEFAULT NULL,
  `USConsulateLocationOutsideUS` varchar(500) DEFAULT NULL,
  `AppliedNonImmigrantUSVisa` varchar(50) DEFAULT NULL,
  `VisaCancelledDeniedRejected` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visainformation`
--

CREATE TABLE `visainformation` (
  `VisaInformationId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `EverEnteredUS` varchar(50) DEFAULT NULL,
  `DateofLastEntryUS` varchar(100) DEFAULT NULL,
  `I94Number` int(11) DEFAULT NULL,
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
  `DatePlaceOutcomeOfGreenCardOrPermanentResidency` varchar(1000) DEFAULT NULL,
  `F1Status_CPTTraining` varchar(50) DEFAULT NULL,
  `CPTWithGraduateDegree` varchar(50) DEFAULT NULL,
  `StartedCPTAfterDegreeProgram` varchar(50) DEFAULT NULL,
  `IfinF1_AppliedOTP` varchar(50) DEFAULT NULL,
  `I765Approved_Pending` varchar(50) DEFAULT NULL,
  `I765ReceiptNumber` varchar(100) DEFAULT NULL,
  `IfI765Approved_NoOfDaysUnemployedAfterEAD` int(11) DEFAULT NULL,
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
  ADD KEY `CountryVisaTypeListId` (`CountryVisaTypeListId`);

--
-- Indexes for table `custfamilyinfo`
--
ALTER TABLE `custfamilyinfo`
  ADD PRIMARY KEY (`CustFamilyInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

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
-- Indexes for table `custpersonalinfo`
--
ALTER TABLE `custpersonalinfo`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
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
-- Indexes for table `custtravelinfo`
--
ALTER TABLE `custtravelinfo`
  ADD PRIMARY KEY (`CustTravelInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

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
-- Indexes for table `DS160MenuInfo`
--
ALTER TABLE `DS160MenuInfo`
  ADD PRIMARY KEY (`DS160MenuInfoId`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`EducationId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `employment`
--
ALTER TABLE `employment`
  ADD PRIMARY KEY (`EmploymentId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `internationtravel`
--
ALTER TABLE `internationtravel`
  ADD PRIMARY KEY (`InternationalTravelId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  ADD PRIMARY KEY (`OverseasPermanentAddressId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `personaldetail`
--
ALTER TABLE `personaldetail`
  ADD PRIMARY KEY (`PersonalDetailId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  ADD PRIMARY KEY (`USHomeAddressId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `visaapplication`
--
ALTER TABLE `visaapplication`
  ADD PRIMARY KEY (`VisaApplicationId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `visainformation`
--
ALTER TABLE `visainformation`
  ADD PRIMARY KEY (`VisaInformationId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apppercent`
--
ALTER TABLE `apppercent`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `countrylist`
--
ALTER TABLE `countrylist`
  MODIFY `CountryListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `countryvisatypelist`
--
ALTER TABLE `countryvisatypelist`
  MODIFY `CountryVisaTypeListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `custappinfo`
--
ALTER TABLE `custappinfo`
  MODIFY `CustAppInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `custfamilyinfo`
--
ALTER TABLE `custfamilyinfo`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custfamilyinfo1`
--
ALTER TABLE `custfamilyinfo1`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `custfamilyinfo2`
--
ALTER TABLE `custfamilyinfo2`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `custlocalinfo`
--
ALTER TABLE `custlocalinfo`
  MODIFY `CustLocalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `custpersonalinfo`
--
ALTER TABLE `custpersonalinfo`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `custpersonalinfo1`
--
ALTER TABLE `custpersonalinfo1`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `custpersonalinfo2`
--
ALTER TABLE `custpersonalinfo2`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `custpersonalinfo3`
--
ALTER TABLE `custpersonalinfo3`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `custpreparerappinfo`
--
ALTER TABLE `custpreparerappinfo`
  MODIFY `CustPrepareAppInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `custprofileinfo`
--
ALTER TABLE `custprofileinfo`
  MODIFY `CustProfileInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `custtravelinfo`
--
ALTER TABLE `custtravelinfo`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custtravelinfo1`
--
ALTER TABLE `custtravelinfo1`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `custtravelinfo2`
--
ALTER TABLE `custtravelinfo2`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `custuscontactinfo`
--
ALTER TABLE `custuscontactinfo`
  MODIFY `CustUSContactInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `custworkeducationtraininginfo`
--
ALTER TABLE `custworkeducationtraininginfo`
  MODIFY `CustWorkEducationTrainingInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `DS160MenuInfo`
--
ALTER TABLE `DS160MenuInfo`
  MODIFY `DS160MenuInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `EducationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employment`
--
ALTER TABLE `employment`
  MODIFY `EmploymentId` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `personaldetail`
--
ALTER TABLE `personaldetail`
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
-- AUTO_INCREMENT for table `visainformation`
--
ALTER TABLE `visainformation`
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
  ADD CONSTRAINT `custappinfo_ibfk_3` FOREIGN KEY (`CountryVisaTypeListId`) REFERENCES `countryvisatypelist` (`CountryVisaTypeListId`);

--
-- Constraints for table `custfamilyinfo`
--
ALTER TABLE `custfamilyinfo`
  ADD CONSTRAINT `custfamilyinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

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
-- Constraints for table `custpersonalinfo`
--
ALTER TABLE `custpersonalinfo`
  ADD CONSTRAINT `custpersonalinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

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
-- Constraints for table `custtravelinfo`
--
ALTER TABLE `custtravelinfo`
  ADD CONSTRAINT `custtravelinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

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
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `employment`
--
ALTER TABLE `employment`
  ADD CONSTRAINT `employment_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `internationtravel`
--
ALTER TABLE `internationtravel`
  ADD CONSTRAINT `internationtravel_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  ADD CONSTRAINT `overseaspermanentaddress_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `personaldetail`
--
ALTER TABLE `personaldetail`
  ADD CONSTRAINT `personaldetail_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  ADD CONSTRAINT `ushomeaddress_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `visaapplication`
--
ALTER TABLE `visaapplication`
  ADD CONSTRAINT `visaapplication_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `visainformation`
--
ALTER TABLE `visainformation`
  ADD CONSTRAINT `visainformation_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
