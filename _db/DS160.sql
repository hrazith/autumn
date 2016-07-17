 CREATE TABLE CountryList
 (
	 CountryListId INT NOT NULL auto_increment primary key,
	 CountryName VARCHAR(500)
 )
 

 
 CREATE TABLE CountryVisaTypeList
 (
	 CountryVisaTypeListId INT NOT NULL auto_increment primary key,
	 CountryListId INT NOT NULL ,
	 CountryVisaTypeListName VARCHAR(500),
	 Foreign key (CountryListId) references CountryList(CountryListId)
 )
 
 -- //signup details

CREATE TABLE CustProfileInfo
 (
  CustProfileInfoId INT NOT NULL auto_increment primary key,
  UserName VARCHAR(200) NOT NULL,
  FirstName VARCHAR(200) NOT NULL,
  LastName VARCHAR(200) NOT NULL,
  EmailAddress VARCHAR(500) NOT NULL,
  Password VARCHAR(500) NOT NULL,
  DateOfBirth VARCHAR(100) NOT NULL

  )


-- //application info

CREATE TABLE CustAppInfo
(
	CustAppInfoId INT NOT NULL auto_increment primary key,
	CustProfileInfoId INT NOT NULL,
	CountryListId INT NOT NULL,
	CountryVisaTypeListId INT NOT NULL,
	CustAppNumber VARCHAR(200),
	Foreign key (CustProfileInfoId) references CustProfileInfo(CustProfileInfoId)
)


 
 CREATE TABLE CustPersonalInfo
 (
	  CustPersonalInfoId INT NOT NULL auto_increment primary key,
	  CustAppInfoId INT NOT NULL,
      First_Name VARCHAR(500),
      Last_Name VARCHAR(500),
	  Full_Name_In_Native_Language VARCHAR(500),
	  Other_Name_Used VARCHAR(50),
	  Other_Name_1 VARCHAR(500),
	  Other_Name_2 VARCHAR(500),
	  Other_Name_3 VARCHAR(500),
	  Sex VARCHAR(50),
	  Marital_Status VARCHAR(50),
	  Date_Of_Birth VARCHAR(100),
	  City_Of_Birth VARCHAR(500),
	  State_Of_Birth VARCHAR(500),
	  Nationality VARCHAR(500),
	  Other_Nationalities VARCHAR(500),
	  National_Identification_Number VARCHAR(100),
	  US_Social_Security_Number VARCHAR(100),
	  US_Taxpayer_ID_Number VARCHAR(100),
	  Home_Address VARCHAR(500),
	  City VARCHAR(200),
	  State_Province VARCHAR(200),
	  PostalZone_ZIPCode INT,
	  Country VARCHAR(500),
	  Same_Mailing_Address VARCHAR(50),
	  Mailing_Home_Address VARCHAR(500),
	  Mailing_City VARCHAR(200),
	  Mailing_State_Province VARCHAR(200),
	  Mailing_PostalZone_ZIPCode INT,
	  Mailing_Country VARCHAR(500),
	  Home_Phone_Number VARCHAR(50),
	  Work_Phone_Number VARCHAR(50),
	  Work_Fax_Number VARCHAR(50),
	  Mobile_Cell_Phone_Number VARCHAR(50),
	  Email_Address VARCHAR(500),
	  Passport_Number VARCHAR(100),
	  Passport_Book_Number VARCHAR(100),
	  Country_Authority_Issued_Passport VARCHAR(500),
	  City_Issued_Passport VARCHAR(200),
	  State_Province_Issued_Passport VARCHAR(200),
	  Country_Issued_Passport VARCHAR(200),
	  Issuance_Date_Passport VARCHAR(100),
	  Expiration_Date_Passport VARCHAR(100),
	  Passport_Stolen_Lost VARCHAR(50),
	  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
 )
 
 
 
 CREATE TABLE CustTravelInfo
 (
	  CustTravelInfoId INT NOT NULL auto_increment primary key,
	  CustAppInfoId INT NOT NULL,
	  Principal_Applicant VARCHAR(50),
	  Trip_Purpose_1 VARCHAR(500),
	  Trip_Purpose_2 VARCHAR(500),
	  Trip_Purpose_3 VARCHAR(500),
	  Trip_Purpose_4 VARCHAR(500),
	  Intended_Date_Of_Arrival VARCHAR(100),
	  Intended_Length_Of_Stay_US VARCHAR(100),
	  Address_of_US_Stay VARCHAR(500),
	  Person_Entity_Paying_US_Trip VARCHAR(200),
	  Telephone VARCHAR(50),
	  Email_Address VARCHAR(500),
	  Relationship_To_You VARCHAR(100),
	  PayingPartyTripAddress_SameAsHomeMailingAddress VARCHAR(50),
	  PartyPayingAddress VARCHAR(500),
	  PartyPayingCity VARCHAR(200),
	  PartyPayingState_Province VARCHAR(200),
	  PostalZone_ZIPcode INT,
	  Country VARCHAR(500),
	  OtherPersonTravellingWithYou VARCHAR(100),
	  TravellingPartofGroup_Organizantion VARCHAR(100),
	  PersonTravellingWithYou_Name_1 VARCHAR(200),
	  PersonTravellingWithYou_Name_2 VARCHAR(200),
	  PersonTravellingWithYou_Name_3 VARCHAR(200),
	  PersonTravellingWithYou_Name_4 VARCHAR(200),
	  PersonTravellingWithYou_Name_5 VARCHAR(200),
	  PersonTravellingWithYou_Relationship_1 VARCHAR(200),
	  PersonTravellingWithYou_Relationship_2 VARCHAR(200),
	  PersonTravellingWithYou_Relationship_3 VARCHAR(200),
	  PersonTravellingWithYou_Relationship_4 VARCHAR(200),
	  PersonTravellingWithYou_Relationship_5 VARCHAR(200),
	  EverBeenToUS VARCHAR(50),
	  EverBeenIssuedUSVisa VARCHAR(50),
	  EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication VARCHAR(50),
	  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
 )
 
 
 
 
 
 CREATE TABLE CustUSContactInfo 
 (
	  CustUSContactInfoId INT NOT NULL auto_increment primary key,
	  CustAppInfoId INT NOT NULL,
	  ContactPersonNameInUS VARCHAR(200),
	  OrganizationNameInUS VARCHAR(200),
	  Relationship VARCHAR(200),
	  ContactAddressUS VARCHAR(500),
	  Phone_Number VARCHAR(50),
	  Email_Address VARCHAR(50),
	  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
 )
 
 
 
 
 
 CREATE TABLE CustFamilyInfo
 (
	  CustFamilyInfoId INT NOT NULL auto_increment primary key,
	  CustAppInfoId INT NOT NULL,
	  FatherSurname VARCHAR(200),
	  FatherGivenName VARCHAR(200),
	  FatherDateofBirth VARCHAR(100),
	  IsYourFatherInUS VARCHAR(50),
	  MotherSurname VARCHAR(200),
	  MotherGivenName VARCHAR(200),
	  IsYourMotherInUS VARCHAR(50),
	  ImmediateRelativesInUS_ApartFatherMother VARCHAR(50),
	  Relative_Name_1 VARCHAR(200),
	  Relationship_To_Relative_1 VARCHAR(200),
	  Relative_Status_1 VARCHAR(100),
	  Relative_Name_2 VARCHAR(200),
	  Relationship_To_Relative_2 VARCHAR(200),
	  Relative_Status_2 VARCHAR(100),
	  Relative_Name_3 VARCHAR(200),
	  Relationship_To_Relative_3 VARCHAR(200),
	  Relative_Status_3 VARCHAR(100),
	  Relative_Name_4 VARCHAR(200),
	  Relationship_To_Relative_4 VARCHAR(200),
	  Relative_Status_4 VARCHAR(100),
	  Spouse_FullName VARCHAR(200),
	  Spouse_DateOfBirth VARCHAR(100),
	  Spouse_Nationality VARCHAR(200),
	  Spouse_CityOfBirth VARCHAR(200),
	  Spouse_CountryOfBirth VARCHAR(200),
	  Spouse_Address VARCHAR(500),
	  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
 )
 
 
 ---------------------------------------------------------------------------------------------------
 
 
 CREATE TABLE CustWorkEducationTrainingInfo
 (
	  CustWorkEducationTrainingInfoId INT NOT NULL auto_increment primary key,
	  CustAppInfoId INT NOT NULL,
	  Primary_Occupation VARCHAR(200),
	  PresentEmployer_SchoolName VARCHAR(200),
	  Address VARCHAR(500),
	  City VARCHAR(200),
	  State_Province VARCHAR(200),
	  PostalZone_ZipCode INT,
	  Country VARCHAR(200),
	  MonthSalary_LocalCurrency VARCHAR(100),
	  BrifelyDescribeYourDuties VARCHAR(500),
	  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)

 )
 
 -- Local info
 
 CREATE TABLE CustLocalInfo
 (
	  CustLocalInfoId INT NOT NULL auto_increment primary key,
	  CustAppInfoId INT NOT NULL,
	  CurrentLocation VARCHAR(500),
	  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
 )
 
 
 
 
 CREATE TABLE CustPreparerAppInfo
 (
  CustPreparerAppInfoId INT NOT NULL auto_increment primary key,
  CustAppInfoId INT NOT NULL,
  AnyoneAssistInFillingApplication VARCHAR(50),
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
 )
 
 $sql = "INSERT INTO CustProfileInfo (UserName, FirstName, LastName, EmailAddress, Password, DateOfBirth)
            VALUES ('$_POST[username]','$_POST[firstname]','$_POST[lastname]','$_POST[email]','$_POST[pass]'),'$_POST[dob]'";
 