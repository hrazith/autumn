DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CusLocalInfoInsert`(IN `AppNumberId` INT,
                                             IN `CurrentLocation` VARCHAR(500))
BEGIN

INSERT INTO custlocalinfo
(CustAppInfoId,CurrentLocation)
VALUES
(AppNumberId,CurrentLocation);

END$$
DELIMITER ;