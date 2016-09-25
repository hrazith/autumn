DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BPersonalDetail2Insert`(IN `AppId` INT, IN `Nationality` VARCHAR(500), IN `PermanentResident_Immigrant` VARCHAR(500), IN `RecentCitizenship_PR_Immigrant` VARCHAR(500), IN `PassportNumber` VARCHAR(100), IN `PassportIssueDate` VARCHAR(100), IN `PassportExpirationDate` VARCHAR(100), IN `PassportIssuedCity` VARCHAR(200), IN `PassportIssuedState` VARCHAR(200), IN `PassportIssuedCountry` VARCHAR(200), IN `BlankPagesInPassport` VARCHAR(100))
BEGIN


INSERT INTO personaldetail2
(CustAppInfoId,Nationality,PermanentResident_Immigrant,RecentCitizenship_PR_Immigrant,PassportNumber,PassportIssueDate,
PassportExpirationDate,PassportIssuedCity,PassportIssuedState,PassportIssuedCountry,BlankPagesInPassport
)
VALUES
(AppId,Nationality,PermanentResident_Immigrant,RecentCitizenship_PR_Immigrant,PassportNumber,PassportIssueDate,
PassportExpirationDate,PassportIssuedCity,PassportIssuedState,PassportIssuedCountry,BlankPagesInPassport);

END$$
DELIMITER ;