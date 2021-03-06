CREATE TABLE `ushomeaddress` (
  `USHomeAddressId` int(11) NOT NULL auto_increment primary key,
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
  `IfYesMovingDateAndNewAddress` varchar(2000) DEFAULT NULL,
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
