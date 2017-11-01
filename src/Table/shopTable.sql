-----------------DROP TABLE-----------------------
DROP TABLE PROMOTIONDETAIL;
DROP TABLE ORDERDETAIL;
DROP TABLE PROMOTION;
DROP TABLE ShoppingMall;
DROP TABLE CLASSSTYLE;
DROP TABLE SHOPORDER;
DROP TABLE MEMBER;

DROP sequence FORSHOPORDER;
DROP sequence FORSHOPITEM;
DROP sequence FORPROMOTION;
-----------------DROP TABLE-----------------------



---------------------�ۼW�D��1(�ӫ~�s����)-----------------------------

create sequence FORSHOPITEM
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

---------------------�ۼW�D��2(�P�P�s����)-----------------------------
create sequence FORPROMOTION
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

---------------------�ۼW�D��3(�ӫ~�q��M��)-----------------------------
create sequence FORSHOPORDER
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


-----------------�ۤv���˷|��-----------------------
CREATE TABLE MEMBER(
MEM_NO VARCHAR2(10)PRIMARY KEY,
POINT NUMBER(20)
);

INSERT INTO MEMBER (MEM_NO,POINT) VALUES(1,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(2,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(3,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(4,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(5,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(6,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(7,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(8,5000);
INSERT INTO MEMBER (MEM_NO,POINT) VALUES(9,5000);



----------------�ӫ~����----------------------
CREATE TABLE CLASSSTYLE (
CLASSNO      NUMBER(10)  PRIMARY KEY ,
CLASSNAME  VARCHAR2(15) NOT NULL
);

----------------�ӫ~���������------------------------------
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (1,'���G');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (2,'����');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (3,'����');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (4,'������');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (5,'�O����');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (6,'���~��');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (7,'�ħ���');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (8,'�B�ʾ�����');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (9,'���U������');


----------------�ӫ~----------------------
CREATE TABLE ShoppingMall (
ITEMNO      NUMBER(10)      PRIMARY KEY,
STOCK            NUMBER(5) NOT NULL,
PRICE          NUMBER(10),
STATE     NUMBER(2) ,
CLASSNO           NUMBER(10) NOT NULL,
NAME         VARCHAR2(400) NOT NULL,
DES          VARCHAR2(800),
PICTURE1        BLOB,
PICTURE2        BLOB,
PICTURE3        BLOB,
CONSTRAINT FK_CLASSNO  FOREIGN KEY (CLASSNO) REFERENCES CLASSSTYLE(CLASSNO)
);

----------------�ӫ~�q��----------------------
CREATE TABLE SHOPORDER (
ORDERNO VARCHAR2(15) PRIMARY KEY,
MEM_NO VARCHAR2(10),
ORDER_DATE TIMESTAMP,
CUSTOMER_ADDRESS VARCHAR2(100),
CUSTOMER_PHONE VARCHAR2(15),
CUSTOMER_NAME VARCHAR2(80),
CONSTRAINT FK_MEM_NO  FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);

----------------�ӫ~�q�氲���------------------
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),1,TO_DATE('2017/5/5', 'yyyy-mm-dd'),'�x�_���s��','0926','�Q��s�Ӥ�');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),2,TO_DATE('2010/4/5', 'yyyy-mm-dd'),'�H���x�n��','0918','�˺Ƴ�����');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),3,TO_DATE('2013/2/9', 'yyyy-mm-dd'),'�H���x�n��','0800','�k�|�{�Ҥ��إ���Ĥ@���-���Ӥ�');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),4,TO_DATE('1950/4/5', 'yyyy-mm-dd'),'�x�_���s��','0987','�x�W���^��');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),5,TO_DATE('1966/12/5', 'yyyy-mm-dd'),'�x�_���s��','0926','���@�p�̰��^�E');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),6,TO_DATE('1960/5/5', 'yyyy-mm-dd'),'�����̪F��','0926','�ª����n��');


