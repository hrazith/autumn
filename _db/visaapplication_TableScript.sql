CREATE TABLE `visaapplication` (
  `VisaApplicationId` int(11) NOT NULL auto_increment primary key,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `ResidingOutsideUS` varchar(50) DEFAULT NULL,
  `USConsulateLocationOutsideUS` varchar(500) DEFAULT NULL,
  `AppliedNonImmigrantUSVisa` varchar(50) DEFAULT NULL,
  `VisaCancelledDeniedRejected` varchar(50) DEFAULT NULL,
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

