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



---------------------自增主鍵1(商品編號用)-----------------------------

create sequence FORSHOPITEM
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

---------------------自增主鍵2(促銷編號用)-----------------------------
create sequence FORPROMOTION
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

---------------------自增主鍵3(商品訂單專用)-----------------------------
create sequence FORSHOPORDER
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


-----------------自己假裝會員-----------------------
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



----------------商品種類----------------------
CREATE TABLE CLASSSTYLE (
CLASSNO      NUMBER(10)  PRIMARY KEY ,
CLASSNAME  VARCHAR2(15) NOT NULL
);

----------------商品種類假資料------------------------------
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (1,'水果');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (2,'肉類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (3,'魚類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (4,'蔬菜類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (5,'保健類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (6,'食品類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (7,'藥材類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (8,'運動器材類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (9,'輔助器材類');


----------------商品----------------------
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

----------------商品訂單----------------------
CREATE TABLE SHOPORDER (
ORDERNO VARCHAR2(15) PRIMARY KEY,
MEM_NO VARCHAR2(10),
ORDER_DATE TIMESTAMP,
CUSTOMER_ADDRESS VARCHAR2(100),
CUSTOMER_PHONE VARCHAR2(15),
CUSTOMER_NAME VARCHAR2(80),
CONSTRAINT FK_MEM_NO  FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);

----------------商品訂單假資料------------------
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),1,TO_DATE('2017/5/5', 'yyyy-mm-dd'),'台北天龍國','0926','霸氣連勝文');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),2,TO_DATE('2010/4/5', 'yyyy-mm-dd'),'人情台南市','0918','裝瘋陳水扁');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),3,TO_DATE('2013/2/9', 'yyyy-mm-dd'),'人情台南市','0800','法院認證中華民國第一嫖客-陳志中');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),4,TO_DATE('1950/4/5', 'yyyy-mm-dd'),'台北天龍國','0987','台獨蔡英文');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),5,TO_DATE('1966/12/5', 'yyyy-mm-dd'),'台北天龍國','0926','中共小弟馬英九');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),6,TO_DATE('1960/5/5', 'yyyy-mm-dd'),'熱情屏東市','0926','黑金李登輝');


----------------促銷專案----------------------
CREATE TABLE PROMOTION (
PROMOTIONNO  NUMBER(10)  PRIMARY KEY,
NAME  VARCHAR2(45),
BEGINDATE DATE,
ENDDATE DATE
);

----------------促銷明細----------------------
CREATE TABLE PROMOTIONDETAIL (
PROMOTIONNO  NUMBER(10)  ,
ITEMNO           NUMBER(10),
PRICE          NUMBER(10),
constraint PR_SUPPLIER_EX_PK primary key(PROMOTIONNO, ITEMNO),
CONSTRAINT FK_PROMOTIONNO  FOREIGN KEY (PROMOTIONNO) REFERENCES PROMOTION(PROMOTIONNO),
CONSTRAINT FK_CLASSNOS  FOREIGN KEY (ITEMNO) REFERENCES ShoppingMall (ITEMNO)
);

----------------訂單明細----------------------
CREATE TABLE ORDERDETAIL (
ORDERNO      VARCHAR2(15) ,--20171023修改過--
ITEMNO         NUMBER(10),
ORDERCOUNT NUMBER(5),
constraint PR_SUPPLIER_EX_OR primary key(ORDERNO, ITEMNO),
CONSTRAINT FK_ORDERNO  FOREIGN KEY (ORDERNO) REFERENCES SHOPORDER(ORDERNO),
CONSTRAINT FK_NAME  FOREIGN KEY (ITEMNO) REFERENCES ShoppingMall(ITEMNO)
);

