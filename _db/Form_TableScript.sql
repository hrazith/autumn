CREATE TABLE Form 
(
    FormId int(11) NOT NULL auto_increment primary key,
    FormType varchar(200) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;



ALTER TABLE custappinfo
ADD FormId INT AFTER CustProfileInfoId;


ALTER TABLE custappinfo
ADD FOREIGN KEY (FormId) REFERENCES Form (FormId);