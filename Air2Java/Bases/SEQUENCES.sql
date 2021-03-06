/*

CREATE SEQUENCE SEQ_CYCLE INCREMENT BY 1 START WITH 10 MAXVALUE 1000 MINVALUE 0 CYCLE NOCACHE ORDER;

ALTER SEQUENCE SEQ_masequence INCREMENT BY &NouvelleValeur -  SEQ_MaSequence.currval ;
SELECT SEQ_MaSequence.nextval from dual ;
ALTER SEQUENCE SEQ_MASEQUENCE INCREMENT BY incr_ori ;

* /

CREATE SEQUENCE "SEQ_LIEUX" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_GROUPES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_ADRESSETYPES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_PAYS" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_CIVILITES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_EMAILS" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_ADRESSES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_TELEPHONES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_SPECIALITES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
; CREATE SEQUENCE "SEQ_FONCTIONS" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_OEUVRETYPES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_LIEUXREPRESENTATION" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_INSTRUMENTS" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_OEUVRES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_TELEPHONETYPES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_PROGRAMME" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_INDIVIDUS" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_RESPONSABILITES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_RENCONTRES" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
CREATE SEQUENCE "SEQ_REGIONS" MINVALUE 10 MAXVALUE 10000 INCREMENT BY 1 START WITH 10 CACHE 20 ORDER  CYCLE ;
