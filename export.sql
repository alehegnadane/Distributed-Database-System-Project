--------------------------------------------------------
--  File created - Wednesday-January-13-2016   
--------------------------------------------------------

--------------------------------------------------------
--  DDL for DB Link SHFEE
--------------------------------------------------------

  CREATE DATABASE LINK "SHFEE"  CONNECT TO "SYSTEM" IDENTIFIED BY VALUES '12'  USING '192.168.10.2/orcl'
 
--------------------------------------------------------
--  DDL for DB Link UOG
--------------------------------------------------------

  CREATE DATABASE LINK "UOG"  CONNECT TO "SYSTEM" IDENTIFIED BY VALUES '05A712AA1311BA1EFC8D6271CB4769FA52'  USING '10.139.20.164/uog'
 
--------------------------------------------------------
--  DDL for DB Link SHFE
--------------------------------------------------------

  CREATE DATABASE LINK "SHFE"  CONNECT TO "SYSTEM" IDENTIFIED BY VALUES '052380B2072FF4781FFD1C8E6671ACE9B1'  USING '192.168.10.2/lib'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_ERROR$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ERROR$" ("SESSION#" NUMBER, "TIME_OF_ERROR" DATE, "CODE" NUMBER, "MESSAGE" VARCHAR2(4000), "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "SPARE4" VARCHAR2(4000), "SPARE5" VARCHAR2(4000)) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_STATUS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_STATUS" ("TEMPLATE_STATUS_ID" NUMBER, "STATUS_TYPE_NAME" VARCHAR2(100) NOT NULL ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_STATUS_PK" PRIMARY KEY ("TEMPLATE_STATUS_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_STATUS"."TEMPLATE_STATUS_ID" IS 'Internal primary key for the template status table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_STATUS"."STATUS_TYPE_NAME" IS 'User friendly name for the template status.'
 
   COMMENT ON TABLE "REPCAT$_TEMPLATE_STATUS"  IS 'Table for template status and template status codes.'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_TABPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TABPART$" ("OBJ#" NUMBER(22,0), "TS#" NUMBER(22,0), "PART#" NUMBER, "BO#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_TABPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "BO#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table DEF$_PROPAGATOR
--------------------------------------------------------

  CREATE TABLE "DEF$_PROPAGATOR" ("USERID" NUMBER, "USERNAME" VARCHAR2(30) NOT NULL ENABLE, "CREATED" DATE DEFAULT SYSDATE NOT NULL ENABLE,  CONSTRAINT "DEF$_PROPAGATOR_PRIMARY" PRIMARY KEY ("USERID") ENABLE) 
 
   COMMENT ON COLUMN "DEF$_PROPAGATOR"."USERID" IS 'User ID of the propagator'
 
   COMMENT ON COLUMN "DEF$_PROPAGATOR"."USERNAME" IS 'User name of the propagator'
 
   COMMENT ON COLUMN "DEF$_PROPAGATOR"."CREATED" IS 'The time when the propagator is registered'
 
   COMMENT ON TABLE "DEF$_PROPAGATOR"  IS 'The propagator for deferred remote procedure calls'
 
--------------------------------------------------------
--  DDL for Table SAMPLET
--------------------------------------------------------

  CREATE TABLE "SAMPLET" ("FNAME" VARCHAR2(10)) 
 
--------------------------------------------------------
--  DDL for Table OL$HINTS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "OL$HINTS" ("OL_NAME" VARCHAR2(30), "HINT#" NUMBER, "CATEGORY" VARCHAR2(30), "HINT_TYPE" NUMBER, "HINT_TEXT" VARCHAR2(512), "STAGE#" NUMBER, "NODE#" NUMBER, "TABLE_NAME" VARCHAR2(30), "TABLE_TIN" NUMBER, "TABLE_POS" NUMBER, "REF_ID" NUMBER, "USER_TABLE_NAME" VARCHAR2(64), "COST" FLOAT(126), "CARDINALITY" FLOAT(126), "BYTES" FLOAT(126), "HINT_TEXTOFF" NUMBER, "HINT_TEXTLEN" NUMBER, "JOIN_PRED" VARCHAR2(2000), "SPARE1" NUMBER, "SPARE2" NUMBER, "HINT_STRING" CLOB) ON COMMIT PRESERVE ROWS 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_INDSUBPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_INDSUBPART$" ("OBJ#" NUMBER(22,0), "DATAOBJ#" NUMBER(22,0), "POBJ#" NUMBER(22,0), "SUBPART#" NUMBER(22,0), "TS#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_INDSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION_STATISTICS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOLUTION_STATISTICS" ("SNAME" VARCHAR2(30) CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN1" NOT NULL ENABLE, "ONAME" VARCHAR2(30) CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN2" NOT NULL ENABLE, "CONFLICT_TYPE_ID" NUMBER(*,0) CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN3" NOT NULL ENABLE, "REFERENCE_NAME" VARCHAR2(30) CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN4" NOT NULL ENABLE, "METHOD_NAME" VARCHAR2(80) CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN5" NOT NULL ENABLE, "FUNCTION_NAME" VARCHAR2(92) CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN6" NOT NULL ENABLE, "PRIORITY_GROUP" VARCHAR2(30), "RESOLVED_DATE" DATE CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN7" NOT NULL ENABLE, "PRIMARY_KEY_VALUE" VARCHAR2(2000) CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN8" NOT NULL ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."SNAME" IS 'Owner of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."ONAME" IS 'Name of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."CONFLICT_TYPE_ID" IS 'Type of conflict'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."METHOD_NAME" IS 'Name of the conflict resolution method'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."FUNCTION_NAME" IS 'Name of the resolution function'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."PRIORITY_GROUP" IS 'Name of the priority group used in conflict resolution'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."RESOLVED_DATE" IS 'Timestamp for the resolution of the conflict'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."PRIMARY_KEY_VALUE" IS 'Primary key of the replicated row (character data)'
 
   COMMENT ON TABLE "REPCAT$_RESOLUTION_STATISTICS"  IS 'Statistics for conflict resolutions for all replicated tables in the database'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOLUTION" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "CONFLICT_TYPE_ID" NUMBER(*,0), "REFERENCE_NAME" VARCHAR2(30), "SEQUENCE_NO" NUMBER, "METHOD_NAME" VARCHAR2(80) CONSTRAINT "REPCAT$_RESOLUTION_NN1" NOT NULL ENABLE, "FUNCTION_NAME" VARCHAR2(92) CONSTRAINT "REPCAT$_RESOLUTION_NN2" NOT NULL ENABLE, "PRIORITY_GROUP" VARCHAR2(30), "RESOLUTION_COMMENT" VARCHAR2(80),  CONSTRAINT "REPCAT$_RESOLUTION_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") ENABLE,  CONSTRAINT "REPCAT$_RESOLUTION_F1" FOREIGN KEY ("CONFLICT_TYPE_ID", "METHOD_NAME") REFERENCES "REPCAT$_RESOLUTION_METHOD" ("CONFLICT_TYPE_ID", "METHOD_NAME") ENABLE,  CONSTRAINT "REPCAT$_RESOLUTION_F3" FOREIGN KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") REFERENCES "REPCAT$_CONFLICT" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."SNAME" IS 'Owner of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."ONAME" IS 'Name of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."CONFLICT_TYPE_ID" IS 'Type of conflict'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."SEQUENCE_NO" IS 'Ordering on resolution'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."METHOD_NAME" IS 'Name of the conflict resolution method'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."FUNCTION_NAME" IS 'Name of the resolution function'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."PRIORITY_GROUP" IS 'Name of the priority group used in conflict resolution'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."RESOLUTION_COMMENT" IS 'Description of the conflict resolution'
 
   COMMENT ON TABLE "REPCAT$_RESOLUTION"  IS 'Description of all conflict resolutions in the database'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_AGE_SPILL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_AGE_SPILL$" ("SESSION#" NUMBER, "XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "CHUNK" NUMBER(*,0), "SEQUENCE#" NUMBER, "OFFSET" NUMBER, "SPILL_DATA" BLOB, "SPARE1" NUMBER, "SPARE2" NUMBER,  CONSTRAINT "LOGMNR_AGE_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "SEQUENCE#") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_EXCEPTIONS
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_EXCEPTIONS" ("RUNID#" NUMBER, "OWNER" VARCHAR2(30), "TABLE_NAME" VARCHAR2(30), "DIMENSION_NAME" VARCHAR2(30), "RELATIONSHIP" VARCHAR2(11), "BAD_ROWID" ROWID,  CONSTRAINT "MVIEW$_ADV_EXCEPTION_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_EXCEPTIONS"  IS 'Output table for dimension validations'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCATLOG
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPCATLOG" ("VERSION" NUMBER, "ID" NUMBER, "SOURCE" VARCHAR2(128), "USERID" VARCHAR2(30), "TIMESTAMP" DATE, "ROLE" VARCHAR2(1), "MASTER" VARCHAR2(128), "SNAME" VARCHAR2(30), "REQUEST" NUMBER(*,0), "ONAME" VARCHAR2(30), "TYPE" NUMBER(*,0), "A_COMMENT" VARCHAR2(2000), "BOOL_ARG" VARCHAR2(1), "ANO_BOOL_ARG" VARCHAR2(1), "INT_ARG" NUMBER(*,0), "ANO_INT_ARG" NUMBER(*,0), "LINES" NUMBER(*,0), "STATUS" NUMBER(*,0), "MESSAGE" VARCHAR2(200), "ERRNUM" NUMBER, "GNAME" VARCHAR2(30),  CONSTRAINT "REPCAT$_REPCATLOG_REQUEST" CHECK (request IN (-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                                       11, 12, 13, 14, 15, 16, 17,
                                       18, 19, 20, 21, 22, 23, 24, 25)) ENABLE,  CONSTRAINT "REPCAT$_REPCATLOG_TYPE" CHECK (type IN (-1, 0, 1, 2, 4, 5, 7, 8, 9, 11, 12, -3,
                                    13, 14, 32, 33)) ENABLE,  CONSTRAINT "REPCAT$_REPCATLOG_STATUS" CHECK (status IN (0, 1, 2, 3, 4)) ENABLE,  CONSTRAINT "REPCAT$_REPCATLOG_PRIMARY" PRIMARY KEY ("ID", "SOURCE", "ROLE", "MASTER") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."VERSION" IS 'Version of the repcat log record'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ID" IS 'Identifying number of repcat log record'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."SOURCE" IS 'Name of the database at which the request originated'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."USERID" IS 'Name of the user who submitted the request'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."TIMESTAMP" IS 'When the request was submitted'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ROLE" IS 'Is this database the masterdef for the request'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."MASTER" IS 'Name of the database that processes this request$_ddl'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."SNAME" IS 'Schema of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."REQUEST" IS 'Name of the requested operation'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ONAME" IS 'Replicated object name, if applicable'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."TYPE" IS 'Type of replicated object, if applicable'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."A_COMMENT" IS 'Textual argument used for comments'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."BOOL_ARG" IS 'Boolean argument'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ANO_BOOL_ARG" IS 'Another Boolean argument'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."INT_ARG" IS 'Integer argument'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ANO_INT_ARG" IS 'Another integer argument'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."LINES" IS 'The number of rows in system.repcat$_ddl at the processing site'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."STATUS" IS 'Status of the request at this database'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."MESSAGE" IS 'Error message associated with processing the request'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ERRNUM" IS 'Oracle error number associated with processing the request'
 
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."GNAME" IS 'Name of the replicated object group'
 
   COMMENT ON TABLE "REPCAT$_REPCATLOG"  IS 'Information about asynchronous administration requests'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_ROLLUP
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_ROLLUP" ("RUNID#" NUMBER NOT NULL ENABLE, "CLEVELID#" NUMBER NOT NULL ENABLE, "PLEVELID#" NUMBER NOT NULL ENABLE, "FLAGS" NUMBER NOT NULL ENABLE,  CONSTRAINT "MVIEW$_ADV_ROLLUP_PK" PRIMARY KEY ("RUNID#", "CLEVELID#", "PLEVELID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_ROLLUP_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_ROLLUP_CFK" FOREIGN KEY ("RUNID#", "CLEVELID#") REFERENCES "MVIEW$_ADV_LEVEL" ("RUNID#", "LEVELID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_ROLLUP_PFK" FOREIGN KEY ("RUNID#", "PLEVELID#") REFERENCES "MVIEW$_ADV_LEVEL" ("RUNID#", "LEVELID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_ROLLUP"  IS 'Each row repesents either a functional dependency or join-key relationship'
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$APPLY_MILESTONE
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$APPLY_MILESTONE" ("SESSION_ID" NUMBER NOT NULL ENABLE, "COMMIT_SCN" NUMBER NOT NULL ENABLE, "COMMIT_TIME" DATE, "SYNCH_SCN" NUMBER NOT NULL ENABLE, "EPOCH" NUMBER NOT NULL ENABLE, "PROCESSED_SCN" NUMBER NOT NULL ENABLE, "PROCESSED_TIME" DATE, "FETCHLWM_SCN" NUMBER DEFAULT (0) NOT NULL ENABLE, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table DEF$_LOB
--------------------------------------------------------

  CREATE TABLE "DEF$_LOB" ("ID" RAW(16), "ENQ_TID" VARCHAR2(22), "BLOB_COL" BLOB, "CLOB_COL" CLOB, "NCLOB_COL" NCLOB,  CONSTRAINT "DEF$_LOB_PRIMARY" PRIMARY KEY ("ID") ENABLE) 
 
   COMMENT ON COLUMN "DEF$_LOB"."ID" IS 'Identifier of LOB parameter'
 
   COMMENT ON COLUMN "DEF$_LOB"."ENQ_TID" IS 'Transaction identifier for deferred RPC with this LOB parameter'
 
   COMMENT ON COLUMN "DEF$_LOB"."BLOB_COL" IS 'Binary LOB parameter'
 
   COMMENT ON COLUMN "DEF$_LOB"."CLOB_COL" IS 'Character LOB parameter'
 
   COMMENT ON COLUMN "DEF$_LOB"."NCLOB_COL" IS 'National Character LOB parameter'
 
   COMMENT ON TABLE "DEF$_LOB"  IS 'Storage for LOB parameters to deferred RPCs'
 
--------------------------------------------------------
--  DDL for Table LOGMNRC_DBNAME_UID_MAP
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_DBNAME_UID_MAP" ("GLOBAL_NAME" VARCHAR2(128) NOT NULL ENABLE, "LOGMNR_UID" NUMBER, "FLAGS" NUMBER,  CONSTRAINT "LOGMNRC_DBNAME_UID_MAP_PK" PRIMARY KEY ("GLOBAL_NAME") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_LOGMNR_BUILDLOG
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOGMNR_BUILDLOG" ("BUILD_DATE" VARCHAR2(20), "DB_TXN_SCNBAS" NUMBER, "DB_TXN_SCNWRP" NUMBER, "CURRENT_BUILD_STATE" NUMBER, "COMPLETION_STATUS" NUMBER, "MARKED_LOG_FILE_LOW_SCN" NUMBER, "INITIAL_XID" VARCHAR2(22) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_LOGMNR_BUILDLOG_PK" PRIMARY KEY ("LOGMNR_UID", "INITIAL_XID") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_FLAVORS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_FLAVORS" ("FLAVOR_ID" NUMBER NOT NULL ENABLE, "GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', "GNAME" VARCHAR2(30) NOT NULL ENABLE, "FNAME" VARCHAR2(30), "CREATION_DATE" DATE DEFAULT SYSDATE, "CREATED_BY" NUMBER DEFAULT UID, "PUBLISHED" VARCHAR2(1) DEFAULT 'N',  CONSTRAINT "REPCAT$_FLAVORS_C2" CHECK (published is NULL or (published in ('Y','N','O'))) ENABLE,  CONSTRAINT "REPCAT$_FLAVORS_UNQ1" UNIQUE ("GNAME", "FLAVOR_ID", "GOWNER") ENABLE,  CONSTRAINT "REPCAT$_FLAVORS_FK1" FOREIGN KEY ("GNAME", "GOWNER") REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."FLAVOR_ID" IS 'Flavor identifier, unique within object group'
 
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."GOWNER" IS 'Owner of the object group'
 
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."GNAME" IS 'Name of the object group'
 
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."FNAME" IS 'Name of the flavor'
 
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."CREATION_DATE" IS 'Date on which the flavor was created'
 
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."CREATED_BY" IS 'Identifier of user that created the flavor'
 
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."PUBLISHED" IS 'Indicates whether flavor is published (Y/N) or obsolete (O)'
 
   COMMENT ON TABLE "REPCAT$_FLAVORS"  IS 'Flavors defined for replicated object groups'
 
--------------------------------------------------------
--  DDL for Table LOGMNRC_GTLO
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_GTLO" ("LOGMNR_UID" NUMBER NOT NULL ENABLE, "KEYOBJ#" NUMBER NOT NULL ENABLE, "LVLCNT" NUMBER NOT NULL ENABLE, "BASEOBJ#" NUMBER NOT NULL ENABLE, "BASEOBJV#" NUMBER NOT NULL ENABLE, "LVL1OBJ#" NUMBER, "LVL2OBJ#" NUMBER, "LVL0TYPE#" NUMBER NOT NULL ENABLE, "LVL1TYPE#" NUMBER, "LVL2TYPE#" NUMBER, "OWNER#" NUMBER, "OWNERNAME" VARCHAR2(30) NOT NULL ENABLE, "LVL0NAME" VARCHAR2(30) NOT NULL ENABLE, "LVL1NAME" VARCHAR2(30), "LVL2NAME" VARCHAR2(30), "INTCOLS" NUMBER NOT NULL ENABLE, "COLS" NUMBER, "KERNELCOLS" NUMBER, "TAB_FLAGS" NUMBER, "TRIGFLAG" NUMBER, "ASSOC#" NUMBER, "OBJ_FLAGS" NUMBER, "TS#" NUMBER, "TSNAME" VARCHAR2(30), "PROPERTY" NUMBER, "START_SCN" NUMBER NOT NULL ENABLE, "DROP_SCN" NUMBER, "XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "FLAGS" NUMBER, "LOGMNR_SPARE1" NUMBER, "LOGMNR_SPARE2" NUMBER, "LOGMNR_SPARE3" VARCHAR2(1000), "LOGMNR_SPARE4" DATE, "LOGMNR_SPARE5" NUMBER, "LOGMNR_SPARE6" NUMBER, "LOGMNR_SPARE7" NUMBER, "LOGMNR_SPARE8" NUMBER, "LOGMNR_SPARE9" NUMBER, "PARTTYPE" NUMBER, "SUBPARTTYPE" NUMBER, "UNSUPPORTEDCOLS" NUMBER, "COMPLEXTYPECOLS" NUMBER, "NTPARENTOBJNUM" NUMBER, "NTPARENTOBJVERSION" NUMBER, "NTPARENTINTCOLNUM" NUMBER, "LOGMNRTLOFLAGS" NUMBER, "LOGMNRMCV" VARCHAR2(30),  CONSTRAINT "LOGMNRC_GTLO_PK" PRIMARY KEY ("LOGMNR_UID", "KEYOBJ#", "BASEOBJV#") ENABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table DEPT
--------------------------------------------------------

  CREATE TABLE "DEPT" ("DNAME" VARCHAR2(20), "DLOCATION" VARCHAR2(20), "DID" VARCHAR2(20)) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_TAB_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "LOGMNR_GT_TAB_INCLUDE$" ("SCHEMA_NAME" VARCHAR2(32), "TABLE_NAME" VARCHAR2(32)) ON COMMIT PRESERVE ROWS 
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$PARAMETERS
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$PARAMETERS" ("NAME" VARCHAR2(30), "VALUE" VARCHAR2(2000), "TYPE" NUMBER, "SCN" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table DEF$_ERROR
--------------------------------------------------------

  CREATE TABLE "DEF$_ERROR" ("ENQ_TID" VARCHAR2(22), "ORIGIN_TRAN_DB" VARCHAR2(128), "ORIGIN_ENQ_TID" VARCHAR2(22), "DESTINATION" VARCHAR2(128), "STEP_NO" NUMBER, "RECEIVER" NUMBER, "ENQ_TIME" DATE, "ERROR_NUMBER" NUMBER, "ERROR_MSG" VARCHAR2(2000),  CONSTRAINT "DEF$_ERROR_PRIMARY" PRIMARY KEY ("ENQ_TID") ENABLE) 
 
   COMMENT ON COLUMN "DEF$_ERROR"."ENQ_TID" IS 'The ID of the transaction that created the error'
 
   COMMENT ON COLUMN "DEF$_ERROR"."ORIGIN_TRAN_DB" IS 'The database originating the deferred transaction'
 
   COMMENT ON COLUMN "DEF$_ERROR"."ORIGIN_ENQ_TID" IS 'The original ID of the transaction'
 
   COMMENT ON COLUMN "DEF$_ERROR"."DESTINATION" IS 'Database link used to address destination'
 
   COMMENT ON COLUMN "DEF$_ERROR"."STEP_NO" IS 'Unique ID of call that caused an error'
 
   COMMENT ON COLUMN "DEF$_ERROR"."RECEIVER" IS 'User ID of the original receiver'
 
   COMMENT ON COLUMN "DEF$_ERROR"."ENQ_TIME" IS 'Time original transaction enqueued'
 
   COMMENT ON COLUMN "DEF$_ERROR"."ERROR_NUMBER" IS 'Oracle error number'
 
   COMMENT ON COLUMN "DEF$_ERROR"."ERROR_MSG" IS 'Error message text'
 
   COMMENT ON TABLE "DEF$_ERROR"  IS 'Information about all deferred transactions that caused an error'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_GC
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_GC" ("GCID#" NUMBER NOT NULL ENABLE, "FJGID#" NUMBER NOT NULL ENABLE, "GCDESLEN" NUMBER NOT NULL ENABLE, "GCDES" LONG RAW NOT NULL ENABLE, "HASHVALUE" NUMBER NOT NULL ENABLE, "FREQUENCY" NUMBER,  CONSTRAINT "MVIEW$_ADV_GC_PK" PRIMARY KEY ("GCID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_GC_FK" FOREIGN KEY ("FJGID#") REFERENCES "MVIEW$_ADV_FJG" ("FJGID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_GC"  IS 'Group-by columns of a query'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_DDL
--------------------------------------------------------

  CREATE TABLE "REPCAT$_DDL" ("LOG_ID" NUMBER, "SOURCE" VARCHAR2(128), "ROLE" VARCHAR2(1), "MASTER" VARCHAR2(128), "LINE" NUMBER(*,0), "TEXT" VARCHAR2(2000), "DDL_NUM" NUMBER(*,0) DEFAULT 1       -- order of ddls to execute
,  CONSTRAINT "REPCAT$_DDL_PRNT" FOREIGN KEY ("LOG_ID", "SOURCE", "ROLE", "MASTER") REFERENCES "REPCAT$_REPCATLOG" ("ID", "SOURCE", "ROLE", "MASTER") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_DDL"."LOG_ID" IS 'Identifying number of the repcat log record'
 
   COMMENT ON COLUMN "REPCAT$_DDL"."SOURCE" IS 'Name of the database at which the request originated'
 
   COMMENT ON COLUMN "REPCAT$_DDL"."ROLE" IS 'Is this database the masterdef for the request'
 
   COMMENT ON COLUMN "REPCAT$_DDL"."MASTER" IS 'Name of the database that processes this request'
 
   COMMENT ON COLUMN "REPCAT$_DDL"."LINE" IS 'Ordering of records within a single request'
 
   COMMENT ON COLUMN "REPCAT$_DDL"."TEXT" IS 'Portion of an argument'
 
   COMMENT ON COLUMN "REPCAT$_DDL"."DDL_NUM" IS 'Ordering of DDLs to execute'
 
   COMMENT ON TABLE "REPCAT$_DDL"  IS 'Arguments that do not fit in a single repcat log record'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_BASETABLE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_BASETABLE" ("COLLECTIONID#" NUMBER NOT NULL ENABLE, "QUERYID#" NUMBER NOT NULL ENABLE, "OWNER" VARCHAR2(30), "TABLE_NAME" VARCHAR2(30), "TABLE_TYPE" NUMBER,  CONSTRAINT "MVIEW$_ADV_BASETABLE_FK" FOREIGN KEY ("QUERYID#") REFERENCES "MVIEW$_ADV_WORKLOAD" ("QUERYID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_BASETABLE"  IS 'Base tables refered by a query'
 
--------------------------------------------------------
--  DDL for Table TEST2
--------------------------------------------------------

  CREATE TABLE "TEST2" ("ID" VARCHAR2(20)) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_PRIORITY_GROUP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_PRIORITY_GROUP" ("SNAME" VARCHAR2(30), "PRIORITY_GROUP" VARCHAR2(30), "DATA_TYPE_ID" NUMBER(*,0) CONSTRAINT "REPCAT$_PRIORITY_GROUP_NN1" NOT NULL ENABLE, "FIXED_DATA_LENGTH" NUMBER(*,0), "PRIORITY_COMMENT" VARCHAR2(80),  CONSTRAINT "REPCAT$_PRIORITY_GROUP_C1" CHECK (data_type_id in (1, 2, 3, 4, 5, 6, 7)) ENABLE,  CONSTRAINT "REPCAT$_PRIORITY_GROUP_C2" CHECK ((data_type_id in (4, 7) and
                  fixed_data_length is not null)
              or (data_type_id in (1, 2, 3, 5, 6) and
                  fixed_data_length is null)) ENABLE,  CONSTRAINT "REPCAT$_PRIORITY_GROUP_PK" PRIMARY KEY ("PRIORITY_GROUP", "SNAME") ENABLE,  CONSTRAINT "REPCAT$_PRIORITY_GROUP_U1" UNIQUE ("SNAME", "PRIORITY_GROUP", "DATA_TYPE_ID", "FIXED_DATA_LENGTH") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."SNAME" IS 'Name of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."PRIORITY_GROUP" IS 'Name of the priority group'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."DATA_TYPE_ID" IS 'Datatype of the value in the priority group'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."FIXED_DATA_LENGTH" IS 'Length of the value in bytes if the datatype is CHAR'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."PRIORITY_COMMENT" IS 'Description of the priority group'
 
   COMMENT ON TABLE "REPCAT$_PRIORITY_GROUP"  IS 'Information about all priority groups in the database'
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$FLASHBACK_SCN
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$FLASHBACK_SCN" ("PRIMARY_SCN" NUMBER NOT NULL ENABLE, "PRIMARY_TIME" DATE, "STANDBY_SCN" NUMBER, "STANDBY_TIME" DATE, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" DATE,  PRIMARY KEY ("PRIMARY_SCN") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_PARAMETER$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PARAMETER$" ("SESSION#" NUMBER NOT NULL ENABLE, "NAME" VARCHAR2(30) NOT NULL ENABLE, "VALUE" VARCHAR2(2000), "TYPE" NUMBER, "SCN" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" OF "MEMBER_T" ( "MID" NOT NULL ENABLE,  PRIMARY KEY ("MID") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "STUDENT" ("FNAME" VARCHAR2(20), "LNAME" VARCHAR2(10)) 
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SKIP" ("ERROR" NUMBER, "STATEMENT_OPT" VARCHAR2(30), "SCHEMA" VARCHAR2(30), "NAME" VARCHAR2(65), "USE_LIKE" NUMBER, "ESC" VARCHAR2(1), "PROC" VARCHAR2(98), "ACTIVE" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_PARTOBJ$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PARTOBJ$" ("PARTTYPE" NUMBER, "PARTCNT" NUMBER, "PARTKEYCOLS" NUMBER, "FLAGS" NUMBER, "DEFTS#" NUMBER, "DEFPCTFREE" NUMBER, "DEFPCTUSED" NUMBER, "DEFPCTTHRES" NUMBER, "DEFINITRANS" NUMBER, "DEFMAXTRANS" NUMBER, "DEFTINIEXTS" NUMBER, "DEFEXTSIZE" NUMBER, "DEFMINEXTS" NUMBER, "DEFMAXEXTS" NUMBER, "DEFEXTPCT" NUMBER, "DEFLISTS" NUMBER, "DEFGROUPS" NUMBER, "DEFLOGGING" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "DEFINCLCOL" NUMBER, "PARAMETERS" VARCHAR2(1000), "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_PARTOBJ$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNRC_GTCS
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_GTCS" ("LOGMNR_UID" NUMBER NOT NULL ENABLE, "OBJ#" NUMBER NOT NULL ENABLE, "OBJV#" NUMBER NOT NULL ENABLE, "SEGCOL#" NUMBER NOT NULL ENABLE, "INTCOL#" NUMBER NOT NULL ENABLE, "COLNAME" VARCHAR2(30) NOT NULL ENABLE, "TYPE#" NUMBER NOT NULL ENABLE, "LENGTH" NUMBER, "PRECISION" NUMBER, "SCALE" NUMBER, "INTERVAL_LEADING_PRECISION" NUMBER, "INTERVAL_TRAILING_PRECISION" NUMBER, "PROPERTY" NUMBER, "TOID" RAW(16), "CHARSETID" NUMBER, "CHARSETFORM" NUMBER, "TYPENAME" VARCHAR2(30), "FQCOLNAME" VARCHAR2(4000), "NUMINTCOLS" NUMBER, "NUMATTRS" NUMBER, "ADTORDER" NUMBER, "LOGMNR_SPARE1" NUMBER, "LOGMNR_SPARE2" NUMBER, "LOGMNR_SPARE3" VARCHAR2(1000), "LOGMNR_SPARE4" DATE, "LOGMNR_SPARE5" NUMBER, "LOGMNR_SPARE6" NUMBER, "LOGMNR_SPARE7" NUMBER, "LOGMNR_SPARE8" NUMBER, "LOGMNR_SPARE9" NUMBER, "COL#" NUMBER, "XTYPESCHEMANAME" VARCHAR2(30), "XTYPENAME" VARCHAR2(4000), "XFQCOLNAME" VARCHAR2(4000), "XTOPINTCOL" NUMBER, "XREFFEDTABLEOBJN" NUMBER, "XREFFEDTABLEOBJV" NUMBER, "XCOLTYPEFLAGS" NUMBER, "XOPQTYPETYPE" NUMBER, "XOPQTYPEFLAGS" NUMBER, "XOPQLOBINTCOL" NUMBER, "XOPQOBJINTCOL" NUMBER, "XXMLINTCOL" NUMBER, "EAOWNER#" NUMBER, "EAMKEYID" VARCHAR2(64), "EAENCALG" NUMBER, "EAINTALG" NUMBER, "EACOLKLC" RAW(2000), "EAKLCLEN" NUMBER, "EAFLAGS" NUMBER,  CONSTRAINT "LOGMNRC_GTCS_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "OBJV#", "INTCOL#") ENABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGIN1
--------------------------------------------------------

  CREATE TABLE "LOGIN1" ("UN" VARCHAR2(10), "PWD" VARCHAR2(20)) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_REFGROUPS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_REFGROUPS" ("REFRESH_GROUP_ID" NUMBER NOT NULL ENABLE, "REFRESH_GROUP_NAME" VARCHAR2(30) NOT NULL ENABLE, "REFRESH_TEMPLATE_ID" NUMBER NOT NULL ENABLE, "ROLLBACK_SEG" VARCHAR2(30), "START_DATE" VARCHAR2(200), "INTERVAL" VARCHAR2(200),  CONSTRAINT "REPCAT$_TEMPLATE_REFGROUPS_PK" PRIMARY KEY ("REFRESH_GROUP_ID") ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_REFGROUPS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID") REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_GROUP_ID" IS 'Internal primary key of the refresh groups table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_GROUP_NAME" IS 'Name of the refresh group'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_TEMPLATE_ID" IS 'Primary key of the template containing the refresh group.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."ROLLBACK_SEG" IS 'Name of the rollback segment to use during refresh.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."START_DATE" IS 'Refresh start date.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."INTERVAL" IS 'Refresh interval.'
 
   COMMENT ON TABLE "REPCAT$_TEMPLATE_REFGROUPS"  IS 'Table for maintaining refresh group information for template.'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_INDCOMPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_INDCOMPART$" ("OBJ#" NUMBER, "DATAOBJ#" NUMBER, "BO#" NUMBER, "PART#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_INDCOMPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table GUEST_T
