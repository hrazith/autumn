DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procEventLogInsert`(IN `Username` VARCHAR(200), IN `EventType` VARCHAR(200), IN `EventDescription` VARCHAR(8000), IN `EventLogDate` DATETIME)
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO eventlog
(CustProfileInfoId,EventType,EventDescription,EventLogDate)
VALUES
(ProfileId,EventType,EventDescription,EventLogDate);

END$$
DELIMITER ;