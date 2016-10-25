-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2016 at 02:28 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `apppercent`
--

CREATE TABLE `apppercent` (
  `Id` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) DEFAULT NULL,
  `CountryListId` int(11) DEFAULT NULL,
  `CountryVisaTypeListId` int(11) DEFAULT NULL,
  `FormId` int(11) NOT NULL,
  `AppPercentageCompleted` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countrylist`
--

CREATE TABLE `countrylist` (
  `CountryListId` int(11) NOT NULL,
  `CountryName` varchar(500) DEFAULT NULL,
  `CountryCode` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countrylist`
--

INSERT INTO `countrylist` (`CountryListId`, `CountryName`, `CountryCode`) VALUES
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
-- Table structure for table `countryvisatypelist`
--

CREATE TABLE `countryvisatypelist` (
  `CountryVisaTypeListId` int(11) NOT NULL,
  `CountryListId` int(11) NOT NULL,
  `CountryVisaType` varchar(500) DEFAULT NULL,
  `CountryVisaTypeDescription` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countryvisatypelist`
--

INSERT INTO `countryvisatypelist` (`CountryVisaTypeListId`, `CountryListId`, `CountryVisaType`, `CountryVisaTypeDescription`) VALUES
(2, 224, 'B-2', 'tourism, vacation, pleasure visitor, medical treatment'),
(3, 99, 'T', 'tourism, tourist, non-business, vacation'),
(4, 224, 'F-1', 'student visa, students, including high-school, universities, college, academic institutions and programs and language training');

-- --------------------------------------------------------

--
-- Table structure for table `custappinfo`
--

CREATE TABLE `custappinfo` (
  `CustAppInfoId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) NOT NULL,
  `FormId` int(11) DEFAULT NULL,
  `CountryListId` int(11) NOT NULL,
  `CountryVisaTypeListId` int(11) NOT NULL,
  `CustAppNumber` varchar(200) DEFAULT NULL,
  `Activated` enum('0','1') NOT NULL DEFAULT '1',
  `Completed` enum('0','1') NOT NULL DEFAULT '0',
  `Submitted` enum('0','1') NOT NULL DEFAULT '0',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custappinfo`
--

INSERT INTO `custappinfo` (`CustAppInfoId`, `CustProfileInfoId`, `FormId`, `CountryListId`, `CountryVisaTypeListId`, `CustAppNumber`, `Activated`, `Completed`, `Submitted`, `CreatedOn`, `ModifiedOn`) VALUES
(9, 1, 1, 224, 2, 'APP001224B-2', '1', '0', '0', '2016-10-22 17:40:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custfamilyinfo1`
--

