--------DROP ���|SEQ-------
DROP SEQUENCE SHOPCOM_NO_SEQ;
DROP SEQUENCE HCCOM_NO_SEQ;
DROP SEQUENCE CARCOM_NO_SEQ;
DROP SEQUENCE MEALCOM_NO_SEQ;
--------DROP ���|SEQ-------

-------DROP �e�\SEQ--------
DROP SEQUENCE menu_seq;
DROP SEQUENCE mealStaffSchedule_seq;
DROP SEQUENCE mealOrderDetail_seq;
DROP SEQUENCE mealOrder_seq;
DROP SEQUENCE setMeal_seq;
DROP SEQUENCE dish_seq;
-------DROP �e�\ SEQ--------

------DROP ����SEQ------
DROP SEQUENCE cartype_seq;
DROP SEQUENCE carschedul_seq;
DROP SEQUENCE carorder_seq;
DROP SEQUENCE cardetail_seq;
DROP SEQUENCE vehicle_seq;
------DROP ����SEQ------
--------DROP ����SEQ----------
DROP SEQUENCE HEALTHNO_SEQ;
DROP SEQUENCE NEWSNO_SEQ;
DROP SEQUENCE EMPSEVNO_SEQ;
--------DROP ����SEQ----------

--------DROP ����SEQ-----
DROP SEQUENCE HC_ORDER_DETAIL_NO_SEQ;
DROP SEQUENCE HC_COMPLAIN_NO_SEQ;
DROP SEQUENCE HC_ORDER_NO_SEQ;
--------DROP ����SEQ-----

---------DROP �ӫ�SEQ-------------
DROP sequence FORSHOPORDER;
DROP sequence FORSHOPITEM;
DROP sequence FORPROMOTION;
----------DROP �ӫ�SEQ-------------

----------------DROP �|�� ���uSEQ----------------
DROP SEQUENCE SEQ_EMPLOYEE;
DROP SEQUENCE SEQ_EMPPHOTONO;
DROP SEQUENCE SEQ_EXPERT;
DROP SEQUENCE SEQ_MEMBER;
DROP SEQUENCE SEQ_BALANCETOPUPNO;
DROP SEQUENCE SEQ_THECARED;
----------------DROP�|�� ���uSEQ----------------


---------------------------------DROP ���|TABLE------------------------------------- 

DROP TABLE SHOPAPPEALSCOMPLAIN;
DROP TABLE HCCOMPLAIN;
DROP TABLE CARCOMPLAIN;
DROP TABLE MEALORDERCOMPLIN;

---------------------------------DROP ���|TABLE------------------------------------- 

-----------------DROP ����TABLE----------------
DROP TABLE HEALTHNEWSDETAIL;
DROP TABLE NEWSDETAIL;
DROP TABLE EMPSERVICEDETAIL;
-----------------DROP ����TABLE----------------

----------------DROP �ӫ�TABLE--------------
DROP TABLE PROMOTIONDETAIL;
DROP TABLE PROMOTION;
DROP TABLE ORDERDETAIL;
DROP TABLE SHOPORDER;
DROP TABLE ShoppingMall;
DROP TABLE CLASSSTYLE;
----------------DROP �ӫ�TABLE--------------

--------DROP ����TABLE---------------------
DROP TABLE HC_WORKSHIFTS;
DROP TABLE HC_ORDER_DETAIL;
DROP TABLE HC_ORDER_MASTER;
--------DROP ����TABLE----------------------

--------DROP �e�\TABLE----------------------
DROP TABLE MEAL_STAFF_SCHEDULE;
DROP TABLE MEAL_ORDER_DETAIL;
DROP TABLE MEAL_ORDER;
DROP TABLE MENU;
DROP TABLE SET_MEAL;
DROP TABLE DISH;
--------DROP �e�\TABLE----------------------


---DROP ����TABLE-----------
DROP TABLE CAR_SCHEDUL;
DROP TABLE CAR_DETAIL;
DROP TABLE CAR_ORDER;
DROP TABLE VEHICLE;
DROP TABLE CARTYPE;
---DROP ����TABLE-----------

---DROP �|�� ���uTABLE-----------
DROP TABLE BALANCE;
DROP TABLE EMP_PHOTOS;
DROP TABLE BRANCHES;
DROP TABLE THECARED;
DROP TABLE EXPERT;
DROP TABLE EXPERT_LIST;
DROP TABLE EMPLOYEE;
DROP TABLE MEMBER;
---DROP �|�� ���uTABLE-----------
------------------------------------------------------------------
--------------------------�s�WTable-----------------------------------
-------------------------------------------------------------
--EMP0001~EMP9999
--EPH0001~EPH9999
--EXP0001~EXP9999
--MEM0001~MEM9999
--TPP1701001~TPP1712999
--CRD0001~CRD9999
-------------------------------------------------------------

CREATE SEQUENCE SEQ_EMPLOYEE
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EMPPHOTONO
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_MEMBER
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_BALANCETOPUPNO
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_THECARED
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EXPERT
START WITH 0001
INCREMENT BY 1;

-------------------------------------------------------------

