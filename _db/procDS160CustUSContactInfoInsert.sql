DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustUSContactInfoInsert`(IN AppNumberId INT, 
                                                   IN ContactPersonNameInUS VARCHAR(200), 
                                                   IN OrganizationNameInU VARCHAR(200), 
                                                   IN Relationship VARCHAR(200), 
                                                   IN ContactAddressUS VARCHAR(500), 
                                                   IN Phone_Number VARCHAR(50), 
                                                   IN Contact_Email_Address VARCHAR(50))
BEGIN

INSERT INTO custuscontactinfo
(CustAppInfoId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Email_Address)
VALUES
(AppNumberId,ContactPersonNameInUS,OrganizationNameInUS,Relationship,ContactAddressUS,Phone_Number,Contact_Email_Address);

END$$
DELIMITER ;