--------------------------------------------------------

  CREATE TABLE "GUEST_T" OF "GUEST" ( "MID" NOT NULL ENABLE,  PRIMARY KEY ("MID") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_PARAMETER_COLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_PARAMETER_COLUMN" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "CONFLICT_TYPE_ID" NUMBER(*,0), "REFERENCE_NAME" VARCHAR2(30), "SEQUENCE_NO" NUMBER, "PARAMETER_TABLE_NAME" VARCHAR2(30), "PARAMETER_COLUMN_NAME" VARCHAR2(4000), "PARAMETER_SEQUENCE_NO" NUMBER, "COLUMN_POS" NUMBER, "ATTRIBUTE_SEQUENCE_NO" NUMBER,  CONSTRAINT "REPCAT$_PARAMETER_COLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO", "PARAMETER_TABLE_NAME", "PARAMETER_SEQUENCE_NO", "COLUMN_POS") ENABLE,  CONSTRAINT "REPCAT$_PARAMETER_COLUMN_F1" FOREIGN KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") REFERENCES "REPCAT$_RESOLUTION" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."SNAME" IS 'Owner of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."ONAME" IS 'Name of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."CONFLICT_TYPE_ID" IS 'Type of conflict'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."SEQUENCE_NO" IS 'Ordering on resolution'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."PARAMETER_TABLE_NAME" IS 'Name of the table to which the parameter column belongs'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."PARAMETER_COLUMN_NAME" IS 'Name of the parameter column used for resolving the conflict'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."PARAMETER_SEQUENCE_NO" IS 'Ordering on parameter column'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."COLUMN_POS" IS 'Column position of an attribute or a column'
 
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."ATTRIBUTE_SEQUENCE_NO" IS 'Sequence number for an attribute of an ADT/pkREF column or a scalar column'
 
   COMMENT ON TABLE "REPCAT$_PARAMETER_COLUMN"  IS 'All columns used for resolving conflicts in the database'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_FLAVOR_OBJECTS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_FLAVOR_OBJECTS" ("FLAVOR_ID" NUMBER, "GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', "GNAME" VARCHAR2(30), "SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "TYPE" NUMBER, "VERSION#" NUMBER, "HASHCODE" RAW(17), "COLUMNS_PRESENT" RAW(125),  CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE,  CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_PK" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "GNAME", "FLAVOR_ID", "GOWNER") ENABLE,  CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_FK1" FOREIGN KEY ("GNAME", "GOWNER") REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE,  CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_FK2" FOREIGN KEY ("GNAME", "FLAVOR_ID", "GOWNER") REFERENCES "REPCAT$_FLAVORS" ("GNAME", "FLAVOR_ID", "GOWNER") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."FLAVOR_ID" IS 'Flavor identifier'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."GOWNER" IS 'Owner of the object group containing object'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."GNAME" IS 'Object group containing object'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."SNAME" IS 'Schema containing object'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."ONAME" IS 'Name of object'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."TYPE" IS 'Object type'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."VERSION#" IS 'Version# of a user-defined type'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."HASHCODE" IS 'Hashcode of a user-defined type'
 
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."COLUMNS_PRESENT" IS 'For tables, encoded mapping of columns present'
 
   COMMENT ON TABLE "REPCAT$_FLAVOR_OBJECTS"  IS 'Replicated objects in flavors'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_SQLDEPEND
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_SQLDEPEND" ("COLLECTIONID#" NUMBER, "INST_ID" NUMBER, "FROM_ADDRESS" RAW(16), "FROM_HASH" NUMBER, "TO_OWNER" VARCHAR2(64), "TO_NAME" VARCHAR2(1000), "TO_TYPE" NUMBER, "CARDINALITY" NUMBER) 
 
   COMMENT ON TABLE "MVIEW$_ADV_SQLDEPEND"  IS 'Temporary table for workload collections'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SESSION$" ("SESSION#" NUMBER, "CLIENT#" NUMBER, "SESSION_NAME" VARCHAR2(128) NOT NULL ENABLE, "DB_ID" NUMBER, "RESETLOGS_CHANGE#" NUMBER, "SESSION_ATTR" NUMBER, "SESSION_ATTR_VERBOSE" VARCHAR2(400), "START_SCN" NUMBER, "END_SCN" NUMBER, "SPILL_SCN" NUMBER, "SPILL_TIME" DATE, "OLDEST_SCN" NUMBER, "RESUME_SCN" NUMBER, "GLOBAL_DB_NAME" VARCHAR2(128) DEFAULT null, "RESET_TIMESTAMP" NUMBER, "BRANCH_SCN" NUMBER, "VERSION" VARCHAR2(64), "REDO_COMPAT" VARCHAR2(20), "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "SPARE4" NUMBER, "SPARE5" NUMBER, "SPARE6" DATE, "SPARE7" VARCHAR2(1000), "SPARE8" VARCHAR2(1000),  CONSTRAINT "LOGMNR_SESSION_PK" PRIMARY KEY ("SESSION#") ENABLE,  CONSTRAINT "LOGMNR_SESSION_UK1" UNIQUE ("SESSION_NAME") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table DEF$_CALLDEST
--------------------------------------------------------

  CREATE TABLE "DEF$_CALLDEST" ("ENQ_TID" VARCHAR2(22), "STEP_NO" NUMBER, "DBLINK" VARCHAR2(128), "SCHEMA_NAME" VARCHAR2(30), "PACKAGE_NAME" VARCHAR2(30), "CATCHUP" RAW(16) DEFAULT '00',  CONSTRAINT "DEF$_CALLDEST_PRIMARY" PRIMARY KEY ("ENQ_TID", "DBLINK", "STEP_NO") ENABLE,  CONSTRAINT "DEF$_CALL_DESTINATION" FOREIGN KEY ("DBLINK", "CATCHUP") REFERENCES "DEF$_DESTINATION" ("DBLINK", "CATCHUP") ENABLE) 
 
   COMMENT ON COLUMN "DEF$_CALLDEST"."ENQ_TID" IS 'Transaction ID'
 
   COMMENT ON COLUMN "DEF$_CALLDEST"."STEP_NO" IS 'Unique ID of call within transaction'
 
   COMMENT ON COLUMN "DEF$_CALLDEST"."DBLINK" IS 'The destination database'
 
   COMMENT ON COLUMN "DEF$_CALLDEST"."SCHEMA_NAME" IS 'The schema of the deferred remote procedure call'
 
   COMMENT ON COLUMN "DEF$_CALLDEST"."PACKAGE_NAME" IS 'The package of the deferred remote procedure call'
 
   COMMENT ON COLUMN "DEF$_CALLDEST"."CATCHUP" IS 'Dummy column for foreign key'
 
   COMMENT ON TABLE "DEF$_CALLDEST"  IS 'Information about call destinations for D-type and error transactions'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PARAMETERS
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_PARAMETERS" ("PARAMETER_NAME" VARCHAR2(30), "PARAMETER_TYPE" NUMBER NOT NULL ENABLE, "STRING_VALUE" VARCHAR2(30), "DATE_VALUE" DATE, "NUMERICAL_VALUE" NUMBER,  CONSTRAINT "MVIEW$_ADV_PARAMETERS_PK" PRIMARY KEY ("PARAMETER_NAME") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_PARAMETERS"  IS 'Summary advisor tuning parameters'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_CLIQUE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_CLIQUE" ("CLIQUEID#" NUMBER NOT NULL ENABLE, "RUNID#" NUMBER NOT NULL ENABLE, "CLIQUEDESLEN" NUMBER NOT NULL ENABLE, "CLIQUEDES" LONG RAW NOT NULL ENABLE, "HASHVALUE" NUMBER NOT NULL ENABLE, "FREQUENCY" NUMBER NOT NULL ENABLE, "BYTECOST" NUMBER NOT NULL ENABLE, "ROWSIZE" NUMBER NOT NULL ENABLE, "NUMROWS" NUMBER NOT NULL ENABLE,  CONSTRAINT "MVIEW$_ADV_CLIQUE_PK" PRIMARY KEY ("CLIQUEID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_CLIQUE_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_CLIQUE"  IS 'Table for storing canonical form of Clique queries'
 
