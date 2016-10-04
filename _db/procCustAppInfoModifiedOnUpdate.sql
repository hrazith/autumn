DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoModifiedOnUpdate`(IN `AppNumber` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);

UPDATE custappinfo
SET ModifiedOn = NOW()
WHERE CustAppInfoId = AppNumberId;

END$$
DELIMITER ;