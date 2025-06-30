/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     30/06/2025 3:46:05 a. m.                     */
/*==============================================================*/


alter table AMIGUSERUSER
   drop constraint FK_AMIGUSER_AMIG_USER;

alter table AMIGUSERUSER
   drop constraint FK_AMIGUSER_AMIG2_USER;

alter table CONFIGRUPO
   drop constraint FK_CONFIGRU_GRUPO_GRUPO;

alter table CONFIGRUPO
   drop constraint FK_CONFIGRU_PROPIGRUP_PROPIEDA;

alter table CONFIUSER
   drop constraint FK_CONFIUSE_PROPIUSER_PROPIEDA;

alter table CONFIUSER
   drop constraint FK_CONFIUSE_USER_USER;

alter table CONTENIDO
   drop constraint FK_CONTENID_MENSAJE_MENSAJE;

alter table CONTENIDO
   drop constraint FK_CONTENID_TIPOARCHI_TIPOARCH;

alter table CONTENIDO
   drop constraint FK_CONTENID_TIPOCONTE_TIPOCONT;

alter table GRUPO
   drop constraint FK_GRUPO_CREAOADMI_USER;

alter table GRUPO
   drop constraint FK_GRUPO_MODIFICAG_GRUPO;

alter table MENSAJE
   drop constraint FK_MENSAJE_ENVIA_USER;

alter table MENSAJE
   drop constraint FK_MENSAJE_GRUPOMENS_GRUPO;

alter table MENSAJE
   drop constraint FK_MENSAJE_HILO_MENSAJE;

alter table MENSAJE
   drop constraint FK_MENSAJE_RECIBE_USER;

alter table PERTENECEUSERGRUPO
   drop constraint FK_PERTENEC_PERTENECE_GRUPO;

alter table PERTENECEUSERGRUPO
   drop constraint FK_PERTENEC_PERTENECE_USER;

alter table PROPIEDAD
   drop constraint FK_PROPIEDA_PROPIEDAD_PROPIEDA;

alter table SEGUIRUSERUSER
   drop constraint FK_SEGUIRUS_SEGUIR_USER;

alter table SEGUIRUSERUSER
   drop constraint FK_SEGUIRUS_SEGUIR2_USER;

alter table UBICACION
   drop constraint FK_UBICACIO_TIPOUBICA_TIPOUBIC;

alter table UBICACION
   drop constraint FK_UBICACIO_UBICASUP_UBICACIO;

alter table "USER"
   drop constraint FK_USER_ACTUALIZA_USER;

alter table "USER"
   drop constraint FK_USER_UBICA_UBICACIO;

drop index AMIG_FK;

drop index AMIG2_FK;

drop table AMIGUSERUSER cascade constraints;

drop index GRUPO_FK;

drop index PROPIGRUPO_FK;

drop table CONFIGRUPO cascade constraints;

drop index USER_FK;

drop index PROPIUSER_FK;

drop table CONFIUSER cascade constraints;

drop index TIPOARCHIVO_FK;

drop index MENSAJE_FK;

drop index TIPOCONTE_FK;

drop table CONTENIDO cascade constraints;

drop index MODIFICAGRUPO_FK;

drop index CREAOADMINISTRA_FK;

drop table GRUPO cascade constraints;

drop index HILO_FK;

drop index GRUPOMENSAJE_FK;

drop index RECIBE_FK;

drop index ENVIA_FK;

drop table MENSAJE cascade constraints;

drop index PERTENECE_FK;

drop index PERTENECE2_FK;

drop table PERTENECEUSERGRUPO cascade constraints;

drop index PROPIEDADSUP_FK;

drop table PROPIEDAD cascade constraints;

drop index SEGUIR_FK;

drop index SEGUIR2_FK;

drop table SEGUIRUSERUSER cascade constraints;

drop table TIPOARCHIVO cascade constraints;

drop table TIPOCONTENIDO cascade constraints;

drop table TIPOUBICA cascade constraints;

drop index UBICASUP_FK;

drop index TIPOUBICA_FK;

drop table UBICACION cascade constraints;

drop index UBICA_FK;

drop index ACTUALIZAPERFIL_FK;

