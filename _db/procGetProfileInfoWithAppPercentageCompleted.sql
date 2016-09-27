DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE ` procGetProfileInfoWithAppPercentageCompleted`(IN `UserName` VARCHAR(255))
BEGIN

DECLARE ProfileId INT;
SET ProfileId = (SELECT CustprofileInfoId FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO apppercent
(CustAppInfoId,CustProfileInfoId,CountryListId,
 CountryVisaTypeListId,FormId)

SELECT CustAppInfoId,CustProfileInfoId,CountryListId,
CountryVisaTypeListId,FormId
FROM custappinfo where CustprofileInfoId = ProfileId;

SET @x = 1;
SET @cnt = (SELECT COUNT(*) FROM apppercent WHERE FormId = 1);
SET @cnt1 = (SELECT COUNT(*) + @cnt FROM apppercent WHERE FormId = 2);

WHILE @x <= @cnt DO

SET @AppId = (Select CustAppInfoId FROM apppercent WHERE Id = @x);

SET @AppPercent = fnCalculateAppPercentageCompleted(@AppId);

UPDATE apppercent
SET AppPercentageCompleted = @AppPercent
WHERE CustAppInfoId = @AppId;
                            
SET @x = @x + 1;
END WHILE;

WHILE @x <= @cnt1 DO

SET @AppId = (Select CustAppInfoId FROM apppercent WHERE Id = @x);

SET @AppPercent = fnCalculateH1bAppPercentageCompleted(@AppId);

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
       app.ModifiedOn AppLastModificationDate,
       f.FormType
FROM custappinfo app 
INNER JOIN countrylist cl ON app.CountryListId = cl.CountryListId
INNER JOIN countryvisatypelist cvl ON app.CountryVisaTypeListId = cvl.CountryVisaTypeListId
INNER JOIN custprofileinfo cp ON app.CustProfileInfoId = cp.CustProfileInfoId
INNER JOIN form f ON app.FormId = f.FormId
INNER JOIN apppercent ap ON app.CustAppInfoId = ap.CustAppInfoId
WHERE cp.UserName = UserName;


TRUNCATE TABLE apppercent;

END$$
DELIMITER ;