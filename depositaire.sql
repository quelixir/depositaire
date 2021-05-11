SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `depositaire`
--

-- --------------------------------------------------------

--
-- Table structure for table `holders`
--

CREATE TABLE `holders` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `address_line1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address_line2` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address_line3` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address_line4` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address_line5` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address_town` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `address_postcode` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `address_state` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `address_country` varchar(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holder_statuses`
--

CREATE TABLE `holder_statuses` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `creator` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `last_edited` datetime DEFAULT NULL,
  `last_editor` varchar(36) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `holder_statuses`
--

INSERT INTO `holder_statuses` (`id`, `description`, `created`, `creator`, `last_edited`, `last_editor`) VALUES
('0e6d911b-164b-412c-a0ec-f3af27d50293', 'cancelled', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('ab6082db-1b47-487f-8123-37a833ce0291', 'locked', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('e4b2f116-d1ec-4b5e-a7c7-ee66b76fa90f', 'active', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `holder_types`
--

CREATE TABLE `holder_types` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `creator` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `last_edited` datetime DEFAULT NULL,
  `last_editor` varchar(36) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `holder_types`
--

INSERT INTO `holder_types` (`id`, `description`, `created`, `creator`, `last_edited`, `last_editor`) VALUES
(' 596c03cc-02d6-4d84-be18-1abe7c2945d', 'trust', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('296fca26-f386-4954-8abc-a2515c3b2656', 'deceased_individual', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('2c564ebf-ed08-4362-91fd-98b15213e20f', 'unknown', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('4d00c0a0-4f95-4e6a-bd0d-2b4c3cacaba8', 'individual', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('61f6e8f2-cf96-4c15-a179-ef351ecde4a3', 'partnership', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('74e95f5e-b82c-4d8f-b032-bd6bd4eae1c4', 'government_organisation', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('9ff5966f-eb3b-4779-9a02-09091199995a', 'other_non_individual', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('ac9f60bd-ba19-493e-9e09-28c1975abf8e', 'superannuation_fund', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('c3cb83e3-6707-46a4-86db-92876cd1e9f6', 'company', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_codes`
--

CREATE TABLE `transaction_codes` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `creator` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `last_edited` datetime DEFAULT NULL,
  `last_editor` varchar(36) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction_codes`
--

INSERT INTO `transaction_codes` (`id`, `reason`, `description`, `created`, `creator`, `last_edited`, `last_editor`) VALUES
('032dec5e-aa3a-4691-8467-93c7b439bbf8', 'conversion_miscellaneous', 'Conversion of securities other than convertible notes', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('0781f810-7198-4580-9f40-fd189309febe', 'allotment_distribution_income', 'Allotment of securities in a reinvestment of income other than dividend income (eg. interest or trust income)', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('24ff85a2-b65c-4c68-b392-d5192a75adb5', 'allotment_non_renounceable_issue', 'Allotment of securities following acceptance of a non-renounceable issue', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('2d748598-9c5a-42e7-a57e-128245ef28f4', 'allotment_miscellaneous', 'Any allotment of securities where no other transaction code is applicable', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('329a802b-8c88-45fd-98cf-000f8b967092', 'allotment_placement', 'Allotment of securities due to a placement', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('329b8f0e-8863-44be-ab84-439bb4349f7b', 'allotment_share_purchase_plan', 'Allotment of securities as a result of a share purchase plan', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('366545d6-037b-4caa-9032-85135e17d7ec', 'allotment_distribution_in_specie', 'Allotment of securities as a result of an in specie distribution', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('4f511480-1ece-4e23-b20b-5636a1d42d18', 'partly_paid_call_paid', 'Payment of a call for partly paid shares of a company', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('516b7686-8487-4cf9-bb38-09999ac99cce', 'reversal', 'Reversal of an allotment or transfer due to various errors/events', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('66d8f04c-4d05-4700-87d5-43707042ac6f', 'allotment_distribution_scrip', 'Allotment due to payment of dividend in securities (distinct from a dividend reinvestment plan where the dividend is paid in cash and the holder may elect to convert cash to a security)', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('79af2684-c4e1-4672-a17b-4257ceebe8a8', 'priority_issue', 'Priority issue', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('7bc6be8f-d0d6-4b04-ba20-75bbfe03a6ad', 'allotment_bonus_plan', 'Allotment of securities in a bonus plan', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('7c080069-79ea-4eae-b41b-3782cc0067c0', 'allotment_distribution_dividend_plan', 'Allotment of securities in a dividend reinvestment plan', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('81721f4e-c61a-4569-b987-804fbc1b8518', 'allotment_share_top_up_plan', 'Allotment of securities as a result of a share top up plan', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('8ea00fb0-9efb-4eba-9d6e-bb958e4bd26c', 'buy_back', 'Removal of securities where a holder has failed to issue instructions for a compulsory buyback', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('8f2d5dbd-77e4-436a-bb95-cf4628069e17', 'redemption_convertible_note', 'Redemption or maturity of convertible notes', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('928339e5-03c7-446b-8b85-210d5a2424d0', 'exercise_option', 'Exercise of options', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('92ebfc7d-8785-4269-bd19-d7a8d5b06189', 'allotment_option', 'Allotment of options', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('9ad66af5-85b7-4cd7-9bba-c389d65812ce', 'partly_paid_forfeiture', 'Removal of securities where a call has not been paid', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('9fc48236-c1af-4da3-9bfa-391a9352e367', 'redemption_miscellaneous', 'Redemption of securities other than convertible notes', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('b2a9ddaf-4616-4652-8218-63bcdf243a1d', 'allotment_convertible_note', 'Allotment of convertible notes', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('bc64111d-6b97-4343-86e2-90605b63e3ac', 'adjustment', 'Any adjustment where no other transaction code is applicable (eg. fixing an error or an unusual corporate action)', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('c0fd0c9e-7af7-4621-9af8-8c552f8ba429', 'scheme_of_arrangement', 'Scheme of arrangement', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('d127ec3f-f119-4562-9a46-f207386d0bdf', 'reconstruction', 'Capital reconstruction', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('e2a79c26-49b8-4fc7-82d6-cd933a076337', 'conversion_convertible_note', 'Conversion of convertible notes', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('f7ecaedd-6c0e-4b62-b180-303c92f9a21e', 'allotment_bonus_issue', 'Allotment of securities in a bonus issue', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, ''),
('f9bd43a4-75b0-48be-ab68-4cc732035edd', 'allotment_company_merger', 'Allotment of securities as a result of a company merger', '0000-00-00 00:00:00', '5ebc22d3-6fde-496c-b499-d8e40d575b14', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created`, `name`, `username`, `password`) VALUES
('5ebc22d3-6fde-496c-b499-d8e40d575b14', '0000-00-00 00:00:00', 'Depositaire Builtin', 'genesis', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `holders`
--
ALTER TABLE `holders`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `holder_statuses`
--
ALTER TABLE `holder_statuses`
  ADD UNIQUE KEY `status` (`id`);

--
-- Indexes for table `holder_types`
--
ALTER TABLE `holder_types`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `transaction_codes`
--
ALTER TABLE `transaction_codes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
