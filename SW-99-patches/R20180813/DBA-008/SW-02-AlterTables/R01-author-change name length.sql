-- ##################################################
--
--	Script to maintain the table schema
-- 	2018 Copyright (c) SG Win
--	Script v. 0.0.1
-- ##################################################

-- ##################################################
--  v. 0.0.1 - update name lenght to 50
-- ##################################################

CLEAR SCREEN;
PROMPT ----------------------------------------------;
PROMPT SW-02-AlterTables - author.sql DBA-008 update column name lenght 
PROMPT ----------------------------------------------;
PROMPT ;


-- ##################################################
PROMPT ;
PROMPT ----------------------------------------------;
PROMPT start alter script
PROMPT ----------------------------------------------;
PROMPT ;



alter table author udent modify (a_name varchar2(50));


-- ####################################################################################################

PROMPT ----------------------------------------------;
PROMPT SW-02-AlterTables - author.sql DBA-008 update column name lenght 
PROMPT ----------------------------------------------;
PROMPT ;

COMMIT;


