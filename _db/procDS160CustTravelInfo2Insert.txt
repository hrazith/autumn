DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustTravelInfo2Insert`(IN AppNumberId INT,
      IN TravellingPartofGroup_Organizantion VARCHAR(100),
	  IN PersonTravellingWithYou_Name_1 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_2 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_3 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_4 VARCHAR(200),
	  IN PersonTravellingWithYou_Name_5 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_1 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_2 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_3 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_4 VARCHAR(200),
	  IN PersonTravellingWithYou_Relationship_5 VARCHAR(200),
	  IN EverBeenToUS VARCHAR(50),
	  IN EverBeenIssuedUSVisa VARCHAR(50),
	  IN EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication VARCHAR(50))
BEGIN

INSERT INTO custtravelinfo
(CustAppInfoId,TravellingPartofGroup_Organizantion,PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,
PersonTravellingWithYou_Name_5,PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication)
VALUES
(AppNumberId,TravellingPartofGroup_Organizantion,PersonTravellingWithYou_Name_1,PersonTravellingWithYou_Name_2,PersonTravellingWithYou_Name_3,PersonTravellingWithYou_Name_4,
PersonTravellingWithYou_Name_5,PersonTravellingWithYou_Relationship_1,PersonTravellingWithYou_Relationship_2,PersonTravellingWithYou_Relationship_3,PersonTravellingWithYou_Relationship_4,
PersonTravellingWithYou_Relationship_5,EverBeenToUS,EverBeenIssuedUSVisa,EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication);

END$$
DELIMITER ;