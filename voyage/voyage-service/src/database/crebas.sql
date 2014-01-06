/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  06/01/2014 15:02:00                      */
/*==============================================================*/
CREATE database IF NOT EXISTS voyages;
 
USE voyages; 

drop table if exists Activite;

drop table if exists Administrateur;

drop table if exists Client;

drop table if exists Hebergement;

drop table if exists Reservation;

drop table if exists Transport;

drop table if exists Voyage;

/*==============================================================*/
/* Table : Activite                                             */
/*==============================================================*/
create table Activite
(
   idActivite           int not null,
   type                 varchar(254),
   duree                varchar(254),
   lieu                 varchar(254),
   primary key (idActivite)
);

/*==============================================================*/
/* Table : Administrateur                                       */
/*==============================================================*/
create table Administrateur
(
   idAdministrateur     int not null,
   civilite             varchar(254),
   nom                  varchar(254),
   prenom               varchar(254),
   adresseMail          varchar(254),
   mdp                  varchar(254),
   numeroTel            varchar(254),
   primary key (idAdministrateur)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   idClient             int not null,
   coordonneesBancaire  varchar(254),
   civilite             varchar(254),
   nom                  varchar(254),
   prenom               varchar(254),
   adresseMail          varchar(254),
   mdp                  varchar(254),
   numeroTel            varchar(254),
   primary key (idClient)
);

/*==============================================================*/
/* Table : Hebergement                                          */
/*==============================================================*/
create table Hebergement
(
   idHebergement        int not null,
   type                 varchar(254),
   nom                  varchar(254),
   categorie            varchar(254),
   adresse              varchar(254),
   primary key (idHebergement)
);

/*==============================================================*/
/* Table : Reservation                                          */
/*==============================================================*/
create table Reservation
(
   idReservation        int not null,
   idClient             int,
   numeroReservation    bigint,
   dateReservation      varchar(254),
   datePaiement         varchar(254),
   dateAnnulation       varchar(254),
   etat                 varchar(254),
   primary key (idReservation)
);

/*==============================================================*/
/* Table : Transport                                            */
/*==============================================================*/
create table Transport
(
   idTransport          int not null,
   type                 varchar(254),
   classe               varchar(254),
   primary key (idTransport)
);

/*==============================================================*/
/* Table : Voyage                                               */
/*==============================================================*/
create table Voyage
(
   idVoyage             int not null,
   idHebergement        int,
   idTransport          int,
   idReservation        int,
   idActivite           int,
   idAdministrateur     int,
   Act_idActivite       int,
   reference            varchar(254),
   destination          varchar(254),
   depart               varchar(254),
   dateDepart           varchar(254),
   dateRetour           varchar(254),
   prix                 numeric(8,0),
   nbrePlace            int,
   primary key (idVoyage)
);

alter table Reservation add constraint FK_clientReservation foreign key (idClient)
      references Client (idClient);

alter table Voyage add constraint FK_voyageActivite foreign key (Act_idActivite)
      references Activite (idActivite);

alter table Voyage add constraint FK_voyageAdministrateur foreign key (idAdministrateur)
      references Administrateur (idAdministrateur);

alter table Voyage add constraint FK_voyageHebergement foreign key (idHebergement)
      references Hebergement (idHebergement);

alter table Voyage add constraint FK_voyageReservation foreign key (idReservation)
      references Reservation (idReservation);

alter table Voyage add constraint FK_voyageTransport foreign key (idTransport)
      references Transport (idTransport);