----------------�P�P�M��----------------------
CREATE TABLE PROMOTION (
PROMOTIONNO  NUMBER(10)  PRIMARY KEY,
NAME  VARCHAR2(45),
BEGINDATE DATE,
ENDDATE DATE
);

----------------�P�P����----------------------
CREATE TABLE PROMOTIONDETAIL (
PROMOTIONNO  NUMBER(10)  ,
ITEMNO           NUMBER(10),
PRICE          NUMBER(10),
constraint PR_SUPPLIER_EX_PK primary key(PROMOTIONNO, ITEMNO),
CONSTRAINT FK_PROMOTIONNO  FOREIGN KEY (PROMOTIONNO) REFERENCES PROMOTION(PROMOTIONNO),
CONSTRAINT FK_CLASSNOS  FOREIGN KEY (ITEMNO) REFERENCES ShoppingMall (ITEMNO)
);

----------------�q�����----------------------
CREATE TABLE ORDERDETAIL (
ORDERNO      VARCHAR2(15) ,--20171023�ק�L--
ITEMNO         NUMBER(10),
ORDERCOUNT NUMBER(5),
constraint PR_SUPPLIER_EX_OR primary key(ORDERNO, ITEMNO),
CONSTRAINT FK_ORDERNO  FOREIGN KEY (ORDERNO) REFERENCES SHOPORDER(ORDERNO),
CONSTRAINT FK_NAME  FOREIGN KEY (ITEMNO) REFERENCES ShoppingMall(ITEMNO)
);

