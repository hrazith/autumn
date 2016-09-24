CREATE TABLE EventLog 
(
   EventlogId INT NOT NULL auto_increment primary key,
   CustProfileInfoId INT NOT NULL,
   EventType VARCHAR(200),
   EventDescription VARCHAR(8000),
   EventLogDate DATETIME,
   Foreign key (CustProfileInfoId) references CustProfileInfo(CustProfileInfoId)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;