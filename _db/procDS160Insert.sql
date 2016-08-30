CREATE PROCEDURE procDS160Insert (IN AppNumberId INT,
      IN First_Name VARCHAR(500),
      IN Last_Name VARCHAR(500),
	  IN Full_Name_In_Native_Language VARCHAR(500),
	  IN Other_Name_Used VARCHAR(50),
	  IN Other_Name_1 VARCHAR(500),
	  IN Other_Name_2 VARCHAR(500),
	  IN Other_Name_3 VARCHAR(500),
	  IN Sex VARCHAR(50),
	  IN Marital_Status VARCHAR(50),
	  IN Date_Of_Birth VARCHAR(100),
	  IN City_Of_Birth VARCHAR(500),
	  IN State_Of_Birth VARCHAR(500),
	  IN Nationality VARCHAR(500),
	  IN Other_Nationalities VARCHAR(500),
	  IN National_Identification_Number VARCHAR(100),
	  IN US_Social_Security_Number VARCHAR(100),
	  IN US_Taxpayer_ID_Number VARCHAR(100),
	  IN Home_Address VARCHAR(500),
	  IN City VARCHAR(200),
	  IN State_Province VARCHAR(200),
	  IN PostalZone_ZIPCode INT,
	  IN Country VARCHAR(500),
	  IN Same_Mailing_Address VARCHAR(50),
	  IN Mailing_Home_Address VARCHAR(500),
	  IN Mailing_City VARCHAR(200),
	  IN Mailing_State_Province VARCHAR(200),
	  IN Mailing_PostalZone_ZIPCode INT,
	  IN Mailing_Country VARCHAR(500),
	  IN Home_Phone_Number VARCHAR(50),
	  IN Work_Phone_Number VARCHAR(50),
	  IN Work_Fax_Number VARCHAR(50),
	  IN Mobile_Cell_Phone_Number VARCHAR(50),
	  IN Email_Address VARCHAR(500),
	  IN Passport_Number VARCHAR(100),
	  IN Passport_Book_Number VARCHAR(100),
	  IN Country_Authority_Issued_Passport VARCHAR(500),
	  IN City_Issued_Passport VARCHAR(200),
	  IN State_Province_Issued_Passport VARCHAR(200),
	  IN Country_Issued_Passport VARCHAR(200),
	  IN Issuance_Date_Passport VARCHAR(100),
	  IN Expiration_Date_Passport VARCHAR(100),
	  IN Passport_Stolen_Lost VARCHAR(50),
      IN Principal_Applicant VARCHAR(50),
	  IN Trip_Purpose_1 VARCHAR(500),
	  IN Trip_Purpose_2 VARCHAR(500),
	  IN Trip_Purpose_3 VARCHAR(500),
	  IN Trip_Purpose_4 VARCHAR(500),
	  IN Intended_Date_Of_Arrival VARCHAR(100),
	  IN Intended_Length_Of_Stay_US VARCHAR(100),
	  IN Address_of_US_Stay VARCHAR(500),
	  IN Person_Entity_Paying_US_Trip VARCHAR(200),
	  IN Telephone VARCHAR(50),
	  IN Travel_Email_Address VARCHAR(500),
	  IN Relationship_To_You VARCHAR(100),
	  IN PayingPartyTripAddress_SameAsHomeMailingAddress VARCHAR(50),
	  IN PartyPayingAddress VARCHAR(500),
	  IN PartyPayingCity VARCHAR(200),
	  IN PartyPayingState_Province VARCHAR(200),
	  IN Travel_PostalZone_ZIPcode INT,
	  IN Travel_Country VARCHAR(500),
	  IN OtherPersonTravellingWithYou VARCHAR(100),
	  IN TravellingPartofGroup_Organizantion VARCHAR(100),
	  IN PersonTravellingWithYou_Name_1 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_2 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_3 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_4 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_5 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_1 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_2 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_3 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_4 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_5 VARCHAR(200),
	  IN EverBeenToUS VARCHAR(50),
	  IN EverBeenIssuedUSVisa VARCHAR(50),
	  IN EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication VARCHAR(50),
      IN ContactPersonNameInUS VARCHAR(200),
	  IN OrganizationNameInUS VARCHAR(200),
	  IN Relationship VARCHAR(200),
	  IN ContactAddressUS VARCHAR(500),
	  IN Phone_Number VARCHAR(50),
	  IN Contact_Email_Address VARCHAR(50),
      IN FatherSurname VARCHAR(200),
	  IN FatherGivenName VARCHAR(200),
	  IN FatherDateofBirth VARCHAR(100),
	  IN IsYourFatherInUS VARCHAR(50),
	  IN MotherSurname VARCHAR(200),
	  IN MotherGivenName VARCHAR(200),
	  IN IsYourMotherInUS VARCHAR(50),
	  IN ImmediateRelativesInUS_ApartFatherMother VARCHAR(50),
	  IN Relative_Name_1 VARCHAR(200),
	  IN Relationship_To_Relative_1 VARCHAR(200),
	  IN Relative_Status_1 VARCHAR(100),
	  IN Relative_Name_2 VARCHAR(200),
	  IN Relationship_To_Relative_2 VARCHAR(200),
	  IN Relative_Status_2 VARCHAR(100),
	  IN Relative_Name_3 VARCHAR(200),
	  IN Relationship_To_Relative_3 VARCHAR(200),
	  IN Relative_Status_3 VARCHAR(100),
	  IN Relative_Name_4 VARCHAR(200),
	  IN Relationship_To_Relative_4 VARCHAR(200),
	  IN Relative_Status_4 VARCHAR(100),
	  IN Spouse_FullName VARCHAR(200),
	  IN Spouse_DateOfBirth VARCHAR(100),
	  IN Spouse_Nationality VARCHAR(200),
	  IN Spouse_CityOfBirth VARCHAR(200),
	  IN Spouse_CountryOfBirth VARCHAR(200),
	  IN Spouse_Address VARCHAR(500),
      IN Primary_Occupation VARCHAR(200),
	  IN PresentEmployer_SchoolName VARCHAR(200),
	  IN Address VARCHAR(500),
	  IN Work_City VARCHAR(200),
	  IN Work_State_Province VARCHAR(200),
	  IN Work_PostalZone_ZipCode INT,
	  IN Work_Country VARCHAR(200),
	  IN MonthSalary_LocalCurrency VARCHAR(100),
	  IN BrifelyDescribeYourDuties VARCHAR(500),
      IN CurrentLocation VARCHAR(500),
      IN AnyoneAssistInFillingApplication VARCHAR(50))

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


END