--------------------------------------------------------
--  DDL for Table LOGMNRT_MDDL$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "LOGMNRT_MDDL$" ("SOURCE_OBJ#" NUMBER, "SOURCE_ROWID" ROWID, "DEST_ROWID" ROWID NOT NULL ENABLE,  CONSTRAINT "LOGMNRT_MDDL$_PK" PRIMARY KEY ("SOURCE_OBJ#", "SOURCE_ROWID") ENABLE) ON COMMIT DELETE ROWS 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REPPROP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPPROP" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "TYPE" NUMBER(*,0), "DBLINK" VARCHAR2(128), "HOW" NUMBER(*,0), "PROPAGATE_COMMENT" VARCHAR2(80), "DELIVERY_ORDER" NUMBER, "RECIPIENT_KEY" NUMBER, "EXTENSION_ID" RAW(16) DEFAULT '00',  CONSTRAINT "REPCAT$_REPPROP_HOW" CHECK (how IN (0, 1, 2, 3)) ENABLE,  CONSTRAINT "REPCAT$_REPPROP_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "DBLINK") ENABLE,  CONSTRAINT "REPCAT$_REPPROP_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE") REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."SNAME" IS 'Name of the object owner'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."ONAME" IS 'Name of the object'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."TYPE" IS 'Type of the object'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."DBLINK" IS 'Destination database for propagation'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."HOW" IS 'Propagation choice for the destination database'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."PROPAGATE_COMMENT" IS 'Description of the propagation choice'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."DELIVERY_ORDER" IS 'Value of delivery order when the master was added'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."RECIPIENT_KEY" IS 'Recipient key for sname and oname, used in joining with def$_aqcall'
 
   COMMENT ON COLUMN "REPCAT$_REPPROP"."EXTENSION_ID" IS 'Identifier of any active extension request'
 
   COMMENT ON TABLE "REPCAT$_REPPROP"  IS 'Propagation information about replicated objects'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_LOG$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOG$" ("SESSION#" NUMBER, "THREAD#" NUMBER, "SEQUENCE#" NUMBER, "FIRST_CHANGE#" NUMBER, "NEXT_CHANGE#" NUMBER, "FIRST_TIME" DATE, "NEXT_TIME" DATE, "FILE_NAME" VARCHAR2(513), "STATUS" NUMBER, "INFO" VARCHAR2(32), "TIMESTAMP" DATE, "DICT_BEGIN" VARCHAR2(3), "DICT_END" VARCHAR2(3), "STATUS_INFO" VARCHAR2(32), "DB_ID" NUMBER, "RESETLOGS_CHANGE#" NUMBER, "RESET_TIMESTAMP" NUMBER, "PREV_RESETLOGS_CHANGE#" NUMBER, "PREV_RESET_TIMESTAMP" NUMBER, "BLOCKS" NUMBER, "BLOCK_SIZE" NUMBER, "FLAGS" NUMBER, "CONTENTS" NUMBER, "RECID" NUMBER, "RECSTAMP" NUMBER, "MARK_DELETE_TIMESTAMP" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "SPARE4" NUMBER, "SPARE5" NUMBER,  CONSTRAINT "LOGMNR_LOG$_PK" PRIMARY KEY ("SESSION#", "THREAD#", "SEQUENCE#", "FIRST_CHANGE#", "DB_ID", "RESETLOGS_CHANGE#", "RESET_TIMESTAMP") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REFRESH_TEMPLATES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID" NUMBER NOT NULL ENABLE, "OWNER" VARCHAR2(30) NOT NULL ENABLE, "REFRESH_GROUP_NAME" VARCHAR2(30) NOT NULL ENABLE, "REFRESH_TEMPLATE_NAME" VARCHAR2(30) NOT NULL ENABLE, "TEMPLATE_COMMENT" VARCHAR2(2000), "PUBLIC_TEMPLATE" VARCHAR2(1), "LAST_MODIFIED" DATE, "MODIFIED_BY" NUMBER, "CREATION_DATE" DATE, "CREATED_BY" NUMBER, "REFRESH_GROUP_ID" NUMBER DEFAULT 0 NOT NULL ENABLE, "TEMPLATE_TYPE_ID" NUMBER DEFAULT 1 NOT NULL ENABLE, "TEMPLATE_STATUS_ID" NUMBER DEFAULT 0 NOT NULL ENABLE, "FLAGS" RAW(255), "SPARE1" VARCHAR2(4000),  CONSTRAINT "REFRESH_TEMPLATES_C1" CHECK ((public_template in ('Y','N'))
   or public_template is NULL) ENABLE,  CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_PK" PRIMARY KEY ("REFRESH_TEMPLATE_ID") ENABLE,  CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_U1" UNIQUE ("REFRESH_TEMPLATE_NAME") ENABLE,  CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_FK1" FOREIGN KEY ("TEMPLATE_TYPE_ID") REFERENCES "REPCAT$_TEMPLATE_TYPES" ("TEMPLATE_TYPE_ID") ENABLE,  CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_FK2" FOREIGN KEY ("TEMPLATE_STATUS_ID") REFERENCES "REPCAT$_TEMPLATE_STATUS" ("TEMPLATE_STATUS_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."OWNER" IS 'Owner of the refresh group template.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_GROUP_NAME" IS 'Name of the refresh group to create during instantiation.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_TEMPLATE_NAME" IS 'Name of the refresh group template.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_COMMENT" IS 'Optional comment field for the refresh group template.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."PUBLIC_TEMPLATE" IS 'Flag specifying public template or private template.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."LAST_MODIFIED" IS 'Date the row was last modified.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."MODIFIED_BY" IS 'User id of the user that modified the row.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."CREATION_DATE" IS 'Date the row was created.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."CREATED_BY" IS 'User id of the user that created the row.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_GROUP_ID" IS 'Internal primary key to default refresh group for the template.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_TYPE_ID" IS 'Internal primary key to the template types.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_STATUS_ID" IS 'Internal primary key to the template status table.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."FLAGS" IS 'Internal flags for the template.'
 
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."SPARE1" IS 'Reserved for future use.'
 
   COMMENT ON TABLE "REPCAT$_REFRESH_TEMPLATES"  IS 'Primary table containing deployment template information.'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_TYPES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_TYPES" ("TEMPLATE_TYPE_ID" NUMBER, "TEMPLATE_DESCRIPTION" VARCHAR2(200), "FLAGS" RAW(255), "SPARE1" VARCHAR2(4000),  CONSTRAINT "REPCAT$_TEMPLATE_TYPES_PK" PRIMARY KEY ("TEMPLATE_TYPE_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."TEMPLATE_TYPE_ID" IS 'Internal primary key of the template types table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."TEMPLATE_DESCRIPTION" IS 'Description of the template type.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."FLAGS" IS 'Bitmap flags controlling each type of template.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."SPARE1" IS 'Reserved for future expansion.'
 
   COMMENT ON TABLE "REPCAT$_TEMPLATE_TYPES"  IS 'Internal table for maintaining types of templates.'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_INSTANTIATION_DDL
--------------------------------------------------------

  CREATE TABLE "REPCAT$_INSTANTIATION_DDL" ("REFRESH_TEMPLATE_ID" NUMBER, "DDL_TEXT" CLOB, "DDL_NUM" NUMBER, "PHASE" NUMBER,  CONSTRAINT "REPCAT$_INSTANTIATION_DDL_PK" PRIMARY KEY ("REFRESH_TEMPLATE_ID", "PHASE", "DDL_NUM") ENABLE,  CONSTRAINT "REPCAT$_INSTANTIATION_DDL_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID") REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."REFRESH_TEMPLATE_ID" IS 'Primary key of template containing supplementary DDL.'
 
   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."DDL_TEXT" IS 'Supplementary DDL string.'
 
   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."DDL_NUM" IS 'Column for ordering of supplementary DDL.'
 
   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."PHASE" IS 'Phase to execute the DDL string.'
 
   COMMENT ON TABLE "REPCAT$_INSTANTIATION_DDL"  IS 'Table containing supplementary DDL to be executed during instantiation.'
 
--------------------------------------------------------
--  DDL for Table DEF$_AQERROR
--------------------------------------------------------

  CREATE TABLE "DEF$_AQERROR" ("Q_NAME" VARCHAR2(30), "MSGID" RAW(16), "CORRID" VARCHAR2(128), "PRIORITY" NUMBER, "STATE" NUMBER, "DELAY" TIMESTAMP (6), "EXPIRATION" NUMBER, "TIME_MANAGER_INFO" TIMESTAMP (6), "LOCAL_ORDER_NO" NUMBER, "CHAIN_NO" NUMBER, "CSCN" NUMBER, "DSCN" NUMBER, "ENQ_TIME" TIMESTAMP (6), "ENQ_UID" NUMBER, "ENQ_TID" VARCHAR2(30), "DEQ_TIME" TIMESTAMP (6), "DEQ_UID" NUMBER, "DEQ_TID" VARCHAR2(30), "RETRY_COUNT" NUMBER, "EXCEPTION_QSCHEMA" VARCHAR2(30), "EXCEPTION_QUEUE" VARCHAR2(30), "STEP_NO" NUMBER, "RECIPIENT_KEY" NUMBER, "DEQUEUE_MSGID" RAW(16), "USER_DATA" BLOB,  PRIMARY KEY ("ENQ_TID", "STEP_NO") ENABLE) USAGE QUEUE 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_USER_AUTHORIZATIONS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_USER_AUTHORIZATIONS" ("USER_AUTHORIZATION_ID" NUMBER NOT NULL ENABLE, "USER_ID" NUMBER NOT NULL ENABLE, "REFRESH_TEMPLATE_ID" NUMBER NOT NULL ENABLE,  CONSTRAINT "REPCAT$_USER_AUTHORIZATIONS_PK" PRIMARY KEY ("USER_AUTHORIZATION_ID") ENABLE,  CONSTRAINT "REPCAT$_USER_AUTHORIZATIONS_U1" UNIQUE ("USER_ID", "REFRESH_TEMPLATE_ID") ENABLE,  CONSTRAINT "REPCAT$_USER_AUTHORIZATION_FK2" FOREIGN KEY ("REFRESH_TEMPLATE_ID") REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_USER_AUTHORIZATIONS"."USER_AUTHORIZATION_ID" IS 'Internal primary key of the REPCAT$_USER_AUTHORIZATIONS table.'
 
   COMMENT ON COLUMN "REPCAT$_USER_AUTHORIZATIONS"."USER_ID" IS 'Database user id.'
 
   COMMENT ON COLUMN "REPCAT$_USER_AUTHORIZATIONS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.'
 
--------------------------------------------------------
--  DDL for Table TOTA
--------------------------------------------------------

  CREATE TABLE "TOTA" ("NAME" VARCHAR2(10)) 
 
--------------------------------------------------------
--  DDL for Table DEF$_AQCALL
--------------------------------------------------------

  CREATE TABLE "DEF$_AQCALL" ("Q_NAME" VARCHAR2(30), "MSGID" RAW(16), "CORRID" VARCHAR2(128), "PRIORITY" NUMBER, "STATE" NUMBER, "DELAY" TIMESTAMP (6), "EXPIRATION" NUMBER, "TIME_MANAGER_INFO" TIMESTAMP (6), "LOCAL_ORDER_NO" NUMBER, "CHAIN_NO" NUMBER, "CSCN" NUMBER, "DSCN" NUMBER, "ENQ_TIME" TIMESTAMP (6), "ENQ_UID" NUMBER, "ENQ_TID" VARCHAR2(30), "DEQ_TIME" TIMESTAMP (6), "DEQ_UID" NUMBER, "DEQ_TID" VARCHAR2(30), "RETRY_COUNT" NUMBER, "EXCEPTION_QSCHEMA" VARCHAR2(30), "EXCEPTION_QUEUE" VARCHAR2(30), "STEP_NO" NUMBER, "RECIPIENT_KEY" NUMBER, "DEQUEUE_MSGID" RAW(16), "USER_DATA" BLOB,  PRIMARY KEY ("ENQ_TID", "STEP_NO") ENABLE) USAGE QUEUE 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REPSCHEMA
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPSCHEMA" ("GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', "SNAME" VARCHAR2(30), "DBLINK" VARCHAR2(128), "MASTERDEF" VARCHAR2(1), "SNAPMASTER" VARCHAR2(1), "MASTER_COMMENT" VARCHAR2(80), "MASTER" VARCHAR2(1), "PROP_UPDATES" NUMBER DEFAULT 0, "MY_DBLINK" VARCHAR2(1), "EXTENSION_ID" RAW(16) DEFAULT '00',  CONSTRAINT "REPCAT$_REPSCHEMA_PRIMARY" PRIMARY KEY ("SNAME", "DBLINK", "GOWNER") ENABLE,  CONSTRAINT "REPCAT$_REPSCHEMA_PRNT" FOREIGN KEY ("SNAME", "GOWNER") REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE,  CONSTRAINT "REPCAT$_REPSCHEMA_DEST" FOREIGN KEY ("DBLINK", "EXTENSION_ID") REFERENCES "DEF$_DESTINATION" ("DBLINK", "CATCHUP") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."GOWNER" IS 'Owner of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."SNAME" IS 'Name of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."DBLINK" IS 'A database site replicating the object group'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MASTERDEF" IS 'Is the database the master definition site for the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."SNAPMASTER" IS 'For a snapshot site, is this the current refresh_master'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MASTER_COMMENT" IS 'Description of the database site'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MASTER" IS 'Redundant information from repcat$_repcat.master'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."PROP_UPDATES" IS 'Number of requested updates for master in repcat$_repprop'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MY_DBLINK" IS 'A sanity check after import: is this master the current site'
 
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."EXTENSION_ID" IS 'Dummy column for foreign key'
 
   COMMENT ON TABLE "REPCAT$_REPSCHEMA"  IS 'N-way replication information'
 
--------------------------------------------------------
--  DDL for Table SQLPLUS_PRODUCT_PROFILE
--------------------------------------------------------

  CREATE TABLE "SQLPLUS_PRODUCT_PROFILE" ("PRODUCT" VARCHAR2(30) NOT NULL ENABLE, "USERID" VARCHAR2(30), "ATTRIBUTE" VARCHAR2(240), "SCOPE" VARCHAR2(240), "NUMERIC_VALUE" NUMBER(15,2), "CHAR_VALUE" VARCHAR2(240), "DATE_VALUE" DATE, "LONG_VALUE" LONG) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_INFO
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_INFO" ("RUNID#" NUMBER NOT NULL ENABLE, "SEQ#" NUMBER NOT NULL ENABLE, "TYPE" NUMBER NOT NULL ENABLE, "INFOLEN" NUMBER NOT NULL ENABLE, "INFO" LONG RAW, "STATUS" NUMBER, "FLAG" NUMBER,  CONSTRAINT "MVIEW$_ADV_INFO_PK" PRIMARY KEY ("RUNID#", "SEQ#") ENABLE,  CONSTRAINT "MVIEW$_ADV_INFO_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_INFO"  IS 'Internal table for passing information from the SQL analyzer'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_INDEX
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_INDEX" ("RUNID#" NUMBER NOT NULL ENABLE, "RANK#" NUMBER NOT NULL ENABLE, "MVINDEX#" NUMBER NOT NULL ENABLE, "INDEX_TYPE" NUMBER, "INDEX_NAME" VARCHAR2(50), "COLUMN_NAME" VARCHAR2(32), "INDEX_CONTENT" VARCHAR2(2000), "SUMMARY_OWNER" VARCHAR2(32)) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_COL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_COL$" ("COL#" NUMBER(22,0), "SEGCOL#" NUMBER(22,0), "NAME" VARCHAR2(30), "TYPE#" NUMBER(22,0), "LENGTH" NUMBER(22,0), "PRECISION#" NUMBER(22,0), "SCALE" NUMBER(22,0), "NULL$" NUMBER(22,0), "INTCOL#" NUMBER(22,0), "PROPERTY" NUMBER(22,0), "CHARSETID" NUMBER(22,0), "CHARSETFORM" NUMBER(22,0), "SPARE1" NUMBER(22,0), "SPARE2" NUMBER(22,0), "OBJ#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_COL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION_METHOD
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOLUTION_METHOD" ("CONFLICT_TYPE_ID" NUMBER(*,0), "METHOD_NAME" VARCHAR2(80),  CONSTRAINT "REPCAT$_RESOL_METHOD_PK" PRIMARY KEY ("CONFLICT_TYPE_ID", "METHOD_NAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_METHOD"."CONFLICT_TYPE_ID" IS 'Type of conflict'
 
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_METHOD"."METHOD_NAME" IS 'Name of the conflict resolution method'
 
   COMMENT ON TABLE "REPCAT$_RESOLUTION_METHOD"  IS 'All conflict resolution methods in the database'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_COLTYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_COLTYPE$" ("COL#" NUMBER, "INTCOL#" NUMBER, "TOID" RAW(16), "VERSION#" NUMBER, "PACKED" NUMBER, "INTCOLS" NUMBER, "INTCOL#S" RAW(2000), "FLAGS" NUMBER, "TYPIDCOL#" NUMBER, "SYNOBJ#" NUMBER, "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_COLTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_LOBFRAG$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOBFRAG$" ("FRAGOBJ#" NUMBER, "PARENTOBJ#" NUMBER, "TABFRAGOBJ#" NUMBER, "INDFRAGOBJ#" NUMBER, "FRAG#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_LOBFRAG$_PK" PRIMARY KEY ("LOGMNR_UID", "FRAGOBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOG
--------------------------------------------------------

  CREATE TABLE "LOG" ("UN" VARCHAR2(10), "PWD" VARCHAR2(10)) 
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$APPLY_PROGRESS
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$APPLY_PROGRESS" ("XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "COMMIT_SCN" NUMBER, "COMMIT_TIME" DATE, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000))  PARTITION BY RANGE ("COMMIT_SCN")  (PARTITION "P0"  VALUES LESS THAN (0) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_ATTRCOL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ATTRCOL$" ("INTCOL#" NUMBER, "NAME" VARCHAR2(4000), "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_ATTRCOL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_FILTER$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_FILTER$" ("SESSION#" NUMBER, "FILTER_TYPE" VARCHAR2(30), "ATTR1" NUMBER, "ATTR2" NUMBER, "ATTR3" NUMBER, "ATTR4" NUMBER, "ATTR5" NUMBER, "ATTR6" NUMBER, "FILTER_SCN" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" DATE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION_EVOLVE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SESSION_EVOLVE$" ("BRANCH_LEVEL" NUMBER, "SESSION#" NUMBER, "DB_ID" NUMBER, "RESET_SCN" NUMBER, "RESET_TIMESTAMP" NUMBER, "PREV_RESET_SCN" NUMBER, "PREV_RESET_TIMESTAMP" NUMBER, "STATUS" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "SPARE4" DATE,  CONSTRAINT "LOGMNR_SESSION_EVOLVE$_PK" PRIMARY KEY ("SESSION#", "DB_ID", "RESET_SCN", "RESET_TIMESTAMP") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_SEED$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SEED$" ("SEED_VERSION" NUMBER(22,0), "GATHER_VERSION" NUMBER(22,0), "SCHEMANAME" VARCHAR2(30), "OBJ#" NUMBER, "OBJV#" NUMBER(22,0), "TABLE_NAME" VARCHAR2(30), "COL_NAME" VARCHAR2(30), "COL#" NUMBER, "INTCOL#" NUMBER, "SEGCOL#" NUMBER, "TYPE#" NUMBER, "LENGTH" NUMBER, "PRECISION#" NUMBER, "SCALE" NUMBER, "NULL$" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_SEED$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP_SUPPORT
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SKIP_SUPPORT" ("ACTION" NUMBER NOT NULL ENABLE, "NAME" VARCHAR2(30) NOT NULL ENABLE, "REG" NUMBER(*,0), "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_DICTIONARY$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_DICTIONARY$" ("DB_NAME" VARCHAR2(9), "DB_ID" NUMBER(20,0), "DB_CREATED" VARCHAR2(20), "DB_DICT_CREATED" VARCHAR2(20), "DB_DICT_SCN" NUMBER(22,0), "DB_THREAD_MAP" RAW(8), "DB_TXN_SCNBAS" NUMBER(22,0), "DB_TXN_SCNWRP" NUMBER(22,0), "DB_RESETLOGS_CHANGE#" NUMBER(22,0), "DB_RESETLOGS_TIME" VARCHAR2(20), "DB_VERSION_TIME" VARCHAR2(20), "DB_REDO_TYPE_ID" VARCHAR2(8), "DB_REDO_RELEASE" VARCHAR2(60), "DB_CHARACTER_SET" VARCHAR2(30), "DB_VERSION" VARCHAR2(64), "DB_STATUS" VARCHAR2(64), "DB_GLOBAL_NAME" VARCHAR2(128), "DB_DICT_MAXOBJECTS" NUMBER(22,0), "DB_DICT_OBJECTCOUNT" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_DICTIONARY$_PK" PRIMARY KEY ("LOGMNR_UID") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_UID$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_UID$" ("LOGMNR_UID" NUMBER(22,0), "SESSION#" NUMBER,  CONSTRAINT "LOGMNR_UID$_PK" PRIMARY KEY ("SESSION#") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table AQ$_INTERNET_AGENTS
--------------------------------------------------------

  CREATE TABLE "AQ$_INTERNET_AGENTS" ("AGENT_NAME" VARCHAR2(30) NOT NULL ENABLE, "PROTOCOL" NUMBER(*,0) NOT NULL ENABLE, "SPARE1" VARCHAR2(128),  PRIMARY KEY ("AGENT_NAME") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_OWB
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "MVIEW$_ADV_OWB" ("RUNID#" NUMBER, "OBJNAME" VARCHAR2(30), "OWNERNAME" VARCHAR2(30), "MVSCRIPT" CLOB, "INDEXSCRIPT" CLOB) ON COMMIT PRESERVE ROWS 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_USER$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_USER$" ("USER#" NUMBER(22,0), "NAME" VARCHAR2(30) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_USER$_PK" PRIMARY KEY ("LOGMNR_UID", "USER#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_OBJECT_PARMS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_OBJECT_PARMS" ("TEMPLATE_PARAMETER_ID" NUMBER NOT NULL ENABLE, "TEMPLATE_OBJECT_ID" NUMBER NOT NULL ENABLE,  CONSTRAINT "REPCAT$_OBJECT_PARMS_PK" PRIMARY KEY ("TEMPLATE_PARAMETER_ID", "TEMPLATE_OBJECT_ID") ENABLE,  CONSTRAINT "REPCAT$_OBJECT_PARMS_FK1" FOREIGN KEY ("TEMPLATE_PARAMETER_ID") REFERENCES "REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID") ENABLE,  CONSTRAINT "REPCAT$_OBJECT_PARMS_FK2" FOREIGN KEY ("TEMPLATE_OBJECT_ID") REFERENCES "REPCAT$_TEMPLATE_OBJECTS" ("TEMPLATE_OBJECT_ID") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_OBJECT_PARMS"."TEMPLATE_PARAMETER_ID" IS 'Primary key of template parameter.'
 
   COMMENT ON COLUMN "REPCAT$_OBJECT_PARMS"."TEMPLATE_OBJECT_ID" IS 'Primary key of object using the paramter.'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_USER_PARM_VALUES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_USER_PARM_VALUES" ("USER_PARAMETER_ID" NUMBER, "TEMPLATE_PARAMETER_ID" NUMBER NOT NULL ENABLE, "USER_ID" NUMBER NOT NULL ENABLE, "PARM_VALUE" CLOB,  CONSTRAINT "REPCAT$_USER_PARM_VALUES_PK" PRIMARY KEY ("USER_PARAMETER_ID") ENABLE,  CONSTRAINT "REPCAT$_USER_PARM_VALUES_U1" UNIQUE ("TEMPLATE_PARAMETER_ID", "USER_ID") ENABLE,  CONSTRAINT "REPCAT$_USER_PARM_VALUES_FK1" FOREIGN KEY ("TEMPLATE_PARAMETER_ID") REFERENCES "REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."USER_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_USER_PARM_VALUES table.'
 
   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."TEMPLATE_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_PARMS table.'
 
   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."USER_ID" IS 'Database user id.'
 
   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."PARM_VALUE" IS 'Value of the parameter for this user.'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_PROCESSED_LOG$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PROCESSED_LOG$" ("SESSION#" NUMBER, "THREAD#" NUMBER, "SEQUENCE#" NUMBER, "FIRST_CHANGE#" NUMBER, "NEXT_CHANGE#" NUMBER, "FIRST_TIME" DATE, "NEXT_TIME" DATE, "FILE_NAME" VARCHAR2(513), "STATUS" NUMBER, "INFO" VARCHAR2(32), "TIMESTAMP" DATE,  CONSTRAINT "LOGMNR_PROCESSED_LOG$_PK" PRIMARY KEY ("SESSION#", "THREAD#") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNRC_GSII
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_GSII" ("LOGMNR_UID" NUMBER NOT NULL ENABLE, "OBJ#" NUMBER NOT NULL ENABLE, "BO#" NUMBER NOT NULL ENABLE, "INDTYPE#" NUMBER NOT NULL ENABLE, "DROP_SCN" NUMBER, "LOGMNR_SPARE1" NUMBER, "LOGMNR_SPARE2" NUMBER, "LOGMNR_SPARE3" VARCHAR2(1000), "LOGMNR_SPARE4" DATE,  CONSTRAINT "LOGMNRC_GSII_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") ENABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table DEF$_DEFAULTDEST
--------------------------------------------------------

  CREATE TABLE "DEF$_DEFAULTDEST" ("DBLINK" VARCHAR2(128),  CONSTRAINT "DEF$_DEFAULTDEST_PRIMARY" PRIMARY KEY ("DBLINK") ENABLE) 
 
   COMMENT ON COLUMN "DEF$_DEFAULTDEST"."DBLINK" IS 'Default destination'
 
   COMMENT ON TABLE "DEF$_DEFAULTDEST"  IS 'Default destinations for deferred remote procedure calls'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_PROPS$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PROPS$" ("VALUE$" VARCHAR2(4000), "COMMENT$" VARCHAR2(4000), "NAME" VARCHAR2(30) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_PROPS$_PK" PRIMARY KEY ("LOGMNR_UID", "NAME") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_WORKLOAD
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_WORKLOAD" ("QUERYID#" NUMBER NOT NULL ENABLE, "COLLECTIONID#" NUMBER NOT NULL ENABLE, "COLLECTTIME" DATE NOT NULL ENABLE, "APPLICATION" VARCHAR2(64), "CARDINALITY" NUMBER, "RESULTSIZE" NUMBER, "UNAME" VARCHAR2(30) NOT NULL ENABLE, "QDATE" DATE, "PRIORITY" NUMBER, "EXEC_TIME" NUMBER, "SQL_TEXT" LONG NOT NULL ENABLE, "SQL_TEXTLEN" NUMBER NOT NULL ENABLE, "SQL_HASH" NUMBER, "SQL_ADDR" RAW(16), "FREQUENCY" NUMBER,  CONSTRAINT "MVIEW$_ADV_WORKLOAD_PK" PRIMARY KEY ("QUERYID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_WORKLOAD"  IS 'Shared workload repository for DBA users of summary advisor'
 
--------------------------------------------------------
--  DDL for Table DEF$_DESTINATION
--------------------------------------------------------

  CREATE TABLE "DEF$_DESTINATION" ("DBLINK" VARCHAR2(128), "LAST_DELIVERED" NUMBER DEFAULT 0 NOT NULL ENABLE, "LAST_ENQ_TID" VARCHAR2(22), "LAST_SEQ" NUMBER, "DISABLED" CHAR(1), "JOB" NUMBER, "LAST_TXN_COUNT" NUMBER, "LAST_ERROR_NUMBER" NUMBER, "LAST_ERROR_MESSAGE" VARCHAR2(2000), "APPLY_INIT" VARCHAR2(4000), "CATCHUP" RAW(16) DEFAULT '00', "ALTERNATE" CHAR(1) DEFAULT 'F', "TOTAL_TXN_COUNT" NUMBER DEFAULT 0, "TOTAL_PROP_TIME_THROUGHPUT" NUMBER DEFAULT 0, "TOTAL_PROP_TIME_LATENCY" NUMBER DEFAULT 0, "TO_COMMUNICATION_SIZE" NUMBER DEFAULT 0, "FROM_COMMUNICATION_SIZE" NUMBER DEFAULT 0, "FLAG" RAW(4) DEFAULT '00000000', "SPARE1" NUMBER DEFAULT 0, "SPARE2" NUMBER DEFAULT 0, "SPARE3" NUMBER DEFAULT 0, "SPARE4" NUMBER DEFAULT 0,  CONSTRAINT "DEF$_DESTINATION_PRIMARY" PRIMARY KEY ("DBLINK", "CATCHUP") ENABLE) 
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."DBLINK" IS 'Destination'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_DELIVERED" IS 'Value of delivery_order of last transaction propagated'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_ENQ_TID" IS 'Transaction ID of last transaction propagated'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_SEQ" IS 'Parallel prop seq number of last transaction propagated'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."DISABLED" IS 'Is propagation to destination disabled'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."JOB" IS 'Number of job that pushes queue'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_TXN_COUNT" IS 'Number of transactions pushed during last attempt'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_ERROR_NUMBER" IS 'Oracle error number from last push'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_ERROR_MESSAGE" IS 'Error message from last push'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."CATCHUP" IS 'Used to break transaction into pieces'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."ALTERNATE" IS 'Used to break transaction into pieces'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."TOTAL_TXN_COUNT" IS 'Total number of transactions pushed'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."TOTAL_PROP_TIME_THROUGHPUT" IS 'Total propagation time in seconds for measuring throughput'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."TOTAL_PROP_TIME_LATENCY" IS 'Total propagation time in seconds for measuring latency'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."TO_COMMUNICATION_SIZE" IS 'Total number of bytes sent to this dblink'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."FROM_COMMUNICATION_SIZE" IS 'Total number of bytes received from this dblink'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE1" IS 'Total number of round trips for this dblink'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE2" IS 'Total number of administrative requests'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE3" IS 'Total number of error transactions pushed'
 
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE4" IS 'Total time in seconds spent sleeping during push'
 
   COMMENT ON TABLE "DEF$_DESTINATION"  IS 'Information about propagation to different destinations'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_TABCOMPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TABCOMPART$" ("OBJ#" NUMBER(22,0), "BO#" NUMBER(22,0), "PART#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_TABCOMPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCOLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPCOLUMN" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "TYPE" NUMBER(*,0), "CNAME" VARCHAR2(30), "LCNAME" VARCHAR2(4000), "TOID" RAW(16), "VERSION#" NUMBER, "HASHCODE" RAW(17), "CTYPE_NAME" VARCHAR2(30), "CTYPE_OWNER" VARCHAR2(30), "ID" NUMBER, "POS" NUMBER, "TOP" VARCHAR2(30), "FLAG" RAW(2) DEFAULT '0000', "CTYPE" NUMBER, "LENGTH" NUMBER, "PRECISION#" NUMBER, "SCALE" NUMBER, "NULL$" NUMBER, "CHARSETID" NUMBER, "CHARSETFORM" NUMBER, "PROPERTY" RAW(4) DEFAULT '00000000', "CLENGTH" NUMBER,  CONSTRAINT "REPCAT$_REPCOLUMN_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE,  CONSTRAINT "REPCAT$_REPCOLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "CNAME") ENABLE,  CONSTRAINT "REPCAT$_REPCOLUMN_FK" FOREIGN KEY ("SNAME", "ONAME", "TYPE") REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."SNAME" IS 'Name of the object owner'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."ONAME" IS 'Name of the object'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."TYPE" IS 'Type of the object'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CNAME" IS 'Column name'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."LCNAME" IS 'Long column name'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."TOID" IS 'Type object identifier of a user-defined type'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."VERSION#" IS 'Version# of a column of user-defined type'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."HASHCODE" IS 'Hashcode of a column of user-defined type'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."ID" IS 'Column ID'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."POS" IS 'Ordering of column used as IN parameter in the replication procedures'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."TOP" IS 'Top column name for an attribute'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."FLAG" IS 'Replication information about column'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CTYPE" IS 'Type of the column'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."LENGTH" IS 'Length of the column in bytes'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."PRECISION#" IS 'Length: decimal digits (NUMBER) or binary digits (FLOAT)'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."SCALE" IS 'Digits to right of decimal point in a number'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."NULL$" IS 'Does column allow NULL values?'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CHARSETID" IS 'Character set identifier'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CHARSETFORM" IS 'Character set form'
 
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CLENGTH" IS 'The maximum length of the column in characters'
 
   COMMENT ON TABLE "REPCAT$_REPCOLUMN"  IS 'Replicated columns for a table sorted alphabetically in ascending order'
 
--------------------------------------------------------
--  DDL for Table COMP
--------------------------------------------------------

  CREATE TABLE "COMP" ("COURSE" VARCHAR2(4000)) 
 
--------------------------------------------------------
--  DDL for Table BOOK_T
--------------------------------------------------------

  CREATE TABLE "BOOK_T" OF "BOOK" ( "ISBN" NOT NULL ENABLE,  PRIMARY KEY ("ISBN") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table HP
--------------------------------------------------------

  CREATE TABLE "HP" ("ID" VARCHAR2(4000) NOT NULL ENABLE, "NAME" VARCHAR2(4000),  CONSTRAINT "HP_PK" PRIMARY KEY ("ID") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_LEVEL
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_LEVEL" ("RUNID#" NUMBER NOT NULL ENABLE, "LEVELID#" NUMBER NOT NULL ENABLE, "DIMOBJ#" NUMBER, "FLAGS" NUMBER NOT NULL ENABLE, "TBLOBJ#" NUMBER NOT NULL ENABLE, "COLUMNLIST" RAW(70) NOT NULL ENABLE, "LEVELNAME" VARCHAR2(30),  CONSTRAINT "MVIEW$_ADV_LEVEL_PK" PRIMARY KEY ("RUNID#", "LEVELID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_LEVEL_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_LEVEL"  IS 'Level definition'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FILTER
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_FILTER" ("FILTERID#" NUMBER NOT NULL ENABLE, "SUBFILTERNUM#" NUMBER NOT NULL ENABLE, "SUBFILTERTYPE" NUMBER NOT NULL ENABLE, "STR_VALUE" VARCHAR2(1028), "NUM_VALUE1" NUMBER, "NUM_VALUE2" NUMBER, "DATE_VALUE1" DATE, "DATE_VALUE2" DATE,  CONSTRAINT "MVIEW$_ADV_FILTER_PK" PRIMARY KEY ("FILTERID#", "SUBFILTERNUM#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_FILTER"  IS 'Table for workload filter definition'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PARTITION
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_PARTITION" ("RUNID#" NUMBER NOT NULL ENABLE, "RANK#" NUMBER NOT NULL ENABLE, "SUMMARY_OWNER" VARCHAR2(32), "QUERY_TEXT" LONG) 
 
--------------------------------------------------------
--  DDL for Table LOGIN
--------------------------------------------------------

  CREATE TABLE "LOGIN" ("UN" VARCHAR2(10), "PWD" VARCHAR2(10)) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_PRIORITY
--------------------------------------------------------

  CREATE TABLE "REPCAT$_PRIORITY" ("SNAME" VARCHAR2(30) CONSTRAINT "REPCAT$_PRIORITY_NN1" NOT NULL ENABLE, "PRIORITY_GROUP" VARCHAR2(30) CONSTRAINT "REPCAT$_PRIORITY_NN2" NOT NULL ENABLE, "PRIORITY" NUMBER CONSTRAINT "REPCAT$_PRIORITY_NN3" NOT NULL ENABLE, "RAW_VALUE" RAW(2000), "CHAR_VALUE" CHAR(255), "NUMBER_VALUE" NUMBER, "DATE_VALUE" DATE, "VARCHAR2_VALUE" VARCHAR2(4000), "NCHAR_VALUE" NCHAR(500), "NVARCHAR2_VALUE" NVARCHAR2(1000), "LARGE_CHAR_VALUE" CHAR(2000),  CONSTRAINT "REPCAT$_PRIORITY_PK" PRIMARY KEY ("SNAME", "PRIORITY_GROUP", "PRIORITY") ENABLE,  CONSTRAINT "REPCAT$_PRIORITY_F1" FOREIGN KEY ("PRIORITY_GROUP", "SNAME") REFERENCES "REPCAT$_PRIORITY_GROUP" ("PRIORITY_GROUP", "SNAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."SNAME" IS 'Name of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."PRIORITY_GROUP" IS 'Name of the priority group'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."PRIORITY" IS 'Priority of the value'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."RAW_VALUE" IS 'Raw value'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."CHAR_VALUE" IS 'Blank-padded character string'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."NUMBER_VALUE" IS 'Numeric value'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."DATE_VALUE" IS 'Date value'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."VARCHAR2_VALUE" IS 'Character string'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."NCHAR_VALUE" IS 'NCHAR string'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."NVARCHAR2_VALUE" IS 'NVARCHAR2 string'
 
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."LARGE_CHAR_VALUE" IS 'Blank-padded character string over 255 characters'
 
   COMMENT ON TABLE "REPCAT$_PRIORITY"  IS 'Values and their corresponding priorities in all priority groups in the database'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_KEY_COLUMNS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_KEY_COLUMNS" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "TYPE" NUMBER(*,0), "COL" VARCHAR2(30),  CONSTRAINT "REPCAT$_KEY_COLUMNS_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "COL") ENABLE,  CONSTRAINT "REPCAT$_KEY_COLUMNS_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE") REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."SNAME" IS 'Schema containing table'
 
   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."ONAME" IS 'Name of the table'
 
   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."TYPE" IS 'Type identifier'
 
   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."COL" IS 'Column in the table'
 
   COMMENT ON TABLE "REPCAT$_KEY_COLUMNS"  IS 'Primary columns for a table using column-level replication'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_EXTENSION
--------------------------------------------------------

  CREATE TABLE "REPCAT$_EXTENSION" ("EXTENSION_ID" RAW(16), "EXTENSION_CODE" NUMBER, "MASTERDEF" VARCHAR2(128), "EXPORT_REQUIRED" VARCHAR2(1), "REPCATLOG_ID" NUMBER, "EXTENSION_STATUS" NUMBER, "FLASHBACK_SCN" NUMBER, "PUSH_TO_MDEF" VARCHAR2(1), "PUSH_TO_NEW" VARCHAR2(1), "PERCENTAGE_FOR_CATCHUP_MDEF" NUMBER, "CYCLE_SECONDS_MDEF" NUMBER, "PERCENTAGE_FOR_CATCHUP_NEW" NUMBER, "CYCLE_SECONDS_NEW" NUMBER,  CONSTRAINT "REPCAT$_EXTENSION_CODE" CHECK (extension_code IN (0)) ENABLE,  CONSTRAINT "REPCAT$_EXTENSION_EXPORTREQ" CHECK (export_required IN ('Y', 'N')) ENABLE,  CONSTRAINT "REPCAT$_EXTENSION_STATUS" CHECK (extension_status IN (0, 1, 2, 3, 4)) ENABLE,  CONSTRAINT "REPCAT$_EXTENSION_PUSH_TO_MDEF" CHECK (push_to_mdef IN ('Y', 'N')) ENABLE,  CONSTRAINT "REPCAT$_EXTENSION_PUSH_TO_NEW" CHECK (push_to_new IN ('Y', 'N')) ENABLE,  PRIMARY KEY ("EXTENSION_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXTENSION_ID" IS 'Globally unique identifier for replication extension'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXTENSION_CODE" IS 'Kind of replication extension'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."MASTERDEF" IS 'Master definition site for replication extension'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXPORT_REQUIRED" IS 'YES if this extension requires an export, and NO if no export is required'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."REPCATLOG_ID" IS 'Identifier of repcatlog records related to replication extension'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXTENSION_STATUS" IS 'Status of replication extension'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."FLASHBACK_SCN" IS 'Flashback_scn for export or change-based recovery for replication extension'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PUSH_TO_MDEF" IS 'YES if existing masters partially push to masterdef, NO if no pushing'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PUSH_TO_NEW" IS 'YES if existing masters partially push to new masters, NO if no pushing'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PERCENTAGE_FOR_CATCHUP_MDEF" IS 'Fraction of push to masterdef cycle devoted to catching up'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."CYCLE_SECONDS_MDEF" IS 'Length of push to masterdef cycle when catching up'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PERCENTAGE_FOR_CATCHUP_NEW" IS 'Fraction of push to new masters cycle devoted to catching up'
 
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."CYCLE_SECONDS_NEW" IS 'Length of push to new masters cycle when catching up'
 
   COMMENT ON TABLE "REPCAT$_EXTENSION"  IS 'Information about replication extension requests'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_AUDIT_ATTRIBUTE
--------------------------------------------------------

  CREATE TABLE "REPCAT$_AUDIT_ATTRIBUTE" ("ATTRIBUTE" VARCHAR2(30), "DATA_TYPE_ID" NUMBER(*,0) CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_NN1" NOT NULL ENABLE, "DATA_LENGTH" NUMBER(*,0), "SOURCE" VARCHAR2(92) CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_NN2" NOT NULL ENABLE,  CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_C1" CHECK ((data_type_id in (2, 4, 5, 6, 7) and
                  data_length is not null)
              or (data_type_id not in (2, 4, 5, 6, 7) and
                  data_length is null)
                 ) ENABLE,  CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_PK" PRIMARY KEY ("ATTRIBUTE") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."ATTRIBUTE" IS 'Description of the attribute'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."DATA_TYPE_ID" IS 'Datatype of the attribute value'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."DATA_LENGTH" IS 'Length of the attribute value in byte'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."SOURCE" IS 'Name of the function which returns the attribute value'
 
   COMMENT ON TABLE "REPCAT$_AUDIT_ATTRIBUTE"  IS 'Information about attributes automatically maintained for replication'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_SPILL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SPILL$" ("SESSION#" NUMBER, "XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "CHUNK" NUMBER(*,0), "STARTIDX" NUMBER(*,0), "ENDIDX" NUMBER(*,0), "FLAG" NUMBER, "SEQUENCE#" NUMBER, "SPILL_DATA" BLOB, "SPARE1" NUMBER, "SPARE2" NUMBER,  CONSTRAINT "LOGMNR_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "STARTIDX", "ENDIDX", "FLAG", "SEQUENCE#") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PLAN
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_PLAN" ("STATEMENT_ID" VARCHAR2(30), "TIMESTAMP" DATE, "REMARKS" VARCHAR2(80), "OPERATION" VARCHAR2(30), "OPTIONS" VARCHAR2(255), "OBJECT_NODE" VARCHAR2(128), "OBJECT_OWNER" VARCHAR2(30), "OBJECT_NAME" VARCHAR2(30), "OBJECT_INSTANCE" NUMBER(*,0), "OBJECT_TYPE" VARCHAR2(30), "OPTIMIZER" VARCHAR2(255), "SEARCH_COLUMNS" NUMBER, "ID" NUMBER(*,0), "PARENT_ID" NUMBER(*,0), "POSITION" NUMBER(*,0), "COST" NUMBER(*,0), "CARDINALITY" NUMBER(*,0), "BYTES" NUMBER(*,0), "OTHER_TAG" VARCHAR2(255), "PARTITION_START" VARCHAR2(255), "PARTITION_STOP" VARCHAR2(255), "PARTITION_ID" NUMBER(*,0), "OTHER" LONG, "DISTRIBUTION" VARCHAR2(30), "CPU_COST" NUMBER(*,0), "IO_COST" NUMBER(*,0), "TEMP_SPACE" NUMBER(*,0)) 
 
   COMMENT ON TABLE "MVIEW$_ADV_PLAN"  IS 'Private plan table for estimate_mview_size operations'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REPGROUP_PRIVS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPGROUP_PRIVS" ("USERID" NUMBER, "USERNAME" VARCHAR2(30) NOT NULL ENABLE, "GOWNER" VARCHAR2(30), "GNAME" VARCHAR2(30), "GLOBAL_FLAG" NUMBER NOT NULL ENABLE, "CREATED" DATE NOT NULL ENABLE, "PRIVILEGE" NUMBER,  CONSTRAINT "REPCAT$_REPGROUP_PRIVS_UK" UNIQUE ("USERNAME", "GNAME", "GOWNER") ENABLE,  CONSTRAINT "REPCAT$_REPGROUP_PRIVS_FK" FOREIGN KEY ("GNAME", "GOWNER") REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."USERID" IS 'OBSOLETE COLUMN: Identifying number of the user'
 
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."USERNAME" IS 'Identifying name of the registered user'
 
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."GOWNER" IS 'Owner of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."GNAME" IS 'Name of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."GLOBAL_FLAG" IS '1 if gname is NULL, 0 otherwise'
 
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."CREATED" IS 'Registration date'
 
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."PRIVILEGE" IS 'Registered privileges'
 
   COMMENT ON TABLE "REPCAT$_REPGROUP_PRIVS"  IS 'Information about users who are registered for object group privileges'
 
--------------------------------------------------------
--  DDL for Table DEF$_ORIGIN
--------------------------------------------------------

  CREATE TABLE "DEF$_ORIGIN" ("ORIGIN_DB" VARCHAR2(128), "ORIGIN_DBLINK" VARCHAR2(128), "INUSR" NUMBER, "CSCN" NUMBER, "ENQ_TID" VARCHAR2(22), "RECO_SEQ_NO" NUMBER, "CATCHUP" RAW(16) DEFAULT '00') 
 
   COMMENT ON COLUMN "DEF$_ORIGIN"."ORIGIN_DB" IS 'Originating database for the deferred transaction'
 
   COMMENT ON COLUMN "DEF$_ORIGIN"."ORIGIN_DBLINK" IS 'Database link from deferred transaction origin to this site'
 
   COMMENT ON COLUMN "DEF$_ORIGIN"."INUSR" IS 'Connected user receiving the deferred transaction'
 
   COMMENT ON COLUMN "DEF$_ORIGIN"."CSCN" IS 'Prepare SCN assigned at origin site'
 
   COMMENT ON COLUMN "DEF$_ORIGIN"."ENQ_TID" IS 'Transaction id assigned at origin site'
 
   COMMENT ON COLUMN "DEF$_ORIGIN"."RECO_SEQ_NO" IS 'Deferred transaction sequence number for recovery'
 
   COMMENT ON COLUMN "DEF$_ORIGIN"."CATCHUP" IS 'Used to break transaction into pieces'
 
   COMMENT ON TABLE "DEF$_ORIGIN"  IS 'Information about deferred transactions pushed to this site'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_COLUMN_GROUP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_COLUMN_GROUP" ("SNAME" VARCHAR2(30) CONSTRAINT "REPCAT$_COLUMN_GROUP_NN1" NOT NULL ENABLE, "ONAME" VARCHAR2(30) CONSTRAINT "REPCAT$_COLUMN_GROUP_NN2" NOT NULL ENABLE, "GROUP_NAME" VARCHAR2(30) CONSTRAINT "REPCAT$_COLUMN_GROUP_NN3" NOT NULL ENABLE, "GROUP_COMMENT" VARCHAR2(80),  CONSTRAINT "REPCAT$_COLUMN_GROUP_PK" PRIMARY KEY ("SNAME", "ONAME", "GROUP_NAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."SNAME" IS 'Owner of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."ONAME" IS 'Name of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."GROUP_NAME" IS 'Name of the column group'
 
   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."GROUP_COMMENT" IS 'Description of the column group'
 
   COMMENT ON TABLE "REPCAT$_COLUMN_GROUP"  IS 'All column groups of replicated tables in the database'
 
--------------------------------------------------------
--  DDL for Table OL$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "OL$" ("OL_NAME" VARCHAR2(30), "SQL_TEXT" LONG, "TEXTLEN" NUMBER, "SIGNATURE" RAW(16), "HASH_VALUE" NUMBER, "HASH_VALUE2" NUMBER, "CATEGORY" VARCHAR2(30), "VERSION" VARCHAR2(64), "CREATOR" VARCHAR2(30), "TIMESTAMP" DATE, "FLAGS" NUMBER, "HINTCOUNT" NUMBER, "SPARE1" NUMBER, "SPARE2" VARCHAR2(1000)) ON COMMIT PRESERVE ROWS 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_TAB$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TAB$" ("TS#" NUMBER(22,0), "COLS" NUMBER(22,0), "PROPERTY" NUMBER(22,0), "INTCOLS" NUMBER(22,0), "KERNELCOLS" NUMBER(22,0), "BOBJ#" NUMBER(22,0), "TRIGFLAG" NUMBER(22,0), "FLAGS" NUMBER(22,0), "OBJ#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_TAB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table STUDEN
--------------------------------------------------------

  CREATE TABLE "STUDEN" OF "STUDENT_T" ( "MID" NOT NULL ENABLE,  PRIMARY KEY ("MID") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_AUDIT_COLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_AUDIT_COLUMN" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "COLUMN_NAME" VARCHAR2(30), "BASE_SNAME" VARCHAR2(30) CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN1" NOT NULL ENABLE, "BASE_ONAME" VARCHAR2(30) CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN2" NOT NULL ENABLE, "BASE_CONFLICT_TYPE_ID" NUMBER(*,0) CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN3" NOT NULL ENABLE, "BASE_REFERENCE_NAME" VARCHAR2(30) CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN4" NOT NULL ENABLE, "ATTRIBUTE" VARCHAR2(30) CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN5" NOT NULL ENABLE,  CONSTRAINT "REPCAT$_AUDIT_COLUMN_PK" PRIMARY KEY ("COLUMN_NAME", "ONAME", "SNAME") ENABLE,  CONSTRAINT "REPCAT$_AUDIT_COLUMN_F1" FOREIGN KEY ("ATTRIBUTE") REFERENCES "REPCAT$_AUDIT_ATTRIBUTE" ("ATTRIBUTE") ENABLE,  CONSTRAINT "REPCAT$_AUDIT_COLUMN_F2" FOREIGN KEY ("BASE_SNAME", "BASE_ONAME", "BASE_CONFLICT_TYPE_ID", "BASE_REFERENCE_NAME") REFERENCES "REPCAT$_CONFLICT" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."SNAME" IS 'Owner of the shadow table'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."ONAME" IS 'Name of the shadow table'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."COLUMN_NAME" IS 'Name of the column in the shadow table'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_SNAME" IS 'Owner of replicated table'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_ONAME" IS 'Name of the replicated table'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_CONFLICT_TYPE_ID" IS 'Type of conflict'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name'
 
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."ATTRIBUTE" IS 'Description of the attribute'
 
   COMMENT ON TABLE "REPCAT$_AUDIT_COLUMN"  IS 'Information about columns in all shadow tables for all replicated tables in the database'
 
--------------------------------------------------------
--  DDL for Table DEF$_PUSHED_TRANSACTIONS
--------------------------------------------------------

  CREATE TABLE "DEF$_PUSHED_TRANSACTIONS" ("SOURCE_SITE_ID" NUMBER, "LAST_TRAN_ID" NUMBER DEFAULT 0, "DISABLED" VARCHAR2(1) DEFAULT 'F', "SOURCE_SITE" VARCHAR2(128),  CHECK (disabled IN ('T', 'F')) ENABLE,  CONSTRAINT "DEF$_PUSHED_TRAN_PRIMARY" PRIMARY KEY ("SOURCE_SITE_ID") ENABLE) 
 
   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."SOURCE_SITE_ID" IS 'Originating database identifier for the deferred transaction'
 
   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."LAST_TRAN_ID" IS 'Last committed transaction'
 
   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."DISABLED" IS 'Disable propagation'
 
   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."SOURCE_SITE" IS 'Obsolete - do not use'
 
   COMMENT ON TABLE "DEF$_PUSHED_TRANSACTIONS"  IS 'Information about deferred transactions pushed to this site by RepAPI clients'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_TS$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TS$" ("TS#" NUMBER(22,0), "NAME" VARCHAR2(30), "OWNER#" NUMBER(22,0), "BLOCKSIZE" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_TS$_PK" PRIMARY KEY ("LOGMNR_UID", "TS#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_KOPM$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_KOPM$" ("LENGTH" NUMBER, "METADATA" RAW(255), "NAME" VARCHAR2(30) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_KOPM$_PK" PRIMARY KEY ("LOGMNR_UID", "NAME") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_ELIGIBLE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_ELIGIBLE" ("SUMOBJN#" NUMBER NOT NULL ENABLE, "RUNID#" NUMBER NOT NULL ENABLE, "BYTECOST" NUMBER NOT NULL ENABLE, "FLAGS" NUMBER NOT NULL ENABLE, "FREQUENCY" NUMBER NOT NULL ENABLE,  CONSTRAINT "MVIEW$_ADV_ELIGIBLE_PK" PRIMARY KEY ("SUMOBJN#", "RUNID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_ELIGIBLE_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_ELIGIBLE"  IS 'Summary management rewrite eligibility information'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_PARMS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID" NUMBER, "REFRESH_TEMPLATE_ID" NUMBER NOT NULL ENABLE, "PARAMETER_NAME" VARCHAR2(30) NOT NULL ENABLE, "DEFAULT_PARM_VALUE" CLOB, "PROMPT_STRING" VARCHAR2(2000), "USER_OVERRIDE" VARCHAR2(1) DEFAULT 'Y',  CONSTRAINT "REPCAT$_TEMPLATE_PARMS_C1" CHECK (user_override in ('Y','N')) ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_PARMS_PK" PRIMARY KEY ("TEMPLATE_PARAMETER_ID") ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_PARMS_U1" UNIQUE ("REFRESH_TEMPLATE_ID", "PARAMETER_NAME") ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_PARMS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID") REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."TEMPLATE_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_PARMS table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."PARAMETER_NAME" IS 'name of the parameter.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."DEFAULT_PARM_VALUE" IS 'Default value for the parameter.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."PROMPT_STRING" IS 'String for use in prompting for parameter values.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."USER_OVERRIDE" IS 'User override flag.'
 
--------------------------------------------------------
--  DDL for Table ISSUE
--------------------------------------------------------

  CREATE TABLE "ISSUE" ("ISBN" VARCHAR2(20), "MID" VARCHAR2(20), "ISSUEDATE" VARCHAR2(20), "DUEDATE" VARCHAR2(20)) 
 
--------------------------------------------------------
--  DDL for Table OL$NODES
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "OL$NODES" ("OL_NAME" VARCHAR2(30), "CATEGORY" VARCHAR2(30), "NODE_ID" NUMBER, "PARENT_ID" NUMBER, "NODE_TYPE" NUMBER, "NODE_TEXTLEN" NUMBER, "NODE_TEXTOFF" NUMBER, "NODE_NAME" VARCHAR2(64)) ON COMMIT PRESERVE ROWS 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_RESTART_CKPT$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_RESTART_CKPT$" ("SESSION#" NUMBER, "VALID" NUMBER, "CKPT_SCN" NUMBER, "XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "SESSION_NUM" NUMBER, "SERIAL_NUM" NUMBER, "CKPT_INFO" BLOB, "FLAG" NUMBER, "OFFSET" NUMBER, "CLIENT_DATA" BLOB, "SPARE1" NUMBER, "SPARE2" NUMBER,  CONSTRAINT "LOGMNR_RESTART_CKPT$_PK" PRIMARY KEY ("SESSION#", "CKPT_SCN", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PRETTY
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_PRETTY" ("QUERYID#" NUMBER, "SQL_TEXT" LONG) 
 
   COMMENT ON TABLE "MVIEW$_ADV_PRETTY"  IS 'Table for sql parsing'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_DICTSTATE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_DICTSTATE$" ("LOGMNR_UID" NUMBER(22,0), "START_SCNBAS" NUMBER, "START_SCNWRP" NUMBER, "END_SCNBAS" NUMBER, "END_SCNWRP" NUMBER, "REDO_THREAD" NUMBER, "RBASQN" NUMBER, "RBABLK" NUMBER, "RBABYTE" NUMBER, "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_DICTSTATE$_PK" PRIMARY KEY ("LOGMNR_UID") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SCN
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SCN" ("OBJ#" NUMBER, "OBJNAME" VARCHAR2(4000), "SCHEMA" VARCHAR2(30), "TYPE" VARCHAR2(20), "SCN" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_ENC$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ENC$" ("OBJ#" NUMBER, "OWNER#" NUMBER, "ENCALG" NUMBER, "INTALG" NUMBER, "COLKLC" RAW(2000), "KLCLEN" NUMBER, "FLAG" NUMBER, "MKEYID" VARCHAR2(64) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_ENC$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "OWNER#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_LOB$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOB$" ("OBJ#" NUMBER, "INTCOL#" NUMBER, "COL#" NUMBER, "LOBJ#" NUMBER, "CHUNK" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_LOB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FILTERINSTANCE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_FILTERINSTANCE" ("RUNID#" NUMBER NOT NULL ENABLE, "FILTERID#" NUMBER, "SUBFILTERNUM#" NUMBER, "SUBFILTERTYPE" NUMBER, "STR_VALUE" VARCHAR2(1028), "NUM_VALUE1" NUMBER, "NUM_VALUE2" NUMBER, "DATE_VALUE1" DATE, "DATE_VALUE2" DATE,  CONSTRAINT "MVIEW$_ADV_FILTERINSTANCE_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_FILTERINSTANCE"  IS 'Table for workload filter instance definition'
 
--------------------------------------------------------
--  DDL for Table LOG1
--------------------------------------------------------

  CREATE TABLE "LOG1" ("UN" VARCHAR2(10), "PWD" VARCHAR2(20), "UT" VARCHAR2(20)) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_SUBCOLTYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SUBCOLTYPE$" ("INTCOL#" NUMBER NOT NULL ENABLE, "TOID" RAW(16) NOT NULL ENABLE, "VERSION#" NUMBER NOT NULL ENABLE, "INTCOLS" NUMBER, "INTCOL#S" RAW(2000), "FLAGS" NUMBER, "SYNOBJ#" NUMBER, "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_SUBCOLTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#", "TOID") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_ICOL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ICOL$" ("OBJ#" NUMBER, "BO#" NUMBER, "COL#" NUMBER, "POS#" NUMBER, "SEGCOL#" NUMBER, "INTCOL#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_ICOL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table AQ$_QUEUE_TABLES
--------------------------------------------------------

  CREATE TABLE "AQ$_QUEUE_TABLES" ("SCHEMA" VARCHAR2(30) NOT NULL ENABLE, "NAME" VARCHAR2(30) NOT NULL ENABLE, "UDATA_TYPE" NUMBER NOT NULL ENABLE, "OBJNO" NUMBER NOT NULL ENABLE, "FLAGS" NUMBER NOT NULL ENABLE, "SORT_COLS" NUMBER NOT NULL ENABLE, "TIMEZONE" VARCHAR2(64), "TABLE_COMMENT" VARCHAR2(2000),  CONSTRAINT "AQ$_QUEUE_TABLES_PRIMARY" PRIMARY KEY ("OBJNO") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_OUTPUT
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_OUTPUT" ("RUNID#" NUMBER NOT NULL ENABLE, "OUTPUT_TYPE" NUMBER NOT NULL ENABLE, "RANK#" NUMBER, "ACTION_TYPE" VARCHAR2(6), "SUMMARY_OWNER" VARCHAR2(30), "SUMMARY_NAME" VARCHAR2(30), "GROUP_BY_COLUMNS" VARCHAR2(2000), "WHERE_CLAUSE" VARCHAR2(2000), "FROM_CLAUSE" VARCHAR2(2000), "MEASURES_LIST" VARCHAR2(2000), "FACT_TABLES" VARCHAR2(1000), "GROUPING_LEVELS" VARCHAR2(2000), "QUERYLEN" NUMBER, "QUERY_TEXT" LONG, "STORAGE_IN_BYTES" NUMBER, "PCT_PERFORMANCE_GAIN" NUMBER, "FREQUENCY" NUMBER, "CUMULATIVE_BENEFIT" NUMBER, "BENEFIT_TO_COST_RATIO" NUMBER NOT NULL ENABLE, "VALIDATED" NUMBER,  CONSTRAINT "MVIEW$_ADV_OUTPUT_PK" PRIMARY KEY ("RUNID#", "RANK#") ENABLE,  CONSTRAINT "MVIEW$_ADV_OUTPUT_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_OUTPUT"  IS 'Output table for summary recommendations and evaluations'
 
--------------------------------------------------------
--  DDL for Table AQ$_SCHEDULES
--------------------------------------------------------

  CREATE TABLE "AQ$_SCHEDULES" ("OID" RAW(16), "DESTINATION" VARCHAR2(128) NOT NULL ENABLE, "START_TIME" DATE, "DURATION" VARCHAR2(8), "NEXT_TIME" VARCHAR2(128), "LATENCY" VARCHAR2(8), "LAST_TIME" DATE, "JOBNO" NUMBER,  CONSTRAINT "AQ$_SCHEDULES_PRIMARY" PRIMARY KEY ("OID", "DESTINATION") ENABLE,  CONSTRAINT "AQ$_SCHEDULES_CHECK" UNIQUE ("JOBNO") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$PLSQL
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$PLSQL" ("SESSION_ID" NUMBER, "START_FINISH" NUMBER, "CALL_TEXT" CLOB, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table LIB_T
--------------------------------------------------------

  CREATE TABLE "LIB_T" ("LIBID" VARCHAR2(10), "FNAME" VARCHAR2(10), "LNAME" VARCHAR2(10), "PHONE" VARCHAR2(10), "ADDRESS" VARCHAR2(10)) 
 
--------------------------------------------------------
--  DDL for Table PERSON
--------------------------------------------------------

  CREATE TABLE "PERSON" OF "PESRON_TYPE" 
 
--------------------------------------------------------
--  DDL for Table EMP
--------------------------------------------------------

  CREATE TABLE "EMP" ("FNAME" VARCHAR2(20), "LNAME" VARCHAR2(20), "EID" VARCHAR2(20), "DID" VARCHAR2(20)) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_TABSUBPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TABSUBPART$" ("OBJ#" NUMBER(22,0), "DATAOBJ#" NUMBER(22,0), "POBJ#" NUMBER(22,0), "SUBPART#" NUMBER(22,0), "TS#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_TABSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table STU
--------------------------------------------------------

  CREATE TABLE "STU" ("FNAME" VARCHAR2(30), "LNAME" VARCHAR2(30), "MID" VARCHAR2(9), "DEPT" VARCHAR2(9), "BATCH" VARCHAR2(55)) 
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_AJG
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_AJG" ("AJGID#" NUMBER NOT NULL ENABLE, "RUNID#" NUMBER NOT NULL ENABLE, "AJGDESLEN" NUMBER NOT NULL ENABLE, "AJGDES" LONG RAW NOT NULL ENABLE, "HASHVALUE" NUMBER NOT NULL ENABLE, "FREQUENCY" NUMBER,  CONSTRAINT "MVIEW$_ADV_AJG_PK" PRIMARY KEY ("AJGID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_AJG_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_AJG"  IS 'Anchor-join graph representation'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_JOURNAL
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_JOURNAL" ("RUNID#" NUMBER NOT NULL ENABLE, "SEQ#" NUMBER NOT NULL ENABLE, "TIMESTAMP" DATE NOT NULL ENABLE, "FLAGS" NUMBER NOT NULL ENABLE, "NUM" NUMBER, "TEXT" LONG, "TEXTLEN" NUMBER,  CONSTRAINT "MVIEW$_ADV_JOURNAL_PK" PRIMARY KEY ("RUNID#", "SEQ#") ENABLE,  CONSTRAINT "MVIEW$_ADV_JOURNAL_FK" FOREIGN KEY ("RUNID#") REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_JOURNAL"  IS 'Summary advisor journal table for debugging and information'
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$EVENTS
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$EVENTS" ("EVENT_TIME" TIMESTAMP (6), "CURRENT_SCN" NUMBER, "COMMIT_SCN" NUMBER, "XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "ERRVAL" NUMBER, "EVENT" VARCHAR2(2000), "FULL_EVENT" CLOB, "ERROR" VARCHAR2(2000), "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table HELP
--------------------------------------------------------

  CREATE TABLE "HELP" ("TOPIC" VARCHAR2(50) NOT NULL ENABLE, "SEQ" NUMBER NOT NULL ENABLE, "INFO" VARCHAR2(80),  CONSTRAINT "HELP_TOPIC_SEQ" PRIMARY KEY ("TOPIC", "SEQ") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_USER_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "LOGMNR_GT_USER_INCLUDE$" ("USER_NAME" VARCHAR2(32), "USER_TYPE" NUMBER) ON COMMIT PRESERVE ROWS 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_TARGETS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_TARGETS" ("TEMPLATE_TARGET_ID" NUMBER, "TARGET_DATABASE" VARCHAR2(128) NOT NULL ENABLE, "TARGET_COMMENT" VARCHAR2(2000), "CONNECT_STRING" VARCHAR2(4000), "SPARE1" VARCHAR2(4000),  CONSTRAINT "TEMPLATE$_TARGETS_PK" PRIMARY KEY ("TEMPLATE_TARGET_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."TEMPLATE_TARGET_ID" IS 'Internal primary key of the template targets table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."TARGET_DATABASE" IS 'Global identifier of the target database.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."TARGET_COMMENT" IS 'Comment on the target database.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."CONNECT_STRING" IS 'The connection descriptor used to connect to the target database.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."SPARE1" IS 'The spare column'
 
   COMMENT ON TABLE "REPCAT$_TEMPLATE_TARGETS"  IS 'Internal table for tracking potential target databases for templates.'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_SNAPGROUP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_SNAPGROUP" ("GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', "GNAME" VARCHAR2(30), "DBLINK" VARCHAR2(128), "GROUP_COMMENT" VARCHAR2(80), "REP_TYPE" NUMBER, "FLAVOR_ID" NUMBER) 
 
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."GOWNER" IS 'Owner of the snapshot repgroup'
 
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."GNAME" IS 'Name of the snapshot repgroup'
 
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."DBLINK" IS 'Database site of the snapshot repgroup'
 
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."GROUP_COMMENT" IS 'Description of the snapshot repgroup'
 
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."REP_TYPE" IS 'Identifier of flavor at snapshot'
 
   COMMENT ON TABLE "REPCAT$_SNAPGROUP"  IS 'Snapshot repgroup registration information'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_OPQTYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_OPQTYPE$" ("INTCOL#" NUMBER NOT NULL ENABLE, "TYPE" NUMBER, "FLAGS" NUMBER, "LOBCOL" NUMBER, "OBJCOL" NUMBER, "EXTRACOL" NUMBER, "SCHEMAOID" RAW(16), "ELEMNUM" NUMBER, "SCHEMAURL" VARCHAR2(4000), "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_OPQTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_CCOL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_CCOL$" ("CON#" NUMBER, "OBJ#" NUMBER, "COL#" NUMBER, "POS#" NUMBER, "INTCOL#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_CCOL$_PK" PRIMARY KEY ("LOGMNR_UID", "CON#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table PATIENT
--------------------------------------------------------

  CREATE TABLE "PATIENT" OF "PATIENT_TYPE" ( "PATIENTNO" NOT NULL ENABLE,  PRIMARY KEY ("PATIENTNO") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table DEF$_TEMP$LOB
--------------------------------------------------------

  CREATE TABLE "DEF$_TEMP$LOB" ("TEMP$BLOB" BLOB, "TEMP$CLOB" CLOB, "TEMP$NCLOB" NCLOB) 
 
   COMMENT ON COLUMN "DEF$_TEMP$LOB"."TEMP$BLOB" IS 'Binary LOB (deferred) RPC parameter'
 
   COMMENT ON COLUMN "DEF$_TEMP$LOB"."TEMP$CLOB" IS 'Character LOB (deferred) RPC parameter'
 
   COMMENT ON COLUMN "DEF$_TEMP$LOB"."TEMP$NCLOB" IS 'National Character LOB (deferred) RPC parameter'
 
   COMMENT ON TABLE "DEF$_TEMP$LOB"  IS 'Storage for LOB parameters to RPCs'
 
--------------------------------------------------------
--  DDL for Table DOCTOR
--------------------------------------------------------

  CREATE TABLE "DOCTOR" OF "DOCTOR_TYPE" ( "DID" NOT NULL ENABLE,  PRIMARY KEY ("DID") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_REFCON$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_REFCON$" ("COL#" NUMBER, "INTCOL#" NUMBER, "REFTYP" NUMBER, "STABID" RAW(16), "EXPCTOID" RAW(16), "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_REFCON$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_SITE_OBJECTS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_SITE_OBJECTS" ("TEMPLATE_SITE_ID" NUMBER NOT NULL ENABLE, "SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30) NOT NULL ENABLE, "OBJECT_TYPE_ID" NUMBER NOT NULL ENABLE,  CONSTRAINT "REPCAT$_SITE_OBJECTS_U1" UNIQUE ("TEMPLATE_SITE_ID", "ONAME", "OBJECT_TYPE_ID", "SNAME") ENABLE,  CONSTRAINT "REPCAT$_SITE_OBJECT_FK2" FOREIGN KEY ("TEMPLATE_SITE_ID") REFERENCES "REPCAT$_TEMPLATE_SITES" ("TEMPLATE_SITE_ID") ON DELETE CASCADE ENABLE,  CONSTRAINT "REPCAT$_SITE_OBJECTS_FK1" FOREIGN KEY ("OBJECT_TYPE_ID") REFERENCES "REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."TEMPLATE_SITE_ID" IS 'Internal primary key of the template sites table.'
 
   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."SNAME" IS 'Schema containing the deployed database object.'
 
   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."ONAME" IS 'Name of the deployed database object.'
 
   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."OBJECT_TYPE_ID" IS 'Internal ID of the object type of the deployed database object.'
 
   COMMENT ON TABLE "REPCAT$_SITE_OBJECTS"  IS 'Table for maintaining database objects deployed at a site.'
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP_TRANSACTION
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SKIP_TRANSACTION" ("XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "ACTIVE" NUMBER, "COMMIT_SCN" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "CUSTOMER" ("FNAME" VARCHAR2(10), "LNAME" VARCHAR2(10)) 
 
--------------------------------------------------------
--  DDL for Table LOGSTDBY$HISTORY
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$HISTORY" ("STREAM_SEQUENCE#" NUMBER, "LMNR_SID" NUMBER, "DBID" NUMBER, "FIRST_CHANGE#" NUMBER, "LAST_CHANGE#" NUMBER, "SOURCE" NUMBER, "STATUS" NUMBER, "FIRST_TIME" DATE, "LAST_TIME" DATE, "DGNAME" VARCHAR2(255), "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(2000)) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_SITES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_SITES" ("TEMPLATE_SITE_ID" NUMBER, "REFRESH_TEMPLATE_NAME" VARCHAR2(30) NOT NULL ENABLE, "REFRESH_GROUP_NAME" VARCHAR2(30), "TEMPLATE_OWNER" VARCHAR2(30), "USER_NAME" VARCHAR2(30) NOT NULL ENABLE, "SITE_NAME" VARCHAR2(128), "REPAPI_SITE_ID" NUMBER, "STATUS" NUMBER NOT NULL ENABLE, "REFRESH_TEMPLATE_ID" NUMBER, "USER_ID" NUMBER, "INSTANTIATION_DATE" DATE,  CONSTRAINT "REPCAT$_TEMPLATE_SITES_C1" CHECK (status in (-100,-1,0,1)) ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_SITES_C2" CHECK ((site_name is not null and repapi_site_id is null) or
   (site_name is null and repapi_site_id is not null)) ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_SITES_PK" PRIMARY KEY ("TEMPLATE_SITE_ID") ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_SITES_U1" UNIQUE ("REFRESH_TEMPLATE_NAME", "USER_NAME", "SITE_NAME", "REPAPI_SITE_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."TEMPLATE_SITE_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_SITES table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REFRESH_TEMPLATE_NAME" IS 'Name of the refresh group template.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REFRESH_GROUP_NAME" IS 'Name of the refresh group to create during instantiation.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."TEMPLATE_OWNER" IS 'Owner of the refresh group template.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."USER_NAME" IS 'Database user name.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."SITE_NAME" IS 'Name of the site that has instantiated the template.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REPAPI_SITE_ID" IS 'Name of the site that has instantiated the template.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."STATUS" IS 'Obsolete - do not use.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REFRESH_TEMPLATE_ID" IS 'Obsolete - do not use.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."USER_ID" IS 'Obsolete - do not use.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."INSTANTIATION_DATE" IS 'Date template was instantiated.'
 
--------------------------------------------------------
--  DDL for Table AQ$_QUEUES
--------------------------------------------------------

  CREATE TABLE "AQ$_QUEUES" ("OID" RAW(16), "EVENTID" NUMBER NOT NULL ENABLE, "NAME" VARCHAR2(30) NOT NULL ENABLE, "TABLE_OBJNO" NUMBER NOT NULL ENABLE, "USAGE" NUMBER NOT NULL ENABLE, "ENABLE_FLAG" NUMBER NOT NULL ENABLE, "MAX_RETRIES" NUMBER, "RETRY_DELAY" NUMBER, "PROPERTIES" NUMBER, "RET_TIME" NUMBER, "QUEUE_COMMENT" VARCHAR2(2000), "SUBSCRIBERS" "AQ$_SUBSCRIBERS" , "MEMORY_THRESHOLD" NUMBER, "SERVICE_NAME" VARCHAR2(64), "NETWORK_NAME" VARCHAR2(256),  CONSTRAINT "AQ$_QUEUES_PRIMARY" PRIMARY KEY ("OID") ENABLE,  CONSTRAINT "AQ$_QUEUES_CHECK" UNIQUE ("NAME", "TABLE_OBJNO") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_RUNTIME_PARMS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RUNTIME_PARMS" ("RUNTIME_PARM_ID" NUMBER, "PARAMETER_NAME" VARCHAR2(30), "PARM_VALUE" CLOB) 
 
   COMMENT ON COLUMN "REPCAT$_RUNTIME_PARMS"."RUNTIME_PARM_ID" IS 'Primary key of the parameter values table.'
 
   COMMENT ON COLUMN "REPCAT$_RUNTIME_PARMS"."PARAMETER_NAME" IS 'Name of the parameter.'
 
   COMMENT ON COLUMN "REPCAT$_RUNTIME_PARMS"."PARM_VALUE" IS 'Parameter value.'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_TEMP
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_TEMP" ("ID#" NUMBER, "SEQ#" NUMBER, "TEXT" LONG) 
 
   COMMENT ON TABLE "MVIEW$_ADV_TEMP"  IS 'Table for temporary data'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_IND$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_IND$" ("BO#" NUMBER(22,0), "COLS" NUMBER(22,0), "TYPE#" NUMBER(22,0), "FLAGS" NUMBER, "PROPERTY" NUMBER, "OBJ#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_IND$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_OBJECT_TYPES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID" NUMBER, "OBJECT_TYPE_NAME" VARCHAR2(200), "FLAGS" RAW(255), "SPARE1" VARCHAR2(4000),  CONSTRAINT "REPCAT$_OBJECT_TYPE_PK" PRIMARY KEY ("OBJECT_TYPE_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."OBJECT_TYPE_ID" IS 'Internal primary key of the template object types table.'
 
   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."OBJECT_TYPE_NAME" IS 'Descriptive name for the object type.'
 
   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."FLAGS" IS 'Internal flags for object type processing.'
 
   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."SPARE1" IS 'Reserved for future use.'
 
   COMMENT ON TABLE "REPCAT$_OBJECT_TYPES"  IS 'Internal table for template object types.'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_LOG
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_LOG" ("RUNID#" NUMBER, "FILTERID#" NUMBER, "RUN_BEGIN" DATE, "RUN_END" DATE, "RUN_TYPE" NUMBER, "UNAME" VARCHAR2(30), "STATUS" NUMBER NOT NULL ENABLE, "MESSAGE" VARCHAR2(2000), "COMPLETED" NUMBER, "TOTAL" NUMBER, "ERROR_CODE" VARCHAR2(20),  CONSTRAINT "MVIEW$_ADV_LOG_PK" PRIMARY KEY ("RUNID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_LOG"  IS 'Log all calls to summary advisory functions'
 
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FJG
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_FJG" ("FJGID#" NUMBER NOT NULL ENABLE, "AJGID#" NUMBER NOT NULL ENABLE, "FJGDESLEN" NUMBER NOT NULL ENABLE, "FJGDES" LONG RAW NOT NULL ENABLE, "HASHVALUE" NUMBER NOT NULL ENABLE, "FREQUENCY" NUMBER,  CONSTRAINT "MVIEW$_ADV_FJG_PK" PRIMARY KEY ("FJGID#") ENABLE,  CONSTRAINT "MVIEW$_ADV_FJG_FK" FOREIGN KEY ("AJGID#") REFERENCES "MVIEW$_ADV_AJG" ("AJGID#") ENABLE) 
 
   COMMENT ON TABLE "MVIEW$_ADV_FJG"  IS 'Representation for query join sub-graph not in AJG '
 
--------------------------------------------------------
--  DDL for Table LOGMNR_CDEF$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_CDEF$" ("CON#" NUMBER, "COLS" NUMBER, "TYPE#" NUMBER, "ROBJ#" NUMBER, "RCON#" NUMBER, "ENABLED" NUMBER, "DEFER" NUMBER, "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_CDEF$_PK" PRIMARY KEY ("LOGMNR_UID", "CON#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGINS
--------------------------------------------------------

  CREATE TABLE "LOGINS" ("USERTPE" VARCHAR2(30), "UN" VARCHAR2(10), "PWD" VARCHAR2(20)) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_CONFLICT
--------------------------------------------------------

  CREATE TABLE "REPCAT$_CONFLICT" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "CONFLICT_TYPE_ID" NUMBER(*,0), "REFERENCE_NAME" VARCHAR2(30),  CONSTRAINT "REPCAT$_CONFLICT_C1" CHECK (conflict_type_id in (1, 2, 3)) ENABLE,  CONSTRAINT "REPCAT$_CONFLICT_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_CONFLICT"."SNAME" IS 'Owner of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_CONFLICT"."ONAME" IS 'Name of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_CONFLICT"."CONFLICT_TYPE_ID" IS 'Type of conflict'
 
   COMMENT ON COLUMN "REPCAT$_CONFLICT"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name'
 
   COMMENT ON TABLE "REPCAT$_CONFLICT"  IS 'All conflicts for which users have specified resolutions in the database'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REPOBJECT
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPOBJECT" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "TYPE" NUMBER(*,0), "VERSION#" NUMBER, "HASHCODE" RAW(17), "ID" NUMBER, "OBJECT_COMMENT" VARCHAR2(80), "STATUS" NUMBER(*,0), "GENPACKAGE" NUMBER(*,0), "GENPLOGID" NUMBER(*,0), "GENTRIGGER" NUMBER(*,0), "GENTLOGID" NUMBER(*,0), "GOWNER" VARCHAR2(30), "GNAME" VARCHAR2(30), "FLAG" RAW(4) DEFAULT '00000000',  CONSTRAINT "REPCAT$_REPOBJECT_TYPE" CHECK (type IN (-1, 1, 2, 4, 5, 7, 8, 9, 11, 12, -3,
                                      -4, 13, 14, 32, 33)) ENABLE,  CONSTRAINT "REPCAT$_REPOBJECT_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE,  CONSTRAINT "REPCAT$_REPOBJECT_STATUS" CHECK (status IN (0, 1, 2, 3, 4, 5, 6)) ENABLE,  CONSTRAINT "REPCAT$_REPOBJECT_GENPACKAGE" CHECK (genpackage IN (0, 1, 2)) ENABLE,  CONSTRAINT "REPCAT$_REPOBJECT_GENTRIGGER" CHECK (gentrigger IN (0, 1, 2)) ENABLE,  CONSTRAINT "REPCAT$_REPOBJECT_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE") ENABLE,  CONSTRAINT "REPCAT$_REPOBJECT_PRNT" FOREIGN KEY ("GNAME", "GOWNER") REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."SNAME" IS 'Name of the object owner'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."ONAME" IS 'Name of the object'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."TYPE" IS 'Type of the object'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."VERSION#" IS 'Version of objects of TYPE'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."HASHCODE" IS 'Hashcode of objects of TYPE'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."ID" IS 'Identifier of the local object'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."OBJECT_COMMENT" IS 'Description of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."STATUS" IS 'Status of the last create or alter request on the local object'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENPACKAGE" IS 'Status of whether the object needs to generate replication package'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENPLOGID" IS 'Log id of message sent for generating package support'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENTRIGGER" IS 'Status of whether the object needs to generate replication trigger'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENTLOGID" IS 'Log id of message sent for generating trigger support'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GOWNER" IS 'Owner of the object''s object group'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GNAME" IS 'Name of the object''s object group'
 
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."FLAG" IS 'Information about replicated object'
 
   COMMENT ON TABLE "REPCAT$_REPOBJECT"  IS 'Information about replicated objects'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_OBJECTS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_OBJECTS" ("TEMPLATE_OBJECT_ID" NUMBER NOT NULL ENABLE, "REFRESH_TEMPLATE_ID" NUMBER NOT NULL ENABLE, "OBJECT_NAME" VARCHAR2(30) NOT NULL ENABLE, "OBJECT_TYPE" NUMBER NOT NULL ENABLE, "OBJECT_VERSION#" NUMBER, "DDL_TEXT" CLOB, "MASTER_ROLLBACK_SEG" VARCHAR2(30), "DERIVED_FROM_SNAME" VARCHAR2(30), "DERIVED_FROM_ONAME" VARCHAR2(30), "FLAVOR_ID" NUMBER, "SCHEMA_NAME" VARCHAR2(30), "DDL_NUM" NUMBER DEFAULT 1 NOT NULL ENABLE, "TEMPLATE_REFGROUP_ID" NUMBER DEFAULT 0 NOT NULL ENABLE, "FLAGS" RAW(255), "SPARE1" VARCHAR2(4000),  CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_VER" CHECK (object_version# >= 0 AND object_version# < 65536) ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_PK" PRIMARY KEY ("TEMPLATE_OBJECT_ID") ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_U1" UNIQUE ("OBJECT_NAME", "OBJECT_TYPE", "REFRESH_TEMPLATE_ID", "SCHEMA_NAME", "DDL_NUM") ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID") REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE,  CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_FK3" FOREIGN KEY ("OBJECT_TYPE") REFERENCES "REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."TEMPLATE_OBJECT_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_OBJECTS table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."OBJECT_NAME" IS 'Name of the database object.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."OBJECT_TYPE" IS 'Type of database object.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."OBJECT_VERSION#" IS 'Version# of database object of TYPE.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DDL_TEXT" IS 'DDL string for creating the object or WHERE clause for snapshot query.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."MASTER_ROLLBACK_SEG" IS 'Rollback segment for use during snapshot refreshes.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DERIVED_FROM_SNAME" IS 'Schema name of schema containing object this was derived from.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DERIVED_FROM_ONAME" IS 'Object name of object this object was derived from.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."FLAVOR_ID" IS 'Foreign key to the REPCAT$_FLAVORS table.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."SCHEMA_NAME" IS 'Schema containing the object.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DDL_NUM" IS 'Order of ddls to execute.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."TEMPLATE_REFGROUP_ID" IS 'Internal ID of the refresh group to contain the object.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."FLAGS" IS 'Internal flags for the object.'
 
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."SPARE1" IS 'Reserved for future use.'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_OBJ$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_OBJ$" ("OBJV#" NUMBER(22,0), "OWNER#" NUMBER(22,0), "NAME" VARCHAR2(30), "NAMESPACE" NUMBER(22,0), "SUBNAME" VARCHAR2(30), "TYPE#" NUMBER(22,0), "OID$" RAW(16), "REMOTEOWNER" VARCHAR2(30), "LINKNAME" VARCHAR2(128), "FLAGS" NUMBER(22,0), "SPARE3" NUMBER(22,0), "STIME" DATE, "OBJ#" NUMBER(22,0) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0), "START_SCNBAS" NUMBER, "START_SCNWRP" NUMBER,  CONSTRAINT "LOGMNR_OBJ$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_GENERATED
--------------------------------------------------------

  CREATE TABLE "REPCAT$_GENERATED" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "TYPE" NUMBER(*,0), "REASON" NUMBER, "BASE_SNAME" VARCHAR2(30), "BASE_ONAME" VARCHAR2(30), "BASE_TYPE" NUMBER(*,0), "PACKAGE_PREFIX" VARCHAR2(30), "PROCEDURE_PREFIX" VARCHAR2(30), "DISTRIBUTED" VARCHAR2(1),  CONSTRAINT "REPCAT$_GENERATED_OBJ" CHECK (reason IN (0, 1, 2, 3, 4, 5, 6, 7, 9, 10)) ENABLE,  CONSTRAINT "REPCAT$_REPGEN_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "BASE_SNAME", "BASE_ONAME", "BASE_TYPE") ENABLE,  CONSTRAINT "REPCAT$_REPGEN_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE") REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE,  CONSTRAINT "REPCAT$_REPGEN_PRNT2" FOREIGN KEY ("BASE_SNAME", "BASE_ONAME", "BASE_TYPE") REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."SNAME" IS 'Schema containing the generated object'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."ONAME" IS 'Name of the generated object'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."TYPE" IS 'Type of the generated object'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."REASON" IS 'Reason the object was generated'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."BASE_SNAME" IS 'Name of the object''s owner'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."BASE_ONAME" IS 'Name of the object'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."BASE_TYPE" IS 'Type of the object'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."PACKAGE_PREFIX" IS 'Prefix for package wrapper'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."PROCEDURE_PREFIX" IS 'Procedure prefix for package wrapper or procedure wrapper'
 
   COMMENT ON COLUMN "REPCAT$_GENERATED"."DISTRIBUTED" IS 'Is the generated object separately generated at each master'
 
   COMMENT ON TABLE "REPCAT$_GENERATED"  IS 'Objects generated to support replication'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_RESTART_CKPT_TXINFO$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_RESTART_CKPT_TXINFO$" ("SESSION#" NUMBER, "XIDUSN" NUMBER, "XIDSLT" NUMBER, "XIDSQN" NUMBER, "SESSION_NUM" NUMBER, "SERIAL_NUM" NUMBER, "FLAG" NUMBER, "START_SCN" NUMBER, "EFFECTIVE_SCN" NUMBER, "OFFSET" NUMBER, "TX_DATA" BLOB,  CONSTRAINT "LOGMNR_RESTART_CKPT_TXINFO$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM", "EFFECTIVE_SCN") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_GLOBAL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_GLOBAL$" ("HIGH_RECID_FOREIGN" NUMBER, "HIGH_RECID_DELETED" NUMBER, "LOCAL_RESET_SCN" NUMBER, "LOCAL_RESET_TIMESTAMP" NUMBER, "VERSION_TIMESTAMP" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "SPARE4" VARCHAR2(2000), "SPARE5" DATE) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_ATTRIBUTE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ATTRIBUTE$" ("VERSION#" NUMBER, "NAME" VARCHAR2(30), "ATTRIBUTE#" NUMBER, "ATTR_TOID" RAW(16), "ATTR_VERSION#" NUMBER, "SYNOBJ#" NUMBER, "PROPERTIES" NUMBER, "CHARSETID" NUMBER, "CHARSETFORM" NUMBER, "LENGTH" NUMBER, "PRECISION#" NUMBER, "SCALE" NUMBER, "EXTERNNAME" VARCHAR2(4000), "XFLAGS" NUMBER, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "SPARE4" NUMBER, "SPARE5" NUMBER, "SETTER" NUMBER, "GETTER" NUMBER, "TOID" RAW(16) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_ATTRIBUTE$_PK" PRIMARY KEY ("LOGMNR_UID", "TOID", "VERSION#", "ATTRIBUTE#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_EXCEPTIONS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_EXCEPTIONS" ("EXCEPTION_ID" NUMBER, "USER_NAME" VARCHAR2(30), "REQUEST" CLOB, "JOB" NUMBER, "ERROR_DATE" DATE, "ERROR_NUMBER" NUMBER, "ERROR_MESSAGE" VARCHAR2(4000), "LINE_NUMBER" NUMBER,  CONSTRAINT "REPCAT$_EXCEPTIONS_PK" PRIMARY KEY ("EXCEPTION_ID") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."EXCEPTION_ID" IS 'Internal primary key of the exceptions table.'
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."USER_NAME" IS 'User name of user submitting the exception.'
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."REQUEST" IS 'Originating request containing the exception.'
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."JOB" IS 'Originating job containing the exception.'
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."ERROR_DATE" IS 'Date of occurance for the exception.'
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."ERROR_NUMBER" IS 'Error number generating the exception.'
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."ERROR_MESSAGE" IS 'Error message associated with the error generating the exception.'
 
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."LINE_NUMBER" IS 'Line number of the exception.'
 
   COMMENT ON TABLE "REPCAT$_EXCEPTIONS"  IS 'Repcat processing exceptions table.'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_INDPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_INDPART$" ("OBJ#" NUMBER, "BO#" NUMBER, "PART#" NUMBER, "TS#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_INDPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "BO#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table LOGMNR_NTAB$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_NTAB$" ("COL#" NUMBER, "INTCOL#" NUMBER, "NTAB#" NUMBER, "NAME" VARCHAR2(4000), "OBJ#" NUMBER NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_NTAB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_SITES_NEW
--------------------------------------------------------

  CREATE TABLE "REPCAT$_SITES_NEW" ("EXTENSION_ID" RAW(16), "GOWNER" VARCHAR2(30), "GNAME" VARCHAR2(30), "DBLINK" VARCHAR2(128), "FULL_INSTANTIATION" VARCHAR2(1), "MASTER_STATUS" NUMBER,  CONSTRAINT "REPCAT$_SITES_NEW_FULL_INST" CHECK (full_instantiation IN ('Y', 'N')) ENABLE,  CONSTRAINT "REPCAT$_SITES_NEW_PK" PRIMARY KEY ("EXTENSION_ID", "GOWNER", "GNAME", "DBLINK") ENABLE,  CONSTRAINT "REPCAT$_SITES_NEW_FK1" FOREIGN KEY ("EXTENSION_ID") REFERENCES "REPCAT$_EXTENSION" ("EXTENSION_ID") ON DELETE CASCADE ENABLE,  CONSTRAINT "REPCAT$_SITES_NEW_FK2" FOREIGN KEY ("GNAME", "GOWNER") REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."EXTENSION_ID" IS 'Globally unique identifier for replication extension'
 
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."GOWNER" IS 'Owner of the object group'
 
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."GNAME" IS 'Name of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."DBLINK" IS 'A database site that will replicate the object group'
 
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."FULL_INSTANTIATION" IS 'Y if the database uses full-database export or change-based recovery'
 
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."MASTER_STATUS" IS 'Instantiation status of the new master'
 
   COMMENT ON TABLE "REPCAT$_SITES_NEW"  IS 'Information about new masters for replication extension'
 
--------------------------------------------------------
--  DDL for Table LOGMNR_TYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TYPE$" ("VERSION#" NUMBER, "VERSION" VARCHAR2(30), "TVOID" RAW(16), "TYPECODE" NUMBER, "PROPERTIES" NUMBER, "ATTRIBUTES" NUMBER, "METHODS" NUMBER, "HIDDENMETHODS" NUMBER, "SUPERTYPES" NUMBER, "SUBTYPES" NUMBER, "EXTERNTYPE" NUMBER, "EXTERNNAME" VARCHAR2(4000), "HELPERCLASSNAME" VARCHAR2(4000), "LOCAL_ATTRS" NUMBER, "LOCAL_METHODS" NUMBER, "TYPEID" RAW(16), "ROOTTOID" RAW(16), "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" NUMBER, "SUPERTOID" RAW(16), "HASHCODE" RAW(17), "TOID" RAW(16) NOT NULL ENABLE, "LOGMNR_UID" NUMBER(22,0), "LOGMNR_FLAGS" NUMBER(22,0),  CONSTRAINT "LOGMNR_TYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "TOID", "VERSION#") DISABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOL_STATS_CONTROL
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOL_STATS_CONTROL" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "CREATED" DATE CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN1" NOT NULL ENABLE, "STATUS" NUMBER(*,0) CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN2" NOT NULL ENABLE, "STATUS_UPDATE_DATE" DATE CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN3" NOT NULL ENABLE, "PURGED_DATE" DATE, "LAST_PURGE_START_DATE" DATE, "LAST_PURGE_END_DATE" DATE,  CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_PK" PRIMARY KEY ("SNAME", "ONAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."SNAME" IS 'Owner of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."ONAME" IS 'Name of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."CREATED" IS 'Timestamp for which statistics collection was first started'
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."STATUS" IS 'Status of statistics collection: ACTIVE, CANCELLED'
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."STATUS_UPDATE_DATE" IS 'Timestamp for which the status was last updated'
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."PURGED_DATE" IS 'Timestamp for the last purge of statistics data'
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."LAST_PURGE_START_DATE" IS 'The last start date of the statistics purging date range'
 
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."LAST_PURGE_END_DATE" IS 'The last end date of the statistics purging date range'
 
   COMMENT ON TABLE "REPCAT$_RESOL_STATS_CONTROL"  IS 'Information about statistics collection for conflict resolutions for all replicated tables in the database'
 
--------------------------------------------------------
--  DDL for Table REPCAT$_GROUPED_COLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_GROUPED_COLUMN" ("SNAME" VARCHAR2(30), "ONAME" VARCHAR2(30), "GROUP_NAME" VARCHAR2(30), "COLUMN_NAME" VARCHAR2(30), "POS" NUMBER,  CONSTRAINT "REPCAT$_GROUPED_COLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "GROUP_NAME", "COLUMN_NAME", "POS") ENABLE,  CONSTRAINT "REPCAT$_GROUPED_COLUMN_F1" FOREIGN KEY ("SNAME", "ONAME", "GROUP_NAME") REFERENCES "REPCAT$_COLUMN_GROUP" ("SNAME", "ONAME", "GROUP_NAME") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."SNAME" IS 'Owner of replicated object'
 
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."ONAME" IS 'Name of the replicated object'
 
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."GROUP_NAME" IS 'Name of the column group'
 
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."COLUMN_NAME" IS 'Name of the column in the column group'
 
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."POS" IS 'Position of a column or an attribute in the table'
 
   COMMENT ON TABLE "REPCAT$_GROUPED_COLUMN"  IS 'Columns in all column groups of replicated tables in the database'
 
--------------------------------------------------------
--  DDL for Table LOGMNRP_CTAS_PART_MAP
--------------------------------------------------------

  CREATE TABLE "LOGMNRP_CTAS_PART_MAP" ("LOGMNR_UID" NUMBER NOT NULL ENABLE, "BASEOBJ#" NUMBER NOT NULL ENABLE, "BASEOBJV#" NUMBER NOT NULL ENABLE, "KEYOBJ#" NUMBER NOT NULL ENABLE, "PART#" NUMBER NOT NULL ENABLE, "SPARE1" NUMBER, "SPARE2" NUMBER, "SPARE3" VARCHAR2(1000),  CONSTRAINT "LOGMNRP_CTAS_PART_MAP_PK" PRIMARY KEY ("LOGMNR_UID", "BASEOBJV#", "KEYOBJ#") ENABLE)  PARTITION BY RANGE ("LOGMNR_UID")  (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) NOCOMPRESS ) 
 
--------------------------------------------------------
--  DDL for Table AQ$_INTERNET_AGENT_PRIVS
--------------------------------------------------------

  CREATE TABLE "AQ$_INTERNET_AGENT_PRIVS" ("AGENT_NAME" VARCHAR2(30) NOT NULL ENABLE, "DB_USERNAME" VARCHAR2(30) NOT NULL ENABLE,  CONSTRAINT "UNQ_PAIRS" UNIQUE ("AGENT_NAME", "DB_USERNAME") ENABLE,  CONSTRAINT "AGENT_MUST_BE_CREATED" FOREIGN KEY ("AGENT_NAME") REFERENCES "AQ$_INTERNET_AGENTS" ("AGENT_NAME") ON DELETE CASCADE ENABLE) 
 
--------------------------------------------------------
--  DDL for Table STAFF_TABLE
--------------------------------------------------------

  CREATE TABLE "STAFF_TABLE" OF "STAFF" ( "MID" NOT NULL ENABLE,  PRIMARY KEY ("MID") ENABLE) 
 
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCAT
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPCAT" ("GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', "SNAME" VARCHAR2(30), "MASTER" VARCHAR2(1), "STATUS" NUMBER(*,0), "SCHEMA_COMMENT" VARCHAR2(80), "FLAVOR_ID" NUMBER, "FLAG" RAW(4) DEFAULT '00000000',  CONSTRAINT "REPCAT$_REPCAT_STATUS" CHECK (status IN (0, 1, 2)) ENABLE,  CONSTRAINT "REPCAT$_REPCAT_PRIMARY" PRIMARY KEY ("SNAME", "GOWNER") ENABLE) 
 
   COMMENT ON COLUMN "REPCAT$_REPCAT"."GOWNER" IS 'Owner of the object group'
 
   COMMENT ON COLUMN "REPCAT$_REPCAT"."SNAME" IS 'Name of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPCAT"."MASTER" IS 'Is the site a master site for the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPCAT"."STATUS" IS 'If the site is a master, the master''s status'
 
   COMMENT ON COLUMN "REPCAT$_REPCAT"."SCHEMA_COMMENT" IS 'Description of the replicated object group'
 
   COMMENT ON COLUMN "REPCAT$_REPCAT"."FLAVOR_ID" IS 'Flavor identifier'
 
   COMMENT ON COLUMN "REPCAT$_REPCAT"."FLAG" IS 'Miscellaneous repgroup info'
 
   COMMENT ON TABLE "REPCAT$_REPCAT"  IS 'Information about all replicated object groups'
 
--------------------------------------------------------
--  DDL for View VVISSUE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VVISSUE" ("FNAME", "LNAME", "MID", "ISBN", "TITLE", "AUTHOR") AS select fname,lname,mid,isbn,title,author from studen,book_T
 
--------------------------------------------------------
--  DDL for View VISSUE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VISSUE" ("FNAME", "LNAME", "ISBN", "TITLE", "AUTHOR") AS select fname,lname,isbn,title,author from student,book_T
 
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID')
 
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID')
 
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#
 
--------------------------------------------------------
--  DDL for View VBATCHSTUDEN
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VBATCHSTUDEN" ("FNAME", "LNAME", "MID", "DEPT", "BATCH") AS SELECT "FNAME","LNAME","MID","DEPT","BATCH" from studen WHERE batch>='2nd'
 
--------------------------------------------------------
--  DDL for View SENE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "SENE" ("FNAME", "LNAME") AS select  fname,lname from studen
 
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#
 
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID')
 
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE VIEW "AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '-06:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '-06:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '-06:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '-06:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '-06:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '-06:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY
 
--------------------------------------------------------
--  DDL for View VVBOOK_T
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VVBOOK_T" ("ISBN", "TITLE", "AUTHOR", "COPY", "YEAR") AS SELECT "ISBN","TITLE","AUTHOR","COPY","YEAR" from book_t where COPY<=100
 
--------------------------------------------------------
--  DDL for View VSALARYSTAFF_TABLE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VSALARYSTAFF_TABLE" ("FNAME", "LNAME", "MID", "SALARY", "POSITION") AS SELECT "FNAME","LNAME","MID","SALARY","POSITION" from staff_table WHERE salary>=6000 
 
--------------------------------------------------------
--  DDL for View MYBOOK
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MYBOOK" ("TITLE", "AUTHOR", "MID") AS select title,author,mid from  book_T  ,issue  where book_T.isbn=issue.isbn
 
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE VIEW "AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA") AS SELECT qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, qt.delay DELAY, qt.expiration EXPIRATION, qt.enq_time ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, qt.deq_time DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, qt.time_manager_info TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA  FROM "DEF$_AQERROR" qt, ALL_DEQUEUE_QUEUES qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY
 
--------------------------------------------------------
--  DDL for View BOOKV
--------------------------------------------------------

  CREATE OR REPLACE VIEW "BOOKV" ("MID", "FNAME", "LNAME", "ISBN", "TITLE") AS SELECT mid,fname,lname,isbn,title
    
FROM studen,book_T
 
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID')
 
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE VIEW "AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA") AS SELECT qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, qt.delay DELAY, qt.expiration EXPIRATION, qt.enq_time ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, qt.deq_time DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, qt.time_manager_info TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA  FROM "DEF$_AQCALL" qt, ALL_DEQUEUE_QUEUES qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY
 
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a
 
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID
 
--------------------------------------------------------
--  DDL for View VBOOK_T
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VBOOK_T" ("ISBN", "TITLE", "AUTHOR", "COPY", "YEAR") AS SELECT "ISBN","TITLE","AUTHOR","COPY","YEAR" from book_t where COPY<='20'
 
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE VIEW "AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '-06:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '-06:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '-06:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '-06:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '-06:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '-06:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY
 
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PROCEDURE "ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;
 
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

 
--------------------------------------------------------
--  DDL for Type GUEST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "GUEST" under member_T
(phone varchar2(20),
location varchar2(20))

 
--------------------------------------------------------
--  DDL for Type PESRON_TYPE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "PESRON_TYPE" AS OBJECT
 (name  VARCHAR2(10),
  address  VARCHAR2(20),
  contact  VARCHAR2(35)) NOT FINAL

 
--------------------------------------------------------
--  DDL for Type BOOK
--------------------------------------------------------

  CREATE OR REPLACE TYPE "BOOK" as object
(isbn varchar2(20),
title varchar2(20),
author varchar2(20),
copy varchar2(20),
year varchar2(20))

 
--------------------------------------------------------
--  DDL for Type STUDENT_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "STUDENT_T" under member_T
(dept varchar2(20),
batch varchar2(20))

 
--------------------------------------------------------
--  DDL for Type PATIENT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "PATIENT_TYPE" UNDER pesron_type
(patientno VARCHAR2(10),
 bloodgroup VARCHAR2(32),
history VARCHAR2(255),
  dob VARCHAR2(12),
  roomno VARCHAR2(10),
    dateadd VARCHAR2(12),
   rtype VARCHAR2(64),
  gender VARCHAR2(6),
  docname  VARCHAR2(64))

 
--------------------------------------------------------
--  DDL for Type STAFF
--------------------------------------------------------

  CREATE OR REPLACE TYPE "STAFF" under member_T
(salary varchar2(20),
position varchar2(20))

 
--------------------------------------------------------
--  DDL for Type MEMBER_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MEMBER_T" as object
(Fname varchar2(20),
Lname varchar2(20),
mid varchar2(20)) not final

 
--------------------------------------------------------
--  DDL for Type DOCTOR_TYPE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DOCTOR_TYPE" UNDER pesron_type
  (did VARCHAR2(10),
  specialization VARCHAR2(64),
  workfrom VARCHAR2(2),
 workto  VARCHAR2(2))

 
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "COL" FOR "COL"
 
--------------------------------------------------------
--  DDL for Synonymn MM
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "MM" FOR "LIB_T"@"SITE1"
 
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSFILES" FOR "SYSFILES"
 
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "PRODUCT_USER_PROFILE" FOR "SQLPLUS_PRODUCT_PROFILE"
 
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "PUBLICSYN" FOR "PUBLICSYN"
 
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "TABQUOTAS" FOR "TABQUOTAS"
 
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSCATALOG" FOR "SYSCATALOG"
 
--------------------------------------------------------
--  DDL for Synonymn ALE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "ALE" FOR "STUDEN"@"ENDALKLOC"
 
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "TAB" FOR "TAB"
 
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CATALOG" FOR "CATALOG"
 
--------------------------------------------------------
--  DDL for Synonymn UOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "UOG" FOR "BDU"@"REMOTEDB"
 
---------------------------------------------------
--   DATA FOR TABLE LOGMNR_ERROR$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_ERROR$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_ERROR$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_TEMPLATE_STATUS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_TEMPLATE_STATUS
Insert into REPCAT$_TEMPLATE_STATUS (TEMPLATE_STATUS_ID,STATUS_TYPE_NAME) values (0,'Modifiable');
Insert into REPCAT$_TEMPLATE_STATUS (TEMPLATE_STATUS_ID,STATUS_TYPE_NAME) values (1,'Frozen');
Insert into REPCAT$_TEMPLATE_STATUS (TEMPLATE_STATUS_ID,STATUS_TYPE_NAME) values (2,'Deleted');

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_TEMPLATE_STATUS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_TABPART$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_TABPART$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_TABPART$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_PROPAGATOR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_PROPAGATOR

---------------------------------------------------
--   END DATA FOR TABLE DEF$_PROPAGATOR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE SAMPLET
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SAMPLET

---------------------------------------------------
--   END DATA FOR TABLE SAMPLET
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE OL$HINTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into OL$HINTS

---------------------------------------------------
--   END DATA FOR TABLE OL$HINTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_INDSUBPART$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_INDSUBPART$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_INDSUBPART$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_RESOLUTION_STATISTICS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_RESOLUTION_STATISTICS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_RESOLUTION_STATISTICS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_RESOLUTION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_RESOLUTION

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_RESOLUTION
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_AGE_SPILL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_AGE_SPILL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_AGE_SPILL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_EXCEPTIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_EXCEPTIONS

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_EXCEPTIONS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REPCATLOG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REPCATLOG

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REPCATLOG
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_ROLLUP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_ROLLUP

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_ROLLUP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$APPLY_MILESTONE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$APPLY_MILESTONE

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$APPLY_MILESTONE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_LOB
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_LOB

---------------------------------------------------
--   END DATA FOR TABLE DEF$_LOB
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNRC_DBNAME_UID_MAP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNRC_DBNAME_UID_MAP

---------------------------------------------------
--   END DATA FOR TABLE LOGMNRC_DBNAME_UID_MAP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_LOGMNR_BUILDLOG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_LOGMNR_BUILDLOG

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_LOGMNR_BUILDLOG
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_FLAVORS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_FLAVORS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_FLAVORS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNRC_GTLO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNRC_GTLO

---------------------------------------------------
--   END DATA FOR TABLE LOGMNRC_GTLO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEPT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEPT
Insert into DEPT (DNAME,DLOCATION,DID) values ('IS','ted','is1');

---------------------------------------------------
--   END DATA FOR TABLE DEPT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_GT_TAB_INCLUDE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_GT_TAB_INCLUDE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_GT_TAB_INCLUDE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$PARAMETERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$PARAMETERS

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$PARAMETERS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_ERROR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_ERROR

---------------------------------------------------
--   END DATA FOR TABLE DEF$_ERROR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_GC
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_GC

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_GC
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_DDL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_DDL

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_DDL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_BASETABLE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_BASETABLE

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_BASETABLE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE TEST2
--   FILTER = none used
---------------------------------------------------
REM INSERTING into TEST2
Insert into TEST2 (ID) values ('4');

---------------------------------------------------
--   END DATA FOR TABLE TEST2
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_PRIORITY_GROUP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_PRIORITY_GROUP

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_PRIORITY_GROUP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$FLASHBACK_SCN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$FLASHBACK_SCN

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$FLASHBACK_SCN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_PARAMETER$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_PARAMETER$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_PARAMETER$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MEMBER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MEMBER

---------------------------------------------------
--   END DATA FOR TABLE MEMBER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE STUDENT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into STUDENT
Insert into STUDENT (FNAME,LNAME) values ('abrahm','alehegn');
Insert into STUDENT (FNAME,LNAME) values ('abebe','besobela');
Insert into STUDENT (FNAME,LNAME) values (null,null);
Insert into STUDENT (FNAME,LNAME) values ('Alminat','Alex');
Insert into STUDENT (FNAME,LNAME) values ('Alminat','Alex');
Insert into STUDENT (FNAME,LNAME) values ('Alminat','Alex');
Insert into STUDENT (FNAME,LNAME) values ('Alminat','Alex');
Insert into STUDENT (FNAME,LNAME) values ('lake ','frew');
Insert into STUDENT (FNAME,LNAME) values ('ale','abe');
Insert into STUDENT (FNAME,LNAME) values ('lakew','firew');
Insert into STUDENT (FNAME,LNAME) values (null,null);
Insert into STUDENT (FNAME,LNAME) values (null,null);
Insert into STUDENT (FNAME,LNAME) values (null,null);
Insert into STUDENT (FNAME,LNAME) values (null,null);
Insert into STUDENT (FNAME,LNAME) values ('lakefreaw','atnafu');
Insert into STUDENT (FNAME,LNAME) values (null,null);
Insert into STUDENT (FNAME,LNAME) values ('qq','aa');
Insert into STUDENT (FNAME,LNAME) values ('uu','aa');
Insert into STUDENT (FNAME,LNAME) values ('A/a','alex');
Insert into STUDENT (FNAME,LNAME) values ('lakech','selam');
Insert into STUDENT (FNAME,LNAME) values (null,null);

---------------------------------------------------
--   END DATA FOR TABLE STUDENT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$SKIP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$SKIP

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$SKIP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_PARTOBJ$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_PARTOBJ$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_PARTOBJ$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNRC_GTCS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNRC_GTCS

---------------------------------------------------
--   END DATA FOR TABLE LOGMNRC_GTCS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGIN1
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGIN1
Insert into LOGIN1 (UN,PWD) values ('lib','lib');
Insert into LOGIN1 (UN,PWD) values ('lake','likes');
Insert into LOGIN1 (UN,PWD) values ('lib','12');

---------------------------------------------------
--   END DATA FOR TABLE LOGIN1
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_TEMPLATE_REFGROUPS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_TEMPLATE_REFGROUPS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_TEMPLATE_REFGROUPS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_INDCOMPART$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_INDCOMPART$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_INDCOMPART$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE GUEST_T
--   FILTER = none used
---------------------------------------------------
REM INSERTING into GUEST_T
Insert into GUEST_T (FNAME,LNAME,MID,PHONE,LOCATION) values ('where ','are','you','092','from');
Insert into GUEST_T (FNAME,LNAME,MID,PHONE,LOCATION) values ('2','Million','Meshesha','091816178','A.A');
Insert into GUEST_T (FNAME,LNAME,MID,PHONE,LOCATION) values ('8','Tibebe','Beshah','09877','A.A');
Insert into GUEST_T (FNAME,LNAME,MID,PHONE,LOCATION) values ('6','azmraw','Mossie','868787','Adiss');
Insert into GUEST_T (FNAME,LNAME,MID,PHONE,LOCATION) values ('60','AA','BB','0960987632','A.a');
Insert into GUEST_T (FNAME,LNAME,MID,PHONE,LOCATION) values ('62','ff','3qr','er','ewr');
Insert into GUEST_T (FNAME,LNAME,MID,PHONE,LOCATION) values ('11','Joh','Kiris','098767','Philpino');

---------------------------------------------------
--   END DATA FOR TABLE GUEST_T
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_PARAMETER_COLUMN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_PARAMETER_COLUMN

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_PARAMETER_COLUMN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_FLAVOR_OBJECTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_FLAVOR_OBJECTS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_FLAVOR_OBJECTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_SQLDEPEND
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_SQLDEPEND

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_SQLDEPEND
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_SESSION$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_SESSION$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_SESSION$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_CALLDEST
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_CALLDEST

---------------------------------------------------
--   END DATA FOR TABLE DEF$_CALLDEST
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_PARAMETERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_PARAMETERS
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_EXACT_DELETE',0,null,null,0.02);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_EXACT_BUCKETS',0,null,null,1000);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_PARTIAL_DELETE',0,null,null,0.02);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_PARTIAL_BUCKETS',0,null,null,1000);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_AJG_DELETE',0,null,null,0.02);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_AJG_BUCKETS',0,null,null,100);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_FJG_DELETE',0,null,null,0.02);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_GC_DELETE',0,null,null,0.02);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_MEA_DELETE',0,null,null,0.05);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_TRACE_LEVEL',0,null,null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_REWRITE_NRF',0,null,null,10);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.console_output',1,'True',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.wip_interval',0,null,null,250);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.commit_interval',0,null,null,100);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.sql_exclusions',1,'SYSTEM.%',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.pretty',1,'True',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.lcase_names',1,'True',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.lcase_keywords',1,'False',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.add_alias',1,'False',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.ignore_ambig',1,'True',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.fixup_alias',1,'False',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.optimize',1,'True',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.ignore_columns',1,'True',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.fixup_schema',1,'False',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.remove_optional_keywords',1,'False',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.dump_tree',1,'True',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.debug_flags',1,null,null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.datetime_mask',1,'dd/MM/yyyy HH:mm',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_MIN_CLQ_MF_RATIO',0,null,null,0.05);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_MIN_SUM_BC_RATIO',0,null,null,0.05);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_MAX_GCS',0,null,null,1000);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_PCT_COMPL_POLL_INTL',0,null,null,10);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_TRACE_LEVEL',0,null,null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_AEP_MAX_LAT_SIZE',0,null,null,1024);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_AEP_MAX_FACT_TABLES',0,null,null,10);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color1',1,'#FFFFDE',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color2',1,'#336699',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color3',1,'#FFCC60',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color4',1,'white',null,0);
Insert into MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.include_unused',1,'False',null,0);

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_PARAMETERS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_CLIQUE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_CLIQUE

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_CLIQUE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNRT_MDDL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNRT_MDDL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNRT_MDDL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REPPROP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REPPROP

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REPPROP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_LOG$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_LOG$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_LOG$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REFRESH_TEMPLATES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REFRESH_TEMPLATES

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REFRESH_TEMPLATES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_TEMPLATE_TYPES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_TEMPLATE_TYPES
Insert into REPCAT$_TEMPLATE_TYPES (TEMPLATE_TYPE_ID,TEMPLATE_DESCRIPTION,FLAGS,SPARE1) values (1,'Deployment template','[B@146ba6f',null);
Insert into REPCAT$_TEMPLATE_TYPES (TEMPLATE_TYPE_ID,TEMPLATE_DESCRIPTION,FLAGS,SPARE1) values (2,'IAS template','[B@79d438',null);

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_TEMPLATE_TYPES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_INSTANTIATION_DDL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_INSTANTIATION_DDL

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_INSTANTIATION_DDL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_AQERROR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_AQERROR