CREATE TABLE EMPLOYEE(
	EMP_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	EMP_NAME VARCHAR2(15) NOT NULL,
	EMP_PHONE VARCHAR2(15) NOT NULL,
	EMP_GENDER VARCHAR2(15) NOT NULL,
	EMP_EMAIL VARCHAR2(30) NOT NULL,
	EMP_DEP VARCHAR2(15) NOT NULL,
	AUTHORITY_NO VARCHAR2(15) NOT NULL,
	EMP_TITLE VARCHAR2(15) NOT NULL,
	ON_BOARD_DATE DATE,
	EMP_ID VARCHAR2(15) NOT NULL,
	EMP_PWD VARCHAR2(15) NOT NULL, 
	EMP_STATUS VARCHAR2(15) DEFAULT 'ON',
	EMP_BRANCHES VARCHAR2(10) NOT NULL,
 	EMP_UPDATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�Ѹ��G', '0912000101', 'M','careU@care.com', '�`��', '�޲z��', '�g�z', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'B00001', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�]�|��', '0912000101', 'F','care1@care.com', '����', '���ӤH��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00001', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�I��', '0912000101', 'F','care2@care.com', '����', '���ӤH��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00002', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�p��', '0912000101', 'F','care3@care.com', '����', '���ӤH��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00003', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '���ȫ�', '0912000101', 'F','care4@care.com', '����', '���ӤH��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00004', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�j��',' 0912000101', 'F','care5@care.com', '����', '���ӤH��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00005', 'pw0000', '10');


INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�P��', '0912000101', 'M','care6@care.com', '����', '�����H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00006', 'pw0000', '10');
INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�e��', '0912000101', 'M','care7@care.com', '����', '�����H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00007', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '?��', '0912000101', 'M','care8@care.com', '����', '�����H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00008', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '����', '0912000101', 'M','care9@care.com', '����', '�����H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00009', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '����', '0912000101', 'M','care10@care.com', '����', '�����H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00010', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�f��', '0912000101', 'M','care11@care.com', '�e�\', '�e�\�H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00011', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '���W', '0912000101', 'M','care12@care.com', '�e�\', '�e�\�H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00012', 'pw0000', '10');
INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�i��', '0912000101', 'M','care13@care.com', '�e�\', '�e�\�H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00013', 'pw0000', '10');
INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '����', '0912000101', 'M','care14@care.com', '�e�\', '�e�\�H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00014', 'pw0000', '10');

INSERT INTO EMPLOYEE (
EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) 
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�i��', '0912000101', 'M','care15@care.com', '�e�\', '�e�\�H��', '�M��', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 'A00015', 'pw0000', '10');

----------------------------------------------------------------------------------------
CREATE TABLE EMP_PHOTOS(
	EMP_PHOTO_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	EMP_NO VARCHAR2(10) NOT NULL,
	EMP_PHOTO BLOB,
CONSTRAINT FK_EMP_PHOTOS_EMPLOYEE
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

INSERT INTO EMP_PHOTOS (EMP_PHOTO_NO,EMP_NO) 
VALUES (to_char('EPHMEM'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')), 'EMP0001');

--------------------------------------------------------------------------------------

CREATE TABLE EXPERT_LIST(
	EXP_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	EXP_NAME VARCHAR2(30),
	EXP_SPEC VARCHAR2(100)
);

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC) VALUES ('101','���ŷ��U�A�ȭ�',
'������U,�ͬ����U,�a�ȳB�z,���ηN�~�ƥ�B�z,�a�x���,¾�~�۲z');

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC) 
VALUES('102','�A�ŷ��U�A�ȭ�','������U,�ͬ����U,�a�ȳB�z,���ηN�~�ƥ�B�z,�a�x���,¾�~�۲z');

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC)
VALUES('201','�����@�h����', '���d���D���@�z����,�w���O�@���@�z���I,�@�z���ɤοԸ�,�������U�欰');

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC) 
VALUES ('202','�����@�z�v����', '���d���D���@�z����,�w���O�@���@�z���I,�@�z���ɤοԸ�,�������U�欰');


---------------------------------------------------------------------------------------


CREATE TABLE EXPERT(
	EXP_OWN VARCHAR2(10) PRIMARY KEY NOT NULL,
	EMP_NO VARCHAR2(10) NOT NULL,
	EXP_NO VARCHAR2(10) NOT NULL,
CONSTRAINT FK_EXPERT_EMPLOYEE
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
CONSTRAINT FK_EXPERT_EXPERT_LIST
FOREIGN KEY(EXP_NO) REFERENCES EXPERT_LIST(EXP_NO)
);

INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0003','101');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0004','102');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0005','201');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0006','202');


-------------------------------------------

CREATE TABLE BRANCHES(
	EMP_BRANCHES VARCHAR2(10) PRIMARY KEY NOT NULL,
	BRC_LAT NUMBER(8,5) NOT NULL,
	BRC_LON NUMBER(8,5) NOT NULL,
	BRC_NAME VARCHAR2(15)
);

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('10',25.04644, 121.51768,'TAIPEI');

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('20',24.96781, 121.19163,'TAOYUAN');

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('30',22.99930,120.21387,'TAINAN');

----------------------------------



CREATE TABLE MEMBER(
	MEM_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	MEM_NAME VARCHAR2(15) NOT NULL,
	MEM_PHONE VARCHAR2(10) NOT NULL,
	MEM_GENDER VARCHAR2(15) NOT NULL,
	MEM_EMAIL VARCHAR2(30) NOT NULL,
	ADDRESS CLOB NOT NULL,
	POINT NUMBER(20) DEFAULT 0,
	MEM_ID VARCHAR2(15) NOT NULL,
	MEM_PWD VARCHAR2(15) NOT NULL,
	MEM_SRATUS VARCHAR2(15) DEFAULT'������',
	CHK_IP VARCHAR2(15),
 	MEM_LOGINTIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
�@�@ �@�@�@
INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'�i��', '0912000101', 'M','mem01@gmail.com', '��饫���c�Ϥ��j��300��','mem01', 'pw0000',current_timestamp,15000);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'�B��', '0912000101', 'M','mem02@gmail.com', '��饫���c�Ϥ��j��300��','mem02', 'pw0000',current_timestamp,15000);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'�]�v', '0912000101', 'M','mem03@gmail.com', '��饫���c�Ϥ��j��300��','mem03', 'pw0000',current_timestamp,15000);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'���', '0912000101', 'M','mem04@gmail.com', '��饫���c�Ϥ��j��300��','mem04', 'pw0000',current_timestamp,15000);

------------------------------------------------------


CREATE TABLE BALANCE(
	TOPUP_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	MEM_NO VARCHAR2(10) NOT NULL,
	TOPUP_VALUE NUMBER(20) NOT NULL,
	TOPUP_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	TOPUP_WAY VARCHAR2(15) NOT NULL,
	STATUS VARCHAR2(15) DEFAULT 'OK',
CONSTRAINT FK_BALANCE_MEMBER
FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)	
);

INSERT INTO BALANCE(TOPUP_NO, MEM_NO,TOPUP_VALUE,TOPUP_WAY)
VALUES(to_char('TPP'||to_char(sysdate,'yymm')||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),3,'0')),'MEM0001',10000,'CREDIT');


--------------------------------------------------

CREATE TABLE THECARED(
	CARED_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	MEM_NO VARCHAR2(10) NOT NULL,
	CARED_NAME VARCHAR2(15) NOT NULL,
	CARED_GENDER VARCHAR2(15) NOT NULL,
	KINSHIP VARCHAR2(15) NOT NULL,
	CARED_HEIGHT NUMBER(5) NOT NULL,
	CARED_WEIGHT NUMBER(5) NOT NULL,
	CARED_ADDRESS VARCHAR2(100) NOT NULL,
	CARED_PHONE VARCHAR2(10) NOT NULL,
	CON_STATUS VARCHAR2(30) NOT NULL,
	BIO_STATUS VARCHAR2(30) NOT NULL,
	MODIFY_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT FK_THECARED_MEMBER
FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);

INSERT INTO THECARED (CARED_NO,MEM_NO,CARED_NAME,CARED_GENDER,KINSHIP, CARED_HEIGHT,CARED_WEIGHT,CARED_ADDRESS,CARED_PHONE,CON_STATUS,BIO_STATUS)
VALUES(to_char('CRD'||LPAD(to_char(SEQ_THECARED.NEXTVAL),4,'0')), 'MEM0002','�B��', 'M','����',170,60, '��饫����ϩ������G�q221��','0988001001','����','����');

INSERT INTO THECARED (CARED_NO,MEM_NO,CARED_NAME,CARED_GENDER,KINSHIP, CARED_HEIGHT,CARED_WEIGHT,CARED_ADDRESS,CARED_PHONE,CON_STATUS,BIO_STATUS)
VALUES(to_char('CRD'||LPAD(to_char(SEQ_THECARED.NEXTVAL),4,'0')),'MEM0002','�B��', 'F','����',170,60, '��饫����ϩ������G�q221��','0988001001','����','����');

INSERT INTO THECARED (CARED_NO,MEM_NO,CARED_NAME,CARED_GENDER,KINSHIP, CARED_HEIGHT,CARED_WEIGHT,CARED_ADDRESS,CARED_PHONE,CON_STATUS,BIO_STATUS)
VALUES(to_char('CRD'||LPAD(to_char(SEQ_THECARED.NEXTVAL),4,'0')), 'MEM0003','�i���d��', 'F','����',170,60, '��饫����ϩ������G�q100��','0988001001','����','����');


COMMIT;


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
CUSTOMER_phone VARCHAR2(15),
CUSTOMER_NAME VARCHAR2(80),
CONSTRAINT FK_MEMBERNO  FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);

----------------�ӫ~�q�氲���------------------
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0001',TO_DATE('2017/5/5', 'yyyy-mm-dd'),'�x�_���s��','0926','�Q��s�Ӥ�');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0002',TO_DATE('2010/4/5', 'yyyy-mm-dd'),'�H���x�n��','0918','�˺Ƴ�����');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0003',TO_DATE('2013/2/9', 'yyyy-mm-dd'),'�H���x�n��','0800','�k�|�{�Ҥ��إ���Ĥ@���-���Ӥ�');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0004',TO_DATE('1950/4/5', 'yyyy-mm-dd'),'�x�_���s��','0987','�x�W���^��');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0004',TO_DATE('1966/12/5', 'yyyy-mm-dd'),'�x�_���s��','0926','���@�p�̰��^�E');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0001',TO_DATE('1960/5/5', 'yyyy-mm-dd'),'�����̪F��','0926','�ª����n��');


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


-------------------------------�P�P�M�ש��Ӹ��-----------------------------------------------
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(1,1,100);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(2,2,200);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(3,3,250);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(4,4,280);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(4,5,320);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(4,6,340);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(4,7,360);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(4,8,380);

COMMIT;
--------CREATE ����SEQ-----
CREATE SEQUENCE HC_ORDER_NO_SEQ
INCREMENT BY 1
START WITH 500001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE HC_ORDER_DETAIL_NO_SEQ
INCREMENT BY 1
START WITH 600001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE HC_COMPLAIN_NO_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------CREATE ����SEQ-----

---------���u�Z��-------------------------------------------------------------------------------------------------------

CREATE TABLE HC_WORKSHIFTS(
MONTH_OF_YEAR VARCHAR2(5) ,
EMP_NO VARCHAR2(10) ,
WORK_SHIFT_STATUS VARCHAR2(279),
TOTAL_WORK_SHIFTS NUMBER(3,0),
PRIMARY KEY (MONTH_OF_YEAR,EMP_NO),
CONSTRAINT FK_EMP_NO1 FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE (EMP_NO)
);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0002','�����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����ť���������������������������',44);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0003','���������������������������𦭤��Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ�����',44);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0004','�����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����ť��������������������������𦭤��Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ����Ŧ�����',44);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0005','���űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߥ���������������������������',44);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0006','���������������������������𦭪űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��űߦ��ű�',44);


CREATE TABLE HC_ORDER_MASTER (
ORDER_NO VARCHAR2(15) PRIMARY KEY,
MEM_NO VARCHAR2(10),
ORDER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CARED_NO VARCHAR2(10),
ORDER_STATUS VARCHAR2(15),
CONSTRAINT FK_MEM_NO FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO),
CONSTRAINT FK_CARED_NO FOREIGN KEY (CARED_NO) REFERENCES THECARED (CARED_NO)
);



INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',CURRENT_TIMESTAMP,'CRD0001','���T�{');
INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',CURRENT_TIMESTAMP,'CRD0002','�w�T�{');
INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',CURRENT_TIMESTAMP,'CRD0001','�A�Ȥ�');
INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',CURRENT_TIMESTAMP,'CRD0002','�w����');
INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0003',CURRENT_TIMESTAMP,'CRD0003','�w����');


CREATE TABLE HC_ORDER_DETAIL (
ORDER_DETAIL_NO VARCHAR2 (15) PRIMARY KEY,
ORDER_NO VARCHAR2(15),
SERVICE_DATE DATE,
SERVICE_TIME VARCHAR2(15),
EMP_NO VARCHAR2(7),
ORDER_DEDIAL_STATUS VARCHAR2(15),
CONSTRAINT FK_ORDER_NO1 FOREIGN KEY (ORDER_NO) REFERENCES HC_ORDER_MASTER (ORDER_NO),
CONSTRAINT FK_EMP_NO2 FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE (EMP_NO),
constraint CSTNT_HC_ORDER_DETAIL unique (ORDER_NO, SERVICE_DATE, SERVICE_TIME,EMP_NO)
);


INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD('500001',6,'0'),to_date('2017/10/17','yyyy/mm/dd'),'�W��','EMP0001','�w����');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD('500002',6,'0'),to_date('2017/10/17','yyyy/mm/dd'),'�W��','EMP0002','�w����');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD('500003',6,'0'),to_date('2017/10/17','yyyy/mm/dd'),'�W��','EMP0003','�w����');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD('500004',6,'0'),to_date('2017/10/17','yyyy/mm/dd'),'�W��','EMP0004','�w����');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD('500005',6,'0'),to_date('2017/11/17','yyyy/mm/dd'),'�W��','EMP0005','������');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD('500005',6,'0'),to_date('2017/11/18','yyyy/mm/dd'),'�W��','EMP0005','������');

COMMIT;



--���--
CREATE TABLE DISH(
DISH_NO NUMBER(10) PRIMARY KEY NOT NULL,
DISH_NAME VARCHAR2(60),
DISH_PIC BLOB,
DISH_INTRO VARCHAR2(3000),
DISH_TYPE VARCHAR2(15)
);
 
--���ۼW�D��--
CREATE SEQUENCE dish_seq
INCREMENT BY 1
START WITH 101
NOMAXVALUE
NOCYCLE;



--�M�\--
CREATE TABLE SET_MEAL(
SM_NO NUMBER(10) PRIMARY KEY NOT NULL,
SM_NAME VARCHAR2(60),
SM_PRICE NUMBER(5) CHECK(SM_PRICE>=0),
SUPPLY NUMBER(5) CHECK(SUPPLY>=0),
SM_PIC1 BLOB,
SM_PIC2 BLOB,
SM_PIC3 BLOB,
SM_INTRO VARCHAR2(3000)
);
 
--�M�\�ۼW�D��--
CREATE SEQUENCE setMeal_seq
INCREMENT BY 10
START WITH 10
NOMAXVALUE
NOCYCLE;

--�e�\�q��--
CREATE TABLE MEAL_ORDER(
MO_NO VARCHAR2(15) PRIMARY KEY NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
MO_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
MO_STATUS VARCHAR2(15) NOT NULL,
RCPT_NAME VARCHAR2(15) NOT NULL,
RCPT_ADD VARCHAR2(100) NOT NULL,
RCPT_PHONE VARCHAR2(10) NOT NULL,
CONSTRAINT MEAL_ORDER_MEM_NO_FK FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);
 
--�e�\�q��ۼW�D��--
CREATE SEQUENCE mealOrder_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;

--�e�\�q�����--
CREATE TABLE MEAL_ORDER_DETAIL(
MO_DETAIL_NO VARCHAR2(15) PRIMARY KEY NOT NULL,
MO_NO VARCHAR2(15) NOT NULL,
DELIVER_DATE DATE NOT NULL,
DELIVER_TIME VARCHAR2(15) NOT NULL,
SM_NO NUMBER(10) NULL,
ORDER_QTY NUMBER(5) NOT NULL,
CONSTRAINT MO_DET_MO_NO_FK FOREIGN KEY (MO_NO) REFERENCES MEAL_ORDER(MO_NO),
CONSTRAINT MO_DET_SM_NO_FK FOREIGN KEY (SM_NO) REFERENCES SET_MEAL(SM_NO)
);
 
 
--�e�\�q����ӦۼW�D��--
CREATE SEQUENCE mealOrderDetail_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;

 
--�e�\�H���Z��--
CREATE TABLE MEAL_STAFF_SCHEDULE(
SERIAL_NO NUMBER(10) PRIMARY KEY NOT NULL,
EMP_NO VARCHAR2(10) NOT NULL,
YEAR_MONTH VARCHAR2(6)  NOT NULL,
WORK_STATE VARCHAR2(93) ,
CONSTRAINT SCHEDULE_EMP_NO_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);
 
--�e�\�H���Z��ۼW�D��--
CREATE SEQUENCE mealStaffSchedule_seq
INCREMENT BY 1
START WITH 5001
NOMAXVALUE
NOCYCLE;
 

--�M�\����--

CREATE TABLE MENU(
MEMU_NO NUMBER(10) PRIMARY KEY NOT NULL,
MENU_OF_YEAR NUMBER(4),
WEEK_OF_YEAR NUMBER(2),
DAY_OF_WEEK NUMBER(1),
SM_NO NUMBER(10),
MEALTIME VARCHAR2(10),
RICE_NO NUMBER(10),
MAIN_MEAL_NO NUMBER(10),
VEGETABLE_NO NUMBER(10),
DESSERT_NO NUMBER(10),
SOUP_NO NUMBER(10),
DRINK_NO NUMBER(10),
CONSTRAINT MENU_RICE_NO_FK FOREIGN KEY(RICE_NO) REFERENCES DISH(DISH_NO),
CONSTRAINT MENU_MAIN_MEAL_NO_FK FOREIGN KEY(MAIN_MEAL_NO) REFERENCES DISH(DISH_NO),
CONSTRAINT MENU_VEGETABLE_NO_FK FOREIGN KEY(VEGETABLE_NO) REFERENCES DISH(DISH_NO),
CONSTRAINT MENU_DESSERT_NO_FK FOREIGN KEY(DESSERT_NO) REFERENCES DISH(DISH_NO),
CONSTRAINT MENU_SOUP_NO_FK FOREIGN KEY(SOUP_NO) REFERENCES DISH(DISH_NO),
CONSTRAINT MENU_DRINK_NO_FK FOREIGN KEY(DRINK_NO) REFERENCES DISH(DISH_NO)
);



--�M�\����ۼW�D��--
CREATE SEQUENCE menu_seq
INCREMENT BY 1
START WITH 10001
NOMAXVALUE
NOCYCLE;


COMMIT;

--�s�W���--
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�n�ʶ�','�n�ʤ��t���״I�����ͯ�E�M�]-�J�ڽ����C���ͯ�E�㦳�ܱj���ܮ�Ƨ@�ΡA�঳�Ħa�O�@����K���@�Ǯ�ۥѰ�M�L��ƪ����l�`�A���U��W�i�ֽ��P�H�������d�C���U�����M���f���o�|�P�ͪ��C','�̭�');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�W�̶�','�W�̤������R�M�F�޳����t���״I�����ͯ��лPE�A��W�j�H��K�̥\��A�P�i��G�`���A�ٯ����U�H�̮����q���ļ�������A�ϤH�R�����O�C','�̭�');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�M�]����','�ťк�������A�H���Q�֪o���i�N�覡�A���������A�צ۵M�B�{�X�ӡA�B�����t���״I�����ͯ�A��D�A�I�t�h�������M�תջġA�����}�i�H�l���쨬������i','�D��');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'������','���ѩһݪ����ͯ�B12�A���U�����y���Φ��C�W�i���g�t�Ϊ����d�C�i�H���U�����B���ɺίv�~��F���ׯണ���q����ִSe�H�饲�ݪ��L�q�����A�O���Ī��ܮ�ƾ��M�ۥѰ�M�����C�i�H��w�ѤơA���U������´���X�n�ʡC','�D��');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�K������','�|���ɦ�A�|�g�l�ɮ�A�G�K�ô��O������ɡA�ɮ�i��A�ܰI�ѡA�W�j�K�̤O�A�ղz��z���C','���~');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�ªo�g���L��','�I�t�t�B�K�B�����M�תջġA���״I���L�RE��B1�C','���~');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�����sŽ��','�t�״I�����ͯ�A�BB1�BB2�ι[�B�t�B��B�C�B�K�B�N���h����i���A���U�����ֽ��B��Ŧ�ί��g�t�Ϊ����`�\��C���U��������`�������C�ӥB���q���C�A�h���Υi�U���ơA�[�W�ťк�߬D��4�Ӥ�H�W�������i����A�h���H�ʡA�ϱo�sŽ������S�i�f�C','����');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'���A��Ī��','Ī�����P�ʽ���A���״I���ֺ���A���ͯ�A�BC�BE�γJ�ս賣���״I�A�i�P�i�z�Dį�ʡC�W�[�����P�C���T�K����X�n�ө���ƥX�C','����');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'���ǻȦմ�','�Ȧ��A�����ߤ����a�A�������Ħ����ĩʦh�}������A��W�j�H�骺�K�̤O�A�B�I�t���ͯ�D�A�ਾ��t���y���A�������ѵM�Ӫ��ʽ���A�������@�ΡA�f�t���ǯq��i�ǡB�ɦ�i�C�C','���~');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�������̤p������','���ͯ�B1��B2�B���ġB�J�ս�B�תյ��h����i����A�H���K�B�N�B�t�B�C���H��һ��q�������C','���~');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'���d��','��C�馭�\���ѡA�\�Ĩ㦳�M���B�Ѭr�B�Q�͡B�ɤ��q��B�����~�Q�����\�ġA��W�j�K�̤O�ܯf�r�A���ӵߥͪ��A�ùw���X��B���ȼ����o�͡C','���~');
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE)
VALUES(dish_seq.NEXTVAL,'�i�x��','���N��10�p�ɡA���L�Ĩ��A��ͬz����B�����~�B�筷�M��B�������A�㦳�O�x�B�ɮ�B�i��B�w���i�w�M�Ŀ����ĩʡC','���~');

