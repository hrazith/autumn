DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetProfileInfoWithAppPercentageCompleted`(IN `ProfileId` INT, IN `CountryId` INT, IN `VisaTypeId` INT, IN `UserName` VARCHAR(20))
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


SET @ApplicationPercentageCompletion = (@EffectiveColumnFilled*100)/@TotalColumnCount;


SELECT app.CustAppNumber AppNumber,
       CONCAT(cl.CountryName,' (',cl.CountryCode,')') CountryName,
       CONCAT(cvl.CountryVisaType,' (',cvl.CountryVisaTypeDescription,')') VisaTypeName,
       @ApplicationPercentageCompletion AppPercentageCompleted,
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
DELIMITER ;