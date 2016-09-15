DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetAppId`(IN AppNumber VARCHAR(200))
BEGIN

SELECT CustAppInfoId FROM custappinfo
WHERE CustAppNumber = AppNumber;


END$$
DELIMITER ;