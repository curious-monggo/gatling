-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2020 at 11:40 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

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
(2, 'Travel Jolly', 'TJ 499', 'ACYBGNSSFicTjbVU4KrOtkw-BWpFrad2tw%3A1578710766891'),
(3, 'Gatling', 'Gat360', '0ahUKEwjL0djzw_rmAhVUa94KHft1B7EQ4dUDCAU'),
(5, 'Leona', 'LMM', 'Ksoackwkzi3439846-b'),
(6, 'Company dec', 'abc', '12453476rtfddfghe56534wtyttdg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
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
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
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
(1, 'root', 'server', 'gatling', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"gatling\",\"hogwarts\",\"phpmyadmin\",\"test\",\"testing\",\"tj_reports\",\"traveljolly\",\"webprog\",\"wordpress\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

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
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
('root', '[{\"db\":\"gatling\",\"table\":\"companies\"},{\"db\":\"gatling\",\"table\":\"users\"},{\"db\":\"gatling\",\"table\":\"user\"},{\"db\":\"hogwarts\",\"table\":\"tbl_student\"},{\"db\":\"webprog\",\"table\":\"tbl_student\"},{\"db\":\"traveljolly\",\"table\":\"leads\"},{\"db\":\"traveljolly\",\"table\":\"csv_upload\"},{\"db\":\"traveljolly\",\"table\":\"companies\"},{\"db\":\"testing\",\"table\":\"tj_test_table\"},{\"db\":\"testing\",\"table\":\"tbl_student\"}]');

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
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
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
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

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
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-01-13 10:39:19', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":179}');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `testing`
--
CREATE DATABASE IF NOT EXISTS `testing` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `testing`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(250) NOT NULL,
  `student_phone` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `student_name`, `student_phone`, `image`) VALUES
(1, 'Justine Lance T Mojal', ' 934-545-234', ''),
(2, 'Val Ivan P. Curada', ' 945-153-3435', ''),
(3, 'Altair Bantilan', ' 944-147-234', '');

-- --------------------------------------------------------

--
-- Table structure for table `tj_test_table`
--