--------------------------商城商品假資料-----------------------------
INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,10,499,1,1,'【Daiwa】日本製通用輔助筷','長輩年紀漸長，手指力量退化，或者因為中風無法用慣用手執起筷子進食，樂齡網推薦此款筷子，可以讓其更容易自行進食而無需人餵食。連用不慣筷子的外國人亦可輕易使用本筷子而享用美食佳餚。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,20,350,1,1,'【Forsound】第三代防痔型凝膠坐墊','很多年長者皆有排便不順的困擾，「有痔難伸」更是很多年長者的共同問題，有沒有一個好的座墊可以減輕坐下時的不便呢?樂齡網為您介紹一款外銷德、日的新專利減壓坐墊，特殊的造型及SGEL凝膠與人體工學的結合，讓您從此不再如坐針氈。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,299,1,1,'Hi-Bone雙模式(骨傳導+空氣傳導)高感度耳機','您有多久沒有聽到優美的音樂? 家中是否有長者還不到要配戴助聽器，但是與人溝通不僅旁人要用較大的音量，而自己本身也聽的很辛苦，在溝通不良的狀況下，往往因此讓老人家逐漸封閉。對於有聽損的樂齡族而言，一定渴望再聆聽到美妙動人的音樂，享受沈浸在音樂中那美好的氛圍。樂齡網幫您實現願望，我們推薦您一款最新科技的雙模式(骨傳導+空氣傳導)高感度耳機，讓您再度感受到豐富的樂音，讓生命再度活躍起來。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,199,1,1,'日本製室內帽','樂齡族長時間待在冷氣房內或者外出寒流來襲，一定要注意頭部的保暖，稍一不慎就會受涼。樂齡網推薦一款日本製的室內帽，可有效保持頭部溫暖，對於髮量稀少或有掉髮困擾的銀髮族有也遮掩的效果。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,899,1,1,'眼鏡式放大鏡 2.3倍','隨著年齡增長，視力越來越模糊不清，這時需要一個不占用雙手的放大鏡來閱讀或工作，此款商品將是您的最佳選擇。戴眼鏡或老花眼鏡也可再戴上此放大鏡，不用再一手拿著放大鏡，一手拿著書。用雙眼看，視野更開闊!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【LifePlus】開門式無障礙浴缸','家中長輩是不是很久沒有享受泡澡的幸福滋味? 一想到要腳跨過那高起的浴缸壁，便讓長輩打消泡澡的念頭。
※樂齡網台北民生店 (台北市民生東路五段91號)有實體展示，歡迎前往體驗
※本產品價格不含安裝施工費用
※台中市以北免運(偏遠山區除外)，以南、及花東偏遠地區運費需另計，請來電詢問喔');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【NISHIKI】女用防漏安心褲 - 吸水量150cc (輕失禁適用)','您有因為大笑、咳嗽或提重物，有不自主的漏尿情形嗎? 是否需要墊個護墊或衛生紙才敢外出? 其實熟年女性的漏尿情形是一個很普遍的現象，根據國民健康局96年調查，國人54歲以上女性每4位婦女中，就有1位有尿失禁困擾，65歲以上女性更是高達1/3，由於國人較為保守，大部分皆隱忍日常生活中因尿失禁的困擾。 樂齡網推薦您一款由日本手工精製，針對輕失禁婦女所設計的防漏內褲，吸水、消臭又輕薄，讓您隨時保持清爽，生活品質得以改善。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【SWANY】Walking Bag 134 復古風行李箱 (咖啡色)','日本行李箱大廠 - SWANY專為熟齡族群所設計的日用行李箱《Walking Bag》，符合人體工學，特殊的滑輪軸承設計超靜音，可360度旋轉，任意變換行走方向，無須上潤滑油即可保持 輪子的平順無聲。
可分離式的超輕量包，行李箱可變身為手提包，讓您到處趴趴走，不用擔心厚重的行李讓您的手臂過度疲勞。休息是為了走更長遠的路。可以讓您更省力，讓您雲遊四海無負擔!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'樂齡室內福祉拖鞋','一般室內平底拖鞋由於整個鞋底機觸地面，容易造成跌倒。選購舒適的防跌、防滑鞋是老人做好居家防護的首選。為迎接高齡化社會的來臨，本公司自日本引進專為銀髮族人士設計的”福祉室內鞋”。造福年長者，創造健康舒適的家居生活。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【+VENTURE】多功能長效型速配鼎熱敷墊(未滅菌)家用型KB-243','衛字核可字號：衛部醫器製壹字第005451號');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【Mr. Pad】超柔軟記憶泡棉地墊 40X60cm','冬天快來了，長者下床若能踏在溫暖止滑的地墊，不僅防止夜晚燈光微弱滑倒的風險，而且也可防止足部血管突然緊縮的風險。
本地墊質感豐厚，給予雙腳溫柔的呵護，適用於浴室門口、廚房、玄關，茶几旁；產品使用SBR防滑底面加強止滑，不易滑動，結實耐用不掉毛，可搭配洗衣網洗滌，清洗方法簡單又省時，讓您對它愛不釋手喔~');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'SHIMA銀髮族購物散步車，10/5-10/31買就送五段調高傘，送完為止!','由日本老人車製造大廠 - 島製作所，專為銀髮族而設計的購物散步車，方便銀髮族外出購物，到超市只要將菜藍放在車上即可開始購物，買完了放在本車的置物藍中，即可將購買物品推回家，不用提重物，走累了還可坐下休息。
無論您是要公園散步、逛街購物，還是要休閒運動都方便、省力及及安全，是一項非常貼心的銀髮族商品。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【Famica】睡眠專用床護欄','有些銀髮長者由於各種因素，從床上起身或躺下時常會感到很吃力，現在有了這一款床邊護欄，除了為長輩的睡眠安全加分，起身時可以更輕鬆了，讓老人家從床上起身更加有支撐力。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【Ryka】RKF1272M1600女用健走鞋','你也是個喜愛休閒健走，到處趴趴造的銀髮族嗎？
運動是維持活力的最佳妙方，但如何挑選一雙避免運動傷害的鞋子可是非常重要的。
尤其對於長者來說，寬楦不束縛、避震緩衝等等，都是挑選的重點。
樂齡網推薦此款【Ryka】健走休閒鞋，
品牌創辦者因為飽受運動之苦，親自投入運動鞋研發，
特別針對女性的肌肉與骨骼結構，設計能夠避免運動傷害的專屬鞋款，
無論是要公園快走或運動健行都適合喔！');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【來可】側邊馬桶起身扶手','對於有些長輩來說，由於膝蓋、腰部的退化無力，要從馬桶站起來是相當辛苦的，而且在這顛沛起身的過程當中，還潛藏著跌倒的危險。
樂齡網推薦一款【來可側邊馬桶起身扶手】，不須安裝，直接擺放在廁所馬桶側邊，讓長輩要站起來時有所依靠，您貼心、他(她)窩心、全家都放心！');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'日本GREEN BELL腳指甲專用指甲剪','幫老人家剪腳指甲是不是很困難?

