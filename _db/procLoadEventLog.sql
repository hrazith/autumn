DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadEventLog`(IN UserName VARCHAR(200))
BEGIN

SELECT EventType,EventDescription FROM eventlog
WHERE CustProfileInfoId IN (SELECT CustProfileInfoId FROM custprofileinfo WHERE UserName = 'hrazith');

END$$
DELIMITER ;