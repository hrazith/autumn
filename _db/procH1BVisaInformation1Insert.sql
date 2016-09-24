DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BVisaInformation1Insert`(IN UserName VARCHAR(200),
                                                IN EverEnteredUS VARCHAR(50),
                                                IN DateofLastEntryUS VARCHAR(100),
                                                IN I94Number VARCHAR(50),
                                                IN CurrentUSImmigrationStatus VARCHAR(100),
                                                IN LastEntryUSCity VARCHAR(500),
                                                IN LastEntryUSState VARCHAR(500),
                                                IN ExpirationStatusI94_I688 VARCHAR(100),
                                                IN VisaNumber VARCHAR(100),
                                                IN VisaIssuanceCity VARCHAR(500),
                                                IN VisaIssuanceCountry VARCHAR(500),
                                                IN ViaIssuanceDate VARCHAR(100),
                                                IN VisaExpirationDate VARCHAR(100),
                                                IN EverFiledI140ImmigrationPetition VARCHAR(50),
                                                IN I140ApprovedDenied VARCHAR(50),
                                                IN I140PriorityDate VARCHAR(100),
                                                IN I140ReceiptCategoryPriorityDate VARCHAR(1000),
                                                IN EverAppliedGreenCardOrPermanentResidencyByYou_Family VARCHAR(50),
                                                IN DatePlaceOutcomeOfGreenCardOrPermanentResidency VARCHAR(1000))
BEGIN

DECLARE ProfileId INT;

SET ProfileId = (SELECT CustProfileInfoId  FROM custprofileinfo WHERE UserName = UserName LIMIT 1);

INSERT INTO visainformation1
(CustProfileInfoId,EverEnteredUS,DateofLastEntryUS,I94Number,CurrentUSImmigrationStatus,LastEntryUSCity,
LastEntryUSState,ExpirationStatusI94_I688,VisaNumber,VisaIssuanceCity,VisaIssuanceCountry,ViaIssuanceDate,
VisaExpirationDate,EverFiledI140ImmigrationPetition,I140ApprovedDenied,I140PriorityDate,I140ReceiptCategoryPriorityDate,
EverAppliedGreenCardOrPermanentResidencyByYou_Family,DatePlaceOutcomeOfGreenCardOrPermanentResidency
)
VALUES
(ProfileId,EverEnteredUS,DateofLastEntryUS,I94Number,CurrentUSImmigrationStatus,LastEntryUSCity,
LastEntryUSState,ExpirationStatusI94_I688,VisaNumber,VisaIssuanceCity,VisaIssuanceCountry,ViaIssuanceDate,
VisaExpirationDate,EverFiledI140ImmigrationPetition,I140ApprovedDenied,I140PriorityDate,I140ReceiptCategoryPriorityDate,
EverAppliedGreenCardOrPermanentResidencyByYou_Family,DatePlaceOutcomeOfGreenCardOrPermanentResidency);

END$$
DELIMITER ;