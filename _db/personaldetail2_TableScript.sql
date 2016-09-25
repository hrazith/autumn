CREATE TABLE `personaldetail2` (
  `PersonalDetailId` int(11) NOT NULL auto_increment primary key,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `Nationality` varchar(500) DEFAULT NULL,
  `PermanentResident_Immigrant` varchar(500) DEFAULT NULL,
  `RecentCitizenship_PR_Immigrant` varchar(500) DEFAULT NULL,
  `PassportNumber` varchar(100) DEFAULT NULL,
  `PassportIssueDate` varchar(100) DEFAULT NULL,
  `PassportExpirationDate` varchar(100) DEFAULT NULL,
  `PassportIssuedCity` varchar(200) DEFAULT NULL,
  `PassportIssuedState` varchar(200) DEFAULT NULL,
  `PassportIssuedCountry` varchar(200) DEFAULT NULL,
  `BlankPagesInPassport` varchar(100) DEFAULT NULL,
   Foreign key (CustAppInfoId) references CustAppInfo(CustAppInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