---------------------------------------------------
--   END DATA FOR TABLE DEF$_AQERROR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_USER_AUTHORIZATIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_USER_AUTHORIZATIONS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_USER_AUTHORIZATIONS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE TOTA
--   FILTER = none used
---------------------------------------------------
REM INSERTING into TOTA
Insert into TOTA (NAME) values ('dd');
Insert into TOTA (NAME) values ('ayehu');

---------------------------------------------------
--   END DATA FOR TABLE TOTA
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_AQCALL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_AQCALL

---------------------------------------------------
--   END DATA FOR TABLE DEF$_AQCALL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REPSCHEMA
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REPSCHEMA

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REPSCHEMA
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE SQLPLUS_PRODUCT_PROFILE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SQLPLUS_PRODUCT_PROFILE

---------------------------------------------------
--   END DATA FOR TABLE SQLPLUS_PRODUCT_PROFILE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_INFO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_INFO

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_INFO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_INDEX
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_INDEX

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_INDEX
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_COL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_COL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_COL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_RESOLUTION_METHOD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_RESOLUTION_METHOD
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'ADDITIVE');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'AVERAGE');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'DISCARD');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'EARLIEST TIMESTAMP');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'LATEST TIMESTAMP');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'MAXIMUM');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'MINIMUM');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'OVERWRITE');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'PRIORITY GROUP');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'SITE PRIORITY');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'USER FLAVOR FUNCTION');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'USER FUNCTION');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'APPEND SEQUENCE');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'APPEND SITE NAME');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'DISCARD');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'USER FLAVOR FUNCTION');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'USER FUNCTION');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (3,'USER FLAVOR FUNCTION');
Insert into REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (3,'USER FUNCTION');

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_RESOLUTION_METHOD
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_COLTYPE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_COLTYPE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_COLTYPE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_LOBFRAG$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_LOBFRAG$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_LOBFRAG$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOG
Insert into LOG (UN,PWD) values ('alex','abe');