drop table "USER" cascade constraints;

/*==============================================================*/
/* Table: AMIGUSERUSER                                          */
/*==============================================================*/
create table AMIGUSERUSER 
(
   CONSECUSER1          VARCHAR2(5)          not null,
   CONSECUSER2          VARCHAR2(5)          not null,
   constraint PK_AMIGUSERUSER primary key (CONSECUSER1, CONSECUSER2)
);

/*==============================================================*/
/* Index: AMIG2_FK                                              */
/*==============================================================*/
create index AMIG2_FK on AMIGUSERUSER (
   CONSECUSER2 ASC
);

/*==============================================================*/
/* Index: AMIG_FK                                               */
/*==============================================================*/
create index AMIG_FK on AMIGUSERUSER (
   CONSECUSER1 ASC
);

/*==============================================================*/
/* Table: CONFIGRUPO                                            */
/*==============================================================*/
create table CONFIGRUPO 
(
   CODGRUPO             NUMBER(5,0)          not null,
   NCONFIGRUPO          NUMBER(3,0)          not null,
   IDPROPIEDAD          VARCHAR2(2)          not null,
   ESTADO               SMALLINT             not null,
   constraint PK_CONFIGRUPO primary key (CODGRUPO, NCONFIGRUPO)
);

/*==============================================================*/
/* Index: PROPIGRUPO_FK                                         */
/*==============================================================*/
create index PROPIGRUPO_FK on CONFIGRUPO (
   IDPROPIEDAD ASC
);

/*==============================================================*/
/* Index: GRUPO_FK                                              */
/*==============================================================*/
create index GRUPO_FK on CONFIGRUPO (
   CODGRUPO ASC
);

/*==============================================================*/
/* Table: CONFIUSER                                             */
/*==============================================================*/
create table CONFIUSER 
(
   CONSECUSER           VARCHAR2(5)          not null,
   NCONFIUSER           NUMBER(3,0)          not null,
   IDPROPIEDAD          VARCHAR2(2)          not null,
   ESTADO               SMALLINT,
   VALOR                NUMBER(1,0),
   constraint PK_CONFIUSER primary key (CONSECUSER, NCONFIUSER)
);

/*==============================================================*/
/* Index: PROPIUSER_FK                                          */
/*==============================================================*/
create index PROPIUSER_FK on CONFIUSER (
   IDPROPIEDAD ASC
);

/*==============================================================*/
/* Index: USER_FK                                               */
/*==============================================================*/
create index USER_FK on CONFIUSER (
   CONSECUSER ASC
);

/*==============================================================*/
/* Table: CONTENIDO                                             */
/*==============================================================*/
create table CONTENIDO 
(
   CONSECUSERRECIBE     VARCHAR2(5)          not null,
   CONSECUSERENVIA      VARCHAR2(5)          not null,
   CONSMESAJE           NUMBER(5,0)          not null,
   CONSECONTENIDO       NUMBER(2,0)          not null,
   IDTIPOCONTENIDO      VARCHAR2(2)          not null,
   IDTIPOARCHIVO        VARCHAR2(2),
   CONTENIDOIMAG        BLOB                 not null,
   LOCALIZACONTENIDO    VARCHAR2(255),
   constraint PK_CONTENIDO primary key (CONSECUSERRECIBE, CONSECUSERENVIA, CONSMESAJE, CONSECONTENIDO)
);

/*==============================================================*/
/* Index: TIPOCONTE_FK                                          */
/*==============================================================*/
create index TIPOCONTE_FK on CONTENIDO (
   IDTIPOCONTENIDO ASC
);

/*==============================================================*/
/* Index: MENSAJE_FK                                            */
/*==============================================================*/
create index MENSAJE_FK on CONTENIDO (
   CONSECUSERRECIBE ASC,
   CONSECUSERENVIA ASC,
   CONSMESAJE ASC
);

/*==============================================================*/
/* Index: TIPOARCHIVO_FK                                        */
/*==============================================================*/
create index TIPOARCHIVO_FK on CONTENIDO (
   IDTIPOARCHIVO ASC
);

