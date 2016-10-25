DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPreparerappInfoUpdate`(IN `AppNumberId` INT,
                                                    IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

 UPDATE custpreparerappinfo
 SET AnyoneAssistInFillingApplication = AnyoneAssistInFillingApplication
 WHERE CustAppInfoId = AppNumberId;

END$$
DELIMITER ;