---------------------------------------------------
--   END DATA FOR TABLE LOG
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$APPLY_PROGRESS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$APPLY_PROGRESS

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$APPLY_PROGRESS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_ATTRCOL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_ATTRCOL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_ATTRCOL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_FILTER$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_FILTER$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_FILTER$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_SESSION_EVOLVE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_SESSION_EVOLVE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_SESSION_EVOLVE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_SEED$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_SEED$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_SEED$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$SKIP_SUPPORT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$SKIP_SUPPORT
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (2,'DML',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (6,'DML',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (7,'DML',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (4,'CLUSTER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (5,'CLUSTER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (8,'CLUSTER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (86,'CLUSTER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (177,'CONTEXT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (178,'CONTEXT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (32,'DATABASE LINK',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (33,'DATABASE LINK',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (174,'DIMENSION',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (175,'DIMENSION',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (176,'DIMENSION',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (157,'DIRECTORY',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (158,'DIRECTORY',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (9,'INDEX',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (11,'INDEX',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (10,'INDEX',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (24,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (25,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (68,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (91,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (92,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (93,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (94,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (95,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (96,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (97,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (98,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (99,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (159,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (196,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (84,'PROCEDURE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (65,'PROFILE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (67,'PROFILE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (66,'PROFILE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (52,'ROLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (79,'ROLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (54,'ROLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (55,'ROLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (36,'ROLLBACK STATEMENT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (37,'ROLLBACK STATEMENT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (38,'ROLLBACK STATEMENT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (13,'SEQUENCE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (14,'SEQUENCE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (16,'SEQUENCE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (19,'SYNONYM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (20,'SYNONYM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (110,'SYNONYM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (111,'SYNONYM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (1,'TABLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (15,'TABLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (12,'TABLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (85,'TABLE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (39,'TABLESPACE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (40,'TABLESPACE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (41,'TABLESPACE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (59,'TRIGGER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (60,'TRIGGER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (61,'TRIGGER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (118,'TRIGGER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (119,'TRIGGER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (120,'TRIGGER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (121,'TRIGGER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (77,'TYPE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (78,'TYPE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (80,'TYPE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (81,'TYPE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (82,'TYPE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (83,'TYPE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (51,'USER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (43,'USER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (53,'USER',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (21,'VIEW',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (22,'VIEW',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (17,'GRANT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (18,'REVOKE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (30,'AUDIT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (31,'AUDIT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (1000000,'PL/SQL',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (1000001,'PL/SQL_DDL',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'ADAMS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ANONYMOUS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'BI',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'BLAKE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'CLARK',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'CTXSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'DIP',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'DBSNMP',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'DMSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'EXFSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'HR',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'IX',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'JONES',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'LBACSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'MDDATA',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'MDSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'MGMT_VIEW',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'MTSSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ODM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ODM_MTR',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'OE',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'OLAPSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ORACLE_OCM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ORDPLUGINS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ORDSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'OUTLN',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'PM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'SCOTT',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SI_INFORMTN_SCHEMA',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'SH',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SYSTEM',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SYSMAN',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'TSMSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WKPROXY',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WKSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WK_TEST',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WMSYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'XDB',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'XS$NULL',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'XTISYS',0,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'FLOWS_030000',1,null,null,null);
Insert into LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'OWBSYS',1,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$SKIP_SUPPORT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_DICTIONARY$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_DICTIONARY$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_DICTIONARY$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_UID$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_UID$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_UID$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE AQ$_INTERNET_AGENTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AQ$_INTERNET_AGENTS
Insert into AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('SCHEDULER$_EVENT_AGENT',0,null);
Insert into AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('SCHEDULER$_REMDB_AGENT',0,null);
Insert into AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('SERVER_ALERT',0,null);
Insert into AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('HAE_SUB',0,null);
Insert into AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('ADOBEEREG_COM_3938_ALEX',0,null);

---------------------------------------------------
--   END DATA FOR TABLE AQ$_INTERNET_AGENTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_OWB
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_OWB

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_OWB
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_USER$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_USER$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_USER$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_OBJECT_PARMS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_OBJECT_PARMS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_OBJECT_PARMS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_USER_PARM_VALUES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_USER_PARM_VALUES

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_USER_PARM_VALUES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_PROCESSED_LOG$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_PROCESSED_LOG$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_PROCESSED_LOG$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNRC_GSII
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNRC_GSII

---------------------------------------------------
--   END DATA FOR TABLE LOGMNRC_GSII
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_DEFAULTDEST
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_DEFAULTDEST

---------------------------------------------------
--   END DATA FOR TABLE DEF$_DEFAULTDEST
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_PROPS$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_PROPS$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_PROPS$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_WORKLOAD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_WORKLOAD

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_WORKLOAD
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_DESTINATION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_DESTINATION

---------------------------------------------------
--   END DATA FOR TABLE DEF$_DESTINATION
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_TABCOMPART$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_TABCOMPART$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_TABCOMPART$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REPCOLUMN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REPCOLUMN

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REPCOLUMN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE COMP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into COMP
Insert into COMP (COURSE) values ('programming');
Insert into COMP (COURSE) values ('networking');

---------------------------------------------------
--   END DATA FOR TABLE COMP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BOOK_T
--   FILTER = none used
---------------------------------------------------
REM INSERTING into BOOK_T
Insert into BOOK_T (ISBN,TITLE,AUTHOR,COPY,YEAR) values ('111','Java','bini','100','2014');
Insert into BOOK_T (ISBN,TITLE,AUTHOR,COPY,YEAR) values ('222','c++','dibaba','500','2005');
Insert into BOOK_T (ISBN,TITLE,AUTHOR,COPY,YEAR) values ('333','php','lake','3','2006');
Insert into BOOK_T (ISBN,TITLE,AUTHOR,COPY,YEAR) values ('444','networking','james','5','2012');

---------------------------------------------------
--   END DATA FOR TABLE BOOK_T
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE HP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HP

---------------------------------------------------
--   END DATA FOR TABLE HP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_LEVEL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_LEVEL

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_LEVEL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_FILTER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_FILTER

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_FILTER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_PARTITION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_PARTITION

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_PARTITION
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGIN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGIN

---------------------------------------------------
--   END DATA FOR TABLE LOGIN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_PRIORITY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_PRIORITY

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_PRIORITY
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_KEY_COLUMNS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_KEY_COLUMNS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_KEY_COLUMNS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_EXTENSION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_EXTENSION

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_EXTENSION
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_AUDIT_ATTRIBUTE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_AUDIT_ATTRIBUTE
Insert into REPCAT$_AUDIT_ATTRIBUTE (ATTRIBUTE,DATA_TYPE_ID,DATA_LENGTH,SOURCE) values ('TIMESTAMP',3,null,'SYSDATE');
Insert into REPCAT$_AUDIT_ATTRIBUTE (ATTRIBUTE,DATA_TYPE_ID,DATA_LENGTH,SOURCE) values ('GLOBAL NAME',2,128,'DBMS_REPUTIL.GLOBAL_NAME');

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_AUDIT_ATTRIBUTE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_SPILL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_SPILL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_SPILL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_PLAN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_PLAN

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_PLAN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REPGROUP_PRIVS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REPGROUP_PRIVS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REPGROUP_PRIVS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_ORIGIN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_ORIGIN

---------------------------------------------------
--   END DATA FOR TABLE DEF$_ORIGIN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_COLUMN_GROUP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_COLUMN_GROUP

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_COLUMN_GROUP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE OL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into OL$

---------------------------------------------------
--   END DATA FOR TABLE OL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_TAB$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_TAB$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_TAB$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE STUDEN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into STUDEN
Insert into STUDEN (FNAME,LNAME,MID,DEPT,BATCH) values ('Mekides','Fenta','2','cs','2nd');
Insert into STUDEN (FNAME,LNAME,MID,DEPT,BATCH) values ('Abebe','Alemu','3','IT','1st');
Insert into STUDEN (FNAME,LNAME,MID,DEPT,BATCH) values ('Getahun','Mitku','1','civil','4th');
Insert into STUDEN (FNAME,LNAME,MID,DEPT,BATCH) values ('Mulugeta','Shite','4','Biology','3rd');

---------------------------------------------------
--   END DATA FOR TABLE STUDEN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_AUDIT_COLUMN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_AUDIT_COLUMN

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_AUDIT_COLUMN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_PUSHED_TRANSACTIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_PUSHED_TRANSACTIONS

---------------------------------------------------
--   END DATA FOR TABLE DEF$_PUSHED_TRANSACTIONS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_TS$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_TS$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_TS$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_KOPM$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_KOPM$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_KOPM$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_ELIGIBLE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_ELIGIBLE

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_ELIGIBLE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_TEMPLATE_PARMS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_TEMPLATE_PARMS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_TEMPLATE_PARMS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ISSUE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ISSUE
Insert into ISSUE (ISBN,MID,ISSUEDATE,DUEDATE) values ('111','1','1/12/2016','2/12/2016');

---------------------------------------------------
--   END DATA FOR TABLE ISSUE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE OL$NODES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into OL$NODES

---------------------------------------------------
--   END DATA FOR TABLE OL$NODES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_RESTART_CKPT$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_RESTART_CKPT$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_RESTART_CKPT$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_PRETTY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_PRETTY

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_PRETTY
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_DICTSTATE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_DICTSTATE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_DICTSTATE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$SCN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$SCN

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$SCN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_ENC$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_ENC$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_ENC$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_LOB$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_LOB$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_LOB$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_FILTERINSTANCE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_FILTERINSTANCE

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_FILTERINSTANCE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOG1
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOG1
Insert into LOG1 (UN,PWD,UT) values ('a','b','admin');
Insert into LOG1 (UN,PWD,UT) values ('d','c','librarian');
Insert into LOG1 (UN,PWD,UT) values ('d','c','Librarian');

---------------------------------------------------
--   END DATA FOR TABLE LOG1
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_SUBCOLTYPE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_SUBCOLTYPE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_SUBCOLTYPE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_ICOL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_ICOL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_ICOL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE AQ$_QUEUE_TABLES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AQ$_QUEUE_TABLES
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','SCHEDULER$_EVENT_QTAB',1,11289,28681,2,'-06:00','Scheduler event queue table');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','SCHEDULER$_REMDB_JOBQTAB',1,11315,24585,2,'-06:00','Scheduler remote db job queue table');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','ALERT_QT',1,11376,28681,2,'-06:00','Server Generated Alert Queue Table');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','AQ$_MEM_MC',3,11572,24585,2,'-06:00','table for non_persistent queues');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','AQ_EVENT_TABLE',1,11597,16384,2,'-06:00','CREATING AQ_EVENT_TABLE QUEUE TABLE');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','AQ_SRVNTFN_TABLE',1,11609,24584,2,'-06:00','CREATING AQ_SRVNTFN_TABLE QUEUE TABLE');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','AQ_PROP_TABLE',1,11626,24585,2,'-06:00','Queue Table for Notification in AQ Prop. Scheduling');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','KUPC$DATAPUMP_QUETAB',1,11773,16393,2,'-06:00','DataPump Queue Table');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSTEM','DEF$_AQCALL',2,11874,16384,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSTEM','DEF$_AQERROR',2,11885,16384,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','SYS$SERVICE_METRICS_TAB',1,11911,24585,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('WMSYS','WM$EVENT_QUEUE_TABLE',1,12417,24585,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSMAN','MGMT_TASK_QTABLE',1,64432,24584,3,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSMAN','MGMT_NOTIFY_QTABLE',1,64752,24585,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSMAN','MGMT_NOTIFY_INPUT_QTABLE',3,64788,24584,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSMAN','MGMT_PAF_MSG_QTABLE_1',1,67711,24584,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSMAN','MGMT_PAF_MSG_QTABLE_2',1,67721,24584,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSMAN','MGMT_LOADER_QTABLE',3,67797,24585,2,'-06:00',null);
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('IX','ORDERS_QUEUETABLE',1,70802,24585,2,'-06:00','Orders queue table');
Insert into AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('IX','STREAMS_QUEUE_TABLE',1,70817,28683,4,'-06:00',null);

---------------------------------------------------
--   END DATA FOR TABLE AQ$_QUEUE_TABLES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_OUTPUT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_OUTPUT

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_OUTPUT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE AQ$_SCHEDULES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AQ$_SCHEDULES

---------------------------------------------------
--   END DATA FOR TABLE AQ$_SCHEDULES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$PLSQL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$PLSQL

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$PLSQL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LIB_T
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LIB_T
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('33','Gebiya','Min','88888','Denbeya');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('65','uuu','aa','655','dd');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('0993','Alehegn','Adane','091831656','BDR');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('Teku','Teku','Teku','988','UOG');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('1','Almaze','Ayichew','887','lib');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('1','Almaze','Ayichew','887','lib');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('22','teklu','teklu','077','uog');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values ('2','azezo','buu','22','uog');
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values (null,null,null,null,null);
Insert into LIB_T (LIBID,FNAME,LNAME,PHONE,ADDRESS) values (null,'Almaze','Ayichew','887','lib');

---------------------------------------------------
--   END DATA FOR TABLE LIB_T
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PERSON
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PERSON

---------------------------------------------------
--   END DATA FOR TABLE PERSON
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE EMP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into EMP
Insert into EMP (FNAME,LNAME,EID,DID) values ('getachew','worku','11','is1');

---------------------------------------------------
--   END DATA FOR TABLE EMP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_TABSUBPART$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_TABSUBPART$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_TABSUBPART$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE STU
--   FILTER = none used
---------------------------------------------------
REM INSERTING into STU
Insert into STU (FNAME,LNAME,MID,DEPT,BATCH) values (null,null,null,null,null);
Insert into STU (FNAME,LNAME,MID,DEPT,BATCH) values (null,null,null,null,null);
Insert into STU (FNAME,LNAME,MID,DEPT,BATCH) values (null,null,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE STU
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_AJG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_AJG

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_AJG
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_JOURNAL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_JOURNAL

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_JOURNAL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$EVENTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$EVENTS

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$EVENTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE HELP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HELP
Insert into HELP (TOPIC,SEQ,INFO) values ('@',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@',2,' @ ("at" sign)');
Insert into HELP (TOPIC,SEQ,INFO) values ('@',3,' -------------');
Insert into HELP (TOPIC,SEQ,INFO) values ('@',4,' Runs the SQL*Plus statements in the specified script. The script can be');
Insert into HELP (TOPIC,SEQ,INFO) values ('@',5,' called from the local file system or a web server.');
Insert into HELP (TOPIC,SEQ,INFO) values ('@',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@',7,' @ {url|file_name[.ext]} [arg ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('@',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@',9,' where url supports HTTP and FTP protocols in the form:');
Insert into HELP (TOPIC,SEQ,INFO) values ('@',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@',11,'    http://host.domain/script.sql');
Insert into HELP (TOPIC,SEQ,INFO) values ('@',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',2,' @@ (double "at" sign)');
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',3,' ---------------------');
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',5,' Runs the specified script. This command is almost identical to');
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',6,' the @ command. It is useful for running nested scripts because it');
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',7,' has the additional functionality of looking for the nested script');
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',8,' in the same url or path as the calling script.');
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',10,' @@ {url|file_name[.ext]} [arg ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('@@',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('/',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('/',2,' / (slash)');
Insert into HELP (TOPIC,SEQ,INFO) values ('/',3,' ---------');
Insert into HELP (TOPIC,SEQ,INFO) values ('/',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('/',5,' Executes the most recently executed SQL command or PL/SQL block');
Insert into HELP (TOPIC,SEQ,INFO) values ('/',6,' which is stored in the SQL buffer. Use slash (/) at the command');
Insert into HELP (TOPIC,SEQ,INFO) values ('/',7,' prompt or line number prompt in SQL*Plus command line. The buffer');
Insert into HELP (TOPIC,SEQ,INFO) values ('/',8,' has no command history and does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('/',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('/',10,' /');
Insert into HELP (TOPIC,SEQ,INFO) values ('/',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',2,' ACCEPT');
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',5,' Reads a line of input and stores it in a given substitution variable.');
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',7,' ACC[EPT] variable [NUM[BER] | CHAR | DATE | BINARY_FLOAT | BINARY_DOUBLE]');
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',8,' [FOR[MAT] format] [DEF[AULT] default] [PROMPT text | NOPR[OMPT]] [HIDE]');
Insert into HELP (TOPIC,SEQ,INFO) values ('ACCEPT',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',2,' APPEND');
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',5,' Adds text to the end of the current line in the SQL buffer.');
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',7,' A[PPEND] text');
Insert into HELP (TOPIC,SEQ,INFO) values ('APPEND',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',2,' ARCHIVE LOG');
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',3,' -----------');
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',5,' Starts or stops automatic archiving of online redo log files,');
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',6,' manually (explicitly) archives specified redo log files, or');
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',7,' displays information about redo log files.');
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',9,' ARCHIVE LOG {LIST|STOP} | {START|NEXT|ALL|integer} [TO destination]');
Insert into HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',2,' ATTRIBUTE');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',3,' ---------');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',5,' Specifies display characteristics for a given attribute of an Object Type');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',6,' column, such as the format of NUMBER data. Columns and attributes should');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',7,' not have the same names as they share a common namespace. Lists the');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',8,' current display characteristics for a single attribute or all attributes.');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',10,' ATTRIBUTE [type_name.attribute_name [option ... ]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',12,' where option represents one of the following terms or clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',13,'     ALI[AS] alias');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',14,'     CLE[AR]');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',15,'     FOR[MAT] format');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',16,'     LIKE {type_name.attribute_name | alias}');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',17,'     ON|OFF');
Insert into HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',18,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',2,' BREAK');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',5,' Specifies where changes occur in a report and the formatting');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',6,' action to perform, such as:');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',7,' - suppressing display of duplicate values for a given column');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',8,' - skipping a line each time a given column value changes');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',9,' - printing computed figures each time a given column value');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',10,'   changes or at the end of the report.');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',11,' Enter BREAK with no clauses to list the current BREAK definition.');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',13,' BRE[AK] [ON report_element [action [action]]] ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',15,' where report_element has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',16,'     {column | expression | ROW | REPORT}');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',17,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',18,' and where action has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',19,'     [SKI[P] n | [SKI[P]] PAGE] [NODUP[LICATES] | DUP[LICATES]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('BREAK',20,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',2,' BTITLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',5,' Places and formats a specified title at the bottom of each report');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',6,' page, or lists the current BTITLE definition.');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',8,' BTI[TLE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',10,' where printspec represents one or more of the following clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',12,'     COL n          LE[FT]        BOLD');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',13,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',14,'     TAB n          R[IGHT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('BTITLE',15,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',2,' CHANGE');
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',5,' Changes the first occurrence of the specified text on the current');
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',6,' line of the SQL buffer. The buffer has no command history list and');
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',7,' does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',9,' C[HANGE] sepchar old [sepchar [new[sepchar]]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CHANGE',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',2,' CLEAR');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',5,' Resets or erases the current value or setting for the specified option.');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',7,' CL[EAR] option ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',9,' where option represents one of the following clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',10,'     BRE[AKS]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',11,'     BUFF[ER]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',12,'     COL[UMNS]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',13,'     COMP[UTES]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',14,'     SCR[EEN]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',15,'     SQL');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',16,'     TIMI[NG]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CLEAR',17,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',2,' COLUMN');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',5,' Specifies display attributes for a given column, such as:');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',6,'     - text for the column heading');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',7,'     - alignment for the column heading');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',8,'     - format for NUMBER data');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',9,'     - wrapping of column data');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',10,' Also lists the current display attributes for a single column');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',11,' or all columns.');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',13,' COL[UMN] [{column | expr} [option ...] ]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',15,' where option represents one of the following clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',16,'     ALI[AS] alias');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',17,'     CLE[AR]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',18,'     ENTMAP {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',19,'     FOLD_A[FTER]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',20,'     FOLD_B[EFORE]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',21,'     FOR[MAT] format');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',22,'     HEA[DING] text');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',23,'     JUS[TIFY] {L[EFT] | C[ENTER] | R[IGHT]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',24,'     LIKE {expr | alias}');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',25,'     NEWL[INE]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',26,'     NEW_V[ALUE] variable');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',27,'     NOPRI[NT] | PRI[NT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',28,'     NUL[L] text');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',29,'     OLD_V[ALUE] variable');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',30,'     ON|OFF');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',31,'     WRA[PPED] | WOR[D_WRAPPED] | TRU[NCATED]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COLUMN',32,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',2,' COMPUTE');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',3,' -------');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',5,' In combination with the BREAK command, calculates and prints');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',6,' summary lines using various standard computations. Also lists');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',7,' all COMPUTE definitions.');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',9,' COMP[UTE] [function [LAB[EL] text] ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',10,'   OF {expr|column|alias} ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',11,'   ON {expr|column|alias|REPORT|ROW} ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('COMPUTE',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',2,' CONNECT');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',3,' -------');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',5,' Connects a given username to the Oracle Database. When you run a');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',6,' CONNECT command, the site profile, glogin.sql, and the user profile,');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',7,' login.sql, are processed in that order. CONNECT does not reprompt');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',8,' for username or password if the initial connection does not succeed.');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',10,' CONN[ECT] [{logon|/|proxy} [AS {SYSOPER|SYSDBA|SYSASM}]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',12,' where logon has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',13,'     username[/password][@connect_identifier]');
Insert into HELP (TOPIC,SEQ,INFO) values ('CONNECT',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',2,' COPY');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',5,' Copies data from a query to a table in the same or another');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',6,' database. COPY supports CHAR, DATE, LONG, NUMBER and VARCHAR2.');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',8,' COPY {FROM database | TO database | FROM database TO database}');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',9,'            {APPEND|CREATE|INSERT|REPLACE} destination_table');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',10,'            [(column, column, column, ...)] USING query');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',12,' where database has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',13,'     username[/password]@connect_identifier');
Insert into HELP (TOPIC,SEQ,INFO) values ('COPY',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',2,' DEFINE');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',5,' Specifies a substitution variable and assigns a CHAR value to it, or');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',6,' lists the value and variable type of a single variable or all variables.');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',8,' DEF[INE] [variable] | [variable = text]');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEFINE',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',2,' DEL');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',3,' ---');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',5,' Deletes one or more lines of the SQL buffer. The buffer has no');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',6,' command history list and does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',8,' DEL [n | n m | n * | n LAST | * | * n | * LAST | LAST]');
Insert into HELP (TOPIC,SEQ,INFO) values ('DEL',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',2,' DESCRIBE');
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',3,' --------');
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',5,' Lists the column definitions for a table, view, or synonym,');
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',6,' or the specifications for a function or procedure.');
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',8,' DESC[RIBE] {[schema.]object[@connect_identifier]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',2,' DISCONNECT');
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',3,' ----------');
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',5,' Commits pending changes to the database and logs the current');
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',6,' user out of Oracle, but does not exit SQL*Plus.');
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',7,' In SQL*Plus command line, use EXIT or QUIT to log out of Oracle');
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',8,' and return control to your computer''s operating system.');
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',10,' DISC[ONNECT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',2,' EDIT');
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',5,' Invokes an operating system text editor on the contents of the');
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',6,' specified file or on the contents of the SQL buffer. The buffer');
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',7,' has no command history list and does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',9,' ED[IT] [file_name[.ext]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('EDIT',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',2,' EXECUTE');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',3,' -------');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',5,' Executes a single PL/SQL statement or runs a stored procedure.');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',7,' EXEC[UTE] statement');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXECUTE',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',2,' EXIT');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',5,' Commits or rolls back all pending changes, logs out of Oracle,');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',6,' terminates SQL*Plus and returns control to the operating system.');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',8,' {EXIT|QUIT} [SUCCESS|FAILURE|WARNING|n|variable|:BindVariable]');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',9,'   [COMMIT|ROLLBACK]');
Insert into HELP (TOPIC,SEQ,INFO) values ('EXIT',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',2,' GET');
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',3,' ---');
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',5,' Loads a SQL statement or PL/SQL block from a script into the SQL buffer.');
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',6,' The buffer has no command history list and does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',8,' GET [FILE] file_name[.ext] [LIST | NOLIST]');
Insert into HELP (TOPIC,SEQ,INFO) values ('GET',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',2,' HELP');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',5,' Accesses this command line help system. Enter HELP INDEX or ? INDEX');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',6,' for a list of topics.');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',8,' You can view SQL*Plus resources at');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',9,'     http://www.oracle.com/technology/tech/sql_plus/');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',10,' and the Oracle Database Library at');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',11,'     http://www.oracle.com/technology/documentation/');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',13,' HELP|? [topic]');
Insert into HELP (TOPIC,SEQ,INFO) values ('HELP',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',2,' HOST');
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',5,' Executes an operating system command without leaving SQL*Plus.');
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',6,' Enter HOST without command to display an operating system prompt.');
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',7,' You can then enter multiple operating system commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',9,' HO[ST] [command]');
Insert into HELP (TOPIC,SEQ,INFO) values ('HOST',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',2,'Enter Help [topic] for help.');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',3,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',4,' @             COPY         PAUSE                    SHUTDOWN');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',5,' @@            DEFINE       PRINT                    SPOOL');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',6,' /             DEL          PROMPT                   SQLPLUS');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',7,' ACCEPT        DESCRIBE     QUIT                     START');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',8,' APPEND        DISCONNECT   RECOVER                  STARTUP');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',9,' ARCHIVE LOG   EDIT         REMARK                   STORE');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',10,' ATTRIBUTE     EXECUTE      REPFOOTER                TIMING');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',11,' BREAK         EXIT         REPHEADER                TTITLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',12,' BTITLE        GET          RESERVED WORDS (SQL)     UNDEFINE');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',13,' CHANGE        HELP         RESERVED WORDS (PL/SQL)  VARIABLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',14,' CLEAR         HOST         RUN                      WHENEVER OSERROR');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',15,' COLUMN        INPUT        SAVE                     WHENEVER SQLERROR');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',16,' COMPUTE       LIST         SET                      XQUERY');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',17,' CONNECT       PASSWORD     SHOW');
Insert into HELP (TOPIC,SEQ,INFO) values ('INDEX',18,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',2,' INPUT');
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',5,' Adds one or more new lines of text after the current line in the');
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',6,' SQL buffer. The buffer has no command history list and does not');
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',7,' record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',9,' I[NPUT] [text]');
Insert into HELP (TOPIC,SEQ,INFO) values ('INPUT',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',2,' LIST');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',5,' Lists one or more lines of the most recently executed SQL command');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',6,' or PL/SQL block which is stored in the SQL buffer. Enter LIST with');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',7,' no clauses to list all lines. In SQL*Plus command-line you can also');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',8,' use ";" to list all the lines in the SQL buffer. The buffer has no');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',9,' command history list and does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',11,' L[IST] [n | n m | n  * | n LAST | * | * n | * LAST | LAST]');
Insert into HELP (TOPIC,SEQ,INFO) values ('LIST',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('MENU',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('MENU',2,' Menu');
Insert into HELP (TOPIC,SEQ,INFO) values ('MENU',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('MENU',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('MENU',5,' Enter HELP INDEX for a list of help topics.');
Insert into HELP (TOPIC,SEQ,INFO) values ('MENU',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',2,' PASSWORD');
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',3,' --------');
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',5,' Allows you to change a password without displaying it on an input device.');
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',7,' PASSW[ORD] [username]');
Insert into HELP (TOPIC,SEQ,INFO) values ('PASSWORD',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',2,' PAUSE');
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',5,' Displays the specified text then waits for the user to press RETURN.');
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',7,' PAU[SE] [text]');
Insert into HELP (TOPIC,SEQ,INFO) values ('PAUSE',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',2,' PRINT');
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',5,' Displays the current values of bind variables, or lists all bind');
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',6,' variables.');
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',8,' PRI[NT] [variable ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('PRINT',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',2,' PROMPT');
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',5,' Sends the specified message or a blank line to the user''s screen.');
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',7,' PRO[MPT] [text]');
Insert into HELP (TOPIC,SEQ,INFO) values ('PROMPT',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',2,' QUIT (Identical to EXIT)');
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',5,' Commits or rolls back all pending changes, logs out of Oracle,');
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',6,' terminates SQL*Plus and returns control to the operating system.');
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',8,' {QUIT|EXIT} [SUCCESS|FAILURE|WARNING|n|variable|:BindVariable]');
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',9,'   [COMMIT|ROLLBACK]');
Insert into HELP (TOPIC,SEQ,INFO) values ('QUIT',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',2,' RECOVER');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',3,' -------');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',5,' Performs media recovery on one or more tablespaces, one or more');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',6,' datafiles, or the entire database.');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',8,' RECOVER {general | managed} | BEGIN BACKUP | END BACKUP}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',10,' where the general clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',11,'   [AUTOMATIC] [FROM location]');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',12,'   { {full_database_recovery | partial_database_recovery |LOGFILE filename}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',13,'   [ {TEST | ALLOW integer CORRUPTION | parallel_clause}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',14,'   [TEST | ALLOW integer CORRUPTION | parallel_clause] ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',15,'   |CONTINUE [DEFAULT]|CANCEL}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',16,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',17,'   where the full_database_recovery clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',18,'     [STANDBY] DATABASE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',19,'     [{ UNTIL {CANCEL | TIME date | CHANGE integer}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',20,'      | USING BACKUP CONTROLFILE}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',21,'      [ UNTIL {CANCEL | TIME date | CHANGE integer}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',22,'      | USING BACKUP CONTROLFILE] ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',23,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',24,'   where the partial_database_recovery clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',25,'     {TABLESPACE tablespace [, tablespace] ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',26,'      | DATAFILE filename | filenumber} [,filename | filenumber] ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',27,'      | STANDBY');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',28,'       {TABLESPACE tablespace [, tablespace] ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',29,'       | DATAFILE filename | filenumber} [,filename | filenumber] ...}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',30,'     UNTIL [CONSISTENT WITH] CONTROLFILE }');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',31,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',32,' where the parallel clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',33,'   {NOPARALLEL | PARALLEL [integer]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',34,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',35,' where the managed clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',36,'   MANAGED STANDBY DATABASE recover_clause | cancel_clause | finish_clause');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',37,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',38,' where the recover_clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',39,'   {{DISCONNECT [FROM SESSION] | {TIMEOUT integer | NOTIMEOUT} }');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',40,'    |{NODELAY | DEFAULT DELAY | DELAY integer} | NEXT integer');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',41,'    |{EXPIRE integer | NO EXPIRE} | parallel_clause');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',42,'    | USING CURRENT LOGFILE | UNTIL CHANGE integer');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',43,'    | THROUGH {[THREAD integer] SEQUENCE integer');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',44,'              | ALL ARCHIVELOG  | {ALL | LAST | NEXT } SWITCHOVER} }');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',45,'      [DISCONNECT [FROM SESSION ]  | {TIMEOUT integer | NOTIMEOUT}');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',46,'       | {NODELAY | DEFAULT DELAY | DELAY integer} | NEXT integer');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',47,'       | {EXPIRE integer | NO EXPIRE} | parallel_clause');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',48,'       | USING CURRENT LOGFILE | UNTIL CHANGE integer');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',49,'       | THROUGH {[THREAD integer] SEQUENCE integer');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',50,'                 | ALL ARCHIVELOG  | {ALL | LAST | NEXT } SWITCHOVER} ]...');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',51,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',52,' where the cancel_clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',53,'   CANCEL [IMMEDIATE] [WAIT | NOWAIT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',54,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',55,' where the finish_clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',56,'   [DISCONNECT [FROM SESSION]] [parallel_clause]');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',57,'   FINISH [SKIP [STANDBY LOGFILE]] [WAIT | NOWAIT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',58,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',59,' where the parallel_clause has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',60,'   {NOPARALLEL | PARALLEL [integer] }');
Insert into HELP (TOPIC,SEQ,INFO) values ('RECOVER',61,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',2,' REMARK');
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',5,' Begins a comment in a script. SQL*Plus does not interpret the comment');
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',6,' as a command.');
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',8,' REM[ARK]');
Insert into HELP (TOPIC,SEQ,INFO) values ('REMARK',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',2,' REPFOOTER');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',3,' ---------');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',5,' Places and formats a footer at the bottom of a report, or lists the');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',6,' REPFOOTER definition.');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',8,' REPF[OOTER] [PAGE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',10,' where printspec represents one or more of the following clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',11,'     COL n          LE[FT]        BOLD');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',12,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',13,'     TAB n          R[IGHT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',2,' REPHEADER');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',3,' ---------');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',5,' Places and formats a header at the top of a report, or lists the');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',6,' REPHEADER definition.');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',8,' REPH[EADER] [PAGE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',10,' where printspec represents one or more of the following clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',11,'     COL n          LE[FT]        BOLD');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',12,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',13,'     TAB n          R[IGHT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('REPHEADER',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',2,' RESERVED WORDS (SQL)');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',3,' --------------------');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',5,' SQL Reserved Words have special meaning in SQL, and may not be used for');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',6,' identifier names unless enclosed in "quotes".');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',8,' An asterisk (*) indicates words are also ANSI Reserved Words.');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',10,' Oracle prefixes implicitly generated schema object and subobject names');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',11,' with "SYS_". To avoid name resolution conflict, Oracle discourages you');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',12,' from prefixing your schema object and subobject names with "SYS_".');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',13,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',14,' ACCESS          DEFAULT*         INTEGER*        ONLINE          START');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',15,' ADD*            DELETE*          INTERSECT*      OPTION*         SUCCESSFUL');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',16,' ALL*            DESC*            INTO*           OR*             SYNONYM');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',17,' ALTER*          DISTINCT*        IS*             ORDER*          SYSDATE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',18,' AND*            DROP*            LEVEL*          PCTFREE         TABLE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',19,' ANY*            ELSE*            LIKE*           PRIOR*          THEN*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',20,' AS*             EXCLUSIVE        LOCK            PRIVILEGES*     TO*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',21,' ASC*            EXISTS           LONG            PUBLIC*         TRIGGER');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',22,' AUDIT           FILE             MAXEXTENTS      RAW             UID');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',23,' BETWEEN*        FLOAT*           MINUS           RENAME          UNION*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',24,' BY*             FOR*             MLSLABEL        RESOURCE        UNIQUE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',25,' CHAR*           FROM*            MODE            REVOKE*         UPDATE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',26,' CHECK*          GRANT*           MODIFY          ROW             USER*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',27,' CLUSTER         GROUP*           NOAUDIT         ROWID           VALIDATE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',28,' COLUMN          HAVING*          NOCOMPRESS      ROWNUM          VALUES*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',29,' COMMENT         IDENTIFIED       NOT*            ROWS*           VARCHAR*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',30,' COMPRESS        IMMEDIATE*       NOWAIT          SELECT*         VARCHAR2');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',31,' CONNECT*        IN*              NULL*           SESSION*        VIEW*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',32,' CREATE*         INCREMENT        NUMBER          SET*            WHENEVER*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',33,' CURRENT*        INDEX            OF*             SHARE           WHERE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',34,' DATE*           INITIAL          OFFLINE         SIZE*           WITH*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',35,' DECIMAL*        INSERT*          ON*             SMALLINT*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',36,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',2,' RESERVED WORDS (PL/SQL)');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',3,' -----------------------');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',5,' PL/SQL Reserved Words have special meaning in PL/SQL, and may not be used');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',6,' for identifier names (unless enclosed in "quotes").');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',8,' An asterisk (*) indicates words are also SQL Reserved Words.');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',10,' ALL*            DESC*           JAVA            PACKAGE         SUBTYPE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',11,' ALTER*          DISTINCT*       LEVEL*          PARTITION       SUCCESSFUL*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',12,' AND*            DO              LIKE*           PCTFREE*        SUM');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',13,' ANY*            DROP*           LIMITED         PLS_INTEGER     SYNONYM*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',14,' ARRAY           ELSE*           LOCK*           POSITIVE        SYSDATE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',15,' AS*             ELSIF           LONG*           POSITIVEN       TABLE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',16,' ASC*            END             LOOP            PRAGMA          THEN*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',17,' AT              EXCEPTION       MAX             PRIOR*          TIME');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',18,' AUTHID          EXCLUSIVE*      MIN             PRIVATE         TIMESTAMP');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',19,' AVG             EXECUTE         MINUS*          PROCEDURE       TIMEZONE_ABBR');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',20,' BEGIN           EXISTS*         MINUTE          PUBLIC*         TIMEZONE_HOUR');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',21,' BETWEEN*        EXIT            MLSLABEL*       RAISE           TIMEZONE_MINUTE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',22,' BINARY_INTEGER  EXTENDS         MOD             RANGE           TIMEZONE_REGION');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',23,' BODY            EXTRACT         MODE*           RAW*            TO*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',24,' BOOLEAN         FALSE           MONTH           REAL            TRIGGER*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',25,' BULK            FETCH           NATURAL         RECORD          TRUE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',26,' BY*             FLOAT*          NATURALN        REF             TYPE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',27,' CHAR*           FOR*            NEW             RELEASE         UI');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',28,' CHAR_BASE       FORALL          NEXTVAL         RETURN          UNION*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',29,' CHECK*          FROM*           NOCOPY          REVERSE         UNIQUE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',30,' CLOSE           FUNCTION        NOT*            ROLLBACK        UPDATE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',31,' CLUSTER*        GOTO            NOWAIT*         ROW*            USE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',32,' COALESCE        GROUP*          NULL*           ROWID*          USER*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',33,' COLLECT         HAVING*         NULLIF          ROWNUM*         VALIDATE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',34,' COMMENT*        HEAP            NUMBER*         ROWTYPE         VALUES*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',35,' COMMIT          HOUR            NUMBER_BASE     SAVEPOINT       VARCHAR*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',36,' COMPRESS*       IF              OCIROWID        SECOND          VARCHAR2*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',37,' CONNECT*        IMMEDIATE*      OF*             SELECT*         VARIANCE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',38,' CONSTANT        IN*             ON*             SEPERATE        VIEW*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',39,' CREATE*         INDEX*          OPAQUE          SET*            WHEN');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',40,' CURRENT*        INDICATOR       OPEN            SHARE*          WHENEVER*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',41,' CURRVAL         INSERT*         OPERATOR        SMALLINT*       WHERE*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',42,' CURSOR          INTEGER*        OPTION*         SPACE           WHILE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',43,' DATE*           INTERFACE       OR*             SQL             WITH*');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',44,' DAY             INTERSECT*      ORDER*          SQLCODE         WORK');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',45,' DECIMAL*        INTERVAL        ORGANIZATION    SQLERRM         WRITE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',46,' DECLARE         INTO*           OTHERS          START*          YEAR');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',47,' DEFAULT*        IS*             OUT             STDDEV          ZONE');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',48,' DELETE*         ISOLATION');
Insert into HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',49,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',2,' RUN');
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',3,' ---');
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',5,' Lists and executes the most recently executed SQL command or');
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',6,' PL/SQL block which is stored in the SQL buffer. The buffer has');
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',7,' no command history list and does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',9,' R[UN]');
Insert into HELP (TOPIC,SEQ,INFO) values ('RUN',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',2,' SAVE');
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',5,' Saves the contents of the SQL buffer in a script. The');
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',6,' buffer has no command history list and does not record SQL*Plus commands.');
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',8,' SAV[E] [FILE] file_name[.ext] [CRE[ATE] | REP[LACE] | APP[END]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SAVE',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',2,' SET');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',3,' ---');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',5,' Sets a system variable to alter the SQL*Plus environment settings');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',6,' for your current session. For example, to:');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',7,'     -   set the display width for data');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',8,'     -   customize HTML formatting');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',9,'     -   enable or disable printing of column headings');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',10,'     -   set the number of lines per page');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',12,' SET system_variable value');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',13,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',14,' where system_variable and value represent one of the following clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',15,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',16,'   APPI[NFO]{OFF|ON|text}                   NULL text');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',17,'   ARRAY[SIZE] {15|n}                       NUMF[ORMAT] format');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',18,'   AUTO[COMMIT] {OFF|ON|IMM[EDIATE]|n}      NUM[WIDTH] {10|n}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',19,'   AUTOP[RINT] {OFF|ON}                     PAGES[IZE] {14|n}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',20,'   AUTORECOVERY {OFF|ON}                    PAU[SE] {OFF|ON|text}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',21,'   AUTOT[RACE] {OFF|ON|TRACE[ONLY]}         RECSEP {WR[APPED]|EA[CH]|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',22,'     [EXP[LAIN]] [STAT[ISTICS]]             RECSEPCHAR {_|c}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',23,'   BLO[CKTERMINATOR] {.|c|ON|OFF}           SERVEROUT[PUT] {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',24,'   CMDS[EP] {;|c|OFF|ON}                      [SIZE {n | UNLIMITED}]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',25,'   COLSEP {_|text}                            [FOR[MAT]  {WRA[PPED] |');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',26,'   CON[CAT] {.|c|ON|OFF}                       WOR[D_WRAPPED] |');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',27,'   COPYC[OMMIT] {0|n}                          TRU[NCATED]}]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',28,'   COPYTYPECHECK {ON|OFF}                   SHIFT[INOUT] {VIS[IBLE] |');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',29,'   DEF[INE] {&|c|ON|OFF}                      INV[ISIBLE]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',30,'   DESCRIBE [DEPTH {1|n|ALL}]               SHOW[MODE] {OFF|ON}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',31,'     [LINENUM {OFF|ON}] [INDENT {OFF|ON}]   SQLBL[ANKLINES] {OFF|ON}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',32,'   ECHO {OFF|ON}                            SQLC[ASE] {MIX[ED] |');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',33,'   EDITF[ILE] file_name[.ext]                 LO[WER] | UP[PER]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',34,'   EMB[EDDED] {OFF|ON}                      SQLCO[NTINUE] {> | text}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',35,'   ERRORL[OGGING] {ON|OFF}                  SQLN[UMBER] {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',36,'     [TABLE [schema.]tablename]             SQLPLUSCOMPAT[IBILITY] {x.y[.z]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',37,'     [TRUNCATE] [IDENTIFIER identifier]     SQLPRE[FIX] {#|c}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',38,'   ESC[APE] {\|c|OFF|ON}                    SQLP[ROMPT] {SQL>|text}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',39,'   ESCCHAR {@|?|%|$|OFF}                    SQLT[ERMINATOR] {;|c|ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',40,'   FEED[BACK] {6|n|ON|OFF}                  SUF[FIX] {SQL|text}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',41,'   FLAGGER {OFF|ENTRY|INTERMED[IATE]|FULL}  TAB {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',42,'   FLU[SH] {ON|OFF}                         TERM[OUT] {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',43,'   HEA[DING] {ON|OFF}                       TI[ME] {OFF|ON}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',44,'   HEADS[EP] {||c|ON|OFF}                   TIMI[NG] {OFF|ON}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',45,'   INSTANCE [instance_path|LOCAL]           TRIM[OUT] {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',46,'   LIN[ESIZE] {80|n}                        TRIMS[POOL] {OFF|ON}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',47,'   LOBOF[FSET] {1|n}                        UND[ERLINE] {-|c|ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',48,'   LOGSOURCE [pathname]                     VER[IFY] {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',49,'   LONG {80|n}                              WRA[P] {ON|OFF}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',50,'   LONGC[HUNKSIZE] {80|n}                   XQUERY {BASEURI text|');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',51,'   MARK[UP] HTML [OFF|ON]                     ORDERING{UNORDERED|');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',52,'     [HEAD text] [BODY text] [TABLE text]              ORDERED|DEFAULT}|');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',53,'     [ENTMAP {ON|OFF}]                        NODE{BYVALUE|BYREFERENCE|');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',54,'     [SPOOL {OFF|ON}]                              DEFAULT}|');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',55,'     [PRE[FORMAT] {OFF|ON}]                   CONTEXT text}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',56,'   NEWP[AGE] {1|n|NONE}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SET',57,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',2,' SHOW');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',3,' ----');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',5,' Shows the value of a SQL*Plus system variable, or the current');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',6,' SQL*Plus environment. SHOW SGA requires a DBA privileged login.');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',8,' SHO[W] option');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',10,' where option represents one of the following terms or clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',11,'     system_variable');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',12,'     ALL');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',13,'     BTI[TLE]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',14,'     ERR[ORS] [{FUNCTION | PROCEDURE | PACKAGE | PACKAGE BODY | TRIGGER');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',15,'        | VIEW | TYPE | TYPE BODY | DIMENSION | JAVA CLASS} [schema.]name]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',16,'     LNO');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',17,'     PARAMETERS [parameter_name]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',18,'     PNO');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',19,'     RECYC[LEBIN] [original_name]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',20,'     REL[EASE]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',21,'     REPF[OOTER]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',22,'     REPH[EADER]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',23,'     SGA');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',24,'     SPOO[L]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',25,'     SPPARAMETERS [parameter_name]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',26,'     SQLCODE');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',27,'     TT[ITLE]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',28,'     USER');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHOW',29,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',2,' SHUTDOWN');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',3,' --------');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',5,' Shuts down a currently running Oracle Database instance, optionally');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',6,' closing and dismounting a database.');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',8,' SHUTDOWN [ABORT|IMMEDIATE|NORMAL|TRANSACTIONAL [LOCAL]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',2,' SPOOL');
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',5,' Stores query results in a file, or optionally sends the file to a printer.');
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',7,' SPO[OL] [file_name[.ext] [CRE[ATE] | REP[LACE] | APP[END]] | OFF | OUT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SPOOL',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',2,' SQLPLUS');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',3,' -------');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',5,' Starts SQL*Plus from the operating system prompt.');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',7,' SQLPLUS [ [option] [logon] [start] ]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',9,' where option has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',10,'     -H[ELP]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',11,'     | -V[ERSION]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',12,'     | [[-C[OMPATIBILITY] x.y[.z]] [-F[AILOVER]]  [-L[OGON]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',13,'        [-M[ARKUP] markup_option] [-R[ESTRICT] {1|2|3}] [-S[ILENT]]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',15,' and where markup_option has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',16,'     HTML [ON|OFF] [HEAD text] [BODY text] [TABLE text]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',17,'          [ENTMAP {ON|OFF}] [SPOOL {ON|OFF}] [PRE[FORMAT] {ON|OFF}]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',18,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',19,' and where logon has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',20,'     {username[/password][@connect_identifier] | /}');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',21,'     [AS {SYSOPER|SYSDBA|SYSASM}] | /NOLOG');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',22,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',23,' and where start has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',24,'     @{url|filename[.ext]} [arg ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',25,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('START',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('START',2,' START');
Insert into HELP (TOPIC,SEQ,INFO) values ('START',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('START',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('START',5,' Runs the SQL*Plus statements in the specified script. The script can be');
Insert into HELP (TOPIC,SEQ,INFO) values ('START',6,' called from the local file system or a web server.');
Insert into HELP (TOPIC,SEQ,INFO) values ('START',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('START',8,' STA[RT] {url|file_name[.ext]} [arg ...]');
Insert into HELP (TOPIC,SEQ,INFO) values ('START',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('START',10,' where url supports HTTP and FTP protocols in the form:');
Insert into HELP (TOPIC,SEQ,INFO) values ('START',11,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('START',12,'    http://host.domain/script.sql');
Insert into HELP (TOPIC,SEQ,INFO) values ('START',13,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',2,' STARTUP');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',3,' -------');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',5,' Starts an Oracle instance with several options, including mounting,');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',6,' and opening a database.');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',8,' STARTUP options | upgrade_options');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',10,' where options has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',11,'    [FORCE] [RESTRICT] [PFILE=filename] [QUIET] [ MOUNT [dbname] |');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',12,'    [ OPEN [open_options] [dbname] ] |');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',13,'    NOMOUNT ]');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',15,' where open_options has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',16,'    READ {ONLY | WRITE [RECOVER]} | RECOVER');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',17,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',18,' and where upgrade_options has the following syntax:');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',19,'    [PFILE=filename] {UPGRADE | DOWNGRADE} [QUIET]');
Insert into HELP (TOPIC,SEQ,INFO) values ('STARTUP',20,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',2,' STORE');
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',3,' -----');
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',5,' Saves attributes of the current SQL*Plus environment in a script.');
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',6,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',7,' STORE {SET} file_name[.ext] [CRE[ATE] | REP[LACE] | APP[END]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('STORE',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',2,' TIMING');
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',5,' Records timing data for an elapsed time period, lists the current');
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',6,' timer''s name and timing data, or lists the number of active timers.');
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',8,' TIMI[NG] [START text|SHOW|STOP]');
Insert into HELP (TOPIC,SEQ,INFO) values ('TIMING',9,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',2,' TTITLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',5,' Places and formats a title at the top of each report page.');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',6,' Enter TTITLE with no clause to list its current definition.');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',8,' The old form of TTITLE is used if only a single word or');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',9,' a string in quotes follows the TTITLE command.');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',11,' TTI[TLE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',13,' where printspec represents one or more of the following clauses:');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',14,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',15,'     COL n          LE[FT]        BOLD');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',16,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',17,'     TAB n          R[IGHT]');
Insert into HELP (TOPIC,SEQ,INFO) values ('TTITLE',18,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',2,' UNDEFINE');
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',3,' --------');
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',5,' Deletes one or more substitution variables that you defined either');
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',6,' explicitly (with the DEFINE command), or implicitly (with a START');
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',7,' command argument).');
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',9,' UNDEF[INE] variable ...');
Insert into HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',2,' VARIABLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',3,' --------');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',5,' Declares a bind variable that can be referenced in PL/SQL, or');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',6,' lists the current display characteristics for a single variable');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',7,' or all variables.');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',9,'VAR[IABLE] [variable [type]]');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',11,' where type represents one of the following:');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',12,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',13,'     NUMBER         CHAR          CHAR (n [CHAR|BYTE])');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',14,'     NCHAR          NCHAR (n)     VARCHAR2 (n [CHAR|BYTE])');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',15,'     NVARCHAR2 (n)  CLOB          NCLOB');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',16,'     REFCURSOR      BINARY_FLOAT  BINARY_DOUBLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('VARIABLE',17,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',2,' WHENEVER OSERROR');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',3,' ----------------');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',5,' Performs the specified action (exits SQL*Plus by default) if an');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',6,' operating system error occurs (such as a file writing error).');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',8,' WHENEVER OSERROR {EXIT [SUCCESS|FAILURE|n|variable|:BindVariable]');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',9,'                   [COMMIT|ROLLBACK] | CONTINUE [COMMIT|ROLLBACK|NONE]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',2,' WHENEVER SQLERROR');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',3,' -----------------');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',5,' Performs the specified action (exits SQL*Plus by default) if a');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',6,' SQL command or PL/SQL block generates an error.');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',7,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',8,' WHENEVER SQLERROR {EXIT [SUCCESS|FAILURE|WARNING|n|variable|:BindVariable]');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',9,'                    [COMMIT|ROLLBACK] | CONTINUE [COMMIT|ROLLBACK|NONE]}');
Insert into HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',2,' XQUERY');
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',3,' ------');
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',4,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',5,' Performs an XQuery 1.0 query on a specified database. Attempting to use');
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',6,' XQUERY on a database earlier than Oracle Database 10g (Release 2) generates');
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',7,' an error.');
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',8,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',9,' XQUERY xquery_statement');
Insert into HELP (TOPIC,SEQ,INFO) values ('XQUERY',10,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',1,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',2,' Help is available on the following topics:');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',3,null);
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',11,'/');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',12,'@');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',13,'@@');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',14,'ACCEPT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',15,'APPEND');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',16,'ARCHIVE LOG');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',17,'ATTRIBUTE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',18,'BREAK');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',19,'BTITLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',20,'CHANGE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',21,'CLEAR');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',22,'COLUMN');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',23,'COMPUTE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',24,'CONNECT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',25,'COPY');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',26,'DEFINE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',27,'DEL');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',28,'DESCRIBE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',29,'DISCONNECT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',30,'EDIT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',31,'EXECUTE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',32,'EXIT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',33,'GET');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',34,'HELP');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',35,'HOST');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',36,'INDEX');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',37,'INPUT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',38,'LIST');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',39,'MENU');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',40,'PASSWORD');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',41,'PAUSE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',42,'PRINT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',43,'PROMPT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',44,'QUIT');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',45,'RECOVER');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',46,'REMARK');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',47,'REPFOOTER');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',48,'REPHEADER');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',49,'RESERVED WORDS (PL/SQL)');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',50,'RESERVED WORDS (SQL)');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',51,'RUN');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',52,'SAVE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',53,'SET');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',54,'SHOW');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',55,'SHUTDOWN');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',56,'SPOOL');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',57,'SQLPLUS');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',58,'START');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',59,'STARTUP');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',60,'STORE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',61,'TIMING');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',62,'TOPICS');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',63,'TTITLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',64,'UNDEFINE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',65,'VARIABLE');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',66,'WHENEVER OSERROR');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',67,'WHENEVER SQLERROR');
Insert into HELP (TOPIC,SEQ,INFO) values ('TOPICS',68,'XQUERY');

