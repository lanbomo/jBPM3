drop table JBPM_ACTION
drop table JBPM_BYTEARRAY
drop table JBPM_BYTEBLOCK
drop table JBPM_COMMENT
drop table JBPM_DECISIONCONDITIONS
drop table JBPM_DELEGATION
drop table JBPM_EVENT
drop table JBPM_EXCEPTIONHANDLER
drop table JBPM_JOB
drop table JBPM_LOG
drop table JBPM_MODULEDEFINITION
drop table JBPM_MODULEINSTANCE
drop table JBPM_NODE
drop table JBPM_POOLEDACTOR
drop table JBPM_PROCESSDEFINITION
drop table JBPM_PROCESSINSTANCE
drop table JBPM_RUNTIMEACTION
drop table JBPM_SWIMLANE
drop table JBPM_SWIMLANEINSTANCE
drop table JBPM_TASK
drop table JBPM_TASKACTORPOOL
drop table JBPM_TASKCONTROLLER
drop table JBPM_TASKINSTANCE
drop table JBPM_TOKEN
drop table JBPM_TOKENVARIABLEMAP
drop table JBPM_TRANSITION
drop table JBPM_VARIABLEACCESS
drop table JBPM_VARIABLEINSTANCE
drop sequence hibernate_sequence restrict
create table JBPM_ACTION (ID_ bigint not null, class char(1) not null, NAME_ varchar(255) with null, ISPROPAGATIONALLOWED_ tinyint with null, ACTIONEXPRESSION_ varchar(255) with null, ISASYNC_ tinyint with null, REFERENCEDACTION_ bigint with null, ACTIONDELEGATION_ bigint with null, EVENT_ bigint with null, PROCESSDEFINITION_ bigint with null, EXPRESSION_ clob with null, TIMERNAME_ varchar(255) with null, DUEDATE_ varchar(255) with null, REPEAT_ varchar(255) with null, TRANSITIONNAME_ varchar(255) with null, TIMERACTION_ bigint with null, EVENTINDEX_ integer with null, EXCEPTIONHANDLER_ bigint with null, EXCEPTIONHANDLERINDEX_ integer with null, primary key (ID_))
create table JBPM_BYTEARRAY (ID_ bigint not null, NAME_ varchar(255) with null, FILEDEFINITION_ bigint with null, primary key (ID_))
create table JBPM_BYTEBLOCK (PROCESSFILE_ bigint not null, BYTES_ varbyte(1024) with null, INDEX_ integer not null, primary key (PROCESSFILE_, INDEX_))
create table JBPM_COMMENT (ID_ bigint not null, VERSION_ integer not null, ACTORID_ varchar(255) with null, TIME_ timestamp with time zone with null, MESSAGE_ clob with null, TOKEN_ bigint with null, TASKINSTANCE_ bigint with null, TOKENINDEX_ integer with null, TASKINSTANCEINDEX_ integer with null, primary key (ID_))
create table JBPM_DECISIONCONDITIONS (DECISION_ bigint not null, TRANSITIONNAME_ varchar(255) with null, EXPRESSION_ varchar(255) with null, INDEX_ integer not null, primary key (DECISION_, INDEX_))
create table JBPM_DELEGATION (ID_ bigint not null, CLASSNAME_ clob with null, CONFIGURATION_ clob with null, CONFIGTYPE_ varchar(255) with null, PROCESSDEFINITION_ bigint with null, primary key (ID_))
create table JBPM_EVENT (ID_ bigint not null, EVENTTYPE_ varchar(255) with null, TYPE_ char(1) with null, GRAPHELEMENT_ bigint with null, PROCESSDEFINITION_ bigint with null, NODE_ bigint with null, TRANSITION_ bigint with null, TASK_ bigint with null, primary key (ID_))
create table JBPM_EXCEPTIONHANDLER (ID_ bigint not null, EXCEPTIONCLASSNAME_ clob with null, TYPE_ char(1) with null, GRAPHELEMENT_ bigint with null, PROCESSDEFINITION_ bigint with null, GRAPHELEMENTINDEX_ integer with null, NODE_ bigint with null, TRANSITION_ bigint with null, TASK_ bigint with null, primary key (ID_))
create table JBPM_JOB (ID_ bigint not null, CLASS_ char(1) not null, VERSION_ integer not null, DUEDATE_ timestamp with time zone with null, PROCESSINSTANCE_ bigint with null, TOKEN_ bigint with null, TASKINSTANCE_ bigint with null, ISSUSPENDED_ tinyint with null, ISEXCLUSIVE_ tinyint with null, LOCKOWNER_ varchar(255) with null, LOCKTIME_ timestamp with time zone with null, EXCEPTION_ clob with null, RETRIES_ integer with null, NAME_ varchar(255) with null, REPEAT_ varchar(255) with null, TRANSITIONNAME_ varchar(255) with null, ACTION_ bigint with null, GRAPHELEMENTTYPE_ varchar(255) with null, GRAPHELEMENT_ bigint with null, NODE_ bigint with null, primary key (ID_))
create table JBPM_LOG (ID_ bigint not null, CLASS_ char(1) not null, INDEX_ integer with null, DATE_ timestamp with time zone with null, TOKEN_ bigint with null, PARENT_ bigint with null, MESSAGE_ clob with null, EXCEPTION_ clob with null, ACTION_ bigint with null, NODE_ bigint with null, ENTER_ timestamp with time zone with null, LEAVE_ timestamp with time zone with null, DURATION_ bigint with null, NEWLONGVALUE_ bigint with null, TRANSITION_ bigint with null, CHILD_ bigint with null, SOURCENODE_ bigint with null, DESTINATIONNODE_ bigint with null, VARIABLEINSTANCE_ bigint with null, OLDBYTEARRAY_ bigint with null, NEWBYTEARRAY_ bigint with null, OLDDATEVALUE_ timestamp with time zone with null, NEWDATEVALUE_ timestamp with time zone with null, OLDDOUBLEVALUE_ float with null, NEWDOUBLEVALUE_ float with null, OLDLONGIDCLASS_ varchar(255) with null, OLDLONGIDVALUE_ bigint with null, NEWLONGIDCLASS_ varchar(255) with null, NEWLONGIDVALUE_ bigint with null, OLDSTRINGIDCLASS_ varchar(255) with null, OLDSTRINGIDVALUE_ varchar(255) with null, NEWSTRINGIDCLASS_ varchar(255) with null, NEWSTRINGIDVALUE_ varchar(255) with null, OLDLONGVALUE_ bigint with null, OLDSTRINGVALUE_ clob with null, NEWSTRINGVALUE_ clob with null, TASKINSTANCE_ bigint with null, TASKACTORID_ varchar(255) with null, TASKOLDACTORID_ varchar(255) with null, SWIMLANEINSTANCE_ bigint with null, primary key (ID_))
create table JBPM_MODULEDEFINITION (ID_ bigint not null, CLASS_ char(1) not null, NAME_ varchar(255) with null, PROCESSDEFINITION_ bigint with null, STARTTASK_ bigint with null, primary key (ID_))
create table JBPM_MODULEINSTANCE (ID_ bigint not null, CLASS_ char(1) not null, VERSION_ integer not null, PROCESSINSTANCE_ bigint with null, TASKMGMTDEFINITION_ bigint with null, NAME_ varchar(255) with null, primary key (ID_))
create table JBPM_NODE (ID_ bigint not null, CLASS_ char(1) not null, NAME_ varchar(255) with null, DESCRIPTION_ clob with null, PROCESSDEFINITION_ bigint with null, ISASYNC_ tinyint with null, ISASYNCEXCL_ tinyint with null, ACTION_ bigint with null, SUPERSTATE_ bigint with null, SUBPROCNAME_ varchar(255) with null, SUBPROCESSDEFINITION_ bigint with null, DECISIONEXPRESSION_ varchar(255) with null, DECISIONDELEGATION bigint with null, SCRIPT_ bigint with null, PARENTLOCKMODE_ varchar(255) with null, SIGNAL_ integer with null, CREATETASKS_ tinyint with null, ENDTASKS_ tinyint with null, NODECOLLECTIONINDEX_ integer with null, primary key (ID_))
create table JBPM_POOLEDACTOR (ID_ bigint not null, VERSION_ integer not null, ACTORID_ varchar(255) with null, SWIMLANEINSTANCE_ bigint with null, primary key (ID_))
create table JBPM_PROCESSDEFINITION (ID_ bigint not null, CLASS_ char(1) not null, NAME_ varchar(255) with null, DESCRIPTION_ clob with null, VERSION_ integer with null, ISTERMINATIONIMPLICIT_ tinyint with null, STARTSTATE_ bigint with null, primary key (ID_))
create table JBPM_PROCESSINSTANCE (ID_ bigint not null, VERSION_ integer not null, KEY_ varchar(255) with null, START_ timestamp with time zone with null, END_ timestamp with time zone with null, ISSUSPENDED_ tinyint with null, PROCESSDEFINITION_ bigint with null, ROOTTOKEN_ bigint with null, SUPERPROCESSTOKEN_ bigint with null, primary key (ID_))
create table JBPM_RUNTIMEACTION (ID_ bigint not null, VERSION_ integer not null, EVENTTYPE_ varchar(255) with null, TYPE_ char(1) with null, GRAPHELEMENT_ bigint with null, PROCESSINSTANCE_ bigint with null, ACTION_ bigint with null, PROCESSINSTANCEINDEX_ integer with null, primary key (ID_))
create table JBPM_SWIMLANE (ID_ bigint not null, NAME_ varchar(255) with null, ACTORIDEXPRESSION_ varchar(255) with null, POOLEDACTORSEXPRESSION_ varchar(255) with null, ASSIGNMENTDELEGATION_ bigint with null, TASKMGMTDEFINITION_ bigint with null, primary key (ID_))
create table JBPM_SWIMLANEINSTANCE (ID_ bigint not null, VERSION_ integer not null, NAME_ varchar(255) with null, ACTORID_ varchar(255) with null, SWIMLANE_ bigint with null, TASKMGMTINSTANCE_ bigint with null, primary key (ID_))
create table JBPM_TASK (ID_ bigint not null, NAME_ varchar(255) with null, DESCRIPTION_ clob with null, PROCESSDEFINITION_ bigint with null, ISBLOCKING_ tinyint with null, ISSIGNALLING_ tinyint with null, CONDITION_ varchar(255) with null, DUEDATE_ varchar(255) with null, PRIORITY_ integer with null, ACTORIDEXPRESSION_ varchar(255) with null, POOLEDACTORSEXPRESSION_ varchar(255) with null, TASKMGMTDEFINITION_ bigint with null, TASKNODE_ bigint with null, STARTSTATE_ bigint with null, ASSIGNMENTDELEGATION_ bigint with null, SWIMLANE_ bigint with null, TASKCONTROLLER_ bigint with null, primary key (ID_))
create table JBPM_TASKACTORPOOL (TASKINSTANCE_ bigint not null, POOLEDACTOR_ bigint not null, primary key (TASKINSTANCE_, POOLEDACTOR_))
create table JBPM_TASKCONTROLLER (ID_ bigint not null, TASKCONTROLLERDELEGATION_ bigint with null, primary key (ID_))
create table JBPM_TASKINSTANCE (ID_ bigint not null, CLASS_ char(1) not null, VERSION_ integer not null, NAME_ varchar(255) with null, DESCRIPTION_ clob with null, ACTORID_ varchar(255) with null, CREATE_ timestamp with time zone with null, START_ timestamp with time zone with null, END_ timestamp with time zone with null, DUEDATE_ timestamp with time zone with null, PRIORITY_ integer with null, ISCANCELLED_ tinyint with null, ISSUSPENDED_ tinyint with null, ISOPEN_ tinyint with null, ISSIGNALLING_ tinyint with null, ISBLOCKING_ tinyint with null, TASK_ bigint with null, TOKEN_ bigint with null, PROCINST_ bigint with null, SWIMLANINSTANCE_ bigint with null, TASKMGMTINSTANCE_ bigint with null, primary key (ID_))
create table JBPM_TOKEN (ID_ bigint not null, VERSION_ integer not null, NAME_ varchar(255) with null, START_ timestamp with time zone with null, END_ timestamp with time zone with null, NODEENTER_ timestamp with time zone with null, NEXTLOGINDEX_ integer with null, ISABLETOREACTIVATEPARENT_ tinyint with null, ISTERMINATIONIMPLICIT_ tinyint with null, ISSUSPENDED_ tinyint with null, LOCK_ varchar(255) with null, NODE_ bigint with null, PROCESSINSTANCE_ bigint with null, PARENT_ bigint with null, SUBPROCESSINSTANCE_ bigint with null, primary key (ID_))
create table JBPM_TOKENVARIABLEMAP (ID_ bigint not null, VERSION_ integer not null, TOKEN_ bigint with null, CONTEXTINSTANCE_ bigint with null, primary key (ID_))
create table JBPM_TRANSITION (ID_ bigint not null, NAME_ varchar(255) with null, DESCRIPTION_ clob with null, PROCESSDEFINITION_ bigint with null, FROM_ bigint with null, TO_ bigint with null, CONDITION_ varchar(255) with null, FROMINDEX_ integer with null, primary key (ID_))
create table JBPM_VARIABLEACCESS (ID_ bigint not null, VARIABLENAME_ varchar(255) with null, ACCESS_ varchar(255) with null, MAPPEDNAME_ varchar(255) with null, SCRIPT_ bigint with null, PROCESSSTATE_ bigint with null, TASKCONTROLLER_ bigint with null, INDEX_ integer with null, primary key (ID_))
create table JBPM_VARIABLEINSTANCE (ID_ bigint not null, CLASS_ char(1) not null, VERSION_ integer not null, NAME_ varchar(255) with null, CONVERTER_ char(1) with null, TOKEN_ bigint with null, TOKENVARIABLEMAP_ bigint with null, PROCESSINSTANCE_ bigint with null, BYTEARRAYVALUE_ bigint with null, DATEVALUE_ timestamp with time zone with null, DOUBLEVALUE_ float with null, LONGIDCLASS_ varchar(255) with null, LONGVALUE_ bigint with null, STRINGIDCLASS_ varchar(255) with null, STRINGVALUE_ varchar(255) with null, TASKINSTANCE_ bigint with null, primary key (ID_))
create index IDX_ACTION_ACTNDL on JBPM_ACTION (ACTIONDELEGATION_)
create index IDX_ACTION_PROCDF on JBPM_ACTION (PROCESSDEFINITION_)
create index IDX_ACTION_EVENT on JBPM_ACTION (EVENT_)
alter table JBPM_ACTION add constraint FK_ACTION_REFACT foreign key (REFERENCEDACTION_) references JBPM_ACTION
alter table JBPM_ACTION add constraint FK_CRTETIMERACT_TA foreign key (TIMERACTION_) references JBPM_ACTION
alter table JBPM_ACTION add constraint FK_ACTION_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_ACTION add constraint FK_ACTION_EVENT foreign key (EVENT_) references JBPM_EVENT
alter table JBPM_ACTION add constraint FK_ACTION_ACTNDEL foreign key (ACTIONDELEGATION_) references JBPM_DELEGATION
alter table JBPM_ACTION add constraint FK_ACTION_EXPTHDL foreign key (EXCEPTIONHANDLER_) references JBPM_EXCEPTIONHANDLER
alter table JBPM_BYTEARRAY add constraint FK_BYTEARR_FILDEF foreign key (FILEDEFINITION_) references JBPM_MODULEDEFINITION
alter table JBPM_BYTEBLOCK add constraint FK_BYTEBLOCK_FILE foreign key (PROCESSFILE_) references JBPM_BYTEARRAY
create index IDX_COMMENT_TSK on JBPM_COMMENT (TASKINSTANCE_)
create index IDX_COMMENT_TOKEN on JBPM_COMMENT (TOKEN_)
alter table JBPM_COMMENT add constraint FK_COMMENT_TOKEN foreign key (TOKEN_) references JBPM_TOKEN
alter table JBPM_COMMENT add constraint FK_COMMENT_TSK foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE
alter table JBPM_DECISIONCONDITIONS add constraint FK_DECCOND_DEC foreign key (DECISION_) references JBPM_NODE
create index IDX_DELEG_PRCD on JBPM_DELEGATION (PROCESSDEFINITION_)
alter table JBPM_DELEGATION add constraint FK_DELEGATION_PRCD foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_EVENT add constraint FK_EVENT_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_EVENT add constraint FK_EVENT_TRANS foreign key (TRANSITION_) references JBPM_TRANSITION
alter table JBPM_EVENT add constraint FK_EVENT_NODE foreign key (NODE_) references JBPM_NODE
alter table JBPM_EVENT add constraint FK_EVENT_TASK foreign key (TASK_) references JBPM_TASK
create index IDX_JOB_TSKINST on JBPM_JOB (TASKINSTANCE_)
create index IDX_JOB_TOKEN on JBPM_JOB (TOKEN_)
create index IDX_JOB_PRINST on JBPM_JOB (PROCESSINSTANCE_)
alter table JBPM_JOB add constraint FK_JOB_PRINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE
alter table JBPM_JOB add constraint FK_JOB_ACTION foreign key (ACTION_) references JBPM_ACTION
alter table JBPM_JOB add constraint FK_JOB_TOKEN foreign key (TOKEN_) references JBPM_TOKEN
alter table JBPM_JOB add constraint FK_JOB_NODE foreign key (NODE_) references JBPM_NODE
alter table JBPM_JOB add constraint FK_JOB_TSKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE
alter table JBPM_LOG add constraint FK_LOG_SOURCENODE foreign key (SOURCENODE_) references JBPM_NODE
alter table JBPM_LOG add constraint FK_LOG_DESTNODE foreign key (DESTINATIONNODE_) references JBPM_NODE
alter table JBPM_LOG add constraint FK_LOG_TOKEN foreign key (TOKEN_) references JBPM_TOKEN
alter table JBPM_LOG add constraint FK_LOG_TRANSITION foreign key (TRANSITION_) references JBPM_TRANSITION
alter table JBPM_LOG add constraint FK_LOG_TASKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE
alter table JBPM_LOG add constraint FK_LOG_CHILDTOKEN foreign key (CHILD_) references JBPM_TOKEN
alter table JBPM_LOG add constraint FK_LOG_OLDBYTES foreign key (OLDBYTEARRAY_) references JBPM_BYTEARRAY
alter table JBPM_LOG add constraint FK_LOG_SWIMINST foreign key (SWIMLANEINSTANCE_) references JBPM_SWIMLANEINSTANCE
alter table JBPM_LOG add constraint FK_LOG_NEWBYTES foreign key (NEWBYTEARRAY_) references JBPM_BYTEARRAY
alter table JBPM_LOG add constraint FK_LOG_ACTION foreign key (ACTION_) references JBPM_ACTION
alter table JBPM_LOG add constraint FK_LOG_VARINST foreign key (VARIABLEINSTANCE_) references JBPM_VARIABLEINSTANCE
alter table JBPM_LOG add constraint FK_LOG_NODE foreign key (NODE_) references JBPM_NODE
alter table JBPM_LOG add constraint FK_LOG_PARENT foreign key (PARENT_) references JBPM_LOG
create index IDX_MODDEF_PROCDF on JBPM_MODULEDEFINITION (PROCESSDEFINITION_)
alter table JBPM_MODULEDEFINITION add constraint FK_MODDEF_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_MODULEDEFINITION add constraint FK_TSKDEF_START foreign key (STARTTASK_) references JBPM_TASK
create index IDX_MODINST_PRINST on JBPM_MODULEINSTANCE (PROCESSINSTANCE_)
alter table JBPM_MODULEINSTANCE add constraint FK_MODINST_PRCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE
alter table JBPM_MODULEINSTANCE add constraint FK_TASKMGTINST_TMD foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION
create index IDX_PSTATE_SBPRCDEF on JBPM_NODE (SUBPROCESSDEFINITION_)
create index IDX_NODE_PROCDEF on JBPM_NODE (PROCESSDEFINITION_)
create index IDX_NODE_ACTION on JBPM_NODE (ACTION_)
create index IDX_NODE_SUPRSTATE on JBPM_NODE (SUPERSTATE_)
alter table JBPM_NODE add constraint FK_DECISION_DELEG foreign key (DECISIONDELEGATION) references JBPM_DELEGATION
alter table JBPM_NODE add constraint FK_NODE_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_NODE add constraint FK_NODE_ACTION foreign key (ACTION_) references JBPM_ACTION
alter table JBPM_NODE add constraint FK_PROCST_SBPRCDEF foreign key (SUBPROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_NODE add constraint FK_NODE_SCRIPT foreign key (SCRIPT_) references JBPM_ACTION
alter table JBPM_NODE add constraint FK_NODE_SUPERSTATE foreign key (SUPERSTATE_) references JBPM_NODE
create index IDX_TSKINST_SWLANE on JBPM_POOLEDACTOR (SWIMLANEINSTANCE_)
create index IDX_PLDACTR_ACTID on JBPM_POOLEDACTOR (ACTORID_)
alter table JBPM_POOLEDACTOR add constraint FK_POOLEDACTOR_SLI foreign key (SWIMLANEINSTANCE_) references JBPM_SWIMLANEINSTANCE
create index IDX_PROCDEF_STRTST on JBPM_PROCESSDEFINITION (STARTSTATE_)
alter table JBPM_PROCESSDEFINITION add constraint FK_PROCDEF_STRTSTA foreign key (STARTSTATE_) references JBPM_NODE
create index IDX_PROCIN_SPROCTK on JBPM_PROCESSINSTANCE (SUPERPROCESSTOKEN_)
create index IDX_PROCIN_ROOTTK on JBPM_PROCESSINSTANCE (ROOTTOKEN_)
create index IDX_PROCIN_PROCDEF on JBPM_PROCESSINSTANCE (PROCESSDEFINITION_)
create index IDX_PROCIN_KEY on JBPM_PROCESSINSTANCE (KEY_)
alter table JBPM_PROCESSINSTANCE add constraint FK_PROCIN_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_PROCESSINSTANCE add constraint FK_PROCIN_ROOTTKN foreign key (ROOTTOKEN_) references JBPM_TOKEN
alter table JBPM_PROCESSINSTANCE add constraint FK_PROCIN_SPROCTKN foreign key (SUPERPROCESSTOKEN_) references JBPM_TOKEN
create index IDX_RTACTN_ACTION on JBPM_RUNTIMEACTION (ACTION_)
create index IDX_RTACTN_PRCINST on JBPM_RUNTIMEACTION (PROCESSINSTANCE_)
alter table JBPM_RUNTIMEACTION add constraint FK_RTACTN_PROCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE
alter table JBPM_RUNTIMEACTION add constraint FK_RTACTN_ACTION foreign key (ACTION_) references JBPM_ACTION
alter table JBPM_SWIMLANE add constraint FK_SWL_ASSDEL foreign key (ASSIGNMENTDELEGATION_) references JBPM_DELEGATION
alter table JBPM_SWIMLANE add constraint FK_SWL_TSKMGMTDEF foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION
create index IDX_SWIMLINST_SL on JBPM_SWIMLANEINSTANCE (SWIMLANE_)
alter table JBPM_SWIMLANEINSTANCE add constraint FK_SWIMLANEINST_TM foreign key (TASKMGMTINSTANCE_) references JBPM_MODULEINSTANCE
alter table JBPM_SWIMLANEINSTANCE add constraint FK_SWIMLANEINST_SL foreign key (SWIMLANE_) references JBPM_SWIMLANE
create index IDX_TASK_PROCDEF on JBPM_TASK (PROCESSDEFINITION_)
create index IDX_TASK_TSKNODE on JBPM_TASK (TASKNODE_)
create index IDX_TASK_TASKMGTDF on JBPM_TASK (TASKMGMTDEFINITION_)
alter table JBPM_TASK add constraint FK_TASK_STARTST foreign key (STARTSTATE_) references JBPM_NODE
alter table JBPM_TASK add constraint FK_TASK_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_TASK add constraint FK_TASK_ASSDEL foreign key (ASSIGNMENTDELEGATION_) references JBPM_DELEGATION
alter table JBPM_TASK add constraint FK_TASK_SWIMLANE foreign key (SWIMLANE_) references JBPM_SWIMLANE
alter table JBPM_TASK add constraint FK_TASK_TASKNODE foreign key (TASKNODE_) references JBPM_NODE
alter table JBPM_TASK add constraint FK_TASK_TASKMGTDEF foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION
alter table JBPM_TASK add constraint FK_TSK_TSKCTRL foreign key (TASKCONTROLLER_) references JBPM_TASKCONTROLLER
alter table JBPM_TASKACTORPOOL add constraint FK_TASKACTPL_TSKI foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE
alter table JBPM_TASKACTORPOOL add constraint FK_TSKACTPOL_PLACT foreign key (POOLEDACTOR_) references JBPM_POOLEDACTOR
alter table JBPM_TASKCONTROLLER add constraint FK_TSKCTRL_DELEG foreign key (TASKCONTROLLERDELEGATION_) references JBPM_DELEGATION
create index IDX_TSKINST_TMINST on JBPM_TASKINSTANCE (TASKMGMTINSTANCE_)
create index IDX_TSKINST_SLINST on JBPM_TASKINSTANCE (SWIMLANINSTANCE_)
create index IDX_TASKINST_TOKN on JBPM_TASKINSTANCE (TOKEN_)
create index IDX_TASK_ACTORID on JBPM_TASKINSTANCE (ACTORID_)
create index IDX_TASKINST_TSK on JBPM_TASKINSTANCE (TASK_, PROCINST_)
alter table JBPM_TASKINSTANCE add constraint FK_TSKINS_PRCINS foreign key (PROCINST_) references JBPM_PROCESSINSTANCE
alter table JBPM_TASKINSTANCE add constraint FK_TASKINST_TMINST foreign key (TASKMGMTINSTANCE_) references JBPM_MODULEINSTANCE
alter table JBPM_TASKINSTANCE add constraint FK_TASKINST_TOKEN foreign key (TOKEN_) references JBPM_TOKEN
alter table JBPM_TASKINSTANCE add constraint FK_TASKINST_SLINST foreign key (SWIMLANINSTANCE_) references JBPM_SWIMLANEINSTANCE
alter table JBPM_TASKINSTANCE add constraint FK_TASKINST_TASK foreign key (TASK_) references JBPM_TASK
create index IDX_TOKEN_PARENT on JBPM_TOKEN (PARENT_)
create index IDX_TOKEN_PROCIN on JBPM_TOKEN (PROCESSINSTANCE_)
create index IDX_TOKEN_NODE on JBPM_TOKEN (NODE_)
create index IDX_TOKEN_SUBPI on JBPM_TOKEN (SUBPROCESSINSTANCE_)
alter table JBPM_TOKEN add constraint FK_TOKEN_SUBPI foreign key (SUBPROCESSINSTANCE_) references JBPM_PROCESSINSTANCE
alter table JBPM_TOKEN add constraint FK_TOKEN_PROCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE
alter table JBPM_TOKEN add constraint FK_TOKEN_NODE foreign key (NODE_) references JBPM_NODE
alter table JBPM_TOKEN add constraint FK_TOKEN_PARENT foreign key (PARENT_) references JBPM_TOKEN
create index IDX_TKVVARMP_TOKEN on JBPM_TOKENVARIABLEMAP (TOKEN_)
create index IDX_TKVARMAP_CTXT on JBPM_TOKENVARIABLEMAP (CONTEXTINSTANCE_)
alter table JBPM_TOKENVARIABLEMAP add constraint FK_TKVARMAP_TOKEN foreign key (TOKEN_) references JBPM_TOKEN
alter table JBPM_TOKENVARIABLEMAP add constraint FK_TKVARMAP_CTXT foreign key (CONTEXTINSTANCE_) references JBPM_MODULEINSTANCE
create index IDX_TRANS_PROCDEF on JBPM_TRANSITION (PROCESSDEFINITION_)
create index IDX_TRANSIT_FROM on JBPM_TRANSITION (FROM_)
create index IDX_TRANSIT_TO on JBPM_TRANSITION (TO_)
alter table JBPM_TRANSITION add constraint FK_TRANSITION_FROM foreign key (FROM_) references JBPM_NODE
alter table JBPM_TRANSITION add constraint FK_TRANS_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION
alter table JBPM_TRANSITION add constraint FK_TRANSITION_TO foreign key (TO_) references JBPM_NODE
alter table JBPM_VARIABLEACCESS add constraint FK_VARACC_PROCST foreign key (PROCESSSTATE_) references JBPM_NODE
alter table JBPM_VARIABLEACCESS add constraint FK_VARACC_SCRIPT foreign key (SCRIPT_) references JBPM_ACTION
alter table JBPM_VARIABLEACCESS add constraint FK_VARACC_TSKCTRL foreign key (TASKCONTROLLER_) references JBPM_TASKCONTROLLER
create index IDX_VARINST_TK on JBPM_VARIABLEINSTANCE (TOKEN_)
create index IDX_VARINST_TKVARMP on JBPM_VARIABLEINSTANCE (TOKENVARIABLEMAP_)
create index IDX_VARINST_PRCINS on JBPM_VARIABLEINSTANCE (PROCESSINSTANCE_)
alter table JBPM_VARIABLEINSTANCE add constraint FK_VARINST_PRCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE
alter table JBPM_VARIABLEINSTANCE add constraint FK_VARINST_TKVARMP foreign key (TOKENVARIABLEMAP_) references JBPM_TOKENVARIABLEMAP
alter table JBPM_VARIABLEINSTANCE add constraint FK_VARINST_TK foreign key (TOKEN_) references JBPM_TOKEN
alter table JBPM_VARIABLEINSTANCE add constraint FK_BYTEINST_ARRAY foreign key (BYTEARRAYVALUE_) references JBPM_BYTEARRAY
alter table JBPM_VARIABLEINSTANCE add constraint FK_VAR_TSKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE
create sequence hibernate_sequence
