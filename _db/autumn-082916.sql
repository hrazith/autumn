-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Aug 30, 2016 at 12:46 AM
-- Server version: 5.5.42
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autumn`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procLoadDS160`(IN `ProfileId` INT, IN `CountryId` INT, IN `VisaTypeId` INT)
BEGIN

SELECT cp.*,ct.Principal_Applicant,ct.Trip_Purpose_1,ct.Trip_Purpose_2,ct.Trip_Purpose_3,ct.Trip_Purpose_4,ct.Intended_Date_Of_Arrival,ct.Intended_Length_Of_Stay_US,ct.Address_of_US_Stay,ct.Person_Entity_Paying_US_Trip,ct.Telephone,ct.Email_Address,ct.Relationship_To_You,ct.PayingPartyTripAddress_SameAsHomeMailingAddress,ct.PartyPayingAddress,ct.PartyPayingCity,ct.PartyPayingState_Province,ct.PostalZone_ZIPcode,ct.Country,ct.OtherPersonTravellingWithYou,ct.TravellingPartofGroup_Organizantion,ct.PersonTravellingWithYou_Name_1,ct.PersonTravellingWithYou_Name_2,ct.PersonTravellingWithYou_Name_3,ct.PersonTravellingWithYou_Name_4,ct.PersonTravellingWithYou_Name_5,ct.PersonTravellingWithYou_Relationship_1,ct.PersonTravellingWithYou_Relationship_2,ct.PersonTravellingWithYou_Relationship_3,ct.PersonTravellingWithYou_Relationship_4,ct.PersonTravellingWithYou_Relationship_5,ct.EverBeenToUS,ct.EverBeenIssuedUSVisa,ct.EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication,cu.ContactPersonNameInUS,cu.OrganizationNameInUS,cu.Relationship,cu.ContactAddressUS,cu.Phone_Number,cu.Email_Address,cf.FatherSurname,cf.FatherGivenName,cf.FatherDateofBirth,cf.IsYourFatherInUS,cf.MotherSurname,cf.MotherGivenName,cf.IsYourMotherInUS,cf.ImmediateRelativesInUS_ApartFatherMother,cf.Relative_Name_1,cf.Relationship_To_Relative_1,cf.Relative_Status_1,cf.Relative_Name_2,cf.Relationship_To_Relative_2,cf.Relative_Status_2,cf.Relative_Name_3,cf.Relationship_To_Relative_3,cf.Relative_Status_3,cf.Relative_Name_4,cf.Relationship_To_Relative_4,cf.Relative_Status_4,cf.Spouse_FullName,cf.Spouse_DateOfBirth,cf.Spouse_Nationality,cf.Spouse_CityOfBirth,cf.Spouse_CountryOfBirth,cf.Spouse_Address,cw.Primary_Occupation,cw.PresentEmployer_SchoolName,cw.Address,cw.City,cw.State_Province,cw.PostalZone_ZipCode,cw.Country,cw.MonthSalary_LocalCurrency,cw.BrifelyDescribeYourDuties,cl.CurrentLocation,cpa.AnyoneAssistInFillingApplication FROM custpersonalinfo cp
LEFT JOIN custtravelinfo ct ON cp.CustAppInfoId = ct.CustAppInfoId
LEFT JOIN custuscontactinfo cu ON cp.CustAppInfoId = cu.CustAppInfoId
LEFT JOIN custfamilyinfo cf ON cp.CustAppInfoId = cf.CustAppInfoId
LEFT JOIN custworkeducationtraininginfo cw ON cp.CustAppInfoId = cw.CustAppInfoId
LEFT JOIN custlocalinfo cl ON cp.CustAppInfoId = cl.CustAppInfoId
LEFT JOIN custpreparerappinfo cpa ON cp.CustAppInfoId = cpa.CustAppInfoId
WHERE cp.CustAppInfoId = (SELECT CustAppInfoId FROM custappinfo where CustProfileInfoId = ProfileId and CountryListId = CountryId and CountryVisaTypeListId = VisaTypeId);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CountryList`
--

CREATE TABLE `CountryList` (
  `CountryListId` int(11) NOT NULL,
  `CountryName` varchar(500) DEFAULT NULL,
  `CountryCode` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CountryList`
--

