CREATE DATABASE `tibamefe_cgd103g2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tibamefe_cgd103g2`;
-- 會員 member 
DROP TABLE IF EXISTS member;
CREATE TABLE member(
mem_id int AUTO_INCREMENT NOT NULL PRIMARY KEY , 
mem_name varchar(10),
sex tinyint,
bday date,
mem_pic varchar(20),
phone char(10),
mem_mail varchar(20) UNIQUE,
mem_pwd varchar(10),
address varchar(100),
level_id int,
body_id int,
style_id int,
mem_date date,
chest int,
shoulder int,
waistline int,
hip int,
clothes int,
pants int,
shoesize int,
height int,
weight int
)
AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
INSERT INTO member
VALUES
(NULL,'林曉晴',0,'2000-02-16',NULL,'0933456456','qw4898@gmail.com','ser123','桃園市中壢區復興路1號1樓',101,101,102,'2022-07-11',33,40,60,80,57,89,37,150,45),
(NULL,'黃小芹',0,'1995-04-18',NULL,'0933456456','uo8436@gmail.com','ser123','桃園市中壢區復興路2號2樓',102,102,102,'2022-07-11',36,37,67,81,60,91,38,160,50),
(NULL,'王小明',1,'1994-12-16',NULL,'0933456456','skg3338@gmail.com','swe123','桃園市中壢區復興路3號3樓',NULL,105,103,'2022-08-11',40,38,68,90,70,99,38,170,80),
(NULL,'林志軒',1,'2000-02-16',NULL,'0933456456','111@gmail.com','ser123','桃園市中壢區復興路1號1樓',NULL,101,102,'2022-08-11',33,40,60,80,57,89,37,150,45),
(NULL,'金玉婷',0,'1995-04-18',NULL,'0933456456','222@gmail.com','ser123','桃園市中壢區復興路2號2樓',102,102,102,'2022-08-11',36,37,67,81,60,91,38,160,50),
(NULL,'張鴻聿',1,'1994-12-16',NULL,'0933456456','333@gmail.com','swe123','桃園市中壢區復興路3號3樓',NULL,105,103,'2022-08-11',40,38,68,90,70,99,38,170,80),
(NULL,'黃怡婷',0,'2000-02-16',NULL,'0933456456','444@gmail.com','ser123','桃園市中壢區復興路1號1樓',101,101,102,'2022-09-11',33,40,60,80,57,89,37,150,45),
(NULL,'劉淑芬',0,'1995-04-18',NULL,'0933456456','555@gmail.com','ser123','桃園市中壢區復興路2號2樓',102,102,102,'2022-09-11',36,37,67,81,60,91,38,160,50),
(NULL,'馮家維',1,'1994-12-16',NULL,'0933456456','666@gmail.com','swe123','桃園市中壢區復興路3號3樓',NULL,105,103,'2022-09-11',40,38,68,90,70,99,38,170,80),
(NULL,'林佳慧',0,'1995-04-18',NULL,'0933456456','777@gmail.com','ser123','桃園市中壢區復興路2號2樓',102,102,102,'2022-10-11',36,37,67,81,60,91,38,160,50),
(NULL,'邱峻豪',1,'1994-12-16',NULL,'0933456456','888@gmail.com','swe123','桃園市中壢區復興路3號3樓',NULL,105,103,'2022-10-11',40,38,68,90,70,99,38,170,80),
(NULL,'楊偉哲',1,'2000-02-16',NULL,'0933456456','999@gmail.com','ser123','桃園市中壢區復興路1號1樓',101,101,102,'2022-11-11',33,40,60,80,57,89,37,150,45),
(NULL,'季佳慧',0,'1995-04-18',NULL,'0933456456','1010@gmail.com','ser123','桃園市中壢區復興路2號2樓',NULL,102,102,'2022-11-11',36,37,67,81,60,91,38,160,50),
(NULL,'陳茜如',0,'1994-12-16',NULL,'0933456456','1111@gmail.com','swe123','桃園市中壢區復興路3號3樓',NULL,105,103,'2022-11-11',40,38,68,90,70,99,38,170,80),
(NULL,'許傑森',1,'2000-02-16',NULL,'0933456456','jason@gmail.com','ser123','桃園市中壢區復興路1號1樓',101,101,102,'2022-12-11',33,40,60,80,57,89,37,150,45),
(NULL,'江家純',0,'1995-04-18',NULL,'0933456456','aaabb@gmail.com','ser123','桃園市中壢區復興路2號2樓',102,102,102,'2022-12-11',36,37,67,81,60,91,38,160,50),
(NULL,'魏家佑',1,'1994-12-16',NULL,'0933456456','master@gmail.com','swe123','桃園市中壢區復興路3號3樓',103,105,103,'2022-12-11',40,38,68,90,70,99,38,170,80);

-- 訂單 orders
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
order_id int  AUTO_INCREMENT NOT NULL PRIMARY KEY,
order_con tinyint ,
order_time datetime,
mem_id int NOT NULL,
emp_id int NOT NULL,
total    int,
discount decimal(3,2),
order_paid int,
ord_addr varchar(100),
ord_mem varchar(10),
ord_phone char(10)
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO orders(order_con,order_time,mem_id,emp_id,total,discount,order_paid,ord_addr,ord_mem,ord_phone)
VALUES
(1,'2022-08-04 00:00:00',101,102,300,0.8,240,'新竹市五福路16號','魏嘉佑','0982777649'),
(1,'2022-08-04 00:00:00',103,102,300,0.9,270,'新竹市五福路16號','林曉梅','0982777649'),
(2,'2022-08-04 00:00:00',103,102,300,0.95,285,'新竹市五福路16號','徐鈺婷','0982777649'),
(3,'2022-08-04 00:00:00',102,101,300,0.8,240,'新竹市五福路16號','張曼玉','0982777649');

