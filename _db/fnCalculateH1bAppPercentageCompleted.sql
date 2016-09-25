DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fnCalculateH1bAppPercentageCompleted`(AppId INT) RETURNS varchar(255) CHARSET latin1
BEGIN

SET @TotalColumnCount = (SELECT COUNT(*) ColumnCount 
                        FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME IN ('personaldetail1','personaldetail2','ushomeaddress','education','overseaspermanentaddress',
                                             'internationtravel','employment1','employment2','visainformation1','visainformation2','visaapplication')
                              AND COLUMN_NAME NOT IN ('personaldetailId','ushomeaddressId','educationId','overseaspermanentaddressId',
                                                     'internationaltravelId','employmentId','visainformationId','visaapplicationId','CustProfileInfoId'));
                                                     
                                                     
SET @personaldetail1BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('personaldetail1')
                                      AND COLUMN_NAME NOT IN ('personaldetailId','CustProfileInfoId'));
                                      
                                                     
SET @personaldetail2BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('personaldetail2')
                                      AND COLUMN_NAME NOT IN ('personaldetailId','CustProfileInfoId'));
                                     
                                     
SET @ushomeaddressBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('ushomeaddress')
                                      AND COLUMN_NAME NOT IN ('ushomeaddressId','CustProfileInfoId'));
                                      
                                      
SET @educationBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('education')
                                      AND COLUMN_NAME NOT IN ('educationId','CustProfileInfoId'));
                                      
                                      
SET @overseaspermanentaddressBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('overseaspermanentaddress')
                                      AND COLUMN_NAME NOT IN ('overseaspermanentaddressId','CustProfileInfoId'));
                                      
                                      
SET @internationaltravelBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('internationtravel')
                                      AND COLUMN_NAME NOT IN ('internationaltravelId','CustProfileInfoId'));
                                      
                                      
SET @employment1BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('employment1')
                                      AND COLUMN_NAME NOT IN ('employmentId','CustProfileInfoId'));
                                      
                                      
SET @employment2BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('employment2')
                                      AND COLUMN_NAME NOT IN ('employmentId','CustProfileInfoId'));
                                      
                                      
SET @visainformation1BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('visainformation1')
                                      AND COLUMN_NAME NOT IN ('visainformationId','CustProfileInfoId'));
                                      
                                      
SET @visainformation2BaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('visainformation2')
                                      AND COLUMN_NAME NOT IN ('visainformationId','CustProfileInfoId'));
                                      
                                      
SET @visaapplicationBaseCount = (SELECT COUNT(*) ColumnCount 
                                FROM INFORMATION_SCHEMA.COLUMNS
                                WHERE TABLE_NAME IN ('visaapplication')
                                      AND COLUMN_NAME NOT IN ('visaapplicationId','CustProfileInfoId'));
                                      
                                      
SET @personaldetail1 = ( SELECT IF(FirstName = '',1,0) + IF(FirstName = NULL,1,0) + IF(FirstName = 'NULL',1,0) +
                                IF(MiddleName = '',1,0) + IF(MiddleName = NULL,1,0) + IF(MiddleName = 'NULL',1,0) +
                                IF(LastName = '',1,0) + IF(LastName = NULL,1,0) + IF(LastName = 'NULL',1,0) +
                                IF(AliasFirstName = '',1,0) + IF(AliasFirstName = NULL,1,0) + IF(AliasFirstName = 'NULL',1,0) +
                                IF(AliasLastName = '',1,0) + IF(AliasLastName = NULL,1,0) + IF(AliasLastName = 'NULL',1,0) +
                                IF(OtherName1 = '',1,0) + IF(OtherName1 = NULL,1,0) + IF(OtherName1 = 'NULL',1,0) +
                                IF(OtherName2 = '',1,0) + IF(OtherName2 = NULL,1,0) + IF(OtherName2 = 'NULL',1,0) +
                                IF(OtherName3 = '',1,0) + IF(OtherName3 = NULL,1,0) + IF(OtherName3 = 'NULL',1,0) +
                                IF(Emailaddress = '',1,0) + IF(Emailaddress = NULL,1,0) + IF(Emailaddress = 'NULL',1,0) +
                                IF(WorkPhone = '',1,0) + IF(WorkPhone = NULL,1,0) + IF(WorkPhone = 'NULL',1,0) +
                                IF(HomePhone = '',1,0) + IF(HomePhone = NULL,1,0) + IF(HomePhone = 'NULL',1,0) +
                                IF(MobilePhone = '',1,0) + IF(MobilePhone = NULL,1,0) + IF(MobilePhone = 'NULL',1,0) +
                                IF(Gender = '',1,0) + IF(Gender = NULL,1,0) + IF(Gender = 'NULL',1,0) +
                                IF(DateofBirth = '',1,0) + IF(DateofBirth = NULL,1,0) + IF(DateofBirth = 'NULL',1,0) +
                                IF(CityofBirth = '',1,0) + IF(CityofBirth = NULL,1,0) + IF(CityofBirth = 'NULL',1,0) +
                                IF(StateofBirth = '',1,0) + IF(StateofBirth = NULL,1,0) + IF(StateofBirth = 'NULL',1,0) +
                                IF(CountryofBirth = '',1,0) + IF(CountryofBirth = NULL,1,0) + IF(CountryofBirth = 'NULL',1,0)
                         FROM personaldetail1
                         WHERE CustAppInfoId = AppId);
                        
                        
SET @personaldetail2 = ( SELECT IF(Nationality = '',1,0) + IF(Nationality = NULL,1,0) + IF(Nationality = 'NULL',1,0) +
                                IF(PermanentResident_Immigrant = '',1,0) + IF(PermanentResident_Immigrant = NULL,1,0) + IF(PermanentResident_Immigrant = 'NULL',1,0) +
                                IF(RecentCitizenship_PR_Immigrant = '',1,0) + IF(RecentCitizenship_PR_Immigrant = NULL,1,0) + IF(RecentCitizenship_PR_Immigrant = 'NULL',1,0) +
                                IF(PassportNumber = '',1,0) + IF(PassportNumber = NULL,1,0) + IF(PassportNumber = 'NULL',1,0) +
                                IF(PassportIssueDate = '',1,0) + IF(PassportIssueDate = NULL,1,0) + IF(PassportIssueDate = 'NULL',1,0) +
                                IF(PassportExpirationDate = '',1,0) + IF(PassportExpirationDate = NULL,1,0) + IF(PassportExpirationDate = 'NULL',1,0) +
                                IF(PassportIssuedCity = '',1,0) + IF(PassportIssuedCity = NULL,1,0) + IF(PassportIssuedCity = 'NULL',1,0) +
                                IF(PassportIssuedState = '',1,0) + IF(PassportIssuedState = NULL,1,0) + IF(PassportIssuedState = 'NULL',1,0) +
                                IF(PassportIssuedCountry = '',1,0) + IF(PassportIssuedCountry = NULL,1,0) + IF(PassportIssuedCountry = 'NULL',1,0) +
                                IF(BlankPagesInPassport = '',1,0) + IF(BlankPagesInPassport = NULL,1,0) + IF(BlankPagesInPassport = 'NULL',1,0) 
                         FROM personaldetail2
                         WHERE CustAppInfoId = AppId);
                        
                        
SET @ushomeaddress = ( SELECT IF(HaveUSHomeAddress = '',1,0) + IF(HaveUSHomeAddress = NULL,1,0) + IF(HaveUSHomeAddress = 'NULL',1,0) + 
                              IF(USHomeAddressDateFrom = '',1,0) + IF(USHomeAddressDateFrom = NULL,1,0) + IF(USHomeAddressDateFrom = 'NULL',1,0) +
                              IF(USHomeAddressDateTo = '',1,0) + IF(USHomeAddressDateTo = NULL,1,0) + IF(USHomeAddressDateTo = 'NULL',1,0) + 
                              IF(StreetAddress = '',1,0) + IF(StreetAddress = NULL,1,0) + IF(StreetAddress = 'NULL',1,0) +
                              IF(Address2 = '',1,0) + IF(Address2 = NULL,1,0) + IF(Address2 = 'NULL',1,0) + 
                              IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) +
                              IF(StateProvinceRegion = '',1,0) + IF(StateProvinceRegion = NULL,1,0) + IF(StateProvinceRegion = 'NULL',1,0) + 
                              IF(ZipCode = '',1,0) + IF(ZipCode = NULL,1,0) + IF(ZipCode = 'NULL',1,0) +
                              IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) + 
                              IF(SameAsCurrentmaiingAddress = '',1,0) + IF(SameAsCurrentmaiingAddress = NULL,1,0) + IF(SameAsCurrentmaiingAddress = 'NULL',1,0) +
                              IF(Address2_1 = '',1,0) + IF(Address2_1 = NULL,1,0) + IF(Address2_1 = 'NULL',1,0) + 
                              IF(City_1 = '',1,0) + IF(City_1 = NULL,1,0) + IF(City_1 = 'NULL',1,0) +
                              IF(StateProvinceRegion_1 = '',1,0) + IF(StateProvinceRegion_1 = NULL,1,0) + IF(StateProvinceRegion_1 = 'NULL',1,0) + 
                              IF(ZipCode_1 = '',1,0) + IF(ZipCode_1 = NULL,1,0) + IF(ZipCode_1 = 'NULL',1,0) +
                              IF(Country_1 = '',1,0) + IF(Country_1 = NULL,1,0) + IF(Country_1 = 'NULL',1,0) + 
                              IF(PhoneNumberWithThisAddress = '',1,0) + IF(PhoneNumberWithThisAddress = NULL,1,0) + IF(PhoneNumberWithThisAddress = 'NULL',1,0) +
            IF(PlanOfChangingPlaceOfResidenceInNext4Months = '',1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = NULL,1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = 'NULL',1,0) + 
                              IF(IfYesMovingDateAndNewAddress = '',1,0) + IF(IfYesMovingDateAndNewAddress = NULL,1,0) + IF(IfYesMovingDateAndNewAddress = 'NULL',1,0) 
                       FROM ushomeaddress
                       WHERE CustAppInfoId = AppId);
                       
                       
SET @education = ( SELECT IF(InstitutionFullName = '',1,0) + IF(InstitutionFullName = NULL,1,0) + IF(InstitutionFullName = 'NULL',1,0) +
                          IF(InstitutionType = '',1,0) + IF(InstitutionType = NULL,1,0) + IF(InstitutionType = 'NULL',1,0) +
                          IF(InstitutionAccreditationStatus = '',1,0) + IF(InstitutionAccreditationStatus = NULL,1,0) + IF(InstitutionAccreditationStatus = 'NULL',1,0) +
                          IF(DateAttendedFrom = '',1,0) + IF(DateAttendedFrom = NULL,1,0) + IF(DateAttendedFrom = 'NULL',1,0) +
                          IF(DateAttendedTo = '',1,0) + IF(DateAttendedTo = NULL,1,0) + IF(DateAttendedTo = 'NULL',1,0) +
                          IF(MajorOrFieldOfStudy = '',1,0) + IF(MajorOrFieldOfStudy = NULL,1,0) + IF(MajorOrFieldOfStudy = 'NULL',1,0) +
                          IF(DegreeReceived = '',1,0) + IF(DegreeReceived = NULL,1,0) + IF(DegreeReceived = 'NULL',1,0) +
                          IF(Notes = '',1,0) + IF(Notes = NULL,1,0) + IF(Notes = 'NULL',1,0) 
                   FROM education
                   WHERE CustAppInfoId = AppId);
                   
                   
SET @overseaspermanentaddress = ( SELECT IF(OverseasPermanentAddressDateFrom = '',1,0) + IF(OverseasPermanentAddressDateFrom = NULL,1,0) + IF(OverseasPermanentAddressDateFrom = 'NULL',1,0) +
                                         IF(OverseasPermanentAddressDateTo = '',1,0) + IF(OverseasPermanentAddressDateTo = NULL,1,0) + IF(OverseasPermanentAddressDateTo = 'NULL',1,0) +
                                         IF(StreetAddress = '',1,0) + IF(StreetAddress = NULL,1,0) + IF(StreetAddress = 'NULL',1,0) +
                                         IF(Address2 = '',1,0) + IF(Address2 = NULL,1,0) + IF(Address2 = 'NULL',1,0) +
                                         IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) +
                                         IF(StateProvinceRegion = '',1,0) + IF(StateProvinceRegion = NULL,1,0) + IF(StateProvinceRegion = 'NULL',1,0) +
                                         IF(ZipCode = '',1,0) + IF(ZipCode = NULL,1,0) + IF(ZipCode = 'NULL',1,0) +
                                         IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) +
             IF(PlanOfChangingPlaceOfResidenceInNext4Months = '',1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = NULL,1,0) + IF(PlanOfChangingPlaceOfResidenceInNext4Months = 'NULL',1,0) 
                                  FROM overseaspermanentaddress
                                  WHERE CustAppInfoId = AppId);
                        
SET @internationaltravel = ( SELECT IF(PossibilityOfInternationTravelIn6Months = '',1,0) + IF(PossibilityOfInternationTravelIn6Months = NULL,1,0) + IF(PossibilityOfInternationTravelIn6Months = 'NULL',1,0) + 
                                    IF(DateofIntendedDeparture = '',1,0) + IF(DateofIntendedDeparture = NULL,1,0) + IF(DateofIntendedDeparture = 'NULL',1,0) +
                                    IF(ExpectedLengthOfTrip = '',1,0) + IF(ExpectedLengthOfTrip = NULL,1,0) + IF(ExpectedLengthOfTrip = 'NULL',1,0) +
                                    IF(PurposeOfTripIncludingTravelersName = '',1,0) + IF(PurposeOfTripIncludingTravelersName = NULL,1,0) + IF(PurposeOfTripIncludingTravelersName = 'NULL',1,0) 
                             FROM internationtravel
                             WHERE CustAppInfoId = AppId);
                             
                             
SET @employment1 = ( SELECT IF(EmploymentType = '',1,0) + IF(EmploymentType = NULL,1,0) + IF(EmploymentType = 'NULL',1,0) +
                            IF(EmploymentDateFrom = '',1,0) + IF(EmploymentDateFrom = NULL,1,0) + IF(EmploymentDateFrom = 'NULL',1,0) +
                            IF(EmploymentDateTo = '',1,0) + IF(EmploymentDateTo = NULL,1,0) + IF(EmploymentDateTo = 'NULL',1,0) +
                            IF(StreetAddress = '',1,0) + IF(StreetAddress = NULL,1,0) + IF(StreetAddress = 'NULL',1,0) +
                            IF(Address2 = '',1,0) + IF(Address2 = NULL,1,0) + IF(Address2 = 'NULL',1,0) +
                            IF(City = '',1,0) + IF(City = NULL,1,0) + IF(City = 'NULL',1,0) +
                            IF(StateProvinceRegion = '',1,0) + IF(StateProvinceRegion = NULL,1,0) + IF(StateProvinceRegion = 'NULL',1,0) +
                            IF(ZipCode = '',1,0) + IF(ZipCode = NULL,1,0) + IF(ZipCode = 'NULL',1,0) +
                            IF(Country = '',1,0) + IF(Country = NULL,1,0) + IF(Country = 'NULL',1,0) +
                            IF(EmployerIsUniversityOrNonProfit = '',1,0) + IF(EmployerIsUniversityOrNonProfit = NULL,1,0) + IF(EmployerIsUniversityOrNonProfit = 'NULL',1,0) +
                            IF(TypeOfBusiness = '',1,0) + IF(TypeOfBusiness = NULL,1,0) + IF(TypeOfBusiness = 'NULL',1,0) +
                            IF(HoursPerWeek = '',1,0) + IF(HoursPerWeek = NULL,1,0) + IF(HoursPerWeek = 'NULL',1,0) +
                            IF(IsPositionPartTime = '',1,0) + IF(IsPositionPartTime = NULL,1,0) + IF(IsPositionPartTime = 'NULL',1,0) +
                            IF(JobTitle = '',1,0) + IF(JobTitle = NULL,1,0) + IF(JobTitle = 'NULL',1,0) +
                            IF(CurrentAnnualBaseSalary = '',1,0) + IF(CurrentAnnualBaseSalary = NULL,1,0) + IF(CurrentAnnualBaseSalary = 'NULL',1,0) +
                            IF(DetailJobDuties = '',1,0) + IF(DetailJobDuties = NULL,1,0) + IF(DetailJobDuties = 'NULL',1,0) +
                            IF(TechnologiesUsed = '',1,0) + IF(TechnologiesUsed = NULL,1,0) + IF(TechnologiesUsed = 'NULL',1,0) 
                     FROM employment1
                     WHERE CustAppInfoId = AppId);
                     
                     
SET @employment2 = ( SELECT IF(SupervisorName = '',1,0) + IF(SupervisorName = NULL,1,0) + IF(SupervisorName = 'NULL',1,0) +
                            IF(SupervisorPhoneNumber = '',1,0) + IF(SupervisorPhoneNumber = NULL,1,0) + IF(SupervisorPhoneNumber = 'NULL',1,0) +
                            IF(SuperVisorJobTitle = '',1,0) + IF(SuperVisorJobTitle = NULL,1,0) + IF(SuperVisorJobTitle = 'NULL',1,0) +
                       IF(AnyInterruptionsInEmploymentWithEmployer = '',1,0) + IF(AnyInterruptionsInEmploymentWithEmployer = NULL,1,0) + IF(AnyInterruptionsInEmploymentWithEmployer = 'NULL',1,0) +
                            IF(WorkingOutsideTheUS = '',1,0) + IF(WorkingOutsideTheUS = NULL,1,0) + IF(WorkingOutsideTheUS = 'NULL',1,0) +
                       IF(IfWorkingOutsideDoesItInvolveSupervision = '',1,0) + IF(IfWorkingOutsideDoesItInvolveSupervision = NULL,1,0) + IF(IfWorkingOutsideDoesItInvolveSupervision = 'NULL',1,0) 
                     FROM employment2
                     WHERE CustAppInfoId = AppId);
                     
                     
SET @visainformation1 = ( SELECT IF(EverEnteredUS = '',1,0) + IF(EverEnteredUS = NULL,1,0) + IF(EverEnteredUS = 'NULL',1,0) +
                                 IF(DateofLastEntryUS = '',1,0) + IF(DateofLastEntryUS = NULL,1,0) + IF(DateofLastEntryUS = 'NULL',1,0) +
                                 IF(I94Number = '',1,0) + IF(I94Number = NULL,1,0) + IF(I94Number = 'NULL',1,0) +
                                 IF(CurrentUSImmigrationStatus = '',1,0) + IF(CurrentUSImmigrationStatus = NULL,1,0) + IF(CurrentUSImmigrationStatus = 'NULL',1,0) +
                                 IF(LastEntryUSCity = '',1,0) + IF(LastEntryUSCity = NULL,1,0) + IF(LastEntryUSCity = 'NULL',1,0) +
                                 IF(LastEntryUSState = '',1,0) + IF(LastEntryUSState = NULL,1,0) + IF(LastEntryUSState = 'NULL',1,0) +
                                 IF(ExpirationStatusI94_I688 = '',1,0) + IF(ExpirationStatusI94_I688 = NULL,1,0) + IF(ExpirationStatusI94_I688 = 'NULL',1,0) +
                                 IF(VisaNumber = '',1,0) + IF(VisaNumber = NULL,1,0) + IF(VisaNumber = 'NULL',1,0) +
                                 IF(VisaIssuanceCity = '',1,0) + IF(VisaIssuanceCity = NULL,1,0) + IF(VisaIssuanceCity = 'NULL',1,0) +
                                 IF(VisaIssuanceCountry = '',1,0) + IF(VisaIssuanceCountry = NULL,1,0) + IF(VisaIssuanceCountry = 'NULL',1,0) +
                                 IF(ViaIssuanceDate = '',1,0) + IF(ViaIssuanceDate = NULL,1,0) + IF(ViaIssuanceDate = 'NULL',1,0) +
                                 IF(VisaExpirationDate = '',1,0) + IF(VisaExpirationDate = NULL,1,0) + IF(VisaExpirationDate = 'NULL',1,0) +
                                 IF(EverFiledI140ImmigrationPetition = '',1,0) + IF(EverFiledI140ImmigrationPetition = NULL,1,0) + IF(EverFiledI140ImmigrationPetition = 'NULL',1,0) +
                                 IF(I140ApprovedDenied = '',1,0) + IF(I140ApprovedDenied = NULL,1,0) + IF(I140ApprovedDenied = 'NULL',1,0) +
                                 IF(I140PriorityDate = '',1,0) + IF(I140PriorityDate = NULL,1,0) + IF(I140PriorityDate = 'NULL',1,0) +
                                 IF(I140ReceiptCategoryPriorityDate = '',1,0) + IF(I140ReceiptCategoryPriorityDate = NULL,1,0) + IF(I140ReceiptCategoryPriorityDate = 'NULL',1,0) +
                                 IF(EverAppliedGreenCardOrPermanentResidencyByYou_Family = '',1,0) + IF(EverAppliedGreenCardOrPermanentResidencyByYou_Family = NULL,1,0) + IF(EverAppliedGreenCardOrPermanentResidencyByYou_Family = 'NULL',1,0) +
                                 IF(DatePlaceOutcomeOfGreenCardOrPermanentResidency = '',1,0) + IF(DatePlaceOutcomeOfGreenCardOrPermanentResidency = NULL,1,0) + IF(DatePlaceOutcomeOfGreenCardOrPermanentResidency = 'NULL',1,0)
                          FROM visainformation1
                          WHERE CustAppInfoId = AppId);
                        
                        
SET @visainformation2 = ( SELECT IF(F1Status_CPTTraining = '',1,0) + IF(F1Status_CPTTraining = NULL,1,0) + IF(F1Status_CPTTraining = 'NULL',1,0) +
                                 IF(CPTWithGraduateDegree = '',1,0) + IF(CPTWithGraduateDegree = NULL,1,0) + IF(CPTWithGraduateDegree = 'NULL',1,0) +
                                 IF(StartedCPTAfterDegreeProgram = '',1,0) + IF(StartedCPTAfterDegreeProgram = NULL,1,0) + IF(StartedCPTAfterDegreeProgram = 'NULL',1,0) +
                                 IF(IfinF1_AppliedOTP = '',1,0) + IF(IfinF1_AppliedOTP = NULL,1,0) + IF(IfinF1_AppliedOTP = 'NULL',1,0) +
                                 IF(I765Approved_Pending = '',1,0) + IF(I765Approved_Pending = NULL,1,0) + IF(I765Approved_Pending = 'NULL',1,0) +
                                 IF(I765ReceiptNumber = '',1,0) + IF(I765ReceiptNumber = NULL,1,0) + IF(I765ReceiptNumber = 'NULL',1,0) +
                    IF(IfI765Approved_NoOfDaysUnemployedAfterEAD = '',1,0) + IF(IfI765Approved_NoOfDaysUnemployedAfterEAD = NULL,1,0) + IF(IfI765Approved_NoOfDaysUnemployedAfterEAD = 'NULL',1,0) +
                                 IF(J1orJ2Visa = '',1,0) + IF(J1orJ2Visa = NULL,1,0) + IF(J1orJ2Visa = 'NULL',1,0) +
                                 IF(TwoYrHomeResidencyRequirement = '',1,0) + IF(TwoYrHomeResidencyRequirement = NULL,1,0) + IF(TwoYrHomeResidencyRequirement = 'NULL',1,0) +
                                 IF(J1orJ2SubmittedApplicationForWaiver = '',1,0) + IF(J1orJ2SubmittedApplicationForWaiver = NULL,1,0) + IF(J1orJ2SubmittedApplicationForWaiver = 'NULL',1,0) +
                                 IF(F1OrJ1SEVISNumber = '',1,0) + IF(F1OrJ1SEVISNumber = NULL,1,0) + IF(F1OrJ1SEVISNumber = 'NULL',1,0) +
                                 IF(EverBeenInUSInHOrLStatus = '',1,0) + IF(EverBeenInUSInHOrLStatus = NULL,1,0) + IF(EverBeenInUSInHOrLStatus = 'NULL',1,0) +
                                 IF(EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus = '',1,0) + IF(EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus = NULL,1,0) + IF(EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus = 'NULL',1,0) +
                                 IF(FiledH1BDuringPreviousFiscalYear = '',1,0) + IF(FiledH1BDuringPreviousFiscalYear = NULL,1,0) + IF(FiledH1BDuringPreviousFiscalYear = 'NULL',1,0) +
                                 IF(AppliedH1BPursuantToApprovedPetitionAndEnterUS = '',1,0) + IF(AppliedH1BPursuantToApprovedPetitionAndEnterUS = NULL,1,0) + IF(AppliedH1BPursuantToApprovedPetitionAndEnterUS = 'NULL',1,0) +
                                 IF(StartedEmploymentInUS = '',1,0) + IF(StartedEmploymentInUS = NULL,1,0) + IF(StartedEmploymentInUS = 'NULL',1,0) +
                                 IF(NotStartedEmploymentSelectReason = '',1,0) + IF(NotStartedEmploymentSelectReason = NULL,1,0) + IF(NotStartedEmploymentSelectReason = 'NULL',1,0) +
                                 IF(HOrLPetitionDenied = '',1,0) + IF(HOrLPetitionDenied = NULL,1,0) + IF(HOrLPetitionDenied = 'NULL',1,0) +
                                 IF(IfYesEnterReason = '',1,0) + IF(IfYesEnterReason = NULL,1,0) + IF(IfYesEnterReason = 'NULL',1,0)
                          FROM visainformation2
                          WHERE CustAppInfoId = AppId);
                        
                        
SET @visaapplication = ( SELECT IF(ResidingOutsideUS = '',1,0) + IF(ResidingOutsideUS = NULL,1,0) + IF(ResidingOutsideUS = 'NULL',1,0) +
                               IF(USConsulateLocationOutsideUS = '',1,0) + IF(USConsulateLocationOutsideUS = NULL,1,0) + IF(USConsulateLocationOutsideUS = 'NULL',1,0) +
                               IF(AppliedNonImmigrantUSVisa = '',1,0) + IF(AppliedNonImmigrantUSVisa = NULL,1,0) + IF(AppliedNonImmigrantUSVisa = 'NULL',1,0) +
                               IF(VisaCancelledDeniedRejected = '',1,0) + IF(VisaCancelledDeniedRejected = NULL,1,0) + IF(VisaCancelledDeniedRejected = 'NULL',1,0)
                        FROM visaapplication
                        WHERE CustAppInfoId = AppId);
                      
                      
SET @personaldetail1 = (select COALESCE(@personaldetail1,@personaldetail1BaseCount));

SET @personaldetail2 = (select COALESCE(@personaldetail2,@personaldetail2BaseCount));

SET @ushomeaddress = (select COALESCE(@ushomeaddress,@ushomeaddressBaseCount));

SET @education = (select COALESCE(@education,@educationBaseCount));

SET @overseaspermanentaddress = (select COALESCE(@overseaspermanentaddress,@overseaspermanentaddressBaseCount));

SET @internationaltravel = (select COALESCE(@internationaltravel,@internationaltravelBaseCount));

SET @employment1 = (select COALESCE(@employment1,@employment1BaseCount));

SET @employment2 = (select COALESCE(@employment2,@employment2BaseCount));

SET @visainformation1 = (select COALESCE(@visainformation1,@visainformation1InfoBaseCount));

SET @visainformation2 = (select COALESCE(@visainformation2,@visainformation2BaseCount));

SET @visaapplication = (select COALESCE(@visaapplication,@visaapplicationInfoBaseCount));
                        

SET @EffectiveColumnFilled = (SELECT @TotalColumnCount - (@personaldetail1 + @personaldetail2 + @ushomeaddress + @education + @overseaspermanentaddress + @internationaltravel + @employment1 + 										 @employment2 + @visainformation1 + @visainformation2 + @visaapplication));


SET @ApplicationPercentageCompletion = (@EffectiveColumnFilled*100)/@TotalColumnCount;

RETURN @ApplicationPercentageCompletion;

END$$
DELIMITER ;