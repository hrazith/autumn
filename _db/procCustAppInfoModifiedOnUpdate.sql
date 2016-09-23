DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoModifiedOnUpdate`(IN AppNumberId INT,
                                                 IN ModifiedOn DATETIME)
BEGIN

UPDATE custappinfo
SET ModifiedOn = ModifiedOn
WHERE CustAppInfoId = AppNumberId;

END$$
DELIMITER ;