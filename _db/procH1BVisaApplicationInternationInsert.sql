DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BVisaApplicationInternationInsert`(IN UserName VARCHAR(200),
                                                          IN PossibilityOfInternationTravelIn6Months VARCHAR(50),
                                                          IN DateofIntendedDeparture VARCHAR(100),
                                                          IN ExpectedLengthOfTrip VARCHAR(200),
                                                          IN PurposeOfTripIncludingTravelersName VARCHAR(1000),
                                                          IN ResidingOutsideUS VARCHAR(50),
                                                          IN USConsulateLocationOutsideUS VARCHAR(500),
                                                          IN AppliedNonImmigrantUSVisa VARCHAR(50),
                                                          IN VisaCancelledDeniedRejected VARCHAR(50))
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO internationtravel
(CustProfileInfoId,PossibilityOfInternationTravelIn6Months,DateofIntendedDeparture,ExpectedLengthOfTrip,PurposeOfTripIncludingTravelersName)
VALUES
(ProfileId,PossibilityOfInternationTravelIn6Months,DateofIntendedDeparture,ExpectedLengthOfTrip,PurposeOfTripIncludingTravelersName);


INSERT INTO visaapplication
(CustProfileInfoId,ResidingOutsideUS,USConsulateLocationOutsideUS,AppliedNonImmigrantUSVisa,VisaCancelledDeniedRejected)
VALUES
(ProfileId,ResidingOutsideUS,USConsulateLocationOutsideUS,AppliedNonImmigrantUSVisa,VisaCancelledDeniedRejected);

END$$
DELIMITER ;