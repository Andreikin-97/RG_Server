-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 28 2024 г., 17:38
-- Версия сервера: 5.7.39-log
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `redwich`
--

-- --------------------------------------------------------

--
-- Структура таблицы `acc_admin`
--

CREATE TABLE `acc_admin` (
  `aID` int(11) NOT NULL,
  `aNumber` int(6) NOT NULL DEFAULT '0',
  `aName` varchar(24) NOT NULL,
  `aPassword` varchar(40) NOT NULL DEFAULT 'NoPass',
  `aLevel` int(3) NOT NULL DEFAULT '0',
  `aData` varchar(20) NOT NULL,
  `aPutName` varchar(24) NOT NULL DEFAULT 'Sustem',
  `aDataVhod` varchar(20) NOT NULL DEFAULT '0',
  `aPrefix` varchar(12) NOT NULL DEFAULT 'None',
  `aReputacion` int(5) NOT NULL DEFAULT '0',
  `aWarn` int(1) NOT NULL DEFAULT '0',
  `aSetting` varchar(32) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0',
  `aBlock` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `acc_admin`
--

INSERT INTO `acc_admin` (`aID`, `aNumber`, `aName`, `aPassword`, `aLevel`, `aData`, `aPutName`, `aDataVhod`, `aPrefix`, `aReputacion`, `aWarn`, `aSetting`, `aBlock`) VALUES
(1, 55493, 'Andrei_Morozov', '802cb311ce3ef4ac13525c77d8158106', 10, '2024-05-19 06:59:08', 'Andrei_Morozov', '2024-11-28 16:40:32', 'None', 0, 0, '1,1,1,1,1,1,1,1,1,0,0,0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `acc_ban`
--

CREATE TABLE `acc_ban` (
  `bName` varchar(24) CHARACTER SET utf8 NOT NULL,
  `bAdmin` varchar(24) CHARACTER SET utf8 NOT NULL,
  `bData` datetime NOT NULL,
  `bReason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `bDay` int(34) NOT NULL,
  `bUnBanData` datetime NOT NULL,
  `bStatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `acc_ban_ip`
--

CREATE TABLE `acc_ban_ip` (
  `biID` int(11) NOT NULL,
  `biName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None',
  `biAdmin` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biIP` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `biData` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acc_full_admin`
--

CREATE TABLE `acc_full_admin` (
  `faID` int(11) NOT NULL,
  `faName` varchar(24) NOT NULL,
  `faData` datetime NOT NULL,
  `faPutName` varchar(24) NOT NULL DEFAULT 'Sustem'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `acc_full_admin`
--

INSERT INTO `acc_full_admin` (`faID`, `faName`, `faData`, `faPutName`) VALUES
(1, 'Andrei_Morozov', '2024-05-19 06:59:03', 'Sustem');

-- --------------------------------------------------------

--
-- Структура таблицы `acc_med_card`
--

CREATE TABLE `acc_med_card` (
  `mcID` int(11) NOT NULL,
  `mcName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `mcDate` datetime NOT NULL,
  `mcStatus` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acc_pasport`
--

CREATE TABLE `acc_pasport` (
  `pasName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pasSeria` int(11) NOT NULL DEFAULT '0',
  `pasNumber` int(11) NOT NULL DEFAULT '0',
  `pasSex` int(1) NOT NULL DEFAULT '0',
  `pasData` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pasGorod` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None',
  `pasDataRojdenia` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `acc_pasport`
--

INSERT INTO `acc_pasport` (`pasName`, `pasSeria`, `pasNumber`, `pasSex`, `pasData`, `pasGorod`, `pasDataRojdenia`) VALUES
('Andrei_Morozov', 9506, 592003, 1, '23.05.2024', 'Москва', '25.02.1997');

-- --------------------------------------------------------

--
-- Структура таблицы `acc_player`
--

CREATE TABLE `acc_player` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Status` int(1) NOT NULL DEFAULT '0',
  `Sex` int(2) NOT NULL DEFAULT '0',
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `PosA` float NOT NULL DEFAULT '0',
  `Int` int(4) NOT NULL DEFAULT '0',
  `World` int(4) NOT NULL DEFAULT '0',
  `Spawn` int(2) NOT NULL DEFAULT '1',
  `Skin` int(4) NOT NULL DEFAULT '-1',
  `Age` int(3) NOT NULL DEFAULT '0',
  `Exp` int(5) NOT NULL DEFAULT '0',
  `Level` int(5) NOT NULL DEFAULT '1',
  `Satiety` float NOT NULL DEFAULT '100',
  `Job` int(2) NOT NULL DEFAULT '0',
  `GameTime` int(11) NOT NULL DEFAULT '0',
  `Money` int(11) NOT NULL DEFAULT '0',
  `Bank` int(11) NOT NULL DEFAULT '0',
  `Donat` bigint(11) NOT NULL DEFAULT '0',
  `Health` float NOT NULL DEFAULT '100',
  `Zakon` int(4) NOT NULL DEFAULT '0',
  `Wanted` int(5) NOT NULL DEFAULT '0',
  `Voenik` int(1) NOT NULL DEFAULT '0',
  `Lic` varchar(16) NOT NULL DEFAULT '0,0,0,0,0,0,0,0',
  `Poshlina` int(1) NOT NULL DEFAULT '0',
  `Pasport` int(1) NOT NULL DEFAULT '0',
  `MedCard` int(1) NOT NULL DEFAULT '0',
  `Phone` int(1) NOT NULL DEFAULT '0',
  `SimCard` int(6) NOT NULL DEFAULT '0',
  `PhoneMoney` int(11) NOT NULL DEFAULT '0',
  `Frac` int(2) NOT NULL DEFAULT '0',
  `FracLeader` int(2) NOT NULL DEFAULT '0',
  `FracSkin` int(5) NOT NULL DEFAULT '0',
  `FracRang` int(5) NOT NULL DEFAULT '0',
  `FracWarn` int(2) NOT NULL DEFAULT '0',
  `ShtrafPPS` int(11) NOT NULL DEFAULT '0',
  `ShtrafDPS` int(11) NOT NULL DEFAULT '0',
  `Vip` int(1) NOT NULL DEFAULT '0',
  `Mute` int(1) NOT NULL DEFAULT '0',
  `MuteTime` int(11) NOT NULL DEFAULT '0',
  `Jail` int(1) NOT NULL DEFAULT '0',
  `JailTime` int(11) NOT NULL DEFAULT '0',
  `Warn` int(1) DEFAULT '0',
  `Family` int(3) NOT NULL DEFAULT '0',
  `SkillGun` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,0,0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `acc_player`
--

INSERT INTO `acc_player` (`ID`, `Name`, `Status`, `Sex`, `PosX`, `PosY`, `PosZ`, `PosA`, `Int`, `World`, `Spawn`, `Skin`, `Age`, `Exp`, `Level`, `Satiety`, `Job`, `GameTime`, `Money`, `Bank`, `Donat`, `Health`, `Zakon`, `Wanted`, `Voenik`, `Lic`, `Poshlina`, `Pasport`, `MedCard`, `Phone`, `SimCard`, `PhoneMoney`, `Frac`, `FracLeader`, `FracSkin`, `FracRang`, `FracWarn`, `ShtrafPPS`, `ShtrafDPS`, `Vip`, `Mute`, `MuteTime`, `Jail`, `JailTime`, `Warn`, `Family`, `SkillGun`) VALUES
(1, 'Andrei_Morozov', 0, 1, 2641.67, -1912.14, 2328.15, 0, 1, 1, 4, 294, 27, 6, 100, 100, 0, 3294, 8000000, 15000, 155700000, 85, 100, 0, 1, '0,1,0,0,0,0,0,0', 0, 1, 0, 0, 0, 0, 5, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '10000,10000,100');

-- --------------------------------------------------------

--
-- Структура таблицы `acc_podarok`
--

CREATE TABLE `acc_podarok` (
  `spID` int(11) NOT NULL,
  `spName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `spCount` int(11) NOT NULL DEFAULT '0',
  `spStatus` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `acc_podarok`
--

INSERT INTO `acc_podarok` (`spID`, `spName`, `spCount`, `spStatus`) VALUES
(1, 'Andrei_Morozov', 13, '1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0');

-- --------------------------------------------------------

--
-- Структура таблицы `acc_quest`
--

CREATE TABLE `acc_quest` (
  `qID` int(11) NOT NULL,
  `qName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `qProgress` int(11) DEFAULT '0',
  `qAccept` int(111) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `acc_quest`
--

INSERT INTO `acc_quest` (`qID`, `qName`, `qProgress`, `qAccept`) VALUES
(1, 'Andrei_Morozov', 100, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `acc_server`
--

CREATE TABLE `acc_server` (
  `acID` int(11) NOT NULL,
  `acOnline` int(1) NOT NULL DEFAULT '0',
  `acLogin` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acPassword` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acServer` int(1) NOT NULL DEFAULT '0',
  `acEmail` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acCheckEmail` int(1) NOT NULL DEFAULT '0',
  `acReferal` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acRegIP` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `acRegData` datetime NOT NULL,
  `acLastIP` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `acLastData` datetime NOT NULL,
  `acExitData` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acPinCode` int(4) DEFAULT '0',
  `acStatusPin` int(1) NOT NULL DEFAULT '0',
  `acVkID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acStatusGoogle` int(1) NOT NULL,
  `acGoogleCode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acTimeGameServer` int(11) NOT NULL DEFAULT '0',
  `acDayGameServer` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `acc_server`
--

INSERT INTO `acc_server` (`acID`, `acOnline`, `acLogin`, `acPassword`, `acServer`, `acEmail`, `acCheckEmail`, `acReferal`, `acRegIP`, `acRegData`, `acLastIP`, `acLastData`, `acExitData`, `acPinCode`, `acStatusPin`, `acVkID`, `acStatusGoogle`, `acGoogleCode`, `acTimeGameServer`, `acDayGameServer`) VALUES
(1, 0, 'Andrei_Morozov', '802cb311ce3ef4ac13525c77d8158106', 1, 'TEST@MAIL.RU', 1, 'No Referal', '127.0.0.1', '2024-05-19 06:58:37', '127.0', '2024-11-28 16:40:24', '2024-10-25 10:18:22', 2109, 0, 'NULL', 0, 'NULL', 17456, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `freekassa_payments`
--

CREATE TABLE `freekassa_payments` (
  `id` int(10) NOT NULL,
  `freekassaId` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `sum` float NOT NULL,
  `itemsCount` int(11) NOT NULL DEFAULT '1',
  `dateCreate` datetime NOT NULL,
  `dateComplete` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `list_history`
--

CREATE TABLE `list_history` (
  `lhID` int(11) NOT NULL,
  `lhName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `lhData` datetime NOT NULL,
  `lhText` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `list_history`
--

INSERT INTO `list_history` (`lhID`, `lhName`, `lhData`, `lhText`) VALUES
(1, 'Andrei_Morozov', '2024-05-26 23:57:44', 'Основатель [# 55493] разблокировал-(а) Вам чат. Причина: 0'),
(2, 'Andrei_Morozov', '2024-05-27 00:09:10', 'Основатель [# 55493] заблокировал-(а) Вам чат на 01 с.. Причина: Test'),
(3, 'Andrei_Morozov', '2024-05-27 00:09:57', 'Основатель [# 55493] разблокировал-(а) Вам чат. Причина: 1'),
(4, 'Andrei_Morozov', '2024-06-25 21:29:47', 'Администратор Andrei_Morozov определил(-а) Вас в Деморган на 05 м. 00 с.. Причина: Test'),
(5, 'Andrei_Morozov', '2024-06-25 21:36:46', 'Администратор Andrei_Morozov определил(-а) Вас в Деморган на 10 м. 00 с.. Причина: 1'),
(6, 'Andrei_Morozov', '2024-06-25 21:53:59', 'Администратор Andrei_Morozov определил(-а) Вас в Деморган на 02 м. 00 с.. Причина: 1'),
(7, 'Andrei_Morozov', '2024-06-25 22:10:32', 'Администратор Andrei_Morozov определил(-а) Вас в Деморган на 01 м. 00 с.. Причина: 1 '),
(8, 'Andrei_Morozov', '2024-06-25 22:40:34', 'Администратор Andrei_Morozov определил(-а) Вас в Деморган на 01 м. 00 с.. Причина: 0'),
(9, 'Andrei_Morozov', '2024-06-25 22:53:39', 'Администратор Andrei_Morozov определил(-а) Вас в Деморган на 01 м. 00 с.. Причина: 1'),
(10, 'Andrei_Morozov', '2024-06-26 09:29:28', 'Администратор Andrei_Morozov определил(-а) Вас в Деморган на 10 м. 00 с.. Причина: Test');

-- --------------------------------------------------------

--
-- Структура таблицы `server_admin_log`
--

CREATE TABLE `server_admin_log` (
  `id` int(11) NOT NULL,
  `text` varchar(256) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `server_atm`
--

CREATE TABLE `server_atm` (
  `aID` int(11) NOT NULL,
  `aPrice` int(11) NOT NULL DEFAULT '25000000',
  `aOwner` varchar(24) NOT NULL DEFAULT 'The Stats',
  `aBank` int(11) NOT NULL DEFAULT '0',
  `aMoney` int(11) NOT NULL DEFAULT '0',
  `aStatus` int(1) DEFAULT '0',
  `aPosX` float NOT NULL DEFAULT '0',
  `aPosY` float NOT NULL DEFAULT '0',
  `aPosZ` float NOT NULL DEFAULT '0',
  `aPosA` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `server_atm`
--

INSERT INTO `server_atm` (`aID`, `aPrice`, `aOwner`, `aBank`, `aMoney`, `aStatus`, `aPosX`, `aPosY`, `aPosZ`, `aPosA`) VALUES
(1, 25000000, 'The Stats', 0, 501767403, 0, 780.7, -323.1, 1002.7, -90);

-- --------------------------------------------------------

--
-- Структура таблицы `server_bank`
--

CREATE TABLE `server_bank` (
  `bID` int(11) NOT NULL,
  `bNumber` int(7) NOT NULL DEFAULT '0',
  `bOwner` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bPassword` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000',
  `bMoney` int(11) NOT NULL DEFAULT '0',
  `bStatus` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `server_bank_card`
--

CREATE TABLE `server_bank_card` (
  `bpcID` int(11) NOT NULL,
  `bpcOwner` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `bpcNumber` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bpcData` datetime DEFAULT NULL,
  `bpcCode` int(3) DEFAULT NULL,
  `bpcPinCod` int(4) DEFAULT NULL,
  `bpcMoney` int(11) DEFAULT NULL,
  `bpcStatus` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_bank_card`
--

INSERT INTO `server_bank_card` (`bpcID`, `bpcOwner`, `bpcNumber`, `bpcData`, `bpcCode`, `bpcPinCod`, `bpcMoney`, `bpcStatus`) VALUES
(1, 'Andrei_Morozov', '2124 1923 1457 1920', '0000-00-00 00:00:00', 539, 1087, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `server_bilbord`
--

CREATE TABLE `server_bilbord` (
  `bID` int(11) NOT NULL,
  `bType` int(1) NOT NULL DEFAULT '0',
  `bPrice` int(11) NOT NULL DEFAULT '350000',
  `bOwner` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `bFon` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bText` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bPosX` float NOT NULL DEFAULT '0',
  `bPosY` float NOT NULL DEFAULT '0',
  `bPosZ` float NOT NULL DEFAULT '0',
  `bPosA` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_bilbord`
--

INSERT INTO `server_bilbord` (`bID`, `bType`, `bPrice`, `bOwner`, `bFon`, `bText`, `bPosX`, `bPosY`, `bPosZ`, `bPosA`) VALUES
(1, 0, 350000, 'The Stats', NULL, NULL, 781.1, -321.4, 1006.2, -179.8);

-- --------------------------------------------------------

--
-- Структура таблицы `server_cars`
--

CREATE TABLE `server_cars` (
  `cID` int(11) NOT NULL,
  `cOwner` varchar(24) NOT NULL DEFAULT 'The Stats',
  `cModel` int(11) NOT NULL,
  `cColor1` int(3) NOT NULL DEFAULT '1',
  `cColor2` int(3) NOT NULL DEFAULT '1',
  `cPaintJob` int(3) NOT NULL DEFAULT '-1',
  `cTypePrice` int(1) NOT NULL DEFAULT '0',
  `cPrice` int(11) NOT NULL DEFAULT '0',
  `cPosX` float NOT NULL DEFAULT '0',
  `cPosY` float NOT NULL DEFAULT '0',
  `cPosZ` float NOT NULL DEFAULT '0',
  `cPosA` float NOT NULL DEFAULT '0',
  `cInt` int(3) NOT NULL DEFAULT '0',
  `cWorld` int(3) NOT NULL DEFAULT '0',
  `cHealth` float DEFAULT '1000',
  `cKey` int(1) NOT NULL DEFAULT '0',
  `cLimit` int(4) NOT NULL DEFAULT '0',
  `cDoors` int(1) NOT NULL DEFAULT '0',
  `cFuelType` int(1) NOT NULL DEFAULT '0',
  `cFuel` float NOT NULL DEFAULT '0',
  `cMilage` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `server_cars_number`
--

CREATE TABLE `server_cars_number` (
  `Model_ID` int(11) NOT NULL,
  `x_p` float NOT NULL,
  `y_p` float NOT NULL,
  `z_p` float NOT NULL,
  `xr_p` float NOT NULL,
  `yr_p` float NOT NULL,
  `zr_p` float NOT NULL,
  `x_z` float NOT NULL,
  `y_z` float NOT NULL,
  `z_z` float NOT NULL,
  `xr_z` float NOT NULL,
  `yr_z` float NOT NULL,
  `zr_z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `server_debug`
--

CREATE TABLE `server_debug` (
  `dID` int(8) NOT NULL,
  `dName` varchar(24) NOT NULL DEFAULT 'The Stats',
  `dData` datetime NOT NULL,
  `dText` varchar(256) NOT NULL DEFAULT 'None',
  `dStatus` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `server_ekonomika`
--

CREATE TABLE `server_ekonomika` (
  `eiID` int(11) NOT NULL,
  `eiNalogFrac` int(11) NOT NULL DEFAULT '1' COMMENT 'Чья организация соберает налоги',
  `eiScahtaPay` int(11) NOT NULL DEFAULT '5' COMMENT 'Зарплата на Шахте',
  `eiDriveMineralsPay` int(11) NOT NULL DEFAULT '15',
  `eiDrovosekPay` int(11) NOT NULL DEFAULT '35' COMMENT 'Зарплата на Лесоповале',
  `eiGruzPay` int(11) NOT NULL DEFAULT '3' COMMENT 'Зарплата на работе Грузчик\r\n',
  `eiRadarPay` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `server_ekonomika`
--

INSERT INTO `server_ekonomika` (`eiID`, `eiNalogFrac`, `eiScahtaPay`, `eiDriveMineralsPay`, `eiDrovosekPay`, `eiGruzPay`, `eiRadarPay`) VALUES
(1, 1, 5, 15, 35, 3, 500);

-- --------------------------------------------------------

--
-- Структура таблицы `server_family`
--

CREATE TABLE `server_family` (
  `famID` int(11) NOT NULL,
  `famName` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None',
  `famCreator` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `famZam` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `famData` datetime NOT NULL,
  `famHouse` int(1) NOT NULL DEFAULT '0',
  `famBank` int(11) NOT NULL DEFAULT '0',
  `famInt` int(3) NOT NULL DEFAULT '0',
  `famWorld` int(3) NOT NULL DEFAULT '0',
  `famSpawnX` float NOT NULL DEFAULT '0',
  `famSpawnY` float DEFAULT '0',
  `famSpawnZ` float NOT NULL DEFAULT '0',
  `famSpawnA` int(11) NOT NULL DEFAULT '0',
  `famMembers` int(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `server_fraction`
--

CREATE TABLE `server_fraction` (
  `fID` int(11) NOT NULL,
  `fName` varchar(32) NOT NULL DEFAULT 'None' COMMENT 'Название',
  `fLeader` varchar(24) NOT NULL DEFAULT 'The Stats' COMMENT 'Лидер',
  `fBank` int(11) NOT NULL DEFAULT '10000000' COMMENT 'Банк',
  `fMembers` int(11) NOT NULL DEFAULT '0' COMMENT 'Кол-во сотрудников',
  `fPosEnterX` float NOT NULL DEFAULT '0' COMMENT 'Место входа',
  `fPosEnterY` float NOT NULL DEFAULT '0',
  `fPosEnterZ` float NOT NULL DEFAULT '0',
  `fPosEnterA` float NOT NULL DEFAULT '0',
  `fPosExitX` float NOT NULL DEFAULT '0' COMMENT 'Место выхода',
  `fPosExitY` float NOT NULL DEFAULT '0',
  `fPosExitZ` float NOT NULL DEFAULT '0',
  `fPosExitA` float NOT NULL DEFAULT '0',
  `fPosSpawnX` float NOT NULL DEFAULT '0' COMMENT 'Место появления',
  `fPosSpawnY` float NOT NULL DEFAULT '0',
  `fPosSpawnZ` float DEFAULT '0',
  `fPosSpawnA` float NOT NULL DEFAULT '0',
  `fPosSkinX` float NOT NULL DEFAULT '0' COMMENT 'Место раздевалки',
  `fPosSkinY` float NOT NULL DEFAULT '0',
  `fPosSkinZ` float NOT NULL DEFAULT '0',
  `fPosInfoX` float NOT NULL DEFAULT '0' COMMENT 'Место информации',
  `fPosInfoY` float NOT NULL DEFAULT '0',
  `fPosInfoZ` float NOT NULL DEFAULT '0',
  `fPosGunX` float NOT NULL DEFAULT '0' COMMENT 'Место склада',
  `fPosGunY` float DEFAULT '0',
  `fPosGunZ` float NOT NULL DEFAULT '0',
  `fPosLoadGunX` float NOT NULL DEFAULT '0' COMMENT 'Место загрузки склада',
  `fPosLoadGunY` float NOT NULL DEFAULT '0',
  `fPosLoadGunZ` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `server_fraction`
--

INSERT INTO `server_fraction` (`fID`, `fName`, `fLeader`, `fBank`, `fMembers`, `fPosEnterX`, `fPosEnterY`, `fPosEnterZ`, `fPosEnterA`, `fPosExitX`, `fPosExitY`, `fPosExitZ`, `fPosExitA`, `fPosSpawnX`, `fPosSpawnY`, `fPosSpawnZ`, `fPosSpawnA`, `fPosSkinX`, `fPosSkinY`, `fPosSkinZ`, `fPosInfoX`, `fPosInfoY`, `fPosInfoZ`, `fPosGunX`, `fPosGunY`, `fPosGunZ`, `fPosLoadGunX`, `fPosLoadGunY`, `fPosLoadGunZ`) VALUES
(1, 'Администрация области', 'The Stats', 62737000, 0, 1317.69, 1189.84, 1701.5, 184.21, 1907.3, -2229.16, 12.18, 180, 1305.35, 1187.96, 1701.5, 179.471, 1303.38, 1186.48, 1701.5, 1322.44, 1177.71, 1701.5, 1320.46, 1171.29, 1701.5, 0, 0, 0),
(2, 'Полиция (отдел ППС)', 'The Stats', 9550000, 1, 2589.99, -2417.11, 1501.99, 90, 2576.16, -2416.01, 22.49, -90, 2551.81, -2429.37, 1502, 269.669, 2557.21, -2432.93, 1502, 2574.53, -2417.91, 1502, 2553.32, -2439.44, 1502, 2560.41, -2410.39, 21.9968),
(3, 'Полиция (отдел ДПС)', 'The Stats', 9713000, 1, 960.79, 2102.03, 1122.45, 180, 137.366, 1237.58, 12.5469, 443.111, 953.736, 2085.1, 1122.46, 356.536, 954.869, 2088.15, 1122.46, 957.161, 2094.28, 1122.46, 952.331, 2088.97, 1122.46, 210.574, 1230.03, 11.7576),
(4, 'ФСБ', 'The Stats', 9890000, 0, 2096, -2148.65, 1001.99, 180, 816.025, 2433.1, 12.21, 393.138, 2090.5, -2201.66, 1002, 1.52598, 2090.9, -2199.93, 1002, 2092.2, -2160.43, 1002, 2082.07, -2200.42, 1002, 0, 0, 0),
(5, 'ВЧ', 'The Stats', 9970000, 0, 652.07, 1407.28, 1114.71, 180, 1735.33, 1785.85, 15.7528, 189.579, 648.021, 1391.77, 1114.74, 359.249, 652.857, 1401.79, 1114.72, 0, 0, 0, 632.716, 1406.74, 1114.72, 1694.03, 1668.3, 15.2794),
(6, 'Областная больница', 'The Stats', 9935000, 0, 2135.67, -2396.17, -44.86, 180, 2120.39, -2411.3, 22.4937, 357.606, 2115.58, -2420.92, -40.1, 180.499, 2113.36, -2426.39, -40.1, 2139.81, -2400.97, -44.86, 2118.36, -2424.7, -40.1, 0, 0, 0),
(7, 'ТРК Связь', 'The Stats', 10000000, 0, 1937.04, 2922.29, 1672.92, -90, 2412.28, -1841.67, 22.9476, 537.693, 1954.92, 2913.2, 1672.93, 356.504, 1958.62, 2918.09, 1672.93, 1941.36, 2920.25, 1672.93, 1939.46, 2908.55, 1672.93, 0, 0, 0),
(8, 'ОПГ Барыги', 'The Stats', 10000000, 0, 2097.02, -1645.47, 2056.63, 0, 1970.13, -2603.84, 11.48, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'ОПГ Южная', 'The Stats', 10000000, 0, 2097.02, -1645.47, 2056.63, 0, 2124.29, -1795.92, 19.9, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'Чеченская мафия', 'The Stats', 10000000, 0, -1887.62, 1412, 538.5, 0, 2344.68, -2607.02, 21.79, -90, -1894.37, 1433.5, 538.51, 181.273, -1893.48, 1434.5, 538.51, 0, 0, 0, -1883, 1425.98, 538.51, 0, 0, 0),
(11, 'Русская мафия', 'The Stats', 10000000, 0, 508.47, -10.91, 1904.94, 90, 376.61, 1113.03, 12.6, -2.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `server_fraction_cars`
--

CREATE TABLE `server_fraction_cars` (
  `fcID` int(11) NOT NULL,
  `fcFrac` int(11) NOT NULL DEFAULT '0',
  `fcRang` int(11) NOT NULL DEFAULT '1',
  `fcModel` int(11) NOT NULL DEFAULT '0',
  `fcInt` int(3) NOT NULL DEFAULT '0',
  `fcWorld` int(3) NOT NULL DEFAULT '0',
  `fcPrice` int(11) NOT NULL DEFAULT '1000000',
  `fcPosX` float NOT NULL DEFAULT '0',
  `fcPosY` float NOT NULL DEFAULT '0',
  `fcPosZ` float NOT NULL DEFAULT '0',
  `fcPosA` float NOT NULL DEFAULT '0',
  `fcLock` int(2) NOT NULL DEFAULT '1',
  `fcFuel` float NOT NULL DEFAULT '0',
  `fcHealth` float NOT NULL DEFAULT '1000',
  `fcColor1` int(11) NOT NULL DEFAULT '1',
  `fcColor2` int(11) NOT NULL DEFAULT '1',
  `fcPaintJob` int(11) NOT NULL DEFAULT '-1',
  `fcSirena` int(1) NOT NULL DEFAULT '0',
  `fcStatus` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `server_house`
--

CREATE TABLE `server_house` (
  `hID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `server_job_level`
--

CREATE TABLE `server_job_level` (
  `jID` int(11) NOT NULL,
  `jName` varchar(24) NOT NULL DEFAULT 'The Stats',
  `jExp` varchar(512) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0',
  `jLevel` varchar(124) NOT NULL DEFAULT '1,1,1,1,1,1,1,1,1,1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `server_job_level`
--

INSERT INTO `server_job_level` (`jID`, `jName`, `jExp`, `jLevel`) VALUES
(1, 'Andrei_Morozov', '0,0,0,0,0,0,0,0,0,0', '1,1,1,1,1,1,1,1,1,1');

-- --------------------------------------------------------

--
-- Структура таблицы `server_logs`
--

CREATE TABLE `server_logs` (
  `alType` int(4) NOT NULL DEFAULT '0',
  `alData` datetime DEFAULT NULL,
  `alText` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_logs`
--

INSERT INTO `server_logs` (`alType`, `alData`, `alText`) VALUES
(1, '2024-06-25 18:58:00', '[10] Основатель | Andrei_Morozov: wdaawdawd');

-- --------------------------------------------------------

--
-- Структура таблицы `server_logs_names`
--

CREATE TABLE `server_logs_names` (
  `lnID` int(11) NOT NULL,
  `lnData` datetime NOT NULL,
  `lnOldName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lnNewName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `server_musorki`
--

CREATE TABLE `server_musorki` (
  `mID` int(11) NOT NULL,
  `mPosX` float NOT NULL DEFAULT '0',
  `mPosY` float NOT NULL DEFAULT '0',
  `mPosZ` float NOT NULL DEFAULT '0',
  `mPosA` float NOT NULL DEFAULT '0',
  `mType` int(11) NOT NULL DEFAULT '1',
  `mStatus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_musorki`
--

INSERT INTO `server_musorki` (`mID`, `mPosX`, `mPosY`, `mPosZ`, `mPosA`, `mType`, `mStatus`) VALUES
(1, 1747.8, 1322.3, 9.7, 89.8, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `server_online`
--

CREATE TABLE `server_online` (
  `IDs` int(11) NOT NULL,
  `oName` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oDay_1` int(11) NOT NULL DEFAULT '0',
  `oDay_2` int(11) NOT NULL DEFAULT '0',
  `oDay_3` int(11) NOT NULL DEFAULT '0',
  `oDay_4` int(11) NOT NULL DEFAULT '0',
  `oDay_5` int(11) NOT NULL DEFAULT '0',
  `oDay_6` int(11) DEFAULT '0',
  `oDay_7` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_online`
--

INSERT INTO `server_online` (`IDs`, `oName`, `oDay_1`, `oDay_2`, `oDay_3`, `oDay_4`, `oDay_5`, `oDay_6`, `oDay_7`) VALUES
(1, 'Andrei_Morozov', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `server_parking`
--

CREATE TABLE `server_parking` (
  `ParkID` int(11) NOT NULL,
  `ParkOwner` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `ParkBank` int(11) NOT NULL DEFAULT '0',
  `ParkCash` int(11) NOT NULL DEFAULT '0',
  `ParkDay` int(2) NOT NULL DEFAULT '0',
  `ParkCars` int(11) NOT NULL DEFAULT '0',
  `ParkDoor` int(1) NOT NULL DEFAULT '1',
  `ParkPayEnter` int(11) NOT NULL DEFAULT '0',
  `ParkInfoX` float NOT NULL DEFAULT '0',
  `ParkInfoY` float NOT NULL DEFAULT '0',
  `ParkInfoZ` float NOT NULL DEFAULT '0',
  `ParkEnterX` float NOT NULL DEFAULT '0',
  `ParkEnterY` float NOT NULL DEFAULT '0',
  `ParkEnterZ` float NOT NULL DEFAULT '0',
  `ParkEnterA` float NOT NULL DEFAULT '0',
  `ParkExitX` float NOT NULL DEFAULT '-132.746',
  `ParkExitY` float NOT NULL DEFAULT '468.738',
  `ParkExitZ` float NOT NULL DEFAULT '2001',
  `ParkExitA` float NOT NULL DEFAULT '90',
  `ParkCarEnterX` float NOT NULL DEFAULT '0',
  `ParkCarEnterY` float NOT NULL DEFAULT '0',
  `ParkCarEnterZ` float NOT NULL DEFAULT '0',
  `ParkCarEnterA` float NOT NULL DEFAULT '0',
  `ParkCarExitX` float NOT NULL DEFAULT '-135.913',
  `ParkCarExitY` float NOT NULL DEFAULT '475.05',
  `ParkCarExitZ` float NOT NULL DEFAULT '2001.26',
  `ParkCarExitA` float NOT NULL DEFAULT '90'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `server_podarki`
--

CREATE TABLE `server_podarki` (
  `podID` int(11) NOT NULL,
  `podPic` int(11) NOT NULL DEFAULT '19054',
  `podStatus` int(11) NOT NULL DEFAULT '0',
  `podPosX` float NOT NULL DEFAULT '0',
  `podPosY` float NOT NULL DEFAULT '0',
  `podPosZ` float NOT NULL DEFAULT '0',
  `podWorld` int(11) NOT NULL DEFAULT '0',
  `podInt` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `server_promo`
--

CREATE TABLE `server_promo` (
  `prID` int(11) NOT NULL COMMENT 'ID',
  `prName` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None' COMMENT 'Название',
  `prActive` int(3) NOT NULL DEFAULT '0' COMMENT 'Кол-во активаций',
  `prLevelDown` int(3) NOT NULL DEFAULT '1' COMMENT 'Минимальный уровень',
  `prLevelMax` int(3) NOT NULL DEFAULT '0' COMMENT 'Мксимальный уровень',
  `prCreateAdmin` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats' COMMENT 'Кто создал',
  `prCreateData` datetime NOT NULL COMMENT 'Дата создания',
  `prPrizExp` int(3) NOT NULL DEFAULT '0' COMMENT 'Приз - Игрововй опыт',
  `prPrizLevel` int(3) NOT NULL DEFAULT '0' COMMENT 'Приз - Игровой уровень',
  `prPrizMoney` int(11) DEFAULT '0' COMMENT 'Приз - Витры',
  `prPrizDonat` int(11) NOT NULL DEFAULT '0' COMMENT 'Приз - Донат',
  `prPrizVip` int(3) NOT NULL DEFAULT '0' COMMENT 'Приз - VIP статус',
  `prPrizCar` int(3) NOT NULL DEFAULT '0' COMMENT 'Приз - Машина',
  `prPrizHouse` int(3) NOT NULL DEFAULT '0' COMMENT 'Приз - Дом',
  `prStatus` int(1) NOT NULL DEFAULT '0' COMMENT 'Статус'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `server_radar`
--

CREATE TABLE `server_radar` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(24) NOT NULL,
  `r_type` int(11) NOT NULL,
  `r_speed` int(11) NOT NULL,
  `r_x` float NOT NULL,
  `r_y` float NOT NULL,
  `r_z` float NOT NULL,
  `r_a` float NOT NULL,
  `r_money` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `server_seatdowns`
--

CREATE TABLE `server_seatdowns` (
  `SeatID` int(11) NOT NULL,
  `SeatX` float NOT NULL,
  `SeatY` float NOT NULL,
  `SeatZ` float NOT NULL,
  `SeatA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_seatdowns`
--

INSERT INTO `server_seatdowns` (`SeatID`, `SeatX`, `SeatY`, `SeatZ`, `SeatA`) VALUES
(1, -1767.19, -2864.31, 1031.47, 358.329),
(2, 1895.75, 1702.11, 35.1381, 42.6079),
(3, 1895.61, 1697.51, 35.1381, 133.266),
(4, 1897.89, 1696.53, 35.1381, 180.162),
(5, 1908.45, 1711.97, 16.7394, 1.49331),
(6, 1905.43, 1711.76, 16.7394, 90.8987),
(7, 2643.29, -1911.94, 2328.15, 91.5667);

-- --------------------------------------------------------

--
-- Структура таблицы `server_setting`
--

CREATE TABLE `server_setting` (
  `sName` varchar(32) NOT NULL DEFAULT 'Redwich RP',
  `sNumber` int(11) NOT NULL,
  `sNameServer` varchar(12) NOT NULL DEFAULT 'None',
  `sObnova` varchar(24) NOT NULL DEFAULT 'None',
  `sVersion` varchar(12) NOT NULL DEFAULT 'v 0.0.1',
  `sWeb` varchar(24) NOT NULL DEFAULT 'redwich-rp.com',
  `sDonate` varchar(24) NOT NULL DEFAULT 'None',
  `sForum` varchar(24) NOT NULL DEFAULT 'forum.redwich-rp.com',
  `sGroup` varchar(24) NOT NULL DEFAULT 'None',
  `sMapName` varchar(24) NOT NULL DEFAULT 'Criminal Russia',
  `sLanguage` varchar(24) NOT NULL DEFAULT 'Russian',
  `sPassword` varchar(32) NOT NULL DEFAULT 'None',
  `sRconPass` varchar(32) NOT NULL DEFAULT 'Redwich2545864',
  `sBonusMoney` int(11) NOT NULL DEFAULT '0',
  `sBonusLevel` int(11) NOT NULL DEFAULT '0',
  `sBonusDonat` int(11) NOT NULL DEFAULT '0',
  `sAdminPay` int(11) NOT NULL DEFAULT '20000',
  `sBankAdmin` int(11) NOT NULL DEFAULT '50000000' COMMENT 'Общий банк администрации',
  `sX_Server` int(11) NOT NULL DEFAULT '1',
  `sX_Exp` int(11) NOT NULL DEFAULT '1',
  `sX_JobPay` int(11) NOT NULL DEFAULT '1',
  `sX_PayDay` int(11) NOT NULL DEFAULT '1',
  `sX_Donat` int(11) NOT NULL DEFAULT '1',
  `sEvent` int(1) NOT NULL DEFAULT '0' COMMENT 'Праздничный Ивент',
  `sStatusVagon` int(1) NOT NULL DEFAULT '0' COMMENT '\r\n',
  `sMineralVagon` int(11) NOT NULL DEFAULT '0',
  `sMinerals` int(11) NOT NULL DEFAULT '0',
  `sSkladDerevo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `server_setting`
--

INSERT INTO `server_setting` (`sName`, `sNumber`, `sNameServer`, `sObnova`, `sVersion`, `sWeb`, `sDonate`, `sForum`, `sGroup`, `sMapName`, `sLanguage`, `sPassword`, `sRconPass`, `sBonusMoney`, `sBonusLevel`, `sBonusDonat`, `sAdminPay`, `sBankAdmin`, `sX_Server`, `sX_Exp`, `sX_JobPay`, `sX_PayDay`, `sX_Donat`, `sEvent`, `sStatusVagon`, `sMineralVagon`, `sMinerals`, `sSkladDerevo`) VALUES
('Redwich Games', 1, 'Orange', 'None', 'v 2.9.9', 'redwich-rp.ru', 'redwich-rp.ru/donate', 'forum.redwich-rp.ru', 'vk.com/redwich_rp', 'Criminal Russia', 'Russian', 'None', 'Redwich2545864', 25000, 10, 500, 5000, 50000000, 1, 1, 1, 1, 1, 0, 0, 437, 10000000, 25000000);

-- --------------------------------------------------------

--
-- Структура таблицы `server_taxopark`
--

CREATE TABLE `server_taxopark` (
  `tiID` int(11) NOT NULL,
  `tiOwner` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `tiName` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiType` int(2) NOT NULL DEFAULT '0',
  `tiPrice` int(11) NOT NULL DEFAULT '15000000',
  `tiNalogs` int(11) NOT NULL DEFAULT '0',
  `tiBank` int(11) NOT NULL DEFAULT '0',
  `tiPosX` float NOT NULL DEFAULT '-393.305',
  `tiPosY` float NOT NULL DEFAULT '1015.53',
  `tiPosZ` float NOT NULL DEFAULT '12.7439',
  `tiPosA` float NOT NULL DEFAULT '-90',
  `tiInfoX` float NOT NULL,
  `tiInfoY` float NOT NULL,
  `tiInfoZ` float NOT NULL,
  `tiMenuX` float NOT NULL,
  `tiMenuY` float NOT NULL,
  `tiMenuZ` float NOT NULL,
  `tiMembers` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_taxopark`
--

INSERT INTO `server_taxopark` (`tiID`, `tiOwner`, `tiName`, `tiType`, `tiPrice`, `tiNalogs`, `tiBank`, `tiPosX`, `tiPosY`, `tiPosZ`, `tiPosA`, `tiInfoX`, `tiInfoY`, `tiInfoZ`, `tiMenuX`, `tiMenuY`, `tiMenuZ`, `tiMembers`) VALUES
(1, 'The Stats', 'Таксопарк', 0, 15000000, 0, 0, -393.305, 1015.53, 12.7439, -90, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `server_taxopark_cars`
--

CREATE TABLE `server_taxopark_cars` (
  `tcID` int(11) NOT NULL,
  `tcKlass` int(2) NOT NULL DEFAULT '1',
  `tcModel` int(11) DEFAULT NULL,
  `tcColor1` int(11) NOT NULL,
  `tcColor2` int(11) NOT NULL,
  `tcPosX` float NOT NULL DEFAULT '0',
  `tcPosY` float NOT NULL DEFAULT '0',
  `tcPosZ` float NOT NULL DEFAULT '0',
  `tcPosA` float NOT NULL DEFAULT '0',
  `tcInt` int(11) NOT NULL DEFAULT '0',
  `tcWorld` int(11) NOT NULL DEFAULT '0',
  `tcLock` int(11) NOT NULL DEFAULT '0',
  `tcHealth` float NOT NULL DEFAULT '1000',
  `tcFuel` float NOT NULL DEFAULT '100',
  `tcMilige` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_taxopark_cars`
--

INSERT INTO `server_taxopark_cars` (`tcID`, `tcKlass`, `tcModel`, `tcColor1`, `tcColor2`, `tcPosX`, `tcPosY`, `tcPosZ`, `tcPosA`, `tcInt`, `tcWorld`, `tcLock`, `tcHealth`, `tcFuel`, `tcMilige`) VALUES
(1, 1, 420, 6, 6, -474.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(2, 1, 420, 6, 6, -470.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(3, 1, 420, 6, 6, -466.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(4, 1, 420, 6, 6, -462.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(5, 1, 420, 6, 6, -458.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(6, 1, 420, 6, 6, -454.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(7, 1, 420, 6, 6, -450.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(8, 1, 420, 6, 6, -446.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(9, 1, 420, 6, 6, -442.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(10, 1, 420, 6, 6, -438.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(11, 1, 420, 6, 6, -434.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(12, 1, 420, 6, 6, -430.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(13, 1, 420, 6, 6, -418.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(14, 1, 420, 6, 6, -414.571, 1028.53, 11.8583, 180, 0, 0, 0, 1000, 100, 0),
(15, 2, 438, 6, 6, -474.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000, 100, 0),
(16, 2, 438, 6, 6, -470.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000, 100, 0),
(17, 2, 438, 6, 6, -466.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(18, 2, 438, 6, 6, -462.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(19, 2, 438, 6, 6, -458.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(20, 2, 438, 6, 6, -442.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(21, 2, 438, 6, 6, -438.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(22, 2, 438, 6, 6, -434.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(23, 2, 438, 6, 6, -430.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(24, 2, 438, 6, 6, -426.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(25, 2, 438, 6, 6, -422.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000000, 100, 0),
(26, 2, 438, 6, 6, -418.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000, 100, 0),
(27, 2, 438, 6, 6, -414.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000, 100, 0),
(28, 2, 438, 6, 6, -454.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000, 100, 0),
(29, 2, 438, 6, 6, -450.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000, 100, 0),
(30, 2, 438, 6, 6, -446.571, 1008.03, 11.8583, 0, 0, 0, 0, 1000, 100, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `server_tickets`
--

CREATE TABLE `server_tickets` (
  `tNumber` int(11) NOT NULL,
  `tName` varchar(24) NOT NULL,
  `tReason` varchar(256) NOT NULL,
  `tPrice` int(11) NOT NULL,
  `tData` datetime NOT NULL,
  `tPutName` varchar(50) NOT NULL,
  `tID` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `server_tk`
--

CREATE TABLE `server_tk` (
  `Name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The Stats',
  `Frac` int(2) NOT NULL DEFAULT '0',
  `Data` datetime NOT NULL,
  `Info` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `server_tk`
--

INSERT INTO `server_tk` (`Name`, `Frac`, `Data`, `Info`) VALUES
('Andrei_Morozov', 6, '2024-05-19 12:36:58', 'Принят на должность - Санитар'),
('Andrei_Morozov', 6, '2024-05-19 12:37:54', 'Уволен с должности Санитар. Причина: Собственное желание'),
('Andrei_Morozov', 3, '2024-05-29 22:30:20', 'Принят на должность - Рядовой'),
('Andrei_Morozov', 3, '2024-06-25 18:58:11', 'Уволен с должности Рядовой. Причина: Собственное желание'),
('Andrei_Morozov', 2, '2024-06-25 18:58:15', 'Принят на должность - Рядовой'),
('Andrei_Morozov', 2, '2024-06-25 19:26:13', 'Уволен с должности Рядовой. Причина: Собственное желание'),
('Andrei_Morozov', 2, '2024-06-25 19:26:19', 'Принят на должность - Рядовой'),
('Andrei_Morozov', 2, '2024-06-25 19:26:21', 'Уволен с должности Рядовой. Причина: Собственное желание'),
('Andrei_Morozov', 3, '2024-06-25 19:26:23', 'Принят на должность - Рядовой'),
('Andrei_Morozov', 5, '2024-06-26 15:11:31', 'Принят(-а) на должность - Рядовой'),
('Andrei_Morozov', 5, '2024-06-26 15:13:19', 'Уволен(-а) с должности Рядовой. Причина: Собственное желание'),
('Andrei_Morozov', 5, '2024-10-22 08:50:48', 'Принят(-а) на должность - Рядовой');

-- --------------------------------------------------------

--
-- Структура таблицы `server_vip`
--

CREATE TABLE `server_vip` (
  `pvName` varchar(24) NOT NULL DEFAULT 'The Stats',
  `pvData` datetime NOT NULL,
  `pvDataClose` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `trucker`
--

CREATE TABLE `trucker` (
  `ID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL DEFAULT 'Compania',
  `Owner` varchar(24) NOT NULL DEFAULT 'The State',
  `EnterX` float NOT NULL,
  `EnterY` float NOT NULL,
  `EnterZ` float NOT NULL,
  `ExitX` float NOT NULL,
  `ExitY` float NOT NULL,
  `ExitZ` float NOT NULL,
  `Price` int(11) NOT NULL,
  `Balans` int(11) NOT NULL,
  `PicInfoX` float NOT NULL,
  `PicInfoY` float NOT NULL,
  `PicInfoZ` float NOT NULL,
  `MapIcon` int(11) NOT NULL DEFAULT '42',
  `SpawnX` float NOT NULL,
  `SpawnY` float NOT NULL,
  `SpawnZ` float NOT NULL,
  `SpawnA` float NOT NULL,
  `World` int(11) NOT NULL DEFAULT '0',
  `Members` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ucp_admin`
--

CREATE TABLE `ucp_admin` (
  `a_id` int(11) NOT NULL,
  `a_admin` varchar(24) NOT NULL,
  `a_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ucp_category_roulette`
--

CREATE TABLE `ucp_category_roulette` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ucp_drop_roulette`
--

CREATE TABLE `ucp_drop_roulette` (
  `p_number` int(11) NOT NULL,
  `p_user` varchar(24) NOT NULL DEFAULT '-',
  `p_data` varchar(50) NOT NULL DEFAULT '-',
  `p_value` int(11) NOT NULL DEFAULT '1',
  `p_id` int(11) NOT NULL DEFAULT '1',
  `p_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `ucp_item_roulette`
--

CREATE TABLE `ucp_item_roulette` (
  `id` int(11) NOT NULL,
  `i_name` varchar(50) NOT NULL,
  `i_images` text NOT NULL,
  `i_category` int(11) NOT NULL,
  `i_change` int(11) NOT NULL,
  `i_start_rand` int(11) NOT NULL,
  `i_end_rand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ucp_news`
--

CREATE TABLE `ucp_news` (
  `n_id` int(11) NOT NULL,
  `n_title` varchar(150) NOT NULL,
  `n_text` text NOT NULL,
  `n_data` varchar(50) NOT NULL,
  `n_images` text NOT NULL,
  `n_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ucp_servers`
--

CREATE TABLE `ucp_servers` (
  `s_id` int(11) NOT NULL,
  `s_ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ucp_servers`
--

INSERT INTO `ucp_servers` (`s_id`, `s_ip`, `s_name`) VALUES
(1, '127.0.0.1:7777', 'Тестовый');

-- --------------------------------------------------------

--
-- Структура таблицы `ucp_settings`
--

CREATE TABLE `ucp_settings` (
  `s_title` text NOT NULL,
  `s_favicon` text NOT NULL,
  `s_logo` text NOT NULL,
  `s_logo_footer` text NOT NULL,
  `s_md5` int(11) NOT NULL DEFAULT '0',
  `s_donate_cost` int(11) NOT NULL,
  `s_vk` text NOT NULL,
  `s_discord` text NOT NULL,
  `s_youtube` text NOT NULL,
  `s_about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `acc_admin`
--
ALTER TABLE `acc_admin`
  ADD PRIMARY KEY (`aID`);

--
-- Индексы таблицы `acc_ban_ip`
--
ALTER TABLE `acc_ban_ip`
  ADD PRIMARY KEY (`biID`);

--
-- Индексы таблицы `acc_full_admin`
--
ALTER TABLE `acc_full_admin`
  ADD PRIMARY KEY (`faID`);

--
-- Индексы таблицы `acc_med_card`
--
ALTER TABLE `acc_med_card`
  ADD PRIMARY KEY (`mcID`);

--
-- Индексы таблицы `acc_player`
--
ALTER TABLE `acc_player`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `acc_podarok`
--
ALTER TABLE `acc_podarok`
  ADD PRIMARY KEY (`spID`);

--
-- Индексы таблицы `acc_quest`
--
ALTER TABLE `acc_quest`
  ADD PRIMARY KEY (`qID`);

--
-- Индексы таблицы `acc_server`
--
ALTER TABLE `acc_server`
  ADD PRIMARY KEY (`acID`);

--
-- Индексы таблицы `freekassa_payments`
--
ALTER TABLE `freekassa_payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `list_history`
--
ALTER TABLE `list_history`
  ADD PRIMARY KEY (`lhID`);

--
-- Индексы таблицы `server_admin_log`
--
ALTER TABLE `server_admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `server_atm`
--
ALTER TABLE `server_atm`
  ADD PRIMARY KEY (`aID`);

--
-- Индексы таблицы `server_bank`
--
ALTER TABLE `server_bank`
  ADD PRIMARY KEY (`bID`);

--
-- Индексы таблицы `server_bank_card`
--
ALTER TABLE `server_bank_card`
  ADD PRIMARY KEY (`bpcID`);

--
-- Индексы таблицы `server_bilbord`
--
ALTER TABLE `server_bilbord`
  ADD PRIMARY KEY (`bID`);

--
-- Индексы таблицы `server_cars`
--
ALTER TABLE `server_cars`
  ADD PRIMARY KEY (`cID`);

--
-- Индексы таблицы `server_cars_number`
--
ALTER TABLE `server_cars_number`
  ADD PRIMARY KEY (`Model_ID`),
  ADD UNIQUE KEY `Model_ID` (`Model_ID`);

--
-- Индексы таблицы `server_debug`
--
ALTER TABLE `server_debug`
  ADD PRIMARY KEY (`dID`);

--
-- Индексы таблицы `server_ekonomika`
--
ALTER TABLE `server_ekonomika`
  ADD PRIMARY KEY (`eiID`);

--
-- Индексы таблицы `server_family`
--
ALTER TABLE `server_family`
  ADD PRIMARY KEY (`famID`);

--
-- Индексы таблицы `server_fraction`
--
ALTER TABLE `server_fraction`
  ADD PRIMARY KEY (`fID`);

--
-- Индексы таблицы `server_fraction_cars`
--
ALTER TABLE `server_fraction_cars`
  ADD PRIMARY KEY (`fcID`);

--
-- Индексы таблицы `server_house`
--
ALTER TABLE `server_house`
  ADD PRIMARY KEY (`hID`);

--
-- Индексы таблицы `server_job_level`
--
ALTER TABLE `server_job_level`
  ADD PRIMARY KEY (`jID`);

--
-- Индексы таблицы `server_musorki`
--
ALTER TABLE `server_musorki`
  ADD PRIMARY KEY (`mID`);

--
-- Индексы таблицы `server_online`
--
ALTER TABLE `server_online`
  ADD PRIMARY KEY (`IDs`);

--
-- Индексы таблицы `server_parking`
--
ALTER TABLE `server_parking`
  ADD PRIMARY KEY (`ParkID`);

--
-- Индексы таблицы `server_podarki`
--
ALTER TABLE `server_podarki`
  ADD PRIMARY KEY (`podID`);

--
-- Индексы таблицы `server_promo`
--
ALTER TABLE `server_promo`
  ADD PRIMARY KEY (`prID`);

--
-- Индексы таблицы `server_radar`
--
ALTER TABLE `server_radar`
  ADD PRIMARY KEY (`r_id`);

--
-- Индексы таблицы `server_seatdowns`
--
ALTER TABLE `server_seatdowns`
  ADD PRIMARY KEY (`SeatID`);

--
-- Индексы таблицы `server_setting`
--
ALTER TABLE `server_setting`
  ADD PRIMARY KEY (`sNumber`);

--
-- Индексы таблицы `server_taxopark`
--
ALTER TABLE `server_taxopark`
  ADD PRIMARY KEY (`tiID`);

--
-- Индексы таблицы `server_taxopark_cars`
--
ALTER TABLE `server_taxopark_cars`
  ADD PRIMARY KEY (`tcID`);

--
-- Индексы таблицы `server_tickets`
--
ALTER TABLE `server_tickets`
  ADD PRIMARY KEY (`tNumber`);

--
-- Индексы таблицы `trucker`
--
ALTER TABLE `trucker`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `ucp_admin`
--
ALTER TABLE `ucp_admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Индексы таблицы `ucp_category_roulette`
--
ALTER TABLE `ucp_category_roulette`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ucp_drop_roulette`
--
ALTER TABLE `ucp_drop_roulette`
  ADD PRIMARY KEY (`p_number`);

--
-- Индексы таблицы `ucp_item_roulette`
--
ALTER TABLE `ucp_item_roulette`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ucp_news`
--
ALTER TABLE `ucp_news`
  ADD PRIMARY KEY (`n_id`);

--
-- Индексы таблицы `ucp_servers`
--
ALTER TABLE `ucp_servers`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `acc_admin`
--
ALTER TABLE `acc_admin`
  MODIFY `aID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `acc_ban_ip`
--
ALTER TABLE `acc_ban_ip`
  MODIFY `biID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `acc_full_admin`
--
ALTER TABLE `acc_full_admin`
  MODIFY `faID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `acc_med_card`
--
ALTER TABLE `acc_med_card`
  MODIFY `mcID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `acc_player`
--
ALTER TABLE `acc_player`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `acc_podarok`
--
ALTER TABLE `acc_podarok`
  MODIFY `spID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `acc_quest`
--
ALTER TABLE `acc_quest`
  MODIFY `qID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `acc_server`
--
ALTER TABLE `acc_server`
  MODIFY `acID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `freekassa_payments`
--
ALTER TABLE `freekassa_payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `list_history`
--
ALTER TABLE `list_history`
  MODIFY `lhID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `server_admin_log`
--
ALTER TABLE `server_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_atm`
--
ALTER TABLE `server_atm`
  MODIFY `aID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_bank`
--
ALTER TABLE `server_bank`
  MODIFY `bID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_bank_card`
--
ALTER TABLE `server_bank_card`
  MODIFY `bpcID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_bilbord`
--
ALTER TABLE `server_bilbord`
  MODIFY `bID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_cars`
--
ALTER TABLE `server_cars`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_debug`
--
ALTER TABLE `server_debug`
  MODIFY `dID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_ekonomika`
--
ALTER TABLE `server_ekonomika`
  MODIFY `eiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_family`
--
ALTER TABLE `server_family`
  MODIFY `famID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_fraction`
--
ALTER TABLE `server_fraction`
  MODIFY `fID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `server_fraction_cars`
--
ALTER TABLE `server_fraction_cars`
  MODIFY `fcID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_house`
--
ALTER TABLE `server_house`
  MODIFY `hID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_job_level`
--
ALTER TABLE `server_job_level`
  MODIFY `jID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_musorki`
--
ALTER TABLE `server_musorki`
  MODIFY `mID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_online`
--
ALTER TABLE `server_online`
  MODIFY `IDs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_parking`
--
ALTER TABLE `server_parking`
  MODIFY `ParkID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_podarki`
--
ALTER TABLE `server_podarki`
  MODIFY `podID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_promo`
--
ALTER TABLE `server_promo`
  MODIFY `prID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT для таблицы `server_radar`
--
ALTER TABLE `server_radar`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `server_seatdowns`
--
ALTER TABLE `server_seatdowns`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `server_setting`
--
ALTER TABLE `server_setting`
  MODIFY `sNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_taxopark`
--
ALTER TABLE `server_taxopark`
  MODIFY `tiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `server_taxopark_cars`
--
ALTER TABLE `server_taxopark_cars`
  MODIFY `tcID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `server_tickets`
--
ALTER TABLE `server_tickets`
  MODIFY `tNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `trucker`
--
ALTER TABLE `trucker`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ucp_admin`
--
ALTER TABLE `ucp_admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ucp_category_roulette`
--
ALTER TABLE `ucp_category_roulette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ucp_drop_roulette`
--
ALTER TABLE `ucp_drop_roulette`
  MODIFY `p_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ucp_item_roulette`
--
ALTER TABLE `ucp_item_roulette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ucp_news`
--
ALTER TABLE `ucp_news`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ucp_servers`
--
ALTER TABLE `ucp_servers`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
