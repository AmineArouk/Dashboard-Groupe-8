drop table Concerner;
drop table Contenir;
drop table Ecrire;
drop table Parler;
drop table Traiter;
drop table Article;
drop table Auteur;
drop table Keyword;
drop table Maladie;
drop table DemaineApplication;
drop table MethodeApprentissage;

------------------------------------------------------------
-- Table: Article
------------------------------------------------------------
CREATE TABLE Article(
        id_article       int NOT NULL ,
        titre            Varchar (200),
        date_publication Varchar (200),
        brevet Varchar (200),
	    CONSTRAINT Article_PK PRIMARY KEY (id_article)
);

------------------------------------------------------------
-- Table: Auteur
------------------------------------------------------------
CREATE TABLE Auteur(
        id_auteur     int NOT NULL ,
        nom_auteur    Varchar (50),
        prenom_auteur Varchar (50),
        nationalite Varchar (50),
        laboratoire Varchar (50),
	    CONSTRAINT Auteur_PK PRIMARY KEY (id_auteur)
);


------------------------------------------------------------
-- Table: Keyword
------------------------------------------------------------
CREATE TABLE Keyword(
        id_keyword int NOT NULL ,
        mot         Varchar (50),
	    CONSTRAINT Keyword_PK PRIMARY KEY (id_keyword)
);



------------------------------------------------------------
-- Table: Maladie
------------------------------------------------------------

CREATE TABLE Maladie(
        id_maladie int NOT NULL ,
        nom_maladie Varchar (200),
        type_maladie Varchar (200),
	    CONSTRAINT Maladie_PK PRIMARY KEY (id_maladie)
);


------------------------------------------------------------
-- Table: DemaineApplication
------------------------------------------------------------
CREATE TABLE DemaineApplication(
        id_demaine     int NOT NULL ,
        nom_domaine    Varchar (100) ,
	    CONSTRAINT DemaineApp_PK PRIMARY KEY (id_demaine)
);

------------------------------------------------------------
-- Table: MethodeApprentissage
------------------------------------------------------------
CREATE TABLE MethodeApprentissage(
        id_methode     int NOT NULL ,
        nom_methode Varchar (200) ,
	    CONSTRAINT MethodeApprentissage_PK PRIMARY KEY (id_methode)
);

------------------------------------------------------------
-- Table: Concerner
------------------------------------------------------------
CREATE TABLE Concerner(
        id_article  int NOT NULL ,
        id_maladie int NOT NULL,
	    CONSTRAINT Concerner_PK PRIMARY KEY (id_article,id_maladie),

	    CONSTRAINT Concerner_Article_FK FOREIGN KEY (id_article) REFERENCES Article(id_article),
	    CONSTRAINT Concerner_Maladie_FK FOREIGN KEY (id_maladie) REFERENCES Maladie(id_maladie)
);


------------------------------------------------------------
-- Table: Contenir
------------------------------------------------------------
CREATE TABLE Contenir(
        id_article  int NOT NULL ,
        id_keyword int NOT NULL,
	    CONSTRAINT contenir_PK PRIMARY KEY (id_article,id_keyword),

	    CONSTRAINT Contenir_Article_FK FOREIGN KEY (id_article) REFERENCES Article(id_article),
	    CONSTRAINT Contenir_Keyword_FK FOREIGN KEY (id_keyword) REFERENCES Keyword(id_keyword)
);

------------------------------------------------------------
-- Table: Parler
------------------------------------------------------------
CREATE TABLE Parler(
        id_article  int NOT NULL ,
        id_methode int NOT NULL,
	    CONSTRAINT Parler_PK PRIMARY KEY (id_article,id_methode),

	    CONSTRAINT Parler_Article_FK FOREIGN KEY (id_article) REFERENCES Article(id_article),
	    CONSTRAINT Parler_mathode_FK FOREIGN KEY (id_methode) REFERENCES MethodeApprentissage(id_methode)
);
------------------------------------------------------------
-- Table: Ecrire
------------------------------------------------------------
CREATE TABLE Ecrire(
        id_article  int NOT NULL ,
        id_auteur int NOT NULL,
	    CONSTRAINT Ecrire_PK PRIMARY KEY (id_article,id_auteur),

	    CONSTRAINT Ecrire_Article_FK FOREIGN KEY (id_article) REFERENCES Article(id_article),
	    CONSTRAINT Ecrire_Auteur_FK FOREIGN KEY (id_auteur) REFERENCES Auteur(id_auteur)
);
------------------------------------------------------------
-- Table: Traiter 
------------------------------------------------------------
CREATE TABLE Traiter(
        id_article  int NOT NULL ,
        id_demaine int NOT NULL,
	    CONSTRAINT Traiter_PK PRIMARY KEY (id_article,id_demaine),

	    CONSTRAINT Traiter_Article_FK FOREIGN KEY (id_article) REFERENCES Article(id_article),
	    CONSTRAINT Traiter_Demaine_FK FOREIGN KEY (id_demaine) REFERENCES DemaineApplication(id_demaine)
);

