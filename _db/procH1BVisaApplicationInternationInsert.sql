DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BVisaApplicationInternationInsert`(IN `AppId` INT, IN `PossibilityOfInternationTravelIn6Months` VARCHAR(50), IN `DateofIntendedDeparture` VARCHAR(100), IN `ExpectedLengthOfTrip` VARCHAR(200), IN `PurposeOfTripIncludingTravelersName` VARCHAR(1000), IN `ResidingOutsideUS` VARCHAR(50), IN `USConsulateLocationOutsideUS` VARCHAR(500), IN `AppliedNonImmigrantUSVisa` VARCHAR(50), IN `VisaCancelledDeniedRejected` VARCHAR(50))
BEGIN


INSERT INTO internationtravel
(CustAppInfoId,PossibilityOfInternationTravelIn6Months,DateofIntendedDeparture,ExpectedLengthOfTrip,PurposeOfTripIncludingTravelersName)
VALUES
(AppId,PossibilityOfInternationTravelIn6Months,DateofIntendedDeparture,ExpectedLengthOfTrip,PurposeOfTripIncludingTravelersName);


INSERT INTO visaapplication
(CustAppInfoId,ResidingOutsideUS,USConsulateLocationOutsideUS,AppliedNonImmigrantUSVisa,VisaCancelledDeniedRejected)
VALUES
(AppId,ResidingOutsideUS,USConsulateLocationOutsideUS,AppliedNonImmigrantUSVisa,VisaCancelledDeniedRejected);

END$$
DELIMITER ;