--------------------------�ӫ��ӫ~�����-----------------------------
INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,10,499,1,1,'�iDaiwa�j�饻�s�q�λ��U�_','�����~�������A����O�q�h�ơA�Ϊ̦]�������L�k�κD�Τ���_�_�l�i���A���ֺ����˦��ڸ_�l�A�i�H�����e���ۦ�i���ӵL�ݤH�����C�s�Τ��D�_�l���~��H��i�����ϥΥ��_�l�Өɥά������a�C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,20,350,1,1,'�iForsound�j�ĤT�N��������������','�ܦh�~���̬Ҧ��ƫK�������x�Z�A�u���������v��O�ܦh�~���̪��@�P���D�A���S���@�Ӧn���y�ԥi�H����U�ɪ����K�O?���ֺ����z���Ф@�ڥ~�P�w�B�骺�s�M�Q�������ԡA�S���y����SGEL�����P�H��u�Ǫ����X�A���z�q�����A�p���w�֡C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,299,1,1,'Hi-Bone���Ҧ�(���Ǿ�+�Ů�Ǿ�)���P�צվ�','�z���h�[�S��ť���u��������? �a���O�_�������٤���n�t���Uť���A���O�P�H���q���ȮǤH�n�θ��j�����q�A�Ӧۤv�����]ť���ܨ��W�A�b���q���}�����p�U�A�����]�����ѤH�a�v���ʳ��C���ť�l�����ֱڦӨ��A�@�w����A��ť������ʤH�����֡A�ɨ��H���b���֤������n���^��C���ֺ����z��{�@��A�ڭ̱��˱z�@�ڳ̷s��ު����Ҧ�(���Ǿ�+�Ů�Ǿ�)���P�צվ��A���z�A�׷P�����״I���֭��A���ͩR�A�׬��D�_�ӡC');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,199,1,1,'�饻�s�Ǥ��U','���ֱڪ��ɶ��ݦb�N��Ф��Ϊ̥~�X�H�y��ŧ�A�@�w�n�`�N�Y�����O�x�A�y�@���V�N�|���D�C���ֺ����ˤ@�ڤ饻�s���Ǥ��U�A�i���īO���Y���ŷx�A���v�q�}�֩Φ����v�x�Z���Ⱦv�ڦ��]�B�����ĪG�C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,899,1,1,'���覡��j�� 2.3��','�H�ۦ~�ּW���A���O�V�ӶV�ҽk���M�A�o�ɻݭn�@�Ӥ��e�����⪺��j��Ӿ\Ū�Τu�@�A���ڰӫ~�N�O�z���̨ο�ܡC������ΦѪᲴ��]�i�A���W����j��A���ΦA�@�⮳�۩�j��A�@�⮳�ۮѡC�������ݡA������}��!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iLifePlus�j�}�����L��ê�D��','�a�������O���O�ܤ[�S���ɨ��w�������ִ���? �@�Q��n�}��L�����_���D�����A�K�����������w�������Y�C
�����ֺ��x�_���ͩ� (�x�_�����ͪF�����q91��)������i�ܡA�w��e������
�������~���椣�t�w�ˬI�u�O��
���x�����H�_�K�B(�����s�ϰ��~)�A�H�n�B�Ϊ�F�����a�ϹB�O�ݥt�p�A�Шӹq�߰ݳ�');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iNISHIKI�j�k�Ψ��|�w�߿� - �l���q150cc (�����T�A��)','�z���]���j���B�y�©δ������A�����ۥD���|�����ζ�? �O�_�ݭn�ԭ��@�ԩνåͯȤ~���~�X? �����~�k�ʪ��|�����άO�@�ӫܴ��M���{�H�A�ھڰ�����d��96�~�լd�A��H54���H�W�k�ʨC4����k���A�N��1�즳�����T�x�Z�A65���H�W�k�ʧ�O���F1/3�A�ѩ��H�����O�u�A�j���������Ԥ�`�ͬ����]�����T���x�Z�C ���ֺ����˱z�@�ڥѤ饻��u��s�A�w�ﻴ���T���k�ҳ]�p�����|���ǡA�l���B����S�����A���z�H�ɫO���M�n�A�ͬ��~��o�H�ﵽ�C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iSWANY�jWalking Bag 134 �_�j������c (�@�ئ�)','�饻����c�j�t - SWANY�M�����ֱڸs�ҳ]�p����Φ���c�mWalking Bag�n�A�ŦX�H��u�ǡA�S���ƽ��b�ӳ]�p�W�R���A�i360�ױ���A���N�ܴ��樫��V�A�L���W��ƪo�Y�i�O�� ���l�������L�n�C
�i���������W���q�]�A����c�i�ܨ����ⴣ�]�A���z��B�w�w���A���ξ�߫p����������z�����u�L�ׯh�ҡC�𮧬O���F������������C�i�H���z��٤O�A���z���C�|���L�t��!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'���֫Ǥ��֬��c','�@��Ǥ�������c�ѩ��Ӿc����Ĳ�a���A�e���y���^�ˡC���ʵξA�����^�B���ƾc�O�ѤH���n�~�a���@������C���ﱵ���֤ƪ��|�����{�A�����q�ۤ饻�޶i�M���Ⱦv�ڤH�h�]�p�����֬�Ǥ��c���C�y�֦~���̡A�гy���d�ξA���a�~�ͬ��C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�i+VENTURE�j�h�\����ī��t�t�����Ź�(������)�a�Ϋ�KB-243','�ær�֥i�r���G�ó��徹�s���r��005451��');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iMr. Pad�j�W�X�n�O�Ъw�֦a�� 40X60cm','�V�ѧ֨ӤF�A���̤U�ɭY���b�ŷx��ƪ��a�ԡA���Ȩ���]�߿O���L�z�ƭ˪����I�A�ӥB�]�i�������ެ�M���Y�����I�C
���a�Խ�P�׫p�A�������}�ŬX�����@�A�A�Ω�D�Ǫ��f�B�p�СB�����A���L�ǡF���~�ϥ�SBR���Ʃ����[�j��ơA�����ưʡA����@�Τ�����A�i�f�t�~����~���A�M�~��k²��S�ٮɡA���z�復�R�������~');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'SHIMA�Ⱦv���ʪ����B���A10/5-10/31�R�N�e���q�հ��ʡA�e������!','�Ѥ饻�ѤH���s�y�j�t - �q�s�@�ҡA�M���Ⱦv�ڦӳ]�p���ʪ����B���A��K�Ⱦv�ڥ~�X�ʪ��A��W���u�n�N���ũ�b���W�Y�i�}�l�ʪ��A�R���F��b�������m���Ť��A�Y�i�N�ʶR���~���^�a�A���δ������A���֤F�٥i���U�𮧡C
�L�ױz�O�n���鴲�B�B�}���ʪ��A�٬O�n�𶢹B�ʳ���K�B�٤O�ΤΦw���A�O�@���D�`�K�ߪ��Ⱦv�ڰӫ~�C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iFamica�j�ίv�M�Χ��@��','���ǻȾv���̥ѩ�U�ئ]���A�q�ɤW�_���ν��U�ɱ`�|�P��ܦY�O�A�{�b���F�o�@�ڧ����@��A���F���������ίv�w���[���A�_���ɥi�H���P�F�A���ѤH�a�q�ɤW�_����[���伵�O�C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iRyka�jRKF1272M1600�k�ΰ����c','�A�]�O�ӳ߷R�𶢰����A��B�w�w�y���Ⱦv�ڶܡH
�B�ʬO�������O���̨Χ���A���p��D��@���קK�B�ʶˮ`���c�l�i�O�D�`���n���C
�ר�����̨ӻ��A�e�ɤ������B�׾_�w�ĵ����A���O�D�諸���I�C
���ֺ����˦��ڡiRyka�j�����𶢾c�A
�~�P�п�̦]�������B�ʤ��W�A�˦ۧ�J�B�ʾc��o�A
�S�O�w��k�ʪ��٦׻P���f���c�A�]�p����קK�B�ʶˮ`���M�ݾc�ڡA
�L�׬O�n����֨��ιB�ʰ��泣�A�X��I');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�i�ӥi�j���䰨��_���ߤ�','��󦳨Ǫ����ӻ��A�ѩ󽥻\�B�y�����h�ƵL�O�A�n�q�����_�ӬO�۷��W���A�ӥB�b�o�A�K�_�����L�{���A�ټ��õ۶^�˪��M�I�C
���ֺ����ˤ@�ڡi�ӥi���䰨��_���ߤ�j�A�����w�ˡA�����\��b�Z�Ұ�����A�������n���_�Ӯɦ��Ҩ̾a�A�z�K�ߡB�L(�o)�ۤߡB���a����ߡI');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�饻GREEN BELL�}���ұM�Ϋ��Ұ�','���ѤH�a�Ÿ}���ҬO���O�ܧx��?

�~���̥ѩ�ӭM���s���N�s�ΦA�ͯ�O�h�ơA�c�����Ҫ�����h���N�¤]�|��C�A�ɭP����h�[�p�A�����ܪ���w���šA�ר�}���ҭY�S���w�n�A�u�������šC �饻�M�~���ҰŤj�t-GREEN BELL�A�K�]���Ӷ}�o�F�@�t�C�M���p���ҡB�ܧΫ��Ҧӳ]�p�����ҰšA�L�׬O�ۥΩέn���ѤH�a�Ÿ}���ҬҤ�K�h�F�C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iKeyCatch�j�ϤO���Ǿ�','�a�̤j�p�Ʀp�¡A�`�O�ѰO�_�ͩ�b���H
�~���O�ФO�h�ơA���ɨ�N�O�䤣��

���˵��z��²���Ǫ��̨Τ�סiKeyCatch�j�ϤO���Ǿ�
�u�n�T�����H�K�A�a�����󥭷ƪ��үব�ǡA�a���z�L���K�Q�I');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�iMOTORIZED�j���O�⨬������ (�i������)','�Ⱦv�ڭY������O���B�ʲߺD�A���|�鶴�߲��ͷ��j���U�q�A���������i���ר�ΡA��}�ҥi�B�ʡC ���ΥX�O�A���������|�H�q�ʪ��覡�a�ʱz����}���ʡA���z���P�ۦb�F��B�ʮĪG�C');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�ۤ����O�Uť�q��','�q��ť���M����? �ȰO����q�ܶ�? ����Ӥp�ݤ��M��? ���ξ�ߡA���q�ܤ@���ѨM�z�Ҧ����D!!!���˳̨���§!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'SHIMA�Ⱦv���ʪ����B���A10/5-10/31�R�N�e���q�հ��ʡA�e������!','�Ѥ饻�ѤH���s�y�j�t - �q�s�@�ҡA�M���Ⱦv�ڦӳ]�p���ʪ����B���A��K�Ⱦv�ڥ~�X�ʪ��A��W���u�n�N���ũ�b���W�Y�i�}�l�ʪ��A�R���F��b�������m���Ť��A�Y�i�N�ʶR���~���^�a�A���δ������A���֤F�٥i���U�𮧡C
�L�ױz�O�n���鴲�B�B�}���ʪ��A�٬O�n�𶢹B�ʳ���K�B�٤O�ΤΦw���A�O�@���D�`�K�ߪ��Ⱦv�ڰӫ~�C');

--
--INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES,PICTURE1,PICTURE2,PICTURE3)  
--VALUES (FORSHOPITEM.Nextval,50,100,1,1,'�K���B�\��2','�j������2',?,?,?);

----------------�ӫ~�q����Ӱ����(�����ʪ����s�W�H����k����)------------------------------

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),1,15);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),5,4);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),3,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),2,2);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),1,7);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),5,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),6,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),3,1);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),1,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),2,7);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),3,9);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),4,10);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),5,15);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),6,20);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000004',6,'0'),3,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000004',6,'0'),5,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000004',6,'0'),7,1);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000005',6,'0'),4,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000005',6,'0'),7,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000005',6,'0'),2,10);


--------------------------�P�P�M�װ����------------------------------
INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(1,'����`����',TO_DATE('2017/9/1', 'yyyy-mm-dd'),TO_DATE('2017/9/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(2,'�ݤȸ`����',TO_DATE('2017/10/1', 'yyyy-mm-dd'),TO_DATE('2017/10/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(3,'�U�t�`����',TO_DATE('2017/11/1', 'yyyy-mm-dd'),TO_DATE('2017/11/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(4,'�t�ϸ`����',TO_DATE('2017/12/1', 'yyyy-mm-dd'),TO_DATE('2017/12/30', 'yyyy-mm-dd'));

--------------------------�P�P���Ӱ����------------------------------
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(1,1,100);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(2,2,200);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(3,3,250);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(4,4,280);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(5,5,320);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(6,6,340);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(7,7,360);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(8,8,380);

commit;


***********************************************************************************************************************************
SELECT P.PROMOTIONNO, ITEMNO, PRICE,NAME,BEGINDATE,ENDDATE 
FROM PROMOTIONDETAIL P 
JOIN PROMOTION PT ON P.PROMOTIONNO = PT.PROMOTIONNO ;

SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME
FROM PROMOTIONDETAIL P 
JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO)
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = P.ITEMNO;


SELECT SHOPPINGMALL FROM PRODUCT WHERE ITEMNO = 2;
SELECT PICTURE1 FROM SHOPPINGMALL WHERE ITEMNO = 3;
SELECT PICTURE1 FROM SHOPPINGMALL WHERE ITEMNO = 4;
SELECT PICTURE FROM PRODUCT WHERE PDNO = 9;

�x����sql�y�k
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME 
FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) 
JOIN (SELECT * FROM SHOPPINGMALL WHERE NAME='�����')SP  ON SP.ITEMNO = P.ITEMNO