---------------------------------------------------
--   END DATA FOR TABLE HELP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_GT_USER_INCLUDE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_GT_USER_INCLUDE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_GT_USER_INCLUDE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_TEMPLATE_TARGETS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_TEMPLATE_TARGETS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_TEMPLATE_TARGETS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_SNAPGROUP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_SNAPGROUP

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_SNAPGROUP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_OPQTYPE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_OPQTYPE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_OPQTYPE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_CCOL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_CCOL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_CCOL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PATIENT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PATIENT

---------------------------------------------------
--   END DATA FOR TABLE PATIENT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DEF$_TEMP$LOB
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEF$_TEMP$LOB

---------------------------------------------------
--   END DATA FOR TABLE DEF$_TEMP$LOB
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DOCTOR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DOCTOR

---------------------------------------------------
--   END DATA FOR TABLE DOCTOR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_REFCON$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_REFCON$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_REFCON$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_SITE_OBJECTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_SITE_OBJECTS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_SITE_OBJECTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$SKIP_TRANSACTION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$SKIP_TRANSACTION

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$SKIP_TRANSACTION
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE CUSTOMER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CUSTOMER

---------------------------------------------------
--   END DATA FOR TABLE CUSTOMER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGSTDBY$HISTORY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGSTDBY$HISTORY