/*==============================================================*/
/* Table: GRUPO                                                 */
/*==============================================================*/
create table GRUPO 
(
   CODGRUPO             NUMBER(5,0)          not null,
   CONSECUSERADMIN      VARCHAR2(5)          not null,
   CODGRUPOMODIFIC      NUMBER(5,0),
   NOMGRUPO             VARCHAR2(30)         not null,
   FECHAREGGRUPO        DATE                 not null,
   IMAGGRUPO            BLOB                 not null,
   constraint PK_GRUPO primary key (CODGRUPO)
);

/*==============================================================*/
/* Index: CREAOADMINISTRA_FK                                    */
/*==============================================================*/
create index CREAOADMINISTRA_FK on GRUPO (
   CONSECUSERADMIN ASC
);

/*==============================================================*/
/* Index: MODIFICAGRUPO_FK                                      */
/*==============================================================*/
create index MODIFICAGRUPO_FK on GRUPO (
   CODGRUPOMODIFIC ASC
);

/*==============================================================*/
/* Table: MENSAJE                                               */
/*==============================================================*/
create table MENSAJE 
(
   CONSECUSERRECIBE     VARCHAR2(5)          not null,
   CONSECUSERENVIA      VARCHAR2(5)          not null,
   CONSMESAJE           NUMBER(5,0)          not null,
   CODGRUPO             NUMBER(5,0),
   MEN_CONSECUSERRECIBE VARCHAR2(5),
   MEN_CONSECUSERENVIA  VARCHAR2(5),
   MEN_CONSMESAJE       NUMBER(5,0),
   FECHAREGMEN          DATE                 not null,
   constraint PK_MENSAJE primary key (CONSECUSERRECIBE, CONSECUSERENVIA, CONSMESAJE)
);

/*==============================================================*/
/* Index: ENVIA_FK                                              */
/*==============================================================*/
create index ENVIA_FK on MENSAJE (
   CONSECUSERENVIA ASC
);

/*==============================================================*/
/* Index: RECIBE_FK                                             */
/*==============================================================*/
create index RECIBE_FK on MENSAJE (
   CONSECUSERRECIBE ASC
);

/*==============================================================*/
/* Index: GRUPOMENSAJE_FK                                       */
/*==============================================================*/
create index GRUPOMENSAJE_FK on MENSAJE (
   CODGRUPO ASC
);

/*==============================================================*/
/* Index: HILO_FK                                               */
/*==============================================================*/
create index HILO_FK on MENSAJE (
   MEN_CONSECUSERRECIBE ASC,
   MEN_CONSECUSERENVIA ASC,
   MEN_CONSMESAJE ASC
);

/*==============================================================*/
/* Table: PERTENECEUSERGRUPO                                    */
/*==============================================================*/
create table PERTENECEUSERGRUPO 
(
   CODGRUPO             NUMBER(5,0)          not null,
   CONSECUSER           VARCHAR2(5)          not null,
   constraint PK_PERTENECEUSERGRUPO primary key (CODGRUPO, CONSECUSER)
);

