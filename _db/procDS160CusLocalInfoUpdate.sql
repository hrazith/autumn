DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CusLocalInfoUpdate`(IN `AppNumberId` INT,
                                             IN `CurrentLocation` VARCHAR(500))
BEGIN

 UPDATE custlocalinfo
 SET CurrentLocation = CurrentLocation
 WHERE CustAppInfoId = AppNumberId;

END$$
DELIMITER ;