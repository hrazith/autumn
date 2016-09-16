DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCountryList`()
BEGIN

 SELECT CountryName,CountryCode FROM countrylist;
 
 END$$
DELIMITER ;