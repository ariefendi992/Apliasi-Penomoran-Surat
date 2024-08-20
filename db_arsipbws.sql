-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2024 at 08:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_arsipbws`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun_usermodel`
--

CREATE TABLE `akun_usermodel` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun_usermodel`
--

INSERT INTO `akun_usermodel` (`id`, `password`, `last_login`, `username`, `nama`, `is_active`, `is_admin`, `is_staff`, `is_superuser`) VALUES
(1, 'pbkdf2_sha256$720000$HHjW6B3D2tHpOs6eo9MjoR$5M4Unzj9KItppU6Z/4F1GNt/GwgTZAlS0Iz7SUjxaJc=', '2024-08-13 03:48:01.711370', 'admin', 'ari', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `akun_usermodel_groups`
--

CREATE TABLE `akun_usermodel_groups` (
  `id` bigint(20) NOT NULL,
  `usermodel_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `akun_usermodel_user_permissions`
--

CREATE TABLE `akun_usermodel_user_permissions` (
  `id` bigint(20) NOT NULL,
  `usermodel_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(21, 'Can add user model', 6, 'add_usermodel'),
(22, 'Can change user model', 6, 'change_usermodel'),
(23, 'Can delete user model', 6, 'delete_usermodel'),
(24, 'Can view user model', 6, 'view_usermodel'),
(25, 'Can add bagian masalah model', 7, 'add_bagianmasalahmodel'),
(26, 'Can change bagian masalah model', 7, 'change_bagianmasalahmodel'),
(27, 'Can delete bagian masalah model', 7, 'delete_bagianmasalahmodel'),
(28, 'Can view bagian masalah model', 7, 'view_bagianmasalahmodel'),
(29, 'Can add balai model', 8, 'add_balaimodel'),
(30, 'Can change balai model', 8, 'change_balaimodel'),
(31, 'Can delete balai model', 8, 'delete_balaimodel'),
(32, 'Can view balai model', 8, 'view_balaimodel'),
(33, 'Can add klasifikasi model', 9, 'add_klasifikasimodel'),
(34, 'Can change klasifikasi model', 9, 'change_klasifikasimodel'),
(35, 'Can delete klasifikasi model', 9, 'delete_klasifikasimodel'),
(36, 'Can view klasifikasi model', 9, 'view_klasifikasimodel'),
(37, 'Can add masalah pokok model', 10, 'add_masalahpokokmodel'),
(38, 'Can change masalah pokok model', 10, 'change_masalahpokokmodel'),
(39, 'Can delete masalah pokok model', 10, 'delete_masalahpokokmodel'),
(40, 'Can view masalah pokok model', 10, 'view_masalahpokokmodel'),
(41, 'Can add suku masalah model', 11, 'add_sukumasalahmodel'),
(42, 'Can change suku masalah model', 11, 'change_sukumasalahmodel'),
(43, 'Can delete suku masalah model', 11, 'delete_sukumasalahmodel'),
(44, 'Can view suku masalah model', 11, 'view_sukumasalahmodel'),
(45, 'Can add surat keluar model', 12, 'add_suratkeluarmodel'),
(46, 'Can change surat keluar model', 12, 'change_suratkeluarmodel'),
(47, 'Can delete surat keluar model', 12, 'delete_suratkeluarmodel'),
(48, 'Can view surat keluar model', 12, 'view_suratkeluarmodel'),
(49, 'Can add surat masuk model', 13, 'add_suratmasukmodel'),
(50, 'Can change surat masuk model', 13, 'change_suratmasukmodel'),
(51, 'Can delete surat masuk model', 13, 'delete_suratmasukmodel'),
(52, 'Can view surat masuk model', 13, 'view_suratmasukmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-08-05 09:12:04.968766', '1', 'BWS21 | Balai Wilayah Sungai Papua Barat', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-08-05 09:54:53.838826', '1', 'fasilitasif', 1, '[{\"added\": {}}]', 9, 1),
(3, '2024-08-05 09:54:58.591531', '2', 'substantif', 1, '[{\"added\": {}}]', 9, 1),
(4, '2024-08-05 10:10:27.712978', '1', 'Hukum', 1, '[{\"added\": {}}]', 10, 1),
(5, '2024-08-05 10:14:22.707184', '2', 'Kepegawaian', 1, '[{\"added\": {}}]', 10, 1),
(6, '2024-08-05 10:15:15.782443', '3', 'Umum', 1, '[{\"added\": {}}]', 10, 1),
(7, '2024-08-05 10:16:33.661941', '1', 'Produk Hukum', 1, '[{\"added\": {}}]', 7, 1),
(8, '2024-08-05 10:17:04.800495', '1', 'Produk Hukum Bersifat Pengaturan', 1, '[{\"added\": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(6, 'akun', 'usermodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'masterdata', 'bagianmasalahmodel'),
(8, 'masterdata', 'balaimodel'),
(9, 'masterdata', 'klasifikasimodel'),
(10, 'masterdata', 'masalahpokokmodel'),
(11, 'masterdata', 'sukumasalahmodel'),
(5, 'sessions', 'session'),
(12, 'surat', 'suratkeluarmodel'),
(13, 'surat', 'suratmasukmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-05 08:33:26.415391'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-08-05 08:33:26.463025'),
(3, 'auth', '0001_initial', '2024-08-05 08:33:26.673500'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-08-05 08:33:26.728865'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-08-05 08:33:26.736914'),
(6, 'auth', '0004_alter_user_username_opts', '2024-08-05 08:33:26.742700'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-08-05 08:33:26.747704'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-08-05 08:33:26.750705'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-08-05 08:33:26.756810'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-08-05 08:33:26.761745'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-08-05 08:33:26.767705'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-08-05 08:33:26.779708'),
(13, 'auth', '0011_update_proxy_permissions', '2024-08-05 08:33:26.789633'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-08-05 08:33:26.795268'),
(15, 'akun', '0001_initial', '2024-08-05 08:33:29.553424'),
(16, 'admin', '0001_initial', '2024-08-05 08:33:29.667349'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-08-05 08:33:29.675345'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-05 08:33:29.685087'),
(19, 'sessions', '0001_initial', '2024-08-05 08:33:29.718548'),
(20, 'masterdata', '0001_initial', '2024-08-05 08:40:35.672613'),
(21, 'masterdata', '0002_bagianmasalahmodel_masalahpokok_and_more', '2024-08-05 09:09:46.094422'),
(22, 'akun', '0002_alter_usermodel_options', '2024-08-06 11:03:33.883537'),
(23, 'masterdata', '0003_alter_bagianmasalahmodel_options_and_more', '2024-08-06 11:03:33.902962'),
(24, 'surat', '0001_initial', '2024-08-06 11:03:33.989996'),
(25, 'surat', '0002_suratmasukmodel_and_more', '2024-08-06 11:16:52.784182'),
(26, 'surat', '0003_suratkeluarmodel_user_suratmasukmodel_user', '2024-08-06 11:21:09.325235');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2d7k5o006cyyyw19dpchzig5yat8j7wn', '.eJxVjEEOwiAQRe_C2hBoBxhcuvcMZGagUjVtUtqV8e7apAvd_vfef6lE21rT1sqSxqzOyqrT78YkjzLtIN9pus1a5mldRta7og_a9HXO5Xk53L-DSq1-a4cOjRNjmAiMYBec8QzDIBBz6NFGAOC-9AGj9w4tMHRBXGAvJIjq_QG2_jbE:1satKZ:Z9tJ6Y_LhD8ZTR5pzodx047K1YkwWWCJY2EHjNGrOok', '2024-08-19 08:44:39.204945'),
('9cnm373e1i5x5uops78sjezed5ez25qz', '.eJxVjEEOwiAQRe_C2hBoBxhcuvcMZGagUjVtUtqV8e7apAvd_vfef6lE21rT1sqSxqzOyqrT78YkjzLtIN9pus1a5mldRta7og_a9HXO5Xk53L-DSq1-a4cOjRNjmAiMYBec8QzDIBBz6NFGAOC-9AGj9w4tMHRBXGAvJIjq_QG2_jbE:1sdiVt:VFxJqlrt9Yyt0leVrVEn2Sgyd-8sSFb779-pURvQ5dY', '2024-08-27 03:48:01.716440');

-- --------------------------------------------------------

--
-- Table structure for table `masterdata_bagianmasalahmodel`
--

CREATE TABLE `masterdata_bagianmasalahmodel` (
  `id` bigint(20) NOT NULL,
  `kode` varchar(6) NOT NULL,
  `bagian_masalah` varchar(128) NOT NULL,
  `masalahpokok_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masterdata_bagianmasalahmodel`
--

INSERT INTO `masterdata_bagianmasalahmodel` (`id`, `kode`, `bagian_masalah`, `masalahpokok_id`) VALUES
(1, '01', 'Produk Hukum', 1);

-- --------------------------------------------------------

--
-- Table structure for table `masterdata_balaimodel`
--

CREATE TABLE `masterdata_balaimodel` (
  `id` bigint(20) NOT NULL,
  `kode_balai` varchar(32) NOT NULL,
  `nama_balai` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masterdata_balaimodel`
--

INSERT INTO `masterdata_balaimodel` (`id`, `kode_balai`, `nama_balai`) VALUES
(1, 'BWS21', 'Balai Wilayah Sungai Papua Barat');

-- --------------------------------------------------------

--
-- Table structure for table `masterdata_klasifikasimodel`
--

CREATE TABLE `masterdata_klasifikasimodel` (
  `id` bigint(20) NOT NULL,
  `klasifikasi_arsip` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masterdata_klasifikasimodel`
--

INSERT INTO `masterdata_klasifikasimodel` (`id`, `klasifikasi_arsip`) VALUES
(1, 'fasilitasif'),
(2, 'substantif');

-- --------------------------------------------------------

--
-- Table structure for table `masterdata_masalahpokokmodel`
--

CREATE TABLE `masterdata_masalahpokokmodel` (
  `id` bigint(20) NOT NULL,
  `kode` varchar(6) NOT NULL,
  `masalah_pokok` varchar(128) NOT NULL,
  `klasifikasi_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masterdata_masalahpokokmodel`
--

INSERT INTO `masterdata_masalahpokokmodel` (`id`, `kode`, `masalah_pokok`, `klasifikasi_id`) VALUES
(1, 'HK', 'Hukum', 1),
(2, 'KP', 'Kepegawaian', 1),
(3, 'UM', 'Umum', 1);

-- --------------------------------------------------------

--
-- Table structure for table `masterdata_sukumasalahmodel`
--

CREATE TABLE `masterdata_sukumasalahmodel` (
  `id` bigint(20) NOT NULL,
  `kode` varchar(6) NOT NULL,
  `suku_masalah` varchar(128) NOT NULL,
  `bagianmasalah_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masterdata_sukumasalahmodel`
--

INSERT INTO `masterdata_sukumasalahmodel` (`id`, `kode`, `suku_masalah`, `bagianmasalah_id`) VALUES
(1, '01', 'Produk Hukum Bersifat Pengaturan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `surat_suratkeluarmodel`
--

CREATE TABLE `surat_suratkeluarmodel` (
  `id` bigint(20) NOT NULL,
  `tgl_surat` date DEFAULT NULL,
  `penerima` varchar(128) NOT NULL,
  `perihal` varchar(128) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `nomor_surat_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_suratmasukmodel`
--

CREATE TABLE `surat_suratmasukmodel` (
  `id` bigint(20) NOT NULL,
  `nomor_surat` varchar(64) NOT NULL,
  `tgl_surat` date NOT NULL,
  `perihal` varchar(128) NOT NULL,
  `pengirim` varchar(128) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun_usermodel`
--
ALTER TABLE `akun_usermodel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `akun_usermodel_groups`
--
ALTER TABLE `akun_usermodel_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `akun_usermodel_groups_usermodel_id_group_id_65176f51_uniq` (`usermodel_id`,`group_id`),
  ADD KEY `akun_usermodel_groups_group_id_102f26d8_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `akun_usermodel_user_permissions`
--
ALTER TABLE `akun_usermodel_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `akun_usermodel_user_perm_usermodel_id_permission__d7d9d8f2_uniq` (`usermodel_id`,`permission_id`),
  ADD KEY `akun_usermodel_user__permission_id_1ba1f5fd_fk_auth_perm` (`permission_id`);

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_akun_usermodel_id` (`user_id`);

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
-- Indexes for table `masterdata_bagianmasalahmodel`
--
ALTER TABLE `masterdata_bagianmasalahmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masterdata_bagianmas_masalahpokok_id_e52d8f3a_fk_masterdat` (`masalahpokok_id`);

--
-- Indexes for table `masterdata_balaimodel`
--
ALTER TABLE `masterdata_balaimodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masterdata_klasifikasimodel`
--
ALTER TABLE `masterdata_klasifikasimodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masterdata_masalahpokokmodel`
--
ALTER TABLE `masterdata_masalahpokokmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masterdata_masalahpo_klasifikasi_id_2330aa1b_fk_masterdat` (`klasifikasi_id`);

--
-- Indexes for table `masterdata_sukumasalahmodel`
--
ALTER TABLE `masterdata_sukumasalahmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masterdata_sukumasal_bagianmasalah_id_339f312e_fk_masterdat` (`bagianmasalah_id`);

--
-- Indexes for table `surat_suratkeluarmodel`
--
ALTER TABLE `surat_suratkeluarmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_suratkeluarmod_nomor_surat_id_bef141af_fk_masterdat` (`nomor_surat_id`),
  ADD KEY `surat_suratkeluarmodel_user_id_cc53a013_fk_akun_usermodel_id` (`user_id`);

--
-- Indexes for table `surat_suratmasukmodel`
--
ALTER TABLE `surat_suratmasukmodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_suratmasukmodel_user_id_36c84d1d_fk_akun_usermodel_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun_usermodel`
--
ALTER TABLE `akun_usermodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `akun_usermodel_groups`
--
ALTER TABLE `akun_usermodel_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `akun_usermodel_user_permissions`
--
ALTER TABLE `akun_usermodel_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `masterdata_bagianmasalahmodel`
--
ALTER TABLE `masterdata_bagianmasalahmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `masterdata_balaimodel`
--
ALTER TABLE `masterdata_balaimodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `masterdata_klasifikasimodel`
--
ALTER TABLE `masterdata_klasifikasimodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `masterdata_masalahpokokmodel`
--
ALTER TABLE `masterdata_masalahpokokmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `masterdata_sukumasalahmodel`
--
ALTER TABLE `masterdata_sukumasalahmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_suratkeluarmodel`
--
ALTER TABLE `surat_suratkeluarmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_suratmasukmodel`
--
ALTER TABLE `surat_suratmasukmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun_usermodel_groups`
--
ALTER TABLE `akun_usermodel_groups`
  ADD CONSTRAINT `akun_usermodel_groups_group_id_102f26d8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `akun_usermodel_groups_usermodel_id_61e2596f_fk_akun_usermodel_id` FOREIGN KEY (`usermodel_id`) REFERENCES `akun_usermodel` (`id`);

--
-- Constraints for table `akun_usermodel_user_permissions`
--
ALTER TABLE `akun_usermodel_user_permissions`
  ADD CONSTRAINT `akun_usermodel_user__permission_id_1ba1f5fd_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `akun_usermodel_user__usermodel_id_006d80e2_fk_akun_user` FOREIGN KEY (`usermodel_id`) REFERENCES `akun_usermodel` (`id`);

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_akun_usermodel_id` FOREIGN KEY (`user_id`) REFERENCES `akun_usermodel` (`id`);

--
-- Constraints for table `masterdata_bagianmasalahmodel`
--
ALTER TABLE `masterdata_bagianmasalahmodel`
  ADD CONSTRAINT `masterdata_bagianmas_masalahpokok_id_e52d8f3a_fk_masterdat` FOREIGN KEY (`masalahpokok_id`) REFERENCES `masterdata_masalahpokokmodel` (`id`);

--
-- Constraints for table `masterdata_masalahpokokmodel`
--
ALTER TABLE `masterdata_masalahpokokmodel`
  ADD CONSTRAINT `masterdata_masalahpo_klasifikasi_id_2330aa1b_fk_masterdat` FOREIGN KEY (`klasifikasi_id`) REFERENCES `masterdata_klasifikasimodel` (`id`);

--
-- Constraints for table `masterdata_sukumasalahmodel`
--
ALTER TABLE `masterdata_sukumasalahmodel`
  ADD CONSTRAINT `masterdata_sukumasal_bagianmasalah_id_339f312e_fk_masterdat` FOREIGN KEY (`bagianmasalah_id`) REFERENCES `masterdata_bagianmasalahmodel` (`id`);

--
-- Constraints for table `surat_suratkeluarmodel`
--
ALTER TABLE `surat_suratkeluarmodel`
  ADD CONSTRAINT `surat_suratkeluarmod_nomor_surat_id_bef141af_fk_masterdat` FOREIGN KEY (`nomor_surat_id`) REFERENCES `masterdata_sukumasalahmodel` (`id`),
  ADD CONSTRAINT `surat_suratkeluarmodel_user_id_cc53a013_fk_akun_usermodel_id` FOREIGN KEY (`user_id`) REFERENCES `akun_usermodel` (`id`);

--
-- Constraints for table `surat_suratmasukmodel`
--
ALTER TABLE `surat_suratmasukmodel`
  ADD CONSTRAINT `surat_suratmasukmodel_user_id_36c84d1d_fk_akun_usermodel_id` FOREIGN KEY (`user_id`) REFERENCES `akun_usermodel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
