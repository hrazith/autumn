DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE ` procGetProfileInfoWithAppPercentageCompleted`(IN `UserName` VARCHAR(255))
BEGIN

INSERT INTO apppercent
(CustAppInfoId,CustProfileInfoId,CountryListId,CountryVisaTypeListId)

SELECT CustAppInfoId,CustProfileInfoId,CountryListId,CountryVisaTypeListId
FROM custappinfo where CustprofileInfoId IN 
(SELECT CustprofileInfoId FROM custprofileinfo WHERE UserName = UserName);

SET @x = 1;
SET @cnt = (SELECT COUNT(*) FROM apppercent);

WHILE @x <= @cnt DO

SET @AppId = (Select CustAppInfoId FROM apppercent WHERE Id = @x);

SET @AppPercent = fnCalculateAppPercentageCompleted(@AppId);

UPDATE apppercent
SET AppPercentageCompleted = @AppPercent
WHERE CustAppInfoId = @AppId;
                            
SET @x = @x + 1;
END WHILE;

SELECT app.CustAppNumber AppNumber,
       CONCAT(cl.CountryName,' (',cl.CountryCode,')') CountryName,
       CONCAT(cvl.CountryVisaType,' (',cvl.CountryVisaTypeDescription,')') VisaTypeName,
       ap.AppPercentageCompleted,
       IF(app.Activated = '1','Yes','No') Active,
       IF(app.Completed = '1','Yes','No') Completed,
       IF(app.Submitted = '1','Yes','No') Submitted,
       app.CreatedOn AppCreationDate,
       app.ModifiedOn AppLastModificationDate
FROM custappinfo app 
INNER JOIN countrylist cl ON app.CountryListId = cl.CountryListId
INNER JOIN countryvisatypelist cvl ON app.CountryVisaTypeListId = cvl.CountryVisaTypeListId
INNER JOIN custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
INNER JOIN apppercent ap ON app.CustAppInfoId = ap.CustAppInfoId
WHERE cp.UserName = UserName;

TRUNCATE TABLE apppercent;

END$$
DELIMITER ;