-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2017 at 09:01 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orangehrm`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dashboard_get_subunit_parent_id` (`id` INT) RETURNS INT(11) READS SQL DATA
    DETERMINISTIC
BEGIN
                SELECT (SELECT t2.id 
                               FROM ohrm_subunit t2 
                               WHERE t2.lft < t1.lft AND t2.rgt > t1.rgt    
                               ORDER BY t2.rgt-t1.rgt ASC LIMIT 1) INTO @parent
                FROM ohrm_subunit t1 WHERE t1.id = id;

                RETURN @parent;

                END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `abstract_display_field`
--

CREATE TABLE `abstract_display_field` (
  `id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` text NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL,
  `display_field_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_config`
--

CREATE TABLE `hs_hr_config` (
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(512) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_config`
--

INSERT INTO `hs_hr_config` (`key`, `value`) VALUES
('admin.default_workshift_end_time', '17:00'),
('admin.default_workshift_start_time', '09:00'),
('admin.localization.default_date_format', 'Y-m-d'),
('admin.localization.default_language', 'en_US'),
('admin.localization.use_browser_language', 'No'),
('admin.product_type', 'os'),
('attendanceEmpEditSubmitted', 'No'),
('attendanceSupEditSubmitted', 'No'),
('authorize_user_role_manager_class', 'BasicUserRoleManager'),
('beacon.activation_acceptance_status', 'on'),
('beacon.activiation_status', 'on'),
('beacon.company_name', ''),
('beacon.flash_period', '120'),
('beacon.lock', 'unlocked'),
('beacon.next_flash_time', '0000-00-00'),
('beacon.uuid', '1wcXdUrBuZCixg=='),
('csrf_secret', '1tj8ttu12pggg6frcmv1lis1bm20u4gnujmdsjg70oqd1lsn9a5'),
('domain.name', 'localhost'),
('hsp_accrued_last_updated', '0000-00-00'),
('hsp_current_plan', '0'),
('hsp_used_last_updated', '0000-00-00'),
('include_supervisor_chain', 'No'),
('ldap_domain_name', ''),
('ldap_port', ''),
('ldap_server', ''),
('ldap_status', ''),
('leave.entitlement_consumption_algorithm', 'FIFOEntitlementConsumptionStrategy'),
('leave.include_pending_leave_in_balance', '1'),
('leave.leavePeriodStatus', '1'),
('leave.work_schedule_implementation', 'BasicWorkSchedule'),
('leave_period_defined', 'Yes'),
('openId.provider.added', 'off'),
('pim_show_deprecated_fields', '0'),
('report.mysql_group_concat_max_len', '2048'),
('showSIN', '0'),
('showSSN', '0'),
('showTaxExemptions', '0'),
('themeName', 'default'),
('timesheet_period_and_start_date', '<TimesheetPeriod><PeriodType>Weekly</PeriodType><ClassName>WeeklyTimesheetPeriod</ClassName><StartDate>1</StartDate><Heading>Week</Heading></TimesheetPeriod>'),
('timesheet_period_set', 'Yes'),
('timesheet_time_format', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_country`
--

CREATE TABLE `hs_hr_country` (
  `cou_code` char(2) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `cou_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_country`
--

INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES
('AD', 'ANDORRA', 'Andorra', 'AND', 20),
('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
('AL', 'ALBANIA', 'Albania', 'ALB', 8),
('AM', 'ARMENIA', 'Armenia', 'ARM', 51),
('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
('AO', 'ANGOLA', 'Angola', 'AGO', 24),
('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
('AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
('AT', 'AUSTRIA', 'Austria', 'AUT', 40),
('AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
('AW', 'ARUBA', 'Aruba', 'ABW', 533),
('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
('BB', 'BARBADOS', 'Barbados', 'BRB', 52),
('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
('BE', 'BELGIUM', 'Belgium', 'BEL', 56),
('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
('BI', 'BURUNDI', 'Burundi', 'BDI', 108),
('BJ', 'BENIN', 'Benin', 'BEN', 204),
('BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
('BR', 'BRAZIL', 'Brazil', 'BRA', 76),
('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
('BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
('BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
('BY', 'BELARUS', 'Belarus', 'BLR', 112),
('BZ', 'BELIZE', 'Belize', 'BLZ', 84),
('CA', 'CANADA', 'Canada', 'CAN', 124),
('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
('CG', 'CONGO', 'Congo', 'COG', 178),
('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
('CL', 'CHILE', 'Chile', 'CHL', 152),
('CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
('CN', 'CHINA', 'China', 'CHN', 156),
('CO', 'COLOMBIA', 'Colombia', 'COL', 170),
('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
('CU', 'CUBA', 'Cuba', 'CUB', 192),
('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
('CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
('DE', 'GERMANY', 'Germany', 'DEU', 276),
('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
('DK', 'DENMARK', 'Denmark', 'DNK', 208),
('DM', 'DOMINICA', 'Dominica', 'DMA', 212),
('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
('DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
('EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
('EE', 'ESTONIA', 'Estonia', 'EST', 233),
('EG', 'EGYPT', 'Egypt', 'EGY', 818),
('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
('ER', 'ERITREA', 'Eritrea', 'ERI', 232),
('ES', 'SPAIN', 'Spain', 'ESP', 724),
('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
('FI', 'FINLAND', 'Finland', 'FIN', 246),
('FJ', 'FIJI', 'Fiji', 'FJI', 242),
('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
('FR', 'FRANCE', 'France', 'FRA', 250),
('GA', 'GABON', 'Gabon', 'GAB', 266),
('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
('GD', 'GRENADA', 'Grenada', 'GRD', 308),
('GE', 'GEORGIA', 'Georgia', 'GEO', 268),
('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
('GH', 'GHANA', 'Ghana', 'GHA', 288),
('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
('GL', 'GREENLAND', 'Greenland', 'GRL', 304),
('GM', 'GAMBIA', 'Gambia', 'GMB', 270),
('GN', 'GUINEA', 'Guinea', 'GIN', 324),
('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
('GR', 'GREECE', 'Greece', 'GRC', 300),
('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
('GU', 'GUAM', 'Guam', 'GUM', 316),
('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
('GY', 'GUYANA', 'Guyana', 'GUY', 328),
('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
('HN', 'HONDURAS', 'Honduras', 'HND', 340),
('HR', 'CROATIA', 'Croatia', 'HRV', 191),
('HT', 'HAITI', 'Haiti', 'HTI', 332),
('HU', 'HUNGARY', 'Hungary', 'HUN', 348),
('ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
('IE', 'IRELAND', 'Ireland', 'IRL', 372),
('IL', 'ISRAEL', 'Israel', 'ISR', 376),
('IN', 'INDIA', 'India', 'IND', 356),
('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
('IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
('IS', 'ICELAND', 'Iceland', 'ISL', 352),
('IT', 'ITALY', 'Italy', 'ITA', 380),
('JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
('JO', 'JORDAN', 'Jordan', 'JOR', 400),
('JP', 'JAPAN', 'Japan', 'JPN', 392),
('KE', 'KENYA', 'Kenya', 'KEN', 404),
('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
('KM', 'COMOROS', 'Comoros', 'COM', 174),
('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
('KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
('LB', 'LEBANON', 'Lebanon', 'LBN', 422),
('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
('LR', 'LIBERIA', 'Liberia', 'LBR', 430),
('LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
('LV', 'LATVIA', 'Latvia', 'LVA', 428),
('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
('MA', 'MOROCCO', 'Morocco', 'MAR', 504),
('MC', 'MONACO', 'Monaco', 'MCO', 492),
('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
('ML', 'MALI', 'Mali', 'MLI', 466),
('MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
('MO', 'MACAO', 'Macao', 'MAC', 446),
('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
('MT', 'MALTA', 'Malta', 'MLT', 470),
('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
('MV', 'MALDIVES', 'Maldives', 'MDV', 462),
('MW', 'MALAWI', 'Malawi', 'MWI', 454),
('MX', 'MEXICO', 'Mexico', 'MEX', 484),
('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
('NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
('NE', 'NIGER', 'Niger', 'NER', 562),
('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
('NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
('NO', 'NORWAY', 'Norway', 'NOR', 578),
('NP', 'NEPAL', 'Nepal', 'NPL', 524),
('NR', 'NAURU', 'Nauru', 'NRU', 520),
('NU', 'NIUE', 'Niue', 'NIU', 570),
('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
('OM', 'OMAN', 'Oman', 'OMN', 512),
('PA', 'PANAMA', 'Panama', 'PAN', 591),
('PE', 'PERU', 'Peru', 'PER', 604),
('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
('PL', 'POLAND', 'Poland', 'POL', 616),
('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
('PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
('PW', 'PALAU', 'Palau', 'PLW', 585),
('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
('QA', 'QATAR', 'Qatar', 'QAT', 634),
('RE', 'REUNION', 'Reunion', 'REU', 638),
('RO', 'ROMANIA', 'Romania', 'ROM', 642),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('RW', 'RWANDA', 'Rwanda', 'RWA', 646),
('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
('SD', 'SUDAN', 'Sudan', 'SDN', 736),
('SE', 'SWEDEN', 'Sweden', 'SWE', 752),
('SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
('SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
('SN', 'SENEGAL', 'Senegal', 'SEN', 686),
('SO', 'SOMALIA', 'Somalia', 'SOM', 706),
('SR', 'SURINAME', 'Suriname', 'SUR', 740),
('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
('TD', 'CHAD', 'Chad', 'TCD', 148),
('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
('TG', 'TOGO', 'Togo', 'TGO', 768),
('TH', 'THAILAND', 'Thailand', 'THA', 764),
('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
('TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
('TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
('TO', 'TONGA', 'Tonga', 'TON', 776),
('TR', 'TURKEY', 'Turkey', 'TUR', 792),
('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
('TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan', 'TWN', 158),
('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
('UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
('UG', 'UGANDA', 'Uganda', 'UGA', 800),
('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
('US', 'UNITED STATES', 'United States', 'USA', 840),
('UY', 'URUGUAY', 'Uruguay', 'URY', 858),
('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
('VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
('WS', 'SAMOA', 'Samoa', 'WSM', 882),
('YE', 'YEMEN', 'Yemen', 'YEM', 887),
('YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_currency_type`
--

CREATE TABLE `hs_hr_currency_type` (
  `code` int(11) NOT NULL DEFAULT '0',
  `currency_id` char(3) NOT NULL DEFAULT '',
  `currency_name` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_currency_type`
--

INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES
(3, 'AED', 'Utd. Arab Emir. Dirham'),
(4, 'AFN', 'Afghanistan Afghani'),
(5, 'ALL', 'Albanian Lek'),
(6, 'ANG', 'NL Antillian Guilder'),
(7, 'AOR', 'Angolan New Kwanza'),
(177, 'ARP', 'Argentina Pesos'),
(8, 'ARS', 'Argentine Peso'),
(10, 'AUD', 'Australian Dollar'),
(11, 'AWG', 'Aruban Florin'),
(12, 'BBD', 'Barbados Dollar'),
(13, 'BDT', 'Bangladeshi Taka'),
(15, 'BGL', 'Bulgarian Lev'),
(16, 'BHD', 'Bahraini Dinar'),
(17, 'BIF', 'Burundi Franc'),
(18, 'BMD', 'Bermudian Dollar'),
(19, 'BND', 'Brunei Dollar'),
(20, 'BOB', 'Bolivian Boliviano'),
(21, 'BRL', 'Brazilian Real'),
(22, 'BSD', 'Bahamian Dollar'),
(23, 'BTN', 'Bhutan Ngultrum'),
(24, 'BWP', 'Botswana Pula'),
(25, 'BZD', 'Belize Dollar'),
(26, 'CAD', 'Canadian Dollar'),
(27, 'CHF', 'Swiss Franc'),
(28, 'CLP', 'Chilean Peso'),
(29, 'CNY', 'Chinese Yuan Renminbi'),
(30, 'COP', 'Colombian Peso'),
(31, 'CRC', 'Costa Rican Colon'),
(32, 'CUP', 'Cuban Peso'),
(33, 'CVE', 'Cape Verde Escudo'),
(34, 'CYP', 'Cyprus Pound'),
(171, 'CZK', 'Czech Koruna'),
(37, 'DJF', 'Djibouti Franc'),
(38, 'DKK', 'Danish Krona'),
(39, 'DOP', 'Dominican Peso'),
(40, 'DZD', 'Algerian Dinar'),
(41, 'ECS', 'Ecuador Sucre'),
(43, 'EEK', 'Estonian Krona'),
(44, 'EGP', 'Egyptian Pound'),
(46, 'ETB', 'Ethiopian Birr'),
(42, 'EUR', 'Euro'),
(48, 'FJD', 'Fiji Dollar'),
(49, 'FKP', 'Falkland Islands Pound'),
(51, 'GBP', 'Pound Sterling'),
(52, 'GHC', 'Ghanaian Cedi'),
(53, 'GIP', 'Gibraltar Pound'),
(54, 'GMD', 'Gambian Dalasi'),
(55, 'GNF', 'Guinea Franc'),
(57, 'GTQ', 'Guatemalan Quetzal'),
(58, 'GYD', 'Guyanan Dollar'),
(59, 'HKD', 'Hong Kong Dollar'),
(60, 'HNL', 'Honduran Lempira'),
(61, 'HRK', 'Croatian Kuna'),
(62, 'HTG', 'Haitian Gourde'),
(63, 'HUF', 'Hungarian Forint'),
(64, 'IDR', 'Indonesian Rupiah'),
(66, 'ILS', 'Israeli New Shekel'),
(67, 'INR', 'Indian Rupee'),
(68, 'IQD', 'Iraqi Dinar'),
(69, 'IRR', 'Iranian Rial'),
(70, 'ISK', 'Iceland Krona'),
(72, 'JMD', 'Jamaican Dollar'),
(73, 'JOD', 'Jordanian Dinar'),
(74, 'JPY', 'Japanese Yen'),
(75, 'KES', 'Kenyan Shilling'),
(76, 'KHR', 'Kampuchean Riel'),
(77, 'KMF', 'Comoros Franc'),
(78, 'KPW', 'North Korean Won'),
(79, 'KRW', 'Korean Won'),
(80, 'KWD', 'Kuwaiti Dinar'),
(81, 'KYD', 'Cayman Islands Dollar'),
(82, 'KZT', 'Kazakhstan Tenge'),
(83, 'LAK', 'Lao Kip'),
(84, 'LBP', 'Lebanese Pound'),
(85, 'LKR', 'Sri Lanka Rupee'),
(86, 'LRD', 'Liberian Dollar'),
(87, 'LSL', 'Lesotho Loti'),
(88, 'LTL', 'Lithuanian Litas'),
(90, 'LVL', 'Latvian Lats'),
(91, 'LYD', 'Libyan Dinar'),
(92, 'MAD', 'Moroccan Dirham'),
(93, 'MGF', 'Malagasy Franc'),
(94, 'MMK', 'Myanmar Kyat'),
(95, 'MNT', 'Mongolian Tugrik'),
(96, 'MOP', 'Macau Pataca'),
(97, 'MRO', 'Mauritanian Ouguiya'),
(98, 'MTL', 'Maltese Lira'),
(99, 'MUR', 'Mauritius Rupee'),
(100, 'MVR', 'Maldive Rufiyaa'),
(101, 'MWK', 'Malawi Kwacha'),
(102, 'MXN', 'Mexican New Peso'),
(172, 'MXP', 'Mexican Peso'),
(103, 'MYR', 'Malaysian Ringgit'),
(104, 'MZM', 'Mozambique Metical'),
(105, 'NAD', 'Namibia Dollar'),
(106, 'NGN', 'Nigerian Naira'),
(107, 'NIO', 'Nicaraguan Cordoba Oro'),
(109, 'NOK', 'Norwegian Krona'),
(110, 'NPR', 'Nepalese Rupee'),
(111, 'NZD', 'New Zealand Dollar'),
(112, 'OMR', 'Omani Rial'),
(113, 'PAB', 'Panamanian Balboa'),
(114, 'PEN', 'Peruvian Nuevo Sol'),
(115, 'PGK', 'Papua New Guinea Kina'),
(116, 'PHP', 'Philippine Peso'),
(117, 'PKR', 'Pakistan Rupee'),
(118, 'PLN', 'Polish Zloty'),
(120, 'PYG', 'Paraguay Guarani'),
(121, 'QAR', 'Qatari Rial'),
(122, 'ROL', 'Romanian Leu'),
(123, 'RUB', 'Russian Rouble'),
(180, 'RUR', 'Russia Rubles'),
(173, 'SAR', 'Saudi Arabia Riyal'),
(125, 'SBD', 'Solomon Islands Dollar'),
(126, 'SCR', 'Seychelles Rupee'),
(127, 'SDD', 'Sudanese Dinar'),
(128, 'SDP', 'Sudanese Pound'),
(129, 'SEK', 'Swedish Krona'),
(131, 'SGD', 'Singapore Dollar'),
(132, 'SHP', 'St. Helena Pound'),
(130, 'SKK', 'Slovak Koruna'),
(135, 'SLL', 'Sierra Leone Leone'),
(136, 'SOS', 'Somali Shilling'),
(137, 'SRD', 'Surinamese Dollar'),
(138, 'STD', 'Sao Tome/Principe Dobra'),
(139, 'SVC', 'El Salvador Colon'),
(140, 'SYP', 'Syrian Pound'),
(141, 'SZL', 'Swaziland Lilangeni'),
(142, 'THB', 'Thai Baht'),
(143, 'TND', 'Tunisian Dinar'),
(144, 'TOP', 'Tongan Pa''anga'),
(145, 'TRL', 'Turkish Lira'),
(146, 'TTD', 'Trinidad/Tobago Dollar'),
(147, 'TWD', 'Taiwan Dollar'),
(148, 'TZS', 'Tanzanian Shilling'),
(149, 'UAH', 'Ukraine Hryvnia'),
(150, 'UGX', 'Uganda Shilling'),
(151, 'USD', 'United States Dollar'),
(152, 'UYP', 'Uruguayan Peso'),
(153, 'VEB', 'Venezuelan Bolivar'),
(154, 'VND', 'Vietnamese Dong'),
(155, 'VUV', 'Vanuatu Vatu'),
(156, 'WST', 'Samoan Tala'),
(158, 'XAF', 'CFA Franc BEAC'),
(159, 'XAG', 'Silver (oz.)'),
(160, 'XAU', 'Gold (oz.)'),
(161, 'XCD', 'Eastern Caribbean Dollars'),
(179, 'XDR', 'IMF Special Drawing Right'),
(162, 'XOF', 'CFA Franc BCEAO'),
(163, 'XPD', 'Palladium (oz.)'),
(164, 'XPF', 'CFP Franc'),
(165, 'XPT', 'Platinum (oz.)'),
(166, 'YER', 'Yemeni Riyal'),
(167, 'YUM', 'Yugoslavian Dinar'),
(175, 'YUN', 'Yugoslav Dinar'),
(168, 'ZAR', 'South African Rand'),
(176, 'ZMK', 'Zambian Kwacha'),
(169, 'ZRN', 'New Zaire'),
(170, 'ZWD', 'Zimbabwe Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_export`
--

CREATE TABLE `hs_hr_custom_export` (
  `export_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `headings` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_fields`
--

CREATE TABLE `hs_hr_custom_fields` (
  `field_num` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `screen` varchar(100) DEFAULT NULL,
  `extra_data` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_import`
--

CREATE TABLE `hs_hr_custom_import` (
  `import_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `has_heading` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_district`
--

CREATE TABLE `hs_hr_district` (
  `district_code` varchar(13) NOT NULL DEFAULT '',
  `district_name` varchar(50) DEFAULT NULL,
  `province_code` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_employee`
--

CREATE TABLE `hs_hr_employee` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `employee_id` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(100) NOT NULL DEFAULT '',
  `emp_firstname` varchar(100) NOT NULL DEFAULT '',
  `emp_middle_name` varchar(100) NOT NULL DEFAULT '',
  `emp_nick_name` varchar(100) DEFAULT '',
  `emp_smoker` smallint(6) DEFAULT '0',
  `ethnic_race_code` varchar(13) DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `nation_code` int(4) DEFAULT NULL,
  `emp_gender` smallint(6) DEFAULT NULL,
  `emp_marital_status` varchar(20) DEFAULT NULL,
  `emp_ssn_num` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `emp_sin_num` varchar(100) DEFAULT '',
  `emp_other_id` varchar(100) DEFAULT '',
  `emp_dri_lice_num` varchar(100) DEFAULT '',
  `emp_dri_lice_exp_date` date DEFAULT NULL,
  `emp_military_service` varchar(100) DEFAULT '',
  `emp_status` int(13) DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `eeo_cat_code` int(11) DEFAULT NULL,
  `work_station` int(6) DEFAULT NULL,
  `emp_street1` varchar(100) DEFAULT '',
  `emp_street2` varchar(100) DEFAULT '',
  `city_code` varchar(100) DEFAULT '',
  `coun_code` varchar(100) DEFAULT '',
  `provin_code` varchar(100) DEFAULT '',
  `emp_zipcode` varchar(20) DEFAULT NULL,
  `emp_hm_telephone` varchar(50) DEFAULT NULL,
  `emp_mobile` varchar(50) DEFAULT NULL,
  `emp_work_telephone` varchar(50) DEFAULT NULL,
  `emp_work_email` varchar(50) DEFAULT NULL,
  `sal_grd_code` varchar(13) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `emp_oth_email` varchar(50) DEFAULT NULL,
  `termination_id` int(4) DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_employee`
--

INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
(1, 'ICE125', 'Ramanaboyina', 'Gangaiah', 'Yadav', '', 0, NULL, '1991-06-14', 82, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '0002', 'Manager', 'Test1', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_attachment`
--

CREATE TABLE `hs_hr_emp_attachment` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eattach_id` int(11) NOT NULL DEFAULT '0',
  `eattach_desc` varchar(200) DEFAULT NULL,
  `eattach_filename` varchar(100) DEFAULT NULL,
  `eattach_size` int(11) DEFAULT '0',
  `eattach_attachment` mediumblob,
  `eattach_type` varchar(200) DEFAULT NULL,
  `screen` varchar(100) DEFAULT '',
  `attached_by` int(11) DEFAULT NULL,
  `attached_by_name` varchar(200) DEFAULT NULL,
  `attached_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_basicsalary`
--

CREATE TABLE `hs_hr_emp_basicsalary` (
  `id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `sal_grd_code` int(11) DEFAULT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `ebsal_basic_salary` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `payperiod_code` varchar(13) DEFAULT NULL,
  `salary_component` varchar(100) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_children`
--

CREATE TABLE `hs_hr_emp_children` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ec_name` varchar(100) DEFAULT '',
  `ec_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_contract_extend`
--

CREATE TABLE `hs_hr_emp_contract_extend` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `econ_extend_id` decimal(10,0) NOT NULL DEFAULT '0',
  `econ_extend_start_date` datetime DEFAULT NULL,
  `econ_extend_end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_dependents`
--

CREATE TABLE `hs_hr_emp_dependents` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ed_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ed_name` varchar(100) DEFAULT '',
  `ed_relationship_type` enum('child','other') DEFAULT NULL,
  `ed_relationship` varchar(100) DEFAULT '',
  `ed_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_directdebit`
--

CREATE TABLE `hs_hr_emp_directdebit` (
  `id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `dd_routing_num` int(9) NOT NULL,
  `dd_account` varchar(100) NOT NULL DEFAULT '',
  `dd_amount` decimal(11,2) NOT NULL,
  `dd_account_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'CHECKING, SAVINGS',
  `dd_transaction_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'BLANK, PERC, FLAT, FLATMINUS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_emergency_contacts`
--

CREATE TABLE `hs_hr_emp_emergency_contacts` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `eec_name` varchar(100) DEFAULT '',
  `eec_relationship` varchar(100) DEFAULT '',
  `eec_home_no` varchar(100) DEFAULT '',
  `eec_mobile_no` varchar(100) DEFAULT '',
  `eec_office_no` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_history_of_ealier_pos`
--

CREATE TABLE `hs_hr_emp_history_of_ealier_pos` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `emp_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ehoep_job_title` varchar(100) DEFAULT '',
  `ehoep_years` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_language`
--

CREATE TABLE `hs_hr_emp_language` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL,
  `fluency` smallint(6) NOT NULL DEFAULT '0',
  `competency` smallint(6) DEFAULT '0',
  `comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_locations`
--

CREATE TABLE `hs_hr_emp_locations` (
  `emp_number` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_member_detail`
--

CREATE TABLE `hs_hr_emp_member_detail` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `membship_code` int(6) NOT NULL DEFAULT '0',
  `ememb_subscript_ownership` varchar(20) DEFAULT NULL,
  `ememb_subscript_amount` decimal(15,2) DEFAULT NULL,
  `ememb_subs_currency` varchar(20) DEFAULT NULL,
  `ememb_commence_date` date DEFAULT NULL,
  `ememb_renewal_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_passport`
--

CREATE TABLE `hs_hr_emp_passport` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ep_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ep_passport_num` varchar(100) NOT NULL DEFAULT '',
  `ep_passportissueddate` datetime DEFAULT NULL,
  `ep_passportexpiredate` datetime DEFAULT NULL,
  `ep_comments` varchar(255) DEFAULT NULL,
  `ep_passport_type_flg` smallint(6) DEFAULT NULL,
  `ep_i9_status` varchar(100) DEFAULT '',
  `ep_i9_review_date` date DEFAULT NULL,
  `cou_code` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_picture`
--

CREATE TABLE `hs_hr_emp_picture` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `epic_picture` mediumblob,
  `epic_filename` varchar(100) DEFAULT NULL,
  `epic_type` varchar(50) DEFAULT NULL,
  `epic_file_size` varchar(20) DEFAULT NULL,
  `epic_file_width` varchar(20) DEFAULT NULL,
  `epic_file_height` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_picture`
--

INSERT INTO `hs_hr_emp_picture` (`emp_number`, `epic_picture`, `epic_filename`, `epic_type`, `epic_file_size`, `epic_file_width`, `epic_file_height`) VALUES
(1, 0xffd8ffe000104a4649460001020100c800c80000ffe10ced4578696600004d4d002a000000080007011200030000000100010000011a00050000000100000062011b0005000000010000006a01280003000000010002000001310002000000140000007201320002000000140000008687690004000000010000009c000000c8000000c800000001000000c80000000141646f62652050686f746f73686f7020372e3000323031313a31313a31392031393a32303a30330000000003a001000300000001ffff0000a0020004000000010000006ea0030004000000010000008c0000000000000006010300030000000100060000011a00050000000100000116011b0005000000010000011e012800030000000100020000020100040000000100000126020200040000000100000bbf0000000000000048000000010000004800000001ffd8ffe000104a46494600010201004800480000ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc00011080080006503012200021101031101ffdd00040007ffc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f0062ef251ddaf904cf3a84d23bf2b6a9e48c8df928bbfd8907289efe294e9e6952db2bcf79e120e3dbee42baea71ea365ae804c3477738fe63562ddd5726db1c2b71ad878ad9a40f3b3e93dca2c99a18f7dfb06e72fca66cfac6a311fa52d9e81d635825e431a3bb8c7e54ccb58f6cb5c1c3f92657361efb1dbac97ff29c771ffa497adf67b03f1c9638771307e2dfdd507dec5fcba79b73fd152e1fe72e7db87d2f4ed76a9176bafdcb29bd5d96386d058635100c7c4ab5899d56439d5416d8cd769ee38dcd530cb091a043567cae78478a513437f06db5da245c9a344dce89ec366d26e3b524d1ec490a5d65ffd083a49519f9a938a8c9f92da7913bb03ca7074d137793f35213b8478fb7e28a00d74703aae46fcc7b4383995815b60c81fe978fcef53fea1556b5a35e08efd8f9226061bb32d15b4ed03573bc3c574589f546ab5aedf92fdf3a38344011c163962e5cc0cc93b936f5f839631c718c47a62386ff00baf38d1e1cf84e8845af20cea0692350bbec4fab3818cc01edf5dc3f39e3bfc1a9f2ba4546b7431a0410204288e6ec19c72dde4f05411ea6be1e3cfc55ec0b00ea751980edcc93df734fb7fcfd88bd4ba6dd8ce7b9b5fe8b90e1dbb2a9800bb3f1f68970b0388ed0df7b9dfe6853e197aa04770d4e6b1918f2465fb92ffa2f44384fdd28d128d616a3cdf567da524fda124173ffd11bb8098920a7710a04c68444ada7913bac3952061c3cbc1334893e0521b3d403f349827c9091a04f6169c51129c224e929089ff08b9dd271c605992eca701e9fa603c6ad2db07ab5bdbff19fbaba7e9fd4fa7defd8325ad77eeb8ed2a9e3525f7e43ab1b5eedbb247d1d8dd8cfca8cee999375d5fda1c0e3369fd26f630bfd713fcdec6b36d0efa7f4ff0046cff4962e7cd48d9ddee80e11c236048eeefb6a2402d7020f06550cbccc3aa43f26bdc3966e13f7258af0dc5757277304363cfc2551bba764c577600abd575805a6cac3bf447e958c7b83bf48cff469a28e89363fde6a7507e366d76b2b78734b61db791a72b07a2e3d8ebdd9247e8d81cd0efde79dad2d1fd56bbdcbadbb19fe939d9105fee0c76d0d3b0fd1dfb3daa8306dc2aaaf6feaec6b1a5bc43bfc19fe5b5cddea7e5a559202aee4035b9fc7c7cbe537c3c18e67ece88cc42439f82724478a6ef3e2b69e459c9e3b249bc924175bffd21b877f0433a9d111f1087c15b41e44eea1a14a751098247e97824551346fc5d1c3ca6fda7786ecdc1a0899fa3edffa95b6e7834b9fe03b2e668243c90340353e1dbddfda5a3f6d7d7506ef2c0740e0371f86dfe52c3e6b10c794c623d240a0f65f0ee6259f978ce66e7728c8d575ed14b4d98eda2ebadb80d861ed009e3f7207bf9ff06b4b0ddfa06931cf235047ef3562d79348af68f5a7e06413dc69ed5668ce71af60738ed007b9b041f091ed50556b4dd20f565d5b2016fa634dda69cacccaba8706328696b18383a6bf253cdb77be79553bad0e4797040cb2be204f0feeb83f18e767132e5a15c2631f70fe9dfcdc3fe2a8ea9379f8a6275e2653b7c49d3c169382ce124a524d5eff00ffd31b888f342ee7b2779fc3c558c1e99d433c96e1d0fb40e5f1b583feb8e86ad9b005935e6f2621299a8c493da22daed1f3f14f55765d7369a586cb5e61958e492babe9bf52002db3a8dbb80d4d35e8df83adfa6efec6c5bd8d838b880d78b4b29adb3a306a7cdeefa4f77f5d41939b80d23ea3ff0035bd83e179654721f6c76f9a74f1dd5fa4d3d37030e833664e4e4cbec12013556fb9ba7fa3ada7f47fcbfd22aac81fa2b7e8b8ceabb7eab80dcae9cf696eeb2977ab591a9dcd13ff00499ec5cdbf1a9b6b04411cb4f92c9e627233b3d5e97948c21884602b85035e0e9f69b0088e3f09417b9a07a357b8f303b79b9145383548b690eb3fc1e8649fddf6a76535d6c7d96915b1a0977600725dfd9517178db6356adf880613f28125d55edaac81a063eb3632c3ff005d66c54393e23b2eefa1e1be9e935dd633d3b731e6f730f21ae1b71db67f29b8ecad4337eaaf4fcf639f5346264933ea307b49ff0084a6767bbf93b169f2bcc08638c67d3abcff00c4792965cb3c988837bc76be1f4e927862eec7b29355aea7d1fa874c7edcba8867e6dcdf7567fb7f99ff005c550482af02242c1047838f284a06a40823a11ab3d66125194904bfffd4ec3a57d51e9f435966637ed7900ee3ba7d269fdd6d7f9ffd6b1740c6b58ddac021ba6d1a00a43423c0f1f953384b64687b27ce7299b91b62c7871e3150888f97ed59e60027c63fdc8758fd1349e5e0b9df12a6f66ff74f046899e2d2e0d690d0411ba24ffe4505e8efcac6c3a8bf22c6d2d7383585e625c76eddbfbcb99ea18d6e2f51b681ad77037d03f924fe96affacd9ff81ae98e1d25e6d3eeb0b637bb531e1fd540cbc265b58aef69d9589aaf67d267eee9fc96fe77e7ff008451e48710f1dd9314f825aec742f2b658eac69bda3c2263e09b0ba75fd56df7b76f4ea9dfa69306d7b7ddf6767e77bbfc23ff00315bcc1975e5b301c40bde40ac81ed7879db5d8c77fafa6baac7c7aaa63595b036bac6dada380d1a35458f1d9d7a3632e5a88e1de5d7c1af8f9b5e730b5d5ba8bda3df4bf91fca6b9becb1bfd44760d8e11dc0fc0c27b7129b20910f6996bc6841f10a4da9c1a373b73c4cba227e4ac34d958d6bda6b7b43dae041691208f0d573bd4fea662dd3674e70c5b3526b209ac93e5f4aaffadae908d42424cf876fb93a1925037134b32e0c79454e225dbf7a3e527cd7f61757fb68c1fb39fb416978d46c2c1a1b3d69d9b373bfae92f49dbaeeef3f824a7fbdcbb0dbfe734ffd198ff78eff00f33b7f7bfacfffd5f4f2ff00d0824fb9a01fb94c6a3c88546dbbd289301f2d1e64fbdaadd4e9603e451a5acdb0479f74a011f0329819048ee014e098f90494bff0309b5d3bf629fb2673835a49e0493f2492d57e263dd974dee682fc6dfe8f6da5e365a40fea2b9d907161f50ba3f9c970f813211678fbd25280d35f8a7ed092450528a62601f24e7942bac6d6d73de604812928a4ed0921cd9ce9bbc3b4ff00e73ed49155bfffd6efbaa31cfc4b8d7fce06efafc9d5fbd9fe77bd5ac2b3d5c7a5fc6f6031fd66b1c877bf734eed3769f2e1c96190dad8ce1a00da7c34d89cb5b559f69feaff0012a730cf90426132e07c0a96e1b3e5fc52fe28fe0cc9f69f28fc8abe5bb7b3d11c3dd0ef87e7293de4b481e034f928069758defee4825b4000cd381c0f825303e01443a5a476039f15568cac8b7a8e5633b1dd5d38edabd3c874edb0bfdcf6b3dbb7f451f98f41344fd1bb3aa7eea13eef9c7f14e0ea3e6929532ef80fca83731afbe90e3f44b9e1bd8b80dadff33722b6773876d153bcbdf9f508fd1b2b2e71ee493ed637fefc921b3bc6fd9f9d1bbe5f47ff003249571226dd7570d7c802dffaa7248a9fffd9ffed118a50686f746f73686f7020332e30003842494d0425000000000010000000000000000000000000000000003842494d03ed00000000001000c800000001000100c80000000100013842494d042600000000000e000000000000000000003f8000003842494d040d000000000004000000783842494d04190000000000040000001e3842494d03f3000000000009000000000000000001003842494d040a00000000000100003842494d271000000000000a000100000000000000013842494d03f5000000000048002f66660001006c66660006000000000001002f6666000100a1999a0006000000000001003200000001005a00000006000000000001003500000001002d000000060000000000013842494d03f80000000000700000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800003842494d0408000000000010000000010000024000000240000000003842494d041e000000000004000000003842494d041a0000000003490000000600000000000000000000008c0000006e0000000a0055006e007400690074006c00650064002d003300000001000000000000000000000000000000000000000100000000000000000000006e0000008c00000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006e756c6c0000000200000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000008c00000000526768746c6f6e670000006e00000006736c69636573566c4c73000000014f626a6300000001000000000005736c6963650000001200000007736c69636549446c6f6e67000000000000000767726f757049446c6f6e6700000000000000066f726967696e656e756d0000000c45536c6963654f726967696e0000000d6175746f47656e6572617465640000000054797065656e756d0000000a45536c6963655479706500000000496d672000000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000008c00000000526768746c6f6e670000006e0000000375726c54455854000000010000000000006e756c6c54455854000000010000000000004d7367655445585400000001000000000006616c74546167544558540000000100000000000e63656c6c54657874497348544d4c626f6f6c010000000863656c6c546578745445585400000001000000000009686f727a416c69676e656e756d0000000f45536c696365486f727a416c69676e0000000764656661756c740000000976657274416c69676e656e756d0000000f45536c69636556657274416c69676e0000000764656661756c740000000b6267436f6c6f7254797065656e756d0000001145536c6963654247436f6c6f7254797065000000004e6f6e6500000009746f704f75747365746c6f6e67000000000000000a6c6566744f75747365746c6f6e67000000000000000c626f74746f6d4f75747365746c6f6e67000000000000000b72696768744f75747365746c6f6e6700000000003842494d041100000000000101003842494d0414000000000004000000013842494d040c000000000bdb000000010000006500000080000001300000980000000bbf00180001ffd8ffe000104a46494600010201004800480000ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc00011080080006503012200021101031101ffdd00040007ffc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f0062ef251ddaf904cf3a84d23bf2b6a9e48c8df928bbfd8907289efe294e9e6952db2bcf79e120e3dbee42baea71ea365ae804c3477738fe63562ddd5726db1c2b71ad878ad9a40f3b3e93dca2c99a18f7dfb06e72fca66cfac6a311fa52d9e81d635825e431a3bb8c7e54ccb58f6cb5c1c3f92657361efb1dbac97ff29c771ffa497adf67b03f1c9638771307e2dfdd507dec5fcba79b73fd152e1fe72e7db87d2f4ed76a9176bafdcb29bd5d96386d058635100c7c4ab5899d56439d5416d8cd769ee38dcd530cb091a043567cae78478a513437f06db5da245c9a344dce89ec366d26e3b524d1ec490a5d65ffd083a49519f9a938a8c9f92da7913bb03ca7074d137793f35213b8478fb7e28a00d74703aae46fcc7b4383995815b60c81fe978fcef53fea1556b5a35e08efd8f9226061bb32d15b4ed03573bc3c574589f546ab5aedf92fdf3a38344011c163962e5cc0cc93b936f5f839631c718c47a62386ff00baf38d1e1cf84e8845af20cea0692350bbec4fab3818cc01edf5dc3f39e3bfc1a9f2ba4546b7431a0410204288e6ec19c72dde4f05411ea6be1e3cfc55ec0b00ea751980edcc93df734fb7fcfd88bd4ba6dd8ce7b9b5fe8b90e1dbb2a9800bb3f1f68970b0388ed0df7b9dfe6853e197aa04770d4e6b1918f2465fb92ffa2f44384fdd28d128d616a3cdf567da524fda124173ffd11bb8098920a7710a04c68444ada7913bac3952061c3cbc1334893e0521b3d403f349827c9091a04f6169c51129c224e929089ff08b9dd271c605992eca701e9fa603c6ad2db07ab5bdbff19fbaba7e9fd4fa7defd8325ad77eeb8ed2a9e3525f7e43ab1b5eedbb247d1d8dd8cfca8cee999375d5fda1c0e3369fd26f630bfd713fcdec6b36d0efa7f4ff0046cff4962e7cd48d9ddee80e11c236048eeefb6a2402d7020f06550cbccc3aa43f26bdc3966e13f7258af0dc5757277304363cfc2551bba764c577600abd575805a6cac3bf447e958c7b83bf48cff469a28e89363fde6a7507e366d76b2b78734b61db791a72b07a2e3d8ebdd9247e8d81cd0efde79dad2d1fd56bbdcbadbb19fe939d9105fee0c76d0d3b0fd1dfb3daa8306dc2aaaf6feaec6b1a5bc43bfc19fe5b5cddea7e5a559202aee4035b9fc7c7cbe537c3c18e67ece88cc42439f82724478a6ef3e2b69e459c9e3b249bc924175bffd21b877f0433a9d111f1087c15b41e44eea1a14a751098247e97824551346fc5d1c3ca6fda7786ecdc1a0899fa3edffa95b6e7834b9fe03b2e668243c90340353e1dbddfda5a3f6d7d7506ef2c0740e0371f86dfe52c3e6b10c794c623d240a0f65f0ee6259f978ce66e7728c8d575ed14b4d98eda2ebadb80d861ed009e3f7207bf9ff06b4b0ddfa06931cf235047ef3562d79348af68f5a7e06413dc69ed5668ce71af60738ed007b9b041f091ed50556b4dd20f565d5b2016fa634dda69cacccaba8706328696b18383a6bf253cdb77be79553bad0e4797040cb2be204f0feeb83f18e767132e5a15c2631f70fe9dfcdc3fe2a8ea9379f8a6275e2653b7c49d3c169382ce124a524d5eff00ffd31b888f342ee7b2779fc3c558c1e99d433c96e1d0fb40e5f1b583feb8e86ad9b005935e6f2621299a8c493da22daed1f3f14f55765d7369a586cb5e61958e492babe9bf52002db3a8dbb80d4d35e8df83adfa6efec6c5bd8d838b880d78b4b29adb3a306a7cdeefa4f77f5d41939b80d23ea3ff0035bd83e179654721f6c76f9a74f1dd5fa4d3d37030e833664e4e4cbec12013556fb9ba7fa3ada7f47fcbfd22aac81fa2b7e8b8ceabb7eab80dcae9cf696eeb2977ab591a9dcd13ff00499ec5cdbf1a9b6b04411cb4f92c9e627233b3d5e97948c21884602b85035e0e9f69b0088e3f09417b9a07a357b8f303b79b9145383548b690eb3fc1e8649fddf6a76535d6c7d96915b1a0977600725dfd9517178db6356adf880613f28125d55edaac81a063eb3632c3ff005d66c54393e23b2eefa1e1be9e935dd633d3b731e6f730f21ae1b71db67f29b8ecad4337eaaf4fcf639f5346264933ea307b49ff0084a6767bbf93b169f2bcc08638c67d3abcff00c4792965cb3c988837bc76be1f4e927862eec7b29355aea7d1fa874c7edcba8867e6dcdf7567fb7f99ff005c550482af02242c1047838f284a06a40823a11ab3d66125194904bfffd4ec3a57d51e9f435966637ed7900ee3ba7d269fdd6d7f9ffd6b1740c6b58ddac021ba6d1a00a43423c0f1f953384b64687b27ce7299b91b62c7871e3150888f97ed59e60027c63fdc8758fd1349e5e0b9df12a6f66ff74f046899e2d2e0d690d0411ba24ffe4505e8efcac6c3a8bf22c6d2d7383585e625c76eddbfbcb99ea18d6e2f51b681ad77037d03f924fe96affacd9ff81ae98e1d25e6d3eeb0b637bb531e1fd540cbc265b58aef69d9589aaf67d267eee9fc96fe77e7ff008451e48710f1dd9314f825aec742f2b658eac69bda3c2263e09b0ba75fd56df7b76f4ea9dfa69306d7b7ddf6767e77bbfc23ff00315bcc1975e5b301c40bde40ac81ed7879db5d8c77fafa6baac7c7aaa63595b036bac6dada380d1a35458f1d9d7a3632e5a88e1de5d7c1af8f9b5e730b5d5ba8bda3df4bf91fca6b9becb1bfd44760d8e11dc0fc0c27b7129b20910f6996bc6841f10a4da9c1a373b73c4cba227e4ac34d958d6bda6b7b43dae041691208f0d573bd4fea662dd3674e70c5b3526b209ac93e5f4aaffadae908d42424cf876fb93a1925037134b32e0c79454e225dbf7a3e527cd7f61757fb68c1fb39fb416978d46c2c1a1b3d69d9b373bfae92f49dbaeeef3f824a7fbdcbb0dbfe734ffd198ff78eff00f33b7f7bfacfffd5f4f2ff00d0824fb9a01fb94c6a3c88546dbbd289301f2d1e64fbdaadd4e9603e451a5acdb0479f74a011f0329819048ee014e098f90494bff0309b5d3bf629fb2673835a49e0493f2492d57e263dd974dee682fc6dfe8f6da5e365a40fea2b9d907161f50ba3f9c970f813211678fbd25280d35f8a7ed092450528a62601f24e7942bac6d6d73de604812928a4ed0921cd9ce9bbc3b4ff00e73ed49155bfffd6efbaa31cfc4b8d7fce06efafc9d5fbd9fe77bd5ac2b3d5c7a5fc6f6031fd66b1c877bf734eed3769f2e1c96190dad8ce1a00da7c34d89cb5b559f69feaff0012a730cf90426132e07c0a96e1b3e5fc52fe28fe0cc9f69f28fc8abe5bb7b3d11c3dd0ef87e7293de4b481e034f928069758defee4825b4000cd381c0f825303e01443a5a476039f15568cac8b7a8e5633b1dd5d38edabd3c874edb0bfdcf6b3dbb7f451f98f41344fd1bb3aa7eea13eef9c7f14e0ea3e6929532ef80fca83731afbe90e3f44b9e1bd8b80dadff33722b6773876d153bcbdf9f508fd1b2b2e71ee493ed637fefc921b3bc6fd9f9d1bbe5f47ff003249571226dd7570d7c802dffaa7248a9fffd9003842494d042100000000005500000001010000000f00410064006f00620065002000500068006f0074006f00730068006f00700000001300410064006f00620065002000500068006f0074006f00730068006f007000200037002e003000000001003842494d04060000000000070006000000010100ffe11248687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d27efbbbf272069643d2757354d304d7043656869487a7265537a4e54637a6b633964273f3e0a3c3f61646f62652d7861702d66696c74657273206573633d224352223f3e0a3c783a7861706d65746120786d6c6e733a783d2761646f62653a6e733a6d6574612f2720783a786170746b3d27584d5020746f6f6c6b697420322e382e322d33332c206672616d65776f726b20312e35273e0a3c7264663a52444620786d6c6e733a7264663d27687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e73232720786d6c6e733a69583d27687474703a2f2f6e732e61646f62652e636f6d2f69582f312e302f273e0a0a203c7264663a4465736372697074696f6e2061626f75743d27757569643a30313535333364302d313262352d313165312d383230312d663266633033633830626266270a2020786d6c6e733a7861704d4d3d27687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f273e0a20203c7861704d4d3a446f63756d656e7449443e61646f62653a646f6369643a70686f746f73686f703a36633730626435352d313262332d313165312d383230312d6632666330336338306262663c2f7861704d4d3a446f63756d656e7449443e0a203c2f7264663a4465736372697074696f6e3e0a0a3c2f7264663a5244463e0a3c2f783a7861706d6574613e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a3c3f787061636b657420656e643d2777273f3effee000e41646f626500644000000001ffdb0084000202020202020202020203020202030403020203040504040404040506050505050505060607070807070609090a0a09090c0c0c0c0c0c0c0c0c0c0c0c0c0c0c01030303050405090606090d0a090a0d0f0e0e0e0e0f0f0c0c0c0c0c0f0f0c0c0c0c0c0c0f0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108008c006e03011100021101031101ffdd0004000effc401a20000000701010101010000000000000000040503020601000708090a0b0100020203010101010100000000000000010002030405060708090a0b1000020103030204020607030402060273010203110400052112314151061361227181143291a10715b14223c152d1e1331662f0247282f12543345392a2b26373c235442793a3b33617546474c3d2e2082683090a181984944546a4b456d355281af2e3f3c4d4e4f465758595a5b5c5d5e5f566768696a6b6c6d6e6f637475767778797a7b7c7d7e7f738485868788898a8b8c8d8e8f82939495969798999a9b9c9d9e9f92a3a4a5a6a7a8a9aaabacadaeafa110002020102030505040506040803036d0100021103042112314105511361220671819132a1b1f014c1d1e1234215526272f1332434438216925325a263b2c20773d235e2448317549308090a18192636451a2764745537f2a3b3c32829d3e3f38494a4b4c4d4e4f465758595a5b5c5d5e5f5465666768696a6b6c6d6e6f6475767778797a7b7c7d7e7f738485868788898a8b8c8d8e8f839495969798999a9b9c9d9e9f92a3a4a5a6a7a8a9aaabacadaeafaffda000c03010002110311003f0041e745e75422bd0f6cf6be0b2fc892cc220a17d721905694fb43c7da992e069f1e8a166b91cdd968aacbb1f1a7cb08c7dec279f735dc874b82c773bd294a751ef92e06a39ef9aa492935a928682a3debd3e795ce01cac33f82934d42aa189217ed0ad477df00806472f457171f02ef42828bb9aef91f0c33f1881ee5af7b12342aeea9249ba2337127e55209c8115b37c0ca5bc41215feb2a4d7a6dd16bd3fb710194a745136d39219ab4edef9094436432c964939a9245763d0d29888db319bbd7c73911d7957e7ed91a67e2169ee2bd0537f1a63c2d91ca0f24489c9b763c4f11fb55dab519570379cc6c17fffd02bbc71c8290031201503a67b8637e39d4cb70875e218f214246c013bfcfeec91b6a888da5f285673c87c2412a7bfe39301c791b2d4056a0b10280d29d713c96077dda6065906fc5294a50ff99cab21110e569e3299dcecf34f3e7e605a7963d5b3d3c4779ac29e327a84fa36e37af3e2c393edf636a77f0cd176a76d43480c4519777eb7d07d99f6272769119335c31f7f597bba579bc72e7f33fcd77a3e1d5e5b7575a7a16a891ab5411b1e2587d0d5ce4b27b45aa91da55e429f4ec1ec2765e2038b1f111de4feb4b432ea024b9bb9a58e620b3cf24adea13dfe2724b7cb3593d5e499b3237ef2f518fb3f4f0870471c44474e11fa9967933f3164d12fd74cd4ef9eeb479494ac9f1cb0bd3e0e041dd4d2847d39baec9edb9425c190d83dfd1e2fda7f64316aa072e08d4ba81c8bd62dff003174f95a530dcc5e9c6c4941cd8d06ff006c5457dba7be6fa5daf0ef0f203d8bc95b095fbb6b66da46b5a76bf642fb4eb91711d784806cc8f4af19177a1cd9e0d4473478a2410f2daeecdcba3c86190189f34ed55b8b71054002bdab4fd797875f2bbd9489e5515efb8f0c0453281b4705a5a36e2840fbeb90ead9d39bffd12cb9e0edd00209edd33dc60fc6f9844f3ef286e2ad4276000e2f4db1069801c5cf92577340e2847151d57be5b1e4e34fea5d0902955076daa3eedbbe44dd33850e6c27f307cc73f977cbd35d5837a57979325a5bca2a1a2f5393348bdaa154d3de99a4edad61d2e0321ccec3e3fa9ef3d87ec78768eb6a42e111647ddf02f90e711dfb977731c059bc188626a4904f73bd4f5cf30c990e43679bf45421180006c11a2168a38622c54c742b2a0e48c3b1a75df2b2dc22ad77773c50a871c9cb5011f606dbd6a31324d7463ecccce25e2143579f4a713b114ca0964595f961e9ead250630d4442bbd7a1af5a6646396cd662f5bfc9fbc71aeeb9688795b5c5a89762405921900af1f70e77ceafd99cf539e3e9cdf35ff822693f758f38d883c27e2fa35492a16bbd3bd73b27c849df9a9914714f1dcd31580add321fef393c47103c7df234d97d5fffd22c9d95092483bf73f867b8c1f8e731e1f9a18ba7200d6b5ad074afcb100b0063695dc9569093f05071a0aee7c4d72c8ece3e4a26f92ee3e9aab302dcd3e1353b1c00daf0f0d58bb7cd5f9d5a95e49ae69fa32cd20b2b5b3499ad03108f34acdfbc2075214002bef9e7ded56a4cb2c71f402fe25fa03fe067d9d1c5a039bf8a72fb074623e59fcbdf39ebab692697a1dc5d45793048ef40fdcaef42ce4d28bef9c3e4d6e3c77643ebba7ecccd9aaa357d4f27afe91ff38e7f99377a8db5b5d68725adab15336a02685e202bfb2124624fd198d3ed38579b9d0ec2c97ea2283ddad3fe7156dedec1db55d4ae6ecb6ef6d6c0afb90c6bbe60cfb4a6796cecf1f64611cf779a79eff20ec34eb4f574f8e58dbe2a165607e104f1a7bed8706b8deecb53d8b8e58ff77cdf32c9683482ea8cc0d4a4f1d6b471519bb84c11b3c865c2719a3cd987e55b489e78d318b0449edee93e0a2871e937500efb8afcf3a3f6725fe135e45e17dbc803d9a49e928beb6a10aa07c20773d6b9e842aadf0890dfdce61f1000d1bdfbe02d80526a107d5db7f8b8823efeb90bddb40d9fffd32a9c554b5397227967b8c0bf1c67085e6a85486e3d8d476c365ac50ea954dc59cf10491d589ad4e581c59917b22810b1d4d4fc036e87224368d85be66fcd5b67bdfcc0d0ed638bd49aeed2d6255e81f94cebdbe7be799fb5f2e0cf7fd11fa5fa47fe05f0397b3e313fea87e5b3eedfcbbd2adadece28fd1e02dca058d000a152833c9f39f5597e86fa62223a3e9fd28178633f54f4d001c4d3df2503b726922930b8445563e9372aefb1a57e5965a620bce7cc963697eae93c012808e0ca295f1ca666cb746462f807f3cfcad616b63fa534fd36285a0b9e37b2c4021e12540269407e2f1cdcf66e637c25d1fb41a51e10c806f7bbcdff00246c525d6753be78fd4fa95a7a71ca77e0d3381b57a12aa46ddb3d0bd98c1c59653ae43ef7c2bfe087abe0d3430dfd52dfdc1f4eb934a8dc506d4cee80d9f18c964da98a9915a80927a60669af2f80257e3a7d9ed91ead97b5757fffd428baf863049db91269db3dc61bdbf1c6a4d4506c59b7e2a028a2d0f53dc62366b95cba2011034aa1aaaac0d08a135a65865b344217256995d5142a1e2c286bdfeec88219cc1142b9a5daff009663d422f2c5e4b021b94d7ec5b4d9f89f51234127d642b0fd96056a0f70299e29ed46ae53ed2cb1276000fb1fb2ff00e07bd978b0fb3da59c07a893227bcc89fd8c99ec759d326d4af079e6f6c25d32d9efeead20d2dae6decedc3001a429f652a5579354927b9a67318c4721a1125eef30981c46541ee5f95bf999e69b99ad2d75b9ac759d2a6a0b6d4ad62785dc02455a27008dc508a572ac9310daa9963c5231e2bb0f5ef3df9bb54d334be1a4594316a339e51dc4d1931a8f90df2033c41dc360c729722f98a7f38eb7ac5f4d61e60fcc3d274ad4ed10bdc69d65613b491210b43231a282390249206e3c72e988116625a61c60d716ec27f31fcbbab4fe50d4525bd8b5196e5a15b7d4224312c91cb320e4c80b508e5bd325a59c633042f680965d3987535f7a174cf22695e46d3e1d3f4a9d75086e628e79b5aa286ba94175909e2580e048502bb0f7ae77dec56be5932e4c6791008fb8be2dff0005cec2c7a6d269f511fa813197cac7e947b2b6c01fb2a0915f1cf460f801bba5150165a712483b6fd30f34934531eaa5a8683dfc7df21d5b2fd36fffd522b8321f849037ad3c467b8c29f8d339913480b91e9c944057c4f6fa064e3b8ddab2c7865e941a970c1977653b6f86b66be2368a9de46014b7154145ea2b5f9e42806fe2913bf465ba7d9dd5c69fa6de9ab4369789095a557e3e44bf2ec55a9f41cf11f6b6021da53fe9007ec7ecdff818ea3c6f677046be9247c897d23a6f92746d52c667b8ff00488f50b56b2bf82a0a4f038a345229a820fe1db394c19250360d3dfe488c838642c21b5cd32cfcb765a358592476967a2c220d32d235148625dc220ec2bb9f13b9c86ab29c9cf9b2d3e011d8724ce577d4e4d2d6e899a278d6370e362180eb43d7be510918c816f9e30027f37e586897bab6a1e649e2075cd52c52c350d482aac935aa5291b30a7da0aa188dd80018919b49e59ca340ecebe18a1097156ef27fccbd3a28ede2d1e0856613b2416f6a806f435e229d3619898fd0493dcdf765e5de62827b1e36971122ddcf335cccb17f771f3552638fc42b6d5ee77cf43f60b4a4cb2e63b0d80fbcfe87c5bfe0dbdab038f4fa58ee6cc8fbbe907e3bfc98accee5b891bd07c63f5ed9e9b10fce8664ca94d5979281fb23e2627ae202ca7d0047f2341b0e34df714fbf2a6cb3c34fffd627ba5aab1e24711f687635dab9ee102fc739e3612395d9a4ebd76a0cb80a70a72329281a192aabc6bd86282af316e14ea001b9dfc3a641be3b84c6d6eee218c451dc3a42c41788310a483b123a6739dadd978355194a70065c240343886ddefa37b27ed1eb3b3b263863cb218b8e24c6cf0f3166aeacf57d43f97fe621e8c704ce1780ad6bb6e6bfc73c1a63c39905fb1e3212008ea157cffa8c7f5fd3e5825b4b8677558e1b8770a80b02e592305892a28a7a0ea41c48e2e4df097082ab71adbea1e60d32d56df4ed3ac8a2baf19996e1654a15702823642a284753ed898f9289822deb3a96b30db5a310ebcca0ad0f8786f86592b60d020f943cd1e63bcfd34d796d2fa725a92617fb5f113424835ea36ce9fd98ec4c7da5298ca4f081d3bedf3dff00820fb579bb07062960e13394b94aeaaafa11d7cde7d7fa95eeaf78d777937ab349b3374d80d8003619eafd97d9b8bb3f08c58f9779e64f9bf357b47dbda8edad49d4e7ae23b50ba00748d935fad012b6e415af1a6d9b301e76f72d4007abd40aedc6b535c27922346498d057a9e9b655d5caa15e4fffd728ba2cc8fb1258d5bfb73db63cdf8f73598d2412ed2815a9af5f1cc806dd748709515d9f71424d6a3f561632ef5499b9b28048aad48afdf90aa6e06cec8db2867bd9ed2cad2132dcddca90dbc2a2a5ddd82a81f32735faa9080249d807a4eca81ca63180b91341e8de5cd4633ce2b5bb59c4133dafd6a204248d0b18cb46580aa961f0b528c3e21b119e0fdad861f98998fd37f7bf6bf62e5c87498865faf845a6f6973afcdaa4cb69a758a5dda92d713dc49c64914ec1848fb6e36a2e6363c024367a0c711c3b94e750b9f33402d66b9b3d2cc4ad486d119656269b8a26ebf3c67a7db9b3e1c663b14c6e756bbb7b2892ec2c1318aa62462ca0b1aec4efb7be61471f14b6708cb843c7b56b969eea570a40e84fcf3d93d8fd0f81a3e33ce66fe1c83f2eff00c15bb6bf39dabe00fa708e1ff38ee7f52468c031e4373daa4fdf9d8443e5394ba43203462429de83afd38580e2ebc952dd505640a0b92284d6b8d9e4bc311b808edebdc536ad475cadc8e9cba3ffd021baba5e055c7124ec7ae7b74606df8f726515479a501bd493911c8efb8cb6e838dc3c52b2a7180d271ad07891d0f6c902e3c86f569a69ba2eafe60be8f4ed1b4cb9d5af48f82dad2269a4e23bf1404d3dce53972c318b910039da5d265d448471c0c893d377df7f911f90d75e5bd31bcd5e64d389f34dc5bdc358d8b907ea717a2ccabc771eab71dcefc41e23be79ff006f76bf8f2f0f19f47dff00b1f7cf61bd95fc84066d40fde9e9fccbfd3def8ebcbda56ab71a541a9bd8b595fdc72b8b9b1a6f148cc4bc4c07753b1f7cf31d56a78f3489ea5fa074da618f04603a065f67ab6971464ead6c4ca09aac8c5371e0450d3316e40fa793930c8626ed365d6fca6d073b58112e1053946ed37ca8096c94bc4924e5e2e7ba5a526d59dee25530db0148607fb6c7b13e0311210d87362237b94cbcf3f973ac0f2f792fcdba0e837173a56ade5bb79f53b8b54698adc472ca8f3481412048815835294cf61f65b5d03a48e394858e5ee7e5cff824763e58f6964d4c204c25cc8e424f028cee473143b134a8ae76317c9b2dd904a93c92ab156de8a287dab8655cc31c7298d8a36dd8eedd0375ef5db225b46c6d1442f21bec41efde9955b7f0bfffd187dd9e4090a06e7e23d8537cf6d12a7e3c387c435e6cf3c91f94df981e7e9628bcafe5abbbbb6982b3ead2a186d1518d397acf40df25a9cc3d4769e0d30bc9300f775775a2f6735dda12034f8c91d65fc23e2fb43f2eff00e709a384db5ff9ff00566b970c1e7d26c9bd3b7029f65e62048df35e39cd6b7dace98457997d0bb1ff00e0638e044f572e223f863f4fc4900fc9f5cd9791bcb7e5582db47f2c69567a5597a60b476b0a45ea94fda6651572077639cb66d6e5cfea9924be99a1ecbd368a3c1860203b80655676812f6263fddd1edf8fb18c8ad3e8cc5cbc853b08732f8bff0031bc9d69e59f3a6a56d1d9fd4acf5566d42cd42feed8c87f7e108000025a923b721d88ce53b4f0f065be8777b6ecbd478b845f38ecf24d5741b549feb10db2c8dbb955505aa3dbbe60590ecc594aefae21d5238edac7495b258957f485c7d5fd1e720d828341503273cc486c10e1dcb69a1cfaa5ee85e4ed09127f3179a2ed2cb4f2c0911093fbeb86a0a848630ce4fb64f4f8ce4900d1a8cde16394cf21f8fb5fa3b7ba15ae8ffa3349b08c25ae99636d6765b051c22411af4005680573b3c47861b747cf337aa46fabcc7ce9ff0038dbe41fccbd3dee52dd7cb1e62f88c1ac69f1a28790d7e0b98c00b20aef5347f06cdd68fb7f3e96547d51eefd4f1ddb1ec5e8fb481311e1cfa10399fe93f3a7f343f21ff307f2b6ea41ade96d7fa3283f57f31e9e1e5b42a3bb9e3ca2dba8703e673b5d176be0d6006068f71e6f91f69fb2facecb91f16371fe70de3fafe74f208d5949dc74f85b7cda121e64c0f1f30ae5f75f1dfb6d5f1ca6f7732b67ffd2fa3ff957ff0038a1e4ad060b5bcf365b279b7cc2acb3486753f5381d6878c501f84807f69c313e033a9ed0f6873652463f447ed2f9df637b0ba3d1c44b30f1326c7c81f2fdafafecac6cb4f436f671c71b46a1d6de101178ee147c8529ed9ce4b2191ddee2388446df21c91770c7d1999800638c385eab4a9ad477a532311669b08dad8e5b56e2e351bc75f8a18d22b6a9a83c9413964cd6dd18c402477a669122dc2c801fef1eadd1400addf23236002885d9a7cf7f9d31697f983e54d5b56f25ead6bac6a7e44ba376c6ca412ab98e3ff4ab4665a8ab45f182b51c900ec69aded0c03361db9c5ddf646a3c2d470cbe993e4f469aeed2def5a29268674125b5dc5d687dc672c091cdece340d0625ac6bad688e64173308055617d97c012001535e9b64c0e26df0c1ee7bc7e4f792fcc1f9737b27e6b79dfcb775ac798a7516ba2f976da5884fa7585c0fdf5cb2b30432b29e2232c085e55218d33a0ecfd19c63888dde4bb67b4a19ab163371bb27bcbec68753d27cd76716ada64e6580b9af3468e48d9101f4e44600a9dbc37ed5cdc425e92f373fa93dd3c7d5ef278129c5a456029d55813f811867b808800135bfb6b7bd8e4b2bb816ea0990f289d41a83b11bec76ec7218e4606c1a659a1198e190b05f21fe66ffce227947cc8b2ea1e4c75f29eaf579268228b95a4acdb8e7083f07ce3a7c8e74fa0f697263f4e51c41f3fedaf6074fa9f5e9bf772e75fc24f79ea3e0f85af7f21bf32b4ff003be8de47bdd145bea9afcd347a3df3480d94eb023c92bace2a0058d0b15203d3f66b9d247b5b04b11ca0ed1e7def013f65f598f511d3ca3529fd27a1006e6fdc2fbdffd3fbd91c62ddd1010a8432aaf8b1dc7e15c9995b408901cc8b32315f85b8300e36208dc7ebc79140de2819a29aee010970ae232651ddb8b1cb22446568e714330bab5d3d520b4595cf12cccdc00008af2fb47b536189f54988f48b296ea1e5e7d76ce6b7d5aefd4b69595fea305638a847473f69e86bd4d3db18c802890f4ec96c5e595d0bd5934cd3e2b9b56844179608023bc47e21c3b73562695d8d48db2040913e6dfc66241ee7cffe73f248f2f69f79e65f2cc05f4cb5533ebfa248811ecf972669d63249095fb6bfb3d56ab5a6975ba2e0b9c39773d3767f6a78de8c8773c8f7b18fc93d362f3679b6fb57bdb38efad7448c5c698e9408b7b2481212c2947a27361e0457c32aecdc02733223933ed8d51c58c401fabee7dac9a45b7a122bc61da53f136e491df73e3be6f848879531b16c7ee3ca115b5c2ea1a1cbf50d45e131c95f8a291684d1d0ec457eeed921215c9891ea0c8e2b192195252472e31aba8248aed5a577a7cf1e3b8d2f0514ccafef50ff002a30fbc8cadb696c6599e7da8b550a7c7e107f8e2a2cda1dace296e52e648d4c96cc4c2c474aa15247bd188afcf24266a9ace20483dcff00ffd4fbc5eb99b4b49a8a258a259401fcd18a9a7dc4648c68d3509da2ede459150a9f86604fcaaa0e121863dc52db70391e4c03a73561e236df0c961c959550b142410e84015f7fedc8dd165116296c71f11e9b1ad548527aec6a3f5e1bdd023629ca0fd92a68eaca4fc8d47ebc4a23bc692dbeb6b59e3799e31f5a589a042c00e55e88c0ecca6bb83b61adf758ca858e61817e587e5de93e43b1d57f46c251f59d467d4a7e4a142198d238230b4a470a00a83b6fe395c71471820757233eaa7a99094ba0a7aacac4290bd69451ee761faf086b2775dc3bfed000027c31b5e1ded50f6f98c0ccac6af2040f6c218c94f9044714e3c4d0fdc0e2c6e834588b70dfb4cbce9f45698191e54fffd5fb62dab1b5e31392c922490f1f992c3efa8cbf8777189d8328d16e2392d6d0c6418c55548e940bb64661606934428d32bad096e4a7eeaff0c079271ef65b89c17154150e56a7a8f86bfc304852e23b7c55a32198d54550fc3ed506b808658cdfcdbe5574edf191f81c484c4d9f8a41adcaacd6768adfbdb9b950aa3a9e2189192adad8c65b94eed6dc5ac11c3c8b91f689ee7f1c85b608d057ad5b7e8294fc7150775d5a9a781feb81376d1a92b4f1dfeec2b7bb8d792d37f118a0f340dcbaaa5d331f868a807b91d3e9c218cba9419d492824087d1e5c5890694dd790f62c40fa0e110e8d6726d6ff00ffd6fafde7f4bb4d1350b9b4e4d2e9e897b6814d0c925b559e3aff0095192bf4e5c376822a996f913588756f2f691a9dbb896def92396375e855d5e94fba9865d18447365d66cc970518d489cd478551bfa63907dcb88d5a6103032495d8acbfc186098fb9303f7aa5bca0b3edfeece23ee391985c479fbd4fd5547e721a0590fc47fd56c245a206acf9b0eb12dab79b26bedcdb68e9f56b44ec5e621a47fa15683259050a4e2e7f1678ec7d4405805a82a3b9d8d7296d277723866d8f73fab090c612b5e8436e3c4e02ca06dcbf689ad46ff862b143892b3d14ed1af27fa7a0fc3090c04bab18f31a5ddeae9da5db0789751bd26fae90d1a2b7850bbf1ff29e8107ceb8852764dbf76b198b80113a08fd03d4a852a1077fb209c970ef4c0cbd36ff00ffd7fb41ae242f6f72a5c4d0c28c1c0df973af2a7ceb4cbe5b46bab8ff0054926fcb7b43a3f97ec346e9269d58e28c1d9956793e11ee036d801f4ac4512f49825537a08db9cc0f13db66cb263d21863dad3086421e6e476f5940ff0086c8cfa7b961c8a9c532c6656762024c0d3e618531c82e971f22926a17aeef344ac40320fa3ed64e51a0171f56fcad11433c877f5662ccdeea0ffcd590cdcd716cca679951bd57211224776726800006e49f91ca806c26c5a0b4bbd86fa286eade78ee21916468e789c48922821432b2920f43d0e4a605ecc61718ee13189c0622b4f8599bc36a0c8499633515446ebe1c49afd3fd9894c4fa6d076ecaef75c5c3399423007a506c0e48b583b530cf31eb0d65e62f2ddadbc83d7b969cc5013bcbc885200f61bd7b0c48f4b3ea550dd4d71aba30a25b69c865343f0bc92b7a55269f6457244fa835d7a5ffd0fb1da9f2faa7eeb970a1f5ba57fc8ff86a65f2e62da61c8a9f97fd6e1b57d5f564fb3e3cf6a7bd704791631fa99eb73fafc7ea7fbd354f529fcdf477a75cb3f803087336891ea7ad73fcbeaa56be3c9ba60cbf485c5d50775eb736e35fefd2bff0dd30cd38b994b9b8fa9273ad799f53e7c5a993c9f4a21d537b1f4ff4747c3970f59fd7e3f35a569da9944fea651ae152f37fd4ff00c2daff00e90f5ff45fe85bdfae7d5ffbff00abfa127ade9f2db9f0af1af7eb911cdc8d2f171c382b8ac55f7db12fc91ff0c7fcaa7f267f83beb7fe1dfd103f44fe91f47eb7e9fab2f3f5feaffbae7cebcb87c3e190c7d1bfb53c5f1f278b5c7d6bbfabd360ad5ab5e7e82f5e9d5abf4e4cd5b81fc3b772223a723cbfbcf4f6ff005791c079a47d0a16d4f5ae2bfde7abf17ca838e12c0730f31d6feaff00e36d37eb3c7ebdfa264fa9f4e5e8f33eb70fa695fa325d0361e4533b7f4bea97fc6bf5af563f52b5fee7d4da9da95cb7f8da37e17fffd9, 'photo1.jpg', 'image/jpeg', '20139', '110', '140');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_reportto`
--

CREATE TABLE `hs_hr_emp_reportto` (
  `erep_sup_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_sub_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_reporting_mode` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_skill`
--

CREATE TABLE `hs_hr_emp_skill` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL,
  `years_of_exp` decimal(2,0) DEFAULT NULL,
  `comments` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_us_tax`
--

CREATE TABLE `hs_hr_emp_us_tax` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `tax_federal_status` varchar(13) DEFAULT NULL,
  `tax_federal_exceptions` int(2) DEFAULT '0',
  `tax_state` varchar(13) DEFAULT NULL,
  `tax_state_status` varchar(13) DEFAULT NULL,
  `tax_state_exceptions` int(2) DEFAULT '0',
  `tax_unemp_state` varchar(13) DEFAULT NULL,
  `tax_work_state` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_work_experience`
--

CREATE TABLE `hs_hr_emp_work_experience` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eexp_seqno` decimal(10,0) NOT NULL DEFAULT '0',
  `eexp_employer` varchar(100) DEFAULT NULL,
  `eexp_jobtit` varchar(120) DEFAULT NULL,
  `eexp_from_date` datetime DEFAULT NULL,
  `eexp_to_date` datetime DEFAULT NULL,
  `eexp_comments` varchar(200) DEFAULT NULL,
  `eexp_internal` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_jobtit_empstat`
--

CREATE TABLE `hs_hr_jobtit_empstat` (
  `jobtit_code` int(7) NOT NULL,
  `estat_code` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_mailnotifications`
--

CREATE TABLE `hs_hr_mailnotifications` (
  `user_id` int(20) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_module`
--

CREATE TABLE `hs_hr_module` (
  `mod_id` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `owner_email` varchar(100) DEFAULT NULL,
  `version` varchar(36) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_module`
--

INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES
('MOD001', 'Admin', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Admin'),
('MOD002', 'PIM', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Functions'),
('MOD004', 'Report', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Reporting'),
('MOD005', 'Leave', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Leave Tracking'),
('MOD006', 'Time', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Time Tracking'),
('MOD007', 'Benefits', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Benefits Tracking'),
('MOD008', 'Recruitment', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Recruitment'),
('MOD009', 'Performance', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Performance');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_payperiod`
--

CREATE TABLE `hs_hr_payperiod` (
  `payperiod_code` varchar(13) NOT NULL DEFAULT '',
  `payperiod_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_payperiod`
--

INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES
('1', 'Weekly'),
('2', 'Bi Weekly'),
('3', 'Semi Monthly'),
('4', 'Monthly'),
('5', 'Monthly on first pay of month.'),
('6', 'Hourly');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_pay_period`
--

CREATE TABLE `hs_hr_pay_period` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `close_date` date NOT NULL,
  `check_date` date NOT NULL,
  `timesheet_aproval_due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_province`
--

CREATE TABLE `hs_hr_province` (
  `id` int(11) NOT NULL,
  `province_name` varchar(40) NOT NULL DEFAULT '',
  `province_code` char(2) NOT NULL DEFAULT '',
  `cou_code` char(2) NOT NULL DEFAULT 'us'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_province`
--

INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES
(1, 'Alaska', 'AK', 'US'),
(2, 'Alabama', 'AL', 'US'),
(3, 'American Samoa', 'AS', 'US'),
(4, 'Arizona', 'AZ', 'US'),
(5, 'Arkansas', 'AR', 'US'),
(6, 'California', 'CA', 'US'),
(7, 'Colorado', 'CO', 'US'),
(8, 'Connecticut', 'CT', 'US'),
(9, 'Delaware', 'DE', 'US'),
(10, 'District of Columbia', 'DC', 'US'),
(11, 'Federated States of Micronesia', 'FM', 'US'),
(12, 'Florida', 'FL', 'US'),
(13, 'Georgia', 'GA', 'US'),
(14, 'Guam', 'GU', 'US'),
(15, 'Hawaii', 'HI', 'US'),
(16, 'Idaho', 'ID', 'US'),
(17, 'Illinois', 'IL', 'US'),
(18, 'Indiana', 'IN', 'US'),
(19, 'Iowa', 'IA', 'US'),
(20, 'Kansas', 'KS', 'US'),
(21, 'Kentucky', 'KY', 'US'),
(22, 'Louisiana', 'LA', 'US'),
(23, 'Maine', 'ME', 'US'),
(24, 'Marshall Islands', 'MH', 'US'),
(25, 'Maryland', 'MD', 'US'),
(26, 'Massachusetts', 'MA', 'US'),
(27, 'Michigan', 'MI', 'US'),
(28, 'Minnesota', 'MN', 'US'),
(29, 'Mississippi', 'MS', 'US'),
(30, 'Missouri', 'MO', 'US'),
(31, 'Montana', 'MT', 'US'),
(32, 'Nebraska', 'NE', 'US'),
(33, 'Nevada', 'NV', 'US'),
(34, 'New Hampshire', 'NH', 'US'),
(35, 'New Jersey', 'NJ', 'US'),
(36, 'New Mexico', 'NM', 'US'),
(37, 'New York', 'NY', 'US'),
(38, 'North Carolina', 'NC', 'US'),
(39, 'North Dakota', 'ND', 'US'),
(40, 'Northern Mariana Islands', 'MP', 'US'),
(41, 'Ohio', 'OH', 'US'),
(42, 'Oklahoma', 'OK', 'US'),
(43, 'Oregon', 'OR', 'US'),
(44, 'Palau', 'PW', 'US'),
(45, 'Pennsylvania', 'PA', 'US'),
(46, 'Puerto Rico', 'PR', 'US'),
(47, 'Rhode Island', 'RI', 'US'),
(48, 'South Carolina', 'SC', 'US'),
(49, 'South Dakota', 'SD', 'US'),
(50, 'Tennessee', 'TN', 'US'),
(51, 'Texas', 'TX', 'US'),
(52, 'Utah', 'UT', 'US'),
(53, 'Vermont', 'VT', 'US'),
(54, 'Virgin Islands', 'VI', 'US'),
(55, 'Virginia', 'VA', 'US'),
(56, 'Washington', 'WA', 'US'),
(57, 'West Virginia', 'WV', 'US'),
(58, 'Wisconsin', 'WI', 'US'),
(59, 'Wyoming', 'WY', 'US'),
(60, 'Armed Forces Africa', 'AE', 'US'),
(61, 'Armed Forces Americas (except Canada)', 'AA', 'US'),
(62, 'Armed Forces Canada', 'AE', 'US'),
(63, 'Armed Forces Europe', 'AE', 'US'),
(64, 'Armed Forces Middle East', 'AE', 'US'),
(65, 'Armed Forces Pacific', 'AP', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_unique_id`
--

CREATE TABLE `hs_hr_unique_id` (
  `id` int(11) NOT NULL,
  `last_id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_unique_id`
--

INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES
(1, 2, 'hs_hr_employee', 'emp_number'),
(2, 9, 'hs_hr_module', 'mod_id'),
(3, 0, 'hs_hr_leave', 'leave_id'),
(4, 0, 'hs_hr_leavetype', 'leave_type_id'),
(5, 0, 'hs_hr_leave_requests', 'leave_request_id'),
(6, 0, 'hs_hr_custom_export', 'export_id'),
(7, 0, 'hs_hr_custom_import', 'import_id'),
(8, 0, 'hs_hr_pay_period', 'id'),
(9, 0, 'hs_hr_kpi', 'id'),
(10, 0, 'hs_hr_performance_review', 'id'),
(11, 2, 'ohrm_emp_reporting_method', 'reporting_method_id'),
(12, 2, 'ohrm_timesheet', 'timesheet_id'),
(13, 0, 'ohrm_timesheet_action_log', 'timesheet_action_log_id'),
(14, 0, 'ohrm_timesheet_item', 'timesheet_item_id'),
(15, 0, 'ohrm_attendance_record', 'id'),
(16, 0, 'ohrm_job_vacancy', 'id'),
(17, 0, 'ohrm_job_candidate', 'id'),
(18, 106, 'ohrm_workflow_state_machine', 'id'),
(19, 0, 'ohrm_job_candidate_attachment', 'id'),
(20, 0, 'ohrm_job_vacancy_attachment', 'id'),
(21, 0, 'ohrm_job_candidate_vacancy', 'id'),
(22, 0, 'ohrm_job_candidate_history', 'id'),
(23, 0, 'ohrm_job_interview', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_advanced_report`
--

CREATE TABLE `ohrm_advanced_report` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_advanced_report`
--

INSERT INTO `ohrm_advanced_report` (`id`, `name`, `definition`) VALUES
(1, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="empNumber" label="Employee Number"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM ohrm_leave_type WHERE (deleted = 0) OR (SELECT count(l.id) FROM ohrm_leave l WHERE l.status = 3 AND l.leave_type_id = ohrm_leave_type.id) > 0 ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="leavetype" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="false">\n                    <field_name>ohrm_leave_type.exclude_in_reports_if_no_entitlement</field_name>\n                    <field_alias>exclude_if_no_entitlement</field_alias>\n                    <display_name>Exclude</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="false">\n                    <field_name>ohrm_leave_type.deleted</field_name>\n                    <field_alias>leave_type_deleted</field_alias>\n                    <display_name>Leave Type Deleted</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>leaveType</field_alias>\n                    <display_name>Leave Type</display_name>\n                    <width>160</width>	\n                </field>s                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.leave_type_id as leave_type_id,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.emp_number,empNumber} AND \n    $X{IN,ohrm_leave_entitlement.leave_type_id,leaveTypeId} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.leave_type_id\nORDER BY A.leave_type_id\n\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 1 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 2 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,emp_number,empNumber} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.leave_type_id,leaveTypeId} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY leave_type_id\nORDER BY ohrm_leave.leave_type_id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="unused">       \n    <query>FROM ohrm_leave_type WHERE deleted = 0 AND $X{IN,ohrm_leave_type.id,leaveTypeId} ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>160</width>	\n                    <align>right</align>\n                </field>                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n\n    <join>             \n        <join_by sub_report="mainTable" id="leaveTypeId"></join_by>              \n        <join_by sub_report="entitlementsTotal" id="leaveTypeId"></join_by> \n        <join_by sub_report="pendingQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="scheduledQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="takenQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="unused" id="leaveTypeId"></join_by>  \n\n    </join>\n    <page_limit>100</page_limit>        \n</report>'),
(2, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="leaveType" label="Leave Type"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n        <input_field type="text" name="emp_numbers" label="employees"></input_field>\n        <input_field type="text" name="job_title" label="Job Title"></input_field>\n        <input_field type="text" name="location" label="Location"></input_field>\n        <input_field type="text" name="sub_unit" label="Sub Unit"></input_field>\n        <input_field type="text" name="terminated" label="Terminated"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM hs_hr_employee \n    LEFT JOIN hs_hr_emp_locations ON hs_hr_employee.emp_number = hs_hr_emp_locations.emp_number\n    WHERE $X{IN,hs_hr_employee.emp_number,emp_numbers} \n    AND $X{=,hs_hr_employee.job_title_code,job_title}\n    AND $X{IN,hs_hr_employee.work_station,sub_unit}\n    AND $X{IN,hs_hr_emp_locations.location_id,location}\n    AND $X{IS NULL,hs_hr_employee.termination_id,terminated}\n    ORDER BY hs_hr_employee.emp_lastname</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="personalDetails" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="false">\n                    <field_name>hs_hr_employee.termination_id</field_name>\n                    <field_alias>termination_id</field_alias>\n                    <display_name>Termination ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>CONCAT(hs_hr_employee.emp_firstname, '' '', hs_hr_employee.emp_lastname)</field_name>\n                    <field_alias>employeeName</field_alias>\n                    <display_name>Employee</display_name>\n                    <width>150</width>\n                </field>                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.emp_number as emp_number,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.leave_type_id,leaveType}\n    AND $X{IN,ohrm_leave_entitlement.emp_number,empNumber} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.emp_number\nORDER BY A.emp_number\n\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 1 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 2 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n<sub_report type="sql" name="unused">       \n    <query>FROM hs_hr_employee WHERE $X{IN,hs_hr_employee.emp_number,empNumber} ORDER BY hs_hr_employee.emp_number</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>    \n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="true">\n                    <field_name>hs_hr_employee.emp_firstname</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>150</width>\n                    <align>right</align>\n                </field> \n                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n    <join>             \n        <join_by sub_report="mainTable" id="empNumber"></join_by>            \n        <join_by sub_report="entitlementsTotal" id="empNumber"></join_by> \n        <join_by sub_report="pendingQuery" id="empNumber"></join_by>\n        <join_by sub_report="scheduledQuery" id="empNumber"></join_by>\n        <join_by sub_report="takenQuery" id="empNumber"></join_by> \n        <join_by sub_report="unused" id="empNumber"></join_by>  \n    </join>\n    <page_limit>20</page_limit>       \n</report>');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_attendance_record`
--

CREATE TABLE `ohrm_attendance_record` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `punch_in_utc_time` datetime DEFAULT NULL,
  `punch_in_note` varchar(255) DEFAULT NULL,
  `punch_in_time_offset` varchar(255) DEFAULT NULL,
  `punch_in_user_time` datetime DEFAULT NULL,
  `punch_out_utc_time` datetime DEFAULT NULL,
  `punch_out_note` varchar(255) DEFAULT NULL,
  `punch_out_time_offset` varchar(255) DEFAULT NULL,
  `punch_out_user_time` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_auth_provider_extra_details`
--

CREATE TABLE `ohrm_auth_provider_extra_details` (
  `id` int(11) NOT NULL,
  `provider_id` int(10) NOT NULL,
  `provider_type` int(11) DEFAULT NULL,
  `client_id` text,
  `client_secret` text,
  `developer_key` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_available_group_field`
--

CREATE TABLE `ohrm_available_group_field` (
  `report_group_id` bigint(20) NOT NULL,
  `group_field_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_beacon_notification`
--

CREATE TABLE `ohrm_beacon_notification` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_composite_display_field`
--

CREATE TABLE `ohrm_composite_display_field` (
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_composite_display_field`
--

INSERT INTO `ohrm_composite_display_field` (`composite_display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'IF(hs_hr_employee.termination_id IS NULL, CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname), CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname, " (Past Employee)"))', 'Employee Name', 'employeeName', 'false', NULL, NULL, 'label', '<xml><getter>employeeName</getter></xml>', '300', '0', NULL, 0, NULL, 'Deleted Employee', 0, 0),
(2, 1, 'CONCAT(ohrm_customer.name, " - " ,ohrm_project.name)', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '300', '0', NULL, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_customer`
--

CREATE TABLE `ohrm_customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_customer`
--

INSERT INTO `ohrm_customer` (`customer_id`, `name`, `description`, `is_deleted`) VALUES
(1, 'PhyPartners', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint`
--

CREATE TABLE `ohrm_datapoint` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `datapoint_type_id` int(11) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint_type`
--

CREATE TABLE `ohrm_datapoint_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `action_class` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_datapoint_type`
--

INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES
(1, 'config', 'configDatapointProcessor'),
(2, 'count', 'countDatapointProcessor'),
(3, 'session', 'sessionDatapointProcessor'),
(4, 'organization', 'OrganizationDataProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group`
--

CREATE TABLE `ohrm_data_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_data_group`
--

INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 'personal_information', 'PIM - Personal Details', 1, NULL, 1, NULL),
(2, 'personal_attachment', 'PIM - Personal Details - Attachments', 1, 1, 1, 1),
(3, 'personal_custom_fields', 'PIM - Personal Details - Custom Fields', 1, NULL, 1, NULL),
(4, 'contact_details', 'PIM - Contact Details', 1, NULL, 1, NULL),
(5, 'contact_attachment', 'PIM - Contact Details - Attachments', 1, 1, 1, 1),
(6, 'contact_custom_fields', 'PIM - Contact Details - Custom Fields', 1, NULL, 1, NULL),
(7, 'emergency_contacts', 'PIM - Emergency Contacts', 1, 1, 1, 1),
(8, 'emergency_attachment', 'PIM - Emergency Contacts - Attachments', 1, 1, 1, 1),
(9, 'emergency_custom_fields', 'PIM - Emergency Contacts - Custom Fields', 1, NULL, 1, NULL),
(10, 'dependents', 'PIM - Dependents', 1, 1, 1, 1),
(11, 'dependents_attachment', 'PIM - Dependents - Attachments', 1, 1, 1, 1),
(12, 'dependents_custom_fields', 'PIM - Dependents - Custom Fields', 1, NULL, 1, NULL),
(13, 'immigration', 'PIM - Immigration', 1, 1, 1, 1),
(14, 'immigration_attachment', 'PIM - Immigration - Attachments', 1, 1, 1, 1),
(15, 'immigration_custom_fields', 'PIM - Immigration - Custom Fields', 1, NULL, 1, NULL),
(16, 'job_details', 'PIM - Job', 1, NULL, 1, NULL),
(17, 'job_attachment', 'PIM - Job - Attachments', 1, 1, 1, 1),
(18, 'job_custom_fields', 'PIM - Job - Custom Fields', 1, NULL, 1, NULL),
(19, 'salary_details', 'PIM - Salary', 1, 1, 1, 1),
(20, 'salary_attachment', 'PIM - Salary - Attachments', 1, 1, 1, 1),
(21, 'salary_custom_fields', 'PIM - Salary - Custom Fields', 1, NULL, 1, NULL),
(22, 'tax_exemptions', 'PIM - Tax Exemptions', 1, NULL, 1, NULL),
(23, 'tax_attachment', 'PIM - Tax Exemptions - Attachments', 1, 1, 1, 1),
(24, 'tax_custom_fields', 'PIM - Tax Exemptions - Custom Fields', 1, NULL, 1, NULL),
(25, 'supervisor', 'PIM - Employee Supervisors', 1, 1, 1, 1),
(26, 'subordinates', 'PIM - Employee Subordinates', 1, 1, 1, 1),
(27, 'report-to_attachment', 'PIM - Employee Supervisors/Subordinates - Attachment', 1, 1, 1, 1),
(28, 'report-to_custom_fields', 'PIM - Employee Supervisors/Subordinates - Custom Fields', 1, NULL, 1, NULL),
(29, 'qualification_work', 'PIM - Qualifications - Work Experience', 1, 1, 1, 1),
(30, 'qualification_education', 'PIM - Qualifications - Education', 1, 1, 1, 1),
(31, 'qualification_skills', 'PIM - Qualifications - Skills', 1, 1, 1, 1),
(32, 'qualification_languages', 'PIM - Qualifications - Languages', 1, 1, 1, 1),
(33, 'qualification_license', 'PIM - Qualifications - License', 1, 1, 1, 1),
(34, 'qualifications_attachment', 'PIM - Qualifications - Attachments', 1, 1, 1, 1),
(35, 'qualifications_custom_fields', 'PIM - Qualifications - Custom Fields', 1, NULL, 1, NULL),
(36, 'membership', 'PIM - Membership', 1, 1, 1, 1),
(37, 'membership_attachment', 'PIM - Membership - Attachments', 1, 1, 1, 1),
(38, 'membership_custom_fields', 'PIM - Membership - Custom Fields', 1, NULL, 1, NULL),
(39, 'photograph', 'PIM - Employee Photograph', 1, NULL, 1, 1),
(40, 'leave_entitlements', 'Leave - Leave Entitlements', 1, 1, 1, 1),
(41, 'leave_entitlements_usage_report', 'Leave - Leave Entitlements and Usage Report', 1, NULL, NULL, NULL),
(42, 'job_titles', 'Admin - Job Titles', 1, 1, 1, 1),
(43, 'pay_grades', 'Admin - Pay Grades', 1, 1, 1, 1),
(44, 'time_customers', 'Time - Project Info - Customers', 1, 1, 1, 1),
(45, 'time_projects', 'Time - Project Info - Projects', 1, 1, 1, 1),
(46, 'pim_reports', 'PIM - Reports', 1, 1, 1, 1),
(47, 'attendance_configuration', 'Time - Attendance Configuration', 1, 0, 1, 0),
(48, 'attendance_records', 'Time - Attendance Records', 1, 0, 0, 0),
(49, 'time_project_reports', 'Time - Project Reports', 1, 0, 0, 0),
(50, 'time_employee_reports', 'Time - Employee Reports', 1, 0, 0, 0),
(51, 'attendance_summary', 'Time - Attendance Summary', 1, 0, 0, 0),
(52, 'leave_period', 'Leave - Leave Period', 1, 0, 1, 0),
(53, 'leave_types', 'Leave - Leave Types', 1, 1, 1, 1),
(54, 'work_week', 'Leave - Work Week', 1, 0, 1, 0),
(55, 'holidays', 'Leave - Holidays', 1, 1, 1, 1),
(56, 'recruitment_vacancies', 'Recruitment - Vacancies', 1, 1, 1, 1),
(57, 'recruitment_candidates', 'Recruitment - Candidates', 1, 1, 1, 1),
(58, 'time_employee_timesheets', 'Time - Employee Timesheets', 1, 0, 0, 0),
(59, 'leave_list', 'Leave - Leave List', 1, 0, 0, 0),
(60, 'leave_list_comments', 'Leave - Leave List - Comments', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group_screen`
--

CREATE TABLE `ohrm_data_group_screen` (
  `id` int(11) NOT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_data_group_screen`
--

INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES
(1, 40, 69, 1),
(2, 40, 72, 2),
(3, 40, 73, 3),
(4, 40, 71, 4),
(5, 41, 78, 1),
(6, 42, 23, 1),
(7, 42, 80, 1),
(8, 42, 80, 2),
(9, 42, 80, 3),
(10, 42, 81, 4),
(11, 43, 24, 1),
(12, 43, 82, 1),
(13, 43, 82, 2),
(14, 43, 82, 3),
(15, 43, 83, 4),
(16, 43, 84, 3),
(17, 43, 85, 3),
(18, 42, 74, 1),
(19, 43, 74, 1),
(20, 44, 36, 1),
(21, 44, 86, 2),
(22, 44, 86, 3),
(23, 44, 87, 4),
(24, 45, 37, 1),
(25, 45, 88, 1),
(26, 45, 88, 2),
(27, 45, 88, 3),
(28, 45, 89, 4),
(29, 45, 90, 2),
(30, 45, 90, 3),
(31, 45, 91, 2),
(32, 45, 91, 3),
(33, 46, 45, 1),
(34, 46, 45, 4),
(35, 46, 92, 2),
(36, 46, 92, 3),
(37, 46, 93, 1),
(38, 47, 56, 1),
(39, 47, 56, 3),
(40, 48, 55, 1),
(41, 49, 57, 1),
(42, 49, 102, 1),
(43, 50, 58, 1),
(44, 51, 59, 1),
(45, 51, 101, 1),
(46, 52, 47, 1),
(47, 52, 47, 3),
(48, 53, 7, 1),
(49, 53, 8, 1),
(50, 53, 8, 2),
(51, 53, 8, 3),
(52, 53, 9, 2),
(53, 53, 10, 4),
(54, 54, 14, 1),
(55, 54, 14, 3),
(56, 55, 11, 1),
(57, 55, 12, 2),
(58, 55, 12, 3),
(59, 55, 13, 4),
(60, 56, 61, 1),
(61, 56, 94, 1),
(62, 56, 94, 2),
(63, 56, 94, 3),
(64, 56, 95, 4),
(65, 57, 60, 1),
(66, 57, 96, 1),
(67, 57, 96, 2),
(68, 57, 96, 3),
(69, 57, 97, 4),
(70, 56, 76, 1),
(71, 57, 76, 1),
(72, 58, 52, 1),
(73, 59, 16, 1),
(74, 59, 98, 1),
(75, 59, 99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field`
--

CREATE TABLE `ohrm_display_field` (
  `display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_display_field`
--

INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'ohrm_project.name', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(2, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'link', '<xml><labelGetter>activityname</labelGetter><placeholderGetters><id>activity_id</id><total>totalduration</total><projectId>projectId</projectId><from>fromDate</from><to>toDate</to><approved>onlyIncludeApprovedTimesheets</approved></placeholderGetters><urlPattern>../../displayProjectActivityDetailsReport?reportId=3#activityId={id}#total={total}#from={from}#to={to}#projectId={projectId}#onlyIncludeApprovedTimesheets={approved}</urlPattern></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(3, 1, 'ohrm_project_activity.project_id', 'Project Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>project_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(4, 1, 'ohrm_project_activity.activity_id', 'Activity Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>activity_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(5, 1, 'ohrm_timesheet_item.duration', 'Time (hours)', NULL, 'false', NULL, NULL, 'label', '<xml><getter>duration</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 0),
(6, 1, 'hs_hr_employee.emp_firstname', 'Employee First Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_firstname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(7, 1, 'hs_hr_employee.emp_lastname', 'Employee Last Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_lastname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(8, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'label', '<xml><getter>activityname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(9, 3, 'hs_hr_employee.employee_id', 'Employee Id', 'employeeId', 'false', NULL, NULL, 'label', '<xml><getter>employeeId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(10, 3, 'hs_hr_employee.emp_lastname', 'Employee Last Name', 'employeeLastname', 'false', NULL, NULL, 'label', '<xml><getter>employeeLastname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(11, 3, 'hs_hr_employee.emp_firstname', 'Employee First Name', 'employeeFirstname', 'false', NULL, NULL, 'label', '<xml><getter>employeeFirstname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(12, 3, 'hs_hr_employee.emp_middle_name', 'Employee Middle Name', 'employeeMiddlename', 'false', NULL, NULL, 'label', '<xml><getter>employeeMiddlename</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(13, 3, 'hs_hr_employee.emp_birthday', 'Date of Birth', 'empBirthday', 'false', NULL, NULL, 'labelDate', '<xml><getter>empBirthday</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(14, 3, 'ohrm_nationality.name', 'Nationality', 'nationality', 'false', NULL, NULL, 'label', '<xml><getter>nationality</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(15, 3, 'CASE hs_hr_employee.emp_gender WHEN 1 THEN "Male" WHEN 2 THEN "Female" WHEN 3 THEN "Other" END', 'Gender', 'empGender', 'false', NULL, NULL, 'label', '<xml><getter>empGender</getter></xml>', '80', '0', NULL, 0, 1, '---', 0, 0),
(17, 3, 'hs_hr_employee.emp_marital_status', 'Marital Status', 'maritalStatus', 'false', NULL, NULL, 'label', '<xml><getter>maritalStatus</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(18, 3, 'hs_hr_employee.emp_dri_lice_num', 'Driver License Number', 'driversLicenseNumber', 'false', NULL, NULL, 'label', '<xml><getter>driversLicenseNumber</getter></xml>', '240', '0', NULL, 0, 1, '---', 0, 0),
(19, 3, 'hs_hr_employee.emp_dri_lice_exp_date', 'License Expiry Date', 'licenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>licenseExpiryDate</getter></xml>', '135', '0', NULL, 0, 1, '---', 0, 0),
(20, 3, 'CONCAT_WS(", ", NULLIF(hs_hr_employee.emp_street1, ""), NULLIF(hs_hr_employee.emp_street2, ""), NULLIF(hs_hr_employee.city_code, ""), NULLIF(hs_hr_employee.provin_code,""), NULLIF(hs_hr_employee.emp_zipcode,""), NULLIF(hs_hr_country.cou_name,""))', 'Address', 'address', 'false', NULL, NULL, 'label', '<xml><getter>address</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(21, 3, 'hs_hr_employee.emp_hm_telephone', 'Home Telephone', 'homeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>homeTelephone</getter></xml>', '130', '0', NULL, 0, 2, '---', 0, 0),
(22, 3, 'hs_hr_employee.emp_mobile', 'Mobile', 'mobile', 'false', NULL, NULL, 'label', '<xml><getter>mobile</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(23, 3, 'hs_hr_employee.emp_work_telephone', 'Work Telephone', 'workTelephone', 'false', NULL, NULL, 'label', '<xml><getter>workTelephone</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(24, 3, 'hs_hr_employee.emp_work_email', 'Work Email', 'workEmail', 'false', NULL, NULL, 'label', '<xml><getter>workEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(25, 3, 'hs_hr_employee.emp_oth_email', 'Other Email', 'otherEmail', 'false', NULL, NULL, 'label', '<xml><getter>otherEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(26, 3, 'hs_hr_emp_emergency_contacts.eec_name', 'Name', 'ecname', 'false', NULL, NULL, 'label', '<xml><getter>ecname</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(27, 3, 'hs_hr_emp_emergency_contacts.eec_home_no', 'Home Telephone', 'ecHomeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecHomeTelephone</getter></xml>', '130', '0', NULL, 1, 3, '---', 0, 0),
(28, 3, 'hs_hr_emp_emergency_contacts.eec_office_no', 'Work Telephone', 'ecWorkTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecWorkTelephone</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(29, 3, 'hs_hr_emp_emergency_contacts.eec_relationship', 'Relationship', 'ecRelationship', 'false', NULL, NULL, 'label', '<xml><getter>ecRelationship</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(30, 3, 'hs_hr_emp_emergency_contacts.eec_mobile_no', 'Mobile', 'ecMobile', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(31, 3, 'hs_hr_emp_dependents.ed_name', 'Name', 'dependentName', 'false', NULL, NULL, 'label', '<xml><getter>dependentName</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(32, 3, 'IF (hs_hr_emp_dependents.ed_relationship_type = ''other'', hs_hr_emp_dependents.ed_relationship, hs_hr_emp_dependents.ed_relationship_type)', 'Relationship', 'dependentRelationship', 'false', NULL, NULL, 'label', '<xml><getter>dependentRelationship</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(33, 3, 'hs_hr_emp_dependents.ed_date_of_birth', 'Date of Birth', 'dependentDateofBirth', 'false', NULL, NULL, 'labelDate', '<xml><getter>dependentDateofBirth</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 0),
(35, 3, 'ohrm_membership.name', 'Membership', 'name', 'false', NULL, NULL, 'label', '<xml><getter>name</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(36, 3, 'hs_hr_emp_member_detail.ememb_subscript_ownership', 'Subscription Paid By', 'subscriptionPaidBy', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionPaidBy</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(37, 3, 'hs_hr_emp_member_detail.ememb_subscript_amount', 'Subscription Amount', 'subscriptionAmount', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionAmount</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(38, 3, 'hs_hr_emp_member_detail.ememb_subs_currency', 'Currency', 'membershipCurrency', 'false', NULL, NULL, 'label', '<xml><getter>membershipCurrency</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(39, 3, 'hs_hr_emp_member_detail.ememb_commence_date', 'Subscription Commence Date', 'subscriptionCommenceDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionCommenceDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(40, 3, 'hs_hr_emp_member_detail.ememb_renewal_date', 'Subscription Renewal Date', 'subscriptionRenewalDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionRenewalDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(41, 3, 'hs_hr_emp_work_experience.eexp_employer', 'Company', 'expCompany', 'false', NULL, NULL, 'label', '<xml><getter>expCompany</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(42, 3, 'hs_hr_emp_work_experience.eexp_jobtit', 'Job Title', 'expJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>expJobTitle</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(43, 3, 'hs_hr_emp_work_experience.eexp_from_date', 'From', 'expFrom', 'false', NULL, NULL, 'labelDate', '<xml><getter>expFrom</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(44, 3, 'hs_hr_emp_work_experience.eexp_to_date', 'To', 'expTo', 'false', NULL, NULL, 'labelDate', '<xml><getter>expTo</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(45, 3, 'hs_hr_emp_work_experience.eexp_comments', 'Comment', 'expComment', 'false', NULL, NULL, 'label', '<xml><getter>expComment</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(47, 3, 'ohrm_education.name', 'Level', 'eduProgram', 'false', NULL, NULL, 'label', '<xml><getter>eduProgram</getter></xml>', '200', '0', NULL, 1, 11, '---', 0, 0),
(48, 3, 'ohrm_emp_education.year', 'Year', 'eduYear', 'false', NULL, NULL, 'label', '<xml><getter>eduYear</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 0),
(49, 3, 'ohrm_emp_education.score', 'Score', 'eduGPAOrScore', 'false', NULL, NULL, 'label', '<xml><getter>eduGPAOrScore</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(52, 3, 'ohrm_skill.name', 'Skill', 'skill', 'false', NULL, NULL, 'label', '<xml><getter>skill</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(53, 3, 'hs_hr_emp_skill.years_of_exp', 'Years of Experience', 'skillYearsOfExperience', 'false', NULL, NULL, 'label', '<xml><getter>skillYearsOfExperience</getter></xml>', '135', '0', NULL, 1, 12, '---', 0, 0),
(54, 3, 'hs_hr_emp_skill.comments', 'Comments', 'skillComments', 'false', NULL, NULL, 'label', '<xml><getter>skillComments</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(55, 3, 'ohrm_language.name', 'Language', 'langName', 'false', NULL, NULL, 'label', '<xml><getter>langName</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(57, 3, 'CASE hs_hr_emp_language.competency WHEN 1 THEN "Poor" WHEN 2 THEN "Basic" WHEN 3 THEN "Good" WHEN 4 THEN "Mother Tongue" END', 'Competency', 'langCompetency', 'false', NULL, NULL, 'label', '<xml><getter>langCompetency</getter></xml>', '130', '0', NULL, 1, 13, '---', 0, 0),
(58, 3, 'hs_hr_emp_language.comments', 'Comments', 'langComments', 'false', NULL, NULL, 'label', '<xml><getter>langComments</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(59, 3, 'ohrm_license.name', 'License Type', 'empLicenseType', 'false', NULL, NULL, 'label', '<xml><getter>empLicenseType</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(60, 3, 'ohrm_emp_license.license_issued_date', 'Issued Date', 'empLicenseIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseIssuedDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(61, 3, 'ohrm_emp_license.license_expiry_date', 'Expiry Date', 'empLicenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseExpiryDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(62, 3, 'supervisor.emp_firstname', 'First Name', 'supervisorFirstName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorFirstName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(63, 3, 'subordinate.emp_firstname', 'First Name', 'subordinateFirstName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateFirstName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(64, 3, 'supervisor.emp_lastname', 'Last Name', 'supervisorLastName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorLastName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(65, 3, 'ohrm_pay_grade.name', 'Pay Grade', 'salPayGrade', 'false', NULL, NULL, 'label', '<xml><getter>salPayGrade</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(66, 3, 'hs_hr_emp_basicsalary.salary_component', 'Salary Component', 'salSalaryComponent', 'false', NULL, NULL, 'label', '<xml><getter>salSalaryComponent</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(67, 3, 'hs_hr_emp_basicsalary.ebsal_basic_salary', 'Amount', 'salAmount', 'false', NULL, NULL, 'label', '<xml><getter>salAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 1, 0),
(68, 3, 'hs_hr_emp_basicsalary.comments', 'Comments', 'salComments', 'false', NULL, NULL, 'label', '<xml><getter>salComments</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(69, 3, 'hs_hr_payperiod.payperiod_name', 'Pay Frequency', 'salPayFrequency', 'false', NULL, NULL, 'label', '<xml><getter>salPayFrequency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(70, 3, 'hs_hr_currency_type.currency_name', 'Currency', 'salCurrency', 'false', NULL, NULL, 'label', '<xml><getter>salCurrency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(71, 3, 'hs_hr_emp_directdebit.dd_account', 'Direct Deposit Account Number', 'ddAccountNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(72, 3, 'hs_hr_emp_directdebit.dd_account_type', 'Direct Deposit Account Type', 'ddAccountType', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountType</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(73, 3, 'hs_hr_emp_directdebit.dd_routing_num', 'Direct Deposit Routing Number', 'ddRoutingNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddRoutingNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(74, 3, 'hs_hr_emp_directdebit.dd_amount', 'Direct Deposit Amount', 'ddAmount', 'false', NULL, NULL, 'label', '<xml><getter>ddAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(75, 3, 'hs_hr_emp_contract_extend.econ_extend_start_date', 'Contract Start Date', 'empContStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContStartDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(76, 3, 'hs_hr_emp_contract_extend.econ_extend_end_date', 'Contract End Date', 'empContEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContEndDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(77, 3, 'ohrm_job_title.job_title', 'Job Title', 'empJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>empJobTitle</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(78, 3, 'ohrm_employment_status.name', 'Employment Status', 'empEmploymentStatus', 'false', NULL, NULL, 'label', '<xml><getter>empEmploymentStatus</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(80, 3, 'ohrm_job_category.name', 'Job Category', 'empJobCategory', 'false', NULL, NULL, 'label', '<xml><getter>empJobCategory</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(81, 3, 'hs_hr_employee.joined_date', 'Joined Date', 'empJoinedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empJoinedDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(82, 3, 'ohrm_subunit.name', 'Sub Unit', 'empSubUnit', 'false', NULL, NULL, 'label', '<xml><getter>empSubUnit</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(83, 3, 'ohrm_location.name', 'Location', 'empLocation', 'false', NULL, NULL, 'label', '<xml><getter>empLocation</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(84, 3, 'hs_hr_emp_passport.ep_passport_num', 'Number', 'empPassportNo', 'false', NULL, NULL, 'label', '<xml><getter>empPassportNo</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(85, 3, 'hs_hr_emp_passport.ep_passportissueddate', 'Issued Date', 'empPassportIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportIssuedDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(86, 3, 'hs_hr_emp_passport.ep_passportexpiredate', 'Expiry Date', 'empPassportExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportExpiryDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(87, 3, 'hs_hr_emp_passport.ep_i9_status', 'Eligibility Status', 'empPassportEligibleStatus', 'false', NULL, NULL, 'label', '<xml><getter>empPassportEligibleStatus</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(88, 3, 'hs_hr_emp_passport.cou_code', 'Issued By', 'empPassportIssuedBy', 'false', NULL, NULL, 'label', '<xml><getter>empPassportIssuedBy</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(89, 3, 'hs_hr_emp_passport.ep_i9_review_date', 'Eligibility Review Date', 'empPassportEligibleReviewDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportEligibleReviewDate</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(90, 3, 'hs_hr_emp_passport.ep_comments', 'Comments', 'empPassportComments', 'false', NULL, NULL, 'label', '<xml><getter>empPassportComments</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(91, 3, 'subordinate.emp_lastname', 'Last Name', 'subordinateLastName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateLastName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(92, 3, 'CASE hs_hr_emp_language.fluency WHEN 1 THEN "Writing" WHEN 2 THEN "Speaking" WHEN 3 THEN "Reading" END', 'Fluency', 'langFluency', 'false', NULL, NULL, 'label', '<xml><getter>langFluency</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(93, 3, 'supervisor_reporting_method.reporting_method_name', 'Reporting Method', 'supReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>supReportingMethod</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(94, 3, 'subordinate_reporting_method.reporting_method_name', 'Reporting Method', 'subReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>subReportingMethod</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(95, 3, 'CASE hs_hr_emp_passport.ep_passport_type_flg WHEN 1 THEN "Passport" WHEN 2 THEN "Visa" END', 'Document Type', 'documentType', 'false', NULL, NULL, 'label', '<xml><getter>documentType</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(97, 3, 'hs_hr_employee.emp_other_id', 'Other Id', 'otherId', 'false', NULL, NULL, 'label', '<xml><getter>otherId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(98, 3, 'hs_hr_emp_emergency_contacts.eec_seqno', 'ecSeqNo', 'ecSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 1),
(99, 3, 'hs_hr_emp_dependents.ed_seqno', 'SeqNo', 'edSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 1),
(100, 3, 'hs_hr_emp_passport.ep_seqno', 'SeqNo', 'epSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 1),
(101, 3, 'hs_hr_emp_basicsalary.id', 'salaryId', 'salaryId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 7, '---', 0, 1),
(102, 3, 'subordinate.emp_number', 'subordinateId', 'subordinateId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 8, '---', 0, 1),
(103, 3, 'supervisor.emp_number', 'supervisorId', 'supervisorId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 9, '---', 0, 1),
(104, 3, 'hs_hr_emp_work_experience.eexp_seqno', 'workExpSeqNo', 'workExpSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 1),
(105, 3, 'ohrm_emp_education.education_id', 'empEduCode', 'empEduCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 1),
(106, 3, 'hs_hr_emp_skill.skill_id', 'empSkillCode', 'empSkillCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 12, '---', 0, 1),
(107, 3, 'hs_hr_emp_language.lang_id', 'empLangCode', 'empLangCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(108, 3, 'hs_hr_emp_language.fluency', 'empLangType', 'empLangType', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(109, 3, 'ohrm_emp_license.license_id', 'empLicenseCode', 'empLicenseCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 1),
(110, 3, 'hs_hr_emp_member_detail.membship_code', 'membershipCode', 'membershipCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 15, '---', 0, 1),
(112, 3, 'ROUND(DATEDIFF(hs_hr_emp_work_experience.eexp_to_date, hs_hr_emp_work_experience.eexp_from_date)/365,1)', 'Duration', 'expDuration', 'false', NULL, NULL, 'label', '<xml><getter>expDuration</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(113, 3, 'ohrm_emp_termination.termination_date', 'Termination Date', 'terminationDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>terminationDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(114, 3, 'ohrm_emp_termination_reason.name', 'Termination Reason', 'terminationReason', 'false', NULL, NULL, 'label', '<xml><getter>terminationReason</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(115, 3, 'ohrm_emp_education.institute', 'Institute', 'getInstitute', 'false', NULL, NULL, 'label', '<xml><getter>getInstitute</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(116, 3, 'ohrm_emp_education.major', 'Major/Specialization', 'getMajor', 'false', NULL, NULL, 'label', '<xml><getter>getMajor</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(117, 3, 'ohrm_emp_education.start_date', 'Start Date', 'getStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getStartDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(118, 3, 'ohrm_emp_education.end_date', 'End Date', 'getEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getEndDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(119, 3, 'ohrm_emp_license.license_no', 'License Number', 'getLicenseNo', 'false', NULL, NULL, 'label', '<xml><getter>getLicenseNo</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(120, 3, 'ohrm_emp_termination.note', 'Termination Note', 'getNote', 'false', NULL, NULL, 'label', '<xml><getter>getNote</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field_group`
--

CREATE TABLE `ohrm_display_field_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_list` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_display_field_group`
--

INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES
(1, 3, 'Personal', 0),
(2, 3, 'Contact Details', 0),
(3, 3, 'Emergency Contacts', 1),
(4, 3, 'Dependents', 1),
(5, 3, 'Immigration', 1),
(6, 3, 'Job', 0),
(7, 3, 'Salary', 1),
(8, 3, 'Subordinates', 1),
(9, 3, 'Supervisors', 1),
(10, 3, 'Work Experience', 1),
(11, 3, 'Education', 1),
(12, 3, 'Skills', 1),
(13, 3, 'Languages', 1),
(14, 3, 'License', 1),
(15, 3, 'Memberships', 1),
(16, 3, 'Custom Fields', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_education`
--

CREATE TABLE `ohrm_education` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email`
--

CREATE TABLE `ohrm_email` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email`
--

INSERT INTO `ohrm_email` (`id`, `name`) VALUES
(1, 'leave.apply'),
(3, 'leave.approve'),
(2, 'leave.assign'),
(4, 'leave.cancel'),
(6, 'leave.change'),
(5, 'leave.reject');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_configuration`
--

CREATE TABLE `ohrm_email_configuration` (
  `id` int(10) NOT NULL,
  `mail_type` varchar(50) DEFAULT NULL,
  `sent_as` varchar(250) NOT NULL,
  `sendmail_path` varchar(250) DEFAULT NULL,
  `smtp_host` varchar(250) DEFAULT NULL,
  `smtp_port` int(10) DEFAULT NULL,
  `smtp_username` varchar(250) DEFAULT NULL,
  `smtp_password` varchar(250) DEFAULT NULL,
  `smtp_auth_type` varchar(50) DEFAULT NULL,
  `smtp_security_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_notification`
--

CREATE TABLE `ohrm_email_notification` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_enable` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_notification`
--

INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`) VALUES
(1, 'Leave Applications', 0),
(2, 'Leave Assignments', 0),
(3, 'Leave Approvals', 0),
(4, 'Leave Cancellations', 0),
(5, 'Leave Rejections', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_processor`
--

CREATE TABLE `ohrm_email_processor` (
  `id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_processor`
--

INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES
(1, 1, 'LeaveEmailProcessor'),
(2, 2, 'LeaveEmailProcessor'),
(3, 3, 'LeaveEmailProcessor'),
(4, 4, 'LeaveEmailProcessor'),
(5, 5, 'LeaveEmailProcessor'),
(6, 6, 'LeaveChangeMailProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_subscriber`
--

CREATE TABLE `ohrm_email_subscriber` (
  `id` int(6) NOT NULL,
  `notification_id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_template`
--

CREATE TABLE `ohrm_email_template` (
  `id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `performer_role` varchar(50) DEFAULT NULL,
  `recipient_role` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_template`
--

INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES
(1, 1, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationBody.txt'),
(2, 1, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubscriberBody.txt'),
(3, 3, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalBody.txt'),
(4, 3, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberBody.txt'),
(5, 2, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBody.txt'),
(6, 2, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubjectForSupervisors.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBodyForSupervisors.txt'),
(7, 2, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberBody.txt'),
(8, 4, 'en_US', 'ess', 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationBody.txt'),
(9, 4, 'en_US', 'ess', 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberBody.txt'),
(10, 4, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationBody.txt'),
(11, 4, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberBody.txt'),
(12, 5, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionBody.txt'),
(13, 5, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberBody.txt'),
(14, 6, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeBody.txt'),
(15, 6, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberBody.txt');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employee_work_shift`
--

CREATE TABLE `ohrm_employee_work_shift` (
  `work_shift_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employment_status`
--

CREATE TABLE `ohrm_employment_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_education`
--

CREATE TABLE `ohrm_emp_education` (
  `id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `institute` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `score` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_license`
--

CREATE TABLE `ohrm_emp_license` (
  `emp_number` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `license_issued_date` date DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_reporting_method`
--

CREATE TABLE `ohrm_emp_reporting_method` (
  `reporting_method_id` int(7) NOT NULL,
  `reporting_method_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_emp_reporting_method`
--

INSERT INTO `ohrm_emp_reporting_method` (`reporting_method_id`, `reporting_method_name`) VALUES
(1, 'Direct'),
(2, 'Indirect');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination`
--

CREATE TABLE `ohrm_emp_termination` (
  `id` int(4) NOT NULL,
  `emp_number` int(4) DEFAULT NULL,
  `reason_id` int(4) DEFAULT NULL,
  `termination_date` date NOT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination_reason`
--

CREATE TABLE `ohrm_emp_termination_reason` (
  `id` int(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_emp_termination_reason`
--

INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES
(1, 'Other'),
(2, 'Retired'),
(3, 'Contract Not Renewed'),
(4, 'Resigned - Company Requested'),
(5, 'Resigned - Self Proposed'),
(6, 'Resigned'),
(7, 'Deceased'),
(8, 'Physically Disabled/Compensated'),
(9, 'Laid-off'),
(10, 'Dismissed');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_filter_field`
--

CREATE TABLE `ohrm_filter_field` (
  `filter_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `where_clause_part` mediumtext NOT NULL,
  `filter_field_widget` varchar(255) DEFAULT NULL,
  `condition_no` int(20) NOT NULL,
  `required` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_filter_field`
--

INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES
(1, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectList', 2, 'true'),
(2, 1, 'activity_show_deleted', 'ohrm_project_activity.is_deleted', 'ohrmWidgetInputCheckbox', 2, 'false'),
(3, 1, 'project_date_range', 'date', 'ohrmWidgetDateRange', 1, 'false'),
(4, 1, 'employee', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 2, 'true'),
(5, 1, 'activity_name', 'ohrm_project_activity.activity_id', 'ohrmWidgetProjectActivityList', 2, 'true'),
(6, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectListWithAllOption', 2, 'true'),
(7, 1, 'only_include_approved_timesheets', 'ohrm_timesheet.state', 'ohrmWidgetApprovedTimesheetInputCheckBox', 2, NULL),
(8, 3, 'employee_name', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 1, NULL),
(9, 3, 'pay_grade', 'hs_hr_emp_basicsalary.sal_grd_code', 'ohrmReportWidgetPayGradeDropDown', 1, NULL),
(10, 3, 'education', 'ohrm_emp_education.education_id', 'ohrmReportWidgetEducationtypeDropDown', 1, NULL),
(11, 3, 'employment_status', 'hs_hr_employee.emp_status', 'ohrmWidgetEmploymentStatusList', 1, NULL),
(12, 3, 'service_period', 'datediff(current_date(), hs_hr_employee.joined_date)/365', 'ohrmReportWidgetServicePeriod', 1, NULL),
(13, 3, 'joined_date', 'hs_hr_employee.joined_date', 'ohrmReportWidgetJoinedDate', 1, NULL),
(14, 3, 'job_title', 'hs_hr_employee.job_title_code', 'ohrmWidgetJobTitleList', 1, NULL),
(15, 3, 'language', 'hs_hr_emp_language.lang_id', 'ohrmReportWidgetLanguageDropDown', 1, NULL),
(16, 3, 'skill', 'hs_hr_emp_skill.skill_id', 'ohrmReportWidgetSkillDropDown', 1, NULL),
(17, 3, 'age_group', 'datediff(current_date(), hs_hr_employee.emp_birthday)/365', 'ohrmReportWidgetAgeGroup', 1, NULL),
(18, 3, 'sub_unit', 'hs_hr_employee.work_station', 'ohrmWidgetSubDivisionList', 1, NULL),
(19, 3, 'gender', 'hs_hr_employee.emp_gender', 'ohrmReportWidgetGenderDropDown', 1, NULL),
(20, 3, 'location', 'ohrm_location.id', 'ohrmReportWidgetOperationalCountryLocationDropDown', 1, NULL),
(21, 1, 'is_deleted', 'ohrm_project_activity.is_deleted', '', 2, NULL),
(22, 3, 'include', 'hs_hr_employee.termination_id', 'ohrmReportWidgetIncludedEmployeesDropDown', 1, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_group_field`
--

CREATE TABLE `ohrm_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_by_clause` mediumtext NOT NULL,
  `group_field_widget` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_group_field`
--

INSERT INTO `ohrm_group_field` (`group_field_id`, `name`, `group_by_clause`, `group_field_widget`) VALUES
(1, 'activity id', 'GROUP BY ohrm_project_activity.activity_id', NULL),
(2, 'employee number', 'GROUP BY hs_hr_employee.emp_number', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_holiday`
--

CREATE TABLE `ohrm_holiday` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `recurring` tinyint(3) UNSIGNED DEFAULT '0',
  `length` int(10) UNSIGNED DEFAULT NULL,
  `operational_country_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_home_page`
--

CREATE TABLE `ohrm_home_page` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_home_page`
--

INSERT INTO `ohrm_home_page` (`id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 1, 'dashboard/index', NULL, 15),
(2, 2, 'dashboard/index', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate`
--

CREATE TABLE `ohrm_job_candidate` (
  `id` int(13) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `comment` text,
  `mode_of_application` int(4) NOT NULL,
  `date_of_application` date NOT NULL,
  `cv_file_id` int(13) DEFAULT NULL,
  `cv_text_version` text,
  `keywords` varchar(255) DEFAULT NULL,
  `added_person` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_attachment`
--

CREATE TABLE `ohrm_job_candidate_attachment` (
  `id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_history`
--

CREATE TABLE `ohrm_job_candidate_history` (
  `id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) DEFAULT NULL,
  `candidate_vacancy_name` varchar(255) DEFAULT NULL,
  `interview_id` int(13) DEFAULT NULL,
  `action` int(4) NOT NULL,
  `performed_by` int(13) DEFAULT NULL,
  `performed_date` datetime NOT NULL,
  `note` text,
  `interviewers` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_vacancy`
--

CREATE TABLE `ohrm_job_candidate_vacancy` (
  `id` int(13) DEFAULT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_category`
--

CREATE TABLE `ohrm_job_category` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_category`
--

INSERT INTO `ohrm_job_category` (`id`, `name`) VALUES
(1, 'Officials and Managers'),
(2, 'Professionals'),
(3, 'Technicians'),
(6, 'Office and Clerical Workers');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview`
--

CREATE TABLE `ohrm_job_interview` (
  `id` int(13) NOT NULL,
  `candidate_vacancy_id` int(13) DEFAULT NULL,
  `candidate_id` int(13) DEFAULT NULL,
  `interview_name` varchar(100) NOT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_attachment`
--

CREATE TABLE `ohrm_job_interview_attachment` (
  `id` int(13) NOT NULL,
  `interview_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_interviewer`
--

CREATE TABLE `ohrm_job_interview_interviewer` (
  `interview_id` int(13) NOT NULL,
  `interviewer_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_specification_attachment`
--

CREATE TABLE `ohrm_job_specification_attachment` (
  `id` int(13) NOT NULL,
  `job_title_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_title`
--

CREATE TABLE `ohrm_job_title` (
  `id` int(13) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `job_description` varchar(400) DEFAULT NULL,
  `note` varchar(400) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_title`
--

INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES
(1, 'Tester', 'Software testing', '', 0),
(2, 'Developer', '', '', 0),
(3, 'Senior Developer', '', '', 0),
(4, 'Manager', '', '', 0),
(5, 'UX Engineer', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy`
--

CREATE TABLE `ohrm_job_vacancy` (
  `id` int(13) NOT NULL,
  `job_title_code` int(4) NOT NULL,
  `hiring_manager_id` int(13) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `no_of_positions` int(13) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `published_in_feed` tinyint(1) NOT NULL DEFAULT '0',
  `defined_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy_attachment`
--

CREATE TABLE `ohrm_job_vacancy_attachment` (
  `id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_kpi`
--

CREATE TABLE `ohrm_kpi` (
  `id` bigint(20) NOT NULL,
  `job_title_code` varchar(10) DEFAULT NULL,
  `kpi_indicators` varchar(255) DEFAULT NULL,
  `min_rating` int(7) DEFAULT '0',
  `max_rating` int(7) DEFAULT '0',
  `default_kpi` smallint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_kpi`
--

INSERT INTO `ohrm_kpi` (`id`, `job_title_code`, `kpi_indicators`, `min_rating`, `max_rating`, `default_kpi`, `deleted_at`) VALUES
(1, '1', 'No. of Test Cases', 1, 10, 1, NULL),
(2, '2', 'Features', 1, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_language`
--

CREATE TABLE `ohrm_language` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave`
--

CREATE TABLE `ohrm_leave` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `length_hours` decimal(6,2) UNSIGNED DEFAULT NULL,
  `length_days` decimal(6,4) UNSIGNED DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `comments` varchar(256) DEFAULT NULL,
  `leave_request_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `emp_number` int(7) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `duration_type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_adjustment`
--

CREATE TABLE `ohrm_leave_adjustment` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `adjustment_type` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_comment`
--

CREATE TABLE `ohrm_leave_comment` (
  `id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement`
--

CREATE TABLE `ohrm_leave_entitlement` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `days_used` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `entitlement_type` int(10) UNSIGNED NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_adjustment`
--

CREATE TABLE `ohrm_leave_entitlement_adjustment` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(10) UNSIGNED NOT NULL,
  `entitlement_id` int(10) UNSIGNED NOT NULL,
  `length_days` decimal(4,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_type`
--

CREATE TABLE `ohrm_leave_entitlement_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_editable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_entitlement_type`
--

INSERT INTO `ohrm_leave_entitlement_type` (`id`, `name`, `is_editable`) VALUES
(1, 'Added', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_leave_entitlement`
--

CREATE TABLE `ohrm_leave_leave_entitlement` (
  `id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `entitlement_id` int(10) UNSIGNED NOT NULL,
  `length_days` decimal(6,4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_period_history`
--

CREATE TABLE `ohrm_leave_period_history` (
  `id` int(11) NOT NULL,
  `leave_period_start_month` int(11) NOT NULL,
  `leave_period_start_day` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_period_history`
--

INSERT INTO `ohrm_leave_period_history` (`id`, `leave_period_start_month`, `leave_period_start_day`, `created_at`) VALUES
(1, 2, 28, '2017-02-27'),
(2, 2, 28, '2017-02-27');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request`
--

CREATE TABLE `ohrm_leave_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `date_applied` date NOT NULL,
  `emp_number` int(7) NOT NULL,
  `comments` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request_comment`
--

CREATE TABLE `ohrm_leave_request_comment` (
  `id` int(11) NOT NULL,
  `leave_request_id` int(10) UNSIGNED NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_status`
--

CREATE TABLE `ohrm_leave_status` (
  `id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_status`
--

INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES
(1, -1, 'REJECTED'),
(2, 0, 'CANCELLED'),
(3, 1, 'PENDING APPROVAL'),
(4, 2, 'SCHEDULED'),
(5, 3, 'TAKEN'),
(6, 4, 'WEEKEND'),
(7, 5, 'HOLIDAY');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_type`
--

CREATE TABLE `ohrm_leave_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_in_reports_if_no_entitlement` tinyint(1) NOT NULL DEFAULT '0',
  `operational_country_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_license`
--

CREATE TABLE `ohrm_license` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_location`
--

CREATE TABLE `ohrm_location` (
  `id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `province` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(35) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `fax` varchar(35) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_location`
--

INSERT INTO `ohrm_location` (`id`, `name`, `country_code`, `province`, `city`, `address`, `zip_code`, `phone`, `fax`, `notes`) VALUES
(1, 'Cyber Gateway', 'IN', 'Telangana', 'Hyderabad', 'D Block 5th Floor', '', '', '', ''),
(2, 'Ameerpet', 'IN', 'Telangana', 'Hyderabad', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_login`
--

CREATE TABLE `ohrm_login` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_name` text NOT NULL,
  `user_role_predefined` tinyint(1) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_login`
--

INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES
(1, 1, 'Admin', 'Admin', 1, '2017-02-27 04:46:05'),
(2, 1, 'Admin', 'Admin', 1, '2017-02-27 07:55:46'),
(3, 1, 'Admin', 'Admin', 1, '2017-02-27 07:59:08'),
(4, 1, 'Admin', 'Admin', 1, '2017-02-27 08:08:05'),
(5, 1, 'Admin', 'Admin', 1, '2017-02-27 08:32:46'),
(6, 1, 'Admin', 'Admin', 1, '2017-02-27 09:33:08'),
(7, 2, 'Gangaiah', 'ESS', 1, '2017-02-27 09:33:25'),
(8, 1, 'Admin', 'Admin', 1, '2017-02-27 09:34:16'),
(9, 1, 'Admin', 'Admin', 1, '2017-02-27 09:35:45'),
(10, 1, 'Admin', 'Admin', 1, '2017-02-27 09:36:03'),
(11, 1, 'Admin', 'Admin', 1, '2017-02-27 09:37:25'),
(12, 2, 'Gangaiah', 'ESS', 1, '2017-02-27 11:04:07'),
(13, 1, 'Admin', 'Admin', 1, '2017-02-27 11:07:22'),
(14, 1, 'Admin', 'Admin', 1, '2017-06-14 06:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_membership`
--

CREATE TABLE `ohrm_membership` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_menu_item`
--

CREATE TABLE `ohrm_menu_item` (
  `id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `order_hint` int(11) NOT NULL,
  `url_extras` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_menu_item`
--

INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES
(1, 'Admin', 74, NULL, 1, 100, NULL, 1),
(2, 'User Management', NULL, 1, 2, 100, NULL, 1),
(3, 'Project Info', NULL, 52, 2, 400, NULL, 0),
(4, 'Customers', 36, 3, 3, 100, NULL, 1),
(5, 'Projects', 37, 3, 3, 200, NULL, 1),
(6, 'Job', NULL, 1, 2, 300, NULL, 1),
(7, 'Job Titles', 23, 6, 3, 100, NULL, 1),
(8, 'Pay Grades', 24, 6, 3, 200, NULL, 1),
(9, 'Employment Status', 25, 6, 3, 300, NULL, 1),
(10, 'Job Categories', 26, 6, 3, 400, NULL, 1),
(11, 'Work Shifts', 27, 6, 3, 500, NULL, 1),
(12, 'Organization', NULL, 1, 2, 400, NULL, 1),
(13, 'General Information', 20, 12, 3, 100, NULL, 1),
(14, 'Locations', 21, 12, 3, 200, NULL, 1),
(15, 'Structure', 22, 12, 3, 300, NULL, 1),
(16, 'Qualifications', NULL, 1, 2, 500, NULL, 1),
(17, 'Skills', 28, 16, 3, 100, NULL, 1),
(18, 'Education', 29, 16, 3, 200, NULL, 1),
(19, 'Licenses', 30, 16, 3, 300, NULL, 1),
(20, 'Languages', 31, 16, 3, 400, NULL, 1),
(21, 'Memberships', 32, 16, 3, 500, NULL, 1),
(22, 'Nationalities', 33, 1, 2, 700, NULL, 1),
(23, 'Configuration', NULL, 1, 2, 900, NULL, 1),
(24, 'Email Configuration', 34, 23, 3, 100, NULL, 1),
(25, 'Email Subscriptions', 35, 23, 3, 200, NULL, 1),
(27, 'Localization', 38, 23, 3, 300, NULL, 1),
(28, 'Modules', 39, 23, 3, 400, NULL, 1),
(30, 'PIM', 75, NULL, 1, 200, NULL, 1),
(31, 'Configuration', NULL, 30, 2, 100, NULL, 1),
(32, 'Optional Fields', 40, 31, 3, 100, NULL, 1),
(33, 'Custom Fields', 41, 31, 3, 200, NULL, 1),
(34, 'Data Import', 42, 31, 3, 300, NULL, 1),
(35, 'Reporting Methods', 43, 31, 3, 400, NULL, 1),
(36, 'Termination Reasons', 44, 31, 3, 500, NULL, 1),
(37, 'Employee List', 5, 30, 2, 200, '/reset/1', 1),
(38, 'Add Employee', 4, 30, 2, 300, NULL, 1),
(39, 'Reports', 45, 30, 2, 400, '/reportGroup/3/reportType/PIM_DEFINED', 1),
(40, 'My Info', 46, NULL, 1, 700, NULL, 1),
(41, 'Leave', 68, NULL, 1, 300, NULL, 1),
(42, 'Configure', NULL, 41, 2, 500, NULL, 0),
(43, 'Leave Period', 47, 42, 3, 100, NULL, 1),
(44, 'Leave Types', 7, 42, 3, 200, NULL, 1),
(45, 'Work Week', 14, 42, 3, 300, NULL, 1),
(46, 'Holidays', 11, 42, 3, 400, NULL, 1),
(48, 'Leave List', 16, 41, 2, 600, '/reset/1', 1),
(49, 'Assign Leave', 17, 41, 2, 700, NULL, 1),
(50, 'My Leave', 48, 41, 2, 200, '/reset/1', 1),
(51, 'Apply', 49, 41, 2, 100, NULL, 1),
(52, 'Time', 67, NULL, 1, 400, NULL, 1),
(53, 'Timesheets', NULL, 52, 2, 100, NULL, 1),
(54, 'My Timesheets', 51, 53, 3, 100, NULL, 1),
(55, 'Employee Timesheets', 52, 53, 3, 200, NULL, 1),
(56, 'Attendance', NULL, 52, 2, 200, NULL, 1),
(57, 'My Records', 53, 56, 3, 100, NULL, 1),
(58, 'Punch In/Out', 54, 56, 3, 200, NULL, 1),
(59, 'Employee Records', 55, 56, 3, 300, NULL, 1),
(60, 'Configuration', 56, 56, 3, 400, NULL, 1),
(61, 'Reports', NULL, 52, 2, 300, NULL, 1),
(62, 'Project Reports', 57, 61, 3, 100, '?reportId=1', 1),
(63, 'Employee Reports', 58, 61, 3, 200, '?reportId=2', 1),
(64, 'Attendance Summary', 59, 61, 3, 300, '?reportId=4', 1),
(65, 'Recruitment', 76, NULL, 1, 500, NULL, 1),
(66, 'Candidates', 60, 65, 2, 100, NULL, 1),
(67, 'Vacancies', 61, 65, 2, 200, NULL, 1),
(74, 'Entitlements', NULL, 41, 2, 300, NULL, 0),
(75, 'Add Entitlements', 72, 74, 3, 100, NULL, 1),
(76, 'My Entitlements', 70, 74, 3, 300, '/reset/1', 1),
(77, 'Employee Entitlements', 69, 74, 3, 200, '/reset/1', 1),
(78, 'Reports', NULL, 41, 2, 400, NULL, 0),
(79, 'Leave Entitlements and Usage Report', 78, 78, 3, 100, NULL, 1),
(80, 'My Leave Entitlements and Usage Report', 79, 78, 3, 200, NULL, 1),
(81, 'Users', 1, 2, 3, 100, NULL, 1),
(82, 'Dashboard', 103, NULL, 1, 800, NULL, 1),
(83, 'Performance', NULL, NULL, 1, 700, '', 1),
(84, 'Configure', NULL, 83, 2, 100, '', 1),
(85, 'Manage Reviews', NULL, 83, 2, 200, '', 1),
(86, 'KPIs', 105, 84, 3, 100, '', 1),
(87, 'Manage Reviews', 111, 85, 3, 100, '', 1),
(88, 'My Reviews', 106, 85, 3, 200, '', 1),
(89, 'Review List', 110, 85, 3, 300, '', 1),
(90, 'Trackers', 112, 84, 3, 200, NULL, 1),
(91, 'Employee Trackers', 113, 83, 2, 800, NULL, 1),
(92, 'My Trackers', 114, 83, 2, 700, NULL, 1),
(93, 'Directory', 116, NULL, 1, 1000, '/reset/1', 1),
(94, 'Social Media Authentication', 117, 23, 3, 500, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module`
--

CREATE TABLE `ohrm_module` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_module`
--

INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES
(1, 'core', 1),
(2, 'admin', 1),
(3, 'pim', 1),
(4, 'leave', 1),
(5, 'time', 1),
(6, 'attendance', 1),
(7, 'recruitment', 1),
(8, 'recruitmentApply', 1),
(9, 'communication', 1),
(10, 'dashboard', 1),
(11, 'performance', 1),
(12, 'directory', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module_default_page`
--

CREATE TABLE `ohrm_module_default_page` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_module_default_page`
--

INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 2, 1, 'admin/viewSystemUsers', NULL, 20),
(2, 3, 1, 'pim/viewEmployeeList', NULL, 20),
(3, 3, 3, 'pim/viewEmployeeList', NULL, 10),
(4, 3, 2, 'pim/viewMyDetails', NULL, 0),
(5, 4, 1, 'leave/viewLeaveList/reset/1', NULL, 20),
(6, 4, 3, 'leave/viewLeaveList/reset/1', NULL, 10),
(7, 4, 2, 'leave/viewMyLeaveList', NULL, 0),
(8, 4, 1, 'leave/defineLeavePeriod', 'LeavePeriodDefinedHomePageEnabler', 100),
(9, 4, 2, 'leave/showLeavePeriodNotDefinedWarning', 'LeavePeriodDefinedHomePageEnabler', 90),
(10, 5, 1, 'time/viewEmployeeTimesheet', NULL, 20),
(11, 5, 2, 'time/viewMyTimesheet', NULL, 0),
(12, 5, 1, 'time/defineTimesheetPeriod', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(13, 5, 2, 'time/timesheetPeriodNotDefined', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(14, 7, 1, 'recruitment/viewCandidates', NULL, 20),
(15, 7, 5, 'recruitment/viewCandidates', NULL, 10),
(16, 7, 6, 'recruitment/viewCandidates', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_nationality`
--

CREATE TABLE `ohrm_nationality` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_nationality`
--

INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES
(1, 'Afghan'),
(2, 'Albanian'),
(3, 'Algerian'),
(4, 'American'),
(5, 'Andorran'),
(6, 'Angolan'),
(7, 'Antiguans'),
(8, 'Argentinean'),
(9, 'Armenian'),
(10, 'Australian'),
(11, 'Austrian'),
(12, 'Azerbaijani'),
(13, 'Bahamian'),
(14, 'Bahraini'),
(15, 'Bangladeshi'),
(16, 'Barbadian'),
(17, 'Barbudans'),
(18, 'Batswana'),
(19, 'Belarusian'),
(20, 'Belgian'),
(21, 'Belizean'),
(22, 'Beninese'),
(23, 'Bhutanese'),
(24, 'Bolivian'),
(25, 'Bosnian'),
(26, 'Brazilian'),
(27, 'British'),
(28, 'Bruneian'),
(29, 'Bulgarian'),
(30, 'Burkinabe'),
(31, 'Burmese'),
(32, 'Burundian'),
(33, 'Cambodian'),
(34, 'Cameroonian'),
(35, 'Canadian'),
(36, 'Cape Verdean'),
(37, 'Central African'),
(38, 'Chadian'),
(39, 'Chilean'),
(40, 'Chinese'),
(41, 'Colombian'),
(42, 'Comoran'),
(43, 'Congolese'),
(44, 'Costa Rican'),
(45, 'Croatian'),
(46, 'Cuban'),
(47, 'Cypriot'),
(48, 'Czech'),
(49, 'Danish'),
(50, 'Djibouti'),
(51, 'Dominican'),
(52, 'Dutch'),
(53, 'East Timorese'),
(54, 'Ecuadorean'),
(55, 'Egyptian'),
(56, 'Emirian'),
(57, 'Equatorial Guinean'),
(58, 'Eritrean'),
(59, 'Estonian'),
(60, 'Ethiopian'),
(61, 'Fijian'),
(62, 'Filipino'),
(63, 'Finnish'),
(64, 'French'),
(65, 'Gabonese'),
(66, 'Gambian'),
(67, 'Georgian'),
(68, 'German'),
(69, 'Ghanaian'),
(70, 'Greek'),
(71, 'Grenadian'),
(72, 'Guatemalan'),
(73, 'Guinea-Bissauan'),
(74, 'Guinean'),
(75, 'Guyanese'),
(76, 'Haitian'),
(77, 'Herzegovinian'),
(78, 'Honduran'),
(79, 'Hungarian'),
(80, 'I-Kiribati'),
(81, 'Icelander'),
(82, 'Indian'),
(83, 'Indonesian'),
(84, 'Iranian'),
(85, 'Iraqi'),
(86, 'Irish'),
(87, 'Israeli'),
(88, 'Italian'),
(89, 'Ivorian'),
(90, 'Jamaican'),
(91, 'Japanese'),
(92, 'Jordanian'),
(93, 'Kazakhstani'),
(94, 'Kenyan'),
(95, 'Kittian and Nevisian'),
(96, 'Kuwaiti'),
(97, 'Kyrgyz'),
(98, 'Laotian'),
(99, 'Latvian'),
(100, 'Lebanese'),
(101, 'Liberian'),
(102, 'Libyan'),
(103, 'Liechtensteiner'),
(104, 'Lithuanian'),
(105, 'Luxembourger'),
(106, 'Macedonian'),
(107, 'Malagasy'),
(108, 'Malawian'),
(109, 'Malaysian'),
(110, 'Maldivan'),
(111, 'Malian'),
(112, 'Maltese'),
(113, 'Marshallese'),
(114, 'Mauritanian'),
(115, 'Mauritian'),
(116, 'Mexican'),
(117, 'Micronesian'),
(118, 'Moldovan'),
(119, 'Monacan'),
(120, 'Mongolian'),
(121, 'Moroccan'),
(122, 'Mosotho'),
(123, 'Motswana'),
(124, 'Mozambican'),
(125, 'Namibian'),
(126, 'Nauruan'),
(127, 'Nepalese'),
(128, 'New Zealander'),
(129, 'Nicaraguan'),
(130, 'Nigerian'),
(131, 'Nigerien'),
(132, 'North Korean'),
(133, 'Northern Irish'),
(134, 'Norwegian'),
(135, 'Omani'),
(136, 'Pakistani'),
(137, 'Palauan'),
(138, 'Panamanian'),
(139, 'Papua New Guinean'),
(140, 'Paraguayan'),
(141, 'Peruvian'),
(142, 'Polish'),
(143, 'Portuguese'),
(144, 'Qatari'),
(145, 'Romanian'),
(146, 'Russian'),
(147, 'Rwandan'),
(148, 'Saint Lucian'),
(149, 'Salvadoran'),
(150, 'Samoan'),
(151, 'San Marinese'),
(152, 'Sao Tomean'),
(153, 'Saudi'),
(154, 'Scottish'),
(155, 'Senegalese'),
(156, 'Serbian'),
(157, 'Seychellois'),
(158, 'Sierra Leonean'),
(159, 'Singaporean'),
(160, 'Slovakian'),
(161, 'Slovenian'),
(162, 'Solomon Islander'),
(163, 'Somali'),
(164, 'South African'),
(165, 'South Korean'),
(166, 'Spanish'),
(167, 'Sri Lankan'),
(168, 'Sudanese'),
(169, 'Surinamer'),
(170, 'Swazi'),
(171, 'Swedish'),
(172, 'Swiss'),
(173, 'Syrian'),
(174, 'Taiwanese'),
(175, 'Tajik'),
(176, 'Tanzanian'),
(177, 'Thai'),
(178, 'Togolese'),
(179, 'Tongan'),
(180, 'Trinidadian or Tobagonian'),
(181, 'Tunisian'),
(182, 'Turkish'),
(183, 'Tuvaluan'),
(184, 'Ugandan'),
(185, 'Ukrainian'),
(186, 'Uruguayan'),
(187, 'Uzbekistani'),
(188, 'Venezuelan'),
(189, 'Vietnamese'),
(190, 'Welsh'),
(191, 'Yemenite'),
(192, 'Zambian'),
(193, 'Zimbabwean');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_access_token`
--

CREATE TABLE `ohrm_oauth_access_token` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_authorization_code`
--

CREATE TABLE `ohrm_oauth_authorization_code` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_client`
--

CREATE TABLE `ohrm_oauth_client` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_refresh_token`
--

CREATE TABLE `ohrm_oauth_refresh_token` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_user`
--

CREATE TABLE `ohrm_oauth_user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_provider`
--

CREATE TABLE `ohrm_openid_provider` (
  `id` int(10) NOT NULL,
  `provider_name` varchar(40) DEFAULT NULL,
  `provider_url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_user_identity`
--

CREATE TABLE `ohrm_openid_user_identity` (
  `user_id` int(10) DEFAULT NULL,
  `provider_id` int(10) DEFAULT NULL,
  `user_identity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_operational_country`
--

CREATE TABLE `ohrm_operational_country` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_organization_gen_info`
--

CREATE TABLE `ohrm_organization_gen_info` (
  `id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tax_id` varchar(30) DEFAULT NULL,
  `registration_number` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip_code` varchar(30) DEFAULT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_organization_gen_info`
--

INSERT INTO `ohrm_organization_gen_info` (`id`, `name`, `tax_id`, `registration_number`, `phone`, `fax`, `email`, `country`, `province`, `city`, `zip_code`, `street1`, `street2`, `note`) VALUES
(1, 'Inventcorp Technologies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade`
--

CREATE TABLE `ohrm_pay_grade` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade_currency`
--

CREATE TABLE `ohrm_pay_grade_currency` (
  `pay_grade_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `min_salary` double DEFAULT NULL,
  `max_salary` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_review`
--

CREATE TABLE `ohrm_performance_review` (
  `id` int(7) NOT NULL,
  `status_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `work_period_start` date DEFAULT NULL,
  `work_period_end` date DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `department_id` int(7) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `final_comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `final_rate` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_track`
--

CREATE TABLE `ohrm_performance_track` (
  `id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `tracker_name` varchar(200) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_log`
--

CREATE TABLE `ohrm_performance_tracker_log` (
  `id` int(11) NOT NULL,
  `performance_track_id` int(11) DEFAULT NULL,
  `log` varchar(150) DEFAULT NULL,
  `comment` varchar(3000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `reviewer_id` int(7) DEFAULT NULL,
  `achievement` varchar(45) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_reviewer`
--

CREATE TABLE `ohrm_performance_tracker_reviewer` (
  `id` int(11) NOT NULL,
  `performance_track_id` int(11) NOT NULL,
  `reviewer_id` int(7) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_plugin`
--

CREATE TABLE `ohrm_plugin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project`
--

CREATE TABLE `ohrm_project` (
  `project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_project`
--

INSERT INTO `ohrm_project` (`project_id`, `customer_id`, `name`, `description`, `is_deleted`) VALUES
(1, 1, 'Q360', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_activity`
--

CREATE TABLE `ohrm_project_activity` (
  `activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(110) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_admin`
--

CREATE TABLE `ohrm_project_admin` (
  `project_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report`
--

CREATE TABLE `ohrm_report` (
  `report_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `use_filter_field` tinyint(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_report`
--

INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES
(1, 'Project Report', 1, 1, NULL),
(2, 'Employee Report', 1, 1, NULL),
(3, 'Project Activity Details', 1, 1, NULL),
(4, 'Attendance Total Summary Report', 2, 0, NULL),
(5, 'PIM Sample Report', 3, 1, 'PIM_DEFINED');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report_group`
--

CREATE TABLE `ohrm_report_group` (
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `core_sql` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_report_group`
--

INSERT INTO `ohrm_report_group` (`report_group_id`, `name`, `core_sql`) VALUES
(1, 'timesheet', 'SELECT selectCondition FROM ohrm_project_activity LEFT JOIN (SELECT * FROM ohrm_timesheet_item WHERE whereCondition1) AS ohrm_timesheet_item  ON (ohrm_timesheet_item.activity_id = ohrm_project_activity.activity_id) LEFT JOIN ohrm_project ON (ohrm_project.project_id = ohrm_project_activity.project_id) LEFT JOIN hs_hr_employee ON (hs_hr_employee.emp_number = ohrm_timesheet_item.employee_id) LEFT JOIN ohrm_timesheet ON (ohrm_timesheet.timesheet_id = ohrm_timesheet_item.timesheet_id) LEFT JOIN ohrm_customer ON (ohrm_customer.customer_id = ohrm_project.customer_id) WHERE whereCondition2 groupByClause ORDER BY ohrm_customer.name, ohrm_project.name, ohrm_project_activity.name, hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(2, 'attendance', 'SELECT selectCondition FROM hs_hr_employee LEFT JOIN (SELECT * FROM ohrm_attendance_record WHERE ( ( ohrm_attendance_record.punch_in_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) AND ( ohrm_attendance_record.punch_out_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) ) ) AS ohrm_attendance_record ON (hs_hr_employee.emp_number = ohrm_attendance_record.employee_id) WHERE hs_hr_employee.emp_number = #@employeeId@,@hs_hr_employee.emp_number AND (hs_hr_employee.termination_id is null) @# AND (hs_hr_employee.job_title_code = #@"jobTitle")@,@hs_hr_employee.job_title_code OR hs_hr_employee.job_title_code is null)@# AND (hs_hr_employee.work_station IN (#@subUnit)@,@SELECT id FROM ohrm_subunit) OR hs_hr_employee.work_station is null@#) AND (hs_hr_employee.emp_status = #@"employeeStatus")@,@hs_hr_employee.emp_status OR hs_hr_employee.emp_status is null)@# groupByClause ORDER BY hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(3, 'pim', 'SELECT selectCondition FROM hs_hr_employee \n                    LEFT JOIN hs_hr_emp_emergency_contacts ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_emergency_contacts.emp_number) \n                    LEFT JOIN ohrm_subunit ON \n                        (hs_hr_employee.work_station = ohrm_subunit.id) \n                    LEFT JOIN ohrm_employment_status ON \n                        (hs_hr_employee.emp_status = ohrm_employment_status.id) \n                    LEFT JOIN ohrm_job_title ON\n                        (hs_hr_employee.job_title_code = ohrm_job_title.id)\n                    LEFT JOIN ohrm_job_category ON \n                        (hs_hr_employee.eeo_cat_code = ohrm_job_category.id) \n                    LEFT JOIN ohrm_nationality ON\n                        (hs_hr_employee.nation_code = ohrm_nationality.id)\n                    LEFT JOIN hs_hr_emp_dependents ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_dependents.emp_number)\n                    LEFT JOIN hs_hr_emp_locations AS emp_location ON\n                        (hs_hr_employee.emp_number = emp_location.emp_number)\n                    LEFT JOIN ohrm_location ON\n                        (emp_location.location_id = ohrm_location.id)\n                    LEFT JOIN hs_hr_emp_contract_extend ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_contract_extend.emp_number) \n                    LEFT JOIN hs_hr_emp_basicsalary ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                    LEFT JOIN ohrm_pay_grade ON \n                        (hs_hr_emp_basicsalary.sal_grd_code = ohrm_pay_grade.id) \n                    LEFT JOIN hs_hr_currency_type ON \n                        (hs_hr_emp_basicsalary.currency_id = hs_hr_currency_type.currency_id) \n                    LEFT JOIN hs_hr_payperiod ON \n                        (hs_hr_emp_basicsalary.payperiod_code = hs_hr_payperiod.payperiod_code) \n                    LEFT JOIN hs_hr_emp_passport ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_passport.emp_number) \n                    LEFT JOIN hs_hr_emp_reportto AS subordinate_list ON \n                        (hs_hr_employee.emp_number = subordinate_list.erep_sup_emp_number) \n                    LEFT JOIN hs_hr_employee AS subordinate ON\n                        (subordinate.emp_number = subordinate_list.erep_sub_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS subordinate_reporting_method ON \n                        (subordinate_list.erep_reporting_mode = subordinate_reporting_method.reporting_method_id) \n                    LEFT JOIN hs_hr_emp_work_experience ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_work_experience.emp_number) \n                    LEFT JOIN ohrm_emp_education ON \n                        (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                    LEFT JOIN ohrm_education ON \n                        (ohrm_emp_education.education_id = ohrm_education.id) \n                    LEFT JOIN hs_hr_emp_skill ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                    LEFT JOIN ohrm_skill ON \n                        (hs_hr_emp_skill.skill_id = ohrm_skill.id) \n                    LEFT JOIN hs_hr_emp_language ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    LEFT JOIN ohrm_language ON \n                        (hs_hr_emp_language.lang_id = ohrm_language.id) \n                    LEFT JOIN ohrm_emp_license ON \n                        (hs_hr_employee.emp_number = ohrm_emp_license.emp_number) \n                    LEFT JOIN ohrm_license ON \n                        (ohrm_emp_license.license_id = ohrm_license.id) \n                    LEFT JOIN hs_hr_emp_member_detail ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_member_detail.emp_number) \n                    LEFT JOIN ohrm_membership ON\n                        (hs_hr_emp_member_detail.membship_code = ohrm_membership.id)\n                    LEFT JOIN hs_hr_country ON \n                        (hs_hr_employee.coun_code = hs_hr_country.cou_code) \n                    LEFT JOIN hs_hr_emp_directdebit ON \n                        (hs_hr_emp_basicsalary.id = hs_hr_emp_directdebit.salary_id) \n                    LEFT JOIN hs_hr_emp_reportto AS supervisor_list ON \n                        (hs_hr_employee.emp_number = supervisor_list.erep_sub_emp_number) \n                    LEFT JOIN hs_hr_employee AS supervisor ON\n                        (supervisor.emp_number = supervisor_list.erep_sup_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS supervisor_reporting_method ON \n                        (supervisor_list.erep_reporting_mode = supervisor_reporting_method.reporting_method_id) \n                    LEFT JOIN ohrm_emp_termination ON\n                        (hs_hr_employee.termination_id = ohrm_emp_termination.id)\n                    LEFT JOIN ohrm_emp_termination_reason ON\n                        (ohrm_emp_termination.reason_id = ohrm_emp_termination_reason.id)\n                WHERE hs_hr_employee.emp_number in (\n                    SELECT hs_hr_employee.emp_number FROM hs_hr_employee\n                        LEFT JOIN hs_hr_emp_basicsalary ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                        LEFT JOIN ohrm_emp_education ON \n                            (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                        LEFT JOIN hs_hr_emp_skill ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                        LEFT JOIN hs_hr_emp_language ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    WHERE whereCondition1\n                )\n                GROUP BY \n                     hs_hr_employee.emp_number,\n                     hs_hr_employee.emp_lastname,\n                     hs_hr_employee.emp_firstname,\n                     hs_hr_employee.emp_middle_name,\n                     hs_hr_employee.emp_birthday,\n                     ohrm_nationality.name,\n                     hs_hr_employee.emp_gender,\n                     hs_hr_employee.emp_marital_status,\n                     hs_hr_employee.emp_dri_lice_num,\n                     hs_hr_employee.emp_dri_lice_exp_date,\n                     hs_hr_employee.emp_street1,\n                     hs_hr_employee.emp_street2,\n                     hs_hr_employee.city_code,\n                     hs_hr_employee.provin_code,\n                     hs_hr_employee.emp_zipcode,\n                     hs_hr_country.cou_code,\n                     hs_hr_employee.emp_hm_telephone,\n                     hs_hr_employee.emp_mobile,\n                     hs_hr_employee.emp_work_telephone,\n                     hs_hr_employee.emp_work_email,\n                     hs_hr_employee.emp_oth_email\n\nORDER BY hs_hr_employee.emp_lastname\n');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer`
--

CREATE TABLE `ohrm_reviewer` (
  `id` int(7) NOT NULL,
  `review_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `status` int(7) DEFAULT NULL,
  `reviewer_group_id` int(7) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_group`
--

CREATE TABLE `ohrm_reviewer_group` (
  `id` int(7) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `piority` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_reviewer_group`
--

INSERT INTO `ohrm_reviewer_group` (`id`, `name`, `piority`) VALUES
(1, 'Supervisor', 1),
(2, 'Employee', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_rating`
--

CREATE TABLE `ohrm_reviewer_rating` (
  `id` int(11) NOT NULL,
  `rating` decimal(18,2) DEFAULT NULL,
  `kpi_id` int(7) DEFAULT NULL,
  `review_id` int(7) DEFAULT NULL,
  `reviewer_id` int(7) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_role_user_selection_rule`
--

CREATE TABLE `ohrm_role_user_selection_rule` (
  `user_role_id` int(10) NOT NULL,
  `selection_rule_id` int(10) NOT NULL,
  `configurable_params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_screen`
--

CREATE TABLE `ohrm_screen` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `module_id` int(11) NOT NULL,
  `action_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_screen`
--

INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES
(1, 'User List', 2, 'viewSystemUsers'),
(2, 'Add/Edit System User', 2, 'saveSystemUser'),
(3, 'Delete System Users', 2, 'deleteSystemUsers'),
(4, 'Add Employee', 3, 'addEmployee'),
(5, 'View Employee List', 3, 'viewEmployeeList'),
(6, 'Delete Employees', 3, 'deleteEmployees'),
(7, 'Leave Type List', 4, 'leaveTypeList'),
(8, 'Define Leave Type', 4, 'defineLeaveType'),
(9, 'Undelete Leave Type', 4, 'undeleteLeaveType'),
(10, 'Delete Leave Type', 4, 'deleteLeaveType'),
(11, 'View Holiday List', 4, 'viewHolidayList'),
(12, 'Define Holiday', 4, 'defineHoliday'),
(13, 'Delete Holiday', 4, 'deleteHoliday'),
(14, 'Define WorkWeek', 4, 'defineWorkWeek'),
(16, 'Leave List', 4, 'viewLeaveList'),
(17, 'Assign Leave', 4, 'assignLeave'),
(18, 'View Leave Summary', 4, 'viewLeaveSummary'),
(19, 'Save Leave Entitlements', 4, 'saveLeaveEntitlements'),
(20, 'General Information', 2, 'viewOrganizationGeneralInformation'),
(21, 'Location List', 2, 'viewLocations'),
(22, 'View Company Structure', 2, 'viewCompanyStructure'),
(23, 'Job Title List', 2, 'viewJobTitleList'),
(24, 'Pay Grade List', 2, 'viewPayGrades'),
(25, 'Employment Status List', 2, 'employmentStatus'),
(26, 'Job Category List', 2, 'jobCategory'),
(27, 'Work Shift List', 2, 'workShift'),
(28, 'Skill List', 2, 'viewSkills'),
(29, 'Education List', 2, 'viewEducation'),
(30, 'License List', 2, 'viewLicenses'),
(31, 'Language List', 2, 'viewLanguages'),
(32, 'Membership List', 2, 'membership'),
(33, 'Nationality List', 2, 'nationality'),
(34, 'Add/Edit Mail Configuration', 2, 'listMailConfiguration'),
(35, 'Notification List', 2, 'viewEmailNotification'),
(36, 'Customer List', 2, 'viewCustomers'),
(37, 'Project List', 2, 'viewProjects'),
(38, 'Localization', 2, 'localization'),
(39, 'Module Configuration', 2, 'viewModules'),
(40, 'Configure PIM', 3, 'configurePim'),
(41, 'Custom Field List', 3, 'listCustomFields'),
(42, 'Data Import', 2, 'pimCsvImport'),
(43, 'Reporting Method List', 3, 'viewReportingMethods'),
(44, 'Termination Reason List', 3, 'viewTerminationReasons'),
(45, 'PIM Reports List', 1, 'viewDefinedPredefinedReports'),
(46, 'View MyInfo', 3, 'viewMyDetails'),
(47, 'Define Leave Period', 4, 'defineLeavePeriod'),
(48, 'View My Leave List', 4, 'viewMyLeaveList'),
(49, 'Apply Leave', 4, 'applyLeave'),
(50, 'Define Timesheet Start Date', 5, 'defineTimesheetPeriod'),
(51, 'View My Timesheet', 5, 'viewMyTimesheet'),
(52, 'View Employee Timesheet', 5, 'viewEmployeeTimesheet'),
(53, 'View My Attendance', 6, 'viewMyAttendanceRecord'),
(54, 'Punch In/Out', 6, 'punchIn'),
(55, 'View Employee Attendance', 6, 'viewAttendanceRecord'),
(56, 'Attendance Configuration', 6, 'configure'),
(57, 'View Project Report Criteria', 5, 'displayProjectReportCriteria'),
(58, 'View Employee Report Criteria', 5, 'displayEmployeeReportCriteria'),
(59, 'View Attendance Report Criteria', 5, 'displayAttendanceSummaryReportCriteria'),
(60, 'Candidate List', 7, 'viewCandidates'),
(61, 'Vacancy List', 7, 'viewJobVacancy'),
(67, 'View Time Module', 5, 'viewTimeModule'),
(68, 'View Leave Module', 4, 'viewLeaveModule'),
(69, 'Leave Entitlements', 4, 'viewLeaveEntitlements'),
(70, 'My Leave Entitlements', 4, 'viewMyLeaveEntitlements'),
(71, 'Delete Leave Entitlements', 4, 'deleteLeaveEntitlements'),
(72, 'Add Leave Entitlement', 4, 'addLeaveEntitlement'),
(73, 'Edit Leave Entitlement', 4, 'editLeaveEntitlement'),
(74, 'View Admin Module', 2, 'viewAdminModule'),
(75, 'View PIM Module', 3, 'viewPimModule'),
(76, 'View Recruitment Module', 7, 'viewRecruitmentModule'),
(78, 'Leave Balance Report', 4, 'viewLeaveBalanceReport'),
(79, 'My Leave Balance Report', 4, 'viewMyLeaveBalanceReport'),
(80, 'Save Job Title', 2, 'saveJobTitle'),
(81, 'Delete Job Title', 2, 'deleteJobTitle'),
(82, 'Save Pay Grade', 2, 'payGrade'),
(83, 'Delete Pay Grade', 2, 'deletePayGrades'),
(84, 'Save Pay Grade Currency', 2, 'savePayGradeCurrency'),
(85, 'Delete Pay Grade Currency', 2, 'deletePayGradeCurrency'),
(86, 'Add Customer', 2, 'addCustomer'),
(87, 'Delete Customer', 2, 'deleteCustomer'),
(88, 'Save Project', 2, 'saveProject'),
(89, 'Delete Project', 2, 'deleteProject'),
(90, 'Add Project Adtivity', 2, 'addProjectActivity'),
(91, 'Delete Project Adtivity', 2, 'deleteProjectActivity'),
(92, 'Define PIM reports', 1, 'definePredefinedReport'),
(93, 'Display PIM reports', 1, 'displayPredefinedReport'),
(94, 'Add Job Vacancy', 7, 'addJobVacancy'),
(95, 'Delete Job Vacancy', 7, 'deleteJobVacancy'),
(96, 'Add Candidate', 7, 'addCandidate'),
(97, 'Delete Candidate', 7, 'deleteCandidateVacancies'),
(98, 'View Leave Request', 4, 'viewLeaveRequest'),
(99, 'Change Leave Status', 4, 'changeLeaveStatus'),
(100, 'Terminate Employment', 3, 'terminateEmployement'),
(101, 'View Attendance Summary Report', 5, 'displayAttendanceSummaryReport'),
(102, 'View Project Activity Details Report', 5, 'displayProjectActivityDetailsReport'),
(103, 'Dashboard', 10, 'index'),
(104, 'Save KPI', 11, 'saveKpi'),
(105, 'Saearch KPI', 11, 'searchKpi'),
(106, 'My Reviews', 11, 'myPerformanceReview'),
(107, 'Add Review', 11, 'saveReview'),
(108, 'Review Evaluate', 11, 'reviewEvaluate'),
(109, 'Review Evaluate By Admin', 11, 'reviewEvaluateByAdmin'),
(110, 'Search Evaluate Performance', 11, 'searchEvaluatePerformancReview'),
(111, 'Search Performance Review', 11, 'searchPerformancReview'),
(112, 'Manage_Trackers', 11, 'addPerformanceTracker'),
(113, 'Employee_Trackers', 11, 'viewEmployeePerformanceTrackerList'),
(114, 'My_Trackers', 11, 'viewMyPerformanceTrackerList'),
(115, 'Employee_Tracker_Logs', 11, 'addPerformanceTrackerLog'),
(116, 'Directory', 12, 'viewDirectory'),
(117, 'Manage OpenId', 2, 'openIdProvider');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_composite_display_field`
--

CREATE TABLE `ohrm_selected_composite_display_field` (
  `id` bigint(20) NOT NULL,
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_composite_display_field`
--

INSERT INTO `ohrm_selected_composite_display_field` (`id`, `composite_display_field_id`, `report_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field`
--

CREATE TABLE `ohrm_selected_display_field` (
  `id` bigint(20) NOT NULL,
  `display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_display_field`
--

INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES
(2, 2, 1),
(4, 8, 2),
(5, 9, 5),
(6, 10, 5),
(7, 11, 5),
(8, 12, 5),
(9, 13, 5),
(10, 14, 5),
(11, 15, 5),
(13, 17, 5),
(14, 18, 5),
(15, 19, 5),
(16, 20, 5),
(17, 21, 5),
(18, 22, 5),
(19, 23, 5),
(20, 24, 5),
(21, 25, 5),
(22, 26, 5),
(23, 27, 5),
(24, 28, 5),
(25, 29, 5),
(26, 30, 5),
(27, 31, 5),
(28, 32, 5),
(29, 33, 5),
(31, 35, 5),
(32, 36, 5),
(33, 37, 5),
(34, 38, 5),
(35, 39, 5),
(36, 40, 5),
(37, 41, 5),
(38, 42, 5),
(39, 43, 5),
(40, 44, 5),
(41, 45, 5),
(43, 47, 5),
(44, 48, 5),
(45, 49, 5),
(48, 52, 5),
(49, 53, 5),
(50, 54, 5),
(51, 55, 5),
(53, 57, 5),
(54, 58, 5),
(55, 59, 5),
(56, 60, 5),
(57, 61, 5),
(58, 62, 5),
(59, 63, 5),
(60, 64, 5),
(61, 65, 5),
(62, 66, 5),
(63, 67, 5),
(64, 68, 5),
(65, 69, 5),
(66, 70, 5),
(67, 71, 5),
(68, 72, 5),
(69, 73, 5),
(70, 74, 5),
(71, 75, 5),
(72, 76, 5),
(73, 77, 5),
(74, 78, 5),
(76, 80, 5),
(77, 81, 5),
(78, 82, 5),
(79, 83, 5),
(80, 84, 5),
(81, 85, 5),
(82, 86, 5),
(83, 87, 5),
(84, 88, 5),
(85, 89, 5),
(86, 90, 5),
(87, 91, 5),
(88, 92, 5),
(89, 93, 5),
(90, 94, 5),
(91, 95, 5),
(93, 97, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field_group`
--

CREATE TABLE `ohrm_selected_display_field_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `display_field_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_display_field_group`
--

INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES
(1, 5, 1),
(2, 5, 2),
(3, 5, 3),
(4, 5, 4),
(5, 5, 5),
(6, 5, 6),
(7, 5, 7),
(8, 5, 8),
(9, 5, 9),
(10, 5, 10),
(11, 5, 11),
(12, 5, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_filter_field`
--

CREATE TABLE `ohrm_selected_filter_field` (
  `report_id` bigint(20) NOT NULL,
  `filter_field_id` bigint(20) NOT NULL,
  `filter_field_order` bigint(20) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `where_condition` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_filter_field`
--

INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'Runtime'),
(1, 3, 2, NULL, NULL, NULL, 'Runtime'),
(1, 7, 3, NULL, NULL, NULL, 'Runtime'),
(1, 21, 4, '0', NULL, '=', 'Predefined'),
(2, 3, 4, NULL, NULL, NULL, 'Runtime'),
(2, 4, 1, NULL, NULL, NULL, 'Runtime'),
(2, 5, 3, NULL, NULL, NULL, 'Runtime'),
(2, 6, 2, NULL, NULL, NULL, 'Runtime'),
(2, 7, 5, NULL, NULL, NULL, 'Runtime'),
(3, 3, 2, NULL, NULL, NULL, 'Runtime'),
(3, 5, 1, NULL, NULL, NULL, 'Runtime'),
(3, 7, 3, NULL, NULL, NULL, 'Runtime'),
(5, 22, 1, NULL, NULL, 'IS NULL', 'Predefined');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_group_field`
--

CREATE TABLE `ohrm_selected_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `summary_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_group_field`
--

INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_skill`
--

CREATE TABLE `ohrm_skill` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_subunit`
--

CREATE TABLE `ohrm_subunit` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `lft` smallint(6) UNSIGNED DEFAULT NULL,
  `rgt` smallint(6) UNSIGNED DEFAULT NULL,
  `level` smallint(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_subunit`
--

INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES
(1, 'Organization', '', '', 1, 6, 0),
(2, 'Anion', 'Anion', '', 2, 3, 1),
(3, 'Inventcorp', 'Inventcorp', '', 4, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_summary_display_field`
--

CREATE TABLE `ohrm_summary_display_field` (
  `summary_display_field_id` bigint(20) NOT NULL,
  `function` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_summary_display_field`
--

INSERT INTO `ohrm_summary_display_field` (`summary_display_field_id`, `function`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`) VALUES
(1, 'ROUND(COALESCE(sum(duration)/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL),
(2, 'ROUND(COALESCE(sum(TIMESTAMPDIFF(SECOND , ohrm_attendance_record.punch_in_utc_time , ohrm_attendance_record.punch_out_utc_time))/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet`
--

CREATE TABLE `ohrm_timesheet` (
  `timesheet_id` bigint(20) NOT NULL,
  `state` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_timesheet`
--

INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES
(1, 'NOT SUBMITTED', '2017-02-27', '2017-03-05', 1),
(2, 'NOT SUBMITTED', '2017-02-20', '2017-02-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_action_log`
--

CREATE TABLE `ohrm_timesheet_action_log` (
  `timesheet_action_log_id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date_time` date NOT NULL,
  `performed_by` int(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_item`
--

CREATE TABLE `ohrm_timesheet_item` (
  `timesheet_item_id` bigint(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `comment` text,
  `project_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_upgrade_history`
--

CREATE TABLE `ohrm_upgrade_history` (
  `id` int(10) NOT NULL,
  `start_version` varchar(30) DEFAULT NULL,
  `end_version` varchar(30) DEFAULT NULL,
  `start_increment` int(11) NOT NULL,
  `end_increment` int(11) NOT NULL,
  `upgraded_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user`
--

CREATE TABLE `ohrm_user` (
  `id` int(10) NOT NULL,
  `user_role_id` int(10) NOT NULL,
  `emp_number` int(13) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user`
--

INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES
(1, 1, NULL, 'admin', '$2a$12$YQ7t7IMzlyXjrznG0hFK2uU98OWqBaUDMuSCZL.hKZrdluiDC4kca', 0, 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 'gangaiah', '$2a$12$yMe2MNoJ.Kkz6/segR3pCeO1JshLeCDEKOaoa6tMXz8RaMpFFxDlq', 0, 1, '2017-02-27 05:48:17', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role`
--

CREATE TABLE `ohrm_user_role` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_assignable` tinyint(1) DEFAULT '0',
  `is_predefined` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role`
--

INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES
(1, 'Admin', 'Admin', 1, 1),
(2, 'ESS', 'ESS', 1, 1),
(3, 'Supervisor', 'Supervisor', 0, 1),
(4, 'ProjectAdmin', 'ProjectAdmin', 0, 1),
(5, 'Interviewer', 'Interviewer', 0, 1),
(6, 'HiringManager', 'HiringManager', 0, 1),
(7, 'Reviewer', 'Reviewer', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_data_group`
--

CREATE TABLE `ohrm_user_role_data_group` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL,
  `self` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role_data_group`
--

INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES
(1, 1, 1, 1, NULL, 1, NULL, 0),
(2, 1, 2, 1, 1, 1, 1, 0),
(3, 1, 3, 1, NULL, 1, NULL, 0),
(4, 1, 4, 1, NULL, 1, NULL, 0),
(5, 1, 5, 1, 1, 1, 1, 0),
(6, 1, 6, 1, NULL, 1, NULL, 0),
(7, 1, 7, 1, 1, 1, 1, 0),
(8, 1, 8, 1, 1, 1, 1, 0),
(9, 1, 9, 1, NULL, 1, NULL, 0),
(10, 1, 10, 1, 1, 1, 1, 0),
(11, 1, 11, 1, 1, 1, 1, 0),
(12, 1, 12, 1, NULL, 1, NULL, 0),
(13, 1, 13, 1, 1, 1, 1, 0),
(14, 1, 14, 1, 1, 1, 1, 0),
(15, 1, 15, 1, NULL, 1, NULL, 0),
(16, 1, 16, 1, NULL, 1, NULL, 0),
(17, 1, 17, 1, 1, 1, 1, 0),
(18, 1, 18, 1, NULL, 1, NULL, 0),
(19, 1, 19, 1, 1, 1, 1, 0),
(20, 1, 20, 1, 1, 1, 1, 0),
(21, 1, 21, 1, NULL, 1, NULL, 0),
(22, 1, 22, 1, NULL, 1, NULL, 0),
(23, 1, 23, 1, 1, 1, 1, 0),
(24, 1, 24, 1, NULL, 1, NULL, 0),
(25, 1, 25, 1, 1, 1, 1, 0),
(26, 1, 26, 1, 1, 1, 1, 0),
(27, 1, 27, 1, 1, 1, 1, 0),
(28, 1, 28, 1, NULL, 1, NULL, 0),
(29, 1, 29, 1, 1, 1, 1, 0),
(30, 1, 30, 1, 1, 1, 1, 0),
(31, 1, 31, 1, 1, 1, 1, 0),
(32, 1, 32, 1, 1, 1, 1, 0),
(33, 1, 33, 1, 1, 1, 1, 0),
(34, 1, 34, 1, 1, 1, 1, 0),
(35, 1, 35, 1, NULL, 1, NULL, 0),
(36, 1, 36, 1, 1, 1, 1, 0),
(37, 1, 37, 1, 1, 1, 1, 0),
(38, 1, 38, 1, NULL, 1, NULL, 0),
(39, 1, 39, 1, NULL, 1, 1, 0),
(40, 1, 40, 1, 1, 1, 1, 0),
(41, 1, 41, 1, NULL, NULL, NULL, 0),
(42, 1, 40, 1, 1, 1, 1, 1),
(43, 2, 1, 1, NULL, 1, NULL, 1),
(44, 2, 2, 1, 1, 1, 1, 1),
(45, 2, 3, 1, NULL, 1, NULL, 1),
(46, 2, 4, 1, NULL, 1, NULL, 1),
(47, 2, 5, 1, 1, 1, 1, 1),
(48, 2, 6, 1, NULL, 1, NULL, 1),
(49, 2, 7, 1, 1, 1, 1, 1),
(50, 2, 8, 1, 1, 1, 1, 1),
(51, 2, 9, 1, NULL, 1, NULL, 1),
(52, 2, 10, 1, 1, 1, 1, 1),
(53, 2, 11, 1, 1, 1, 1, 1),
(54, 2, 12, 1, NULL, 1, NULL, 1),
(55, 2, 13, 1, 1, 1, 1, 1),
(56, 2, 14, 1, 1, 1, 1, 1),
(57, 2, 15, 1, NULL, 1, NULL, 1),
(58, 2, 16, 1, NULL, NULL, NULL, 1),
(59, 2, 17, 1, 0, 0, 0, 1),
(60, 2, 18, 1, 0, 0, 0, 1),
(61, 2, 19, 1, NULL, NULL, NULL, 1),
(62, 2, 20, 1, 0, 0, 0, 1),
(63, 2, 21, 1, 0, 0, 0, 1),
(64, 2, 22, 1, NULL, NULL, NULL, 1),
(65, 2, 23, 1, 0, 0, 0, 1),
(66, 2, 24, 1, 0, 0, 0, 1),
(67, 2, 25, 1, NULL, NULL, NULL, 1),
(68, 2, 26, 1, NULL, NULL, NULL, 1),
(69, 2, 27, 1, 0, 0, 0, 1),
(70, 2, 28, 1, 0, 0, 0, 1),
(71, 2, 29, 1, 1, 1, 1, 1),
(72, 2, 30, 1, 1, 1, 1, 1),
(73, 2, 31, 1, 1, 1, 1, 1),
(74, 2, 32, 1, 1, 1, 1, 1),
(75, 2, 33, 1, 1, 1, 1, 1),
(76, 2, 34, 1, 1, 1, 1, 1),
(77, 2, 35, 1, NULL, 1, NULL, 1),
(78, 2, 36, 1, 1, 1, 1, 1),
(79, 2, 37, 1, 1, 1, 1, 1),
(80, 2, 38, 1, NULL, 1, NULL, 1),
(81, 2, 39, 1, NULL, 1, 1, 1),
(82, 2, 40, 1, 0, 0, 0, 1),
(83, 2, 41, 1, NULL, NULL, NULL, 1),
(84, 3, 1, 1, NULL, 1, NULL, 0),
(85, 3, 2, 1, 1, 1, 1, 0),
(86, 3, 3, 1, NULL, 1, NULL, 0),
(87, 3, 4, 1, NULL, 1, NULL, 0),
(88, 3, 5, 1, 1, 1, 1, 0),
(89, 3, 6, 1, NULL, 1, NULL, 0),
(90, 3, 7, 1, 1, 1, 1, 0),
(91, 3, 8, 1, 1, 1, 1, 0),
(92, 3, 9, 1, NULL, 1, NULL, 0),
(93, 3, 10, 1, 1, 1, 1, 0),
(94, 3, 11, 1, 1, 1, 1, 0),
(95, 3, 12, 1, NULL, 1, NULL, 0),
(96, 3, 13, 1, 1, 1, 1, 0),
(97, 3, 14, 1, 1, 1, 1, 0),
(98, 3, 15, 1, NULL, 1, NULL, 0),
(99, 3, 16, 1, NULL, NULL, NULL, 0),
(100, 3, 17, 1, 0, 0, 0, 0),
(101, 3, 18, 1, 0, 0, 0, 0),
(102, 3, 19, 0, 0, 0, 0, 0),
(103, 3, 20, 0, 0, 0, 0, 0),
(104, 3, 21, 0, 0, 0, 0, 0),
(105, 3, 22, 1, NULL, NULL, NULL, 0),
(106, 3, 23, 1, 0, 0, 0, 0),
(107, 3, 24, 1, 0, 0, 0, 0),
(108, 3, 25, 1, NULL, NULL, NULL, 0),
(109, 3, 26, 1, NULL, NULL, NULL, 0),
(110, 3, 27, 1, 0, 0, 0, 0),
(111, 3, 28, 1, 0, 0, 0, 0),
(112, 3, 29, 1, 1, 1, 1, 0),
(113, 3, 30, 1, 1, 1, 1, 0),
(114, 3, 31, 1, 1, 1, 1, 0),
(115, 3, 32, 1, 1, 1, 1, 0),
(116, 3, 33, 1, 1, 1, 1, 0),
(117, 3, 34, 1, 1, 1, 1, 0),
(118, 3, 35, 1, NULL, 1, NULL, 0),
(119, 3, 36, 1, 1, 1, 1, 0),
(120, 3, 37, 1, 1, 1, 1, 0),
(121, 3, 38, 1, NULL, 1, NULL, 0),
(122, 3, 39, 1, NULL, 1, 1, 0),
(123, 3, 40, 1, 0, 0, 0, 0),
(124, 3, 41, 1, NULL, NULL, NULL, 0),
(125, 3, 1, 1, NULL, 1, NULL, 1),
(126, 3, 2, 1, 1, 1, 1, 1),
(127, 3, 3, 1, NULL, 1, NULL, 1),
(128, 3, 4, 1, NULL, 1, NULL, 1),
(129, 3, 5, 1, 1, 1, 1, 1),
(130, 3, 6, 1, NULL, 1, NULL, 1),
(131, 3, 7, 1, 1, 1, 1, 1),
(132, 3, 8, 1, 1, 1, 1, 1),
(133, 3, 9, 1, NULL, 1, NULL, 1),
(134, 3, 10, 1, 1, 1, 1, 1),
(135, 3, 11, 1, 1, 1, 1, 1),
(136, 3, 12, 1, NULL, 1, NULL, 1),
(137, 3, 13, 1, 1, 1, 1, 1),
(138, 3, 14, 1, 1, 1, 1, 1),
(139, 3, 15, 1, NULL, 1, NULL, 1),
(140, 3, 16, 1, NULL, NULL, NULL, 1),
(141, 3, 17, 1, 0, 0, 0, 1),
(142, 3, 18, 1, 0, 0, 0, 1),
(143, 3, 19, 1, 0, 0, 0, 1),
(144, 3, 20, 1, 0, 0, 0, 1),
(145, 3, 21, 1, 0, 0, 0, 1),
(146, 3, 22, 1, NULL, NULL, NULL, 1),
(147, 3, 23, 1, 0, 0, 0, 1),
(148, 3, 24, 1, 0, 0, 0, 1),
(149, 3, 25, 1, NULL, NULL, NULL, 1),
(150, 3, 26, 1, NULL, NULL, NULL, 1),
(151, 3, 27, 1, 0, 0, 0, 1),
(152, 3, 28, 1, 0, 0, 0, 1),
(153, 3, 29, 1, 1, 1, 1, 1),
(154, 3, 30, 1, 1, 1, 1, 1),
(155, 3, 31, 1, 1, 1, 1, 1),
(156, 3, 32, 1, 1, 1, 1, 1),
(157, 3, 33, 1, 1, 1, 1, 1),
(158, 3, 34, 1, 1, 1, 1, 1),
(159, 3, 35, 1, NULL, 1, NULL, 1),
(160, 3, 36, 1, 1, 1, 1, 1),
(161, 3, 37, 1, 1, 1, 1, 1),
(162, 3, 38, 1, NULL, 1, NULL, 1),
(163, 3, 39, 1, NULL, 1, 1, 1),
(164, 3, 40, 1, 0, 0, 0, 1),
(165, 3, 41, 1, NULL, NULL, NULL, 1),
(166, 1, 42, 1, 1, 1, 1, 0),
(167, 2, 42, 0, 0, 0, 0, 0),
(168, 3, 42, 0, 0, 0, 0, 0),
(169, 1, 43, 1, 1, 1, 1, 0),
(170, 2, 43, 0, 0, 0, 0, 0),
(171, 3, 43, 0, 0, 0, 0, 0),
(172, 1, 44, 1, 1, 1, 1, 0),
(173, 2, 44, 0, 0, 0, 0, 0),
(174, 3, 44, 0, 0, 0, 0, 0),
(175, 1, 45, 1, 1, 1, 1, 0),
(176, 2, 45, 0, 0, 0, 0, 0),
(177, 3, 45, 0, 0, 0, 0, 0),
(178, 4, 45, 1, 0, 1, 0, 0),
(179, 1, 46, 1, 1, 1, 1, 0),
(180, 2, 46, 0, 0, 0, 0, 0),
(181, 3, 46, 0, 0, 0, 0, 0),
(182, 1, 47, 1, NULL, 1, NULL, 0),
(183, 2, 47, 0, 0, 0, 0, 0),
(184, 3, 47, 0, 0, 0, 0, 0),
(185, 1, 48, 1, 0, 0, 0, 0),
(186, 2, 48, 0, 0, 0, 0, 0),
(187, 2, 48, 1, 0, 0, 0, 1),
(188, 3, 48, 1, 0, 0, 0, 0),
(189, 1, 49, 1, 0, 0, 0, 0),
(190, 2, 49, 0, 0, 0, 0, 0),
(191, 3, 49, 0, 0, 0, 0, 0),
(192, 4, 49, 1, 0, 0, 0, 0),
(193, 1, 50, 1, 0, 0, 0, 0),
(194, 2, 50, 0, 0, 0, 0, 0),
(195, 3, 50, 1, 0, 0, 0, 0),
(196, 1, 51, 1, 0, 0, 0, 0),
(197, 2, 51, 0, 0, 0, 0, 0),
(198, 3, 51, 1, 0, 0, 0, 0),
(199, 1, 52, 1, NULL, 1, NULL, 0),
(200, 2, 52, 0, 0, 0, 0, 0),
(201, 3, 52, 0, 0, 0, 0, 0),
(202, 1, 53, 1, 1, 1, 1, 0),
(203, 2, 53, 0, 0, 0, 0, 0),
(204, 3, 53, 0, 0, 0, 0, 0),
(205, 1, 54, 1, 0, 1, 0, 0),
(206, 2, 54, 0, 0, 0, 0, 0),
(207, 3, 54, 0, 0, 0, 0, 0),
(208, 1, 55, 1, 1, 1, 1, 0),
(209, 2, 55, 0, 0, 0, 0, 0),
(210, 3, 55, 0, 0, 0, 0, 0),
(211, 1, 56, 1, 1, 1, 1, 0),
(212, 2, 56, 0, 0, 0, 0, 0),
(213, 3, 56, 0, 0, 0, 0, 0),
(214, 1, 57, 1, 1, 1, 1, 0),
(215, 6, 57, 1, 1, 1, 1, 0),
(216, 5, 57, 1, 0, 1, 0, 0),
(217, 1, 58, 1, 0, 0, 0, 0),
(218, 2, 58, 0, 0, 0, 0, 0),
(219, 2, 58, 1, 0, 0, 0, 1),
(220, 3, 58, 1, 0, 0, 0, 0),
(221, 1, 59, 1, 0, 0, 0, 0),
(222, 2, 59, 1, 0, 0, 0, 1),
(223, 3, 59, 1, 0, 0, 0, 0),
(224, 1, 60, 0, 1, 0, 0, 0),
(225, 2, 60, 0, 1, 0, 0, 1),
(226, 3, 60, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_screen`
--

CREATE TABLE `ohrm_user_role_screen` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `can_read` tinyint(1) NOT NULL DEFAULT '0',
  `can_create` tinyint(1) NOT NULL DEFAULT '0',
  `can_update` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role_screen`
--

INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1),
(3, 2, 2, 0, 0, 0, 0),
(4, 3, 2, 0, 0, 0, 0),
(5, 1, 3, 1, 1, 1, 1),
(6, 2, 3, 0, 0, 0, 0),
(7, 3, 3, 0, 0, 0, 0),
(8, 1, 4, 1, 1, 1, 1),
(9, 1, 5, 1, 1, 1, 1),
(10, 3, 5, 1, 0, 0, 0),
(11, 1, 6, 1, 0, 0, 1),
(12, 1, 7, 1, 1, 1, 1),
(13, 1, 8, 1, 1, 1, 1),
(14, 1, 9, 1, 1, 1, 1),
(15, 1, 10, 1, 1, 1, 1),
(16, 1, 11, 1, 1, 1, 1),
(17, 1, 12, 1, 1, 1, 1),
(18, 1, 13, 1, 1, 1, 1),
(19, 1, 14, 1, 1, 1, 1),
(20, 1, 16, 1, 1, 1, 0),
(21, 3, 16, 1, 1, 1, 0),
(22, 1, 17, 1, 1, 1, 0),
(23, 3, 17, 1, 1, 1, 0),
(24, 1, 18, 1, 1, 1, 0),
(25, 2, 18, 1, 0, 0, 0),
(26, 3, 18, 1, 0, 0, 0),
(27, 1, 19, 1, 1, 1, 1),
(28, 1, 20, 1, 1, 1, 1),
(29, 1, 21, 1, 1, 1, 1),
(30, 1, 22, 1, 1, 1, 1),
(31, 1, 23, 1, 1, 1, 1),
(32, 1, 24, 1, 1, 1, 1),
(33, 1, 25, 1, 1, 1, 1),
(34, 1, 26, 1, 1, 1, 1),
(35, 1, 27, 1, 1, 1, 1),
(36, 1, 28, 1, 1, 1, 1),
(37, 1, 29, 1, 1, 1, 1),
(38, 1, 30, 1, 1, 1, 1),
(39, 1, 31, 1, 1, 1, 1),
(40, 1, 32, 1, 1, 1, 1),
(41, 1, 33, 1, 1, 1, 1),
(42, 1, 34, 1, 1, 1, 1),
(43, 1, 35, 1, 1, 1, 1),
(44, 1, 36, 1, 1, 1, 1),
(45, 1, 37, 1, 1, 1, 1),
(46, 4, 37, 1, 0, 0, 0),
(47, 1, 38, 1, 1, 1, 1),
(48, 1, 39, 1, 1, 1, 1),
(49, 1, 40, 1, 1, 1, 1),
(50, 1, 41, 1, 1, 1, 1),
(51, 1, 42, 1, 1, 1, 1),
(52, 1, 43, 1, 1, 1, 1),
(53, 1, 44, 1, 1, 1, 1),
(54, 1, 45, 1, 1, 1, 1),
(55, 2, 46, 1, 1, 1, 1),
(56, 1, 47, 1, 1, 1, 1),
(57, 2, 48, 1, 1, 1, 0),
(58, 2, 49, 1, 1, 1, 1),
(59, 1, 50, 1, 1, 1, 1),
(60, 2, 51, 1, 1, 1, 1),
(61, 1, 52, 1, 1, 1, 1),
(62, 3, 52, 1, 1, 1, 1),
(63, 2, 53, 1, 1, 0, 0),
(64, 2, 54, 1, 1, 1, 1),
(65, 1, 55, 1, 1, 0, 1),
(66, 3, 55, 1, 1, 0, 0),
(67, 1, 56, 1, 1, 1, 1),
(68, 1, 57, 1, 1, 1, 1),
(69, 4, 57, 1, 1, 1, 1),
(70, 1, 58, 1, 1, 1, 1),
(71, 3, 58, 1, 1, 1, 1),
(72, 1, 59, 1, 1, 1, 1),
(73, 3, 59, 1, 1, 1, 1),
(74, 1, 60, 1, 1, 1, 1),
(75, 6, 60, 1, 1, 1, 1),
(76, 5, 60, 1, 0, 1, 0),
(77, 1, 61, 1, 1, 1, 1),
(78, 1, 67, 1, 1, 1, 1),
(79, 2, 67, 1, 0, 1, 0),
(80, 3, 67, 1, 0, 1, 0),
(81, 1, 68, 1, 1, 1, 1),
(82, 2, 68, 1, 0, 1, 0),
(83, 3, 68, 1, 0, 1, 0),
(84, 1, 69, 1, 1, 1, 1),
(85, 3, 69, 1, 0, 0, 0),
(86, 2, 70, 1, 0, 0, 0),
(87, 1, 71, 1, 0, 0, 1),
(88, 1, 72, 1, 1, 1, 0),
(89, 1, 73, 1, 0, 1, 0),
(90, 1, 74, 1, 1, 1, 1),
(91, 1, 75, 1, 1, 1, 1),
(92, 3, 75, 1, 1, 1, 1),
(93, 1, 76, 1, 1, 1, 1),
(94, 5, 76, 1, 1, 1, 1),
(95, 6, 76, 1, 1, 1, 1),
(96, 1, 78, 1, 0, 0, 0),
(97, 3, 78, 1, 0, 0, 0),
(98, 2, 79, 1, 0, 0, 0),
(99, 1, 80, 1, 1, 1, 1),
(100, 1, 81, 1, 1, 1, 1),
(101, 1, 82, 1, 1, 1, 1),
(102, 1, 83, 1, 1, 1, 1),
(103, 1, 84, 1, 1, 1, 1),
(104, 1, 85, 1, 1, 1, 1),
(105, 1, 86, 1, 1, 1, 1),
(106, 1, 87, 1, 1, 1, 1),
(107, 1, 88, 1, 1, 1, 1),
(108, 4, 88, 1, 1, 1, 1),
(109, 1, 89, 1, 1, 1, 1),
(110, 1, 90, 1, 1, 1, 1),
(111, 4, 90, 1, 1, 1, 1),
(112, 1, 91, 1, 1, 1, 1),
(113, 4, 91, 1, 1, 1, 1),
(114, 1, 92, 1, 1, 1, 1),
(115, 1, 93, 1, 1, 1, 1),
(116, 1, 94, 1, 1, 1, 1),
(117, 1, 95, 1, 1, 1, 1),
(118, 1, 96, 1, 1, 1, 1),
(119, 5, 96, 1, 1, 1, 1),
(120, 6, 96, 1, 1, 1, 1),
(121, 1, 97, 1, 1, 1, 1),
(122, 6, 97, 1, 1, 1, 1),
(123, 1, 98, 1, 1, 1, 1),
(124, 2, 98, 1, 1, 1, 1),
(125, 3, 98, 1, 1, 1, 1),
(126, 1, 99, 1, 0, 1, 0),
(127, 2, 99, 1, 0, 1, 0),
(128, 3, 99, 1, 0, 1, 0),
(129, 1, 100, 1, 0, 0, 0),
(130, 1, 101, 1, 1, 1, 1),
(131, 3, 101, 1, 1, 1, 1),
(132, 1, 102, 1, 1, 1, 1),
(133, 4, 102, 1, 1, 1, 1),
(134, 1, 103, 1, 0, 0, 0),
(135, 2, 103, 1, 0, 0, 0),
(136, 1, 104, 1, 1, 1, 0),
(137, 1, 105, 1, 1, 1, 1),
(138, 1, 107, 1, 1, 1, 0),
(139, 1, 109, 1, 1, 1, 0),
(140, 1, 111, 1, 1, 1, 1),
(141, 2, 110, 1, 0, 1, 0),
(142, 2, 108, 1, 1, 1, 0),
(143, 2, 106, 1, 0, 1, 0),
(144, 3, 109, 1, 1, 1, 0),
(145, 2, 109, 1, 1, 1, 0),
(146, 1, 112, 1, 1, 1, 1),
(147, 2, 112, 0, 0, 0, 0),
(148, 1, 113, 1, 1, 1, 1),
(149, 2, 113, 1, 1, 1, 0),
(150, 1, 114, 0, 0, 0, 0),
(151, 2, 114, 1, 0, 1, 0),
(152, 1, 115, 1, 1, 1, 0),
(153, 2, 115, 1, 0, 0, 0),
(154, 1, 116, 1, 1, 1, 1),
(155, 2, 116, 1, 1, 1, 1),
(156, 1, 117, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_selection_rule`
--

CREATE TABLE `ohrm_user_selection_rule` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `implementation_class` varchar(255) NOT NULL,
  `rule_xml_data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_workflow_state_machine`
--

CREATE TABLE `ohrm_workflow_state_machine` (
  `id` bigint(20) NOT NULL,
  `workflow` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `resulting_state` varchar(255) NOT NULL,
  `roles_to_notify` text,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_workflow_state_machine`
--

INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES
(1, '0', 'INITIAL', 'SYSTEM', '7', 'NOT SUBMITTED', '', 0),
(2, '0', 'SUBMITTED', 'ADMIN', '2', 'APPROVED', '', 0),
(3, '0', 'SUBMITTED', 'ADMIN', '3', 'REJECTED', '', 0),
(4, '0', 'SUBMITTED', 'ADMIN', '0', 'SUBMITTED', '', 0),
(5, '0', 'SUBMITTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(6, '0', 'SUBMITTED', 'SUPERVISOR', '2', 'APPROVED', '', 0),
(7, '0', 'SUBMITTED', 'SUPERVISOR', '3', 'REJECTED', '', 0),
(8, '0', 'SUBMITTED', 'SUPERVISOR', '5', 'SUBMITTED', '', 0),
(9, '0', 'SUBMITTED', 'SUPERVISOR', '0', 'SUBMITTED', '', 0),
(10, '0', 'SUBMITTED', 'ESS USER', '0', 'SUBMITTED', '', 0),
(11, '0', 'SUBMITTED', 'ESS USER', '5', 'SUBMITTED', '', 0),
(12, '0', 'NOT SUBMITTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(13, '0', 'NOT SUBMITTED', 'ESS USER', '5', 'NOT SUBMITTED', '', 0),
(15, '0', 'NOT SUBMITTED', 'ESS USER', '0', 'NOT SUBMITTED', '', 0),
(16, '0', 'NOT SUBMITTED', 'SUPERVISOR', '0', 'NOT SUBMITTED', '', 0),
(17, '0', 'NOT SUBMITTED', 'SUPERVISOR', '5', 'NOT SUBMITTED', '', 0),
(18, '0', 'NOT SUBMITTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(19, '0', 'NOT SUBMITTED', 'ADMIN', '0', 'NOT SUBMITTED', '', 0),
(20, '0', 'NOT SUBMITTED', 'ADMIN', '5', 'NOT SUBMITTED', '', 0),
(21, '0', 'NOT SUBMITTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(22, '0', 'REJECTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(23, '0', 'REJECTED', 'ESS USER', '0', 'REJECTED', '', 0),
(24, '0', 'REJECTED', 'ESS USER', '5', 'REJECTED', '', 0),
(25, '0', 'REJECTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(26, '0', 'REJECTED', 'SUPERVISOR', '0', 'REJECTED', '', 0),
(27, '0', 'REJECTED', 'SUPERVISOR', '5', 'REJECTED', '', 0),
(28, '0', 'REJECTED', 'ADMIN', '0', 'REJECTED', '', 0),
(29, '0', 'REJECTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(30, '0', 'REJECTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(31, '0', 'APPROVED', 'ESS USER', '0', 'APPROVED', '', 0),
(32, '0', 'APPROVED', 'SUPERVISOR', '0', 'APPROVED', '', 0),
(33, '0', 'APPROVED', 'ADMIN', '0', 'APPROVED', '', 0),
(34, '0', 'APPROVED', 'ADMIN', '4', 'SUBMITTED', '', 0),
(35, '1', 'PUNCHED IN', 'ESS USER', '1', 'PUNCHED OUT', '', 0),
(36, '1', 'INITIAL', 'ESS USER', '0', 'PUNCHED IN', '', 0),
(37, '2', 'INITIAL', 'ADMIN', '1', 'APPLICATION INITIATED', '', 0),
(38, '2', 'APPLICATION INITIATED', 'ADMIN', '2', 'SHORTLISTED', '', 0),
(39, '2', 'APPLICATION INITIATED', 'ADMIN', '3', 'REJECTED', '', 0),
(40, '2', 'SHORTLISTED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(41, '2', 'SHORTLISTED', 'ADMIN', '3', 'REJECTED', '', 0),
(42, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '3', 'REJECTED', '', 0),
(43, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '5', 'INTERVIEW PASSED', '', 0),
(44, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '6', 'INTERVIEW FAILED', '', 0),
(45, '2', 'INTERVIEW PASSED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(46, '2', 'INTERVIEW PASSED', 'ADMIN', '7', 'JOB OFFERED', '', 0),
(47, '2', 'INTERVIEW PASSED', 'ADMIN', '3', 'REJECTED', '', 0),
(48, '2', 'INTERVIEW FAILED', 'ADMIN', '3', 'REJECTED', '', 0),
(49, '2', 'JOB OFFERED', 'ADMIN', '8', 'OFFER DECLINED', '', 0),
(50, '2', 'JOB OFFERED', 'ADMIN', '3', 'REJECTED', '', 0),
(51, '2', 'JOB OFFERED', 'ADMIN', '9', 'HIRED', '', 0),
(52, '2', 'OFFER DECLINED', 'ADMIN', '3', 'REJECTED', '', 0),
(53, '2', 'INITIAL', 'HIRING MANAGER', '1', 'APPLICATION INITIATED', '', 0),
(54, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '2', 'SHORTLISTED', '', 0),
(55, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(56, '2', 'SHORTLISTED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(57, '2', 'SHORTLISTED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(58, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(59, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '5', 'INTERVIEW PASSED', '', 0),
(60, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '6', 'INTERVIEW FAILED', '', 0),
(61, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(62, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '7', 'JOB OFFERED', '', 0),
(63, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(64, '2', 'INTERVIEW FAILED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(65, '2', 'JOB OFFERED', 'HIRING MANAGER', '8', 'OFFER DECLINED', '', 0),
(66, '2', 'JOB OFFERED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(67, '2', 'JOB OFFERED', 'HIRING MANAGER', '9', 'HIRED', '', 0),
(68, '2', 'OFFER DECLINED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(69, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '5', 'INTERVIEW PASSED', '', 0),
(70, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '6', 'INTERVIEW FAILED', '', 0),
(71, '1', 'INITIAL', 'ADMIN', '5', 'PUNCHED IN', '', 0),
(72, '1', 'PUNCHED IN', 'ADMIN', '6', 'PUNCHED OUT', '', 0),
(73, '1', 'PUNCHED IN', 'ADMIN', '2', 'PUNCHED IN', '', 0),
(74, '1', 'PUNCHED IN', 'ADMIN', '7', 'N/A', '', 0),
(75, '1', 'PUNCHED OUT', 'ADMIN', '2', 'PUNCHED OUT', '', 0),
(76, '1', 'PUNCHED OUT', 'ADMIN', '3', 'PUNCHED OUT', '', 0),
(77, '1', 'PUNCHED OUT', 'ADMIN', '7', 'N/A', '', 0),
(78, '0', 'INITIAL', 'ADMIN', '7', 'NOT SUBMITTED', '', 0),
(79, '0', 'INITIAL', 'ESS USER', '7', 'NOT SUBMITTED', '', 0),
(80, '0', 'INITIAL', 'SUPERVISOR', '7', 'NOT SUBMITTED', '', 0),
(81, '3', 'NOT_EXIST', 'ADMIN', '1', 'ACTIVE', '', 0),
(82, '3', 'ACTIVE', 'ADMIN', '2', 'NOT_EXIST', '', 0),
(83, '3', 'ACTIVE', 'ADMIN', '3', 'TERMINATED', '', 0),
(84, '3', 'TERMINATED', 'ADMIN', '4', 'ACTIVE', '', 0),
(85, '3', 'TERMINATED', 'ADMIN', '5', 'NOT_EXIST', '', 0),
(86, '4', 'INITIAL', 'ESS', 'APPLY', 'PENDING APPROVAL', 'supervisor,subscriber', 0),
(87, '4', 'INITIAL', 'ADMIN', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(88, '4', 'INITIAL', 'SUPERVISOR', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(89, '4', 'PENDING APPROVAL', 'ADMIN', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(90, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(91, '4', 'PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(92, '4', 'PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(93, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(94, '4', 'PENDING APPROVAL', 'ADMIN', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(95, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(96, '4', 'SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(97, '4', 'SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(98, '4', 'SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(99, '4', 'TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(100, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(101, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(102, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(103, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(104, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(105, '4', 'LEAVE TYPE DELETED SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(106, '4', 'LEAVE TYPE DELETED TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_shift`
--

CREATE TABLE `ohrm_work_shift` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `hours_per_day` decimal(4,2) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_work_shift`
--

INSERT INTO `ohrm_work_shift` (`id`, `name`, `hours_per_day`, `start_time`, `end_time`) VALUES
(1, 'Day Shift', '9.00', '09:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_week`
--

CREATE TABLE `ohrm_work_week` (
  `id` int(10) UNSIGNED NOT NULL,
  `operational_country_id` int(10) UNSIGNED DEFAULT NULL,
  `mon` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `tue` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `wed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `thu` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `fri` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sat` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sun` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ohrm_work_week`
--

INSERT INTO `ohrm_work_week` (`id`, `operational_country_id`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_ws_consumer`
--

CREATE TABLE `ohrm_ws_consumer` (
  `app_id` int(10) UNSIGNED NOT NULL,
  `app_token` varchar(10) NOT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abstract_display_field`
--
ALTER TABLE `abstract_display_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_config`
--
ALTER TABLE `hs_hr_config`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `hs_hr_country`
--
ALTER TABLE `hs_hr_country`
  ADD PRIMARY KEY (`cou_code`);

--
-- Indexes for table `hs_hr_currency_type`
--
ALTER TABLE `hs_hr_currency_type`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `hs_hr_custom_export`
--
ALTER TABLE `hs_hr_custom_export`
  ADD PRIMARY KEY (`export_id`),
  ADD KEY `emp_number` (`export_id`);

--
-- Indexes for table `hs_hr_custom_fields`
--
ALTER TABLE `hs_hr_custom_fields`
  ADD PRIMARY KEY (`field_num`),
  ADD KEY `emp_number` (`field_num`),
  ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_custom_import`
--
ALTER TABLE `hs_hr_custom_import`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `emp_number` (`import_id`);

--
-- Indexes for table `hs_hr_district`
--
ALTER TABLE `hs_hr_district`
  ADD PRIMARY KEY (`district_code`);

--
-- Indexes for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
  ADD PRIMARY KEY (`emp_number`),
  ADD KEY `work_station` (`work_station`),
  ADD KEY `nation_code` (`nation_code`),
  ADD KEY `job_title_code` (`job_title_code`),
  ADD KEY `emp_status` (`emp_status`),
  ADD KEY `eeo_cat_code` (`eeo_cat_code`),
  ADD KEY `termination_id` (`termination_id`);

--
-- Indexes for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
  ADD PRIMARY KEY (`emp_number`,`eattach_id`),
  ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sal_grd_code` (`sal_grd_code`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `payperiod_code` (`payperiod_code`);

--
-- Indexes for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
  ADD PRIMARY KEY (`emp_number`,`ec_seqno`);

--
-- Indexes for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
  ADD PRIMARY KEY (`emp_number`,`econ_extend_id`);

--
-- Indexes for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
  ADD PRIMARY KEY (`emp_number`,`ed_seqno`);

--
-- Indexes for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_id` (`salary_id`);

--
-- Indexes for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
  ADD PRIMARY KEY (`emp_number`,`eec_seqno`);

--
-- Indexes for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
  ADD PRIMARY KEY (`emp_number`,`emp_seqno`);

--
-- Indexes for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
  ADD PRIMARY KEY (`emp_number`,`lang_id`,`fluency`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
  ADD PRIMARY KEY (`emp_number`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
  ADD PRIMARY KEY (`emp_number`,`membship_code`),
  ADD KEY `membship_code` (`membship_code`);

--
-- Indexes for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
  ADD PRIMARY KEY (`emp_number`,`ep_seqno`);

--
-- Indexes for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
  ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
  ADD PRIMARY KEY (`erep_sup_emp_number`,`erep_sub_emp_number`,`erep_reporting_mode`),
  ADD KEY `erep_sub_emp_number` (`erep_sub_emp_number`),
  ADD KEY `erep_reporting_mode` (`erep_reporting_mode`);

--
-- Indexes for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
  ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
  ADD PRIMARY KEY (`emp_number`,`eexp_seqno`);

--
-- Indexes for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
  ADD PRIMARY KEY (`jobtit_code`,`estat_code`),
  ADD KEY `estat_code` (`estat_code`);

--
-- Indexes for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notification_type_id` (`notification_type_id`);

--
-- Indexes for table `hs_hr_module`
--
ALTER TABLE `hs_hr_module`
  ADD PRIMARY KEY (`mod_id`);

--
-- Indexes for table `hs_hr_payperiod`
--
ALTER TABLE `hs_hr_payperiod`
  ADD PRIMARY KEY (`payperiod_code`);

--
-- Indexes for table `hs_hr_pay_period`
--
ALTER TABLE `hs_hr_pay_period`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_province`
--
ALTER TABLE `hs_hr_province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_unique_id`
--
ALTER TABLE `hs_hr_unique_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table_field` (`table_name`,`field_name`);

--
-- Indexes for table `ohrm_advanced_report`
--
ALTER TABLE `ohrm_advanced_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_attendance_record`
--
ALTER TABLE `ohrm_attendance_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id_state` (`employee_id`,`state`),
  ADD KEY `emp_id_time` (`employee_id`,`punch_in_utc_time`,`punch_out_utc_time`);

--
-- Indexes for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
  ADD PRIMARY KEY (`report_group_id`,`group_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `group_field_id` (`group_field_id`);

--
-- Indexes for table `ohrm_beacon_notification`
--
ALTER TABLE `ohrm_beacon_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  ADD PRIMARY KEY (`composite_display_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_customer`
--
ALTER TABLE `ohrm_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datapoint_type_id` (`datapoint_type_id`);

--
-- Indexes for table `ohrm_datapoint_type`
--
ALTER TABLE `ohrm_datapoint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_data_group`
--
ALTER TABLE `ohrm_data_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_group_id` (`data_group_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  ADD PRIMARY KEY (`display_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_education`
--
ALTER TABLE `ohrm_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email`
--
ALTER TABLE `ohrm_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ohrm_email_name` (`name`);

--
-- Indexes for table `ohrm_email_configuration`
--
ALTER TABLE `ohrm_email_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_notification`
--
ALTER TABLE `ohrm_email_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  ADD PRIMARY KEY (`work_shift_id`,`emp_number`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_employment_status`
--
ALTER TABLE `ohrm_employment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `education_id` (`education_id`);

--
-- Indexes for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
  ADD PRIMARY KEY (`emp_number`,`license_id`),
  ADD KEY `license_id` (`license_id`);

--
-- Indexes for table `ohrm_emp_reporting_method`
--
ALTER TABLE `ohrm_emp_reporting_method`
  ADD PRIMARY KEY (`reporting_method_id`);

--
-- Indexes for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reason_id` (`reason_id`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_emp_termination_reason`
--
ALTER TABLE `ohrm_emp_termination_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
  ADD PRIMARY KEY (`filter_field_id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_group_field`
--
ALTER TABLE `ohrm_group_field`
  ADD PRIMARY KEY (`group_field_id`);

--
-- Indexes for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_holiday_ohrm_operational_country` (`operational_country_id`);

--
-- Indexes for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Indexes for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_person` (`added_person`);

--
-- Indexes for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `vacancy_id` (`vacancy_id`),
  ADD KEY `interview_id` (`interview_id`),
  ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
  ADD PRIMARY KEY (`candidate_id`,`vacancy_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_job_category`
--
ALTER TABLE `ohrm_job_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_vacancy_id` (`candidate_vacancy_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interview_id` (`interview_id`);

--
-- Indexes for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
  ADD PRIMARY KEY (`interview_id`,`interviewer_id`),
  ADD KEY `interviewer_id` (`interviewer_id`);

--
-- Indexes for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_title_id` (`job_title_id`);

--
-- Indexes for table `ohrm_job_title`
--
ALTER TABLE `ohrm_job_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_title_code` (`job_title_code`),
  ADD KEY `hiring_manager_id` (`hiring_manager_id`);

--
-- Indexes for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_kpi`
--
ALTER TABLE `ohrm_kpi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_language`
--
ALTER TABLE `ohrm_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_request_type_emp` (`leave_request_id`,`leave_type_id`,`emp_number`),
  ADD KEY `request_status` (`leave_request_id`,`status`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `adjustment_type` (`adjustment_type`);

--
-- Indexes for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_id` (`leave_id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `entitlement_type` (`entitlement_type`),
  ADD KEY `created_by_id` (`created_by_id`);

--
-- Indexes for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entitlement_id` (`entitlement_id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `ohrm_leave_entitlement_type`
--
ALTER TABLE `ohrm_leave_entitlement_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entitlement_id` (`entitlement_id`),
  ADD KEY `leave_id` (`leave_id`);

--
-- Indexes for table `ohrm_leave_period_history`
--
ALTER TABLE `ohrm_leave_period_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_request_id` (`leave_request_id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_status`
--
ALTER TABLE `ohrm_leave_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operational_country_id` (`operational_country_id`);

--
-- Indexes for table `ohrm_license`
--
ALTER TABLE `ohrm_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `ohrm_login`
--
ALTER TABLE `ohrm_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_membership`
--
ALTER TABLE `ohrm_membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_module`
--
ALTER TABLE `ohrm_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `ohrm_nationality`
--
ALTER TABLE `ohrm_nationality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_oauth_access_token`
--
ALTER TABLE `ohrm_oauth_access_token`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `ohrm_oauth_authorization_code`
--
ALTER TABLE `ohrm_oauth_authorization_code`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `ohrm_oauth_client`
--
ALTER TABLE `ohrm_oauth_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `ohrm_oauth_refresh_token`
--
ALTER TABLE `ohrm_oauth_refresh_token`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `ohrm_oauth_user`
--
ALTER TABLE `ohrm_oauth_user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ohrm_openid_provider`
--
ALTER TABLE `ohrm_openid_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
  ADD KEY `ohrm_user_identity_ibfk_1` (`user_id`),
  ADD KEY `ohrm_user_identity_ibfk_2` (`provider_id`);

--
-- Indexes for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_operational_country_hs_hr_country` (`country_code`);

--
-- Indexes for table `ohrm_organization_gen_info`
--
ALTER TABLE `ohrm_organization_gen_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_pay_grade`
--
ALTER TABLE `ohrm_pay_grade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
  ADD PRIMARY KEY (`pay_grade_id`,`currency_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_number` (`employee_number`);

--
-- Indexes for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_track_fk1_idx` (`emp_number`),
  ADD KEY `ohrm_performance_track_fk2_idx` (`added_by`);

--
-- Indexes for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_tracker_log_fk1_idx` (`performance_track_id`),
  ADD KEY `ohrm_performance_tracker_log_fk2_idx` (`reviewer_id`),
  ADD KEY `fk_ohrm_performance_tracker_log_1` (`user_id`);

--
-- Indexes for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_tracker_reviewer_fk1_idx` (`performance_track_id`),
  ADD KEY `ohrm_performance_tracker_reviewer_fk2_idx` (`reviewer_id`);

--
-- Indexes for table `ohrm_plugin`
--
ALTER TABLE `ohrm_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ohrm_project`
--
ALTER TABLE `ohrm_project`
  ADD PRIMARY KEY (`project_id`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
  ADD PRIMARY KEY (`project_id`,`emp_number`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_report_group`
--
ALTER TABLE `ohrm_report_group`
  ADD PRIMARY KEY (`report_group_id`);

--
-- Indexes for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `ohrm_reviewer_group`
--
ALTER TABLE `ohrm_reviewer_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `ohrm_role_user_selection_rule`
--
ALTER TABLE `ohrm_role_user_selection_rule`
  ADD PRIMARY KEY (`user_role_id`,`selection_rule_id`);

--
-- Indexes for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `ohrm_selected_composite_display_field`
--
ALTER TABLE `ohrm_selected_composite_display_field`
  ADD PRIMARY KEY (`id`,`composite_display_field_id`,`report_id`),
  ADD KEY `composite_display_field_id` (`composite_display_field_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
  ADD PRIMARY KEY (`id`,`display_field_id`,`report_id`),
  ADD KEY `display_field_id` (`display_field_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_selected_filter_field`
--
ALTER TABLE `ohrm_selected_filter_field`
  ADD PRIMARY KEY (`report_id`,`filter_field_id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `filter_field_id` (`filter_field_id`);

--
-- Indexes for table `ohrm_selected_group_field`
--
ALTER TABLE `ohrm_selected_group_field`
  ADD PRIMARY KEY (`group_field_id`,`summary_display_field_id`,`report_id`),
  ADD KEY `group_field_id` (`group_field_id`),
  ADD KEY `summary_display_field_id` (`summary_display_field_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_skill`
--
ALTER TABLE `ohrm_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_subunit`
--
ALTER TABLE `ohrm_subunit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_summary_display_field`
--
ALTER TABLE `ohrm_summary_display_field`
  ADD PRIMARY KEY (`summary_display_field_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_timesheet`
--
ALTER TABLE `ohrm_timesheet`
  ADD PRIMARY KEY (`timesheet_id`);

--
-- Indexes for table `ohrm_timesheet_action_log`
--
ALTER TABLE `ohrm_timesheet_action_log`
  ADD PRIMARY KEY (`timesheet_action_log_id`),
  ADD KEY `timesheet_id` (`timesheet_id`),
  ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `ohrm_timesheet_item`
--
ALTER TABLE `ohrm_timesheet_item`
  ADD PRIMARY KEY (`timesheet_item_id`),
  ADD KEY `timesheet_id` (`timesheet_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `ohrm_upgrade_history`
--
ALTER TABLE `ohrm_upgrade_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `modified_user_id` (`modified_user_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `ohrm_user_role`
--
ALTER TABLE `ohrm_user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_role_name` (`name`);

--
-- Indexes for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `data_group_id` (`data_group_id`);

--
-- Indexes for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_user_selection_rule`
--
ALTER TABLE `ohrm_user_selection_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_workflow_state_machine`
--
ALTER TABLE `ohrm_workflow_state_machine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_work_shift`
--
ALTER TABLE `ohrm_work_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_work_week_ohrm_operational_country` (`operational_country_id`);

--
-- Indexes for table `ohrm_ws_consumer`
--
ALTER TABLE `ohrm_ws_consumer`
  ADD PRIMARY KEY (`app_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abstract_display_field`
--
ALTER TABLE `abstract_display_field`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hs_hr_province`
--
ALTER TABLE `hs_hr_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `hs_hr_unique_id`
--
ALTER TABLE `hs_hr_unique_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_beacon_notification`
--
ALTER TABLE `ohrm_beacon_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  MODIFY `composite_display_field_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_customer`
--
ALTER TABLE `ohrm_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_datapoint_type`
--
ALTER TABLE `ohrm_datapoint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ohrm_data_group`
--
ALTER TABLE `ohrm_data_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  MODIFY `display_field_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ohrm_education`
--
ALTER TABLE `ohrm_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_email`
--
ALTER TABLE `ohrm_email`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_email_configuration`
--
ALTER TABLE `ohrm_email_configuration`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_email_notification`
--
ALTER TABLE `ohrm_email_notification`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  MODIFY `work_shift_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_employment_status`
--
ALTER TABLE `ohrm_employment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_reporting_method`
--
ALTER TABLE `ohrm_emp_reporting_method`
  MODIFY `reporting_method_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_termination_reason`
--
ALTER TABLE `ohrm_emp_termination_reason`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_category`
--
ALTER TABLE `ohrm_job_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_title`
--
ALTER TABLE `ohrm_job_title`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_kpi`
--
ALTER TABLE `ohrm_kpi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_language`
--
ALTER TABLE `ohrm_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement_type`
--
ALTER TABLE `ohrm_leave_entitlement_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_period_history`
--
ALTER TABLE `ohrm_leave_period_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_status`
--
ALTER TABLE `ohrm_leave_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_license`
--
ALTER TABLE `ohrm_license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_login`
--
ALTER TABLE `ohrm_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ohrm_membership`
--
ALTER TABLE `ohrm_membership`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `ohrm_module`
--
ALTER TABLE `ohrm_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ohrm_nationality`
--
ALTER TABLE `ohrm_nationality`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `ohrm_openid_provider`
--
ALTER TABLE `ohrm_openid_provider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_organization_gen_info`
--
ALTER TABLE `ohrm_organization_gen_info`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_pay_grade`
--
ALTER TABLE `ohrm_pay_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_plugin`
--
ALTER TABLE `ohrm_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_project`
--
ALTER TABLE `ohrm_project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  MODIFY `report_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_reviewer_group`
--
ALTER TABLE `ohrm_reviewer_group`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ohrm_skill`
--
ALTER TABLE `ohrm_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_subunit`
--
ALTER TABLE `ohrm_subunit`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ohrm_upgrade_history`
--
ALTER TABLE `ohrm_upgrade_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_user_role`
--
ALTER TABLE `ohrm_user_role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `ohrm_user_selection_rule`
--
ALTER TABLE `ohrm_user_selection_rule`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_workflow_state_machine`
--
ALTER TABLE `ohrm_workflow_state_machine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `ohrm_work_shift`
--
ALTER TABLE `ohrm_work_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_ws_consumer`
--
ALTER TABLE `ohrm_ws_consumer`
  MODIFY `app_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
  ADD CONSTRAINT `hs_hr_employee_ibfk_1` FOREIGN KEY (`work_station`) REFERENCES `ohrm_subunit` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_2` FOREIGN KEY (`nation_code`) REFERENCES `ohrm_nationality` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_3` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_4` FOREIGN KEY (`emp_status`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_5` FOREIGN KEY (`eeo_cat_code`) REFERENCES `ohrm_job_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_6` FOREIGN KEY (`termination_id`) REFERENCES `ohrm_emp_termination` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
  ADD CONSTRAINT `hs_hr_emp_attachment_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_1` FOREIGN KEY (`sal_grd_code`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_3` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_4` FOREIGN KEY (`payperiod_code`) REFERENCES `hs_hr_payperiod` (`payperiod_code`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
  ADD CONSTRAINT `hs_hr_emp_children_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
  ADD CONSTRAINT `hs_hr_emp_contract_extend_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
  ADD CONSTRAINT `hs_hr_emp_dependents_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  ADD CONSTRAINT `hs_hr_emp_directdebit_ibfk_1` FOREIGN KEY (`salary_id`) REFERENCES `hs_hr_emp_basicsalary` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
  ADD CONSTRAINT `hs_hr_emp_emergency_contacts_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
  ADD CONSTRAINT `hs_hr_emp_history_of_ealier_pos_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
  ADD CONSTRAINT `hs_hr_emp_language_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_language_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `ohrm_language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
  ADD CONSTRAINT `hs_hr_emp_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `ohrm_location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_locations_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
  ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_1` FOREIGN KEY (`membship_code`) REFERENCES `ohrm_membership` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
  ADD CONSTRAINT `hs_hr_emp_passport_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
  ADD CONSTRAINT `hs_hr_emp_picture_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_1` FOREIGN KEY (`erep_sup_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_2` FOREIGN KEY (`erep_sub_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_3` FOREIGN KEY (`erep_reporting_mode`) REFERENCES `ohrm_emp_reporting_method` (`reporting_method_id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
  ADD CONSTRAINT `hs_hr_emp_skill_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `ohrm_skill` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
  ADD CONSTRAINT `hs_hr_emp_us_tax_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
  ADD CONSTRAINT `hs_hr_emp_work_experience_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
  ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_1` FOREIGN KEY (`jobtit_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_2` FOREIGN KEY (`estat_code`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
  ADD CONSTRAINT `hs_hr_mailnotifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  ADD CONSTRAINT `ohrm_auth_provider_extra_details_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
  ADD CONSTRAINT `ohrm_available_group_field_ibfk_1` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`);

--
-- Constraints for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  ADD CONSTRAINT `ohrm_composite_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_composite_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  ADD CONSTRAINT `ohrm_datapoint_ibfk_1` FOREIGN KEY (`datapoint_type_id`) REFERENCES `ohrm_datapoint_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  ADD CONSTRAINT `ohrm_data_group_screen_ibfk_1` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_data_group_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  ADD CONSTRAINT `ohrm_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  ADD CONSTRAINT `ohrm_display_field_group_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  ADD CONSTRAINT `ohrm_email_processor_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  ADD CONSTRAINT `ohrm_email_subscriber_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `ohrm_email_notification` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  ADD CONSTRAINT `ohrm_email_template_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_1` FOREIGN KEY (`work_shift_id`) REFERENCES `ohrm_work_shift` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  ADD CONSTRAINT `ohrm_emp_education_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_emp_education_ibfk_2` FOREIGN KEY (`education_id`) REFERENCES `ohrm_education` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
  ADD CONSTRAINT `ohrm_emp_license_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_emp_license_ibfk_2` FOREIGN KEY (`license_id`) REFERENCES `ohrm_license` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  ADD CONSTRAINT `ohrm_emp_termination_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `ohrm_emp_termination_reason` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_emp_termination_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
  ADD CONSTRAINT `ohrm_filter_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  ADD CONSTRAINT `fk_ohrm_holiday_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  ADD CONSTRAINT `ohrm_home_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
  ADD CONSTRAINT `ohrm_job_candidate_ibfk_1` FOREIGN KEY (`added_person`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  ADD CONSTRAINT `ohrm_job_candidate_attachment_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_3` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_4` FOREIGN KEY (`performed_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
  ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  ADD CONSTRAINT `ohrm_job_interview_ibfk_1` FOREIGN KEY (`candidate_vacancy_id`) REFERENCES `ohrm_job_candidate_vacancy` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_interview_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  ADD CONSTRAINT `ohrm_job_interview_attachment_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
  ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_2` FOREIGN KEY (`interviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  ADD CONSTRAINT `ohrm_job_specification_attachment_ibfk_1` FOREIGN KEY (`job_title_id`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
  ADD CONSTRAINT `ohrm_job_vacancy_ibfk_1` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_vacancy_ibfk_2` FOREIGN KEY (`hiring_manager_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  ADD CONSTRAINT `ohrm_job_vacancy_attachment_ibfk_1` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  ADD CONSTRAINT `ohrm_leave_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_4` FOREIGN KEY (`adjustment_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_1` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_3` FOREIGN KEY (`entitlement_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_4` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_2` FOREIGN KEY (`adjustment_id`) REFERENCES `ohrm_leave_adjustment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_2` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  ADD CONSTRAINT `ohrm_leave_request_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  ADD CONSTRAINT `ohrm_leave_type_ibfk_1` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  ADD CONSTRAINT `ohrm_location_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  ADD CONSTRAINT `ohrm_menu_item_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  ADD CONSTRAINT `ohrm_module_default_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_module_default_page_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
  ADD CONSTRAINT `ohrm_user_identity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_user_identity_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  ADD CONSTRAINT `fk_ohrm_operational_country_hs_hr_country` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
  ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_2` FOREIGN KEY (`pay_grade_id`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  ADD CONSTRAINT `ohrm_performance_review_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
  ADD CONSTRAINT `ohrm_performance_track_fk1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_track_fk2` FOREIGN KEY (`added_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
  ADD CONSTRAINT `fk_ohrm_performance_tracker_log_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_log_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_log_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
  ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  ADD CONSTRAINT `ohrm_project_activity_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
  ADD CONSTRAINT `ohrm_project_admin_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_project_admin_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  ADD CONSTRAINT `ohrm_report_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  ADD CONSTRAINT `ohrm_reviewer_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
  ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `ohrm_reviewer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
  ADD CONSTRAINT `ohrm_screen_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_composite_display_field`
--
ALTER TABLE `ohrm_selected_composite_display_field`
  ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_2` FOREIGN KEY (`composite_display_field_id`) REFERENCES `ohrm_composite_display_field` (`composite_display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
  ADD CONSTRAINT `ohrm_selected_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_display_field_ibfk_2` FOREIGN KEY (`display_field_id`) REFERENCES `ohrm_display_field` (`display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
  ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_filter_field`
--
ALTER TABLE `ohrm_selected_filter_field`
  ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_2` FOREIGN KEY (`filter_field_id`) REFERENCES `ohrm_filter_field` (`filter_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_group_field`
--
ALTER TABLE `ohrm_selected_group_field`
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_2` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_3` FOREIGN KEY (`summary_display_field_id`) REFERENCES `ohrm_summary_display_field` (`summary_display_field_id`);

--
-- Constraints for table `ohrm_summary_display_field`
--
ALTER TABLE `ohrm_summary_display_field`
  ADD CONSTRAINT `ohrm_summary_display_field_ibfk_1` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_timesheet_action_log`
--
ALTER TABLE `ohrm_timesheet_action_log`
  ADD CONSTRAINT `ohrm_timesheet_action_log_ibfk_1` FOREIGN KEY (`performed_by`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
  ADD CONSTRAINT `ohrm_user_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`);

--
-- Constraints for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
  ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_2` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
  ADD CONSTRAINT `ohrm_user_role_screen_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_role_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
  ADD CONSTRAINT `fk_ohrm_work_week_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `leave_taken_status_change` ON SCHEDULE EVERY 1 HOUR STARTS '2017-02-27 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
                        UPDATE hs_hr_leave SET leave_status = 3 WHERE leave_status = 2 AND leave_date < DATE(NOW());
                      END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
