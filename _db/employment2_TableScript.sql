CREATE TABLE `employment2` (
  `EmploymentId` int(11) NOT NULL auto_increment primary key,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `SupervisorName` varchar(500) DEFAULT NULL,
  `SupervisorPhoneNumber` varchar(100) DEFAULT NULL,
  `SuperVisorJobTitle` varchar(200) DEFAULT NULL,
  `AnyInterruptionsInEmploymentWithEmployer` varchar(50) DEFAULT NULL,
  `WorkingOutsideTheUS` varchar(50) DEFAULT NULL,
  `IfWorkingOutsideDoesItInvolveSupervision` varchar(50) DEFAULT NULL,
  Foreign key (CustProfileInfoId) references CustProfileInfo(CustProfileInfoId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
