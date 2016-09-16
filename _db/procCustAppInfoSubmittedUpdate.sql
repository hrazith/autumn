DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustAppInfoSubmittedUpdate`(IN AppNumberId INT)
BEGIN

UPDATE custappinfo
SET Submitted = 1
WHERE CustAppInfoId = AppNumberId;

END$$
DELIMITER ;