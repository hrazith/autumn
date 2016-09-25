CREATE TABLE `internationtravel` (
  `InternationalTravelId` int(11) NOT NULL auto_increment primary key,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `PossibilityOfInternationTravelIn6Months` varchar(50) DEFAULT NULL,
  `DateofIntendedDeparture` varchar(100) DEFAULT NULL,
  `ExpectedLengthOfTrip` varchar(200) DEFAULT NULL,
  `PurposeOfTripIncludingTravelersName` varchar(1000) DEFAULT NULL,
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;