-- 一週穿搭 weeklywear
DROP TABLE IF EXISTS weeklywear;
CREATE TABLE IF NOT EXISTS weeklywear
(
weeklywear_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
weeklywear_week tinyint,
weeklywear_pic varchar(100),
weeklywear_day varchar(10), 
weeklywear_sex tinyint
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;


INSERT INTO  weeklywear (weeklywear_week , weeklywear_pic,weeklywear_day,weeklywear_sex)
VALUES
(1,"female01.jpg", "monday",0),
(1,"female02.jpg", "tuesday",0),
(1,"female03.jpg", "wednesday",0),
(1,"female04.jpg", "thursday",0),
(1,"female05.jpg", "friday",0),
(1,"female06.jpg", "weekend",0),
(1,"male01.jpg", "monday",1),
(1,"male02.jpg", "tuesday",1),
(1,"male03.jpg", "wednesday",1),
(1,"male04.jpg", "thursday",1),
(1,"male05.jpg", "friday",1),
(1,"male06.jpg", "weekend",1);

-- 訂單項目 order_item
DROP TABLE IF EXISTS order_item;
CREATE TABLE IF NOT EXISTS order_item(
order_item_id int  AUTO_INCREMENT NOT NULL PRIMARY KEY,
order_id int NOT NULL,
product_id int NOT NULL,
quantity int,
item_price int,
item_total int,
size varchar(3),
color varchar(10)
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO order_item(order_id,product_id,quantity,item_price,item_total,size,color)
VALUES
(101,101,4,300,1200,'M','#008000'),
(101,102,2,300,600,'S','#0000FF'),
(101,103,12,300,3600,'L','#FF0000');

-- (101,101,4,300,1200,'M','green'),
-- (101,102,2,300,600,'S','blue'),
-- (101,103,12,300,3600,'L','red');
-- 造型師 stylist
DROP TABLE IF EXISTS stylist;
CREATE TABLE IF NOT EXISTS stylist
(
stylist_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
emp_name varchar(20),
emp_id int NOT NULL,
expertise_descrip varchar(100),
stylist_pic varchar(100)
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO stylist (emp_name,emp_id,expertise_descrip,stylist_pic)
VALUES
('Josh Dion',103,'擅長時尚風格,用前衛的單品,搭配出衝突的美感','stylist-kol.jpg'),
('Kevin',104,'擅長時尚風格,用前衛的單品,搭配出衝突的美感','stylist-1.jpg'),
('Molly',105,'擅長極簡風格,用簡單的單品,搭配出不一樣的風格','stylist-2.jpg');

-- 	預約諮詢 appointment
DROP TABLE IF EXISTS appointment;
CREATE TABLE IF NOT EXISTS appointment
(
appointment_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
mem_id int NOT NULL,
emp_id int,
appointment_date date,
appointment_time varchar(20),
appointment_qa varchar(200),
appointment_qatext varchar(500),
appointment_state tinyint
)
AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO appointment 
VALUES
	(null,102, 103,'2022-12-1', '10:00', '網購衣服不清楚怎麼挑合適的尺寸','我有問題我有問題我有問題我有問題我有問題我有問題我有問題我有問題',0 ),
	(null,103, 104,'2022-12-20', '14:00', '不確定特定場合怎麼穿搭','好多問題好多問題好多問題好多問題好多問題好多問題',0 ),
	(null,101, 105,  '2022-12-15', '19:00','想學穿搭不知道怎麼開始','問題求解問題求解問題求解問題求解問題求解',0);
    
-- 單品商品 product
DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product(
product_id	int AUTO_INCREMENT NOT NULL PRIMARY KEY,
product_name	varchar(20),
hashtag	varchar(100),
unit_price	int,
product_state	tinyint,
product_maintype	varchar(20),
product_type	varchar(20),
product_pic	varchar(100),
style_type	varchar(100),
body_type	varchar(100),
product_gender	tinyint,
product_color	varchar(100),
product_color_name varchar(10),
product_size	varchar(100),
product_text varchar(100)
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product(
product_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
product_name varchar(20),
hashtag varchar(100),
unit_price int,
product_state tinyint,
product_maintype varchar(20),
product_type varchar(20),
product_pic varchar(100),
style_type varchar(100),
body_type varchar(100),
product_gender tinyint,
product_color varchar(100),
product_color_name varchar(10),
product_size varchar(100),
product_text varchar(100)
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;


INSERT INTO product (product_name, hashtag, unit_price, product_state, product_maintype, product_type, product_pic, style_type, body_type, product_gender, product_color,product_color_name, product_size,product_text) VALUES
 ('襯衫', '極簡風,素色,倒三角型', 500, 1, '上身', '長袖', 'F1_01_1.jpg,F1_01_2.jpg', '極簡風', '倒三角型', 1,'#FFFFFF,#0000FF', null,'XS,S,M,L,XL',null ),
 ('長褲', '極簡風,矩形', 600, 1, '下身', '長褲', 'F1_02_1.jpg', '極簡風', '矩形', 1, '#000000',null ,'XS,S,M,L,XL',null ),
 ('皮鞋', '極簡風,皮革,蘋果型', 1200, 1, '鞋款', '皮鞋', 'F1_03_1.jpg', '極簡風', '蘋果型', 1, '#000000', null,'25,26,27,28,29,30,31',null),
 ( '前口袋連帽外套', '文青風,梨型', 900, 1, '上身', '外套', 'F2_01_1.jpg', '文青風', '梨型', 1, '#003366',null ,'XS,S,M,L,XL',null ),
 ('毛帽', '文青風,休閒風,針織', 300, 1, '配件', '配件', 'F2_02_1.jpg', '文青風,休閒風', null, 1, '#CC5500',null, 'F',null),
 ( '大口袋長褲', '文青風,倒三角型', 550, 1, '下身', '長褲', 'F2_03_1.jpg,F2_03_2.jpg', '文青風,休閒風,運動風', '沙漏型', 1, '#000000,#FFFFFF',null ,'XS,S,M,L,XL',null ),
 ( '皮製外套', '時尚風,皮革,矩形', 1300, 1, '上身', '外套', 'F3_01_1.jpg', '時尚風', '矩形', 1, '#000000',null ,'XS,S,M,L,XL',null ),
 ('連帽外套', '時尚風,蘋果型', 600, 1, '上身', '外套', 'F3_02_1.jpg', '時尚風,休閒風,運動風', '蘋果型', 1, '#FFFFFF',null ,'XS,S,M,L,XL',null ),
 ( '牛仔褲', '時尚風,單寧,梨型', 700, 1, '下身', '長褲', 'F3_03_1.jpg', '時尚風,休閒風', '梨型', 1, '#0000FF',null ,'XS,S,M,L,XL',null ),
 ( '運動鞋', '時尚風,運動風', 900, 1, '鞋款', '運動鞋', 'F3_04_1.jpg,F3_04_2.jpg', '時尚風,運動風', null, 1, '#FFFFFF', null,'25,26,27,28,29,30,31',null),
 ( '運動鞋', '運動風', 900, 1, '鞋款', '運動鞋', 'F4_02_1.jpg,F4_02_2.jpg', '運動風', null, 1, '#808080',null, '25,26,27,28,29,30,31',null),
 ('針織上衣', '文青風,針織,倒三角型', 900,1, '上身', '長袖', 'W1_01_1.jpg', '文青風', '倒三角型', 0, '#808080',null ,'XS,S,M,L,XL',null ),
 ( '襯衫', '文青風,矩形', 900, 1, '上身', '長袖', 'W1_02_1.jpg', '文青風', '矩形', 0, '#0000FF',null ,'XS,S,M,L,XL',null ),
 ( '黑裙', '文青風,蘋果型', 900, 1, '下身', '裙子', 'W1_03_1.jpg', '文青風', '蘋果型',0 ,'#000000',null ,'XS,S,M,L,XL',null ),
 ('小白鞋', '文青風,極簡風', 900, 1, '鞋款', '運動鞋', 'W1_04_1.jpg', '文青風,極簡風', null, '0', '#FFFFFF',null, '22,23,24,25,26',null),
 ( '洋裝', '時尚風,梨型', 1200, 1, '下身', '裙子', 'W2_01_1.jpg', '時尚風', '梨型', 0, '#FFFFFF',null ,'XS,S,M,L,XL',null ),
 ( '低跟鞋', '時尚風', 1800, 1, '鞋款', '跟鞋', 'W2_02_1.jpg,W2_02_2.jpg', '時尚風', null, 0, '#C0C0C0',null ,'22,23,24,25,26',null),
 ( '運動外套', '運動風,矩形', 900,1, '上身', '外套', 'W3_01_1.jpg', '運動風', '矩形', 0, '#E32636',null ,'XS,S,M,L,XL',null ),
 ( '豹紋長褲', '運動風,倒三角型', 900, 1, '下身', '長褲', 'W3_03_1.jpg', '運動風', '沙漏型', 0, '#4D1F00',null ,'XS,S,M,L,XL',null ),
 ( '黑鞋', '運動風,休閒風', 1200, 1, '鞋款', '皮鞋', 'W3_02_1.jpg', '時尚風,休閒風', null, 0, '#000000',null ,'22,23,24,25,26',null),
 ('襯衫', '極簡風,素色,蘋果型', 900, 1, '上身', '長袖', 'W4_01_1.jpg', '極簡風', '蘋果型', 0, '#FFFFFF',null ,'XS,S,M,L,XL',null ),
 ('長褲', '極簡風,梨型', 900, 1, '下身', '長褲', 'W4_02_1.jpg', '極簡風', '梨型', 0, '#000000',null ,'XS,S,M,L,XL',null ),
 ('合身剪裁長版大衣', '極簡風,素色,沙漏型', 5590, 1, '外套', '大衣', 'look-item-1.png', '極簡風', '沙漏型', 0, '#9c743b','brown' ,'XS,S,M,L,XL','一件剪裁考究的外套，可以根據您的著裝和溫度，將衣領向上或向下穿著' ),
 ('簡約條紋襯衫', '極簡風,素色,沙漏型', 1990, 1, '上身', '襯衫', 'look-item-2.png', '極簡風', '沙漏型', 0, '#fff1d4','beige' ,'XS,S,M,L,XL','舒適的棉質襯衫。設計點是清新的條紋圖案' ),
 ('平紋針織高喬褲', '極簡風,素色,沙漏型', 1290, 1, '下身', '長褲', 'look-item-3.png', '極簡風', '沙漏型', 0, '#fff1d4','beige' ,'XS,S,M,L,XL','通過排列環，您可以享受直線和曲線的輪廓' ),
 ('時尚短靴', '時尚風,素色,沙漏型', 3990, 1, '鞋款', '靴子', 'look-item-4.png', '時尚風', '沙漏型', 0, '#0000','black' ,'XS,S,M,L,XL','從材料到細節，我們都非常注重細節，以實現舒適性和高設計性' ),
 ('V領針織背心', '時尚風,素色,沙漏型', 1990, 1, '上身', '背心', 'look-item-5.png', '時尚風', '沙漏型', 1, '#0b6d32','green' ,'XS,S,M,L,XL','搭配單品，可以乾淨利落或隨意穿著的便利單品' ),
 ('棉質圓領長袖T恤', '極簡風,素色,矩型', 990, 1, '上身', '長袖', 'look-item-6.png', '極簡風', '矩型', 1, '#b5a5df','purple' ,'XS,S,M,L,XL','摸起來很光滑。具有防紫外線功能的高機能性T卹' ),
 ('修身斜紋棉布褲', '極簡風,素色,矩型', 1990, 1, '下身', '長褲', 'look-item-7.png', '極簡風', '矩型', 1, '#9999','gray' ,'XS,S,M,L,XL','簡潔的廓形和高品質的細節給人以簡潔印象的卡其褲' ),
 ('棉質運動褲', '運動風,素色,蘋果型', 990, 1, '下身', '長褲', 'look-item-8.png', '運動風', '蘋果型', 1, '#eeeee','gray' ,'XS,S,M,L,XL','乾淨的表面使其適合各種風格。羅紋腰身和下擺，利落合身' ),
 ('帆布運動鞋', '運動風,素色,蘋果型', 1990, 1, '鞋款', '運動鞋', 'look-item-9.png', '運動風', '蘋果型', 1, '#FFFFFF','white' ,'27,28,29,30,31','對細節充滿關注，佩戴起來極其舒適' ),
 ('牛仔外套', '時尚風,牛仔色,倒三角型', 3990, 1, '外套', '牛仔外套', 'look-item-10.png', '時尚風', '倒三角型', 1, '#00000','black' ,'XS,S,M,L,XL','真正的牛仔夾克長度也很短，穿著舒適，專為現代設計' ),
 ('素色大學Ｔ', '運動風,素色,矩型', 990, 1, '上身', '長袖', 'look-item-11.png', '運動風', '矩型', 1, '#2d51af','blue' ,'XS,S,M,L,XL','特別注重精緻美觀的表面和良好的皮膚。注重細節的成熟運動衫' ),
 ('時尚緊身牛仔褲', '時尚風,素色,矩型', 3990, 1, '下身', '牛仔褲', 'look-item-12.png', '時尚風', '矩型', 1, '#ffa9ec','pink' ,'XS,S,M,L,XL','質感進化得更加優雅。穿著舒適，輪廓簡潔' ),
 ('素色漁夫帽', '時尚風,素色', 990, 1, '配件', '帽子', 'look-item-13.png', '極簡風', '蘋果型', 1, '#00000','black' ,'F','可用於各種場景，功能性強且方便' ),
 ('羊毛圓領毛衣', '文青風,素色,沙漏型', 1690, 1, '上身', '毛衣', 'look-item-14.png', '文青風', '沙漏型', 1, '#0dbd54','green' ,'XS,S,M,L,XL','100% 細羊毛，質地細膩美麗。更新後表面看起來更乾淨' ),
 ('超細條紋襯衫', '文青風,條紋色,沙漏型', 1290, 1, '上身', '襯衫', 'look-item-15.png', '文青風', '沙漏型', 1, '#2e9fff','blue' ,'XS,S,M,L,XL','減少洗滌後的頑固皺紋。您可以享受適度的休閒和粗獷' ),
 ('寬版牛仔褲', '文青風,素色,蘋果型', 2290, 1, '下身', '牛仔褲', 'look-item-16.png', '文青風', '蘋果型', 1, '#2e9fff','blue' ,'XS,S,M,L,XL','即使很寬也可以乾淨利落地穿著。結合工作品味細節以獲得完整的完成' ),
 ('寬條紋襯衫', '文青風,條紋色,梨型', 1690, 1, '上身', '襯衫', 'look-item-17.png', '文青風', '梨型', 1, '#2e9fff','blue' ,'XS,S,M,L,XL','使用超長棉的優質棉質襯衫。成色好，故彩紋美觀，質感極佳' ),
 ('直筒牛仔褲', '極簡風,素色,矩型', 3990, 1, '下身', '牛仔褲', 'look-item-18.png', '極簡風', '矩型', 1, '#00000','black' ,'XS,S,M,L,XL','鑲邊牛仔布會變成穿得越多味道越好的牛仔' ),
 ('文青細框圓眼鏡', '文青風,素色,蘋果型', 3690, 1, '配件', '眼鏡', 'look-item-19.png', '文青風', '蘋果型', 1, '#00000','black' ,'F','乾淨時尚的設計。沉穩的金屬鏡框可與各種裝扮相得益彰' ),
 ('棉質長袖衛衣', '極簡風,素色,蘋果型', 990, 1, '上身', '長袖', 'look-item-20.png', '極簡風', '蘋果型', 0, '#ffa9ec','pink' ,'XS,S,M,L,XL','我們使用的材料特別注重精緻美觀的棉質衛衣' ),
 ('斜紋棉布褲', '極簡風,素色,蘋果型', 1290, 1, '下身', '長褲', 'look-item-21.png', '極簡風', '蘋果型', 0, '#2d481d','armygreen' ,'XS,S,M,L,XL',' 100% 棉製成的傳統斜紋棉布褲' ),
 ('時尚平底鞋', '時尚風,亮色,沙漏型', 2390, 1, '鞋款', '平底鞋', 'look-item-22.png', '時尚風', '沙漏型', 0, '#bec0c7','silver' ,'22,23,24,25,26','使用高雅材質，講究設計感和舒適度的平底鞋' ),
 ('光面圓領毛衣', '極簡風,素色,沙漏型', 690, 1, '上身', '毛衣', 'look-item-23.png', '極簡風', '沙漏型', 0, '#2e9fff','blue' ,'XS,S,M,L,XL','觸感柔軟，不會刺激皮膚。您可以搭配休閒廓形，打造精緻造型' ),
 ('光面半身裙', '極簡風,素色,沙漏型', 890, 1, '下身', '裙子', 'look-item-24.png', '極簡風', '沙漏型', 0, '#2e9fff','blue' ,'XS,S,M,L,XL','柔軟且不刺激皮膚的針織裙' ),
 ('時尚翻領大衣', '時尚風,素色,沙漏型', 3990, 1, '外套', '大衣', 'look-item-25.png', '時尚風', '沙漏型', 0, '#fff1d4','beige' ,'XS,S,M,L,XL','干淨利落又可休閒穿著的傳統單品。寬鬆版型使其易於穿戴' ),
 ('棉質圓領毛衣', '文青風,素色,梨型', 1690, 1, '上身', '毛衣', 'look-item-26.png', '文青風', '梨型', 0, '#0b6d32','green' ,'XS,S,M,L,XL','質地和顏色都很漂亮，輪廓很乾淨俐落' ),
 ('羽絨保暖背心', '運動風,素色,蘋果型', 3990, 1, '外套', '背心', 'look-item-27.png', '運動風', '蘋果型', 0, '#9c743b','brown' ,'XS,S,M,L,XL','柔軟保暖。它不僅可以用作外衣，還可以用作防寒的內層' ),
 ('條紋棉質長裙', '文青風,條紋色,沙漏型', 1390, 1, '上身', '長裙', 'look-item-28.png', '文青風', '沙漏型', 0, '#2e9fff','blue' ,'XS,S,M,L,XL','更新為更美麗的輪廓。還建議將其用作外罩。' ),
 ('雪紡百摺裙', '時尚風,素色,沙漏型', 990, 1, '下身', '裙子', 'look-item-29.png', '時尚風', '沙漏型', 0, '#2e9fff','blue' ,'XS,S,M,L,XL','充分發揮質感的褶皺設計。每次移動時輕輕搖晃即可優雅地佩戴它' ),
 ('超細羊毛圓領毛衣', '文青風,素色,梨型', 1690, 1, '上身', '長袖', 'look-item-30.png', '文青風', '梨型', 0, '#b5a5df','purple' ,'XS,S,M,L,XL','100% 細羊毛，質地細膩美麗。通過對細節的調整，演變為更加舒適的合身' ),
 ('彈力錐型褲', '時尚風,素色,倒三角型', 1290, 1, '下身', '長褲', 'look-item-31.png', '時尚風', '倒三角型', 0, '#b5a5df','purple' ,'XS,S,M,L,XL','即使有彈性腰身也看起來優雅乾淨的褲子。廓形略呈錐形，不易勾勒腿部線條' ),
 ('文青平底鞋', '文青風,素色,蘋果型', 2290, 1, '鞋款', '平底鞋', 'look-item-32.png', '文青風', '蘋果型', 0, '#00000','black' ,'22,23,24,25,26','使用高雅材質，講究設計感和舒適度的平底鞋' ),
 ('混紡V領毛衣', '極簡風,素色,沙漏型', 1190, 1, '上身', '毛衣', 'look-item-33.png', '極簡風', '沙漏型', 0, '#b5a5df','purple' ,'XS,S,M,L,XL','舒適的無接縫毛衣，可以搭配各種各樣的東西' ),
 ('都會條紋襯衫', '極簡風,條紋色,沙漏型', 1290, 1, '上身', '襯衫', 'look-item-35.png', '極簡風', '沙漏型', 0, '#b5a5df','purple' ,'XS,S,M,L,XL','100% 優質棉襯衫。單品廓形休閒，可單獨穿著或作為外罩穿著' ),
  ('彈力雙面開衩裙', '極簡風,素色,蘋果型', 990, 1, '下身', '裙子', 'look-item-34.png', '極簡風', '蘋果型', 0,'#00000','black'  ,'XS,S,M,L,XL','結實而有彈性的材料營造出美麗的輪廓。你可以把它穿得乾淨漂亮' );

-- 組合商品 product_combo
DROP TABLE IF EXISTS product_combo;
CREATE TABLE IF NOT EXISTS  product_combo(
combo_id	int AUTO_INCREMENT NOT NULL PRIMARY KEY,
combo_name	varchar(100),
combo_main_pic	varchar(100),
combo_pic	varchar(100),
hashtag	varchar(100),
emp_id	int	,
body_type	varchar(100),
style_type	varchar(100),
combo_price	int	
)AUTO_INCREMENT=901 DEFAULT CHARSET=utf8mb4;


INSERT INTO  product_combo (combo_name,combo_main_pic, combo_pic, hashtag, emp_id, body_type, style_type, combo_price) VALUES
	-- ('男仕極簡', 'F1_00.jpg', '極簡風', 103, '倒三角型', '極簡風', 2300),
	-- ('嘻哈文青', 'F2_00.jpg', '文青風', 103, '矩形', '文青風', 1750),
	-- ('時尚牛仔', 'F3_00.jpg', '時尚風', 103, '沙漏型', '時尚風', 3500),
	-- ('運動男子', 'F4_00.jpg', '運動風', 104, '梨型', '運動風', 1800),
	-- ('文青女子', 'W1_00.jpg', '文青風', 104, '蘋果型', '文青風', 3600),
	-- ('舞台表演', 'W2_00.jpg', '時尚風', 104, '梨型', '時尚風', 3000),
	-- ('運動風', 'W3_00.jpg', '運動風', 105, '沙漏型', '運動風', 3000),
	-- ('極簡女子','W4_00.jpg', '極簡風', 105, '蘋果型', '極簡風', 1800),
  ('學院文青穿搭','look-1.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '文青風', 101, '矩型', '文青風', null),
  ('居家運動穿搭','look-2.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '運動風', 102, '蘋果型', '運動風', null),
  ('極簡混搭穿搭','look-3.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '極簡風', 103, '沙漏型', '極簡風', null),
  ('日系文青穿搭','look-4.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '文青風', 104, '梨型', '文青風', null),
  ('簡約時尚穿搭','look-5.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '時尚風', 105, '沙漏型', '時尚風', null),
  ('舒適運動穿搭','look-6.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '運動風', 101, '蘋果型', '運動風', null),
  ('時尚OL穿搭','look-7.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '時尚風', 102, '沙漏型', '時尚風', null),
  ('時尚機能混搭穿搭','look-8.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '時尚風', 103, '沙漏型', '時尚風', null),
  ('簡約舒適穿搭','look-9.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '極簡風', 104, '矩型', '極簡風', null),
  ('時尚韓系穿搭','look-10.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '時尚風', 105, '沙漏型', '時尚風', null),
	('都會簡約時尚穿搭','look-11.jpg','look-info-pic1.png,look-info-pic2.png,look-info-pic3.png,look-info-pic4.png,look-info-pic5.png', '極簡風', 101, '沙漏型', '極簡風', null);


-- 廠商 client
DROP TABLE IF EXISTS client;
CREATE TABLE IF NOT EXISTS client(
client_id    int  AUTO_INCREMENT NOT NULL PRIMARY KEY,
client_name   varchar(20) NOT NULL,
client_person  varchar(20) NOT NULL,
client_phone   char(10) ,
client_mail  varchar(100),
client_meg text,
reply  tinyint,
clientmes_time  datetime,
emp_id int
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO client
(client_name,client_person,client_phone,client_mail,client_meg,reply,clientmes_time,emp_id)
VALUES
('GU','劉怡伶',0935151426,'gu_office@gmail','想合作麻煩盡快回復', 0 ,'2022-12-1 00:00:00' ,101),
('ZARA','江家純',0987926011,'zara_office@yahoo.com.tw','我這邊有十萬件衣服，可以提供給你們',1,'2022-11-30 00:00:00',101),
('H&M','謝冠廷',0322136789,'hnm_office@gmail.com','想合作，但想知道你們如何分潤',1,'2022-10-23 00:00:00',101);

-- 問題 order_qa
DROP TABLE IF EXISTS order_qa;
CREATE TABLE IF NOT EXISTS order_qa(
meg_id    int  AUTO_INCREMENT NOT NULL PRIMARY KEY,
order_id   int  NOT NULL,
meg_time  datetime,
meg_status  tinyint,
meg_cont text,
mem_id  int,
emp_id int
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO order_qa(order_id,meg_time,meg_status,meg_cont,mem_id,emp_id)
VALUES
(101,'2022-08-05 16:00:00',1,'想詢問如何退貨？',101,null),
(101,'2022-08-06 16:00:00',0,'只要14天以內都可以退貨唷，或者也可以參考我們的FAQ說明',null,102);

-- 收藏商品  collect_product
DROP TABLE IF EXISTS collect_product;
CREATE TABLE IF NOT EXISTS collect_product(
mem_id int  , 
product_id int ,
PRIMARY KEY(mem_id, product_id) 
)DEFAULT CHARSET=utf8mb4 ;

INSERT INTO collect_product (mem_id, product_id) VALUES
	(101, 101),
	(101, 104),
	(101, 111),
	(102, 122),
	(102, 104),
	(102, 105),
	(102, 106),
	(102, 107),
	(103, 102),
	(103, 120),
	(103, 103),
	(103, 116);

-- 收藏組合商品 (收藏穿搭) collect_combo
DROP TABLE IF EXISTS collect_combo;
CREATE TABLE IF NOT EXISTS collect_combo(
mem_id int  , 
combo_id int,
PRIMARY KEY(mem_id, combo_id)
 )DEFAULT CHARSET=utf8mb4;

-- INSERT INTO collect_combo (mem_id, combo_id) VALUES
-- 	(101, 901),
-- 	(101, 902),
-- 	(102, 903),
-- 	(103, 904);
 
 -- 組合商品項目 combo_item
 DROP TABLE IF EXISTS combo_item;
 CREATE TABLE IF NOT EXISTS  combo_item 
(
    combo_id	int NOT NULL,
    product_id	int NOT NULL,
    PRIMARY KEY(combo_id, product_id)
)DEFAULT CHARSET=utf8mb4;

INSERT INTO combo_item (combo_id, product_id) VALUES
-- 	(901, 101),
-- 	(901, 102),
-- 	(901, 103),
-- 	(902, 104),
-- 	(902, 105),
--     (902, 106),
-- 	(903, 107),
-- 	(903, 108),
-- 	(903, 109),
--     (903, 110),
-- 	(904, 104),
-- 	(904, 111),
-- 	(905, 112),
-- 	(905, 113),
--     (905, 114),
--     (905, 115),
-- 	(906, 116),
-- 	(906, 117),
-- 	(907, 118),
-- 	(907, 119),
--     (907, 120),
-- 	(908, 121),
-- 	(908, 122),
	(911, 123),
	(911, 124),
	(911, 125),
	(911, 126),
  (901, 127),
	(901, 128),
	(901, 129),
	(902, 130),
  (902, 131),
	(903, 132),
	(903, 133),
	(903, 134),
  (904, 135),
	(904, 136),
	(904, 137),
	(904, 138),
  (905, 139),
	(905, 140),
	(905, 141),
	(906, 142),
  (906, 143),
	(906, 144),
	(907, 145),
	(907, 146),
  (907, 147),
  (902, 148),
  (908, 149),
  (908, 150),
  (908, 151),
  (909, 152),
  (909, 153),
  (910, 154),
  (910, 155),
  (910, 156),
  (910, 157);

 
-- 員工 emp
DROP TABLE IF EXISTS emp;
CREATE TABLE IF NOT EXISTS emp
(
emp_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
emp_name varchar(20) NOT NULL,
job varchar(20),
hiredate date,
emp_pwd varchar(20),
emp_mail varchar(100),
emp_state tinyint
)AUTO_INCREMENT = 101 DEFAULT CHARSET=utf8mb4;
INSERT INTO emp (emp_name, job, hiredate, emp_pwd, emp_mail, emp_state)
VALUES
('Jason','員工','2022-10-22','101','Jason@gmail.com',1),
('Mandy','員工','2022-10-22','102','Mandy@gmail.com',1),
('Josh Dion','造型師','2022-10-23','103','JoshDion@gmail.com',1),
('Kevin','造型師','2022-10-23','104','Kevin@gmail.com',1),
('Molly','造型師','2022-11-23','105','Molly@gmail.com',1);

-- 風格 style
DROP TABLE IF EXISTS style;
CREATE TABLE IF NOT EXISTS style
(
style_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
style_name varchar(20) NOT NULL,
style_descrip varchar(255),
style_pic varchar(20)
)AUTO_INCREMENT = 101 DEFAULT CHARSET=utf8mb4;
INSERT INTO style (style_name, style_descrip, style_pic)
VALUES
('運動風','運動休閒風日愈成為主流趨勢，從以前因運動需求才穿上運動裝，到現在運動裝已經普遍成為了一種常見的穿搭風格，大家對於運動休閒接受度越來越高，不僅不會覺得奇怪，甚至覺得穿上運動裝，就無形的展現著一種「對生活有紀律、有熱情」的生活態度。','sport2-1.png'),
('文青風','文青風在穿搭時，也可以嘗試看看多層次的穿搭法。選擇色系相近、長短不同的衣服，穿搭時可以營造出層次感，讓衣著看上去不會過度呆版。例如選擇長版的素色薄外套搭配條紋的T恤，或是利用襯衫當作外套，內襯一件素色T恤也是相當好的搭配。這樣的穿搭法除了可以增加視覺的豐富度，面對季節交替又或是夏天冷氣房與室外的溫差變化，都能靈活的穿脫，可說是兼具實用性與時尚性的文青風格。','hipster2-1.png'),
('時尚風','時尚風在穿搭時，也可以嘗試看看多層次的穿搭法。選擇色系相近、長短不同的衣服，穿搭時可以營造出層次感，讓衣著看上去不會過度呆版。例如選擇長版的素色薄外套搭配條紋的T恤，或是利用襯衫當作外套，內襯一件素色T恤也是相當好的搭配。這樣的穿搭法除了可以增加視覺的豐富度，面對季節交替又或是夏天冷氣房與室外的溫差變化，都能靈活的穿脫，可說是兼具實用性與時尚性的風格。','fashion2-1.png'),
('極簡風','極簡風在穿搭時，也可以嘗試看看多層次的穿搭法。選擇色系相近、長短不同的衣服，穿搭時可以營造出層次感，讓衣著看上去不會過度呆版。例如選擇長版的素色薄外套搭配條紋的T恤，或是利用襯衫當作外套，內襯一件素色T恤也是相當好的搭配。這樣的穿搭法除了可以增加視覺的豐富度，面對季節交替又或是夏天冷氣房與室外的溫差變化，都能靈活的穿脫，可說是兼具實用性與時尚性的文青風格。','minimalist2-1.png');

-- 身形 body
DROP TABLE IF EXISTS body;
CREATE TABLE IF NOT EXISTS body(
body_id int AUTO_INCREMENT NOT NULL PRIMARY KEY , 
body_shape varchar(20) Not Null ,
body_pic varchar(20) Not Null ,
body_descrip varchar(200) Not Null)
AUTO_INCREMENT = 101 DEFAULT CHARSET=utf8mb4;

INSERT INTO body
VALUES
(101,'倒三角型','body_triangle.png','倒三角型又稱V型，因為上半身寬，所以搭配衣服的時候最好選擇V領的上衣，縮減肩部寬度、擴張臀部面積和協調整體身型來進行身材重塑。下身身選擇色彩明亮或者設計感強的單品來吸引注意力，達到弱化上身線條的目的。'),
(102,'矩型','body_rectangle.png','矩型身材三圍平均，身體的曲線不明顯，穿搭時露出四肢以強化腰線，穿著高腰褲或是繫一條皮帶、腰封，都能製造出腰線、修飾身型。'),
(103,'蘋果型','body_apple.png','蘋果型整體身型較為豐滿，腰部線條不太明顯，呈圓滑的曲線。修飾上半身是重點，選擇硬挺材質的上衣較不易隨身體曲線變形以達修飾效果，要避免小領口及高領的服飾和過於寬鬆的服飾，顏色方面選擇深色為主，可以達到收縮效果。'),
(104,'梨型','body_pear.png','梨型身材是上窄下寬的體型，上半身可以選擇有設計感的上衣來吸引注意力，也可以用顏色來改變，透過上淺下深的方式來達到增寬肩部，收縮臀部的視覺效果。'),
(105,'沙漏型','body_hourglass.png','沙漏型身材是俗稱的完美身材，在穿搭上可以選擇可以凸顯自己凹凸有致的身材的單品。直筒寬鬆款都是雷區哦，遵循極簡原則就好，過多的裝飾會喧賓奪主，而忽略了你的好身材。');


-- 訂閱訂單 vip_orders
DROP TABLE IF EXISTS vip_orders;
CREATE TABLE IF NOT EXISTS vip_orders
(
	sub_id int AUTO_INCREMENT NOT NULL,
    order_id int,
    mem_id int,
    level_id int,
    sub_time datetime NOT NULL,
    sub_deadline datetime,
    sub_paid int,
    PRIMARY KEY(sub_id)
)
AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO vip_orders (order_id,mem_id,level_id,sub_time,sub_deadline,sub_paid)
VALUES
(NULL,101,101,CURRENT_TIMESTAMP(),TIMESTAMPADD(MONTH,1,sub_time),899),
(NULL,102,102,CURRENT_TIMESTAMP(),TIMESTAMPADD(MONTH,1,sub_time),1599),
(NULL,103,103,CURRENT_TIMESTAMP(),TIMESTAMPADD(MONTH,1,sub_time),3999);


-- 訂閱等級 vip_level
DROP TABLE IF EXISTS vip_level;
CREATE TABLE IF NOT EXISTS vip_level
(
	level_id int AUTO_INCREMENT NOT NULL,
    level_name varchar(20),
    price int,
    discount decimal(3,2),
    product_item int,
    set_info varchar(20),
    monthSet int,
    monthConsult int,
    freeShipping varchar(20),
    specialOffer int,
    PRIMARY KEY(level_id)
)AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

INSERT INTO vip_level (level_name,price,discount,product_item,set_info,monthSet,monthConsult,freeShipping,specialOffer)
VALUES
('BASIC',899,0.95,2,'上身* 1、下身*1',1,1,1,95),
('STANDARD',1899,0.9,3,'上身* 1、下身*1、外套*1',1,2,2,9),
('ULTRA',3999,0.8,4,'上身* 1、下身*1、外套*1、鞋子*1',1,5,'無限',85);

-- FK

-- 會員 member
ALTER TABLE member
ADD CONSTRAINT mem_body_id_fk FOREIGN KEY (body_id) REFERENCES body(body_id);

ALTER TABLE member
ADD CONSTRAINT mem_style_id_fk FOREIGN KEY (style_id) REFERENCES style(style_id);

ALTER TABLE member
ADD CONSTRAINT mem_level_id_fk FOREIGN KEY (level_id) REFERENCES vip_level(level_id);

-- 訂單 orders
ALTER TABLE orders
ADD CONSTRAINT ord_mem_id_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id);

ALTER TABLE orders
ADD CONSTRAINT ord_emp_id_fk FOREIGN KEY (emp_id) REFERENCES emp(emp_id);

-- 訂單項目 order_item
ALTER TABLE order_item
ADD CONSTRAINT order_item_order_id_fk FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_item
ADD CONSTRAINT order_item_product_id_fk FOREIGN KEY (product_id) REFERENCES product(product_id);

-- 造型師 stylist
ALTER TABLE stylist
ADD CONSTRAINT stylist_emp_id_fk FOREIGN KEY (emp_id) REFERENCES emp(emp_id);

-- 預約諮詢 appointment
ALTER TABLE appointment
ADD CONSTRAINT appointment_mem_id_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id);

ALTER TABLE appointment
ADD CONSTRAINT appointment_emp_id_fk FOREIGN KEY (emp_id) REFERENCES emp(emp_id);

-- 組合商品 product_combo
ALTER TABLE product_combo
ADD CONSTRAINT product_combo_emp_id_fk FOREIGN KEY (emp_id) REFERENCES emp(emp_id);

-- 廠商 client
ALTER TABLE client
ADD CONSTRAINT client_emp_id_fk FOREIGN KEY (emp_id) REFERENCES emp(emp_id);

-- 問題 order_qa
ALTER TABLE order_qa
ADD CONSTRAINT order_qa_order_id_fk FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_qa
ADD CONSTRAINT order_qa_mem_id_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id);

ALTER TABLE order_qa
ADD CONSTRAINT order_qa_emp_id_fk FOREIGN KEY (emp_id) REFERENCES emp(emp_id);

-- 收藏商品  collect_product
ALTER TABLE collect_product
ADD CONSTRAINT collect_product_mem_id_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id);

ALTER TABLE collect_product
ADD CONSTRAINT collect_product_product_id_fk FOREIGN KEY (product_id) REFERENCES product(product_id);

-- 收藏組合商品 (收藏穿搭) collect_combo
ALTER TABLE collect_combo
ADD CONSTRAINT collect_combo_mem_id_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id);

ALTER TABLE collect_combo
ADD CONSTRAINT collect_combo_combo_id_fk FOREIGN KEY (combo_id) REFERENCES product_combo(combo_id);

-- 組合商品項目 combo_item
ALTER TABLE combo_item
ADD CONSTRAINT combo_item_combo_id_fk FOREIGN KEY (combo_id) REFERENCES product_combo(combo_id);

ALTER TABLE combo_item
ADD CONSTRAINT combo_item_product_id_fk FOREIGN KEY (product_id) REFERENCES product(product_id);

-- 訂閱訂單 vip_orders
ALTER TABLE vip_orders
ADD CONSTRAINT vip_orders_order_id_fk FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE vip_orders
ADD CONSTRAINT vip_orders_mem_id_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id);

ALTER TABLE vip_orders
ADD CONSTRAINT vip_orders_level_id_fk FOREIGN KEY (level_id) REFERENCES vip_level(level_id);

-- views 
-- 訂單月營收
CREATE VIEW order_revenue AS
SELECT months.month, ifnull(sum(order_paid),0) "month_rev"
FROM (
  SELECT 7 as month UNION SELECT 8 as month
  UNION SELECT 9 as month UNION SELECT 10 as month UNION SELECT 11 as month UNION SELECT 12 as month
) as months
left JOIN orders ON MONTH(orders.order_time) = months.month 
GROUP BY months.month
ORDER by months.month
;
-- 訂閱月營收
CREATE VIEW sub_revenue AS
SELECT months.month, ifnull(sum(sub_paid),0) "month_rev"
FROM (
  SELECT 7 as month UNION SELECT 8 as month
  UNION SELECT 9 as month UNION SELECT 10 as month UNION SELECT 11 as month UNION SELECT 12 as month
) as months
LEFT JOIN vip_orders ON MONTH(vip_orders.sub_time) = months.month 
GROUP BY months.month
ORDER by months.month
;