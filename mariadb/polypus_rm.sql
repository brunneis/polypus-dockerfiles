/* Automated Processing List (APL) */
CREATE TABLE `dpsa_lpa_terms` (
	`term` VARCHAR(255) NOT NULL,
	`priority` INT(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `dpsa_lpa_terms`
  ADD PRIMARY KEY (`term`);
  
--

/* Table for APL related keywords */
CREATE TABLE `dpsa_assoc_terms` (
	`term` VARCHAR(255) NOT NULL,
	`associated_term` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `dpsa_assoc_terms`
  ADD PRIMARY KEY (`term`, `associated_term`);
  
ALTER TABLE `dpsa_assoc_terms`
  ADD CONSTRAINT `dpsa_assoc_terms_termFK` FOREIGN KEY (`term`) REFERENCES `dpsa_lpa_terms` (`term`) ON DELETE NO ACTION ON UPDATE CASCADE;
  
--

/* Table for APL periodic results */
CREATE TABLE `dpsa_lpa_results` (
	`term` VARCHAR(255) NOT NULL,
	`start_timestamp` TIMESTAMP(3) NOT NULL,
	`stop_timestamp` TIMESTAMP(3) NOT NULL,
	`processed_posts` BIGINT(19) NOT NULL, /* Real no. of processed posts */
	`total_relevance` DOUBLE PRECISION NOT NULL, /* Virtual no. of processed posts */
	`result` DOUBLE PRECISION NOT NULL /* [0-1] Avg. polarity */
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `dpsa_lpa_results`
  ADD PRIMARY KEY (`term`, `stop_timestamp`);
  
ALTER TABLE `dpsa_lpa_results`
  ADD CONSTRAINT `dpsa_lpa_results_termFK` FOREIGN KEY (`term`) REFERENCES `dpsa_lpa_terms` (`term`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
--

/* Table of keyword search frequencies */
CREATE TABLE `dpsa_tagged_freq` (
	`term` VARCHAR(255) NOT NULL,
	`times` BIGINT DEFAULT 1,
	`last` TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `dpsa_tagged_freq`
  ADD PRIMARY KEY (`term`);
    
--

/* Table for on-demand query results */
CREATE TABLE `dpsa_tagged_results` (
	`job_id` VARCHAR(31) NOT NULL,
	`search_query` VARCHAR(255) NOT NULL,
	`query_timestamp` TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
	`start_timestamp` TIMESTAMP(3) NOT NULL,
	`stop_timestamp` TIMESTAMP(3) NOT NULL,
	`result` TEXT NOT NULL,
	`job_tag` VARCHAR(255) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `dpsa_tagged_results`
  ADD PRIMARY KEY (`job_id`);
  

/* Initial records */
INSERT INTO dpsa_lpa_terms (term) VALUES ('samsung');
INSERT INTO dpsa_lpa_terms (term) VALUES ('apple');
INSERT INTO dpsa_lpa_terms (term) VALUES ('bitcoin');
