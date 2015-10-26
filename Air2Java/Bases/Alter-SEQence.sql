declare nseq number, nincr number ;
SELECT SEQ_MaSequence.nextval, increment  INTO nseq, nincr FROM USER_SEQUENCES WHERE SEQUENCE_NAME='SEQ_MaSequence';
ALTER SEQUENCE SEQ_MaSequence INCREMENT BY &NouvelleValeur - nseq ;
SELECT SEQ_MaSequence.nextval from dual ;
ALTER SEQUENCE SEQ_MaSequence INCREMENT BY nincr ;

