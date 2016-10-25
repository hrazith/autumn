DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustPreparerappInfoInsert`(IN `AppNumberId` INT,
                                                    IN `AnyoneAssistInFillingApplication` VARCHAR(50))
BEGIN

INSERT INTO custpreparerappinfo
(CustAppInfoId,AnyoneAssistInFillingApplication)
VALUES
(AppNumberId,AnyoneAssistInFillingApplication);

END$$
DELIMITER ;