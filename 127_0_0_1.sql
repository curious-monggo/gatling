-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2020 at 08:37 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gatling`
--
CREATE DATABASE IF NOT EXISTS `gatling` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gatling`;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `infusionsoft_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `code`, `infusionsoft_key`) VALUES
(7, 'lf465 TravelJolly RJ Randall', 'lf465', 'c157e1313f98335fbdadf8f125d7b187'),
(8, ' xa403 - Essence of Healing - Lars Gustafsson', 'xa403', '4c282bc5b3afcdf608e2f6d6d46ca8a3d8411b21223b6432c5a33619a70e67ea'),
(9, 'GatlingAi', 'G150', 'cmv94v.vdm4--vv2f');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'test@test.com', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `hogwarts`
--
CREATE DATABASE IF NOT EXISTS `hogwarts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hogwarts`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`id`, `first_name`, `last_name`, `course`) VALUES
(1, 'Jus', 'Moj', 'IT'),
(2, 'Justine', 'Mojal', 'IT'),
(3, 'test', 'test', 'test'),
(4, 'Jude', 'POGI', 'IT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `infusionsoft_api`
--
CREATE DATABASE IF NOT EXISTS `infusionsoft_api` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `infusionsoft_api`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, 'test', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa', 'test@test.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'tj', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"contents\",\"forms\",\"sheets\",\"sheet_types\"],\"table_structure[]\":[\"contents\",\"forms\",\"sheets\",\"sheet_types\"],\"table_data[]\":[\"contents\",\"forms\",\"sheets\",\"sheet_types\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'sabri', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"answers\",\"choices\",\"codes\",\"questions\",\"users2\"],\"table_structure[]\":[\"answers\",\"choices\",\"codes\",\"questions\",\"users2\"],\"table_data[]\":[\"answers\",\"choices\",\"codes\",\"questions\",\"users2\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'users2', 'table', 'sabri', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"gatling\",\"table\":\"companies\"},{\"db\":\"infusionsoft_api\",\"table\":\"users\"},{\"db\":\"sabri\",\"table\":\"codes\"},{\"db\":\"sabri\",\"table\":\"choices\"},{\"db\":\"sabri\",\"table\":\"answers\"},{\"db\":\"sabri\",\"table\":\"questions\"},{\"db\":\"sabri\",\"table\":\"users2\"},{\"db\":\"travel_jolly\",\"table\":\"answers\"},{\"db\":\"travel_jolly\",\"table\":\"form_entries\"},{\"db\":\"travel_jolly\",\"table\":\"sheets\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'sabri', 'users2', '{\"sorted_col\":\"`id_user`  ASC\"}', '2019-12-31 16:26:29'),
('root', 'travel_jolly', 'contents', '{\"sorted_col\":\"`content_id` ASC\"}', '2019-08-26 11:50:10'),
('root', 'travel_jolly', 'sheets', '{\"sorted_col\":\"`sheets`.`sheet_order` ASC\"}', '2019-08-26 12:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-01-14 07:36:41', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":160}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `sabri`
--
CREATE DATABASE IF NOT EXISTS `sabri` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sabri`;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `choice_id` int(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `question_id` int(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`choice_id`, `text`, `img_url`, `question_id`, `created_at`) VALUES
(1, 'Lysosome', 'https://previews.123rf.com/images/gritsalak/gritsalak1809/gritsalak180900046/108186444-lysosome-hydrolytic-enzymes-and-membrane-cell-vector-anatomy-concept.jpg', 1, '2019-12-29 00:00:00'),
(2, 'Chromatin', 'https://www.genome.gov/sites/default/files/tg/en/illustration/chromatin.jpg', 1, '2019-12-29 00:00:00'),
(3, 'Mitochondria', 'https://www.news-medical.net/image.axd?picture=2018%2f4%2fshutterstock_By_Wire_man.jpg&ts=20180410053715&ri=673', 1, '2019-12-29 00:00:00'),
(4, 'Gravity', '', 2, '2019-12-30 00:00:00'),
(5, 'Air pressure', '', 2, '2019-12-30 00:00:00'),
(6, 'a', '', 3, '2019-12-30 00:00:00'),
(7, 'b', '', 3, '2019-12-30 00:00:00'),
(8, 'a', '', 4, '2019-12-30 00:00:00'),
(9, 'b', '', 4, '2019-12-30 00:00:00'),
(10, 'a', '', 5, '2019-12-30 00:00:00'),
(11, 'b', '', 5, '2019-12-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `code_id` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`code_id`, `code`, `user_id`, `is_available`, `created_at`) VALUES
(24, '130397', 4, 0, '2019-12-31 22:44:40'),
(25, '342772', 4, 0, '2019-12-31 23:03:53'),
(26, '739337', 4, 0, '2019-12-31 23:05:40'),
(27, '258229', 4, 0, '2019-12-31 23:09:36'),
(28, '113914', 4, 0, '2019-12-31 23:12:02'),
(29, '609461', 4, 0, '2019-12-31 23:16:13'),
(30, '892878', 7, 0, '2020-01-01 00:29:37'),
(31, '583074', 4, 0, '2020-01-01 16:51:55'),
(32, '108910', 4, 0, '2020-01-01 16:56:09'),
(33, '936554', 4, 0, '2020-01-01 17:47:57'),
(34, '567855', 4, 0, '2020-01-01 18:04:42'),
(35, '761341', 4, 0, '2020-01-01 18:13:58'),
(36, '552479', 4, 0, '2020-01-01 18:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `code`, `text`, `img_url`, `video_url`, `created_at`) VALUES
(1, 'code', 'What is the powerhouse of the cell?', 'https://cdn-prod.medicalnewstoday.com/content/images/articles/320/320875/a-basic-diagram-of-a-mitochondrion.jpg', 'https://www.youtube.com/embed/URUJD5NEXC8', '2019-12-29 00:00:00'),
(2, 'code1', 'What is the force that attracts a body toward the center of the earth, or toward any other physical body having mass?', 'https://image.sciencenordic.com/1453753.jpg?imageId=1453753&width=1058&height=604', 'https://www.youtube.com/embed/da4W30vOWpI', '2019-12-30 00:00:00'),
(3, 'code2', 'question 2?', 'https://proprofs-cdn.s3.amazonaws.com/images/FC/user_images/misc/9399094745.png', '', '2019-12-30 00:00:00'),
(4, 'code3', 'question 3?', 'http://proprofs-cdn.s3.amazonaws.com/images/FC/user_images/misc/6961475173.png', '', '2019-12-30 00:00:00'),
(5, 'code4', 'question 4?', 'https://proprofs-cdn.s3.amazonaws.com/images/FC/user_images/misc/4603655179.png', '', '2019-12-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users2`
--

CREATE TABLE `users2` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users2`
--

INSERT INTO `users2` (`id_user`, `first_name`, `last_name`, `phone`, `occupation`, `address`, `city`, `gender`, `email`, `password`, `created_at`) VALUES
(1, 'wedad', 'w', 'w', 'it', 'jeddah', 'jed', 'f', 'wedad.makki@uniscripts.co', 'd41d8cd98f00b204e9800998ecf8427e', '2019-12-10 12:08:30'),
(3, 'test', 'test', '0565216772', 'it', 'Al zahraa', 'jed', 'f', 'esraazwawi@uniscripts.co', '202cb962ac59075b964b07152d234b70', '2019-12-18 11:39:26'),
(4, 'Justine test', 'Mojal', '091700010001', 'it', 'Puerto Princesa ', 'jed', 'm', 'ilance.mojal@gmail.com', '098f6bcd4621d373cade4e832627b4f6', '2019-12-28 23:28:53'),
(7, 'leo t2', '1', '1', 'bus', 'a', 'riy', 'm', 'lmojal4@gmail.com', '098f6bcd4621d373cade4e832627b4f6', '2020-01-01 00:00:17'),
(10, 'c', 'c', 'c', 'it', 'c', 'riy', 'm', 'c', '4a8a08f09d37b73795649038408b5f33', '2020-01-01 00:26:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`choice_id`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`code_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `users2`
--
ALTER TABLE `users2`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `choices`
--
ALTER TABLE `choices`
  MODIFY `choice_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `code_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users2`
--
ALTER TABLE `users2`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `travel_jolly`
--
CREATE DATABASE IF NOT EXISTS `travel_jolly` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `travel_jolly`;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `form_entry_id` int(11) NOT NULL,
  `sheet_id` int(11) NOT NULL,
  `answer_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `content_id` int(11) NOT NULL,
  `content_text` varchar(255) NOT NULL,
  `content_image` varchar(255) NOT NULL,
  `content_order` int(11) NOT NULL,
  `sheet_type_id` int(11) NOT NULL,
  `sheet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`content_id`, `content_text`, `content_image`, `content_order`, `sheet_type_id`, `sheet_id`) VALUES
(1, 'About A Month Ago', '', 1, 2, 2),
(2, 'Less Than 4 Months Ago', '', 2, 2, 2),
(3, 'It\'s Been More Than 6 Months', '', 3, 2, 2),
(7, 'Visiting A Theme Park', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/visiting-a-theme-park.jpg', 1, 3, 4),
(8, 'All Inclusive Beachfront Getaway', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/all-inclusive-beachfront-getaway.jpg', 2, 3, 4),
(9, 'Outdoor Adventure', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/outdoor-adventure.jpg', 3, 3, 4),
(10, 'Discovering A Big City', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/discovering-a-big-city.jpg', 4, 3, 4),
(11, 'Cancun MX', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/cancun-mx.jpg', 1, 3, 5),
(12, 'Orlando FL', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/orlando-fl.jpg', 2, 3, 5),
(13, 'Add Your Dream Destination Here', '', 3, 4, 5),
(14, 'Family Experience', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/family-experience.jpg', 1, 2, 6),
(15, 'Couples Getaway', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/couples-getaway.jpg', 2, 2, 6),
(16, 'Hopefully A Bit Of Both', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/hopefully-a-bit-of-both.jpg', 3, 2, 6),
(17, 'Me +1', '', 1, 2, 7),
(18, 'Up To 4', '', 2, 2, 7),
(19, '5 or More', '', 3, 2, 7),
(20, 'Creating A Birthday', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/creating-a-birthday.jpg', 1, 2, 8),
(21, 'It\'s My Anniversary', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/its-my-anniversarry.jpg', 2, 2, 8),
(22, 'It\'s Been Way Too Long Since My Last Vacation', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/its-been-way-too-long-since-my-last-vacation.jpg', 3, 2, 8),
(23, 'Creating Great Memories', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/creating-great-memories.jpg', 4, 2, 8),
(24, 'Other', '', 5, 2, 8),
(25, '1', '', 1, 6, 9),
(26, '2', '', 2, 6, 9),
(27, '3', '', 3, 6, 9),
(28, '4', '', 4, 6, 9),
(29, '5', '', 5, 6, 9),
(30, '6', '', 6, 6, 9),
(31, '7', '', 7, 6, 9),
(32, '8', '', 8, 6, 9),
(33, '9', '', 9, 6, 9),
(34, '10', '', 10, 6, 9),
(35, '11', '', 11, 6, 9),
(36, 'Facebook', '', 1, 3, 10),
(37, 'Twitter', '', 2, 3, 10),
(38, 'I Work Full Time or Part Time', '', 1, 2, 11),
(39, 'Self Employed', '', 2, 2, 11),
(40, 'Serving In The Military', '', 3, 2, 11),
(41, 'Unemployed or Full Time Student', '', 4, 2, 11),
(42, 'Retired', '', 5, 2, 11),
(43, 'Stay At Home Parent', '', 6, 2, 11),
(44, 'Other', '', 7, 2, 11),
(45, 'Within The Next 30 Days Would Be Great!', '', 1, 2, 12),
(46, 'I Need About 3 Months To Plan', '', 2, 2, 12),
(47, 'Please Leave It Open For 6 Months +', '', 3, 2, 12),
(48, 'Morning 9:00-11 AM', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/morning.jpg', 1, 2, 13),
(49, 'Afternoon 12:00-5 PM', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/afternoon.jpg', 2, 2, 13),
(50, 'Evenings 5:30-9 PM', 'https://www.traveljolly.com/community-dashboard/wp-content/uploads/2019/08/evening.jpg', 3, 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `form_id` int(11) NOT NULL,
  `form_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`form_id`, `form_name`) VALUES
(1, 'SurveyForm1');

-- --------------------------------------------------------

--
-- Table structure for table `form_entries`
--

CREATE TABLE `form_entries` (
  `form_entry_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sheets`
--

CREATE TABLE `sheets` (
  `sheet_id` int(11) NOT NULL,
  `sheet_title` varchar(255) NOT NULL,
  `sheet_subtitle` varchar(255) NOT NULL,
  `sheet_order` int(11) DEFAULT NULL,
  `form_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sheets`
--

INSERT INTO `sheets` (`sheet_id`, `sheet_title`, `sheet_subtitle`, `sheet_order`, `form_id`) VALUES
(1, 'TravelJolly welcomes you ~FirstName~ ~LastName~!', 'Let us pay for your trip or at least part of it!', 1, 1),
(2, 'When Was The Last Time You Went On Vacation?', '', 2, 1),
(4, 'That’s Great ~FirstName~, So you definitely know the importance of a well deserved vacation!', 'It’s nice to meet you and would be a pleasure to tell us, what does your ideal vacation look like?', 3, 1),
(5, 'Which of these destinations would you be interested in traveling too?', 'Do NOT hold back! Where are your dream destinations?\r\nIf you do NOT see them add them!', 4, 1),
(6, 'You and your guests are going to have an amazing time ~FirstName~!', 'Are you dreaming of a family experience or a couple’s getaway?', 5, 1),
(7, 'How many guests will you be bringing?', 'We just need to know so we can accommodate you better.', 6, 1),
(8, 'Is there a special occasion you would like to celebrate while on your dream holiday?', 'Maybe we can do something special for you and your guests ~FirstName~!', 7, 1),
(9, 'So ~FirstName~, how important do you feel vacations are?', '', 8, 1),
(10, 'Which Social Media Platforms do you use?', '', 9, 1),
(11, 'Which employment status describes you best?', 'Sorry ~FirstName~... Our marketing department makes us ask this question.', 10, 1),
(12, 'Within what time frame would you be ready to take your first holiday?', 'Whether or not you know your travel dates, it’s OK, there’s no rush. What is important is travel. Just let us know your planning time frame and we’ll do everything possible to make sure you experience that dream holiday you’ve always dreamed of!', 11, 1),
(13, 'What time generally works best for you should we feel the need to talk you?\r\nThere is never ever any pressure!', 'We would be calling just to help with tips, tricks, or reminders.\r\n\r\nEverything cannot be automated. We want to help you in any way possible and a little conversation occasionally can go a long way!\r\n\r\nYou do not have to buy anything we promise. We just w', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sheet_types`
--

CREATE TABLE `sheet_types` (
  `sheet_type_id` int(11) NOT NULL,
  `sheet_type_name` varchar(255) NOT NULL,
  `sheet_other_input` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sheet_types`
--

INSERT INTO `sheet_types` (`sheet_type_id`, `sheet_type_name`, `sheet_other_input`) VALUES
(1, 'Declarative', 0),
(2, 'Radio', 0),
(3, 'Checkbox', 0),
(4, 'Checkbox', 1),
(5, 'Radio', 1),
(6, 'SpecialRadio', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`form_id`);

--
-- Indexes for table `form_entries`
--
ALTER TABLE `form_entries`
  ADD PRIMARY KEY (`form_entry_id`);

--
-- Indexes for table `sheets`
--
ALTER TABLE `sheets`
  ADD PRIMARY KEY (`sheet_id`);

--
-- Indexes for table `sheet_types`
--
ALTER TABLE `sheet_types`
  ADD PRIMARY KEY (`sheet_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `form_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `form_entries`
--
ALTER TABLE `form_entries`
  MODIFY `form_entry_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sheets`
--
ALTER TABLE `sheets`
  MODIFY `sheet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sheet_types`
--
ALTER TABLE `sheet_types`
  MODIFY `sheet_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
