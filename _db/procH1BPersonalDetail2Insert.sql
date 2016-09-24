DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BPersonalDetail2Insert`(IN `UserName` VARCHAR(200), IN `Nationality` VARCHAR(500), IN `PermanentResident_Immigrant` VARCHAR(500), IN `RecentCitizenship_PR_Immigrant` VARCHAR(500), IN `PassportNumber` VARCHAR(100), IN `PassportIssueDate` VARCHAR(100), IN `PassportExpirationDate` VARCHAR(100), IN `PassportIssuedCity` VARCHAR(200), IN `PassportIssuedState` VARCHAR(200), IN `PassportIssuedCountry` VARCHAR(200), IN `BlankPagesInPassport` VARCHAR(100))
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO personaldetail2
(CustProfileInfoId,Nationality,PermanentResident_Immigrant,RecentCitizenship_PR_Immigrant,PassportNumber,PassportIssueDate,
PassportExpirationDate,PassportIssuedCity,PassportIssuedState,PassportIssuedCountry,BlankPagesInPassport
)
VALUES
(ProfileId,Nationality,PermanentResident_Immigrant,RecentCitizenship_PR_Immigrant,PassportNumber,PassportIssueDate,
PassportExpirationDate,PassportIssuedCity,PassportIssuedState,PassportIssuedCountry,BlankPagesInPassport);

END$$
DELIMITER ;