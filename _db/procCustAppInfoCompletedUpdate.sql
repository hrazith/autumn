DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoCompletedUpdate`(IN `AppNumber` VARCHAR(200))
BEGIN

DECLARE AppNumberId INT;

SET AppNumberId = (SELECT CustAppInfoId FROM custappinfo 
                   WHERE CustAppNumber = AppNumber LIMIT 1);
                   
UPDATE custappinfo
SET Completed = 1
WHERE CustAppInfoId = AppNumberId;

END$$
DELIMITER ;