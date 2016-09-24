DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BEmployment2Insert`(IN UserName VARCHAR(200),
    									   IN SupervisorName VARCHAR(500),
                                           IN SupervisorPhoneNumber VARCHAR(100),
                                           IN SuperVisorJobTitle VARCHAR(200),
                                           IN AnyInterruptionsInEmploymentWithEmployer VARCHAR(50),
                                           IN WorkingOutsideTheUS VARCHAR(50),
                                           IN IfWorkingOutsideDoesItInvolveSupervision VARCHAR(50))
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO employment2
(CustProfileInfoId,SupervisorName,SupervisorPhoneNumber,SuperVisorJobTitle,AnyInterruptionsInEmploymentWithEmployer,
WorkingOutsideTheUS,IfWorkingOutsideDoesItInvolveSupervision
)
VALUES
(ProfileId,SupervisorName,SupervisorPhoneNumber,SuperVisorJobTitle,AnyInterruptionsInEmploymentWithEmployer,
WorkingOutsideTheUS,IfWorkingOutsideDoesItInvolveSupervision);

END$$
DELIMITER ;