CREATE TABLE `tj_test_table` (
  `id` int(25) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone_1` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tj_test_table`
--
ALTER TABLE `tj_test_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tj_test_table`
--
ALTER TABLE `tj_test_table`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;
--
-- Database: `tj_reports`
--
CREATE DATABASE IF NOT EXISTS `tj_reports` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tj_reports`;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(11) NOT NULL,
  `tj_timestamp` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `amount` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`id`, `tj_timestamp`, `email`, `amount`) VALUES
(1, 1546268431, 'ilance.mojal@gmail.com', 0),
(2, 1546268817, 'fiona@gmail.com', 10);

-- --------------------------------------------------------

--
-- Table structure for table `finance`
--

CREATE TABLE `finance` (
  `column_id` int(255) NOT NULL,
  `column_1` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `finance`
--

INSERT INTO `finance` (`column_id`, `column_1`) VALUES
(1, 350),
(2, 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance`
--
ALTER TABLE `finance`
  ADD PRIMARY KEY (`column_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `finance`
--
ALTER TABLE `finance`
  MODIFY `column_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `traveljolly`
--
CREATE DATABASE IF NOT EXISTS `traveljolly` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `traveljolly`;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `rid` int(25) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`rid`, `name`) VALUES
(1, 'Mojal Technologies'),
(2, 'Mojal Biology');

-- --------------------------------------------------------

--
-- Table structure for table `csv_upload`
--

CREATE TABLE `csv_upload` (
  `rid` int(25) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `datetime_uploaded` datetime(6) NOT NULL,
  `lead_type_rid` int(25) NOT NULL,
  `company_rid` int(25) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csv_upload`
--

INSERT INTO `csv_upload` (`rid`, `filename`, `datetime_uploaded`, `lead_type_rid`, `company_rid`, `status`) VALUES
(7, 'test.csv', '2019-05-29 16:00:55.000000', 1, 1, 'Processed'),
(8, 'test_5_leo_may_22.csv', '2019-05-30 00:17:08.000000', 2, 2, 'Processed');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `rid` int(25) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_1` varchar(200) NOT NULL,
  `status` varchar(25) NOT NULL,
  `company_rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`rid`, `first_name`, `last_name`, `email`, `phone_1`, `status`, `company_rid`) VALUES
(150, 'Susannetest', 'Berry', '', '1.91438E+11', 'Unprocessed', 2),
(151, 'Ashleytest', 'Luce', 'ashash8581@gmail.com', '1.5187E+11', 'Unprocessed', 2),
(152, 'Jamietest', 'Bierbaum', 'jmeb951@yahoo.com', '1.90857E+11', 'Unprocessed', 2),
(153, 'Sheraintest', 'Rivera', 'sherainfonder1@yahoo.com', '1.51842E+11', 'Unprocessed', 2),
(154, 'Marthatest', 'Tsuchiya', '', '1.64684E+11', 'Unprocessed', 2),
(155, 'Samanthatest', 'Mcgriff', 'samanthashakesnider1@gmail.com', '1.84542E+11', 'Unprocessed', 2),
(156, 'Ritatest', 'Haynes', 'ritachaynes661@gmail.com', '1.84554E+11', 'Unprocessed', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `csv_upload`
--
ALTER TABLE `csv_upload`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`rid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `rid` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `csv_upload`
--
ALTER TABLE `csv_upload`
  MODIFY `rid` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `rid` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- Database: `webprog`
--
CREATE DATABASE IF NOT EXISTS `webprog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `webprog`;

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
(1, 'Aldwin', 'Gabuna', 'Information Technology');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-01-19 09:30:22', '2019-01-19 09:30:22', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0),
(2, 52, 'ilancemojal', 'ilance.mojal@gmail.com', '', '::1', '2019-01-29 05:15:16', '2019-01-29 05:15:16', 'Niceee', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wp/wordpress', 'yes'),
(2, 'home', 'http://localhost/wp/wordpress', 'yes'),
(3, 'blogname', 'TravelJolly', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'ilance.mojal@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/index.php/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:89:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:57:\"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:45:\"index.php/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:54:\"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:49:\"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:30:\"index.php/tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:42:\"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:24:\"index.php/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:55:\"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:50:\"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:31:\"index.php/type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:43:\"index.php/type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:25:\"index.php/type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:42:\"index.php/feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:37:\"index.php/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:18:\"index.php/embed/?$\";s:21:\"index.php?&embed=true\";s:30:\"index.php/page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:51:\"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:46:\"index.php/comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:27:\"index.php/comments/embed/?$\";s:21:\"index.php?&embed=true\";s:54:\"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:49:\"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:30:\"index.php/search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:42:\"index.php/search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:24:\"index.php/search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:57:\"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:45:\"index.php/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:79:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:55:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:49:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:66:\"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:42:\"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:54:\"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:36:\"index.php/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:53:\"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:48:\"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:29:\"index.php/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:41:\"index.php/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:23:\"index.php/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:68:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:78:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:98:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:74:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:87:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:75:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:71:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:57:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:67:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:87:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:63:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:48:\"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:37:\"index.php/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"index.php/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"index.php/.?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"index.php/(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:30:\"index.php/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:50:\"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:45:\"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:38:\"index.php/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:45:\"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:34:\"index.php/(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:25:\"shortcoder/shortcoder.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:75:\"C:\\xampp\\htdocs\\wp\\wordpress/wp-content/themes/twentynineteen/functions.php\";i:2;s:71:\"C:\\xampp\\htdocs\\wp\\wordpress/wp-content/themes/twentynineteen/style.css\";i:3;s:72:\"C:\\xampp\\htdocs\\wp\\wordpress/wp-content/themes/twentynineteen/footer.php\";i:4;s:67:\"C:\\xampp\\htdocs\\wp\\wordpress/wp-content/themes/storefront/style.css\";i:5;s:68:\"C:\\xampp\\htdocs\\wp\\wordpress/wp-content/themes/traveljolly/style.css\";}', 'no'),
(40, 'template', 'twentynineteen', 'yes'),
(41, 'stylesheet', 'twentynineteen', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '43764', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '43764', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'cron', 'a:5:{i:1571877025;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1571909425;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1571909781;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1571912957;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(112, 'theme_mods_twentynineteen', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1548681946;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}s:18:\"nav_menu_locations\";a:0:{}}', 'yes'),
(121, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.3-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.0.3\";s:7:\"version\";s:5:\"5.0.3\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1571873414;s:15:\"version_checked\";s:5:\"5.0.3\";s:12:\"translations\";a:0:{}}', 'no'),
(123, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:22:\"ilance.mojal@gmail.com\";s:7:\"version\";s:5:\"5.0.3\";s:9:\"timestamp\";i:1547890272;}', 'no'),
(129, 'can_compress_scripts', '1', 'no'),
(142, 'theme_mods_traveljolly', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1548681722;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(143, 'current_theme', 'Twenty Nineteen', 'yes'),
(144, 'theme_switched', '', 'yes'),
(145, 'theme_switched_via_customizer', '', 'yes'),
(146, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(150, 'nav_menu_options', 'a:1:{s:8:\"auto_add\";a:0:{}}', 'yes'),
(168, 'category_children', 'a:0:{}', 'yes'),
(210, 'theme_mods_storefront', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1548682013;s:4:\"data\";a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:8:\"header-1\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}}}}', 'yes'),
(211, 'storefront_nux_fresh_site', '0', 'yes'),
(213, 'storefront_nux_dismissed', '1', 'yes'),
(229, 'recently_activated', 'a:0:{}', 'yes'),
(234, 'shortcoder_flags', 'a:1:{s:7:\"version\";s:3:\"4.3\";}', 'yes'),
(259, 'shortcoder_data', 'a:1:{s:13:\"logHelloWorld\";a:6:{s:7:\"content\";s:49:\"<script>\r\nconsole.log(\'Hello World!\');\r\n</script>\";s:8:\"disabled\";i:0;s:10:\"hide_admin\";i:0;s:7:\"devices\";s:3:\"all\";s:6:\"editor\";s:4:\"text\";s:4:\"tags\";a:0:{}}}', 'yes'),
(314, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1571873418;s:7:\"checked\";a:5:{s:10:\"storefront\";s:5:\"2.4.2\";s:11:\"traveljolly\";s:3:\"0.1\";s:14:\"twentynineteen\";s:3:\"1.1\";s:15:\"twentyseventeen\";s:3:\"1.9\";s:13:\"twentysixteen\";s:3:\"1.7\";}s:8:\"response\";a:4:{s:10:\"storefront\";a:4:{s:5:\"theme\";s:10:\"storefront\";s:11:\"new_version\";s:5:\"2.4.3\";s:3:\"url\";s:40:\"https://wordpress.org/themes/storefront/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/storefront.2.4.3.zip\";}s:14:\"twentynineteen\";a:4:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.2.zip\";}s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.0.zip\";}s:13:\"twentysixteen\";a:4:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"1.8\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.1.8.zip\";}}s:12:\"translations\";a:0:{}}', 'no'),
(315, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1571873416;s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:3:\"4.1\";s:9:\"hello.php\";s:5:\"1.7.1\";s:25:\"shortcoder/shortcoder.php\";s:3:\"4.3\";}s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.0.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:25:\"shortcoder/shortcoder.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/shortcoder\";s:4:\"slug\";s:10:\"shortcoder\";s:6:\"plugin\";s:25:\"shortcoder/shortcoder.php\";s:11:\"new_version\";s:3:\"4.3\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/shortcoder/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/shortcoder.4.3.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:63:\"https://ps.w.org/shortcoder/assets/icon-256x256.png?rev=1667321\";s:2:\"1x\";s:55:\"https://ps.w.org/shortcoder/assets/icon.svg?rev=1667321\";s:3:\"svg\";s:55:\"https://ps.w.org/shortcoder/assets/icon.svg?rev=1667321\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/shortcoder/assets/banner-772x250.png?rev=1667321\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(320, '_site_transient_timeout_theme_roots', '1571875217', 'no'),
(321, '_site_transient_theme_roots', 'a:5:{s:10:\"storefront\";s:7:\"/themes\";s:11:\"traveljolly\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(46, 2, '_edit_lock', '1547981187:1'),
(47, 16, '_edit_lock', '1547980476:1'),
(48, 18, '_edit_lock', '1547980337:1'),
(51, 20, '_edit_lock', '1548003691:1'),
(96, 33, '_menu_item_type', 'post_type'),
(97, 33, '_menu_item_menu_item_parent', '0'),
(98, 33, '_menu_item_object_id', '20'),
(99, 33, '_menu_item_object', 'page'),
(100, 33, '_menu_item_target', ''),
(101, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(102, 33, '_menu_item_xfn', ''),
(103, 33, '_menu_item_url', ''),
(106, 35, '_menu_item_type', 'post_type'),
(107, 35, '_menu_item_menu_item_parent', '0'),
(108, 35, '_menu_item_object_id', '2'),
(109, 35, '_menu_item_object', 'page'),
(110, 35, '_menu_item_target', ''),
(111, 35, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(112, 35, '_menu_item_xfn', ''),
(113, 35, '_menu_item_url', ''),
(118, 39, '_edit_lock', '1549412715:1'),
(119, 40, '_wp_attached_file', '2019/01/hero_image.jpg'),
(120, 40, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2233;s:6:\"height\";i:1536;s:4:\"file\";s:22:\"2019/01/hero_image.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"hero_image-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"hero_image-300x206.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"hero_image-768x528.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:528;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"hero_image-1024x704.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:704;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:24:\"hero_image-1568x1079.jpg\";s:5:\"width\";i:1568;s:6:\"height\";i:1079;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(121, 41, '_wp_attached_file', '2019/01/photo-1.png'),
(122, 41, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(123, 42, '_wp_attached_file', '2019/01/photo-2.png'),
(124, 42, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-2.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(125, 43, '_wp_attached_file', '2019/01/photo-3.png'),
(126, 43, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-3.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(127, 44, '_wp_attached_file', '2019/01/photo-4.png'),
(128, 44, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-4.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(129, 45, '_wp_attached_file', '2019/01/photo-5.png'),
(130, 45, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-5.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-5-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(131, 46, '_wp_attached_file', '2019/01/photo-6.png'),
(132, 46, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-6.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-6-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(133, 47, '_wp_attached_file', '2019/01/photo-7.png'),
(134, 47, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-7.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-7-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(135, 48, '_wp_attached_file', '2019/01/photo-9.png'),
(136, 48, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-9.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-9-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(137, 49, '_wp_attached_file', '2019/01/photo-10.png'),
(138, 49, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:20:\"2019/01/photo-10.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"photo-10-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(140, 52, '_edit_lock', '1548682125:1'),
(141, 53, '_wp_attached_file', '2019/01/hero_image-1.jpg'),
(142, 53, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2233;s:6:\"height\";i:1536;s:4:\"file\";s:24:\"2019/01/hero_image-1.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"hero_image-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"hero_image-1-300x206.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:24:\"hero_image-1-768x528.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:528;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:25:\"hero_image-1-1024x704.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:704;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:26:\"hero_image-1-1568x1079.jpg\";s:5:\"width\";i:1568;s:6:\"height\";i:1079;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(143, 54, '_wp_attached_file', '2019/01/photo-1-1.png'),
(144, 54, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-1-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-1-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(145, 55, '_wp_attached_file', '2019/01/photo-2-1.png'),
(146, 55, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-2-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-2-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(147, 56, '_wp_attached_file', '2019/01/photo-3-1.png'),
(148, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-3-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-3-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(149, 57, '_wp_attached_file', '2019/01/photo-4-1.png'),
(150, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-4-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-4-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(151, 58, '_wp_attached_file', '2019/01/photo-5-1.png'),
(152, 58, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-5-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-5-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(153, 59, '_wp_attached_file', '2019/01/photo-6-1.png'),
(154, 59, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-6-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-6-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(155, 60, '_wp_attached_file', '2019/01/photo-7-1.png'),
(156, 60, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-7-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-7-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(157, 61, '_wp_attached_file', '2019/01/photo-8.png'),
(158, 61, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:19:\"2019/01/photo-8.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-8-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(159, 62, '_wp_attached_file', '2019/01/photo-9-1.png'),
(160, 62, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:21:\"2019/01/photo-9-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"photo-9-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(161, 63, '_wp_attached_file', '2019/01/photo-10-1.png'),
(162, 63, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:22:\"2019/01/photo-10-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"photo-10-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(163, 64, '_wp_attached_file', '2019/01/photo-11.png'),
(164, 64, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:260;s:4:\"file\";s:20:\"2019/01/photo-11.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"photo-11-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(166, 77, '_edit_lock', '1549413583:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-01-19 09:30:22', '2019-01-19 09:30:22', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2019-01-19 09:30:22', '2019-01-19 09:30:22', '', 0, 'http://localhost/wp/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2019-01-19 09:30:22', '2019-01-19 09:30:22', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wp/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sampls', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2019-01-20 10:27:48', '2019-01-20 10:27:48', '', 0, 'http://localhost/wp/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-01-19 09:30:22', '2019-01-19 09:30:22', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost/wp/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2019-01-19 09:30:22', '2019-01-19 09:30:22', '', 0, 'http://localhost/wp/wordpress/?page_id=3', 0, 'page', '', 0),
(15, 1, '2019-01-20 10:27:48', '2019-01-20 10:27:48', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wp/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sampls', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-01-20 10:27:48', '2019-01-20 10:27:48', '', 2, 'http://localhost/wp/wordpress/index.php/2019/01/20/2-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2019-01-20 10:29:50', '2019-01-20 10:29:50', '<!-- wp:paragraph -->\n<p>Hi there, from test 1</p>\n<!-- /wp:paragraph -->', 'Test 1 of dynamic', '', 'publish', 'closed', 'closed', '', 'test-1-of-dynamic', '', '', '2019-01-20 10:29:50', '2019-01-20 10:29:50', '', 0, 'http://localhost/wp/wordpress/?page_id=16', 0, 'page', '', 0),
(17, 1, '2019-01-20 10:29:50', '2019-01-20 10:29:50', '<!-- wp:paragraph -->\n<p>Hi there, from test 1</p>\n<!-- /wp:paragraph -->', 'Test 1 of dynamic', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2019-01-20 10:29:50', '2019-01-20 10:29:50', '', 16, 'http://localhost/wp/wordpress/index.php/2019/01/20/16-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2019-01-20 10:34:31', '2019-01-20 10:34:31', '<!-- wp:paragraph -->\n<p>fdfdf</p>\n<!-- /wp:paragraph -->', 'test 2', '', 'publish', 'open', 'open', '', 'test-2', '', '', '2019-01-20 10:34:31', '2019-01-20 10:34:31', '', 0, 'http://localhost/wp/wordpress/?p=18', 0, 'post', '', 0),
(19, 1, '2019-01-20 10:34:31', '2019-01-20 10:34:31', '<!-- wp:paragraph -->\n<p>fdfdf</p>\n<!-- /wp:paragraph -->', 'test 2', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2019-01-20 10:34:31', '2019-01-20 10:34:31', '', 18, 'http://localhost/wp/wordpress/index.php/2019/01/20/18-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2019-01-20 10:37:24', '2019-01-20 10:37:24', '', 'Commisions', '', 'publish', 'closed', 'closed', '', 'commisions', '', '', '2019-01-20 10:37:24', '2019-01-20 10:37:24', '', 0, 'http://localhost/wp/wordpress/?page_id=20', 0, 'page', '', 0),
(21, 1, '2019-01-20 10:37:24', '2019-01-20 10:37:24', '', 'Commisions', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2019-01-20 10:37:24', '2019-01-20 10:37:24', '', 20, 'http://localhost/wp/wordpress/index.php/2019/01/20/20-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2019-01-20 10:58:45', '2019-01-20 10:58:45', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2019-01-20 10:58:45', '2019-01-20 10:58:45', '', 0, 'http://localhost/wp/wordpress/index.php/2019/01/20/33/', 1, 'nav_menu_item', '', 0),
(35, 1, '2019-01-20 10:59:24', '2019-01-20 10:59:24', ' ', '', '', 'publish', 'closed', 'closed', '', '35', '', '', '2019-01-20 10:59:24', '2019-01-20 10:59:24', '', 0, 'http://localhost/wp/wordpress/index.php/2019/01/20/35/', 1, 'nav_menu_item', '', 0),
(37, 1, '2019-01-20 11:56:24', '2019-01-20 11:56:24', '', 'Commisions', '', 'inherit', 'closed', 'closed', '', '20-autosave-v1', '', '', '2019-01-20 11:56:24', '2019-01-20 11:56:24', '', 20, 'http://localhost/wp/wordpress/index.php/2019/01/20/20-autosave-v1/', 0, 'revision', '', 0),
(39, 1, '2019-02-05 11:31:53', '2019-02-05 11:31:53', '<p>[leo_wp_current_email]</p>\n\n<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]</p>\n<p>[sayHi]</p>', 'A wonderful escapade', '', 'publish', 'closed', 'closed', '', 'a-wonderful-escapade', '', '', '2019-02-05 11:48:27', '2019-02-05 11:48:27', '', 0, 'http://localhost/wp/wordpress/?page_id=39', 0, 'page', '', 0),
(40, 1, '2019-01-28 13:24:48', '2019-01-28 13:24:48', '', 'hero_image', '', 'inherit', 'open', 'closed', '', 'hero_image', '', '', '2019-01-28 13:24:48', '2019-01-28 13:24:48', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image.jpg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2019-01-28 13:24:52', '2019-01-28 13:24:52', '', 'photo-1', '', 'inherit', 'open', 'closed', '', 'photo-1', '', '', '2019-01-28 13:24:52', '2019-01-28 13:24:52', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png', 0, 'attachment', 'image/png', 0),
(42, 1, '2019-01-28 13:24:52', '2019-01-28 13:24:52', '', 'photo-2', '', 'inherit', 'open', 'closed', '', 'photo-2', '', '', '2019-01-28 13:24:52', '2019-01-28 13:24:52', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png', 0, 'attachment', 'image/png', 0),
(43, 1, '2019-01-28 13:24:53', '2019-01-28 13:24:53', '', 'photo-3', '', 'inherit', 'open', 'closed', '', 'photo-3', '', '', '2019-01-28 13:24:53', '2019-01-28 13:24:53', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png', 0, 'attachment', 'image/png', 0),
(44, 1, '2019-01-28 13:24:54', '2019-01-28 13:24:54', '', 'photo-4', '', 'inherit', 'open', 'closed', '', 'photo-4', '', '', '2019-01-28 13:24:54', '2019-01-28 13:24:54', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png', 0, 'attachment', 'image/png', 0),
(45, 1, '2019-01-28 13:24:55', '2019-01-28 13:24:55', '', 'photo-5', '', 'inherit', 'open', 'closed', '', 'photo-5', '', '', '2019-01-28 13:24:55', '2019-01-28 13:24:55', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png', 0, 'attachment', 'image/png', 0),
(46, 1, '2019-01-28 13:24:55', '2019-01-28 13:24:55', '', 'photo-6', '', 'inherit', 'open', 'closed', '', 'photo-6', '', '', '2019-01-28 13:24:55', '2019-01-28 13:24:55', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png', 0, 'attachment', 'image/png', 0),
(47, 1, '2019-01-28 13:24:56', '2019-01-28 13:24:56', '', 'photo-7', '', 'inherit', 'open', 'closed', '', 'photo-7', '', '', '2019-01-28 13:24:56', '2019-01-28 13:24:56', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png', 0, 'attachment', 'image/png', 0),
(48, 1, '2019-01-28 13:24:57', '2019-01-28 13:24:57', '', 'photo-9', '', 'inherit', 'open', 'closed', '', 'photo-9', '', '', '2019-01-28 13:24:57', '2019-01-28 13:24:57', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png', 0, 'attachment', 'image/png', 0),
(49, 1, '2019-01-28 13:24:58', '2019-01-28 13:24:58', '', 'photo-10', '', 'inherit', 'open', 'closed', '', 'photo-10', '', '', '2019-01-28 13:24:58', '2019-01-28 13:24:58', '', 39, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-10.png', 0, 'attachment', 'image/png', 0),
(50, 1, '2019-01-28 13:25:25', '2019-01-28 13:25:25', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-01-28 13:25:25', '2019-01-28 13:25:25', '', 39, 'http://localhost/wp/wordpress/index.php/2019/01/28/39-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2019-01-28 13:31:04', '2019-01-28 13:31:04', '<!-- wp:gallery {\"ids\":[53,54,55,56,57,58,59,60,61,62,63,64],\"columns\":3} -->\n<ul class=\"wp-block-gallery columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1-1024x704.jpg\" alt=\"\" data-id=\"53\" data-link=\"http://localhost/wp/wordpress/?attachment_id=53\" class=\"wp-image-53\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1-1.png\" alt=\"\" data-id=\"54\" data-link=\"http://localhost/wp/wordpress/?attachment_id=54\" class=\"wp-image-54\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2-1.png\" alt=\"\" data-id=\"55\" data-link=\"http://localhost/wp/wordpress/?attachment_id=55\" class=\"wp-image-55\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3-1.png\" alt=\"\" data-id=\"56\" data-link=\"http://localhost/wp/wordpress/?attachment_id=56\" class=\"wp-image-56\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4-1.png\" alt=\"\" data-id=\"57\" data-link=\"http://localhost/wp/wordpress/?attachment_id=57\" class=\"wp-image-57\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5-1.png\" alt=\"\" data-id=\"58\" data-link=\"http://localhost/wp/wordpress/?attachment_id=58\" class=\"wp-image-58\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6-1.png\" alt=\"\" data-id=\"59\" data-link=\"http://localhost/wp/wordpress/?attachment_id=59\" class=\"wp-image-59\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7-1.png\" alt=\"\" data-id=\"60\" data-link=\"http://localhost/wp/wordpress/?attachment_id=60\" class=\"wp-image-60\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-8.png\" alt=\"\" data-id=\"61\" data-link=\"http://localhost/wp/wordpress/?attachment_id=61\" class=\"wp-image-61\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9-1.png\" alt=\"\" data-id=\"62\" data-link=\"http://localhost/wp/wordpress/?attachment_id=62\" class=\"wp-image-62\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-10-1.png\" alt=\"\" data-id=\"63\" data-link=\"http://localhost/wp/wordpress/?attachment_id=63\" class=\"wp-image-63\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-11.png\" alt=\"\" data-id=\"64\" data-link=\"http://localhost/wp/wordpress/?attachment_id=64\" class=\"wp-image-64\"/></figure></li></ul>\n<!-- /wp:gallery -->', 'Wonderful places', '', 'publish', 'open', 'open', '', 'wonderful-places', '', '', '2019-01-28 13:31:04', '2019-01-28 13:31:04', '', 0, 'http://localhost/wp/wordpress/?p=52', 0, 'post', '', 1),
(53, 1, '2019-01-28 13:30:28', '2019-01-28 13:30:28', '', 'hero_image', '', 'inherit', 'open', 'closed', '', 'hero_image-2', '', '', '2019-01-28 13:30:28', '2019-01-28 13:30:28', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(54, 1, '2019-01-28 13:30:31', '2019-01-28 13:30:31', '', 'photo-1', '', 'inherit', 'open', 'closed', '', 'photo-1-2', '', '', '2019-01-28 13:30:31', '2019-01-28 13:30:31', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1-1.png', 0, 'attachment', 'image/png', 0),
(55, 1, '2019-01-28 13:30:32', '2019-01-28 13:30:32', '', 'photo-2', '', 'inherit', 'open', 'closed', '', 'photo-2-2', '', '', '2019-01-28 13:30:32', '2019-01-28 13:30:32', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2-1.png', 0, 'attachment', 'image/png', 0),
(56, 1, '2019-01-28 13:30:33', '2019-01-28 13:30:33', '', 'photo-3', '', 'inherit', 'open', 'closed', '', 'photo-3-2', '', '', '2019-01-28 13:30:33', '2019-01-28 13:30:33', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3-1.png', 0, 'attachment', 'image/png', 0),
(57, 1, '2019-01-28 13:30:34', '2019-01-28 13:30:34', '', 'photo-4', '', 'inherit', 'open', 'closed', '', 'photo-4-2', '', '', '2019-01-28 13:30:34', '2019-01-28 13:30:34', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4-1.png', 0, 'attachment', 'image/png', 0),
(58, 1, '2019-01-28 13:30:35', '2019-01-28 13:30:35', '', 'photo-5', '', 'inherit', 'open', 'closed', '', 'photo-5-2', '', '', '2019-01-28 13:30:35', '2019-01-28 13:30:35', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5-1.png', 0, 'attachment', 'image/png', 0),
(59, 1, '2019-01-28 13:30:35', '2019-01-28 13:30:35', '', 'photo-6', '', 'inherit', 'open', 'closed', '', 'photo-6-2', '', '', '2019-01-28 13:30:35', '2019-01-28 13:30:35', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6-1.png', 0, 'attachment', 'image/png', 0),
(60, 1, '2019-01-28 13:30:36', '2019-01-28 13:30:36', '', 'photo-7', '', 'inherit', 'open', 'closed', '', 'photo-7-2', '', '', '2019-01-28 13:30:36', '2019-01-28 13:30:36', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7-1.png', 0, 'attachment', 'image/png', 0),
(61, 1, '2019-01-28 13:30:37', '2019-01-28 13:30:37', '', 'photo-8', '', 'inherit', 'open', 'closed', '', 'photo-8', '', '', '2019-01-28 13:30:37', '2019-01-28 13:30:37', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-8.png', 0, 'attachment', 'image/png', 0),
(62, 1, '2019-01-28 13:30:37', '2019-01-28 13:30:37', '', 'photo-9', '', 'inherit', 'open', 'closed', '', 'photo-9-2', '', '', '2019-01-28 13:30:37', '2019-01-28 13:30:37', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9-1.png', 0, 'attachment', 'image/png', 0),
(63, 1, '2019-01-28 13:30:38', '2019-01-28 13:30:38', '', 'photo-10', '', 'inherit', 'open', 'closed', '', 'photo-10-2', '', '', '2019-01-28 13:30:38', '2019-01-28 13:30:38', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-10-1.png', 0, 'attachment', 'image/png', 0),
(64, 1, '2019-01-28 13:30:39', '2019-01-28 13:30:39', '', 'photo-11', '', 'inherit', 'open', 'closed', '', 'photo-11', '', '', '2019-01-28 13:30:39', '2019-01-28 13:30:39', '', 52, 'http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-11.png', 0, 'attachment', 'image/png', 0),
(65, 1, '2019-01-28 13:31:04', '2019-01-28 13:31:04', '<!-- wp:gallery {\"ids\":[53,54,55,56,57,58,59,60,61,62,63,64],\"columns\":3} -->\n<ul class=\"wp-block-gallery columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1-1024x704.jpg\" alt=\"\" data-id=\"53\" data-link=\"http://localhost/wp/wordpress/?attachment_id=53\" class=\"wp-image-53\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1-1.png\" alt=\"\" data-id=\"54\" data-link=\"http://localhost/wp/wordpress/?attachment_id=54\" class=\"wp-image-54\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2-1.png\" alt=\"\" data-id=\"55\" data-link=\"http://localhost/wp/wordpress/?attachment_id=55\" class=\"wp-image-55\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3-1.png\" alt=\"\" data-id=\"56\" data-link=\"http://localhost/wp/wordpress/?attachment_id=56\" class=\"wp-image-56\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4-1.png\" alt=\"\" data-id=\"57\" data-link=\"http://localhost/wp/wordpress/?attachment_id=57\" class=\"wp-image-57\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5-1.png\" alt=\"\" data-id=\"58\" data-link=\"http://localhost/wp/wordpress/?attachment_id=58\" class=\"wp-image-58\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6-1.png\" alt=\"\" data-id=\"59\" data-link=\"http://localhost/wp/wordpress/?attachment_id=59\" class=\"wp-image-59\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7-1.png\" alt=\"\" data-id=\"60\" data-link=\"http://localhost/wp/wordpress/?attachment_id=60\" class=\"wp-image-60\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-8.png\" alt=\"\" data-id=\"61\" data-link=\"http://localhost/wp/wordpress/?attachment_id=61\" class=\"wp-image-61\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9-1.png\" alt=\"\" data-id=\"62\" data-link=\"http://localhost/wp/wordpress/?attachment_id=62\" class=\"wp-image-62\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-10-1.png\" alt=\"\" data-id=\"63\" data-link=\"http://localhost/wp/wordpress/?attachment_id=63\" class=\"wp-image-63\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-11.png\" alt=\"\" data-id=\"64\" data-link=\"http://localhost/wp/wordpress/?attachment_id=64\" class=\"wp-image-64\"/></figure></li></ul>\n<!-- /wp:gallery -->', 'Wonderful places', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2019-01-28 13:31:04', '2019-01-28 13:31:04', '', 52, 'http://localhost/wp/wordpress/index.php/2019/01/28/52-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2019-02-05 10:58:51', '2019-02-05 10:58:51', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 10:58:51', '2019-02-05 10:58:51', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0),
(68, 1, '2019-02-05 10:59:29', '2019-02-05 10:59:29', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]<br>\n[sc name=\"logHelloWorld\"]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 10:59:29', '2019-02-05 10:59:29', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2019-02-05 11:31:18', '2019-02-05 11:31:18', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]<br>\n[sc name=\"logHelloWorld\"]</p>\n<p>[output_pages]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 11:31:18', '2019-02-05 11:31:18', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2019-02-05 11:31:26', '2019-02-05 11:31:26', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]<br>\n[sc name=\"logHelloWorld\"]</p>\n<p>[hi]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 11:31:26', '2019-02-05 11:31:26', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2019-02-05 11:32:53', '2019-02-05 11:32:53', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]</p>\n<p>[sayHi]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 11:32:53', '2019-02-05 11:32:53', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0),
(72, 1, '2019-02-05 11:42:32', '2019-02-05 11:42:32', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]</p>\n<p>[sayHi]</p>\n<p><script><br />\nconsole.log(\'test\');<br />\n</script></p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 11:42:32', '2019-02-05 11:42:32', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(73, 1, '2019-02-05 11:42:53', '2019-02-05 11:42:53', '<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]</p>\n<p>[sayHi]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 11:42:53', '2019-02-05 11:42:53', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0),
(74, 1, '2019-02-05 11:48:27', '2019-02-05 11:48:27', '<p>[leo_wp_current_email]</p>\n\n<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]</p>\n<p>[sayHi]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2019-02-05 11:48:27', '2019-02-05 11:48:27', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2019-02-05 11:48:29', '2019-02-05 11:48:29', '<p>[leo_wp_current_email]</p>\n\n<!-- wp:gallery {\"ids\":[40,41,42,43,44,45,46,47,48],\"align\":\"full\",\"className\":\"alignfull\"} -->\n<ul class=\"wp-block-gallery alignfull columns-3 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/hero_image-1024x704.jpg\" alt=\"\" data-id=\"40\" data-link=\"http://localhost/wp/wordpress/?attachment_id=40\" class=\"wp-image-40\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-1.png\" alt=\"\" data-id=\"41\" data-link=\"http://localhost/wp/wordpress/?attachment_id=41\" class=\"wp-image-41\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-2.png\" alt=\"\" data-id=\"42\" data-link=\"http://localhost/wp/wordpress/?attachment_id=42\" class=\"wp-image-42\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-3.png\" alt=\"\" data-id=\"43\" data-link=\"http://localhost/wp/wordpress/?attachment_id=43\" class=\"wp-image-43\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-4.png\" alt=\"\" data-id=\"44\" data-link=\"http://localhost/wp/wordpress/?attachment_id=44\" class=\"wp-image-44\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-5.png\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/wp/wordpress/?attachment_id=45\" class=\"wp-image-45\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-6.png\" alt=\"\" data-id=\"46\" data-link=\"http://localhost/wp/wordpress/?attachment_id=46\" class=\"wp-image-46\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-7.png\" alt=\"\" data-id=\"47\" data-link=\"http://localhost/wp/wordpress/?attachment_id=47\" class=\"wp-image-47\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wp/wordpress/wp-content/uploads/2019/01/photo-9.png\" alt=\"\" data-id=\"48\" data-link=\"http://localhost/wp/wordpress/?attachment_id=48\" class=\"wp-image-48\"/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<p>[sc name=\"logHelloWorld\"]</p>\n<p>[sayHi]</p>', 'A wonderful escapade', '', 'inherit', 'closed', 'closed', '', '39-autosave-v1', '', '', '2019-02-05 11:48:29', '2019-02-05 11:48:29', '', 39, 'http://localhost/wp/wordpress/index.php/2019/02/05/39-autosave-v1/', 0, 'revision', '', 0),
(77, 1, '2019-02-06 00:34:19', '2019-02-06 00:34:19', '[getBlogID]', '', '', 'publish', 'closed', 'closed', '', '77-2', '', '', '2019-02-06 00:41:44', '2019-02-06 00:41:44', '', 0, 'http://localhost/wp/wordpress/?page_id=77', 0, 'page', '', 0),
(78, 1, '2019-02-06 00:34:19', '2019-02-06 00:34:19', '<!--?php $postid = get_the_ID(); \necho $postid; \n?-->', '', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2019-02-06 00:34:19', '2019-02-06 00:34:19', '', 77, 'http://localhost/wp/wordpress/index.php/2019/02/06/77-revision-v1/', 0, 'revision', '', 0),
(79, 1, '2019-02-06 00:41:44', '2019-02-06 00:41:44', '[getBlogID]', '', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2019-02-06 00:41:44', '2019-02-06 00:41:44', '', 77, 'http://localhost/wp/wordpress/index.php/2019/02/06/77-revision-v1/', 0, 'revision', '', 0),
(80, 1, '2019-02-06 00:41:46', '2019-02-06 00:41:46', '[getBlogID]', '', '', 'inherit', 'closed', 'closed', '', '77-autosave-v1', '', '', '2019-02-06 00:41:46', '2019-02-06 00:41:46', '', 77, 'http://localhost/wp/wordpress/index.php/2019/02/06/77-autosave-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(5, 'side-menu', 'side-menu', 0),
(6, 'menu1', 'menu1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(18, 1, 0),
(33, 5, 0),
(35, 6, 0),
(52, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 3),
(5, 5, 'nav_menu', '', 0, 1),
(6, 6, 'nav_menu', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'ilancemojal'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy,theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"e8d47107f4799bd4b9449f4e181e845073b2817565a51b3c329db494d4654ecb\";a:4:{s:10:\"expiration\";i:1549356662;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0\";s:5:\"login\";i:1549183862;}s:64:\"848299e1932d52dba001ca54bfddf29610c0e7ab579c4a06d0f29edc897a2f1b\";a:4:{s:10:\"expiration\";i:1549470198;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0\";s:5:\"login\";i:1549297398;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '66'),
(18, 1, 'community-events-location', 'a:4:{s:11:\"description\";s:6:\"Puerto\";s:8:\"latitude\";s:10:\"36.5938900\";s:9:\"longitude\";s:10:\"-6.2329800\";s:7:\"country\";s:2:\"ES\";}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse'),
(20, 1, 'wp_user-settings-time', '1548681934'),
(21, 1, 'nav_menu_recently_edited', '6'),
(22, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(23, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'ilancemojal', '$P$B10nLqC3v/hCQUGRz1KOP2uUURcUFe/', 'ilancemojal', 'ilance.mojal@gmail.com', '', '2019-01-19 09:30:21', '', 0, 'ilancemojal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
