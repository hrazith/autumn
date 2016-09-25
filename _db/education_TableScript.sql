CREATE TABLE `education` (
  `EducationId` int(11) NOT NULL auto_increment primary key,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `InstitutionFullName` varchar(500) DEFAULT NULL,
  `InstitutionType` varchar(500) DEFAULT NULL,
  `InstitutionAccreditationStatus` varchar(500) DEFAULT NULL,
  `DateAttendedFrom` varchar(100) DEFAULT NULL,
  `DateAttendedTo` varchar(100) DEFAULT NULL,
  `MajorOrFieldOfStudy` varchar(500) DEFAULT NULL,
  `DegreeReceived` varchar(200) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;