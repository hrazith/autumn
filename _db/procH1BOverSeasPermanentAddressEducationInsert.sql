DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BOverSeasPermanentAddressEducationInsert`(IN `UserName` VARCHAR(200), IN `OverseasPermanentAddressDateFrom` VARCHAR(100), IN `OverseasPermanentAddressDateTo` VARCHAR(100), IN `StreetAddress` VARCHAR(500), IN `Address2` VARCHAR(500), IN `City` VARCHAR(500), IN `StateProvinceRegion` VARCHAR(500), IN `ZipCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `PlanOfChangingPlaceOfResidenceInNext4Months` VARCHAR(50), IN `InstitutionFullName` VARCHAR(500), IN `InstitutionType` VARCHAR(500), IN `InstitutionAccreditationStatus` VARCHAR(500), IN `DateAttendedFrom` VARCHAR(100), IN `DateAttendedTo` VARCHAR(100), IN `MajorOrFieldOfStudy` VARCHAR(500), IN `DegreeReceived` VARCHAR(200), IN `Notes` VARCHAR(1000))
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO overseaspermanentaddress 
(
CustProfileInfoId,OverseasPermanentAddressDateFrom,OverseasPermanentAddressDateTo,StreetAddress,Address2,City,
StateProvinceRegion,ZipCode,Country,PlanOfChangingPlaceOfResidenceInNext4Months
)
VALUES
(
ProfileId,OverseasPermanentAddressDateFrom,OverseasPermanentAddressDateTo,StreetAddress,Address2,City,
StateProvinceRegion,ZipCode,Country,PlanOfChangingPlaceOfResidenceInNext4Months
);

INSERT INTO education
(
CustProfileInfoId,InstitutionFullName,InstitutionType,
InstitutionAccreditationStatus,DateAttendedFrom,
DateAttendedTo,MajorOrFieldOfStudy,DegreeReceived,Notes
)
VALUES
(
ProfileId,InstitutionFullName,InstitutionType,
InstitutionAccreditationStatus,DateAttendedFrom,
DateAttendedTo,MajorOrFieldOfStudy,DegreeReceived,Notes
);
END$$
DELIMITER ;