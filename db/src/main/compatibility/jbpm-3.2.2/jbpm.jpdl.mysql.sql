create table JBPM_ACTION (ID_ bigint not null auto_increment, class char(1) not null, NAME_ varchar(255), ISPROPAGATIONALLOWED_ bit, ACTIONEXPRESSION_ varchar(255), ISASYNC_ bit, REFERENCEDACTION_ bigint, ACTIONDELEGATION_ bigint, EVENT_ bigint, PROCESSDEFINITION_ bigint, EXPRESSION_ text, TIMERNAME_ varchar(255), DUEDATE_ varchar(255), REPEAT_ varchar(255), TRANSITIONNAME_ varchar(255), TIMERACTION_ bigint, EVENTINDEX_ integer, EXCEPTIONHANDLER_ bigint, EXCEPTIONHANDLERINDEX_ integer, primary key (ID_)) type=InnoDB;
create table JBPM_BYTEARRAY (ID_ bigint not null auto_increment, NAME_ varchar(255), FILEDEFINITION_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_BYTEBLOCK (PROCESSFILE_ bigint not null, BYTES_ blob, INDEX_ integer not null, primary key (PROCESSFILE_, INDEX_)) type=InnoDB;
create table JBPM_COMMENT (ID_ bigint not null auto_increment, VERSION_ integer not null, ACTORID_ varchar(255), TIME_ datetime, MESSAGE_ text, TOKEN_ bigint, TASKINSTANCE_ bigint, TOKENINDEX_ integer, TASKINSTANCEINDEX_ integer, primary key (ID_)) type=InnoDB;
create table JBPM_DECISIONCONDITIONS (DECISION_ bigint not null, TRANSITIONNAME_ varchar(255), EXPRESSION_ varchar(255), INDEX_ integer not null, primary key (DECISION_, INDEX_)) type=InnoDB;
create table JBPM_DELEGATION (ID_ bigint not null auto_increment, CLASSNAME_ text, CONFIGURATION_ text, CONFIGTYPE_ varchar(255), PROCESSDEFINITION_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_EVENT (ID_ bigint not null auto_increment, EVENTTYPE_ varchar(255), TYPE_ char(1), GRAPHELEMENT_ bigint, PROCESSDEFINITION_ bigint, NODE_ bigint, TRANSITION_ bigint, TASK_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_EXCEPTIONHANDLER (ID_ bigint not null auto_increment, EXCEPTIONCLASSNAME_ text, TYPE_ char(1), GRAPHELEMENT_ bigint, PROCESSDEFINITION_ bigint, GRAPHELEMENTINDEX_ integer, NODE_ bigint, TRANSITION_ bigint, TASK_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_ID_GROUP (ID_ bigint not null auto_increment, CLASS_ char(1) not null, NAME_ varchar(255), TYPE_ varchar(255), PARENT_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_ID_MEMBERSHIP (ID_ bigint not null auto_increment, CLASS_ char(1) not null, NAME_ varchar(255), ROLE_ varchar(255), USER_ bigint, GROUP_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_ID_PERMISSIONS (ENTITY_ bigint not null, CLASS_ varchar(255), NAME_ varchar(255), ACTION_ varchar(255)) type=InnoDB;
create table JBPM_ID_USER (ID_ bigint not null auto_increment, CLASS_ char(1) not null, NAME_ varchar(255), EMAIL_ varchar(255), PASSWORD_ varchar(255), primary key (ID_)) type=InnoDB;
create table JBPM_JOB (ID_ bigint not null auto_increment, CLASS_ char(1) not null, VERSION_ integer not null, DUEDATE_ datetime, PROCESSINSTANCE_ bigint, TOKEN_ bigint, TASKINSTANCE_ bigint, ISSUSPENDED_ bit, ISEXCLUSIVE_ bit, LOCKOWNER_ varchar(255), LOCKTIME_ datetime, EXCEPTION_ text, RETRIES_ integer, NAME_ varchar(255), REPEAT_ varchar(255), TRANSITIONNAME_ varchar(255), ACTION_ bigint, GRAPHELEMENTTYPE_ varchar(255), GRAPHELEMENT_ bigint, NODE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_LOG (ID_ bigint not null auto_increment, CLASS_ char(1) not null, INDEX_ integer, DATE_ datetime, TOKEN_ bigint, PARENT_ bigint, MESSAGE_ text, EXCEPTION_ text, ACTION_ bigint, NODE_ bigint, ENTER_ datetime, LEAVE_ datetime, DURATION_ bigint, NEWLONGVALUE_ bigint, TRANSITION_ bigint, CHILD_ bigint, SOURCENODE_ bigint, DESTINATIONNODE_ bigint, VARIABLEINSTANCE_ bigint, OLDBYTEARRAY_ bigint, NEWBYTEARRAY_ bigint, OLDDATEVALUE_ datetime, NEWDATEVALUE_ datetime, OLDDOUBLEVALUE_ double precision, NEWDOUBLEVALUE_ double precision, OLDLONGIDCLASS_ varchar(255), OLDLONGIDVALUE_ bigint, NEWLONGIDCLASS_ varchar(255), NEWLONGIDVALUE_ bigint, OLDSTRINGIDCLASS_ varchar(255), OLDSTRINGIDVALUE_ varchar(255), NEWSTRINGIDCLASS_ varchar(255), NEWSTRINGIDVALUE_ varchar(255), OLDLONGVALUE_ bigint, OLDSTRINGVALUE_ text, NEWSTRINGVALUE_ text, TASKINSTANCE_ bigint, TASKACTORID_ varchar(255), TASKOLDACTORID_ varchar(255), SWIMLANEINSTANCE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_MODULEDEFINITION (ID_ bigint not null auto_increment, CLASS_ char(1) not null, NAME_ text, PROCESSDEFINITION_ bigint, STARTTASK_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_MODULEINSTANCE (ID_ bigint not null auto_increment, CLASS_ char(1) not null, VERSION_ integer not null, PROCESSINSTANCE_ bigint, TASKMGMTDEFINITION_ bigint, NAME_ varchar(255), primary key (ID_)) type=InnoDB;
create table JBPM_NODE (ID_ bigint not null auto_increment, CLASS_ char(1) not null, NAME_ varchar(255), DESCRIPTION_ text, PROCESSDEFINITION_ bigint, ISASYNC_ bit, ISASYNCEXCL_ bit, ACTION_ bigint, SUPERSTATE_ bigint, SUBPROCNAME_ varchar(255), SUBPROCESSDEFINITION_ bigint, DECISIONEXPRESSION_ varchar(255), DECISIONDELEGATION bigint, SCRIPT_ bigint, SIGNAL_ integer, CREATETASKS_ bit, ENDTASKS_ bit, NODECOLLECTIONINDEX_ integer, primary key (ID_)) type=InnoDB;
create table JBPM_POOLEDACTOR (ID_ bigint not null auto_increment, VERSION_ integer not null, ACTORID_ varchar(255), SWIMLANEINSTANCE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_PROCESSDEFINITION (ID_ bigint not null auto_increment, CLASS_ char(1) not null, NAME_ varchar(255), DESCRIPTION_ text, VERSION_ integer, ISTERMINATIONIMPLICIT_ bit, STARTSTATE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_PROCESSINSTANCE (ID_ bigint not null auto_increment, VERSION_ integer not null, KEY_ varchar(255), START_ datetime, END_ datetime, ISSUSPENDED_ bit, PROCESSDEFINITION_ bigint, ROOTTOKEN_ bigint, SUPERPROCESSTOKEN_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_RUNTIMEACTION (ID_ bigint not null auto_increment, VERSION_ integer not null, EVENTTYPE_ varchar(255), TYPE_ char(1), GRAPHELEMENT_ bigint, PROCESSINSTANCE_ bigint, ACTION_ bigint, PROCESSINSTANCEINDEX_ integer, primary key (ID_)) type=InnoDB;
create table JBPM_SWIMLANE (ID_ bigint not null auto_increment, NAME_ varchar(255), ACTORIDEXPRESSION_ varchar(255), POOLEDACTORSEXPRESSION_ varchar(255), ASSIGNMENTDELEGATION_ bigint, TASKMGMTDEFINITION_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_SWIMLANEINSTANCE (ID_ bigint not null auto_increment, VERSION_ integer not null, NAME_ varchar(255), ACTORID_ varchar(255), SWIMLANE_ bigint, TASKMGMTINSTANCE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_TASK (ID_ bigint not null auto_increment, NAME_ varchar(255), DESCRIPTION_ text, PROCESSDEFINITION_ bigint, ISBLOCKING_ bit, ISSIGNALLING_ bit, CONDITION_ varchar(255), DUEDATE_ varchar(255), PRIORITY_ integer, ACTORIDEXPRESSION_ varchar(255), POOLEDACTORSEXPRESSION_ varchar(255), TASKMGMTDEFINITION_ bigint, TASKNODE_ bigint, STARTSTATE_ bigint, ASSIGNMENTDELEGATION_ bigint, SWIMLANE_ bigint, TASKCONTROLLER_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_TASKACTORPOOL (TASKINSTANCE_ bigint not null, POOLEDACTOR_ bigint not null, primary key (TASKINSTANCE_, POOLEDACTOR_)) type=InnoDB;
create table JBPM_TASKCONTROLLER (ID_ bigint not null auto_increment, TASKCONTROLLERDELEGATION_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_TASKINSTANCE (ID_ bigint not null auto_increment, CLASS_ char(1) not null, VERSION_ integer not null, NAME_ varchar(255), DESCRIPTION_ text, ACTORID_ varchar(255), CREATE_ datetime, START_ datetime, END_ datetime, DUEDATE_ datetime, PRIORITY_ integer, ISCANCELLED_ bit, ISSUSPENDED_ bit, ISOPEN_ bit, ISSIGNALLING_ bit, ISBLOCKING_ bit, TASK_ bigint, TOKEN_ bigint, PROCINST_ bigint, SWIMLANINSTANCE_ bigint, TASKMGMTINSTANCE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_TOKEN (ID_ bigint not null auto_increment, VERSION_ integer not null, NAME_ varchar(255), START_ datetime, END_ datetime, NODEENTER_ datetime, NEXTLOGINDEX_ integer, ISABLETOREACTIVATEPARENT_ bit, ISTERMINATIONIMPLICIT_ bit, ISSUSPENDED_ bit, LOCK_ varchar(255), NODE_ bigint, PROCESSINSTANCE_ bigint, PARENT_ bigint, SUBPROCESSINSTANCE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_TOKENVARIABLEMAP (ID_ bigint not null auto_increment, VERSION_ integer not null, TOKEN_ bigint, CONTEXTINSTANCE_ bigint, primary key (ID_)) type=InnoDB;
create table JBPM_TRANSITION (ID_ bigint not null auto_increment, NAME_ varchar(255), DESCRIPTION_ text, PROCESSDEFINITION_ bigint, FROM_ bigint, TO_ bigint, CONDITION_ varchar(255), FROMINDEX_ integer, primary key (ID_)) type=InnoDB;
create table JBPM_VARIABLEACCESS (ID_ bigint not null auto_increment, VARIABLENAME_ varchar(255), ACCESS_ varchar(255), MAPPEDNAME_ varchar(255), SCRIPT_ bigint, PROCESSSTATE_ bigint, TASKCONTROLLER_ bigint, INDEX_ integer, primary key (ID_)) type=InnoDB;
create table JBPM_VARIABLEINSTANCE (ID_ bigint not null auto_increment, CLASS_ char(1) not null, VERSION_ integer not null, NAME_ varchar(255), CONVERTER_ char(1), TOKEN_ bigint, TOKENVARIABLEMAP_ bigint, PROCESSINSTANCE_ bigint, BYTEARRAYVALUE_ bigint, DATEVALUE_ datetime, DOUBLEVALUE_ double precision, LONGIDCLASS_ varchar(255), LONGVALUE_ bigint, STRINGIDCLASS_ varchar(255), STRINGVALUE_ text, TASKINSTANCE_ bigint, primary key (ID_)) type=InnoDB;
create index IDX_ACTION_ACTNDL on JBPM_ACTION (ACTIONDELEGATION_);
create index IDX_ACTION_PROCDF on JBPM_ACTION (PROCESSDEFINITION_);
create index IDX_ACTION_EVENT on JBPM_ACTION (EVENT_);
alter table JBPM_ACTION add index FK_ACTION_REFACT (REFERENCEDACTION_), add constraint FK_ACTION_REFACT foreign key (REFERENCEDACTION_) references JBPM_ACTION (ID_);
alter table JBPM_ACTION add index FK_CRTETIMERACT_TA (TIMERACTION_), add constraint FK_CRTETIMERACT_TA foreign key (TIMERACTION_) references JBPM_ACTION (ID_);
alter table JBPM_ACTION add index FK_ACTION_PROCDEF (PROCESSDEFINITION_), add constraint FK_ACTION_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_ACTION add index FK_ACTION_EVENT (EVENT_), add constraint FK_ACTION_EVENT foreign key (EVENT_) references JBPM_EVENT (ID_);
alter table JBPM_ACTION add index FK_ACTION_ACTNDEL (ACTIONDELEGATION_), add constraint FK_ACTION_ACTNDEL foreign key (ACTIONDELEGATION_) references JBPM_DELEGATION (ID_);
alter table JBPM_ACTION add index FK_ACTION_EXPTHDL (EXCEPTIONHANDLER_), add constraint FK_ACTION_EXPTHDL foreign key (EXCEPTIONHANDLER_) references JBPM_EXCEPTIONHANDLER (ID_);
alter table JBPM_BYTEARRAY add index FK_BYTEARR_FILDEF (FILEDEFINITION_), add constraint FK_BYTEARR_FILDEF foreign key (FILEDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
alter table JBPM_BYTEBLOCK add index FK_BYTEBLOCK_FILE (PROCESSFILE_), add constraint FK_BYTEBLOCK_FILE foreign key (PROCESSFILE_) references JBPM_BYTEARRAY (ID_);
create index IDX_COMMENT_TSK on JBPM_COMMENT (TASKINSTANCE_);
create index IDX_COMMENT_TOKEN on JBPM_COMMENT (TOKEN_);
alter table JBPM_COMMENT add index FK_COMMENT_TOKEN (TOKEN_), add constraint FK_COMMENT_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_COMMENT add index FK_COMMENT_TSK (TASKINSTANCE_), add constraint FK_COMMENT_TSK foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_DECISIONCONDITIONS add index FK_DECCOND_DEC (DECISION_), add constraint FK_DECCOND_DEC foreign key (DECISION_) references JBPM_NODE (ID_);
create index IDX_DELEG_PRCD on JBPM_DELEGATION (PROCESSDEFINITION_);
alter table JBPM_DELEGATION add index FK_DELEGATION_PRCD (PROCESSDEFINITION_), add constraint FK_DELEGATION_PRCD foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_EVENT add index FK_EVENT_PROCDEF (PROCESSDEFINITION_), add constraint FK_EVENT_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_EVENT add index FK_EVENT_TRANS (TRANSITION_), add constraint FK_EVENT_TRANS foreign key (TRANSITION_) references JBPM_TRANSITION (ID_);
alter table JBPM_EVENT add index FK_EVENT_NODE (NODE_), add constraint FK_EVENT_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_EVENT add index FK_EVENT_TASK (TASK_), add constraint FK_EVENT_TASK foreign key (TASK_) references JBPM_TASK (ID_);
alter table JBPM_ID_GROUP add index FK_ID_GRP_PARENT (PARENT_), add constraint FK_ID_GRP_PARENT foreign key (PARENT_) references JBPM_ID_GROUP (ID_);
alter table JBPM_ID_MEMBERSHIP add index FK_ID_MEMSHIP_GRP (GROUP_), add constraint FK_ID_MEMSHIP_GRP foreign key (GROUP_) references JBPM_ID_GROUP (ID_);
alter table JBPM_ID_MEMBERSHIP add index FK_ID_MEMSHIP_USR (USER_), add constraint FK_ID_MEMSHIP_USR foreign key (USER_) references JBPM_ID_USER (ID_);
create index IDX_JOB_TSKINST on JBPM_JOB (TASKINSTANCE_);
create index IDX_JOB_TOKEN on JBPM_JOB (TOKEN_);
create index IDX_JOB_PRINST on JBPM_JOB (PROCESSINSTANCE_);
alter table JBPM_JOB add index FK_JOB_PRINST (PROCESSINSTANCE_), add constraint FK_JOB_PRINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_JOB add index FK_JOB_ACTION (ACTION_), add constraint FK_JOB_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_JOB add index FK_JOB_TOKEN (TOKEN_), add constraint FK_JOB_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_JOB add index FK_JOB_NODE (NODE_), add constraint FK_JOB_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_JOB add index FK_JOB_TSKINST (TASKINSTANCE_), add constraint FK_JOB_TSKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_LOG add index FK_LOG_SOURCENODE (SOURCENODE_), add constraint FK_LOG_SOURCENODE foreign key (SOURCENODE_) references JBPM_NODE (ID_);
alter table JBPM_LOG add index FK_LOG_DESTNODE (DESTINATIONNODE_), add constraint FK_LOG_DESTNODE foreign key (DESTINATIONNODE_) references JBPM_NODE (ID_);
alter table JBPM_LOG add index FK_LOG_TOKEN (TOKEN_), add constraint FK_LOG_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_LOG add index FK_LOG_TRANSITION (TRANSITION_), add constraint FK_LOG_TRANSITION foreign key (TRANSITION_) references JBPM_TRANSITION (ID_);
alter table JBPM_LOG add index FK_LOG_TASKINST (TASKINSTANCE_), add constraint FK_LOG_TASKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_LOG add index FK_LOG_CHILDTOKEN (CHILD_), add constraint FK_LOG_CHILDTOKEN foreign key (CHILD_) references JBPM_TOKEN (ID_);
alter table JBPM_LOG add index FK_LOG_OLDBYTES (OLDBYTEARRAY_), add constraint FK_LOG_OLDBYTES foreign key (OLDBYTEARRAY_) references JBPM_BYTEARRAY (ID_);
alter table JBPM_LOG add index FK_LOG_SWIMINST (SWIMLANEINSTANCE_), add constraint FK_LOG_SWIMINST foreign key (SWIMLANEINSTANCE_) references JBPM_SWIMLANEINSTANCE (ID_);
alter table JBPM_LOG add index FK_LOG_NEWBYTES (NEWBYTEARRAY_), add constraint FK_LOG_NEWBYTES foreign key (NEWBYTEARRAY_) references JBPM_BYTEARRAY (ID_);
alter table JBPM_LOG add index FK_LOG_ACTION (ACTION_), add constraint FK_LOG_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_LOG add index FK_LOG_VARINST (VARIABLEINSTANCE_), add constraint FK_LOG_VARINST foreign key (VARIABLEINSTANCE_) references JBPM_VARIABLEINSTANCE (ID_);
alter table JBPM_LOG add index FK_LOG_NODE (NODE_), add constraint FK_LOG_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_LOG add index FK_LOG_PARENT (PARENT_), add constraint FK_LOG_PARENT foreign key (PARENT_) references JBPM_LOG (ID_);
create index IDX_MODDEF_PROCDF on JBPM_MODULEDEFINITION (PROCESSDEFINITION_);
alter table JBPM_MODULEDEFINITION add index FK_MODDEF_PROCDEF (PROCESSDEFINITION_), add constraint FK_MODDEF_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_MODULEDEFINITION add index FK_TSKDEF_START (STARTTASK_), add constraint FK_TSKDEF_START foreign key (STARTTASK_) references JBPM_TASK (ID_);
create index IDX_MODINST_PRINST on JBPM_MODULEINSTANCE (PROCESSINSTANCE_);
alter table JBPM_MODULEINSTANCE add index FK_MODINST_PRCINST (PROCESSINSTANCE_), add constraint FK_MODINST_PRCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_MODULEINSTANCE add index FK_TASKMGTINST_TMD (TASKMGMTDEFINITION_), add constraint FK_TASKMGTINST_TMD foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
create index IDX_PSTATE_SBPRCDEF on JBPM_NODE (SUBPROCESSDEFINITION_);
create index IDX_NODE_PROCDEF on JBPM_NODE (PROCESSDEFINITION_);
create index IDX_NODE_ACTION on JBPM_NODE (ACTION_);
create index IDX_NODE_SUPRSTATE on JBPM_NODE (SUPERSTATE_);
alter table JBPM_NODE add index FK_DECISION_DELEG (DECISIONDELEGATION), add constraint FK_DECISION_DELEG foreign key (DECISIONDELEGATION) references JBPM_DELEGATION (ID_);
alter table JBPM_NODE add index FK_NODE_PROCDEF (PROCESSDEFINITION_), add constraint FK_NODE_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_NODE add index FK_NODE_ACTION (ACTION_), add constraint FK_NODE_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_NODE add index FK_PROCST_SBPRCDEF (SUBPROCESSDEFINITION_), add constraint FK_PROCST_SBPRCDEF foreign key (SUBPROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_NODE add index FK_NODE_SCRIPT (SCRIPT_), add constraint FK_NODE_SCRIPT foreign key (SCRIPT_) references JBPM_ACTION (ID_);
alter table JBPM_NODE add index FK_NODE_SUPERSTATE (SUPERSTATE_), add constraint FK_NODE_SUPERSTATE foreign key (SUPERSTATE_) references JBPM_NODE (ID_);
create index IDX_TSKINST_SWLANE on JBPM_POOLEDACTOR (SWIMLANEINSTANCE_);
create index IDX_PLDACTR_ACTID on JBPM_POOLEDACTOR (ACTORID_);
alter table JBPM_POOLEDACTOR add index FK_POOLEDACTOR_SLI (SWIMLANEINSTANCE_), add constraint FK_POOLEDACTOR_SLI foreign key (SWIMLANEINSTANCE_) references JBPM_SWIMLANEINSTANCE (ID_);
create index IDX_PROCDEF_STRTST on JBPM_PROCESSDEFINITION (STARTSTATE_);
alter table JBPM_PROCESSDEFINITION add index FK_PROCDEF_STRTSTA (STARTSTATE_), add constraint FK_PROCDEF_STRTSTA foreign key (STARTSTATE_) references JBPM_NODE (ID_);
create index IDX_PROCIN_SPROCTK on JBPM_PROCESSINSTANCE (SUPERPROCESSTOKEN_);
create index IDX_PROCIN_ROOTTK on JBPM_PROCESSINSTANCE (ROOTTOKEN_);
create index IDX_PROCIN_PROCDEF on JBPM_PROCESSINSTANCE (PROCESSDEFINITION_);
create index IDX_PROCIN_KEY on JBPM_PROCESSINSTANCE (KEY_);
alter table JBPM_PROCESSINSTANCE add index FK_PROCIN_PROCDEF (PROCESSDEFINITION_), add constraint FK_PROCIN_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_PROCESSINSTANCE add index FK_PROCIN_ROOTTKN (ROOTTOKEN_), add constraint FK_PROCIN_ROOTTKN foreign key (ROOTTOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_PROCESSINSTANCE add index FK_PROCIN_SPROCTKN (SUPERPROCESSTOKEN_), add constraint FK_PROCIN_SPROCTKN foreign key (SUPERPROCESSTOKEN_) references JBPM_TOKEN (ID_);
create index IDX_RTACTN_ACTION on JBPM_RUNTIMEACTION (ACTION_);
create index IDX_RTACTN_PRCINST on JBPM_RUNTIMEACTION (PROCESSINSTANCE_);
alter table JBPM_RUNTIMEACTION add index FK_RTACTN_PROCINST (PROCESSINSTANCE_), add constraint FK_RTACTN_PROCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_RUNTIMEACTION add index FK_RTACTN_ACTION (ACTION_), add constraint FK_RTACTN_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_SWIMLANE add index FK_SWL_ASSDEL (ASSIGNMENTDELEGATION_), add constraint FK_SWL_ASSDEL foreign key (ASSIGNMENTDELEGATION_) references JBPM_DELEGATION (ID_);
alter table JBPM_SWIMLANE add index FK_SWL_TSKMGMTDEF (TASKMGMTDEFINITION_), add constraint FK_SWL_TSKMGMTDEF foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
create index IDX_SWIMLINST_SL on JBPM_SWIMLANEINSTANCE (SWIMLANE_);
alter table JBPM_SWIMLANEINSTANCE add index FK_SWIMLANEINST_TM (TASKMGMTINSTANCE_), add constraint FK_SWIMLANEINST_TM foreign key (TASKMGMTINSTANCE_) references JBPM_MODULEINSTANCE (ID_);
alter table JBPM_SWIMLANEINSTANCE add index FK_SWIMLANEINST_SL (SWIMLANE_), add constraint FK_SWIMLANEINST_SL foreign key (SWIMLANE_) references JBPM_SWIMLANE (ID_);
create index IDX_TASK_PROCDEF on JBPM_TASK (PROCESSDEFINITION_);
create index IDX_TASK_TSKNODE on JBPM_TASK (TASKNODE_);
create index IDX_TASK_TASKMGTDF on JBPM_TASK (TASKMGMTDEFINITION_);
alter table JBPM_TASK add index FK_TASK_STARTST (STARTSTATE_), add constraint FK_TASK_STARTST foreign key (STARTSTATE_) references JBPM_NODE (ID_);
alter table JBPM_TASK add index FK_TASK_PROCDEF (PROCESSDEFINITION_), add constraint FK_TASK_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_TASK add index FK_TASK_ASSDEL (ASSIGNMENTDELEGATION_), add constraint FK_TASK_ASSDEL foreign key (ASSIGNMENTDELEGATION_) references JBPM_DELEGATION (ID_);
alter table JBPM_TASK add index FK_TASK_SWIMLANE (SWIMLANE_), add constraint FK_TASK_SWIMLANE foreign key (SWIMLANE_) references JBPM_SWIMLANE (ID_);
alter table JBPM_TASK add index FK_TASK_TASKNODE (TASKNODE_), add constraint FK_TASK_TASKNODE foreign key (TASKNODE_) references JBPM_NODE (ID_);
alter table JBPM_TASK add index FK_TASK_TASKMGTDEF (TASKMGMTDEFINITION_), add constraint FK_TASK_TASKMGTDEF foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
alter table JBPM_TASK add index FK_TSK_TSKCTRL (TASKCONTROLLER_), add constraint FK_TSK_TSKCTRL foreign key (TASKCONTROLLER_) references JBPM_TASKCONTROLLER (ID_);
alter table JBPM_TASKACTORPOOL add index FK_TASKACTPL_TSKI (TASKINSTANCE_), add constraint FK_TASKACTPL_TSKI foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_TASKACTORPOOL add index FK_TSKACTPOL_PLACT (POOLEDACTOR_), add constraint FK_TSKACTPOL_PLACT foreign key (POOLEDACTOR_) references JBPM_POOLEDACTOR (ID_);
alter table JBPM_TASKCONTROLLER add index FK_TSKCTRL_DELEG (TASKCONTROLLERDELEGATION_), add constraint FK_TSKCTRL_DELEG foreign key (TASKCONTROLLERDELEGATION_) references JBPM_DELEGATION (ID_);
create index IDX_TSKINST_TMINST on JBPM_TASKINSTANCE (TASKMGMTINSTANCE_);
create index IDX_TSKINST_SLINST on JBPM_TASKINSTANCE (SWIMLANINSTANCE_);
create index IDX_TASKINST_TOKN on JBPM_TASKINSTANCE (TOKEN_);
create index IDX_TASK_ACTORID on JBPM_TASKINSTANCE (ACTORID_);
create index IDX_TASKINST_TSK on JBPM_TASKINSTANCE (TASK_, PROCINST_);
alter table JBPM_TASKINSTANCE add index FK_TSKINS_PRCINS (PROCINST_), add constraint FK_TSKINS_PRCINS foreign key (PROCINST_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_TMINST (TASKMGMTINSTANCE_), add constraint FK_TASKINST_TMINST foreign key (TASKMGMTINSTANCE_) references JBPM_MODULEINSTANCE (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_TOKEN (TOKEN_), add constraint FK_TASKINST_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_SLINST (SWIMLANINSTANCE_), add constraint FK_TASKINST_SLINST foreign key (SWIMLANINSTANCE_) references JBPM_SWIMLANEINSTANCE (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_TASK (TASK_), add constraint FK_TASKINST_TASK foreign key (TASK_) references JBPM_TASK (ID_);
create index IDX_TOKEN_PARENT on JBPM_TOKEN (PARENT_);
create index IDX_TOKEN_PROCIN on JBPM_TOKEN (PROCESSINSTANCE_);
create index IDX_TOKEN_NODE on JBPM_TOKEN (NODE_);
create index IDX_TOKEN_SUBPI on JBPM_TOKEN (SUBPROCESSINSTANCE_);
alter table JBPM_TOKEN add index FK_TOKEN_SUBPI (SUBPROCESSINSTANCE_), add constraint FK_TOKEN_SUBPI foreign key (SUBPROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_TOKEN add index FK_TOKEN_PROCINST (PROCESSINSTANCE_), add constraint FK_TOKEN_PROCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_TOKEN add index FK_TOKEN_NODE (NODE_), add constraint FK_TOKEN_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_TOKEN add index FK_TOKEN_PARENT (PARENT_), add constraint FK_TOKEN_PARENT foreign key (PARENT_) references JBPM_TOKEN (ID_);
create index IDX_TKVVARMP_TOKEN on JBPM_TOKENVARIABLEMAP (TOKEN_);
create index IDX_TKVARMAP_CTXT on JBPM_TOKENVARIABLEMAP (CONTEXTINSTANCE_);
alter table JBPM_TOKENVARIABLEMAP add index FK_TKVARMAP_TOKEN (TOKEN_), add constraint FK_TKVARMAP_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_TOKENVARIABLEMAP add index FK_TKVARMAP_CTXT (CONTEXTINSTANCE_), add constraint FK_TKVARMAP_CTXT foreign key (CONTEXTINSTANCE_) references JBPM_MODULEINSTANCE (ID_);
create index IDX_TRANS_PROCDEF on JBPM_TRANSITION (PROCESSDEFINITION_);
create index IDX_TRANSIT_FROM on JBPM_TRANSITION (FROM_);
create index IDX_TRANSIT_TO on JBPM_TRANSITION (TO_);
alter table JBPM_TRANSITION add index FK_TRANSITION_FROM (FROM_), add constraint FK_TRANSITION_FROM foreign key (FROM_) references JBPM_NODE (ID_);
alter table JBPM_TRANSITION add index FK_TRANS_PROCDEF (PROCESSDEFINITION_), add constraint FK_TRANS_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_TRANSITION add index FK_TRANSITION_TO (TO_), add constraint FK_TRANSITION_TO foreign key (TO_) references JBPM_NODE (ID_);
alter table JBPM_VARIABLEACCESS add index FK_VARACC_PROCST (PROCESSSTATE_), add constraint FK_VARACC_PROCST foreign key (PROCESSSTATE_) references JBPM_NODE (ID_);
alter table JBPM_VARIABLEACCESS add index FK_VARACC_SCRIPT (SCRIPT_), add constraint FK_VARACC_SCRIPT foreign key (SCRIPT_) references JBPM_ACTION (ID_);
alter table JBPM_VARIABLEACCESS add index FK_VARACC_TSKCTRL (TASKCONTROLLER_), add constraint FK_VARACC_TSKCTRL foreign key (TASKCONTROLLER_) references JBPM_TASKCONTROLLER (ID_);
create index IDX_VARINST_TK on JBPM_VARIABLEINSTANCE (TOKEN_);
create index IDX_VARINST_TKVARMP on JBPM_VARIABLEINSTANCE (TOKENVARIABLEMAP_);
create index IDX_VARINST_PRCINS on JBPM_VARIABLEINSTANCE (PROCESSINSTANCE_);
alter table JBPM_VARIABLEINSTANCE add index FK_VARINST_PRCINST (PROCESSINSTANCE_), add constraint FK_VARINST_PRCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_VARINST_TKVARMP (TOKENVARIABLEMAP_), add constraint FK_VARINST_TKVARMP foreign key (TOKENVARIABLEMAP_) references JBPM_TOKENVARIABLEMAP (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_VARINST_TK (TOKEN_), add constraint FK_VARINST_TK foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_BYTEINST_ARRAY (BYTEARRAYVALUE_), add constraint FK_BYTEINST_ARRAY foreign key (BYTEARRAYVALUE_) references JBPM_BYTEARRAY (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_VAR_TSKINST (TASKINSTANCE_), add constraint FK_VAR_TSKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
