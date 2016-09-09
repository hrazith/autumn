DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo1Insert`(IN AppNumberId INT,
      IN Principal_Applicant VARCHAR(50),
	  IN Trip_Purpose_1 VARCHAR(500),
	  IN Trip_Purpose_2 VARCHAR(500),
	  IN Trip_Purpose_3 VARCHAR(500),
	  IN Trip_Purpose_4 VARCHAR(500),
	  IN Intended_Date_Of_Arrival VARCHAR(100),
	  IN Intended_Length_Of_Stay_US VARCHAR(100),
	  IN Address_of_US_Stay VARCHAR(500),
	  IN Person_Entity_Paying_US_Trip VARCHAR(200),
	  IN Telephone VARCHAR(50),
	  IN Email_Address VARCHAR(500),
	  IN Relationship_To_You VARCHAR(100),
	  IN PayingPartyTripAddress_SameAsHomeMailingAddress VARCHAR(50),
	  IN PartyPayingAddress VARCHAR(500),
	  IN PartyPayingCity VARCHAR(200),
	  IN PartyPayingState_Province VARCHAR(200),
	  IN PostalZone_ZIPcode VARCHAR(50),
	  IN Country VARCHAR(500),
	  IN OtherPersonTravellingWithYou VARCHAR(100))
BEGIN

INSERT INTO custtravelinfo
(CustAppInfoId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,PostalZone_ZIPcode,Country,OtherPersonTravellingWithYou)
VALUES
(AppNumberId,Principal_Applicant,Trip_Purpose_1,Trip_Purpose_2,Trip_Purpose_3,Trip_Purpose_4,Intended_Date_Of_Arrival,Intended_Length_Of_Stay_US,Address_of_US_Stay,
Person_Entity_Paying_US_Trip,Telephone,Email_Address,Relationship_To_You,PayingPartyTripAddress_SameAsHomeMailingAddress,PartyPayingAddress,
PartyPayingCity,PartyPayingState_Province,PostalZone_ZIPcode,Country,OtherPersonTravellingWithYou);

END$$
DELIMITER ;