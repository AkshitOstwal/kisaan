-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 10, 2019 at 10:23 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kisaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('5fa3b826357bc2b4012c74b4df61c5cfefced91c', '2019-07-21 18:00:06.957137', 'e412059f461c4ecf820cbb7102803fb4'),
('8461ce8a30c2edd0b4dd6c9f4b060a7c4627fcd2', '2019-07-22 09:43:01.293732', '0e1ba5a3660846a99fabd0fb4c8284be'),
('ba80b799367984e861cafff451a6f3bc7a061c82', '2019-07-22 18:25:42.760687', '3c55e5fce38143eda7c61a36f8c257df'),
('d5a304eaf2c768420a9e60b03e03f9654ecfbc4c', '2019-07-22 08:33:43.830909', '06beaebcb2514263bcf377b78670d690'),
('d85bd98adf1db301241474cf26022e947696132b', '2019-06-14 09:18:45.946622', '3fc499df336143d78cd1b357b3dfa5bd'),
('e03b9918baea9bcf2e660a024de89df0d6be2705', '2019-06-13 19:14:14.379024', 'cd856090c6ef4f21a70c95da27a3753f');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'district officer'),
(1, 'students');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(12, 2, 24),
(14, 2, 28),
(2, 2, 32),
(8, 2, 48),
(10, 2, 52),
(13, 2, 56),
(7, 2, 60),
(1, 2, 64),
(3, 2, 68),
(5, 2, 72),
(6, 2, 76),
(9, 2, 80),
(11, 2, 84),
(4, 2, 100);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add institution', 8, 'add_institution'),
(30, 'Can change institution', 8, 'change_institution'),
(31, 'Can delete institution', 8, 'delete_institution'),
(32, 'Can view institution', 8, 'view_institution'),
(33, 'Can add district', 9, 'add_district'),
(34, 'Can change district', 9, 'change_district'),
(35, 'Can delete district', 9, 'delete_district'),
(36, 'Can view district', 9, 'view_district'),
(37, 'Can add state', 10, 'add_state'),
(38, 'Can change state', 10, 'change_state'),
(39, 'Can delete state', 10, 'delete_state'),
(40, 'Can view state', 10, 'view_state'),
(41, 'Can add zone', 11, 'add_zone'),
(42, 'Can change zone', 11, 'change_zone'),
(43, 'Can delete zone', 11, 'delete_zone'),
(44, 'Can view zone', 11, 'view_zone'),
(45, 'Can add course', 12, 'add_course'),
(46, 'Can change course', 12, 'change_course'),
(47, 'Can delete course', 12, 'delete_course'),
(48, 'Can view course', 12, 'view_course'),
(49, 'Can add course categories', 13, 'add_coursecategories'),
(50, 'Can change course categories', 13, 'change_coursecategories'),
(51, 'Can delete course categories', 13, 'delete_coursecategories'),
(52, 'Can view course categories', 13, 'view_coursecategories'),
(53, 'Can add course category mapping', 14, 'add_coursecategorymapping'),
(54, 'Can change course category mapping', 14, 'change_coursecategorymapping'),
(55, 'Can delete course category mapping', 14, 'delete_coursecategorymapping'),
(56, 'Can view course category mapping', 14, 'view_coursecategorymapping'),
(57, 'Can add course completion', 15, 'add_coursecompletion'),
(58, 'Can change course completion', 15, 'change_coursecompletion'),
(59, 'Can delete course completion', 15, 'delete_coursecompletion'),
(60, 'Can view course completion', 15, 'view_coursecompletion'),
(61, 'Can add course module completion', 16, 'add_coursemodulecompletion'),
(62, 'Can change course module completion', 16, 'change_coursemodulecompletion'),
(63, 'Can delete course module completion', 16, 'delete_coursemodulecompletion'),
(64, 'Can view course module completion', 16, 'view_coursemodulecompletion'),
(65, 'Can add course module completion criteria', 17, 'add_coursemodulecompletioncriteria'),
(66, 'Can change course module completion criteria', 17, 'change_coursemodulecompletioncriteria'),
(67, 'Can delete course module completion criteria', 17, 'delete_coursemodulecompletioncriteria'),
(68, 'Can view course module completion criteria', 17, 'view_coursemodulecompletioncriteria'),
(69, 'Can add course modules', 18, 'add_coursemodules'),
(70, 'Can change course modules', 18, 'change_coursemodules'),
(71, 'Can delete course modules', 18, 'delete_coursemodules'),
(72, 'Can view course modules', 18, 'view_coursemodules'),
(73, 'Can add course sections', 19, 'add_coursesections'),
(74, 'Can change course sections', 19, 'change_coursesections'),
(75, 'Can delete course sections', 19, 'delete_coursesections'),
(76, 'Can view course sections', 19, 'view_coursesections'),
(77, 'Can add question', 20, 'add_question'),
(78, 'Can change question', 20, 'change_question'),
(79, 'Can delete question', 20, 'delete_question'),
(80, 'Can view question', 20, 'view_question'),
(81, 'Can add question choice', 21, 'add_questionchoice'),
(82, 'Can change question choice', 21, 'change_questionchoice'),
(83, 'Can delete question choice', 21, 'delete_questionchoice'),
(84, 'Can view question choice', 21, 'view_questionchoice'),
(85, 'Can add assessment', 22, 'add_assessment'),
(86, 'Can change assessment', 22, 'change_assessment'),
(87, 'Can delete assessment', 22, 'delete_assessment'),
(88, 'Can view assessment', 22, 'view_assessment'),
(89, 'Can add assessment question', 23, 'add_assessmentquestion'),
(90, 'Can change assessment question', 23, 'change_assessmentquestion'),
(91, 'Can delete assessment question', 23, 'delete_assessmentquestion'),
(92, 'Can view assessment question', 23, 'view_assessmentquestion'),
(93, 'Can add Token', 24, 'add_token'),
(94, 'Can change Token', 24, 'change_token'),
(95, 'Can delete Token', 24, 'delete_token'),
(96, 'Can view Token', 24, 'view_token'),
(97, 'Can add quiz question', 25, 'add_quizquestion'),
(98, 'Can change quiz question', 25, 'change_quizquestion'),
(99, 'Can delete quiz question', 25, 'delete_quizquestion'),
(100, 'Can view quiz question', 25, 'view_quizquestion');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `id`, `email`) VALUES
('pbkdf2_sha256$120000$v5v2NAFbY9MJ$9WB+aVAAaNmYk2kGsWeZj2r4UeYGRBKtwuWSg5Z3QH8=', NULL, 0, 'Keshav', 'Meena', 0, 1, '2019-07-20 08:28:44.254163', '06beaebcb2514263bcf377b78670d690', 'keshavmeena@gmail.com'),
('pbkdf2_sha256$120000$Si4JJYKR2btR$Pf0/Cs5AcC8b0L5Lz8DbBCP2alwCLB5cRRsopwTTNHI=', NULL, 0, 'Ashwin', 'Meena', 0, 1, '2019-07-20 08:31:40.982125', '0e1ba5a3660846a99fabd0fb4c8284be', 'ashwinmeena@gmail.com'),
('pbkdf2_sha256$150000$5jXN8NGvHYLm$1Td8FmU/WJNXcuHdrbsJvCr5iN2axTjcDksxQod0u40=', NULL, 0, 'Khyati', 'Jha', 0, 1, '2019-07-20 08:30:41.857192', '2fe54c8dbe23409283ae288211abf1af', 'khyyatijha@gmail.com'),
('pbkdf2_sha256$120000$aIyZSqJS6Ofg$8JaKg7/kNtzjwG9+V6ykta3u9YWbf+KEGF4O8eklQS4=', NULL, 0, 'Sample Institute', 'User', 0, 1, '2019-06-13 11:45:48.364850', '3578310b60004a6f9603a4888384c820', 'instituteuser@gmail.com'),
('pbkdf2_sha256$120000$PXlFNZ2FoRLm$z3wKYwPUdAa3w5C3SiIhUWNKFebygK6wxQBnRkOxGC4=', NULL, 0, 'Garima', 'Sharma', 0, 1, '2019-07-20 08:33:09.615163', '3c55e5fce38143eda7c61a36f8c257df', 'garimasharma@gmail.com'),
('pbkdf2_sha256$120000$9OCTTZgqBN7D$VRht5S1JKfJJvleHCJNDPLpQIrXOmvel8tzIB56wS0c=', NULL, 0, 'Jayesh', 'Joshi', 0, 1, '2019-06-13 09:32:49.112369', '3fc499df336143d78cd1b357b3dfa5bd', 'jayesh@gmail.com'),
('pbkdf2_sha256$120000$L6hikoOUIoIa$St8cAZZm6rLHgcxMRWACiZnVS3txTq9OQTjBuW6MU8g=', NULL, 0, 'new institute', 'use', 0, 1, '2019-06-25 07:36:48.010700', '477ce805eac44b6d8de430a68168d7cf', 'jj@gmail.com'),
('pbkdf2_sha256$150000$de75F73Ign8P$wc7b7I+9zQRPill6TntbZuXe1GERQiPGw4vESZdwd0Y=', NULL, 0, 'Diya', 'Patel', 0, 1, '2019-07-20 08:33:55.554026', '502159d41db44899a25397760fa6cd08', 'diya@gmail.com'),
('pbkdf2_sha256$120000$KOJsKdwBJetm$fSl8+sJ5NjP2pOspkHrSY5X2SpmAPwO15uHC38pZ3oA=', NULL, 0, 'test', 'user', 0, 1, '2019-06-13 09:38:50.876574', '683a989ca36a4c68b30089cda8290da3', 'hello@test.com'),
('pbkdf2_sha256$150000$XqP9WEPrLsGG$uf2pLjYi5YNrSkh9HoDsielAZlRXA3c/S/ShJE34vw0=', NULL, 0, 'Manish', 'Garg', 0, 1, '2019-07-20 08:21:39.152888', '694d5ad86e6b497eb6cd82f5758936dc', 'manishgarg@gmail.com'),
('pbkdf2_sha256$150000$XobOBKgvIquK$jhjPDMB40fR3GzA8yTiM+lvsN8byC+VFuvQ9a16MTcY=', NULL, 0, 'Kshitiz', 'Aggarwaal', 0, 1, '2019-07-20 08:29:58.721795', '6aaf68f511fe48668394b70daeb94732', 'kshitizaggarwal@gmail.com'),
('pbkdf2_sha256$120000$eQHQLs7utPgU$Qk8ZXHlUt1DXW1pDWyvYrhdcySnrVYLces8swYt+R2E=', NULL, 0, 'new institute', 'use', 0, 1, '2019-06-25 07:41:01.385080', '72d1b86bb0f04f75813ebc58d3fac20b', 'jj4@gmail.com'),
('pbkdf2_sha256$150000$WyYiWmKF8NR5$9GL9XbSC+Pg0rbvCv7FxrPITwufge4iSxhtRWZJrb4E=', '2019-07-20 06:56:31.366640', 0, 'hello', 'user', 0, 1, '2019-06-13 09:37:26.458242', '7831c5ff4ce645c9a53733a462c5f0b8', 'hello@123.com'),
('pbkdf2_sha256$150000$TY0dCMlia2aT$oFimTjwUbAU7g505LP6GFnGhoRuckxmmNR2WFuhUIx0=', NULL, 0, 'Ishaan', 'Sharma', 0, 1, '2019-07-20 08:29:23.734701', '79d37ee7700d4153bc76ea1826994811', 'ishaansharma@gmail.com'),
('pbkdf2_sha256$120000$wjNEyaUXdGwd$UuyVvLkmgZoOIZMHeryq8NRGbRu/wqwugbrDR9in9nk=', NULL, 0, 'new institute', 'use', 0, 1, '2019-06-25 07:39:10.754519', '7bbbc9b424204a0aa7c7a1cab2f1c150', 'jj3@gmail.com'),
('pbkdf2_sha256$150000$yRjgkuYqLtR5$GX6mdH9q1bkZES3yzJFByhgGq4BE3qbdten5xdjlK6c=', NULL, 0, 'Devansh', 'Patni', 0, 1, '2019-07-20 08:32:40.698311', '876b139ab42e4c9cb7fa7ad584305248', 'devanshpatni@gmail.com'),
('pbkdf2_sha256$150000$uBBWSQwpEVG5$Hpl15gpUsyVIquOsQg0JtRC39HzTk5+cVOgmekJc9jc=', NULL, 0, 'Piyush', 'Bohra', 0, 1, '2019-07-20 08:27:40.897796', '8ce3ca99b639446e98c2b8d7c97f11ac', 'piyushbohra@gmail.com'),
('pbkdf2_sha256$150000$0x5BJeLaoesZ$KkEYTtCBuaEp86n2yem+fPzc6iF6BfAs2X071RdUljQ=', NULL, 0, 'Akshit', 'Ostwal', 0, 1, '2019-07-20 08:28:13.874138', 'abf09af04ab74330a7c094283c9cee04', 'akshitostwal@gmail.com'),
('pbkdf2_sha256$120000$xHtpVDsZNfae$+t+8o0Dg0JgFVzkRwc9zrArC1LFw6Dyutv3afRqCHYM=', NULL, 0, 'new institute', 'use', 0, 1, '2019-06-25 07:37:54.793981', 'b592dc61c57d42a79752bd5154e1a483', 'jj2@gmail.com'),
('pbkdf2_sha256$150000$V4mDzHreITqG$wLcjGa8f9wrgLLShrPmA6U2guDKk+B05/Vpg0+aop8Q=', '2019-07-20 07:02:02.439048', 0, 'Ravi', 'Jain', 0, 1, '2019-07-20 07:01:27.958037', 'c282e7c5c59c4f76ae535d1c5032ebb9', 'ravijain@gmail.com'),
('pbkdf2_sha256$150000$1vKac8Zs7Rnm$m3Db+FbRTS8qwnkiOZZt4IDErfEdP3890mShYNvC1pQ=', '2019-08-10 19:20:05.510091', 1, 'New', 'user', 1, 1, '2019-06-12 12:09:27.458434', 'cd856090c6ef4f21a70c95da27a3753f', 'manish@amcipher.com'),
('pbkdf2_sha256$120000$fwCyZfQNqosX$mjHe2Woq7NnaixWtcyx0xlpRdaNUdFSsSmz4MJEkCQ8=', '2019-06-26 03:51:22.360995', 0, 'new institute', 'use', 0, 1, '2019-06-25 07:37:31.888378', 'd3e668ea8f384807be1a5bf44afd0086', 'jj1@gmail.com'),
('pbkdf2_sha256$120000$ZnllsYe9U89m$SmgFlecDKeXJz8bMdxYMAXo68N8Gn5mSj5FTMmxWhtw=', NULL, 0, 'Jayesh', 'Joshi', 0, 1, '2019-07-20 08:18:55.995358', 'e412059f461c4ecf820cbb7102803fb4', 'jayeshjoshi@gmail.com'),
('pbkdf2_sha256$120000$xir6Bs2nv1kW$JJcDeaNeiuGkSghld3q3V1vIM3QHoWbjvvSujIMPYuY=', NULL, 0, 'Manish', 'Garg3', 0, 1, '2019-06-13 09:36:29.054925', 'e4400a1c1e0144ff98c540aca5efdff6', 'garg@gmail.com'),
('pbkdf2_sha256$150000$XHtEP4xNeuBU$KZcX6SQuLuaHl8frDpbcSu2RuPl783rws7E42zIVkuM=', NULL, 0, 'Aastha', 'Jain', 0, 1, '2019-07-20 08:32:06.748574', 'edd23bed270248eb967b55912849ec37', 'aasthajain@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` char(32) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, '7831c5ff4ce645c9a53733a462c5f0b8', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` char(32) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, '7831c5ff4ce645c9a53733a462c5f0b8', 48);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-07-20 06:44:27.544594', '1', 'students', 1, '[{\"added\": {}}]', 3, 'cd856090c6ef4f21a70c95da27a3753f'),
(2, '2019-07-20 06:46:41.426856', '2', 'district officer', 1, '[{\"added\": {}}]', 3, 'cd856090c6ef4f21a70c95da27a3753f');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'user'),
(7, 'accounts', 'userprofile'),
(1, 'admin', 'logentry'),
(22, 'assessment', 'assessment'),
(23, 'assessment', 'assessmentquestion'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(24, 'authtoken', 'token'),
(4, 'contenttypes', 'contenttype'),
(12, 'course', 'course'),
(13, 'course', 'coursecategories'),
(14, 'course', 'coursecategorymapping'),
(15, 'course', 'coursecompletion'),
(16, 'course', 'coursemodulecompletion'),
(17, 'course', 'coursemodulecompletioncriteria'),
(18, 'course', 'coursemodules'),
(19, 'course', 'coursesections'),
(8, 'institution', 'institution'),
(9, 'master', 'district'),
(10, 'master', 'state'),
(11, 'master', 'zone'),
(20, 'question', 'question'),
(21, 'question', 'questionchoice'),
(25, 'quiz', 'quizquestion'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'master', '0001_initial', '2019-06-12 17:06:54.346033'),
(2, 'contenttypes', '0001_initial', '2019-06-12 17:06:56.160010'),
(3, 'contenttypes', '0002_remove_content_type_name', '2019-06-12 17:06:59.642128'),
(4, 'auth', '0001_initial', '2019-06-12 17:07:16.503773'),
(5, 'auth', '0002_alter_permission_name_max_length', '2019-06-12 17:07:19.655089'),
(6, 'auth', '0003_alter_user_email_max_length', '2019-06-12 17:07:19.757401'),
(7, 'auth', '0004_alter_user_username_opts', '2019-06-12 17:07:19.837302'),
(8, 'auth', '0005_alter_user_last_login_null', '2019-06-12 17:07:20.020463'),
(9, 'auth', '0006_require_contenttypes_0002', '2019-06-12 17:07:20.120848'),
(10, 'auth', '0007_alter_validators_add_error_messages', '2019-06-12 17:07:20.496013'),
(11, 'auth', '0008_alter_user_username_max_length', '2019-06-12 17:07:20.827782'),
(12, 'auth', '0009_alter_user_last_name_max_length', '2019-06-12 17:07:21.105289'),
(13, 'accounts', '0001_initial', '2019-06-12 17:08:06.351930'),
(14, 'admin', '0001_initial', '2019-06-12 17:08:25.466729'),
(15, 'admin', '0002_logentry_remove_auto_add', '2019-06-12 17:08:25.681917'),
(16, 'admin', '0003_logentry_add_action_flag_choices', '2019-06-12 17:08:25.841272'),
(17, 'question', '0001_initial', '2019-06-12 17:08:40.679839'),
(18, 'assessment', '0001_initial', '2019-06-12 17:09:05.940929'),
(19, 'course', '0001_initial', '2019-06-12 17:11:43.381191'),
(20, 'institution', '0001_initial', '2019-06-12 17:12:16.532249'),
(21, 'sessions', '0001_initial', '2019-06-12 17:12:25.959825'),
(22, 'accounts', '0002_auto_20190612_1713', '2019-06-12 17:13:32.394168'),
(23, 'accounts', '0002_userprofile', '2019-06-13 18:55:32.927385'),
(24, 'authtoken', '0001_initial', '2019-06-13 18:55:35.954417'),
(25, 'authtoken', '0002_auto_20160226_1747', '2019-06-13 18:55:37.008558'),
(26, 'course', '0002_auto_20190613_1800', '2019-06-13 18:00:47.500116'),
(27, 'quiz', '0001_initial', '2019-06-13 18:00:50.252737');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3g58x4snuh3wekieo3eueclmgcc05d9p', 'NWY5OWMxMDUyNjkxODRmODlhNTExZjcyMzk2NzQ5ZDhjYzVjZTgxNDp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBjYzEwODViMjRhZGQ0MzlkNzY2OGU4NThlMDNhM2RkZjZlYzczNDkifQ==', '2019-07-12 07:09:52.713180'),
('5j6mzv77jp5f22rqgbr41ataiar0ek93', 'NWYxYjNmYmViYmJjNzgzMTdiNjk0OTI0YWQzNDY1OGFlMWI1ZDg2MDp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFlYWI1MjgyNmY4NzIzZDEzYzJhOGUyNmVjZDdiYTdjMjNlMzUxMjAifQ==', '2019-07-30 12:54:00.001611'),
('7padf53krbw4f9u3svp7yqfy6raouufb', 'ZTU0NzA2ODgwYWIzYzdhMjgzYWNhYjEyNmIyY2Q5NTI4ZDdlOTg3YTp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM0YzAwMzM1OGE5YzE0Mzc4MmY2NmRiYmI3YjQ4NmI3MTU5NzkzNmQifQ==', '2019-08-09 19:12:58.419696'),
('bbqxkfhrjd65ndxfsbcid4n3pv355xrl', 'ZGQxMzcwYTM0ZjYzZWQxNDcwZmQ0YzQzMjRlMzI4ZDgzNjI4MThhMDp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY2MjQ2ZGU0ZDFkMzEzMTEyZDQ4NWVkZmIzNWZmNTA2N2E3NTYwN2EiLCJkaXN0cmljdCI6IiJ9', '2019-08-03 11:01:51.534573'),
('i0vu0gto46wsl3nedx9tmozf9vhl1b2r', 'ZjEyMDQwMzNkZjQ5N2RkMzc0MjliZjMxYWMyN2ZiNGE3ODhlOGJiYTp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY2MjQ2ZGU0ZDFkMzEzMTEyZDQ4NWVkZmIzNWZmNTA2N2E3NTYwN2EifQ==', '2019-08-03 11:38:54.672117'),
('lsqklcr01n6kzxgrvemqu8k8lcuftoqh', 'OTkwMjM4OGNhNTM5MmMzODEzYzhiYjg4MTJlZWYwOGZhNmRhNWViNDp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQwMjcyODk3OGQ4MjQ1ZGUyZTQ5M2QyNzhiODg1NTEwYTA5OTJkZDQifQ==', '2019-08-04 12:45:26.159352'),
('mftezagxlvk2kbtumj9cvqfhwt2iztc9', 'NWYxYjNmYmViYmJjNzgzMTdiNjk0OTI0YWQzNDY1OGFlMWI1ZDg2MDp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFlYWI1MjgyNmY4NzIzZDEzYzJhOGUyNmVjZDdiYTdjMjNlMzUxMjAifQ==', '2019-07-18 09:25:14.016451'),
('tmiu856qjfrfovt8lts9tb16qbzpea2e', 'NjFiN2RkYzBlZWE1ODkyNjFiMDZhNzA2N2JkMmEwY2VkZTg2ZTU3NTp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhiMTI3ODIzYWU2ZDU2NjVmZTgxYTk5NmY4NGM3Y2RjNDNiNGI1MDkifQ==', '2019-06-28 11:58:14.040610'),
('tzublktnb9npmd93qqy2h9s9dj260b9b', 'ZTU0NzA2ODgwYWIzYzdhMjgzYWNhYjEyNmIyY2Q5NTI4ZDdlOTg3YTp7Il9hdXRoX3VzZXJfaWQiOiJjZDg1NjA5MC1jNmVmLTRmMjEtYTcwYy05NWRhMjdhMzc1M2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM0YzAwMzM1OGE5YzE0Mzc4MmY2NmRiYmI3YjQ4NmI3MTU5NzkzNmQifQ==', '2019-08-24 19:20:05.634492');

-- --------------------------------------------------------

--
-- Table structure for table `master_district`
--

CREATE TABLE `master_district` (
  `districtcode` varchar(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `statecode_id` varchar(2) NOT NULL,
  `zonecode_id` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_district`
--

INSERT INTO `master_district` (`districtcode`, `name`, `active`, `is_deleted`, `statecode_id`, `zonecode_id`) VALUES
('AL', 'Alwar', 1, 0, 'RJ', 'JP'),
('JH', 'Jhunjunu', 1, 0, 'RJ', 'JP'),
('SK', 'Sikar', 1, 0, 'RJ', 'JP');

-- --------------------------------------------------------

--
-- Table structure for table `master_state`
--

CREATE TABLE `master_state` (
  `statecode` varchar(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_state`
--

INSERT INTO `master_state` (`statecode`, `name`, `active`, `is_deleted`) VALUES
('GJ', 'Gujrat', 1, 0),
('RJ', 'Rajasthan', 1, 0),
('UP', 'Uttar Pradesh', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_zone`
--

CREATE TABLE `master_zone` (
  `zonecode` varchar(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `statecode_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_zone`
--

INSERT INTO `master_zone` (`zonecode`, `name`, `active`, `is_deleted`, `statecode_id`) VALUES
('AL', 'Alwar', 1, 0, 'RJ'),
('JP', 'Jaipur', 1, 0, 'RJ');

-- --------------------------------------------------------

--
-- Table structure for table `water_level`
--

CREATE TABLE `water_level` (
  `id` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `crop` varchar(100) NOT NULL,
  `temp` decimal(11,0) NOT NULL,
  `humidity` decimal(11,0) NOT NULL,
  `waterlevel` int(11) NOT NULL,
  `pressure` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `water_level`
--

INSERT INTO `water_level` (`id`, `name`, `crop`, `temp`, `humidity`, `waterlevel`, `pressure`) VALUES
('198f1fe91aa0482d9f98d983967c3781', 'jaipur', 'wheat', '30', '22', 144, '20'),
('23db29ce49be46b68ae5ac28710aea17', 'jaipur', 'wheat', '30', '22', 2541, '20'),
('3a45323bc27f43348036511b67850f9f', 'jaipur', 'wheat', '30', '22', 3418, '20'),
('4fd8fa0782ae4c2595a8c7f50832f8f5', 'jaipur', 'wheat', '30', '22', 7332, '20'),
('7e6cab81936240f3af8e5b839f9acd72', 'gujrat', 'wheat', '30', '26', 12, '20'),
('abe781e966d048339c800595cde7cb99', 'jaipur', 'wheat', '30', '22', 1766, '20'),
('f5e1c376f759406abeafcbc641f6e778', 'jaipur', 'wheat', '30', '22', 3395, '20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `master_district`
--
ALTER TABLE `master_district`
  ADD PRIMARY KEY (`districtcode`),
  ADD KEY `master_district_statecode_id_74d7ac4e_fk_master_state_statecode` (`statecode_id`),
  ADD KEY `master_district_zonecode_id_2fb299ff_fk_master_zone_zonecode` (`zonecode_id`);

--
-- Indexes for table `master_state`
--
ALTER TABLE `master_state`
  ADD PRIMARY KEY (`statecode`);

--
-- Indexes for table `master_zone`
--
ALTER TABLE `master_zone`
  ADD PRIMARY KEY (`zonecode`),
  ADD KEY `master_zone_statecode_id_c16ea939_fk_master_state_statecode` (`statecode_id`);

--
-- Indexes for table `water_level`
--
ALTER TABLE `water_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `master_district`
--
ALTER TABLE `master_district`
  ADD CONSTRAINT `master_district_statecode_id_74d7ac4e_fk_master_state_statecode` FOREIGN KEY (`statecode_id`) REFERENCES `master_state` (`statecode`),
  ADD CONSTRAINT `master_district_zonecode_id_2fb299ff_fk_master_zone_zonecode` FOREIGN KEY (`zonecode_id`) REFERENCES `master_zone` (`zonecode`);

--
-- Constraints for table `master_zone`
--
ALTER TABLE `master_zone`
  ADD CONSTRAINT `master_zone_statecode_id_c16ea939_fk_master_state_statecode` FOREIGN KEY (`statecode_id`) REFERENCES `master_state` (`statecode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
