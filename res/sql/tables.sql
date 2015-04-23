CREATE TABLE Objet(
    id_objet        INT     PRIMARY KEY,
    nom_objet       VARCHAR    ,
    icone_objet     VARCHAR    ,
    rarete_objet    INT     ,
    categorie_objet VARCHAR    ,
    achat_objet     INT     ,
    vente_objet     INT     
)

CREATE TABLE Monstre(
    id_monstre              INT PRIMARY KEY,
    categorie_monstre       VARCHAR    ,
    nom_monstre             VARCHAR    ,
    taille_min_monstre      VARCHAR    ,
    taille_max_monstre      VARCHAR    ,
    icone_monstre           VARCHAR    ,
    img_monstre             VARCHAR    
)


CREATE TABLE DropMonstre{
    id_objet                INT     ,
    id_monstre              INT     ,
    rank                    VARCHAR    ,
    pourcentage_drop        INT     ,
    quantite_drop           INT     ,
    condition_drop          VARCHAR    ,
    CONSTRAINT FOREIGN KEY fk_obj_drop (id_objet)
            REFERENCES Objet (id_objet),
    CONSTRAINT FOREIGN KEY fk_monstre_drop (id_monstre)
            REFERENCES Monstre (id_monstre),
    CONSTRAINT PRIMARY KEY pk_drop (id_objet,
                                    id_monstre,
                                    rank)
};

CREATE TABLE Piege{
    id_piege    INT      PRIMARY KEY,
    type_piege  VARCHAR,
    icone_piege VARCHAR
};

CREATE TABLE EffetPiegeMonstre{
    id_monstre      INTEGER     ,
    id_piege        INTEGER     ,
    is_efficient    BOOLEAN     ,
    duree_normal    INTEGER     ,
    duree_fatigue   INTEGER     ,
    duree_rage      INTEGER     ,
    CONSTRAINT fk_piege_effet FOREIGN KEY (id_piege)
            REFERENCES Piege (id_piege),
    CONSTRAINT fk_monstre_effet FOREIGN KEY (id_monstre)
            REFERENCES Monstre (id_monstre),
    CONSTRAINT pk_effet_piege PRIMARY KEY(  id_piege
                                            id_monstre)
};

CREATE TABLE Arme{
    id_arme             INTEGER     PRIMARY KEY,
    nom_arme            VARCHAR2    ,
    type_arme           VARCHAR2    ,
    rarete              INTEGER     ,
    icone_rarete_arme   VARCHAR2    ,
    degats_arme         INTEGER     ,
    affinite_arme       INTEGER     ,
    defense_arme        INTEGER     ,
    nombre_fentes       INTEGER     ,
    img_arme            VARCHAR2    ,
    capacite_speciale   VARCHAR2    ,
    tranchant           VARCHAR2    
};

CREATE TABLE Alteration{
    id__alteration      INTEGER     PRIMARY KEY,
    nom_alteration      VARCHAR2    ,
    icone_alteration    VARCHAR2    
};

CREATE TABLE AlterationMonstre{
    id_alteration               INTEGER     ,
    id_monstre                  INTEGER     ,
    duree_alteration            INTEGER     ,
    degats_alteration           INTEGER     ,
    tolerance_init_alteration   INTEGER     ,
    tolerance_max_alteration    INTEGER     ,
    incr_tolerance_alteration   INTEGER     ,
    CONSTRAINT fk_alter_monstre FOREIGN KEY (id_alteration)
            REFERENCES Alteration (id_alteration),
    CONSTRAINT fk_monstre_alter FOREIGN KEY (id_monstre)
            REFERENCES Monstre (id_monstre),
    CONSTRAINT pk_alter_monstre (   id_alteration,
                                    id_monstre)
};

CREATE TABLE Degats{
    id_degats       INTEGER     PRIMARY KEY,
    type_degats     VARCHAR2    ,
    icone_degats    VARCHAR2    ,
};

CREATE TABLE PartieCorpsMonstre{
    id_partie       INTEGER     PRIMARY KEY,
    nom_partie      VARCHAR2    
};

CREATE TABLE EtatMonstre{
    id_etat         INTEGER     PRIMARY KEY,
    nom_etat        VARCHAR2    
};

CREATE TABLE DegatsMonstre{
    id_monstre      INTEGER     ,
    id_partie       INTEGER     ,
    id_etat         INTEGER     ,
    id_degats       INTEGER     ,
    valeur_degats_monstre   INTEGER     ,
    CONSTRAINT fk_monstre_degat FOREIGN KEY (id_monstre)
            REFERENCES Monstre (id_monstre),
    CONSTRAINT fk_degat_monstre FOREIGN KEY (id_degats)
            REFERENCES Degats (id_degats),
    CONSTRAINT fk_partie_degat FOREIGN KEY (id_partie)
            REFERENCES PartieCorpsMonstre (id_partie),
    CONSTRAINT fk_etat_degats FOREIGN KEY (id_etat)
            REFERENCES EtatMonstre (id_etat),
    CONSTRAINT pk_degats_monstre PRIMARY KEY (  id_monstre,
                                                id_partie,
                                                id_etat,
                                                id_degats)
};

CREATE TABLE ElementArme(
    id_arme             INTEGER     ,
    id_degats           INTEGER     ,
    valeur_degats_arme  INTEGER     ,
    needingCatalyse     BOOLEAN     ,
    CONSTRAINT fk_arme_element  FOREIGN KEY (id_arme)
            REFERENCES Arme (id_arme),
    CONSTRAINT fk_degats_element FOREIGN KEY (id_degats)
            REFERENCES Degats (id_degats),
    CONSTRAINT pk_element_arme PRIMARY KEY (id_arme,
                                            id_degats)
);
