DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procDS160CustFamilyInfo1Insert`(IN `AppNumberId` INT, IN `FatherSurname` VARCHAR(200), IN `FatherGivenName` VARCHAR(200), IN `FatherDateofBirth` VARCHAR(100), IN `IsYourFatherInUS` VARCHAR(50), IN `MotherSurname` VARCHAR(200), IN `MotherGivenName` VARCHAR(200), IN `IsYourMotherInUS` VARCHAR(50), IN `ImmediateRelativesInUS_ApartFatherMother` VARCHAR(50), IN `Relative_Name_1` VARCHAR(200), IN `Relationship_To_Relative_1` VARCHAR(200), IN `Relative_Status_1` VARCHAR(100), IN `Relative_Name_2` VARCHAR(200), IN `Relationship_To_Relative_2` VARCHAR(200), IN `Relative_Status_2` VARCHAR(100), IN `Relative_Name_3` VARCHAR(200), IN `Relationship_To_Relative_3` VARCHAR(200), IN `Relative_Status_3` VARCHAR(100))
BEGIN

INSERT INTO custfamilyinfo
(CustAppInfoId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3)
VALUES
(AppNumberId,FatherSurname,FatherGivenName,FatherDateofBirth,IsYourFatherInUS,MotherSurname,MotherGivenName,IsYourMotherInUS,
ImmediateRelativesInUS_ApartFatherMother,Relative_Name_1,Relationship_To_Relative_1,Relative_Status_1,Relative_Name_2,Relationship_To_Relative_2,
Relative_Status_2,Relative_Name_3,Relationship_To_Relative_3,Relative_Status_3);

END$$
DELIMITER ;