年長者由於細胞的新陳代新及再生能力退化，構成指甲的角質層的代謝也會減慢，導致角質層加厚，指甲變的堅硬難剪，尤其腳指甲若沒有泡軟，真的很難剪。 日本專業指甲剪大廠-GREEN BELL，便因此而開發了一系列專為厚指甲、變形指甲而設計的指甲剪，無論是自用或要幫老人家剪腳指甲皆方便多了。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【KeyCatch】磁力收納器','家裡大小事如麻，總是忘記鑰匙放在哪？
年長記憶力退化，緊急時刻就是找不到

推薦給您極簡收納的最佳方案【KeyCatch】磁力收納器
只要三秒鐘黏貼，家中任何平滑表面皆能收納，帶給您無限便利！');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【MOTORIZED】活力手足健身機 (可正反轉)','銀髮族若能長期保持運動習慣，必會對身心產生極大的助益，本健身器可坐臥兩用，手腳皆可運動。 不用出力，本健身器會以電動的方式帶動您的手腳活動，讓您輕鬆自在達到運動效果。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'相片輔記助聽電話','電話聽不清楚嗎? 怕記不住電話嗎? 按鍵太小看不清嗎? 不用擔心，本電話一次解決您所有問題!!!孝親最佳贈禮!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'SHIMA銀髮族購物散步車，10/5-10/31買就送五段調高傘，送完為止!','由日本老人車製造大廠 - 島製作所，專為銀髮族而設計的購物散步車，方便銀髮族外出購物，到超市只要將菜藍放在車上即可開始購物，買完了放在本車的置物藍中，即可將購買物品推回家，不用提重物，走累了還可坐下休息。
無論您是要公園散步、逛街購物，還是要休閒運動都方便、省力及及安全，是一項非常貼心的銀髮族商品。');

--
--INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES,PICTURE1,PICTURE2,PICTURE3)  
--VALUES (FORSHOPITEM.Nextval,50,100,1,1,'鐵牛運功散2','強身健體2',?,?,?);

----------------商品訂單明細假資料(未來購物車新增以此方法為基底)------------------------------

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