--------------------------------------�d��JOIN��楢��---------------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME FROM 
PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) JOIN 
(SELECT * FROM SHOPPINGMALL WHERE NAME='���A�ۥѦ�')SP ON SP.ITEMNO = P.ITEMNO;
--------------------------------------�d��JOIN��榨�\(INT)----------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS 
SHOPNAME FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) 
JOIN (SELECT * FROM SHOPPINGMALL WHERE ITEMNO=3)SP  ON SP.ITEMNO = P.ITEMNO;
--------------------------------------�d��JOIN��榨�\(String)-------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS 
SHOPNAME FROM PROMOTIONDETAIL P JOIN (SELECT * FROM PROMOTION WHERE NAME='�U�t�`����')PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) 
JOIN (SELECT * FROM SHOPPINGMALL )SP  ON SP.ITEMNO = P.ITEMNO;
--------------------------------------�d�ߩҦ��P�P����--------------------------------
SELECT * FROM PROMOTION ORDER BY PROMOTIONNO;
--------------------------------------�d�ߩҦ��P�P���ʦW��--------------------------------
SELECT NAME FROM PROMOTION;
--------------------------------------�d�ߩҦ��q����O----------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) 
--------------------------------------�d�߯S�w�q����O(�̷ӭq��s��)----------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE OT.ORDERNO='20171025-000001';
--------------------------------------�d�߯S�w�q����O(�̷ӷ|���s��)----------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE MEM_NO=4;
--------------------------------------�d�߯S�w�q����O(�̷Ӥ���¨�s)-------------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) ORDER BY ORDER_DATE ;
--------------------------------------�d�߯S�w�q����O(�̷Ӥ���s����)-------------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) ORDER BY ORDER_DATE DESC;
--------------------------------------�d�߯S�w�q����O(�̷ӷ|���W��)--------------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) ORDER BY CUSTOMER_NAME ;
--------------------------------------�d�ߨS���P�P�������ӫ~(�x���ѻy�k)--------------------------------------
select * from shoppingmall where itemno not in (
   select a.itemno from shoppingmall a right join promotiondetail b on a.itemno = b.itemno
);