--�s�W�M�\--
INSERT INTO SET_MEAL(SM_NO,SM_NAME,SM_PRICE,SUPPLY,SM_INTRO)
VALUES(setMeal_seq.NEXTVAL,'���O�i���\',150,300,'�s�@�N���Ⱦv�ڰl�D����W�����d�A���Q�B�֪o�k�M�����s�������[���A�D�p�ϥΦh�\���̶��f�t�A�ĭ����H�ΨC�����s�A���f�ΦX�����׫~�C
��ı���ӷP���Ⱦv�ڦY�F��ɱ`ı�o���M�L���A�����@�ݤW��N�r�[�Q�ڡB��o�A�ܮe���Y�i�L�q���u�A�y������W���t��îI�U�C�ʯe�f�����I�C
��ꭹ�����D�ä��u���u�Сv���@�ءA�D�p�B�η�u�����õ��έ����S��������A�N�i�H���Ʋz���Q�֪o�]�����C');


INSERT INTO SET_MEAL(SM_NO,SM_NAME,SM_PRICE,SUPPLY,SM_INTRO)
VALUES(setMeal_seq.NEXTVAL,'�e�f���d�\',150,300,'�C�ʯe�f���o�͡A�q�`���H�ۦ~�֪��ѤơA�����ֿn�����������ũΥͬ����A�����`�A�ɭP�Ͳz�ո`����ΥN�»�ê�A�ɭP�e�f�o�͡A�]���A�ݭn�ղz�����u�O�u�Ȫ����f�L�{�A��O�������վi�C�Ӧb��`�ͬ����A�̮e���A��γ̤��e���Q�ﵽ���A�Y�O�������e���վ�I�\�h�e�f����z�L�����������o�ﵽ�A��֪A���Ī��ҳy�����x�ǭt��A�i�ө��w�e�f�i�i�C�Ҧp�G�}���f�w�̻ݭn�w�ɩw�q�H�ΧCGI���\�I�A�H���ı����}í�w�סF�������w�̻ݭn���Q�B���u�B�C�תժ��\�I�A�H��֤������d���ΩM�ﵽ��G�H�Y�סA�i�ӱ�������A�קK����޷N�~(����)���X�֯g�F��Ŧ�f�w�̫h�ݭ����B���[�B���J���\�I�A�H��w��Ŧ�I�ܳt�סC');


INSERT INTO SET_MEAL(SM_NO,SM_NAME,SM_PRICE,SUPPLY,SM_INTRO)
VALUES(setMeal_seq.NEXTVAL,'�N��ղz�\',150,300,'��N�Ӯ�˦�A�l�ΤH�骺����A�h����������A�ή𳱨�ˡA����å��M���{�H�C�N�����]����z�A���h�����ɮ�i�媺�����C
��N�᪺�����A�H������_��N����l�ˡB��_��O���D�n�ت��F�N�ᶼ���h�n�A��ɥR��i�M���q�A�������J�թM�I�t���ͯ��������C
�ѩ�U�褣�_���߰ݡA���~�M�~�ζ��S�O�W�� [��N���\] �����U��b���ꪺ�j�a�ӸѨM��N��"�Y"�����D�C���~�n���z�̧��㪺�����p�e�A���z���P������Ū���i�A�b�̧֪��ɶ������z�ɯq���B��_��O�C');




--�s���e�\�q��--
INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrder_seq.NEXTVAL),6,'0'),'MEM0001','���B�z','�T����','��饫���c�Ϥ��j��300��','0987390369');
INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrder_seq.NEXTVAL),6,'0'),'MEM0002','���B�z','�����@','��饫���c�Ϥ��j��300��','0987390369');


--�s�W�e�\�q�����--
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000001',to_date('2017-10-16', 'yyyy-mm-dd'),'���\',10,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000001',to_date('2017-10-17', 'yyyy-mm-dd'),'���\',10,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000001',to_date('2017-10-18', 'yyyy-mm-dd'),'���\',10,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-10-20', 'yyyy-mm-dd'),'�ȱ��\',20,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-10-21', 'yyyy-mm-dd'),'�ȱ��\',20,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-10-23', 'yyyy-mm-dd'),'�ȱ��\',20,1);





--�s�W�e�\�H���Z��--\
INSERT INTO MEAL_STAFF_SCHEDULE
VALUES(mealStaffSchedule_seq.NEXTVAL,'EMP0012','201710','���ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ��ץ�');





--�s�W����--
INSERT INTO MENU
VALUES(menu_seq.NEXTVAL,2017,30,2,10,'���\',101,103,105,107,109,111);
INSERT INTO MENU
VALUES(menu_seq.NEXTVAL,2017,30,2,10,'���\',102,104,106,108,110,112);
INSERT INTO MENU
VALUES(menu_seq.NEXTVAL,2017,30,2,10,'���\',101,104,106,108,109,110);


COMMIT;


--1.����:�ۼW�D���----------------------------------------------------------------
CREATE SEQUENCE cartype_seq
INCREMENT BY 1
START WITH 1001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE carschedul_seq
INCREMENT BY 1
START WITH 1001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE carorder_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE cardetail_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE vehicle_seq
INCREMENT BY 1
START WITH 1001
NOMAXVALUE
NOCYCLE
NOCACHE;

commit;
--2.����:�s�W����----------------------------------------------------------------

 CREATE TABLE CARTYPE(
 CARTYPE_NO                 NUMBER(10) NOT NULL,
 CARTYPE_NAME               VARCHAR2(60) NOT NULL,
 DESCRIPTION                VARCHAR2(300) NOT NULL,
 RENTAL_RATES               NUMBER(10)   NOT NULL,
 CAR_PIC                    BLOB,
 
 CONSTRAINT CARTYPE_NO_PRIMARY_KEY PRIMARY KEY (CARTYPE_NO));
 ------------------------------------------------------------------------------
 CREATE TABLE VEHICLE(
 VEHICLE_NO                NUMBER(10) NOT NULL,
 CARTYPE_NO                NUMBER(10) NOT NULL,
 EMP_NO                    VARCHAR2(10) NOT NULL,
 LICENSEPLATE_NO           VARCHAR2(8) NOT NULL,
 COLOR                     VARCHAR2(15) NOT NULL,
 VEHICLE_YEAR              VARCHAR2(15) NOT NULL,
 EMP_BRANCHES              VARCHAR2(10) NOT NULL,
 
 CONSTRAINT VEHICLE_NO_PRIMARY_KEY PRIMARY KEY (VEHICLE_NO),
 CONSTRAINT VEHICLE_CAR_TYPE_FK FOREIGN KEY(CARTYPE_NO) REFERENCES CARTYPE(CARTYPE_NO),
 CONSTRAINT VEHICLE_EMP_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
 CONSTRAINT VEHICLE_BRANCHES_FK FOREIGN KEY (EMP_BRANCHES)REFERENCES BRANCHES (EMP_BRANCHES));
  ------------------------------------------------------------------------------
 CREATE TABLE CAR_ORDER(
 ORDER_NO                  VARCHAR2(15) NOT NULL,
 MEM_NO                    VARCHAR2(10) NOT NULL, 
 ORDER_DATE                TIMESTAMP(6), 
 ORDER_STATUS              VARCHAR2(15) NOT NULL, 
 
 CONSTRAINT ORDER_NO_PRIMARY_KEY PRIMARY KEY (ORDER_NO),
 CONSTRAINT CAR_ORDER_MEM_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO));
 ------------------------------------------------------------------------------
 CREATE TABLE CAR_DETAIL(
 DETAIL_NO                VARCHAR2(15) NOT NULL,
 ORDER_NO                 VARCHAR2(15) NOT NULL,
 VEHICLE_NO               NUMBER(10)   NOT NULL,
 DETAIL_DATE              DATE         NOT NULL,
 DETAIL_TIME              VARCHAR2(15) NOT NULL,
 PASSENGER_NAME           VARCHAR2(15) NOT NULL,
 PASSENGER_PHONE          NUMBER(10)   NOT NULL,
 GETINTO_ADDRESS          VARCHAR2(100)NOT NULL,
 ARRIVAL_ADDRESS          VARCHAR2(100)NOT NULL,
 SENDCAR_STATUS           VARCHAR2(15) NOT NULL,
 
 CONSTRAINT DETAIL_NO_PRIMARY_KEY PRIMARY KEY (DETAIL_NO),
 CONSTRAINT DETAIL_VEHICLE_FK FOREIGN KEY (VEHICLE_NO)REFERENCES VEHICLE (VEHICLE_NO),
 CONSTRAINT DETAIL_CARORDER_FK FOREIGN KEY(ORDER_NO) REFERENCES CAR_ORDER(ORDER_NO));
  ------------------------------------------------------------------------------
  CREATE TABLE CAR_SCHEDUL(
 SERIAL_NO              NUMBER(10) NOT NULL,
 EMP_NO                 VARCHAR2(10) NOT NULL,
 YEAR_MONTH             DATE NOT NULL,
 ATTENDANCE             VARCHAR2(279) NOT NULL,
 WORK_HOURS             NUMBER(10,0) NOT NULL,
 
 CONSTRAINT SC_SERIAL_NO_PRIMARY_KEY PRIMARY KEY (SERIAL_NO),
 CONSTRAINT CAR_SCHEDUL_EMP_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO));

commit;
 --����ƫإ�:���u-------------------------------------------------------------
INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '�i�T', '0919123456', 'M','ScottZHolmes@jourrapide.com', '����', '�����H��', '�M��', TO_DATE('2017/02/03 ', 'yyyy/mm/dd '), 'A1234567', 'A1234567','on', '10',CURRENT_TIMESTAMP);
INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '���|', '0919123123', 'M','JackALong@teleworm.us', '����', '�����H��', '�M��', TO_DATE('2013/05/22 ', 'yyyy/mm/dd '), 'B1234567', 'B1234567','on', '10',CURRENT_TIMESTAMP);
INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '����', '0933475532', 'M','JamesGMarsh@jourrapide.com', '����', '�����H��', '�M��', TO_DATE('2014/10/02 ', 'yyyy/mm/dd '), 'C1234567', 'C1234567','on', '10',CURRENT_TIMESTAMP);
commit;
--����ƫإ�:����-------------------------------------------------------------------
 INSERT INTO CARTYPE VALUES (cartype_seq.NEXTVAL,'�|�H�y','���ةШ��A���ɤp�a�x�X�C�A��',1000,null);
 INSERT INTO CARTYPE VALUES (cartype_seq.NEXTVAL,'�C�H�y','��Ȩ��A��a�w�־A�X�W�s�U��',1800,null);
 INSERT INTO CARTYPE VALUES (cartype_seq.NEXTVAL,'�E�H�p��','�p�ڤh�A�ӳ����ө@���٨ӥ��k',7500,null);
 commit;
--����ƫإ�:����-------------------------------------------------------------------
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0001','ABC7001','�D�ʬ�','2011',10);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1002','EMP0002','ABC7002','���`��','2012',10);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1003','EMP0003','ABC7003','�ï]��','2013',10);
commit;
--����ƫإ�:�����q��-------------------------------------------------------------------
INSERT INTO CAR_ORDER�@VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0001',CURRENT_TIMESTAMP,'A');
INSERT INTO CAR_ORDER�@VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0002',CURRENT_TIMESTAMP,'A');
INSERT INTO CAR_ORDER�@VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0003',CURRENT_TIMESTAMP,'A');
commit;
--����ƫإ�:��������-------------------------------------------------------------------
INSERT INTO CAR_DETAIL�@VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/10/25','YYYY/MM/DD'),'O','������',0963117220,'��饫���c�Ϥ��j��300��','��饫����ϼs����77��','A');
INSERT INTO CAR_DETAIL�@VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/10/25','YYYY/MM/DD'),'M','���ط~',0963117220,'�x�����n�ٰϤ�߸��@�q521��','�x�������Ϭh�t�F���T�q36��','B');
INSERT INTO CAR_DETAIL�@VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/10/25','YYYY/MM/DD'),'A','���{�@',0963117220,'�������T���ϫذ�G��320��','�������s���Ϥ��s�@��14��27��','C');
commit;
--����ƫإ�:�����H���Z��-------------------------------------------------------------------
INSERT INTO CAR_SCHEDUL�@VALUES(carschedul_seq.NEXTVAL,'EMP0001',TO_DATE('2017/10','YYYY/MM'),'���űߦ��ŪŪŤ��ߪŪűߪŤ��ߪŪŪŪŪŪŦ����ߦ����ŪŤ��ߪŪŪŪŤ��ߪŪŪŪŪŪŦ��ŪŦ����ŪŤ��ߪŪŪŦ����ߪŪŪŪŪŪŦ����Ŧ����ŪŤ��ߪŪűߦ����ߪŪŪŪŪŪŦ����ŪŤ��ŪŤ���',160);
INSERT INTO CAR_SCHEDUL�@VALUES(carschedul_seq.NEXTVAL,'EMP0002',TO_DATE('2017/10','YYYY/MM'),'�Ť��ߪŪŪŪŪŪŦ����ߦ��űߦ��ŪŪŤ��ߪŪűߦ����ŪŤ��ߪŪŪŪŤ��ߪŪŪŪŪŪŦ��ŪŦ����ŪŤ��ߪŪŪŦ����ߪŪŪŪŪŪŦ����Ŧ����ŪŤ��ߪŪűߦ����ߪŪŪŪŪŪŦ����ŪŤ��ŪŤ���',160);
INSERT INTO CAR_SCHEDUL�@VALUES(carschedul_seq.NEXTVAL,'EMP0003',TO_DATE('2017/10','YYYY/MM'),'���űߦ��ŪŪŤ��ߪŪűߦ����ŪŤ��ߪŪŪŪŤ��ߪŪŪŪŪŪŦ��ŪŦ��űߦ��ŪŪŤ��ߪŪűߦ����ŪŤ��ߪŪŪŦ����ߪŪŪŪŪŪŦ����Ŧ����ŪŤ��ߪŪűߦ����ߪŪŪŪŪŪŦ����ŪŤ��ŪŤ���',160);
commit;
 
 ---------------------------------  �ۼW�D�� -------------------------------------

--------- 1. �O������

CREATE SEQUENCE HEALTHNO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 2. �̷s����
CREATE SEQUENCE NEWSNO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 3. �u�W�ȪA
CREATE SEQUENCE EMPSEVNO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

 
 
 CREATE TABLE HEALTHNEWSDETAIL(
 HEALTHNO       VARCHAR2(15)   NOT NULL,
 NEWSTITLE      VARCHAR2(200) NOT NULL,
 NEWSINTRO      CLOB,
 EMP_NO         VARCHAR2(10)   NOT NULL,
 COVERPIC       BLOB,
 NEWSPIC1       BLOB,
 NEWSPIC2       BLOB,
 NEWSPIC3       BLOB,
 NEWSPIC4       BLOB,
 NEWSDATE       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT HEALTH_NO_PRIMARY_KEY PRIMARY KEY (HEALTHNO),
CONSTRAINT HEALTH_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);

commit;


--------- 2. �̷s��T-----

CREATE TABLE NEWSDETAIL(
 NEWSNO         VARCHAR2(15)   NOT NULL,
 NEWSTITLE      VARCHAR2(200) NOT NULL,
 NEWSINTRO      CLOB,
 EMP_NO         VARCHAR2(10)   NOT NULL,
 COVERPIC       BLOB,
 NEWSPIC1       BLOB,
 NEWSPIC2       BLOB,
 NEWSPIC3       BLOB,
 NEWSPIC4       BLOB,
 NEWSDATE       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT NEWS_NO_PRIMARY_KEY PRIMARY KEY (NEWSNO),
CONSTRAINT NEWS_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);

commit;


--------- 3. �u�W�ȪA����-----

CREATE TABLE EMPSERVICEDETAIL(
 EMPSEVNO       VARCHAR2(15) NOT NULL,
 EMP_NO         VARCHAR2(10) NOT NULL,
 EMPSEVIMG      BLOB,
 EMPSEVINTRO    CLOB,
 EMPSEVDATE     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 EMPSEVSTATUS   VARCHAR2(15),
 MEM_NO         VARCHAR2(10),

CONSTRAINT EMPSEV_NO_PRIMARY_KEY PRIMARY KEY (EMPSEVNO),
CONSTRAINT SEVICE_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO),
CONSTRAINT SEVICE_MEM_FK FOREIGN KEY(MEM_NO)REFERENCES MEMBER(MEM_NO)
);

commit;

---------------------------------  ����� -------------------------------------

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO)
VALUES ('HD0001','�Y�s���]�i�H�U���d�I���J�O���ȯ�i�C���e�A�s�Ѧ~�������i�H�w��',
'��V�u�`�u�n�D���@�j�B�Ů���פU���A�\�h�k�ʪ��ٽ����W���P�A�X�{���^�B���o�A�Ʀܲ�h���{�H�A�A�[�W���ǤH�H����V�����~�u���z�A�����F���ΡA
�ھڰ�ڴ��Z�mJournal of Cosmetic Dermatology�n�]�Ƨ��~�ֽ��f�����x�^��2009�~�Z���@�g�峹�A��s�ζ��o�{���J�O����������ƦX���]flavanols�^
�����O�@�اܮ�ƪ��A�㦳���C�餺�ۥѰ�B��֫P�o���]�l�]�p�G�e�o���ʲӭM�E���B�@��ƴ�^���@�ΡA�C�����20���J���J�O�A����12�P�A
�i�H�O�@�ֽ��K���ˮ`�A��֦]���~�u���S�Ҥް_�������C�G�Y�y��i�v�����A��s�ϥΪ����J�O�A�C20���J�����t600�@�J���i�i����ଡ]cocoa flavanols�^
�A�ܮ�Ư�O�]ORAC�^�ƭȤj��1�U�A�ܵo���M�ܮ�ƪ���{�u���A�]���B�Ω�ٽ��O�i�譱�A�i�H��ֺC�ʵ��~�u���S�A�i�ӹw���ֽ������ѤơC','EMP0006'  
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO)
VALUES ('HD0002','�~�a���@�n�K�Q�@��v�@�z�u���v�P��',
'�~�a�@�z�H�H�����A�޲z��J��!
�~�a�@�z�Y�H�H�����B�H�a�x�����B�H���Ϭ���¦�A���ѳQ���U�̤η��U�̫���ʪ����@�C�ھڲέp�A�ثe�~�a�@�z�Ҧ@�p��534�a�A��]�m�����A����|���]���A�B�W�߫��A�νåͩҪ��]���A�F
�䤤��|���]���A�p194�a(36.4%)�B�W�߫���224�a(41.9%)�A�ӽåͩҪ��]�h��116�a(21.7%)�C�f���ګ��X�A�~�a�@�z�v�Ҵ��ѪA�Ȥ��e�A���j���Ҽ�������a�i��ˤf�@�z�B�޸��󴫡]�p��G�ޡB
�ɧ��ޡB��ޮM�޵��^�B�`�g�ΥN������e�˥~�A�٥]�A�@�먭���ˬd�M�����B�~�a�w�������P��ĳ�B���d���D�B�z�M���ɤΪ��|�귽�ԸߩM�श�A�@�z�v�@���o�{�Ӯײ{�s���d���D�μ�b�M�I�]����A
�åi���ѭӧO�ƪ��@�z�ԸߡB���ɤ��@�z���I�C�~�a���@�p�Ӹ`�@�����@�z�ܭ��n�C�u?���󥼦��A�v���󥼶áv�A�f���ڲz�ƪ��H�������d�M�`�]�l�|�ҡA�p�t���B�k�ҼW�p�B���k�ҡB�k�ҴO�J�g�B
��õ�֡B�����B�k�үe�f�P�ܧε����D�A���i�z�L�~�a�������@����o�ﵽ�C','EMP0011'  
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO)
VALUES ('HD0003','��ƭ��ЦY�h�˵� �o�ǯe�f�]��ۨ�',
'�Ѯ�����N�N�A���ɦY����B�Ϧ��l�B�����n�̾A�X�F�I���L�A��i�v�����^�����A�����Y�窫�̳��w�g�[�u��ơA���f�������e���u�t�q����W�СA�W�[�������B��Ŧ�t��A�]�e���[�t����y���C
��Ƥ��С@�t�u�q�o�ܰ��C�x�_�����p�X��|�Q�w�|����i����i�v�����^���X�A�`�����[�u��ơA�p�f�X��B������B
������B�F����B��ä��A���M�|�_�Ӥ��СA���ҧt���Q���o����H�C�ھڽúֳ���ĳ�A�C�H�C�Ѷu����q�O2400�@�J�A�۷�6�J���Q�A���Y�@�\����N�W�L�@�ѫ�ĳ�q�C
�Y���С@�e���o�o�ǯf�C�����^��i�v��ܡA�Q����L�h�e���s�n�b��޾����A���޾��ޮ|���h�u�ʡA��y�q�L�����O�U�j�B�����N�U���A�Q�]�|�v�T�s���N�¡B��ê�����ƥX�ζt��l���A
�W�[�������B�����B��Ŧ�f�A�H�ΰ��貨�P�����I�C�ѵM���G��Ƹ����d�����^��i�v�j�աA���d�����[���O�Y����������A�\�h������G�㦳�ѵM���f���A
�B�I�t���ͯ�����i���A�p�f�X�B�f�c�a���Ĩ��A�v���B�j�[�B���Աa���������A�h��Bī�G�a�������A��ĳ�����i�N�������H�A
�[�W���V�o�V���áA�f�t�����Y�o�X�ѵM�����C','EMP0001'  
);




INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO)
VALUES ('ND0001','�~�a�w����@�׭^�Z�j���ڭ̤@�_�ǲߦ��L�Y�����@�A���P���W��',
'�H�ͳ̫�@�����ӫ��?!���ڭ̤@�_�ǲߦ��L�Y�����@�A�P�������ɳo���u�R��§���v!�Ѳ`�Ѫ��Ϧw����@�W�L20�~���M�~�ζ�����Ǥ��ߦw�����@��줧�M�~�H���զ������v�}�e�C
�H�����f�H���Ͳz�B�߲z�Τ��F�ݨD�����ߡA�{���{�ɯg���γW���~�a���@���I�A�A�ѷ��U�̪��߲z����ݨD�γ������h�ޥ��A��N�۲zĳ�D�ο���P�w�������ۥD�p�e�ǤJ�ҵ{���I�F�C�ӳ椸������Ⱦާ@�A�z�L�����t�A���ǲߧ󦳦��ġC','EMP0014'  
);

INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO)
VALUES ('ND0002','��m�ᵶ�[���ʤ���-8/1�m���@���P�n�t�C-�b�v���@���P���J�B���y',
'8��1��P�饻�j���X�@�|�쪺�ĤT���m���@���P�n���y�A�{����o�\�h�Q���B�ͤ���A�]�A�x�_�����|�������B�s�_���åͧ������B�åͺ֧Q�����@�q��s���e�ӡA�٦��\�h���ߦb�v���@ĳ�D����v�B�Ǫ̦n�B�̡ͭA���y�H���z���A���¨S��m�����B�ͥ]�e�C','EMP0014'  
);

INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO)
VALUES ('ND0003','�n�����m�ˤ[���F�A���ڸn�A7��_�}�l�b�j�����a�ϪA���o!',
'�~�a���U�w�g�ڤJ��12�~�A�A�Ƚd�������_�B���Τj�x���B�ֿn�F�W�U�H�����A�ȸg��A���~�C��N��V�B���ˡA���ߡu�n�Ϸ��@�޲z���ߡv�A�N�H�̧���B����쪺�Ⱦv�~�a���U�����A�ӪA�Ȥj�����ϰ�!
���ڸn�A�H���������ߪ��A�ȳ]�p�A�Ʊ泭��������C�@�ӦѤƶ��q:���F�򥻪��ͬ��B��i���\�B������U�B����ά����Ⱦv���~�Ըߤ��~�A�٦���h�Ȼs�ƪ��A�ȡA���U�����ۥD�ͬ��o�U�[�U�n�A���������b�a�ɦѪ��@��C���F���ѧ󧹾㪺�A�ȡA���F�@���H�Ӫ��u��~�a���U�A�ȡA���2016�~�غc�F�@��������X���x�A�N�u�誺�Ⱦv���@�Ϋ~�ǤJ�u���ڸn�A�v�����A�P�ɾ�X�F�H���_���D���u�_�Ϸ��@�޲z���ߡv�B�[�\�j�x���Ϫ��u���Ϸ��@�޲z���ߡv�A�[�W�̷s���ߪ��u�n�Ϸ��@�޲z���ߡv�A�åH���x�q�Ϊ��u412-8178�v�A�ȿԸ߱M�u�A�W�[�ϥΪA�Ȫ��K�Q�ʡA���ѧ�h�����u�誺���@�A�ȡC','EMP0007'  
);
commit;

--------- 1. �ӫ�
CREATE SEQUENCE SHOPCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 2. ����
CREATE SEQUENCE HCCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 3. ����
CREATE SEQUENCE CARCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 4. �e�\
CREATE SEQUENCE MEALCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

commit;


--------------------------------- �s�W��� ----------------------------------
--------- 1. �ӫ��ӶD

CREATE TABLE SHOPAPPEALSCOMPLAIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 ORDERNO              VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 COMPLAINREPLY        CLOB,
 COMPLAINDATE         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT SHOPCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_SHOP_FK FOREIGN KEY(ORDERNO)REFERENCES SHOPORDER (ORDERNO)
);

commit;


--------- 2. ���ӥӶD

CREATE TABLE HCCOMPLAIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 ORDER_NO             VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 COMPLAINREPLY        CLOB,
 COMPLAINDATE         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT HCCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_HC_FK FOREIGN KEY(ORDER_NO)REFERENCES HC_ORDER_MASTER (ORDER_NO)
);

commit;

--------- 3. �����ӶD

CREATE TABLE CARCOMPLAIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 ORDER_NO             VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 COMPLAINREPLY        CLOB,
 COMPLAINDATE         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT CARCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_CAR_FK FOREIGN KEY(ORDER_NO)REFERENCES CAR_ORDER (ORDER_NO)
);