--------------------------促銷專案假資料------------------------------
INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(1,'中秋節活動',TO_DATE('2017/9/1', 'yyyy-mm-dd'),TO_DATE('2017/9/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(2,'端午節活動',TO_DATE('2017/10/1', 'yyyy-mm-dd'),TO_DATE('2017/10/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(3,'萬聖節活動',TO_DATE('2017/11/1', 'yyyy-mm-dd'),TO_DATE('2017/11/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(4,'聖誕節活動',TO_DATE('2017/12/1', 'yyyy-mm-dd'),TO_DATE('2017/12/30', 'yyyy-mm-dd'));

--------------------------促銷明細假資料------------------------------
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

屌炸天sql語法
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME 
FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) 
JOIN (SELECT * FROM SHOPPINGMALL WHERE NAME='國民黨')SP  ON SP.ITEMNO = P.ITEMNO


--------------------------------------查詢JOIN表格失敗---------------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME FROM 
PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) JOIN 
(SELECT * FROM SHOPPINGMALL WHERE NAME='海鮮自由行')SP ON SP.ITEMNO = P.ITEMNO;
--------------------------------------查詢JOIN表格成功(INT)----------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS 
SHOPNAME FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) 
JOIN (SELECT * FROM SHOPPINGMALL WHERE ITEMNO=3)SP  ON SP.ITEMNO = P.ITEMNO;
--------------------------------------查詢JOIN表格成功(String)-------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS 
SHOPNAME FROM PROMOTIONDETAIL P JOIN (SELECT * FROM PROMOTION WHERE NAME='萬聖節活動')PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) 
JOIN (SELECT * FROM SHOPPINGMALL )SP  ON SP.ITEMNO = P.ITEMNO;
--------------------------------------查詢所有促銷活動--------------------------------
SELECT * FROM PROMOTION ORDER BY PROMOTIONNO;
--------------------------------------查詢所有促銷活動名稱--------------------------------
SELECT NAME FROM PROMOTION;
--------------------------------------查詢所有訂單指令----------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) 
--------------------------------------查詢特定訂單指令(依照訂單編號)----------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE OT.ORDERNO='20171025-000001';
--------------------------------------查詢特定訂單指令(依照會員編號)----------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE MEM_NO=4;
--------------------------------------查詢特定訂單指令(依照日期舊到新)-------------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) ORDER BY ORDER_DATE ;
--------------------------------------查詢特定訂單指令(依照日期新到舊)-------------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) ORDER BY ORDER_DATE DESC;
--------------------------------------查詢特定訂單指令(依照會員名稱)--------------------------------------
SELECT OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME
FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) ORDER BY CUSTOMER_NAME ;
--------------------------------------查詢沒有促銷的全部商品(屌炸天語法)--------------------------------------
select * from shoppingmall where itemno not in (
   select a.itemno from shoppingmall a right join promotiondetail b on a.itemno = b.itemno
);

--------------------------------------尋目前時間是否符合現在促銷節目(我是屌炸天語法)-----------------------------------------
SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME
FROM PROMOTIONDETAIL P 
JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO)
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = P.ITEMNO where to_char(BEGINDATE,'yyyymmdd')<=to_char(sysdate,'yyyymmdd')   
and to_char(ENDDATE,'yyyymmdd')>=to_char(sysdate,'yyyymmdd');

--------------------------------------查詢全部會員訂單商品+促銷價格---------------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
--------------------------------------查詢特定會員訂單商品+促銷價格---------------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE OT.ORDERNO='20171030-000040';

--------------------------------------查詢訂單編號所有商品+還沒有限縮促銷---------------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
WHERE OT.ORDERNO='20171030-000040';
--------------------------------------用訂單編號取出下定時間-----------------------------------------
SELECT ORDER_DATE FROM SHOPORDER WHERE ORDERNO='20171030-000040';
--------------------------------------利用會員訂單時間去查詢當下有無促銷-----------------------------------------
SELECT PROMOTIONNO FROM PROMOTION WHERE 
BEGINDATE<to_date('2017-11-01', 'yyyy-mm-dd') 
AND ENDDATE>to_date('2017-10-25', 'yyyy-mm-dd') ;

--------------------------------------查詢特定會員編號購買的商品+促銷價格(可設定時間+PROMOTIONNO)-----------------------------------------
SELECT OT.ORDERNO,PD.PROMOTIONNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE OT.ORDERNO='20171030-000039' AND PD.PROMOTIONNO=4; 
--------------------------------------查詢特定會員編號購買的商品+促銷價格(可設定時間)-----------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE OT.ORDERNO='20171030-000040' AND ORDER_DATE<to_date('2017-10-25', 'yyyy-mm-dd') AND ORDER_DATE>to_date('2017-10-1', 'yyyy-mm-dd');


--------------------------------------查詢特定會員編號購買的商品+促銷價格-----------------------------------------
SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE
FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) 
JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO
JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO
WHERE MEM_NO='MEM0001';
--------------------------------------查詢所有訂單----------------------------------------------------------
SELECT ORDERNO FROM SHOPORDER;
