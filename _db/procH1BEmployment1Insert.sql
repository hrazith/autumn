DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BEmployment1Insert`(IN UserName VARCHAR(200),
    									   IN EmploymentType VARCHAR(100),
                                           IN EmploymentDateFrom VARCHAR(100),
                                           IN EmploymentDateTo VARCHAR(100),
                                           IN StreetAddress VARCHAR(500),
                                           IN Address2 VARCHAR(500),
                                           IN City VARCHAR(500),
                                           IN StateProvinceRegion VARCHAR(500),
                                           IN ZipCode VARCHAR(50),
                                           IN Country VARCHAR(500),
                                           IN EmployerIsUniversityOrNonProfit VARCHAR(50),
                                           IN TypeOfBusiness VARCHAR(500),
                                           IN HoursPerWeek VARCHAR(50),
                                           IN IsPositionPartTime VARCHAR(50),
                                           IN JobTitle VARCHAR(200),
                                           IN CurrentAnnualBaseSalary VARCHAR(100),
                                           IN DetailJobDuties VARCHAR(8000),
                                           IN TechnologiesUsed VARCHAR(8000))
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO employment1
(CustProfileInfoId,EmploymentType,EmploymentDateFrom,EmploymentDateTo,StreetAddress,Address2,City,StateProvinceRegion,
ZipCode,Country,EmployerIsUniversityOrNonProfit,TypeOfBusiness,HoursPerWeek,IsPositionPartTime,JobTitle,
CurrentAnnualBaseSalary,DetailJobDuties,TechnologiesUsed
)
VALUES
(ProfileId,EmploymentType,EmploymentDateFrom,EmploymentDateTo,StreetAddress,Address2,City,StateProvinceRegion,
ZipCode,Country,EmployerIsUniversityOrNonProfit,TypeOfBusiness,HoursPerWeek,IsPositionPartTime,JobTitle,
CurrentAnnualBaseSalary,DetailJobDuties,TechnologiesUsed);

END$$
DELIMITER ;