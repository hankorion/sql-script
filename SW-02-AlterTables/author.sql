-- ##################################################
--
--	Script to maintain the table schema
-- 	2018 Copyright (c) SG Win
--	Script v. 0.0.3
-- ##################################################

-- ##################################################
--  v. 0.0.1 - init via JIRA DBA-001
--  v. 0.0.2 - update to reformat the script via JIRA DBA-002
--  v. 0.0.3 - add new column a_alias via JIRA DBA-005
-- ##################################################

CLEAR SCREEN;
PROMPT ----------------------------------------------;
PROMPT SW-02-AlterTables - author.sql start
PROMPT ----------------------------------------------;
PROMPT ;


-- ##################################################
PROMPT ;
PROMPT ----------------------------------------------;
PROMPT Key notes for this script
PROMPT ----------------------------------------------;
PROMPT ;

-- Clean constraints then drop table
ALTER TABLE
  author DROP CONSTRAINT PK_AUTHOR_A_ID;
DELETE FROM
  author;DROP TABLE author CASCADE CONSTRAINTS;create table author (
    a_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    a_name VARCHAR(30) NOT NULL,
    a_alias VARCHAR(30) NOT NULL
  );


-- Add PK constraint for table author
ALTER TABLE
  author
ADD
  CONSTRAINT PK_AUTHOR_A_ID PRIMARY KEY (a_id);

-- ####################################################################################################

PROMPT ----------------------------------------------;
PROMPT SW-02-AlterTables - author.sql end
PROMPT ----------------------------------------------;
PROMPT ;

COMMIT;

