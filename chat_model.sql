

/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     8/7/2021 1:47:25 PM                          */
/*==============================================================*/

CREATE DATABASE punjabi_chat
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


/*==============================================================*/
/* Table: ACTION                                                */
/*==============================================================*/
create table Actions(
   ACTION_ID            INT4                 not null,
   ACTION_TYPE          CHAR(256)            null,
   constraint PK_ACTION primary key (ACTION_ID)
);

/*==============================================================*/
/* Index: ACTION_PK                                             */
/*==============================================================*/
create unique index ACTION_PK on ACTION (
ACTION_ID
);

/*==============================================================*/
/* Table: "Groups"                                               */
/*==============================================================*/
create table "Groups" (
   GROUP_ID             INT4                 not null,
   GROUP_NAME           VARCHAR(1)           null,
   constraint PK_GROUP primary key (GROUP_ID)
);

/*==============================================================*/
/* Index: GROUP_PK                                              */
/*==============================================================*/
create unique index GROUP_PK on "GROUP" (
GROUP_ID
);

/*==============================================================*/
/* Table: GROUP_MESSAGE                                         */
/*==============================================================*/
create table GROUP_MESSAGE (
   GROUP_ID             INT4                 not null,
   MESSAGE_ID           INT4                 not null,
   constraint PK_GROUP_MESSAGE primary key (GROUP_ID, MESSAGE_ID)
);

/*==============================================================*/
/* Index: GROUP_MESSAGE_PK                                      */
/*==============================================================*/
create unique index GROUP_MESSAGE_PK on GROUP_MESSAGE (
GROUP_ID,
MESSAGE_ID
);

/*==============================================================*/
/* Index: GROUP_MESSAGE_FK                                      */
/*==============================================================*/
create  index GROUP_MESSAGE_FK on GROUP_MESSAGE (
GROUP_ID
);

/*==============================================================*/
/* Index: GROUP_MESSAGE2_FK                                     */
/*==============================================================*/
create  index GROUP_MESSAGE2_FK on GROUP_MESSAGE (
MESSAGE_ID
);

/*==============================================================*/
/* Table: MESSAGE                                               */
/*==============================================================*/
create table MESSAGE (
   MESSAGE_ID           INT4                 not null,
   Users_ID              INT4                 not null,
   CONTENT              VARCHAR(1)           null,
   DATE_CREATED         DATE                 null,
   constraint PK_MESSAGE primary key (MESSAGE_ID)
);

/*==============================================================*/
/* Index: MESSAGE_PK                                            */
/*==============================================================*/
create unique index MESSAGE_PK on MESSAGE (
MESSAGE_ID
);

/*==============================================================*/
/* Index: Users_MESSAGE_FK                                       */
/*==============================================================*/
create  index Users_MESSAGE_FK on MESSAGE (
Users_ID
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE (
   ROLE_ID              INT4                 not null,
   ROLE_TYPE            CHAR(256)            null,
   constraint PK_ROLE primary key (ROLE_ID)
);

/*==============================================================*/
/* Index: ROLE_PK                                               */
/*==============================================================*/
create unique index ROLE_PK on ROLE (
ROLE_ID
);

/*==============================================================*/
/* Table: ROLE_ACTION                                           */
/*==============================================================*/
create table ROLE_ACTION (
   ROLE_ID              INT4                 not null,
   ACTION_ID            INT4                 not null,
   constraint PK_ROLE_ACTION primary key (ROLE_ID, ACTION_ID)
);

/*==============================================================*/
/* Index: ROLE_ACTION_PK                                        */
/*==============================================================*/
create unique index ROLE_ACTION_PK on ROLE_ACTION (
ROLE_ID,
ACTION_ID
);

/*==============================================================*/
/* Index: ROLE_ACTION_FK                                        */
/*==============================================================*/
create  index ROLE_ACTION_FK on ROLE_ACTION (
ROLE_ID
);

/*==============================================================*/
/* Index: ROLE_ACTION2_FK                                       */
/*==============================================================*/
create  index ROLE_ACTION2_FK on ROLE_ACTION (
ACTION_ID
);

/*==============================================================*/
/* Table: "Users"                                                */
/*==============================================================*/
create table "Users" (
   Users_ID              INT4                 not null,
   ROLE_ID              INT4                 not null,
   FIRSTNAME            VARCHAR(1)           null,
   LASTNAME             VARCHAR(1)           null,
   PASSWORD             VARCHAR(1)           null,
   EMAIL                VARCHAR(1)           null,
   constraint PK_Users primary key (Users_ID)
);

/*==============================================================*/
/* Index: Users_PK                                               */
/*==============================================================*/
create unique index Users_PK on "Users" (
Users_ID
);

/*==============================================================*/
/* Index: Users_ROLE_FK                                          */
/*==============================================================*/
create  index Users_ROLE_FK on "Users" (
ROLE_ID
);

/*==============================================================*/
/* Table: Users_GROUP                                            */
/*==============================================================*/
create table Users_GROUP (
   Users_ID              INT4                 not null,
   GROUP_ID             INT4                 not null,
   constraint PK_Users_GROUP primary key (Users_ID, GROUP_ID)
);

/*==============================================================*/
/* Index: Users_GROUP_PK                                         */
/*==============================================================*/
create unique index Users_GROUP_PK on Users_GROUP (
Users_ID,
GROUP_ID
);

/*==============================================================*/
/* Index: Users_GROUP_FK                                         */
/*==============================================================*/
create  index Users_GROUP_FK on Users_GROUP (
Users_ID
);

/*==============================================================*/
/* Index: Users_GROUP2_FK                                        */
/*==============================================================*/
create  index Users_GROUP2_FK on Users_GROUP (
GROUP_ID
);

alter table GROUP_MESSAGE
   add constraint FK_GROUP_ME_GROUP_MES_GROUP foreign key (GROUP_ID)
      references "GROUP" (GROUP_ID)
      on delete restrict on update restrict;

alter table GROUP_MESSAGE
   add constraint FK_GROUP_ME_GROUP_MES_MESSAGE foreign key (MESSAGE_ID)
      references MESSAGE (MESSAGE_ID)
      on delete restrict on update restrict;

alter table MESSAGE
   add constraint FK_MESSAGE_Users_MESS_Users foreign key (Users_ID)
      references "Users" (Users_ID)
      on delete restrict on update restrict;

alter table ROLE_ACTION
   add constraint FK_ROLE_ACT_ROLE_ACTI_ROLE foreign key (ROLE_ID)
      references ROLE (ROLE_ID)
      on delete restrict on update restrict;

alter table ROLE_ACTION
   add constraint FK_ROLE_ACT_ROLE_ACTI_ACTION foreign key (ACTION_ID)
      references ACTION (ACTION_ID)
      on delete restrict on update restrict;

alter table "Users"
   add constraint FK_Users_Users_ROLE_ROLE foreign key (ROLE_ID)
      references ROLE (ROLE_ID)
      on delete restrict on update restrict;

alter table Users_GROUP
   add constraint FK_Users_GRO_Users_GROU_Users foreign key (Users_ID)
      references "Users" (Users_ID)
      on delete restrict on update restrict;

alter table Users_GROUP
   add constraint FK_Users_GRO_Users_GROU_GROUP foreign key (GROUP_ID)
      references "GROUP" (GROUP_ID)
      on delete restrict on update restrict;
























