CREATE TABLE `custtravelinfo1` (
  `CustTravelInfoId` INT NOT NULL auto_increment primary key,
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
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `custtravelinfo2` (
  `CustTravelInfoId` INT NOT NULL auto_increment primary key,
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
  `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` varchar(50) DEFAULT NULL,
   Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `custfamilyinfo1` (
  `CustFamilyInfoId` INT NOT NULL auto_increment primary key,
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
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `custfamilyinfo2` (
  `CustFamilyInfoId` INT NOT NULL auto_increment primary key,
  `CustAppInfoId` int(11) NOT NULL,
  `Relative_Name_4` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_4` varchar(200) DEFAULT NULL,
  `Relative_Status_4` varchar(100) DEFAULT NULL,
  `Spouse_FullName` varchar(200) DEFAULT NULL,
  `Spouse_DateOfBirth` varchar(100) DEFAULT NULL,
  `Spouse_Nationality` varchar(200) DEFAULT NULL,
  `Spouse_CityOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_CountryOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_Address` varchar(500) DEFAULT NULL,
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;










