DROP DATABASE IF EXISTS platforma_prosforwn;
CREATE DATABASE platforma_prosforwn;
USE platforma_prosforwn;


CREATE TABLE administrator(
    id_user INT NOT NULL PRIMARY KEY DEFAULT '0',
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    administrator INT DEFAULT '1' NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE delete_points(
    id_user_for_offer INT ,
    date_for_del DATE,
    score_month INT,
    likes INT,
    dislikes INT,
    offer_i INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE delete_offer(
    iii INT ,
    date2 DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE user(
    id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    location VARCHAR(50) DEFAULT 'unknown' NOT NULL,
    tokens bigint(16) DEFAULT '0' NOT NULL,
    tokens_last_month bigint(16) DEFAULT '0' NOT NULL,
    administrator INT DEFAULT '0' NOT NULL,
    UNIQUE (email)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE product(
    id_product INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL,
    subcategory VARCHAR(50) NOT NULL,
    name1 VARCHAR(50),
    UNIQUE(name1)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE store(
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    type1 VARCHAR(50),
    price FLOAT(6,2) NOT NULL default '0',
    stock INT UNSIGNED NOT NULL DEFAULT '0',
    id_product1 INT UNSIGNED NOT NULL,
    id_store INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CONSTRAINT k FOREIGN KEY (id_product1) REFERENCES product(id_product) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE offer(
    id_offer INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    out_of_stock BOOL DEFAULT FALSE NOT NULL,
    likes INT default "0",
    score INT default "0",
    stock INT UNSIGNED NOT NULL DEFAULT '0',
    p_date DATE,
    average_price FLOAT(6,2),
    final_price FLOAT(6,2),
    id_product2 INT UNSIGNED NOT NULL ,
    id_user INT NOT NULL ,
    icon1 VARCHAR(50),
    id_store1 INT UNSIGNED NOT NULL ,
    CONSTRAINT c FOREIGN KEY (id_user) REFERENCES user(id_user) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT d FOREIGN KEY (id_product2) REFERENCES product(id_product) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT dc FOREIGN KEY (id_store1) REFERENCES store(id_store) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE evaluation(
    id_user INT NOT NULL,
    id_eval INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) ,
    id_offer INT UNSIGNED NOT NULL,
    UNIQUE (name),
    CONSTRAINT a FOREIGN KEY(id_user) REFERENCES user(id_user) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT b FOREIGN KEY(id_offer) REFERENCES offer(id_offer) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



/*CREATE TABLE price_history(
    likes INT,
    user_score INT,
    product_name VARCHAR(50),
    price FLOAT(6,2),
    id_2 INT,
    id_user INT,
    id_code INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
*/



CREATE TABLE offer_user_history(
    id_histo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_offer INT UNSIGNED NOT NULL,
    id_user INT NOT NULL,
    likes INT default "0",
    score INT,
    score_last_m INT,
    name2 VARCHAR(50) ,
    day DATE,
    dislikes INT, 
    price INT
    
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  
CREATE TABLE prices_history(
    id_price_histo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    day DATE NOT NULL,
    price FLOAT(6,2) NOT NULL,
    id_product INT UNSIGNED NOT NULL,
    id_storee INT UNSIGNED NOT NULL default '0'
    
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into administrator (id_user,username, password, email , administrator ) values  #edo mporoyme na eisagoyme neous xrhstes me diasyndesh me th selida
                 (DEFAULT,'cleogeo22', 'upL31234r', 'cleom17@gmail.com','1');
                 
insert into user (id_user,username, password, email , location, tokens, administrator ) values  #edo mporoyme na eisagoyme neous xrhstes me diasyndesh me th selida
                 (NULL,'cleogeo', 'upL34r', 'cleom17@gmail.com','Maizonos','2','1'),
                 (NULL,'zazahir23', 'zoolhger', 'ahmetTech@yahoo.com','Korinthou','3','0'),
                 (NULL,'lionarF', 'erg2378',  'Lionarfre@ezra.co.uk','Ahepa','4','0'),
                 (NULL,'liagourma','sionpass','mliagkr@gmail.com','Karaiskaki','6','1'),
                 (NULL,'mnikol','m@n0lis' , 'nikolp@gmail.com','Oxford','4','0'),
                 (NULL,'abrown','w1lcoxon', 'andrewbr@yahoo.com','General Sklevi',DEFAULT,'0');
                  (NULL,'fhcnv54Ssehfg$', 'upL34r', 'cleom17@gmail.com','Maizonos','2','1'),


insert into product (id_product, category , subcategory,name1 ) values  #edo mporoyme na eisagoyme nea proionta me diasyndesh me th selida
                    (NULL, 'CHESSE', 'JKDVNJVN','stoupetsi'),
                    (NULL, 'CHESSE', 'SJDVDSJVNDS',NULL),
                    (NULL, 'CHESSE',  'DSNDSNDVND',NULL),
                    (NULL, 'CHEweSSEw',  'DDJSKDVJK',NULL),
                    (NULL,'BURGER', 'JKDDJSKJ',NULL),
                    (NULL, 'CHESSE', 'JKDVNJVN','stoupetsi1'),
                    (NULL, 'CHESSE', 'SJDVDSJVNDS',NULL),
                    (NULL, 'CHESSE',  'DSNDSNDVND',NULL),
                    (NULL, 'CHEweSSEw',  'DDJSKDVJK',NULL),
                    (NULL,'BURGER', 'JKDDJSKJ',NULL);


insert into store (name, location,type1 , id_product1,id_store,stock ) values  
                    ('pizza keropas', 'Maizonos', 'super market',"1",NULL, '4'),
                    ('super market marinopoulos', 'Maizonos', 'super market', '2',NULL, '4'),
                    ('trofima ae', 'Maizonos', 'super market', '3',NULL, '4'),
                    ('mini market', 'Maizonos', 'mini market','4',NULL, '4'),
                    ('adistaktos foods', 'Korinthou','food', '5',NULL, '4');

insert into offer (id_offer,id_user,id_product2,final_price,id_store1) values
                   (NULL,'1','6','45','1'),
                   (NULL,'2','7','34','2'),
                   (NULL,'3','8','34','2'),
                   (NULL,'4','9','56','3'),
                   (NULL,'5','10','35','3');
                   
insert into evaluation (id_offer, id_user) values  #edo mporoyme na eisagoyme nees ajiologhseis me diasyndesh me th selida
                       ('1','1'),
                       ('2','2'),
                       ('3','3'),
                       ('4','4'),
                       ('5','5');
/* edo 8a ftiajo mia synarthsh gia na elenxo an o kodikos poy do8hke exei kapoious xarakthres san #,__,@ ktl dioti aytoi oi xarakthres mporoun na vlacoun th bash moy*/
DELIMITER $
CREATE PROCEDURE password_control (IN password varchar(50), OUT G INT,OUT H INT)
BEGIN
DECLARE F varchar(50) ;
SET F=password;
IF (F LIKE '%________%' ) THEN
   SET H=1;
ELSE SET H=0;
END IF;
IF ((F LIKE '%#%') OR (F LIKE '%@%') OR (F LIKE '%$%') OR (F LIKE '%&%') OR (F LIKE '%*%')) THEN
   SET G=1;
ELSE SET G=0;
END IF;
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE question__a (IN id_user1 varchar(50)) /*epistrefei thn topothesia toy xrhsth*/
BEGIN
DECLARE loc VARCHAR(50);
SELECT location
INTO loc
FROM user
WHERE id_user=id_user1;
IF (loc is NULL OR 'unknown' ) THEN
SELECT 'no location found';
ELSE 
SELECT loc AS 'your total location:';
END IF;
SET @x4=loc;
CALL question__a1(@x4);
END $
DELIMITER ;

DELIMITER $                                                             /*epistrefei ta magazia se mia topothesia*/
CREATE PROCEDURE question__a1 ( IN loc varchar(50))
BEGIN

DECLARE store_n VARCHAR(50);
DECLARE store_icon VARCHAR(50);
DECLARE store_type VARCHAR(50);
DECLARE finishedFlag INT;
DECLARE lectCursor CURSOR FOR

SELECT name, icon, type1 FROM store WHERE location=loc;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO store_n, store_icon, store_type;

WHILE (finishedFlag=0) DO
SELECT store_n AS 'store:          ', store_icon AS 'icon: ', store_type AS 'type1:         ';
FETCH lectCursor INTO store_n, store_icon, store_type;
END WHILE;
CLOSE lectCursor; 
END $
DELIMITER ;


DELIMITER $                                                             /*epistrefei ta magazia se mia topothesia*/
CREATE PROCEDURE question__b1 ( IN loc varchar(50), IN string varchar(50))
BEGIN

DECLARE store_n VARCHAR(50);
DECLARE store_icon VARCHAR(50);
DECLARE store_type VARCHAR(50);
DECLARE finishedFlag INT;
DECLARE lectCursor CURSOR FOR

SELECT name, icon, type1 FROM store WHERE location=loc AND name = string ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO store_n, store_icon, store_type;

WHILE (finishedFlag=0) DO
SELECT store_n AS 'store:          ', store_icon AS 'icon: ', store_type AS 'type1:         ';
FETCH lectCursor INTO store_n, store_icon, store_type;
END WHILE;
CLOSE lectCursor; 
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE question__b (IN id_user1 varchar(50), string varchar(50)) /*epistrefei sthn topothesia toy xrhsth magazia me mia onomasia*/
BEGIN
DECLARE loc VARCHAR(50);
SELECT location
INTO loc
FROM user
WHERE id_user=id_user1;
IF (loc is NULL OR 'unknown' ) THEN
SELECT 'no location found';
ELSE 
SELECT loc AS 'your total location:';
END IF;
SET @x3=loc;
SET @y3=string;
CALL question__b1(@x3,@y3);
END $
DELIMITER ;


DELIMITER $
CREATE PROCEDURE question__bb (IN id_user1 varchar(50)) /*epistrefei thn topothesia toy xrhsth*/
BEGIN
DECLARE loc VARCHAR(50);
SELECT location
INTO loc
FROM user
WHERE id_user=id_user1;
IF (loc is NULL OR 'unknown' ) THEN
SELECT 'no location found';
ELSE 
SELECT loc AS 'your total location:';
END IF;
SET @x2=loc;
CALL question__b2(@x2);
END $
DELIMITER ;

DELIMITER $                                                             /*epistrefei ta magazia se mia topothesia me prosfores*/
CREATE PROCEDURE question__b2 ( IN loc varchar(50))
BEGIN

DECLARE store_n VARCHAR(50);
DECLARE store_icon VARCHAR(50);
DECLARE store_type VARCHAR(50);
DECLARE finishedFlag INT;
DECLARE lectCursor CURSOR FOR

SELECT name, icon, type1 FROM store INNER JOIN offer ON store.id_product1 = offer.id_product2 and location=loc;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO store_n, store_icon, store_type;

WHILE (finishedFlag=0) DO
SELECT store_n AS 'store:          ', store_icon AS 'icon: ', store_type AS 'type1:         ';
FETCH lectCursor INTO store_n, store_icon, store_type;
END WHILE;
CLOSE lectCursor; 
END $
DELIMITER ;


DELIMITER $
CREATE PROCEDURE question__c (IN id_user1 varchar(50),IN category1 varchar(50)) /*epistrefei thn topothesia toy xrhsth*/
BEGIN
DECLARE loc VARCHAR(50);
SELECT location
INTO loc
FROM user
WHERE id_user=id_user1;
IF (loc is NULL OR 'unknown' ) THEN
SELECT 'no location found';
ELSE 
SELECT loc AS 'your total location:';
END IF;
SET @x1=loc;
SET @z=category1;
CALL question__c1(@x1,@z);
END $
DELIMITER ;

DELIMITER $                                                             /*epistrefei ta magazia se mia topothesia me prosfores*/
CREATE PROCEDURE question__c1 ( IN loc varchar(50), IN category1 varchar(50))
BEGIN

DECLARE store_n VARCHAR(50);
DECLARE store_icon VARCHAR(50);
DECLARE store_type VARCHAR(50);
DECLARE finishedFlag INT;
DECLARE lectCursor CURSOR FOR

SELECT name, icon, type1 FROM store INNER JOIN product ON product.id_product=store.id_product1 INNER JOIN offer ON store.id_product1 = offer.id_product2 and location=loc and category=category1;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO store_n, store_icon, store_type;

WHILE (finishedFlag=0) DO
SELECT store_n AS 'store:          ', store_icon AS 'icon: ', store_type AS 'type1:         ';
FETCH lectCursor INTO store_n, store_icon, store_type;
END WHILE;
CLOSE lectCursor; 
END $
DELIMITER ;




DELIMITER $                                                             /*dineis onoma magazioy kai topothesia magazioy kai epistrefei ta proionta se prosf*/
CREATE PROCEDURE question__d1 (IN name11 varchar(50),IN location1 varchar(50) )
BEGIN

DECLARE product_name VARCHAR(50);
DECLARE product_price VARCHAR(50);
DECLARE store_icon VARCHAR(50);
DECLARE offer_date DATE;
DECLARE o_likes INT;
DECLARE id INT;
DECLARE 1_out_of_stock BOOL;
DECLARE finishedFlag INT;
DECLARE lectCursor CURSOR FOR

SELECT id_offer,final_price,out_of_stock,likes,p_date FROM offer INNER JOIN store ON offer.id_product2=store.id_product1 and store.name=name11 and store.location=location1 ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO id,product_price,1_out_of_stock,o_likes,offer_date;

WHILE (finishedFlag=0) DO
SELECT name1 
INTO product_name
FROM product INNER JOIN offer ON product.id_product=offer.id_product2 and id_offer=id ;
SELECT  name11 AS 'store:          ',product_name AS 'product: ', product_price  AS 'price:         ',1_out_of_stock AS 'stock',o_likes AS 'likes', offer_date AS 'offer date'  ;
FETCH lectCursor INTO id,product_price,1_out_of_stock,o_likes,offer_date;
END WHILE;
CLOSE lectCursor; 
END $
DELIMITER ;

DELIMITER $                                                             /*eggrafh*/
CREATE PROCEDURE question__aa1 (IN username varchar(50),IN location varchar(50),IN email varchar(50),password VARCHAR(50) )
BEGIN

DECLARE usname VARCHAR(50);
DECLARE mail VARCHAR(50);
DECLARE loc VARCHAR(50);
DECLARE pass VARCHAR(50);
SET usname=username;
SET mail=email;
SET loc=location;
SET pass=password;
CALL password_control(pass,@G,@H);
IF (@G=1 AND @H=1) THEN
insert into user (id_user,username, password, email , location, tokens, administrator ) values  #edo mporoyme na eisagoyme neous xrhstes me diasyndesh me th selida
                 (NULL,usname, pass, mail,loc,default,default);
ELSE 
insert into user (id_user,username, password, email , location, tokens, administrator ) values  #edo mporoyme na eisagoyme neous xrhstes me diasyndesh me th selida
                 ('pop',NULL, NULL, mail,loc,default,default);
END IF;
END $
DELIMITER ;



DELIMITER $                                                             /*dineis onoma magazioy kai topothesia magazioy kai epistrefei ta proionta se prosf kai ypobolh prosforas*/
CREATE PROCEDURE question__e1 (IN id_storeG INT,id_user1 INT, id_product2G INT,final_priceG INT)
BEGIN
DECLARE date1 date;
DECLARE id_1 INT;
DECLARE id_2 INT;
DECLARE id_3 INT;
DECLARE id_4 INT;
DECLARE id_5 INT;
DECLARE id_6 INT;
DECLARE id_7 INT;
DECLARE id_8 FLOAT;
DECLARE id88 INT;
SET date1=now();
SET id88='0';
SET id_6=NULL;
SET id_5=NULL;
SET id_1=id_storeG ;
SET id_2=id_user ;
SET id_3=id_product2G ;
SET id_4=final_priceG ;
SELECT id_product2,id_store1,final_price
INTO id_5,id_6,id_7
FROM offer
WHERE id_3=id_product2 and id_1=id_store1 ;                                  # this part controlls if the offer already eixsts, if it does not, the id_5, id_6=null
CALL find_middle_price_from_prev_day('1',@id_4);
SET id_8=id_4+id_4*'0.2';
SELECT score,id_user1
INTO id88
FROM user,offer
WHERE user.id_user=offer.id_user ; 

IF (id_5 is null and id_6 is null) THEN 
SET id88=id88+'50';
CALL delete_points_month;
insert into delete_points (id_user_for_offer,date_for_del,score_month) values
                   (id_user1,date1,'50');
UPDATE user SET score=id88 where id_user=id_user1;
insert into offer (id_offer,id_user,id_product2,final_price,id_store1,icon1,score) values
                   (NULL,id_2,id_3,id_4,id_1,'5aii','50');
ELSEIF ((id_5 is null and id_6 is null) or id_8<id_7) THEN 
CALL delete_points_month;
SET id88=id88+'20';
insert into delete_points (id_user_for_offer,date_for_del,score_month) values
                   (id_user1,date1,'20');
UPDATE user SET score=id88 where id_user=id_user1;
insert into offer (id_offer,id_user,id_product2,final_price,id_store1,icon1,score) values
                   (NULL,id_2,id_3,id_4,id_1,'5aii','20');
ELSE 
insert into offer (id_offer,id_user,id_product2,final_price,id_store1) values
                   (NULL,NULL,NULL,NULL,id_1);
END IF;
END $
DELIMITER ;

DELIMITER $
CREATE TRIGGER offer_user_history1 #vazei sto istoriko tou profil otan kapoios anevazei prosfora
AFTER INSERT ON offer 
FOR EACH ROW 
BEGIN 
DECLARE count DATE;
DECLARE id_offer1 INT UNSIGNED;
DECLARE id_user1 INT;
DECLARE name3 VARCHAR(50);
DECLARE price1 INT;
DECLARE id_product21 INT;
SET count=now();
SET id_offer1=NEW.id_offer;
SET id_user1=NEW.id_user;
SET id_product21=NEW.id_product2;
SET price1=NEW.final_price;
SELECT name1
INTO name3
FROM product
WHERE id_product21=id_product;  
insert into offer_user_history (id_histo,id_offer,name2,day,id_user,price) values
                               (NULL,id_offer1,name3,count,id_user1,price1);
END$
DELIMITER ;






insert into offer (id_offer,id_user,id_product2,final_price,id_store1,p_date) values
                   (NULL,'1','1','45','1','2023-05-31'),
                   (NULL,'2','2','34','2','2023-05-31'),
                   (NULL,'3','3','34','2','2023-05-31'),
                   (NULL,'4','4','56','3','2023-05-31'),
                   (NULL,'5','5','35','3','2023-07-31');


#CALL question__c('cleogeo','CHESSE'); /*epistrefei tis prosfores se mia kathgoria*/
#CALL question__bb('cleogeo'); /*epistrefei ta magazia se mia topothesia me prosfores*/
#CALL question__a('cleogeo'); #emfanizetai h perioxh soy kai ta katasthmata konta soy
#CALL question__b('cleogeo','pizza keropas'); # emfanizetai h perioxh soy kai ta katasthmata me sygkekrimenh onomasia
#CALL password_control('SDDSFF',@G,@H); #elenxei an o kodikos sou exei kapoia symbola
#CALL question__d1('pizza keropas','Maizonos');
#CALL question__aa1('keropas', 'city', 'papakis@gmail','Maizono+_@34*sdfdf');
#SELECT* FROM user;
#CALL question__e1('1','1','1','34'); # eisagei neo offer, parolo poy yparxei kai to palio offer epeidh exei 20% mikroterh timh
#select * from offer;
#select * from store, offer WHERE '1'=id_product2 and '1'=id_store ;
#select * from offer_user_history;




DELIMITER $        


CREATE PROCEDURE ajiologhsh1 (IN id_offer1 INT,id_user1 INT,IN like1 bool)
BEGIN
DECLARE stock1 INT;
DECLARE lik1 INT;
DECLARE id INT;
DECLARE i INT;
SELECT stock
INTO stock1
FROM store,offer
WHERE id_product2=id_product1 and id_offer1=id_offer;

SELECT likes
INTO lik1
FROM offer
WHERE id_offer1=id_offer;

SELECT id_histo
INTO id
FROM offer_user_history
WHERE id_offer1=id_offer ;

IF (stock1 is not null and like1=true) THEN
SET lik1=lik1+'1';
UPDATE  offer
SET likes=lik1
where id_offer1=id_offer;
UPDATE  offer_user_history 
SET likes=lik1
where id=id_histo;
ELSE 
insert into offer (id_offer,id_user,id_product2,final_price,id_store1,likes) values
                   (NULL,"parakali",NULL,NULL,'1',lik1);
END IF;
END $
DELIMITER ;


DELIMITER $
CREATE PROCEDURE check_off1() #elegxei an exei perasei mia ebdomada gia na diagracei thn prosfora
BEGIN
DECLARE id INT;
DECLARE g varchar(50);
DECLARE offer_date DATE;
DECLARE curr DATE;
DECLARE finishedFlag INT;
DECLARE lectCursor CURSOR FOR

SELECT id_offer,p_date,icon1 FROM offer ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO id,offer_date,g;
SET curr=now();

WHILE (finishedFlag=0) DO
IF(curr-offer_date>'7')THEN 
DELETE from offer WHERE id_offer=id;
ELSEIF (curr-offer_date>'7' and g='5aii')THEN
insert into delete_offer (iii,date2) values
                         (id,curr);
END IF ;


SELECT id_offer,p_date FROM offer ;

FETCH lectCursor INTO id,offer_date,g;
END WHILE;
CLOSE lectCursor; 

END $
DELIMITER ;






DELIMITER $
CREATE PROCEDURE delete_off1() #elegxei an exei perasei mia ebdomada gia na diagracei thn prosfora
BEGIN
DECLARE id INT;
DECLARE curr1 DATE;
DECLARE curr DATE;
DECLARE finishedFlag INT;
DECLARE lectCursor CURSOR FOR

SELECT iii,date2 FROM delete_offer ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO id,curr1;
SET curr=now();

WHILE (finishedFlag=0) DO
IF(curr1-curr>'7')THEN 
DELETE from delete_offer WHERE iii=id;
DELETE from offer WHERE id_offer=id;
END IF ;


SELECT iii,date2 FROM delete_offer ;

FETCH lectCursor INTO id,curr1;
END WHILE;
CLOSE lectCursor; 

END $
DELIMITER ; 
#CALL  delete_off1();
#CALL  check_off1;
#select * from offer;
#CALL question__e1('1','1','1','34');


DELIMITER $
CREATE TRIGGER prices_history1 
AFTER INSERT ON store
FOR EACH ROW 
BEGIN 
DECLARE count DATE;
DECLARE id_product11 INT UNSIGNED;
DECLARE id_store2 INT UNSIGNED;
DECLARE id_product22 INT UNSIGNED;
DECLARE p_date1 DATE;
DECLARE price1 FLOAT(6,2);

SET count=now();
SET id_product11=NEW.id_product1;
SET price1=NEW.price;
SELECT id_product1, id_store 
INTO id_product22, id_store2
FROM store
WHERE id_product11=id_product1 and id_store2=id_store and day=count;
DELETE FROM prices_history WHERE id_product22=id_product and id_storee=id_store2;
insert into prices_history (id_price_histo ,id_product,day,price,id_storee) values 
                               (NULL,id_product1,count,price1,default);
END$
DELIMITER ;

DELIMITER $
CREATE TRIGGER prices_history11 
AFTER UPDATE ON store
FOR EACH ROW 
BEGIN 
DECLARE count DATE;
DECLARE id_product11 INT UNSIGNED;
DECLARE id_store2 INT UNSIGNED;
DECLARE id_product22 INT UNSIGNED;
DECLARE p_date1 DATE;
DECLARE price1 FLOAT(6,2);

SET count=now();
SET id_product11=NEW.id_product1;
SET price1=NEW.price;
SELECT id_product1, id_store 
INTO id_product22, id_store2
FROM store
WHERE id_product11=id_product1 and id_store2=id_store and day=count;
DELETE FROM prices_history WHERE id_product22=id_product and id_storee=id_store2;
insert into prices_history (id_price_histo ,id_product,day,price,id_storee) values 
                               (NULL,id_product1,count,price1,default);
END$
DELIMITER ;
insert into product (id_product, category , subcategory,name1) values  #edo mporoyme na eisagoyme nea proionta me diasyndesh me th selida
                    (NULL, 'CHESSE', 'JKDVNJVN','stoupertsi'),
                    (NULL, 'CHESSE', 'SJDVDSJVNDS',NULL),
                    (NULL, 'CHESSE',  'DSNDSNDVND',NULL),
                    (NULL, 'CHEweSSEw',  'DDJSKDVJK',NULL);  
#select * from prices_history;

DELIMITER $
CREATE PROCEDURE find_middle_price_from_prev_day (IN id INT,OUT mid1 FLOAT(6,2)) #elegxei an exei perasei mia ebdomada gia na diagracei thn prosfora
BEGIN
DECLARE midle_val FLOAT(6,2);
DECLARE price1 FLOAT(6,2);
DECLARE curr DATE;
DECLARE id1 INT;
DECLARE counter INT;
DECLARE curr1 DATE;

DECLARE finishedFlag INT;

DECLARE lectCursor CURSOR FOR

SELECT id_price_histo, price,day FROM prices_history WHERE id=id_product ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO id1,price1,curr1;
SET curr=now();
SET counter ='0';
SET midle_val='0';
WHILE (finishedFlag=0) DO
IF (curr-curr1<'2') THEN
SET midle_val=midle_val+price;
SET counter=counter+'1';
END IF ;
SELECT id_price_histo, price,day FROM prices_history WHERE id=id_product ;

FETCH lectCursor INTO id1,price1, curr1;
END WHILE;
IF (counter!='0') THEN
SET mid1=midle_val/counter;
ELSE SET mid1='0';
END IF;
CLOSE lectCursor; 

END $
DELIMITER ;


DELIMITER $
CREATE TRIGGER likesdislikes /* otan ginei eisagogh enos like h dislike sto deletePoint phgainei sthn prosfora kai vazei +1 like */
AFTER INSERT ON delete_points
FOR EACH ROW 
BEGIN 

DECLARE likes_1 INT;
DECLARE dislikes_1 INT;
DECLARE id_product11 INT UNSIGNED;
DECLARE iid_off INT UNSIGNED;
DECLARE id_userX INT UNSIGNED;
DECLARE likesOld INT;
DECLARE dislokiesOld INT;
DECLARE d DATE;

SELECT likes, dislikes, id_user1
INTO likesOld, dislokiesOld ,id_userX
FROM offer 
WHERE id_off=id_offer;
SET d=now();
IF (likesOld>'0') THEN 

SET likes_1=likesOld+'1';
ELSEIF (dislikesOld>'0') THEN
SET dislikes_1=dislokiesOld+'1';
END IF ;
insert into offer (id_offer,id_user,likes,dislikes) values
                   (id_off,id_user_for_offer,likes_1,dislikes_1);
END$
DELIMITER ;





DELIMITER $
CREATE PROCEDURE delete_points_month (IN id INT) #elegxei an exei perasei ENAS MHNAS GIA NA  gia na diagracei ta points
BEGIN
DECLARE id_user_for_offer1 INT;
DECLARE finishedFlag INT;
DECLARE p_1 INT;
DECLARE p_11 INT;
DECLARE d DATE;
DECLARE da DATE;
DECLARE lectCursor CURSOR FOR

SELECT id_user_for_offer, day, points  FROM delete_points WHERE id_user_for_offer=id ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO id_user_for_offer1, da,p_1;
SET d=now();
SET p_11='0';
IF (d-da<"30") THEN 
SET p_11=p_11 + p_1;
DELETE FROM delete_points WHERE id_user_for_offer=id_user_for_offer1;
END IF;
WHILE (finishedFlag=0) DO

SELECT id_user_for_offer,day,points FROM delete_points WHERE id_user_for_offer=id ;

FETCH lectCursor INTO id_user_for_offer1, da,p_1;
IF (d-da<"30") THEN 
SET p_11=p_11 + p_1;
DELETE FROM delete_points WHERE id_user_for_offer=id_user_for_offer1;
END IF;
END WHILE;
UPDATE user SET score_month=p_11 WHERE id_user=id;
CLOSE lectCursor; 


END $
DELIMITER ;



DELIMITER $                                                             /*like, dislike, stock*/
CREATE PROCEDURE question__e123123123 (IN id_storeG INT,id_user1 INT, id_product2G INT,final_priceG INT, l bool, d bool, ou bool, ii bool)
BEGIN
DECLARE date1 date;
DECLARE id_1 INT;
DECLARE id_2 INT;
DECLARE id_3 INT;
DECLARE id_4 INT;
DECLARE id_5 INT;
DECLARE id_6 INT;
DECLARE id_7 INT;
DECLARE id_8 INT;
DECLARE id88 INT;
DECLARE id_67 INT ;
SET date1=now();
SET id88='0';
SET id_6=NULL;
SET id_5=NULL;
SET id_1=id_storeG ;
SET id_2=id_user ;
SET id_3=id_product2G ;
SET id_4=final_priceG ;

SELECT id_product2,id_store1,likes,dislikes, id_user,id_offer
INTO id_5,id_6,id_7,id_8,id_4,id_67
FROM offer
WHERE id_3=id_product2 and id_1=id_store1 ;                                  # this part controlls if the offer already eixsts, if it does not, the id_5, id_6=null


 

IF (l is true) THEN
insert into delete_points (id_user_for_offer,offer_i,likes,day) values
                          (id_4,id_67,id_8+'1',date1);
ELSEIF (d is true) THEN 
insert into delete_points (id_user_for_offer,offer_i,dislikes,day) values
                          (id_4,id_67,id_8+'1',date1);
ELSEIF (ou is true) THEN

UPDATE offer SET stock='0' where id_3=id_product2 and id_1=id_store1 ;

ELSEIF (ii is true) THEN

UPDATE offer SET stock='1' where id_3=id_product2 and id_1=id_store1 ;

END IF;
END $
DELIMITER ;


DELIMITER $
CREATE PROCEDURE count_users (OUT num1 INT) 
BEGIN

DECLARE num INT;
DECLARE num1 INT;
DECLARE num2 INT;
DECLARE finishedFlag INT;

DECLARE lectCursor CURSOR FOR

SELECT id_user FROM user WHERE id_user>'0' ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;
SET num1='0';
FETCH lectCursor INTO num;
SET num1=num1+'1';

WHILE (finishedFlag=0) DO

SELECT id_user FROM user WHERE id_user>'0';
SET num1=num1+'1';
FETCH lectCursor INTO num;
END WHILE;

CLOSE lectCursor; 

END $
DELIMITER ;


DELIMITER $
CREATE PROCEDURE delete_points_month1 () #elegxei an exei perasei ENAS MHNAS GIA NA  gia na diagracei ta points
BEGIN
DECLARE id_user_for_offer1 INT;
DECLARE finishedFlag INT;
DECLARE p_1 INT;
DECLARE p_11 INT;
DECLARE d DATE;
DECLARE da DATE;
DECLARE lectCursor CURSOR FOR

SELECT id_user_for_offer, day, points  FROM delete_points WHERE id_user_for_offer>='0' ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN lectCursor;
SET finishedFlag=0;

FETCH lectCursor INTO id_user_for_offer1;
SET d=now();
CALL delete_points_month(id_user_for_offer1);
WHILE (finishedFlag=0) DO

SELECT id_user_for_offer,day,points FROM delete_points WHERE id_user_for_offer>='0' ;

FETCH lectCursor INTO id_user_for_offer1;
CALL delete_points(id_user_for_offer1);
END WHILE;

CLOSE lectCursor; 


END $
DELIMITER ;