INSERT INTO `CountryList` (`CountryListId`, `CountryName`, `CountryCode`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Albania', 'AL'),
(3, 'Algeria', 'DZ'),
(4, 'American Samoa', 'AS'),
(5, 'Andorra', 'AD'),
(6, 'Angola', 'AO'),
(7, 'Anguilla', 'AI'),
(8, 'Antarctica', 'AQ'),
(9, 'Antigua and Barbuda', 'AG'),
(10, 'Argentina', 'AR'),
(11, 'Armenia', 'AM'),
(12, 'Aruba', 'AW'),
(13, 'Australia', 'AU'),
(14, 'Austria', 'AT'),
(15, 'Azerbaijan', 'AZ'),
(16, 'Bahamas', 'BS'),
(17, 'Bahrain', 'BH'),
(18, 'Bangladesh', 'BD'),
(19, 'Barbados', 'BB'),
(20, 'Belarus', 'BY'),
(21, 'Belgium', 'BE'),
(22, 'Belize', 'BZ'),
(23, 'Benin', 'BJ'),
(24, 'Bermuda', 'BM'),
(25, 'Bhutan', 'BT'),
(26, 'Bolivia', 'BO'),
(27, 'Bosnia and Herzegovina', 'BA'),
(28, 'Botswana', 'BW'),
(29, 'Bouvet Island', 'BV'),
(30, 'Brazil', 'BR'),
(31, 'British Indian Ocean Territory', 'IO'),
(32, 'Brunei', 'BN'),
(33, 'Bulgaria', 'BG'),
(34, 'Burkina Faso', 'BF'),
(35, 'Burundi', 'BI'),
(36, 'Cambodia', 'KH'),
(37, 'Cameroon', 'CM'),
(38, 'Canada', 'CA'),
(39, 'Cape Verde', 'CV'),
(40, 'Cayman Islands', 'KY'),
(41, 'Central African Republic', 'CF'),
(42, 'Chad', 'TD'),
(43, 'Chile', 'CL'),
(44, 'China', 'CN'),
(45, 'Christmas Island', 'CX'),
(46, 'Cocos (Keeling) Islands', 'CC'),
(47, 'Colombia', 'CO'),
(48, 'Comoros', 'KM'),
(49, 'Congo', 'CG'),
(50, 'Cook Islands', 'CK'),
(51, 'Costa Rica', 'CR'),
(52, 'Cote D''Ivoire (Ivory Coast)', 'CI'),
(53, 'Croatia (Hrvatska)', 'HR'),
(54, 'Cuba', 'CU'),
(55, 'Cyprus', 'CY'),
(56, 'Czech Republic', 'CZ'),
(57, 'Denmark', 'DK'),
(58, 'Djibouti', 'DJ'),
(59, 'Dominica', 'DM'),
(60, 'Dominican Republic', 'DO'),
(61, 'East Timor', 'TP'),
(62, 'Ecuador', 'EC'),
(63, 'Egypt', 'EG'),
(64, 'El Salvador', 'SV'),
(65, 'Equatorial Guinea', 'GQ'),
(66, 'Eritrea', 'ER'),
(67, 'Estonia', 'EE'),
(68, 'Ethiopia', 'ET'),
(69, 'Falkland Islands (Malvinas)', 'FK'),
(70, 'Faroe Islands', 'FO'),
(71, 'Fiji', 'FJ'),
(72, 'Finland', 'FI'),
(73, 'France', 'FR'),
(74, 'French Guiana', 'GF'),
(75, 'French Polynesia', 'PF'),
(76, 'French Southern Territories', 'TF'),
(77, 'Gabon', 'GA'),
(78, 'Gambia', 'GM'),
(79, 'Georgia', 'GE'),
(80, 'Germany', 'DE'),
(81, 'Ghana', 'GH'),
(82, 'Gibraltar', 'GI'),
(83, 'Great Britain (UK)', 'GB'),
(84, 'Greece', 'GR'),
(85, 'Greenland', 'GL'),
(86, 'Grenada', 'GD'),
(87, 'Guadeloupe', 'GP'),
(88, 'Guam', 'GU'),
(89, 'Guatemala', 'GT'),
(90, 'Guinea', 'GN'),
(91, 'Guinea-Bissau', 'GW'),
(92, 'Guyana', 'GY'),
(93, 'Haiti', 'HT'),
(94, 'Heard and McDonald Islands', 'HM'),
(95, 'Honduras', 'HN'),
(96, 'Hong Kong', 'HK'),
(97, 'Hungary', 'HU'),
(98, 'Iceland', 'IS'),
(99, 'India', 'IN'),
(100, 'Indonesia', 'ID'),
(101, 'Iran', 'IR'),
(102, 'Iraq', 'IQ'),
(103, 'Ireland', 'IE'),
(104, 'Israel', 'IL'),
(105, 'Italy', 'IT'),
(106, 'Jamaica', 'JM'),
(107, 'Japan', 'JP'),
(108, 'Jordan', 'JO'),
(109, 'Kazakhstan', 'KZ'),
(110, 'Kenya', 'KE'),
(111, 'Kiribati', 'KI'),
(112, 'Kuwait', 'KW'),
(113, 'Kyrgyzstan', 'KG'),
(114, 'Laos', 'LA'),
(115, 'Latvia', 'LV'),
(116, 'Lebanon', 'LB'),
(117, 'Lesotho', 'LS'),
(118, 'Liberia', 'LR'),
(119, 'Libya', 'LY'),
(120, 'Liechtenstein', 'LI'),
(121, 'Lithuania', 'LT'),
(122, 'Luxembourg', 'LU'),
(123, 'Macau', 'MO'),
(124, 'Macedonia', 'MK'),
(125, 'Madagascar', 'MG'),
(126, 'Malawi', 'MW'),
(127, 'Malaysia', 'MY'),
(128, 'Maldives', 'MV'),
(129, 'Mali', 'ML'),
(130, 'Malta', 'MT'),
(131, 'Marshall Islands', 'MH'),
(132, 'Martinique', 'MQ'),
(133, 'Mauritania', 'MR'),
(134, 'Mauritius', 'MU'),
(135, 'Mayotte', 'YT'),
(136, 'Mexico', 'MX'),
(137, 'Micronesia', 'FM'),
(138, 'Moldova', 'MD'),
(139, 'Monaco', 'MC'),
(140, 'Mongolia', 'MN'),
(141, 'Montserrat', 'MS'),
(142, 'Morocco', 'MA'),
(143, 'Mozambique', 'MZ'),
(144, 'Myanmar', 'MM'),
(145, 'Namibia', 'NA'),
(146, 'Nauru', 'NR'),
(147, 'Nepal', 'NP'),
(148, 'Netherlands', 'NL'),
(149, 'Netherlands Antilles', 'AN'),
(150, 'Neutral Zone', 'NT'),
(151, 'New Caledonia', 'NC'),
(152, 'New Zealand (Aotearoa)', 'NZ'),
(153, 'Nicaragua', 'NI'),
(154, 'Niger', 'NE'),
(155, 'Nigeria', 'NG'),
(156, 'Niue', 'NU'),
(157, 'Norfolk Island', 'NF'),
(158, 'North Korea', 'KP'),
(159, 'Northern Mariana Islands', 'MP'),
(160, 'Norway', 'NO'),
(161, 'Oman', 'OM'),
(162, 'Pakistan', 'PK'),
(163, 'Palau', 'PW'),
(164, 'Panama', 'PA'),
(165, 'Papua New Guinea', 'PG'),
(166, 'Paraguay', 'PY'),
(167, 'Peru', 'PE'),
(168, 'Philippines', 'PH'),
(169, 'Pitcairn', 'PN'),
(170, 'Poland', 'PL'),
(171, 'Portugal', 'PT'),
(172, 'Puerto Rico', 'PR'),
(173, 'Qatar', 'QA'),
(174, 'Reunion', 'RE'),
(175, 'Romania', 'RO'),
(176, 'Russia', 'RU'),
(177, 'Rwanda', 'RW'),
(178, 'Saint Kitts and Nevis', 'KN'),
(179, 'Saint Lucia', 'LC'),
(180, 'Saint Vincent and the Grenadines', 'VC'),
(181, 'Samoa', 'WS'),
(182, 'San Marino', 'SM'),
(183, 'Sao Tome and Principe', 'ST'),
(184, 'Saudi Arabia', 'SA'),
(185, 'Senegal', 'SN'),
(186, 'Seychelles', 'SC'),
(187, 'Sierra Leone', 'SL'),
(188, 'Singapore', 'SG'),
(189, 'Slovak Republic', 'SK'),
(190, 'Slovenia', 'SI'),
(191, 'Solomon Islands', 'Sb'),
(192, 'Somalia', 'SO'),
(193, 'South Africa', 'ZA'),
(194, 'South Georgia and South Sandwich Islands ', 'GS'),
(195, 'South Korea', 'KR'),
(196, 'Spain', 'ES'),
(197, 'Sri Lanka', 'LK'),
(198, 'St. Helena', 'SH'),
(199, 'St. Pierre and Miquelon', 'PM'),
(200, 'Sudan', 'SD'),
(201, 'Suriname', 'SR'),
(202, 'Svalbard and Jan Mayen Islands', 'SJ'),
(203, 'Swaziland', 'SZ'),
(204, 'Sweden', 'SE'),
(205, 'Switzerland', 'CH'),
(206, 'Syria', 'SY'),
(207, 'Taiwan', 'TW'),
(208, 'Tajikistan', 'TJ'),
(209, 'Tanzania', 'TZ'),
(210, 'Thailand', 'TH'),
(211, 'Togo', 'TG'),
(212, 'Tokelau', 'TK'),
(213, 'Tonga', 'TO'),
(214, 'Trinidad and Tobago', 'TT'),
(215, 'Tunisia', 'TN'),
(216, 'Turkey', 'TR'),
(217, 'Turkmenistan', 'TM'),
(218, 'Turks and Caicos Islands', 'TC'),
(219, 'Tuvalu', 'TV'),
(220, 'Uganda', 'UG'),
(221, 'Ukraine', 'UA'),
(222, 'United Arab Emirates', 'AE'),
(223, 'United Kingdom', 'UK'),
(224, 'United States', 'US'),
(225, 'Uruguay', 'UY'),
(226, 'US Minor Outlying Islands', 'UM'),
(227, 'Uzbekistan', 'UZ'),
(228, 'Vanuatu', 'VU'),
(229, 'Vatican City State (Holy See)', 'VA'),
(230, 'Venezuela', 'VE'),
(231, 'Vietnam', 'VN'),
(232, 'Virgin Islands (British)', 'VG'),
(233, 'Virgin Islands (U.S.)', 'VI'),
(234, 'Wallis and Futuna Islands', 'WF'),
(235, 'Western Sahara', 'EH'),
(236, 'Yemen', 'YE'),
(237, 'Yugoslavia', 'YU'),
(238, 'Zaire', 'ZR'),
(239, 'Zambia', 'ZM'),
(240, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `CountryVisaTypeList`
--

CREATE TABLE `CountryVisaTypeList` (
  `CountryVisaTypeListId` int(11) NOT NULL,
  `CountryListId` int(11) NOT NULL,
  `CountryVisaType` varchar(500) DEFAULT NULL,
  `CountryVisaTypeDescription` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CountryVisaTypeList`
--

INSERT INTO `CountryVisaTypeList` (`CountryVisaTypeListId`, `CountryListId`, `CountryVisaType`, `CountryVisaTypeDescription`) VALUES
(2, 224, 'B-2', 'tourism, vacation, pleasure visitor, medical treatment'),
(3, 99, 'T', 'tourism, tourist, non-business, vacation');

-- --------------------------------------------------------

--
-- Table structure for table `CustAppInfo`
--

CREATE TABLE `CustAppInfo` (
  `CustAppInfoId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) NOT NULL,
  `CountryListId` int(11) NOT NULL,
  `CountryVisaTypeListId` int(11) NOT NULL,
  `CustAppNumber` varchar(200) DEFAULT NULL,
  `Activated` enum('0','1') NOT NULL DEFAULT '1',
  `Completed` enum('0','1') NOT NULL DEFAULT '0',
  `Submitted` enum('0','1') NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `PercentageComplete` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CustAppInfo`
--

INSERT INTO `CustAppInfo` (`CustAppInfoId`, `CustProfileInfoId`, `CountryListId`, `CountryVisaTypeListId`, `CustAppNumber`, `Activated`, `Completed`, `Submitted`, `CreatedOn`, `ModifiedOn`, `PercentageComplete`) VALUES
(43, 8, 224, 2, 'APP008224B-2', '1', '0', '0', '2016-08-21 20:00:56', '2016-08-29 00:07:30', 0),
(44, 28, 224, 2, 'APP0028224B-2', '1', '0', '0', '2016-08-24 08:08:46', '2016-08-24 08:08:48', 0),
(45, 8, 99, 3, 'APP000899T', '1', '0', '0', '2016-08-26 11:51:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `CustFamilyInfo`
--

CREATE TABLE `CustFamilyInfo` (
  `CustFamilyInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `FatherSurname` varchar(200) DEFAULT NULL,
  `FatherGivenName` varchar(200) DEFAULT NULL,
  `FatherDateofBirth` varchar(100) DEFAULT NULL,
  `IsYourFatherInUS` varchar(50) DEFAULT NULL,
  `MotherSurname` varchar(200) DEFAULT NULL,
  `MotherGivenName` varchar(200) DEFAULT NULL,
  `IsYourMotherInUS` varchar(50) DEFAULT NULL,
  `ImmediateRelativesInUS_ApartFatherMother` varchar(50) DEFAULT NULL,
  `Relative_Name_1` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_1` varchar(200) DEFAULT NULL,
  `Relative_Status_1` varchar(100) DEFAULT NULL,
  `Relative_Name_2` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_2` varchar(200) DEFAULT NULL,
  `Relative_Status_2` varchar(100) DEFAULT NULL,
  `Relative_Name_3` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_3` varchar(200) DEFAULT NULL,
  `Relative_Status_3` varchar(100) DEFAULT NULL,
  `Relative_Name_4` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_4` varchar(200) DEFAULT NULL,
  `Relative_Status_4` varchar(100) DEFAULT NULL,
  `Spouse_FullName` varchar(200) DEFAULT NULL,
  `Spouse_DateOfBirth` varchar(100) DEFAULT NULL,
  `Spouse_Nationality` varchar(200) DEFAULT NULL,
  `Spouse_CityOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_CountryOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_Address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CustLocalInfo`
--

CREATE TABLE `CustLocalInfo` (
  `CustLocalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `CurrentLocation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CustPersonalInfo`
--

CREATE TABLE `CustPersonalInfo` (
  `CustPersonalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `First_Name` varchar(500) DEFAULT NULL,
  `Last_Name` varchar(500) DEFAULT NULL,
  `Full_Name_In_Native_Alphabet` varchar(500) DEFAULT NULL,
  `Other_Name_Used` varchar(50) DEFAULT NULL,
  `Other_Name_1` varchar(500) DEFAULT NULL,
  `Other_Name_2` varchar(500) DEFAULT NULL,
  `Other_Name_3` varchar(500) DEFAULT NULL,
  `Sex` varchar(50) DEFAULT NULL,
  `Marital_Status` varchar(50) DEFAULT NULL,
  `Date_Of_Birth` varchar(100) DEFAULT NULL,
  `City_Of_Birth` varchar(500) DEFAULT NULL,
  `State_Of_Birth` varchar(500) DEFAULT NULL,
  `Nationality` varchar(500) DEFAULT NULL,
  `Other_Nationalities` varchar(500) DEFAULT NULL,
  `National_Identification_Number` varchar(100) DEFAULT NULL,
  `US_Social_Security_Number` varchar(100) DEFAULT NULL,
  `US_Taxpayer_ID_Number` varchar(100) DEFAULT NULL,
  `Home_Address` varchar(500) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `State_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZIPCode` int(11) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `Same_Mailing_Address` varchar(50) DEFAULT NULL,
  `Mailing_Home_Address` varchar(500) DEFAULT NULL,
  `Mailing_City` varchar(200) DEFAULT NULL,
  `Mailing_State_Province` varchar(200) DEFAULT NULL,
  `Mailing_PostalZone_ZIPCode` int(11) DEFAULT NULL,
  `Mailing_Country` varchar(500) DEFAULT NULL,
  `Home_Phone_Number` varchar(50) DEFAULT NULL,
  `Work_Phone_Number` varchar(50) DEFAULT NULL,
  `Work_Fax_Number` varchar(50) DEFAULT NULL,
  `Mobile_Cell_Phone_Number` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(500) DEFAULT NULL,
  `Passport_Number` varchar(100) DEFAULT NULL,
  `Passport_Book_Number` varchar(100) DEFAULT NULL,
  `Country_Authority_Issued_Passport` varchar(500) DEFAULT NULL,
  `City_Issued_Passport` varchar(200) DEFAULT NULL,
  `State_Province_Issued_Passport` varchar(200) DEFAULT NULL,
  `Country_Issued_Passport` varchar(200) DEFAULT NULL,
  `Issuance_Date_Passport` varchar(100) DEFAULT NULL,
  `Expiration_Date_Passport` varchar(100) DEFAULT NULL,
  `Passport_Stolen_Lost` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CustPersonalInfo`
--

INSERT INTO `CustPersonalInfo` (`CustPersonalInfoId`, `CustAppInfoId`, `First_Name`, `Last_Name`, `Full_Name_In_Native_Alphabet`, `Other_Name_Used`, `Other_Name_1`, `Other_Name_2`, `Other_Name_3`, `Sex`, `Marital_Status`, `Date_Of_Birth`, `City_Of_Birth`, `State_Of_Birth`, `Nationality`, `Other_Nationalities`, `National_Identification_Number`, `US_Social_Security_Number`, `US_Taxpayer_ID_Number`, `Home_Address`, `City`, `State_Province`, `PostalZone_ZIPCode`, `Country`, `Same_Mailing_Address`, `Mailing_Home_Address`, `Mailing_City`, `Mailing_State_Province`, `Mailing_PostalZone_ZIPCode`, `Mailing_Country`, `Home_Phone_Number`, `Work_Phone_Number`, `Work_Fax_Number`, `Mobile_Cell_Phone_Number`, `Email_Address`, `Passport_Number`, `Passport_Book_Number`, `Country_Authority_Issued_Passport`, `City_Issued_Passport`, `State_Province_Issued_Passport`, `Country_Issued_Passport`, `Issuance_Date_Passport`, `Expiration_Date_Passport`, `Passport_Stolen_Lost`) VALUES
(21, 43, 'Harun', 'Razith', NULL, 'no', NULL, NULL, NULL, 'male', 'married', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 44, 'Stacie', '', NULL, NULL, NULL, NULL, NULL, 'female', 'married', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CustPreparerAppInfo`
--

CREATE TABLE `CustPreparerAppInfo` (
  `CustPreparerAppInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `AnyoneAssistInFillingApplication` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CustProfileInfo`
--

CREATE TABLE `CustProfileInfo` (
  `CustProfileInfoId` int(11) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `EmailAddress` varchar(500) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `DateOfBirth` varchar(100) NOT NULL,
  `Activated` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CustProfileInfo`
--

INSERT INTO `CustProfileInfo` (`CustProfileInfoId`, `UserName`, `FirstName`, `LastName`, `EmailAddress`, `Password`, `DateOfBirth`, `Activated`) VALUES
(8, 'hrazith', 'Harun', 'Razith', 'hrazith@gmail.com', 'roots', '12101977', '1'),
(15, 'hgwells', 'Hugh', 'Wells', 'hgwells@gmail.com', '12345', '12101984', '0'),
(16, 'broy', 'Bryan', 'Roy', 'broy@gmail.com', 'b12345', '12101977', '0'),
(17, 'broy', 'Bryan', 'Roy', 'broy@gmail.com', '12345', '12101977', '0'),
(20, 'jjames', 'Jesse', 'James', 'jjames@gmail.com', 'jj77', '', '1'),
(21, 'bwells', 'Brooke', 'Wells', 'bwells@gmail.com', 'bw77', '', '1'),
(24, 'jsmith', 'Jennifer ', 'Smith', 'jsmith@gmail.com', 'js77', '12101977', '1'),
(26, 'sgupta', 'Sachin', 'Gupta', 'sachin@gmail.com', 'sg1986', '8191986', '1'),
(27, 'suafzl', 'Sumaiya', 'Afzal', 'suafzl@gmail.com', 'sf1984', '10181984', '1'),
(28, 'stacy', 'Stacie', 'Tovar', 'stovar@gmail.com', 'st77', '8151984', '1');

-- --------------------------------------------------------

--
-- Table structure for table `CustTravelInfo`
--

CREATE TABLE `CustTravelInfo` (
  `CustTravelInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `Principal_Applicant` varchar(50) DEFAULT NULL,
  `Trip_Purpose_1` varchar(500) DEFAULT NULL,
  `Trip_Purpose_2` varchar(500) DEFAULT NULL,
  `Trip_Purpose_3` varchar(500) DEFAULT NULL,
  `Trip_Purpose_4` varchar(500) DEFAULT NULL,
  `Intended_Date_Of_Arrival` varchar(100) DEFAULT NULL,
  `Intended_Length_Of_Stay_US` varchar(100) DEFAULT NULL,
  `Address_of_US_Stay` varchar(500) DEFAULT NULL,
  `Person_Entity_Paying_US_Trip` varchar(200) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(500) DEFAULT NULL,
  `Relationship_To_You` varchar(100) DEFAULT NULL,
  `PayingPartyTripAddress_SameAsHomeMailingAddress` varchar(50) DEFAULT NULL,
  `PartyPayingAddress` varchar(500) DEFAULT NULL,
  `PartyPayingCity` varchar(200) DEFAULT NULL,
  `PartyPayingState_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZIPcode` int(11) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `OtherPersonTravellingWithYou` varchar(100) DEFAULT NULL,
  `TravellingPartofGroup_Organizantion` varchar(100) DEFAULT NULL,
  `PersonTravellingWithYou_Name_1` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_2` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_3` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_4` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Name_5` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_1` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_2` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_3` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_4` varchar(200) DEFAULT NULL,
  `PersonTravellingWithYou_Relationship_5` varchar(200) DEFAULT NULL,
  `EverBeenToUS` varchar(50) DEFAULT NULL,
  `EverBeenIssuedUSVisa` varchar(50) DEFAULT NULL,
  `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CustUSContactInfo`
--

CREATE TABLE `CustUSContactInfo` (
  `CustUSContactInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `ContactPersonNameInUS` varchar(200) DEFAULT NULL,
  `OrganizationNameInUS` varchar(200) DEFAULT NULL,
  `Relationship` varchar(200) DEFAULT NULL,
  `ContactAddressUS` varchar(500) DEFAULT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CustWorkEducationTrainingInfo`
--

CREATE TABLE `CustWorkEducationTrainingInfo` (
  `CustWorkEducationTrainingInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `Primary_Occupation` varchar(200) DEFAULT NULL,
  `PresentEmployer_SchoolName` varchar(200) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `State_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZipCode` int(11) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `MonthSalary_LocalCurrency` varchar(100) DEFAULT NULL,
  `BrifelyDescribeYourDuties` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Education`
--

CREATE TABLE `Education` (
  `EducationId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `InstitutionFullName` varchar(500) DEFAULT NULL,
  `InstitutionType` varchar(500) DEFAULT NULL,
  `InstitutionAccreditationStatus` varchar(500) DEFAULT NULL,
  `DateAttendedFrom` varchar(100) DEFAULT NULL,
  `DateAttendedTo` varchar(100) DEFAULT NULL,
  `MajorOrFieldOfStudy` varchar(500) DEFAULT NULL,
  `DegreeReceived` varchar(200) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Employment`
--

CREATE TABLE `Employment` (
  `EmploymentId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `EmploymentType` varchar(100) DEFAULT NULL,
  `EmploymentDateFrom` varchar(100) DEFAULT NULL,
  `EmploymentDateTo` varchar(100) DEFAULT NULL,
  `StreetAddress` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(500) DEFAULT NULL,
  `StateProvinceRegion` varchar(500) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `EmployerIsUniversityOrNonProfit` varchar(50) DEFAULT NULL,
  `TypeOfBusiness` varchar(500) DEFAULT NULL,
  `HoursPerWeek` int(11) DEFAULT NULL,
  `IsPositionPartTime` varchar(50) DEFAULT NULL,
  `JobTitle` varchar(200) DEFAULT NULL,
  `CurrentAnnualBaseSalary` varchar(100) DEFAULT NULL,
  `DetailJobDuties` varchar(8000) DEFAULT NULL,
  `TechnologiesUsed` varchar(8000) DEFAULT NULL,
  `SupervisorName` varchar(500) DEFAULT NULL,
  `SupervisorPhoneNumber` varchar(100) DEFAULT NULL,
  `SuperVisorJobTitle` varchar(200) DEFAULT NULL,
  `AnyInterruptionsInEmploymentWithEmployer` varchar(50) DEFAULT NULL,
  `WorkingOutsideTheUS` varchar(50) DEFAULT NULL,
  `IfWorkingOutsideDoesItInvolveSupervision` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `InternationTravel`
--

CREATE TABLE `InternationTravel` (
  `InternationalTravelId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `PossibilityOfInternationTravelIn6Months` varchar(50) DEFAULT NULL,
  `DateofIntendedDeparture` varchar(100) DEFAULT NULL,
  `ExpectedLengthOfTrip` varchar(200) DEFAULT NULL,
  `PurposeOfTripIncludingTravelersName` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OverseasPermanentAddress`
--

CREATE TABLE `OverseasPermanentAddress` (
  `OverseasPermanentAddressId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `OverseasPermanentAddressDateFrom` varchar(100) DEFAULT NULL,
  `OverseasPermanentAddressDateTo` varchar(100) DEFAULT NULL,
  `StreetAddress` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(500) DEFAULT NULL,
  `StateProvinceRegion` varchar(500) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `PlanOfChangingPlaceOfResidenceInNext4Months` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PersonalDetail`
--

CREATE TABLE `PersonalDetail` (
  `PersonalDetailId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `FirstName` varchar(500) DEFAULT NULL,
  `MiddleName` varchar(500) DEFAULT NULL,
  `LastName` varchar(500) DEFAULT NULL,
  `MaidenName` varchar(500) DEFAULT NULL,
  `AliasFirstName` varchar(500) DEFAULT NULL,
  `AliasLastName` varchar(500) DEFAULT NULL,
  `OtherName1` varchar(500) DEFAULT NULL,
  `OtherName2` varchar(500) DEFAULT NULL,
  `OtherName3` varchar(500) DEFAULT NULL,
  `EmailAddress` varchar(500) DEFAULT NULL,
  `WorkPhone` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(50) DEFAULT NULL,
  `MobilePhone` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `DateofBirth` varchar(100) DEFAULT NULL,
  `CityofBirth` varchar(500) DEFAULT NULL,
  `StateofBirth` varchar(500) DEFAULT NULL,
  `CountryofBirth` varchar(500) DEFAULT NULL,
  `Nationality` varchar(500) DEFAULT NULL,
  `PermanentResident_Immigrant` varchar(500) DEFAULT NULL,
  `RecentCitizenship_PR_Immigrant` varchar(500) DEFAULT NULL,
  `PassportNumber` varchar(100) DEFAULT NULL,
  `PassportIssueDate` varchar(100) DEFAULT NULL,
  `PassportExpirationDate` varchar(100) DEFAULT NULL,
  `PassportIssuedCity` varchar(200) DEFAULT NULL,
  `PassportIssuedState` varchar(200) DEFAULT NULL,
  `PassportIssuedCountry` varchar(200) DEFAULT NULL,
  `BlankPagesInPassport` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USHomeAddress`
--

CREATE TABLE `USHomeAddress` (
  `USHomeAddressId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `HaveUSHomeAddress` varchar(50) DEFAULT NULL,
  `USHomeAddressDateFrom` varchar(100) DEFAULT NULL,
  `USHomeAddressDateTo` varchar(100) DEFAULT NULL,
  `StreetAddress` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(500) DEFAULT NULL,
  `StateProvinceRegion` varchar(500) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `SameAsCurrentmaiingAddress` varchar(50) DEFAULT NULL,
  `Address2_1` varchar(500) DEFAULT NULL,
  `City_1` varchar(500) DEFAULT NULL,
  `StateProvinceRegion_1` varchar(500) DEFAULT NULL,
  `ZipCode_1` varchar(50) DEFAULT NULL,
  `Country_1` varchar(500) DEFAULT NULL,
  `PhoneNumberWithThisAddress` varchar(50) DEFAULT NULL,
  `PlanOfChangingPlaceOfResidenceInNext4Months` varchar(50) DEFAULT NULL,
  `IfYesMovingDateAndNewAddress` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `VisaApplication`
--

CREATE TABLE `VisaApplication` (
  `VisaApplicationId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `ResidingOutsideUS` varchar(50) DEFAULT NULL,
  `USConsulateLocationOutsideUS` varchar(500) DEFAULT NULL,
  `AppliedNonImmigrantUSVisa` varchar(50) DEFAULT NULL,
  `VisaCancelledDeniedRejected` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `VisaInformation`
--

CREATE TABLE `VisaInformation` (
  `VisaInformationId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `EverEnteredUS` varchar(50) DEFAULT NULL,
  `DateofLastEntryUS` varchar(100) DEFAULT NULL,
  `I94Number` int(11) DEFAULT NULL,
  `CurrentUSImmigrationStatus` varchar(100) DEFAULT NULL,
  `LastEntryUSCity` varchar(500) DEFAULT NULL,
  `LastEntryUSState` varchar(500) DEFAULT NULL,
  `ExpirationStatusI94_I688` varchar(100) DEFAULT NULL,
  `VisaNumber` varchar(100) DEFAULT NULL,
  `VisaIssuanceCity` varchar(500) DEFAULT NULL,
  `VisaIssuanceCountry` varchar(500) DEFAULT NULL,
  `ViaIssuanceDate` varchar(100) DEFAULT NULL,
  `VisaExpirationDate` varchar(100) DEFAULT NULL,
  `EverFiledI140ImmigrationPetition` varchar(50) DEFAULT NULL,
  `I140ApprovedDenied` varchar(50) DEFAULT NULL,
  `I140PriorityDate` varchar(100) DEFAULT NULL,
  `I140ReceiptCategoryPriorityDate` varchar(1000) DEFAULT NULL,
  `EverAppliedGreenCardOrPermanentResidencyByYou_Family` varchar(50) DEFAULT NULL,
  `DatePlaceOutcomeOfGreenCardOrPermanentResidency` varchar(1000) DEFAULT NULL,
  `F1Status_CPTTraining` varchar(50) DEFAULT NULL,
  `CPTWithGraduateDegree` varchar(50) DEFAULT NULL,
  `StartedCPTAfterDegreeProgram` varchar(50) DEFAULT NULL,
  `IfinF1_AppliedOTP` varchar(50) DEFAULT NULL,
  `I765Approved_Pending` varchar(50) DEFAULT NULL,
  `I765ReceiptNumber` varchar(100) DEFAULT NULL,
  `IfI765Approved_NoOfDaysUnemployedAfterEAD` int(11) DEFAULT NULL,
  `J1orJ2Visa` varchar(50) DEFAULT NULL,
  `TwoYrHomeResidencyRequirement` varchar(50) DEFAULT NULL,
  `J1orJ2SubmittedApplicationForWaiver` varchar(50) DEFAULT NULL,
  `F1OrJ1SEVISNumber` varchar(100) DEFAULT NULL,
  `EverBeenInUSInHOrLStatus` varchar(50) DEFAULT NULL,
  `EverWorkedForNonProfitOrgResearchOrgUniversityInH1BStatus` varchar(50) DEFAULT NULL,
  `FiledH1BDuringPreviousFiscalYear` varchar(50) DEFAULT NULL,
  `AppliedH1BPursuantToApprovedPetitionAndEnterUS` varchar(50) DEFAULT NULL,
  `StartedEmploymentInUS` varchar(50) DEFAULT NULL,
  `NotStartedEmploymentSelectReason` varchar(500) DEFAULT NULL,
  `HOrLPetitionDenied` varchar(50) DEFAULT NULL,
  `IfYesEnterReason` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CountryList`
--
ALTER TABLE `CountryList`
  ADD PRIMARY KEY (`CountryListId`);

--
-- Indexes for table `CountryVisaTypeList`
--
ALTER TABLE `CountryVisaTypeList`
  ADD PRIMARY KEY (`CountryVisaTypeListId`),
  ADD KEY `CountryListId` (`CountryListId`);

--
-- Indexes for table `CustAppInfo`
--
ALTER TABLE `CustAppInfo`
  ADD PRIMARY KEY (`CustAppInfoId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`),
  ADD KEY `CountryVisaTypeListId` (`CountryVisaTypeListId`),
  ADD KEY `CountryListId` (`CountryListId`);

--
-- Indexes for table `CustFamilyInfo`
--
ALTER TABLE `CustFamilyInfo`
  ADD PRIMARY KEY (`CustFamilyInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `CustLocalInfo`
--
ALTER TABLE `CustLocalInfo`
  ADD PRIMARY KEY (`CustLocalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `CustPersonalInfo`
--
ALTER TABLE `CustPersonalInfo`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `CustPreparerAppInfo`
--
ALTER TABLE `CustPreparerAppInfo`
  ADD PRIMARY KEY (`CustPreparerAppInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `CustProfileInfo`
--
ALTER TABLE `CustProfileInfo`
  ADD PRIMARY KEY (`CustProfileInfoId`);

--
-- Indexes for table `CustTravelInfo`
--
ALTER TABLE `CustTravelInfo`
  ADD PRIMARY KEY (`CustTravelInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `CustUSContactInfo`
--
ALTER TABLE `CustUSContactInfo`
  ADD PRIMARY KEY (`CustUSContactInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `CustWorkEducationTrainingInfo`
--
ALTER TABLE `CustWorkEducationTrainingInfo`
  ADD PRIMARY KEY (`CustWorkEducationTrainingInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `Education`
--
ALTER TABLE `Education`
  ADD PRIMARY KEY (`EducationId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `Employment`
--
ALTER TABLE `Employment`
  ADD PRIMARY KEY (`EmploymentId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `InternationTravel`
--
ALTER TABLE `InternationTravel`
  ADD PRIMARY KEY (`InternationalTravelId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `OverseasPermanentAddress`
--
ALTER TABLE `OverseasPermanentAddress`
  ADD PRIMARY KEY (`OverseasPermanentAddressId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `PersonalDetail`
--
ALTER TABLE `PersonalDetail`
  ADD PRIMARY KEY (`PersonalDetailId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `USHomeAddress`
--
ALTER TABLE `USHomeAddress`
  ADD PRIMARY KEY (`USHomeAddressId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `VisaApplication`
--
ALTER TABLE `VisaApplication`
  ADD PRIMARY KEY (`VisaApplicationId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `VisaInformation`
--
ALTER TABLE `VisaInformation`
  ADD PRIMARY KEY (`VisaInformationId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CountryList`
--
ALTER TABLE `CountryList`
  MODIFY `CountryListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `CountryVisaTypeList`
--
ALTER TABLE `CountryVisaTypeList`
  MODIFY `CountryVisaTypeListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `CustAppInfo`
--
ALTER TABLE `CustAppInfo`
  MODIFY `CustAppInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `CustFamilyInfo`
--
ALTER TABLE `CustFamilyInfo`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CustLocalInfo`
--
ALTER TABLE `CustLocalInfo`
  MODIFY `CustLocalInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CustPersonalInfo`
--
ALTER TABLE `CustPersonalInfo`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `CustPreparerAppInfo`
--
ALTER TABLE `CustPreparerAppInfo`
  MODIFY `CustPreparerAppInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CustProfileInfo`
--
ALTER TABLE `CustProfileInfo`
  MODIFY `CustProfileInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `CustTravelInfo`
--
ALTER TABLE `CustTravelInfo`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CustUSContactInfo`
--
ALTER TABLE `CustUSContactInfo`
  MODIFY `CustUSContactInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CustWorkEducationTrainingInfo`
--
ALTER TABLE `CustWorkEducationTrainingInfo`
  MODIFY `CustWorkEducationTrainingInfoId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Education`
--
ALTER TABLE `Education`
  MODIFY `EducationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Employment`
--
ALTER TABLE `Employment`
  MODIFY `EmploymentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `InternationTravel`
--
ALTER TABLE `InternationTravel`
  MODIFY `InternationalTravelId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `OverseasPermanentAddress`
--
ALTER TABLE `OverseasPermanentAddress`
  MODIFY `OverseasPermanentAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PersonalDetail`
--
ALTER TABLE `PersonalDetail`
  MODIFY `PersonalDetailId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `USHomeAddress`
--
ALTER TABLE `USHomeAddress`
  MODIFY `USHomeAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VisaApplication`
--
ALTER TABLE `VisaApplication`
  MODIFY `VisaApplicationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VisaInformation`
--
ALTER TABLE `VisaInformation`
  MODIFY `VisaInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `CountryVisaTypeList`
--
ALTER TABLE `CountryVisaTypeList`
  ADD CONSTRAINT `countryvisatypelist_ibfk_1` FOREIGN KEY (`CountryListId`) REFERENCES `CountryList` (`CountryListId`);

--
-- Constraints for table `CustAppInfo`
--
ALTER TABLE `CustAppInfo`
  ADD CONSTRAINT `custappinfo_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`),
  ADD CONSTRAINT `custappinfo_ibfk_2` FOREIGN KEY (`CountryVisaTypeListId`) REFERENCES `CountryVisaTypeList` (`CountryVisaTypeListId`),
  ADD CONSTRAINT `custappinfo_ibfk_3` FOREIGN KEY (`CountryListId`) REFERENCES `CountryList` (`CountryListId`);

--
-- Constraints for table `CustFamilyInfo`
--
ALTER TABLE `CustFamilyInfo`
  ADD CONSTRAINT `custfamilyinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `CustAppInfo` (`CustAppInfoId`);

--
-- Constraints for table `CustLocalInfo`
--
ALTER TABLE `CustLocalInfo`
  ADD CONSTRAINT `custlocalinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `CustAppInfo` (`CustAppInfoId`);

--
-- Constraints for table `CustPersonalInfo`
--
ALTER TABLE `CustPersonalInfo`
  ADD CONSTRAINT `custpersonalinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `CustAppInfo` (`CustAppInfoId`);

--
-- Constraints for table `CustPreparerAppInfo`
--
ALTER TABLE `CustPreparerAppInfo`
  ADD CONSTRAINT `custpreparerappinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `CustAppInfo` (`CustAppInfoId`);

--
-- Constraints for table `CustTravelInfo`
--
ALTER TABLE `CustTravelInfo`
  ADD CONSTRAINT `custtravelinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `CustAppInfo` (`CustAppInfoId`);

--
-- Constraints for table `CustUSContactInfo`
--
ALTER TABLE `CustUSContactInfo`
  ADD CONSTRAINT `custuscontactinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `CustAppInfo` (`CustAppInfoId`);

--
-- Constraints for table `CustWorkEducationTrainingInfo`
--
ALTER TABLE `CustWorkEducationTrainingInfo`
  ADD CONSTRAINT `custworkeducationtraininginfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `CustAppInfo` (`CustAppInfoId`);

--
-- Constraints for table `Education`
--
ALTER TABLE `Education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

--
-- Constraints for table `Employment`
--
ALTER TABLE `Employment`
  ADD CONSTRAINT `employment_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

--
-- Constraints for table `InternationTravel`
--
ALTER TABLE `InternationTravel`
  ADD CONSTRAINT `internationtravel_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

--
-- Constraints for table `OverseasPermanentAddress`
--
ALTER TABLE `OverseasPermanentAddress`
  ADD CONSTRAINT `overseaspermanentaddress_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

--
-- Constraints for table `PersonalDetail`
--
ALTER TABLE `PersonalDetail`
  ADD CONSTRAINT `personaldetail_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

--
-- Constraints for table `USHomeAddress`
--
ALTER TABLE `USHomeAddress`
  ADD CONSTRAINT `ushomeaddress_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

--
-- Constraints for table `VisaApplication`
--
ALTER TABLE `VisaApplication`
  ADD CONSTRAINT `visaapplication_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

--
-- Constraints for table `VisaInformation`
--
ALTER TABLE `VisaInformation`
  ADD CONSTRAINT `visainformation_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `CustProfileInfo` (`CustProfileInfoId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
