DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BEmployment2Insert`(IN `AppId` INT, IN `SupervisorName` VARCHAR(500), IN `SupervisorPhoneNumber` VARCHAR(100), IN `SuperVisorJobTitle` VARCHAR(200), IN `AnyInterruptionsInEmploymentWithEmployer` VARCHAR(50), IN `WorkingOutsideTheUS` VARCHAR(50), IN `IfWorkingOutsideDoesItInvolveSupervision` VARCHAR(50))
BEGIN


INSERT INTO employment2
(CustAppInfoId,SupervisorName,SupervisorPhoneNumber,SuperVisorJobTitle,AnyInterruptionsInEmploymentWithEmployer,
WorkingOutsideTheUS,IfWorkingOutsideDoesItInvolveSupervision
)
VALUES
(AppId,SupervisorName,SupervisorPhoneNumber,SuperVisorJobTitle,AnyInterruptionsInEmploymentWithEmployer,
WorkingOutsideTheUS,IfWorkingOutsideDoesItInvolveSupervision);

END$$
DELIMITER ;