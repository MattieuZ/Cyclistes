create database cycliste

create table ADRESSE (
				CODADR int(5) NOT NULL,
				NUM-RUE int(3) NOT NULL,
				VOIE varchar(60) NOT NULL,
				CODE-POSTAL int(5) NOT NULL,
				CODPAYS int(3) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,
				PRIMARY KEY (CODADR),
				FOREIGN KEY CODPAYS REFERENCES PAYS (CODPAYS)



);

create table PAYS (
				CODPAYS int(3) NOT NULL,
				NOM-PAYS varchar(60) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,
				PRIMARY KEY (CODPAYS)
);

create table CIVILITE (
				CODCIV int(3) NOT NULL,
				CIVILITE varchar(10) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,
				PRIMARY KEY (CODCIV)
);

create table ENTRAINEUR (
				CODENTR int(3) NOT NULL,
				CODCIV int(3) NOT NULL,
				NOM varchar(20) NOT NULL,
				PRENOM varchar(20) NOT NULL,
				DIPLOME varchar(25) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,
				PRIMARY KEY (CODENTR),
				FOREIGN KEY CODCIV REFERENCES CIVILITE(CODCIV)
);

create table SEMAINE (
				CODSEM int(2) NOT NULL,
				GRANDTOUR varchar(10) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,
				PRIMARY KEY (CODSEM)
);

create table COUREUR (
				CODCOUR int(3) NOT NULL,
				CODCIV int(3) NOT NULL,
				NOM varchar(20) NOT NULL,
				PRENOM varchar(20) NOT NULL,
				CODADR int(5) NOT NULL,
				TOTAL-KM-FAITS int(5) NOT NULL,
				CODENTR int(3) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,
				PRIMARY KEY (CODCOUR),
				FOREIGN KEY ADR-ID REFERENCES ADRESSE (ADR-ID),
				FOREIGN KEY CODENTR REFERENCES ENTRAINEUR (CODENTR)
				FOREIGN KEY CODCIV REFERENCES CIVILITE (CODCIV)
);

create table A-FAIRE (
				KM-A-FAIRE int(4) NOT NULL,
				JOUR varchar(8) NOT NULL,
				CODCOUR int(3) NOT NULL,
				CODSEM int(2) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,				
				FOREIGN KEY CODCOUR REFERENCES COUREUR (CODCOUR),
				FOREIGN KEY CODSEM REFERENCES SEMAINE (CODSEM)
);

create table FAIT (
				KM-FAITS int(4) NOT NULL,
				JOUR varchar(8) NOT NULL,
				CODCOUR int(3) NOT NULL,
				CODSEM int(2) NOT NULL,
				DAT-CRE varchar(8) NOT NULL,
				DAT-MAJ varchar(8) NOT NULL,
				DAT-SUP varchar(8) NOT NULL,
				UTIL int(5) NOT NULL,				
				FOREIGN KEY CODCOUR REFERENCES COUREUR (CODCOUR),
				FOREIGN KEY CODSEM REFERENCES SEMAINE (CODSEM)
);