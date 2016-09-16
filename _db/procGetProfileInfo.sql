DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetProfileInfo`(IN `UserName` VARCHAR(200))
BEGIN

SELECT app.CustAppNumber AppNumber,
       CONCAT(cl.CountryName,' (',cl.CountryCode,')') CountryName,
       CONCAT(cvl.CountryVisaType,' (',cvl.CountryVisaTypeDescription,')') VisaTypeName,
       IF(app.Activated = '1','Yes','No') Active,
       IF(app.Completed = '1','Yes','No') Completed,
       IF(app.Submitted = '1','Yes','No') Submitted,
       app.CreatedOn AppCreationDate,
       app.ModifiedOn AppLastModificationDate
FROM custappinfo app 
INNER JOIN countrylist cl ON app.CountryListId = cl.CountryListId
INNER JOIN countryvisatypelist cvl ON app.CountryVisaTypeListId = cvl.CountryVisaTypeListId
INNER JOIN custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
WHERE cp.UserName = UserName;

END$$
DELIMITER ;