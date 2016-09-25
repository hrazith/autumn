DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procH1BVisaInformation2Insert`(IN `AppId` VARCHAR(200), IN `F1Status_CPTTraining` VARCHAR(50), IN `CPTWithGraduateDegree` VARCHAR(50), IN `StartedCPTAfterDegreeProgram` VARCHAR(50), IN `IfinF1_AppliedOTP` VARCHAR(50), IN `I765Approved_Pending` VARCHAR(50), IN `I765ReceiptNumber` VARCHAR(100), IN `IfI765Approved_NoOfDaysUnemployedAfterEAD` VARCHAR(50), IN `J1orJ2Visa` VARCHAR(50), IN `TwoYrHomeResidencyRequirement` VARCHAR(50), IN `J1orJ2SubmittedApplicationForWaiver` VARCHAR(50), IN `F1OrJ1SEVISNumber` VARCHAR(100), IN `EverBeenInUSInHOrLStatus` VARCHAR(50), IN `EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus` VARCHAR(50), IN `FiledH1BDuringPreviousFiscalYear` VARCHAR(50), IN `AppliedH1BPursuantToApprovedPetitionAndEnterUS` VARCHAR(50), IN `StartedEmploymentInUS` VARCHAR(50), IN `NotStartedEmploymentSelectReason` VARCHAR(500), IN `HOrLPetitionDenied` VARCHAR(50), IN `IfYesEnterReason` VARCHAR(8000))
BEGIN


INSERT INTO visainformation2
(CustAppInfoId,F1Status_CPTTraining,CPTWithGraduateDegree,StartedCPTAfterDegreeProgram,IfinF1_AppliedOTP,I765Approved_Pending,
I765ReceiptNumber,IfI765Approved_NoOfDaysUnemployedAfterEAD,J1orJ2Visa,TwoYrHomeResidencyRequirement,J1orJ2SubmittedApplicationForWaiver,
F1OrJ1SEVISNumber,EverBeenInUSInHOrLStatus,EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus,FiledH1BDuringPreviousFiscalYear,
AppliedH1BPursuantToApprovedPetitionAndEnterUS,StartedEmploymentInUS,NotStartedEmploymentSelectReason,HOrLPetitionDenied,IfYesEnterReason
)
VALUES
(AppId,F1Status_CPTTraining,CPTWithGraduateDegree,StartedCPTAfterDegreeProgram,IfinF1_AppliedOTP,I765Approved_Pending,
I765ReceiptNumber,IfI765Approved_NoOfDaysUnemployedAfterEAD,J1orJ2Visa,TwoYrHomeResidencyRequirement,J1orJ2SubmittedApplicationForWaiver,
F1OrJ1SEVISNumber,EverBeenInUSInHOrLStatus,EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus,FiledH1BDuringPreviousFiscalYear,
AppliedH1BPursuantToApprovedPetitionAndEnterUS,StartedEmploymentInUS,NotStartedEmploymentSelectReason,HOrLPetitionDenied,IfYesEnterReason);

END$$
DELIMITER ;