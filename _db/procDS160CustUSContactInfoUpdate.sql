DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactInfoUpdate`(IN AppNumberId INT, 
                                                   IN ContactPersonNameInUS VARCHAR(200), 
                                                   IN OrganizationNameInU VARCHAR(200), 
                                                   IN Relationship VARCHAR(200), 
                                                   IN ContactAddressUS VARCHAR(500), 
                                                   IN Phone_Number VARCHAR(50), 
                                                   IN Email_Address VARCHAR(50))
BEGIN

 UPDATE custuscontactinfo
 SET ContactPersonNameInUS = ContactPersonNameInUS,
 OrganizationNameInUS = OrganizationNameInUS,
 Relationship = Relationship,
 ContactAddressUS = ContactAddressUS,
 Phone_Number = Phone_Number,
 Email_Address = Email_Address
 WHERE CustAppInfoId = AppNumberId;

END$$
DELIMITER ;