commit;

--------- 4. �e�\�ӶD

CREATE TABLE MEALORDERCOMPLIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 MO_NO                VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 COMPLAINREPLY        CLOB,
 COMPLAINDATE         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT MEALCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_MEAL_FK FOREIGN KEY(MO_NO)REFERENCES MEAL_ORDER (MO_NO)
);

commit;



---------------------------------  ����� -------------------------------------

--------- 1. �ӫ��ӶD��
-- �ʺA�s���y�k (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO SHOPAPPEALSCOMPLAIN( COMPLAINNO,ORDERNO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS) VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),'�ӫ~���岫,��ı�o����,����w�}�l','�z�n,�w����z���ӶD,�߰����A�󴫱H�e�s���C','�B�z��');


INSERT INTO SHOPAPPEALSCOMPLAIN(COMPLAINNO,ORDERNO,COMPLAINDETAIL,COMPLAINSTATUS) VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000004',6,'0'),'ı�o�ӫ~�Ӥ����,�i�H�h�f��?','���B�z');


INSERT INTO SHOPAPPEALSCOMPLAIN(
COMPLAINNO,ORDERNO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS)
VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000005',6,'0'),'���ϥΤW�����D,���|�Ϊ�!','�z�n,�ڭ̷|�ЫȪA�H���P�z�pô','�w����');