/*==============================================================*/
/* Index: PERTENECE2_FK                                         */
/*==============================================================*/
create index PERTENECE2_FK on PERTENECEUSERGRUPO (
   CONSECUSER ASC
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on PERTENECEUSERGRUPO (
   CODGRUPO ASC
);

/*==============================================================*/
/* Table: PROPIEDAD                                             */
/*==============================================================*/
create table PROPIEDAD 
(
   IDPROPIEDAD          VARCHAR2(2)          not null,
   IDPROPIEDADSUP       VARCHAR2(2),
   DESCPROPIEDAD        VARCHAR2(100),
   VALORDEFECTO         SMALLINT,
   VALORPROPIEDAD       VARCHAR2(30),
   constraint PK_PROPIEDAD primary key (IDPROPIEDAD)
);

/*==============================================================*/
/* Index: PROPIEDADSUP_FK                                       */
/*==============================================================*/
create index PROPIEDADSUP_FK on PROPIEDAD (
   IDPROPIEDADSUP ASC
);

/*==============================================================*/
/* Table: SEGUIRUSERUSER                                        */
/*==============================================================*/
create table SEGUIRUSERUSER 
(
   CONSECUSER1          VARCHAR2(5)          not null,
   CONSECUSER2          VARCHAR2(5)          not null,
   constraint PK_SEGUIRUSERUSER primary key (CONSECUSER1, CONSECUSER2)
);

/*==============================================================*/
/* Index: SEGUIR2_FK                                            */
/*==============================================================*/
create index SEGUIR2_FK on SEGUIRUSERUSER (
   CONSECUSER2 ASC
);

/*==============================================================*/
/* Index: SEGUIR_FK                                             */
/*==============================================================*/
create index SEGUIR_FK on SEGUIRUSERUSER (
   CONSECUSER1 ASC
);

/*==============================================================*/
/* Table: TIPOARCHIVO                                           */
/*==============================================================*/
create table TIPOARCHIVO 
(
   IDTIPOARCHIVO        VARCHAR2(2)          not null,
   DESCTIPOARCHIVO      VARCHAR2(30)         not null,
   constraint PK_TIPOARCHIVO primary key (IDTIPOARCHIVO)
);

/*==============================================================*/
/* Table: TIPOCONTENIDO                                         */
/*==============================================================*/
create table TIPOCONTENIDO 
(
   IDTIPOCONTENIDO      VARCHAR2(2)          not null,
   DESCTIPOCO           VARCHAR2(30)         not null,
   constraint PK_TIPOCONTENIDO primary key (IDTIPOCONTENIDO)
);

/*==============================================================*/
/* Table: TIPOUBICA                                             */
/*==============================================================*/
create table TIPOUBICA 
(
   CODTIPOUBICA         VARCHAR2(3)          not null,
   DESCTIPOUBICA        VARCHAR2(20)         not null,
   constraint PK_TIPOUBICA primary key (CODTIPOUBICA)
);

/*==============================================================*/
/* Table: UBICACION                                             */
/*==============================================================*/
create table UBICACION 
(
   CODUBICA             VARCHAR2(4)          not null,
   CODTIPOUBICA         VARCHAR2(3)          not null,
   CODUBICASUP          VARCHAR2(4),
   NOMUBICA             VARCHAR2(30)         not null,
   constraint PK_UBICACION primary key (CODUBICA)
);

/*==============================================================*/
/* Index: TIPOUBICA_FK                                          */
/*==============================================================*/
create index TIPOUBICA_FK on UBICACION (
   CODTIPOUBICA ASC
);

/*==============================================================*/
/* Index: UBICASUP_FK                                           */
/*==============================================================*/
create index UBICASUP_FK on UBICACION (
   CODUBICASUP ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   CONSECUSER           VARCHAR2(5)          not null,
   CONSECUSERACTUALIZADO VARCHAR2(5),
   CODUBICA             VARCHAR2(4)          not null,
   NOMBRE               VARCHAR2(25)         not null,
   APELLIDO             VARCHAR2(25)         not null,
   "USER"               VARCHAR2(6)          not null,
   FECHAREGISTRO        DATE                 not null,
   EMAIL                VARCHAR2(50)         not null,
   CELULAR              VARCHAR2(16)         not null,
   IMAGEUSER            BLOB,
   TEMAUSER             BLOB,
   HUELLAUSER           BLOB,
   constraint PK_USER primary key (CONSECUSER)
);

/*==============================================================*/
/* Index: ACTUALIZAPERFIL_FK                                    */
/*==============================================================*/
create index ACTUALIZAPERFIL_FK on "USER" (
   CONSECUSERACTUALIZADO ASC
);

/*==============================================================*/
/* Index: UBICA_FK                                              */
/*==============================================================*/
create index UBICA_FK on "USER" (
   CODUBICA ASC
);

alter table AMIGUSERUSER
   add constraint FK_AMIGUSER_AMIG_USER foreign key (CONSECUSER1)
      references "USER" (CONSECUSER);

alter table AMIGUSERUSER
   add constraint FK_AMIGUSER_AMIG2_USER foreign key (CONSECUSER2)
      references "USER" (CONSECUSER);

alter table CONFIGRUPO
   add constraint FK_CONFIGRU_GRUPO_GRUPO foreign key (CODGRUPO)
      references GRUPO (CODGRUPO);

alter table CONFIGRUPO
   add constraint FK_CONFIGRU_PROPIGRUP_PROPIEDA foreign key (IDPROPIEDAD)
      references PROPIEDAD (IDPROPIEDAD);

alter table CONFIUSER
   add constraint FK_CONFIUSE_PROPIUSER_PROPIEDA foreign key (IDPROPIEDAD)
      references PROPIEDAD (IDPROPIEDAD);

alter table CONFIUSER
   add constraint FK_CONFIUSE_USER_USER foreign key (CONSECUSER)
      references "USER" (CONSECUSER);

alter table CONTENIDO
   add constraint FK_CONTENID_MENSAJE_MENSAJE foreign key (CONSECUSERRECIBE, CONSECUSERENVIA, CONSMESAJE)
      references MENSAJE (CONSECUSERRECIBE, CONSECUSERENVIA, CONSMESAJE);

alter table CONTENIDO
   add constraint FK_CONTENID_TIPOARCHI_TIPOARCH foreign key (IDTIPOARCHIVO)
      references TIPOARCHIVO (IDTIPOARCHIVO);

alter table CONTENIDO
   add constraint FK_CONTENID_TIPOCONTE_TIPOCONT foreign key (IDTIPOCONTENIDO)
      references TIPOCONTENIDO (IDTIPOCONTENIDO);

alter table GRUPO
   add constraint FK_GRUPO_CREAOADMI_USER foreign key (CONSECUSERADMIN)
      references "USER" (CONSECUSER);

alter table GRUPO
   add constraint FK_GRUPO_MODIFICAG_GRUPO foreign key (CODGRUPOMODIFIC)
      references GRUPO (CODGRUPO);

alter table MENSAJE
   add constraint FK_MENSAJE_ENVIA_USER foreign key (CONSECUSERENVIA)
      references "USER" (CONSECUSER);

alter table MENSAJE
   add constraint FK_MENSAJE_GRUPOMENS_GRUPO foreign key (CODGRUPO)
      references GRUPO (CODGRUPO);

alter table MENSAJE
   add constraint FK_MENSAJE_HILO_MENSAJE foreign key (MEN_CONSECUSERRECIBE, MEN_CONSECUSERENVIA, MEN_CONSMESAJE)
      references MENSAJE (CONSECUSERRECIBE, CONSECUSERENVIA, CONSMESAJE);

alter table MENSAJE
   add constraint FK_MENSAJE_RECIBE_USER foreign key (CONSECUSERRECIBE)
      references "USER" (CONSECUSER);

alter table PERTENECEUSERGRUPO
   add constraint FK_PERTENEC_PERTENECE_GRUPO foreign key (CODGRUPO)
      references GRUPO (CODGRUPO);

alter table PERTENECEUSERGRUPO
   add constraint FK_PERTENEC_PERTENECE_USER foreign key (CONSECUSER)
      references "USER" (CONSECUSER);

alter table PROPIEDAD
   add constraint FK_PROPIEDA_PROPIEDAD_PROPIEDA foreign key (IDPROPIEDADSUP)
      references PROPIEDAD (IDPROPIEDAD);

alter table SEGUIRUSERUSER
   add constraint FK_SEGUIRUS_SEGUIR_USER foreign key (CONSECUSER1)
      references "USER" (CONSECUSER);

alter table SEGUIRUSERUSER
   add constraint FK_SEGUIRUS_SEGUIR2_USER foreign key (CONSECUSER2)
      references "USER" (CONSECUSER);

alter table UBICACION
   add constraint FK_UBICACIO_TIPOUBICA_TIPOUBIC foreign key (CODTIPOUBICA)
      references TIPOUBICA (CODTIPOUBICA);

alter table UBICACION
   add constraint FK_UBICACIO_UBICASUP_UBICACIO foreign key (CODUBICASUP)
      references UBICACION (CODUBICA);

alter table "USER"
   add constraint FK_USER_ACTUALIZA_USER foreign key (CONSECUSERACTUALIZADO)
      references "USER" (CONSECUSER);

alter table "USER"
   add constraint FK_USER_UBICA_UBICACIO foreign key (CODUBICA)
      references UBICACION (CODUBICA);