--------------------------------------�M�ثe�ɶ��O�_�ŦX�{�b�P�P�`��(�ڬO�x���ѻy�k)-----------------------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME
FROM PROMOTIONDETAIL P 
JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO)
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = P.ITEMNO where to_char(BEGINDATE,'yyyymmdd')<=to_char(sysdate,'yyyymmdd')   
and to_char(ENDDATE,'yyyymmdd')>=to_char(sysdate,'yyyymmdd');

--------------------------------------�d�ߥ����|���q��ӫ~+�P�P����---------------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
--------------------------------------�d�߯S�w�|���q��ӫ~+�P�P����---------------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE OT.ORDERNO='20171030-000040';

--------------------------------------�d�߭q��s���Ҧ��ӫ~+�٨S�����Y�P�P---------------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
WHERE OT.ORDERNO='20171030-000040';
--------------------------------------�έq��s�����X�U�w�ɶ�-----------------------------------------
SELECT ORDER_DATE FROM SHOPORDER WHERE ORDERNO='20171030-000040';
--------------------------------------�Q�η|���q��ɶ��h�d�߷�U���L�P�P-----------------------------------------
SELECT PROMOTIONNO FROM PROMOTION WHERE 
BEGINDATE<to_date('2017-11-01', 'yyyy-mm-dd') 
AND ENDDATE>to_date('2017-10-25', 'yyyy-mm-dd') ;

--------------------------------------�d�߯S�w�|���s���ʶR���ӫ~+�P�P����(�i�]�w�ɶ�+PROMOTIONNO)-----------------------------------------
SELECT OT.ORDERNO,PD.PROMOTIONNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE OT.ORDERNO='20171030-000039' AND PD.PROMOTIONNO=4; 
--------------------------------------�d�߯S�w�|���s���ʶR���ӫ~+�P�P����(�i�]�w�ɶ�)-----------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE OT.ORDERNO='20171030-000040' AND ORDER_DATE<to_date('2017-10-25', 'yyyy-mm-dd') AND ORDER_DATE>to_date('2017-10-1', 'yyyy-mm-dd');


--------------------------------------�d�߯S�w�|���s���ʶR���ӫ~+�P�P����-----------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE MEM_NO='MEM0001';
--------------------------------------�d�ߩҦ��q��----------------------------------------------------------
SELECT ORDERNO FROM SHOPORDER;
