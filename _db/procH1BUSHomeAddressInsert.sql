DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BUSHomeAddressInsert`(IN `AppId` INT, IN `HaveUSHomeAddress` VARCHAR(50), IN `USHomeAddressDateFrom` VARCHAR(100), IN `USHomeAddressDateTo` VARCHAR(100), IN `StreetAddress` VARCHAR(500), IN `Address2` VARCHAR(500), IN `City` VARCHAR(500), IN `StateProvinceRegion` VARCHAR(500), IN `ZipCode` VARCHAR(50), IN `Country` VARCHAR(500), IN `SameAsCurrentmaiingAddress` VARCHAR(50), IN `Address2_1` VARCHAR(500), IN `City_1` VARCHAR(500), IN `StateProvinceRegion_1` VARCHAR(500), IN `ZipCode_1` VARCHAR(50), IN `Country_1` VARCHAR(500), IN `PhoneNumberWithThisAddress` VARCHAR(50), IN `PlanOfChangingPlaceOfResidenceInNext4Months` VARCHAR(50), IN `IfYesMovingDateAndNewAddress` VARCHAR(2000))
BEGIN


INSERT INTO ushomeaddress
(
CustAppInfoId,HaveUSHomeAddress,USHomeAddressDateFrom,USHomeAddressDateTo,StreetAddress,Address2,
City,StateProvinceRegion,ZipCode,Country,SameAsCurrentmaiingAddress,Address2_1,City_1,StateProvinceRegion_1,
ZipCode_1,Country_1,PhoneNumberWithThisAddress,PlanOfChangingPlaceOfResidenceInNext4Months,IfYesMovingDateAndNewAddress
)
VALUES
(
AppId,HaveUSHomeAddress,USHomeAddressDateFrom,USHomeAddressDateTo,StreetAddress,Address2,
City,StateProvinceRegion,ZipCode,Country,SameAsCurrentmaiingAddress,Address2_1,City_1,StateProvinceRegion_1,
ZipCode_1,Country_1,PhoneNumberWithThisAddress,PlanOfChangingPlaceOfResidenceInNext4Months,IfYesMovingDateAndNewAddress
);

END$$
DELIMITER ;