CREATE TABLE `custfamilyinfo1` (
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
  `Relative_Status_3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custfamilyinfo1`
--

INSERT INTO `custfamilyinfo1` (`CustFamilyInfoId`, `CustAppInfoId`, `FatherSurname`, `FatherGivenName`, `FatherDateofBirth`, `IsYourFatherInUS`, `MotherSurname`, `MotherGivenName`, `IsYourMotherInUS`, `ImmediateRelativesInUS_ApartFatherMother`, `Relative_Name_1`, `Relationship_To_Relative_1`, `Relative_Status_1`, `Relative_Name_2`, `Relationship_To_Relative_2`, `Relative_Status_2`, `Relative_Name_3`, `Relationship_To_Relative_3`, `Relative_Status_3`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custfamilyinfo2`
--

CREATE TABLE `custfamilyinfo2` (
  `CustFamilyInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `Relative_Name_4` varchar(200) DEFAULT NULL,
  `Relationship_To_Relative_4` varchar(200) DEFAULT NULL,
  `Relative_Status_4` varchar(100) DEFAULT NULL,
  `Spouse_FullName` varchar(200) DEFAULT NULL,
  `Spouse_DateOfBirth` varchar(100) DEFAULT NULL,
  `Spouse_Nationality` varchar(200) DEFAULT NULL,
  `Spouse_CityOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_CountryOfBirth` varchar(200) DEFAULT NULL,
  `Spouse_Address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custfamilyinfo2`
--

INSERT INTO `custfamilyinfo2` (`CustFamilyInfoId`, `CustAppInfoId`, `Relative_Name_4`, `Relationship_To_Relative_4`, `Relative_Status_4`, `Spouse_FullName`, `Spouse_DateOfBirth`, `Spouse_Nationality`, `Spouse_CityOfBirth`, `Spouse_CountryOfBirth`, `Spouse_Address`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custlocalinfo`
--

CREATE TABLE `custlocalinfo` (
  `CustLocalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `CurrentLocation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custlocalinfo`
--

INSERT INTO `custlocalinfo` (`CustLocalInfoId`, `CustAppInfoId`, `CurrentLocation`) VALUES
(1, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `custpersonalinfo1`
--

CREATE TABLE `custpersonalinfo1` (
  `CustPersonalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `First_Name` varchar(500) DEFAULT NULL,
  `Last_Name` varchar(500) DEFAULT NULL,
  `Full_Name_In_Native_Language` varchar(500) DEFAULT NULL,
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
  `City` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo1`
--

INSERT INTO `custpersonalinfo1` (`CustPersonalInfoId`, `CustAppInfoId`, `First_Name`, `Last_Name`, `Full_Name_In_Native_Language`, `Other_Name_Used`, `Other_Name_1`, `Other_Name_2`, `Other_Name_3`, `Sex`, `Marital_Status`, `Date_Of_Birth`, `City_Of_Birth`, `State_Of_Birth`, `Nationality`, `Other_Nationalities`, `National_Identification_Number`, `US_Social_Security_Number`, `US_Taxpayer_ID_Number`, `Home_Address`, `City`) VALUES
(1, 9, 'Harun', 'Razith', '', '', '', '', '', 'male', 'married', '', '', '', 'Choose...', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custpersonalinfo2`
--

CREATE TABLE `custpersonalinfo2` (
  `CustPersonalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `State_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZIPCode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `Same_Mailing_Address` varchar(50) DEFAULT NULL,
  `Mailing_Home_Address` varchar(500) DEFAULT NULL,
  `Mailing_City` varchar(200) DEFAULT NULL,
  `Mailing_State_Province` varchar(200) DEFAULT NULL,
  `Mailing_PostalZone_ZIPCode` varchar(50) DEFAULT NULL,
  `Mailing_Country` varchar(500) DEFAULT NULL,
  `Home_Phone_Number` varchar(50) DEFAULT NULL,
  `Work_Phone_Number` varchar(50) DEFAULT NULL,
  `Work_Fax_Number` varchar(50) DEFAULT NULL,
  `Mobile_Cell_Phone_Number` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(500) DEFAULT NULL,
  `Passport_Number` varchar(100) DEFAULT NULL,
  `Passport_Book_Number` varchar(100) DEFAULT NULL,
  `Country_Authority_Issued_Passport` varchar(500) DEFAULT NULL,
  `City_Issued_Passport` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo2`
--

INSERT INTO `custpersonalinfo2` (`CustPersonalInfoId`, `CustAppInfoId`, `State_Province`, `PostalZone_ZIPCode`, `Country`, `Same_Mailing_Address`, `Mailing_Home_Address`, `Mailing_City`, `Mailing_State_Province`, `Mailing_PostalZone_ZIPCode`, `Mailing_Country`, `Home_Phone_Number`, `Work_Phone_Number`, `Work_Fax_Number`, `Mobile_Cell_Phone_Number`, `Email_Address`, `Passport_Number`, `Passport_Book_Number`, `Country_Authority_Issued_Passport`, `City_Issued_Passport`) VALUES
(1, 9, '', '', '', '', '', '', '', '', 'Choose...', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custpersonalinfo3`
--

CREATE TABLE `custpersonalinfo3` (
  `CustPersonalInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `State_Province_Issued_Passport` varchar(200) DEFAULT NULL,
  `Country_Issued_Passport` varchar(200) DEFAULT NULL,
  `Issuance_Date_Passport` varchar(100) DEFAULT NULL,
  `Expiration_Date_Passport` varchar(100) DEFAULT NULL,
  `Passport_Stolen_Lost` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpersonalinfo3`
--

INSERT INTO `custpersonalinfo3` (`CustPersonalInfoId`, `CustAppInfoId`, `State_Province_Issued_Passport`, `Country_Issued_Passport`, `Issuance_Date_Passport`, `Expiration_Date_Passport`, `Passport_Stolen_Lost`) VALUES
(1, 9, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custpreparerappinfo`
--

CREATE TABLE `custpreparerappinfo` (
  `CustPrepareAppInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `AnyoneAssistInFillingApplication` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custpreparerappinfo`
--

INSERT INTO `custpreparerappinfo` (`CustPrepareAppInfoId`, `CustAppInfoId`, `AnyoneAssistInFillingApplication`) VALUES
(1, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `custprofileinfo`
--

CREATE TABLE `custprofileinfo` (
  `CustProfileInfoId` int(11) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `EmailAddress` varchar(500) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `DateOfBirth` varchar(100) NOT NULL,
  `Activated` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custprofileinfo`
--

INSERT INTO `custprofileinfo` (`CustProfileInfoId`, `UserName`, `FirstName`, `LastName`, `EmailAddress`, `Password`, `DateOfBirth`, `Activated`) VALUES
(1, 'hrazith', 'Harun', 'Razith', 'hrazith@gmail.com', 'hr77', '12101948', '1');

-- --------------------------------------------------------

--
-- Table structure for table `custtravelinfo1`
--

CREATE TABLE `custtravelinfo1` (
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
  `PostalZone_ZIPcode` varchar(50) DEFAULT NULL,
  `Country` varchar(500) DEFAULT NULL,
  `OtherPersonTravellingWithYou` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custtravelinfo1`
--

INSERT INTO `custtravelinfo1` (`CustTravelInfoId`, `CustAppInfoId`, `Principal_Applicant`, `Trip_Purpose_1`, `Trip_Purpose_2`, `Trip_Purpose_3`, `Trip_Purpose_4`, `Intended_Date_Of_Arrival`, `Intended_Length_Of_Stay_US`, `Address_of_US_Stay`, `Person_Entity_Paying_US_Trip`, `Telephone`, `Email_Address`, `Relationship_To_You`, `PayingPartyTripAddress_SameAsHomeMailingAddress`, `PartyPayingAddress`, `PartyPayingCity`, `PartyPayingState_Province`, `PostalZone_ZIPcode`, `Country`, `OtherPersonTravellingWithYou`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custtravelinfo2`
--

CREATE TABLE `custtravelinfo2` (
  `CustTravelInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custtravelinfo2`
--

INSERT INTO `custtravelinfo2` (`CustTravelInfoId`, `CustAppInfoId`, `TravellingPartofGroup_Organizantion`, `PersonTravellingWithYou_Name_1`, `PersonTravellingWithYou_Name_2`, `PersonTravellingWithYou_Name_3`, `PersonTravellingWithYou_Name_4`, `PersonTravellingWithYou_Name_5`, `PersonTravellingWithYou_Relationship_1`, `PersonTravellingWithYou_Relationship_2`, `PersonTravellingWithYou_Relationship_3`, `PersonTravellingWithYou_Relationship_4`, `PersonTravellingWithYou_Relationship_5`, `EverBeenToUS`, `EverBeenIssuedUSVisa`, `EverBeenRefusedUSVisa_RefusedAdmissionToUS_WithdrawnApplication`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custuscontactinfo`
--

CREATE TABLE `custuscontactinfo` (
  `CustUSContactInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `ContactPersonNameInUS` varchar(200) DEFAULT NULL,
  `OrganizationNameInUS` varchar(200) DEFAULT NULL,
  `Relationship` varchar(200) DEFAULT NULL,
  `ContactAddressUS` varchar(500) DEFAULT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custuscontactinfo`
--

INSERT INTO `custuscontactinfo` (`CustUSContactInfoId`, `CustAppInfoId`, `ContactPersonNameInUS`, `OrganizationNameInUS`, `Relationship`, `ContactAddressUS`, `Phone_Number`, `Email_Address`) VALUES
(1, 9, '', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custworkeducationtraininginfo`
--

CREATE TABLE `custworkeducationtraininginfo` (
  `CustWorkEducationTrainingInfoId` int(11) NOT NULL,
  `CustAppInfoId` int(11) NOT NULL,
  `Primary_Occupation` varchar(200) DEFAULT NULL,
  `PresentEmployer_SchoolName` varchar(200) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `State_Province` varchar(200) DEFAULT NULL,
  `PostalZone_ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `MonthSalary_LocalCurrency` varchar(100) DEFAULT NULL,
  `BrifelyDescribeYourDuties` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custworkeducationtraininginfo`
--

INSERT INTO `custworkeducationtraininginfo` (`CustWorkEducationTrainingInfoId`, `CustAppInfoId`, `Primary_Occupation`, `PresentEmployer_SchoolName`, `Address`, `City`, `State_Province`, `PostalZone_ZipCode`, `Country`, `MonthSalary_LocalCurrency`, `BrifelyDescribeYourDuties`) VALUES
(1, 9, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ds160menuinfo`
--

CREATE TABLE `ds160menuinfo` (
  `DS160MenuInfoId` int(11) NOT NULL,
  `MenuDescription` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ds160menuinfo`
--

INSERT INTO `ds160menuinfo` (`DS160MenuInfoId`, `MenuDescription`) VALUES
(1, 'Personal, Address, Phone and Passport Information'),
(2, 'Travel Information'),
(3, 'U.S. Contact Information'),
(4, 'Family Information'),
(5, 'Work / Education / Training Information'),
(6, 'Security and Background Information'),
(7, 'Location Information'),
(8, 'Preparer of Application');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `EducationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
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
-- Table structure for table `employment1`
--

CREATE TABLE `employment1` (
  `EmploymentId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
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
  `HoursPerWeek` varchar(50) DEFAULT NULL,
  `IsPositionPartTime` varchar(50) DEFAULT NULL,
  `JobTitle` varchar(200) DEFAULT NULL,
  `CurrentAnnualBaseSalary` varchar(100) DEFAULT NULL,
  `DetailJobDuties` varchar(8000) DEFAULT NULL,
  `TechnologiesUsed` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employment2`
--

CREATE TABLE `employment2` (
  `EmploymentId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `SupervisorName` varchar(500) DEFAULT NULL,
  `SupervisorPhoneNumber` varchar(100) DEFAULT NULL,
  `SuperVisorJobTitle` varchar(200) DEFAULT NULL,
  `AnyInterruptionsInEmploymentWithEmployer` varchar(50) DEFAULT NULL,
  `WorkingOutsideTheUS` varchar(50) DEFAULT NULL,
  `IfWorkingOutsideDoesItInvolveSupervision` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eventlog`
--

CREATE TABLE `eventlog` (
  `EventlogId` int(11) NOT NULL,
  `CustProfileInfoId` int(11) NOT NULL,
  `EventType` varchar(200) DEFAULT NULL,
  `EventDescription` varchar(8000) DEFAULT NULL,
  `EventLogDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `FormId` int(11) NOT NULL,
  `FormType` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`FormId`, `FormType`) VALUES
(1, 'DS160'),
(2, 'H1B');

-- --------------------------------------------------------

--
-- Table structure for table `internationtravel`
--

CREATE TABLE `internationtravel` (
  `InternationalTravelId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `PossibilityOfInternationTravelIn6Months` varchar(50) DEFAULT NULL,
  `DateofIntendedDeparture` varchar(100) DEFAULT NULL,
  `ExpectedLengthOfTrip` varchar(200) DEFAULT NULL,
  `PurposeOfTripIncludingTravelersName` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `overseaspermanentaddress`
--

CREATE TABLE `overseaspermanentaddress` (
  `OverseasPermanentAddressId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
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
-- Table structure for table `personaldetail1`
--

CREATE TABLE `personaldetail1` (
  `PersonalDetailId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
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
  `CountryofBirth` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personaldetail2`
--

CREATE TABLE `personaldetail2` (
  `PersonalDetailId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
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
-- Table structure for table `ushomeaddress`
--

CREATE TABLE `ushomeaddress` (
  `USHomeAddressId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
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
-- Table structure for table `visaapplication`
--

CREATE TABLE `visaapplication` (
  `VisaApplicationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `ResidingOutsideUS` varchar(50) DEFAULT NULL,
  `USConsulateLocationOutsideUS` varchar(500) DEFAULT NULL,
  `AppliedNonImmigrantUSVisa` varchar(50) DEFAULT NULL,
  `VisaCancelledDeniedRejected` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visainformation1`
--

CREATE TABLE `visainformation1` (
  `VisaInformationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `EverEnteredUS` varchar(50) DEFAULT NULL,
  `DateofLastEntryUS` varchar(100) DEFAULT NULL,
  `I94Number` varchar(50) DEFAULT NULL,
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
  `DatePlaceOutcomeOfGreenCardOrPermanentResidency` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visainformation2`
--

CREATE TABLE `visainformation2` (
  `VisaInformationId` int(11) NOT NULL,
  `CustAppInfoId` int(11) DEFAULT NULL,
  `F1Status_CPTTraining` varchar(50) DEFAULT NULL,
  `CPTWithGraduateDegree` varchar(50) DEFAULT NULL,
  `StartedCPTAfterDegreeProgram` varchar(50) DEFAULT NULL,
  `IfinF1_AppliedOTP` varchar(50) DEFAULT NULL,
  `I765Approved_Pending` varchar(50) DEFAULT NULL,
  `I765ReceiptNumber` varchar(100) DEFAULT NULL,
  `IfI765Approved_NoOfDaysUnemployedAfterEAD` varchar(50) DEFAULT NULL,
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
-- Indexes for table `apppercent`
--
ALTER TABLE `apppercent`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `countrylist`
--
ALTER TABLE `countrylist`
  ADD PRIMARY KEY (`CountryListId`);

--
-- Indexes for table `countryvisatypelist`
--
ALTER TABLE `countryvisatypelist`
  ADD PRIMARY KEY (`CountryVisaTypeListId`),
  ADD KEY `CountryListId` (`CountryListId`);

--
-- Indexes for table `custappinfo`
--
ALTER TABLE `custappinfo`
  ADD PRIMARY KEY (`CustAppInfoId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`),
  ADD KEY `CountryListId` (`CountryListId`),
  ADD KEY `CountryVisaTypeListId` (`CountryVisaTypeListId`),
  ADD KEY `FormId` (`FormId`);

--
-- Indexes for table `custfamilyinfo1`
--
ALTER TABLE `custfamilyinfo1`
  ADD PRIMARY KEY (`CustFamilyInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custfamilyinfo2`
--
ALTER TABLE `custfamilyinfo2`
  ADD PRIMARY KEY (`CustFamilyInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custlocalinfo`
--
ALTER TABLE `custlocalinfo`
  ADD PRIMARY KEY (`CustLocalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpersonalinfo1`
--
ALTER TABLE `custpersonalinfo1`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpersonalinfo2`
--
ALTER TABLE `custpersonalinfo2`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpersonalinfo3`
--
ALTER TABLE `custpersonalinfo3`
  ADD PRIMARY KEY (`CustPersonalInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custpreparerappinfo`
--
ALTER TABLE `custpreparerappinfo`
  ADD PRIMARY KEY (`CustPrepareAppInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custprofileinfo`
--
ALTER TABLE `custprofileinfo`
  ADD PRIMARY KEY (`CustProfileInfoId`);

--
-- Indexes for table `custtravelinfo1`
--
ALTER TABLE `custtravelinfo1`
  ADD PRIMARY KEY (`CustTravelInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custtravelinfo2`
--
ALTER TABLE `custtravelinfo2`
  ADD PRIMARY KEY (`CustTravelInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custuscontactinfo`
--
ALTER TABLE `custuscontactinfo`
  ADD PRIMARY KEY (`CustUSContactInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `custworkeducationtraininginfo`
--
ALTER TABLE `custworkeducationtraininginfo`
  ADD PRIMARY KEY (`CustWorkEducationTrainingInfoId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `ds160menuinfo`
--
ALTER TABLE `ds160menuinfo`
  ADD PRIMARY KEY (`DS160MenuInfoId`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`EducationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `employment1`
--
ALTER TABLE `employment1`
  ADD PRIMARY KEY (`EmploymentId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `employment2`
--
ALTER TABLE `employment2`
  ADD PRIMARY KEY (`EmploymentId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD PRIMARY KEY (`EventlogId`),
  ADD KEY `CustProfileInfoId` (`CustProfileInfoId`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`FormId`);

--
-- Indexes for table `internationtravel`
--
ALTER TABLE `internationtravel`
  ADD PRIMARY KEY (`InternationalTravelId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  ADD PRIMARY KEY (`OverseasPermanentAddressId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `personaldetail1`
--
ALTER TABLE `personaldetail1`
  ADD PRIMARY KEY (`PersonalDetailId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `personaldetail2`
--
ALTER TABLE `personaldetail2`
  ADD PRIMARY KEY (`PersonalDetailId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  ADD PRIMARY KEY (`USHomeAddressId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `visaapplication`
--
ALTER TABLE `visaapplication`
  ADD PRIMARY KEY (`VisaApplicationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `visainformation1`
--
ALTER TABLE `visainformation1`
  ADD PRIMARY KEY (`VisaInformationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- Indexes for table `visainformation2`
--
ALTER TABLE `visainformation2`
  ADD PRIMARY KEY (`VisaInformationId`),
  ADD KEY `CustAppInfoId` (`CustAppInfoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apppercent`
--
ALTER TABLE `apppercent`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countrylist`
--
ALTER TABLE `countrylist`
  MODIFY `CountryListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `countryvisatypelist`
--
ALTER TABLE `countryvisatypelist`
  MODIFY `CountryVisaTypeListId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `custappinfo`
--
ALTER TABLE `custappinfo`
  MODIFY `CustAppInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `custfamilyinfo1`
--
ALTER TABLE `custfamilyinfo1`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custfamilyinfo2`
--
ALTER TABLE `custfamilyinfo2`
  MODIFY `CustFamilyInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custlocalinfo`
--
ALTER TABLE `custlocalinfo`
  MODIFY `CustLocalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpersonalinfo1`
--
ALTER TABLE `custpersonalinfo1`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpersonalinfo2`
--
ALTER TABLE `custpersonalinfo2`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpersonalinfo3`
--
ALTER TABLE `custpersonalinfo3`
  MODIFY `CustPersonalInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custpreparerappinfo`
--
ALTER TABLE `custpreparerappinfo`
  MODIFY `CustPrepareAppInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custprofileinfo`
--
ALTER TABLE `custprofileinfo`
  MODIFY `CustProfileInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custtravelinfo1`
--
ALTER TABLE `custtravelinfo1`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custtravelinfo2`
--
ALTER TABLE `custtravelinfo2`
  MODIFY `CustTravelInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custuscontactinfo`
--
ALTER TABLE `custuscontactinfo`
  MODIFY `CustUSContactInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custworkeducationtraininginfo`
--
ALTER TABLE `custworkeducationtraininginfo`
  MODIFY `CustWorkEducationTrainingInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ds160menuinfo`
--
ALTER TABLE `ds160menuinfo`
  MODIFY `DS160MenuInfoId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `EducationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employment1`
--
ALTER TABLE `employment1`
  MODIFY `EmploymentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employment2`
--
ALTER TABLE `employment2`
  MODIFY `EmploymentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventlog`
--
ALTER TABLE `eventlog`
  MODIFY `EventlogId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `FormId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `internationtravel`
--
ALTER TABLE `internationtravel`
  MODIFY `InternationalTravelId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  MODIFY `OverseasPermanentAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personaldetail1`
--
ALTER TABLE `personaldetail1`
  MODIFY `PersonalDetailId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personaldetail2`
--
ALTER TABLE `personaldetail2`
  MODIFY `PersonalDetailId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  MODIFY `USHomeAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visaapplication`
--
ALTER TABLE `visaapplication`
  MODIFY `VisaApplicationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visainformation1`
--
ALTER TABLE `visainformation1`
  MODIFY `VisaInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visainformation2`
--
ALTER TABLE `visainformation2`
  MODIFY `VisaInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `countryvisatypelist`
--
ALTER TABLE `countryvisatypelist`
  ADD CONSTRAINT `countryvisatypelist_ibfk_1` FOREIGN KEY (`CountryListId`) REFERENCES `countrylist` (`CountryListId`);

--
-- Constraints for table `custappinfo`
--
ALTER TABLE `custappinfo`
  ADD CONSTRAINT `custappinfo_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`),
  ADD CONSTRAINT `custappinfo_ibfk_2` FOREIGN KEY (`CountryListId`) REFERENCES `countrylist` (`CountryListId`),
  ADD CONSTRAINT `custappinfo_ibfk_3` FOREIGN KEY (`CountryVisaTypeListId`) REFERENCES `countryvisatypelist` (`CountryVisaTypeListId`),
  ADD CONSTRAINT `custappinfo_ibfk_4` FOREIGN KEY (`FormId`) REFERENCES `form` (`FormId`);

--
-- Constraints for table `custfamilyinfo1`
--
ALTER TABLE `custfamilyinfo1`
  ADD CONSTRAINT `custfamilyinfo1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custfamilyinfo2`
--
ALTER TABLE `custfamilyinfo2`
  ADD CONSTRAINT `custfamilyinfo2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custlocalinfo`
--
ALTER TABLE `custlocalinfo`
  ADD CONSTRAINT `custlocalinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpersonalinfo1`
--
ALTER TABLE `custpersonalinfo1`
  ADD CONSTRAINT `custpersonalinfo1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpersonalinfo2`
--
ALTER TABLE `custpersonalinfo2`
  ADD CONSTRAINT `custpersonalinfo2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpersonalinfo3`
--
ALTER TABLE `custpersonalinfo3`
  ADD CONSTRAINT `custpersonalinfo3_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custpreparerappinfo`
--
ALTER TABLE `custpreparerappinfo`
  ADD CONSTRAINT `custpreparerappinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custtravelinfo1`
--
ALTER TABLE `custtravelinfo1`
  ADD CONSTRAINT `custtravelinfo1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custtravelinfo2`
--
ALTER TABLE `custtravelinfo2`
  ADD CONSTRAINT `custtravelinfo2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custuscontactinfo`
--
ALTER TABLE `custuscontactinfo`
  ADD CONSTRAINT `custuscontactinfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `custworkeducationtraininginfo`
--
ALTER TABLE `custworkeducationtraininginfo`
  ADD CONSTRAINT `custworkeducationtraininginfo_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `employment1`
--
ALTER TABLE `employment1`
  ADD CONSTRAINT `employment1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `employment2`
--
ALTER TABLE `employment2`
  ADD CONSTRAINT `employment2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD CONSTRAINT `eventlog_ibfk_1` FOREIGN KEY (`CustProfileInfoId`) REFERENCES `custprofileinfo` (`CustProfileInfoId`);

--
-- Constraints for table `internationtravel`
--
ALTER TABLE `internationtravel`
  ADD CONSTRAINT `internationtravel_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `overseaspermanentaddress`
--
ALTER TABLE `overseaspermanentaddress`
  ADD CONSTRAINT `overseaspermanentaddress_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `personaldetail1`
--
ALTER TABLE `personaldetail1`
  ADD CONSTRAINT `personaldetail1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `personaldetail2`
--
ALTER TABLE `personaldetail2`
  ADD CONSTRAINT `personaldetail2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `ushomeaddress`
--
ALTER TABLE `ushomeaddress`
  ADD CONSTRAINT `ushomeaddress_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `visaapplication`
--
ALTER TABLE `visaapplication`
  ADD CONSTRAINT `visaapplication_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `visainformation1`
--
ALTER TABLE `visainformation1`
  ADD CONSTRAINT `visainformation1_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

--
-- Constraints for table `visainformation2`
--
ALTER TABLE `visainformation2`
  ADD CONSTRAINT `visainformation2_ibfk_1` FOREIGN KEY (`CustAppInfoId`) REFERENCES `custappinfo` (`CustAppInfoId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