--------- 2. ���ӥӶD��
-- �ʺA�s���y�k (to_char('HC'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))
INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('500002',6,'0'),'��M�{�ɦ���, �аݥi������ܡH','���B�z');


INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('500003',6,'0'),'���ӤH���j���','�z�n,�w����z���ӶD,��浹���ӳ��W�h���B�z,�Ӧ��z�����K,���n�N��C','�B�z��');


INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('500004',6,'0'),'�аݥi�H�ݨ�q�ʦ��\�C�X���ӤH���O����ܡH','�z�n�b�|����ƪ��q��W�i�H�ݨ�','�w����');


--------- 3. �����ӶD��
-- �ʺA�s���y�k (to_char('CR'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),'���l���A�Y��','���B�z');


INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),'�аݥq���i�H����','�z�n,�w���ȪA,�ȪA�H���|�A�P�z�pô','�B�z��');

INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),'�q���n��,�аݳ樭�ܡH','�z�n,�w���q��,�Хq�����Aline�|�A�P�z�pô','�w����');


--------- 4. �e�\�ӶD��
-- �ʺA�s���y�k (to_char('MO'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO MEALORDERCOMPLIN(
COMPLAINNO,MO_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),'�\�I�ӲM�H,�U�@�\�i�H���O���\�I��?','���B�z');

INSERT INTO MEALORDERCOMPLIN(
COMPLAINNO,MO_NO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),'�аݥi�H�A�h�l�[�\�I��?','�z�n,�ڭ̷|�ЫȪA�H���P�z�pô','�B�z��');

INSERT INTO MEALORDERCOMPLIN(
COMPLAINNO,MO_NO,COMPLAINDETAIL,COMPLAINREPLY,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),'���Ѥ��\���p���ʦ��I���ꪺ','�z�n,�o�O�ڭ̫Ȼs�ƪ���p����','�w����');
COMMIT;





