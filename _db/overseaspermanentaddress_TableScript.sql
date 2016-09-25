CREATE TABLE `overseaspermanentaddress` (
  `OverseasPermanentAddressId` int(11) NOT NULL auto_increment primary key,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `OverseasPermanentAddressDateFrom` varchar(100) DEFAULT NULL,
  `OverseasPermanentAddressDateTo` varchar(100) DEFAULT NULL,
  `StreetAddress` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(500) DEFAULT NULL,
  `StateProvinceRegion` varchar(500) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `PlanOfChangingPlaceOfResidenceInNext4Months` varchar(50) DEFAULT NULL,
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;