-- DESIGNED FOR MARIADB
START TRANSACTION;

-- Table: holder_statuses
DROP TABLE IF EXISTS holder_statuses;
CREATE TABLE holder_statuses (id VARCHAR (36) PRIMARY KEY NOT NULL, description TEXT NOT NULL, created DATETIME NOT NULL, creator VARCHAR (36) NOT NULL, last_edited DATETIME, last_editor VARCHAR (36));
INSERT INTO holder_statuses (id, description, created, creator) VALUES ('0e6d911b-164b-412c-a0ec-f3af27d50293', 'cancelled', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_statuses (id, description, created, creator) VALUES ('ab6082db-1b47-487f-8123-37a833ce0291', 'locked', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_statuses (id, description, created, creator) VALUES ('e4b2f116-d1ec-4b5e-a7c7-ee66b76fa90f', 'active', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');

-- Table: holder_types
DROP TABLE IF EXISTS holder_types;
CREATE TABLE holder_types (id VARCHAR (36) PRIMARY KEY NOT NULL, description VARCHAR (80) NOT NULL, created DATETIME NOT NULL, creator VARCHAR (36) NOT NULL, last_edited DATETIME, last_editor VARCHAR (36));
INSERT INTO holder_types (id, description, created, creator) VALUES ('959bc08a-db64-482e-b431-559731059b32', 'trust', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('296fca26-f386-4954-8abc-a2515c3b2656', 'deceased_individual', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('2c564ebf-ed08-4362-91fd-98b15213e20f', 'unknown', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('4d00c0a0-4f95-4e6a-bd0d-2b4c3cacaba8', 'individual', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('61f6e8f2-cf96-4c15-a179-ef351ecde4a3', 'partnership', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('74e95f5e-b82c-4d8f-b032-bd6bd4eae1c4', 'government_organisation', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('9ff5966f-eb3b-4779-9a02-09091199995a', 'other_non_individual', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('ac9f60bd-ba19-493e-9e09-28c1975abf8e', 'superannuation_fund', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO holder_types (id, description, created, creator) VALUES ('c3cb83e3-6707-46a4-86db-92876cd1e9f6', 'company', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');

-- Table: holders
DROP TABLE IF EXISTS holders;
CREATE TABLE holders (id VARCHAR (36) PRIMARY KEY NOT NULL, type VARCHAR (36) NOT NULL, status VARCHAR (36) NOT NULL, name VARCHAR (80) NOT NULL, designation VARCHAR (35), address_line1 VARCHAR (40) NOT NULL, address_line2 VARCHAR (35) NOT NULL, address_line3 VARCHAR (35) NOT NULL, address_line4 VARCHAR (35) NOT NULL, address_line5 VARCHAR (35) NOT NULL, address_town VARCHAR (35) NOT NULL, address_postcode VARCHAR (16) NOT NULL, address_state VARCHAR (35) NOT NULL, address_country VARCHAR (2) NOT NULL);

-- Table: securities
DROP TABLE IF EXISTS securities;
CREATE TABLE securities (id VARCHAR (36) PRIMARY KEY UNIQUE NOT NULL, name_short VARCHAR (10) NOT NULL, name_full VARCHAR (80), noun VARCHAR (35) NOT NULL, noun_plural VARCHAR (35) NOT NULL);

-- Table: transaction_codes
DROP TABLE IF EXISTS transaction_codes;
CREATE TABLE transaction_codes (id VARCHAR (36) PRIMARY KEY NOT NULL, reason VARCHAR (80) NOT NULL, description TEXT, created DATETIME NOT NULL, creator VARCHAR (36) NOT NULL, last_edited DATETIME, last_editor VARCHAR (36));
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('032dec5e-aa3a-4691-8467-93c7b439bbf8', 'conversion_miscellaneous', 'Conversion of securities other than convertible notes', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('0781f810-7198-4580-9f40-fd189309febe', 'allotment_distribution_income', 'Allotment of securities in a reinvestment of income other than dividend income (eg. interest or trust income)', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('24ff85a2-b65c-4c68-b392-d5192a75adb5', 'allotment_non_renounceable_issue', 'Allotment of securities following acceptance of a non-renounceable issue', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('2d748598-9c5a-42e7-a57e-128245ef28f4', 'allotment_miscellaneous', 'Any allotment of securities where no other transaction code is applicable', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('329a802b-8c88-45fd-98cf-000f8b967092', 'allotment_placement', 'Allotment of securities due to a placement', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('329b8f0e-8863-44be-ab84-439bb4349f7b', 'allotment_share_purchase_plan', 'Allotment of securities as a result of a share purchase plan', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('366545d6-037b-4caa-9032-85135e17d7ec', 'allotment_distribution_in_specie', 'Allotment of securities as a result of an in specie distribution', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('4f511480-1ece-4e23-b20b-5636a1d42d18', 'partly_paid_call_paid', 'Payment of a call for partly paid shares of a company', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('516b7686-8487-4cf9-bb38-09999ac99cce', 'reversal', 'Reversal of an allotment or transfer due to various errors/events', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('66d8f04c-4d05-4700-87d5-43707042ac6f', 'allotment_distribution_scrip', 'Allotment due to payment of dividend in securities (distinct from a dividend reinvestment plan where the dividend is paid in cash and the holder may elect to convert cash to a security)', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('79af2684-c4e1-4672-a17b-4257ceebe8a8', 'priority_issue', 'Priority issue', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('7bc6be8f-d0d6-4b04-ba20-75bbfe03a6ad', 'allotment_bonus_plan', 'Allotment of securities in a bonus plan', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('7c080069-79ea-4eae-b41b-3782cc0067c0', 'allotment_distribution_dividend_plan', 'Allotment of securities in a dividend reinvestment plan', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('81721f4e-c61a-4569-b987-804fbc1b8518', 'allotment_share_top_up_plan', 'Allotment of securities as a result of a share top up plan', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('8ea00fb0-9efb-4eba-9d6e-bb958e4bd26c', 'buy_back', 'Removal of securities where a holder has failed to issue instructions for a compulsory buyback', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('8f2d5dbd-77e4-436a-bb95-cf4628069e17', 'redemption_convertible_note', 'Redemption or maturity of convertible notes', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('928339e5-03c7-446b-8b85-210d5a2424d0', 'exercise_option', 'Exercise of options', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('92ebfc7d-8785-4269-bd19-d7a8d5b06189', 'allotment_option', 'Allotment of options', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('9ad66af5-85b7-4cd7-9bba-c389d65812ce', 'partly_paid_forfeiture', 'Removal of securities where a call has not been paid', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('9fc48236-c1af-4da3-9bfa-391a9352e367', 'redemption_miscellaneous', 'Redemption of securities other than convertible notes', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('b2a9ddaf-4616-4652-8218-63bcdf243a1d', 'allotment_convertible_note', 'Allotment of convertible notes', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('bc64111d-6b97-4343-86e2-90605b63e3ac', 'adjustment', 'Any adjustment where no other transaction code is applicable (eg. fixing an error or an unusual corporate action)', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('c0fd0c9e-7af7-4621-9af8-8c552f8ba429', 'scheme_of_arrangement', 'Scheme of arrangement', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('d127ec3f-f119-4562-9a46-f207386d0bdf', 'reconstruction', 'Capital reconstruction', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('e2a79c26-49b8-4fc7-82d6-cd933a076337', 'conversion_convertible_note', 'Conversion of convertible notes', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('f7ecaedd-6c0e-4b62-b180-303c92f9a21e', 'allotment_bonus_issue', 'Allotment of securities in a bonus issue', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');
INSERT INTO transaction_codes (id, reason, description, created, creator) VALUES ('f9bd43a4-75b0-48be-ab68-4cc732035edd', 'allotment_company_merger', 'Allotment of securities as a result of a company merger', '0000-00-00', '5ebc22d3-6fde-496c-b499-d8e40d575b14');

-- Table: transactions
DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (id VARCHAR (36) PRIMARY KEY NOT NULL, datetime DATETIME NOT NULL, code VARCHAR (36), increase_holder VARCHAR (36), increase_amount BIGINT, increase_security VARCHAR (36), decrease_holder VARCHAR (36), decrease_amount BIGINT, decrease_security VARCHAR (36));

-- Table: users
DROP TABLE IF EXISTS users;
CREATE TABLE users (id VARCHAR (36) PRIMARY KEY NOT NULL, created DATETIME NOT NULL, name VARCHAR (80) NOT NULL, username VARCHAR (80) NOT NULL, password TEXT NOT NULL);
INSERT INTO users (id, created, name, username, password) VALUES ('5ebc22d3-6fde-496c-b499-d8e40d575b14', '0000-00-00', 'Depositaire Builtin', 'genesis', '');

COMMIT;