---------------------------------------------------
--   END DATA FOR TABLE LOGSTDBY$HISTORY
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_TEMPLATE_SITES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_TEMPLATE_SITES

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_TEMPLATE_SITES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE AQ$_QUEUES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AQ$_QUEUES
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1de4c8e',11310,'AQ$_SCHEDULER$_EVENT_QTAB_E',11289,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@174237e',11311,'SCHEDULER$_EVENT_QUEUE',11289,0,3,5,0,0,3600,'Scheduler event queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1c64fff',11342,'AQ$_SCHEDULER$_REMDB_JOBQTAB_E',11315,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@ae26a6',11343,'SCHEDULER$_REMDB_JOBQ',11315,0,3,5,0,0,0,'Scheduler remote db job queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@16b9929',11397,'AQ$_ALERT_QT_E',11376,1,2,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@11464e9',11398,'ALERT_QUE',11376,0,3,5,0,0,0,'Server Generated Alert Queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1ed34f1',11595,'AQ$_AQ$_MEM_MC_E',11572,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@2ee649',11596,'SRVQUEUE',11572,2,3,0,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@110e7a4',11607,'AQ$_AQ_EVENT_TABLE_E',11597,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@d80128',11608,'AQ_EVENT_TABLE_Q',11597,0,3,5,0,0,0,'CREATING AQ_EVENT_TABLE_Q QUEUE',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@134011e',11624,'AQ$_AQ_SRVNTFN_TABLE_E',11609,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1358d81',11625,'AQ_SRVNTFN_TABLE_Q',11609,0,3,5,0,0,0,'CREATING AQ_SRVNTFN_TABLE_Q QUEUE',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@dd13d9',11647,'AQ$_AQ_PROP_TABLE_E',11626,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@4232fb',11648,'AQ_PROP_NOTIFY',11626,0,3,5,0,0,0,'Queue for Notifying events in AQ Prop. Scheduling',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@2120c6',11816,'AQ$_KUPC$DATAPUMP_QUETAB_E',11773,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@eeb9b1',11882,'AQ$_DEF$_AQCALL_E',11874,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@e15284',11883,'DEF$_AQCALL',11874,0,3,5,0,1,0,'Deferred RPC Queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@f08091',11893,'AQ$_DEF$_AQERROR_E',11885,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@188c59d',11894,'DEF$_AQERROR',11885,0,3,5,0,1,0,'Error Queue for Deferred RPCs',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@65d06f',11932,'AQ$_SYS$SERVICE_METRICS_TAB_E',11911,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@576529',11933,'SYS$SERVICE_METRICS',11911,0,3,5,0,0,3600,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1b29a36',12442,'AQ$_WM$EVENT_QUEUE_TABLE_E',12417,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@aa628f',12443,'WM$EVENT_QUEUE',12417,0,3,5,0,0,0,'OWM Events Queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@2cd412',64441,'AQ$_MGMT_TASK_QTABLE_E',64432,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1170baf',64442,'MGMT_TASK_Q',64432,0,3,10,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@14df',64773,'AQ$_MGMT_NOTIFY_QTABLE_E',64752,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@15a6fc3',64774,'MGMT_NOTIFY_Q',64752,0,3,5,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@5f8cba',64799,'AQ$_MGMT_NOTIFY_INPUT_QTABLE_E',64788,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@11013d6',64800,'MGMT_NOTIFY_INPUT_Q',64788,0,3,5,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@865ba9',67720,'AQ$_MGMT_PAF_MSG_QTABLE_1_E',67711,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@ebe4ba',67730,'AQ$_MGMT_PAF_MSG_QTABLE_2_E',67721,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@f593b6',67731,'MGMT_PAF_REQUEST_Q',67711,0,3,5,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@b4a6bc',67732,'MGMT_PAF_RESPONSE_Q',67721,0,3,5,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@2e8a3c',67820,'AQ$_MGMT_LOADER_QTABLE_E',67797,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1757277',67821,'MGMT_LOADER_Q',67797,0,3,5,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@1adf9f1',71154,'ORDERS_QUEUE',70802,0,0,5,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@f47ba0',71155,'AQ$_ORDERS_QUEUETABLE_E',70802,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@e04c05',71158,'STREAMS_QUEUE',70817,0,0,5,0,0,0,null,null,null,null,null);
Insert into AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('[B@19edfc9',71159,'AQ$_STREAMS_QUEUE_TABLE_E',70817,1,0,0,0,0,0,'exception queue',null,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE AQ$_QUEUES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_RUNTIME_PARMS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_RUNTIME_PARMS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_RUNTIME_PARMS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_TEMP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_TEMP

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_TEMP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_IND$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_IND$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_IND$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_OBJECT_TYPES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_OBJECT_TYPES
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1017,'GENERATED DDL','[B@10d1117',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1016,'DUMMY MATERIALIZED VIEW','[B@dd01a5',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1015,'UPDATABLE MATERIALIZED VIEW LOG','[B@19714cd',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1014,'REFRESH GROUP','[B@1d6ba37',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1013,'SYNCHRONOUS MASTER REPGROUP','[B@5b9ada',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1012,'ASYNCHRONOUS MASTER REPGROUP','[B@1393bc',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1011,'TEMPORARY TABLE','[B@14847ca',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1005,'SYNCHRONOUS UPDATABLE TABLE','[B@612ed1',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1004,'ASYNCHRONOUS UPDATABLE TABLE','[B@48bd62',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1003,'READ ONLY TABLE','[B@189aba6',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1002,'SITEOWNER','[B@1643eda',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1001,'USER','[B@5a673c',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-5,'DATABASE LINK','[B@12f965f',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1,'MATERIALIZED VIEW','[B@1395d89',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (1,'INDEX','[B@12bde69',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (2,'TABLE','[B@116dedf',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (4,'VIEW','[B@820829',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (5,'SYNONYM','[B@e5c122',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (6,'SEQUENCE','[B@1eacfda',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (7,'PROCEDURE','[B@f410f8',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (8,'FUNCTION','[B@1860b4b',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (9,'PACKAGE','[B@14f9cff',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (10,'PACKAGE BODY','[B@1cc4bdf',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (12,'TRIGGER','[B@1892dc8',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (13,'TYPE','[B@11cb49e',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (14,'TYPE BODY','[B@195fdf3',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (32,'INDEX TYPE','[B@5372e0',null);
Insert into REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (33,'OPERATOR','[B@9ad258',null);

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_OBJECT_TYPES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_LOG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_LOG

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_LOG
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MVIEW$_ADV_FJG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MVIEW$_ADV_FJG

---------------------------------------------------
--   END DATA FOR TABLE MVIEW$_ADV_FJG
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_CDEF$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_CDEF$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_CDEF$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGINS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGINS
Insert into LOGINS (USERTPE,UN,PWD) values ('admin','alex','abe');
Insert into LOGINS (USERTPE,UN,PWD) values ('Librarian','lib','lib');

---------------------------------------------------
--   END DATA FOR TABLE LOGINS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_CONFLICT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_CONFLICT

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_CONFLICT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REPOBJECT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REPOBJECT

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REPOBJECT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_TEMPLATE_OBJECTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_TEMPLATE_OBJECTS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_TEMPLATE_OBJECTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_OBJ$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_OBJ$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_OBJ$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_GENERATED
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_GENERATED

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_GENERATED
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_RESTART_CKPT_TXINFO$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_RESTART_CKPT_TXINFO$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_RESTART_CKPT_TXINFO$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_GLOBAL$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_GLOBAL$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_GLOBAL$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_ATTRIBUTE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_ATTRIBUTE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_ATTRIBUTE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_EXCEPTIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_EXCEPTIONS

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_EXCEPTIONS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_INDPART$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_INDPART$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_INDPART$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_NTAB$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_NTAB$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_NTAB$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_SITES_NEW
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_SITES_NEW

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_SITES_NEW
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNR_TYPE$
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNR_TYPE$

---------------------------------------------------
--   END DATA FOR TABLE LOGMNR_TYPE$
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_RESOL_STATS_CONTROL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_RESOL_STATS_CONTROL

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_RESOL_STATS_CONTROL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_GROUPED_COLUMN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_GROUPED_COLUMN

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_GROUPED_COLUMN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOGMNRP_CTAS_PART_MAP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOGMNRP_CTAS_PART_MAP

---------------------------------------------------
--   END DATA FOR TABLE LOGMNRP_CTAS_PART_MAP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE AQ$_INTERNET_AGENT_PRIVS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AQ$_INTERNET_AGENT_PRIVS
Insert into AQ$_INTERNET_AGENT_PRIVS (AGENT_NAME,DB_USERNAME) values ('ADOBEEREG_COM_3938_ALEX','DBSNMP');
Insert into AQ$_INTERNET_AGENT_PRIVS (AGENT_NAME,DB_USERNAME) values ('SCHEDULER$_EVENT_AGENT','SYS');
Insert into AQ$_INTERNET_AGENT_PRIVS (AGENT_NAME,DB_USERNAME) values ('SCHEDULER$_REMDB_AGENT','SYS');
Insert into AQ$_INTERNET_AGENT_PRIVS (AGENT_NAME,DB_USERNAME) values ('SERVER_ALERT','SYS');

---------------------------------------------------
--   END DATA FOR TABLE AQ$_INTERNET_AGENT_PRIVS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE STAFF_TABLE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into STAFF_TABLE
Insert into STAFF_TABLE (FNAME,LNAME,MID,SALARY,POSITION) values ('Alemu','Kelemu','2','3245','Graduate_assistant_I');
Insert into STAFF_TABLE (FNAME,LNAME,MID,SALARY,POSITION) values ('Belay','Enyew','1','7000','lecturer');
Insert into STAFF_TABLE (FNAME,LNAME,MID,SALARY,POSITION) values ('Firew','Lake','3','5770',' Ass Lecturer');
Insert into STAFF_TABLE (FNAME,LNAME,MID,SALARY,POSITION) values ('Kelemu','Ayinetu','4','3000','G.assistance');
Insert into STAFF_TABLE (FNAME,LNAME,MID,SALARY,POSITION) values ('Kebede','Gesese','5','11000','prof');

---------------------------------------------------
--   END DATA FOR TABLE STAFF_TABLE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPCAT$_REPCAT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPCAT$_REPCAT

---------------------------------------------------
--   END DATA FOR TABLE REPCAT$_REPCAT
---------------------------------------------------
