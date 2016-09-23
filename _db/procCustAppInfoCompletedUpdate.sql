DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoCompletedUpdate`(IN AppNumberId INT)
BEGIN

UPDATE custappinfo
SET Completed = 1
WHERE CustAppInfoId = AppNumberId;


END$$
DELIMITER ;