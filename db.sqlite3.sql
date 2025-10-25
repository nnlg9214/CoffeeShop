BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "app_shop_category" (
	"id"	integer NOT NULL,
	"name"	varchar(225) NOT NULL,
	"description"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_shop_contact" (
	"id"	integer NOT NULL,
	"name"	varchar(200) NOT NULL,
	"email"	varchar(254),
	"subject"	varchar(250),
	"message"	text,
	"created"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_shop_member" (
	"id"	integer NOT NULL,
	"name"	varchar(100),
	"email"	varchar(254) NOT NULL UNIQUE,
	"password"	varchar(200),
	"avatar"	varchar(100) NOT NULL,
	"created"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_shop_product" (
	"id"	integer NOT NULL,
	"name"	varchar(225) NOT NULL,
	"description"	text,
	"price"	integer NOT NULL,
	"image"	varchar(100) NOT NULL,
	"category_id"	bigint NOT NULL,
	"publish_date"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "app_shop_category"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
INSERT INTO "app_shop_category" ("id","name","description") VALUES (1,'Cà phê','Sự kết hợp hoàn hảo giữa hạt cà phê Robusta & Arabica thượng hạng được trồng trên những vùng cao nguyên Việt Nam màu mỡ, qua những bí quyết rang xay độc đáo, Highlands Coffee chúng tôi tự hào giới thiệu những dòng sản phẩm Cà phê mang hương vị đậm đà và tinh tế.'),
 (2,'Freeze','Sảng khoái với thức uống đá xay phong cách Việt. Freeze là thức uống đá xay mát lạnh được pha chế từ những nguyên liệu thuần túy của Việt Nam.'),
 (3,'Trà','Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.'),
 (4,'Bánh ngọt',NULL);
INSERT INTO "app_shop_contact" ("id","name","email","subject","message","created") VALUES (1,'NGUYỄN NGỌC LƯỢNG','nnlg9214@outlook.com','Test Liên Hệ','Demo Liên hệ','2025-08-30 12:01:53.040426');
INSERT INTO "app_shop_product" ("id","name","description","price","image","category_id","publish_date") VALUES (1,'PHIN ĐEN ĐÁ','Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha hoàn toàn từ Phin, cho thêm 1 thìa đường, một ít đá viên mát lạnh, tạo nên Phin Đen Đá mang vị cà phê đậm đà chất Phin.',29000,'images/products/HLC_New_logo_5.1_Products__PHIN_DEN_DA.jpg',1,'2024-12-02 15:05:43.066442'),
 (2,'MOCHA MACCHIATO','Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà mang thương hiệu Highlands Coffee. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.',69000,'images/products/HLC_New_logo_5.1_Products__MOCHA.jpg',1,'2024-12-02 15:05:43.066442'),
 (3,'LATTE','Ly cà phê sữa ngọt ngào đến khó quên! Với một chút nhẹ nhàng hơn so với Cappuccino, Latte của chúng tôi bắt đầu với cà phê espresso, sau đó thêm sữa tươi và bọt sữa một cách đầy nghệ thuật. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.',65000,'images/products/HLC_New_logo_5.1_Products__LATTE_1.jpg',1,'2024-12-02 15:05:43.066442'),
 (4,'CAPPUCCINO','Ly cà phê sữa đậm đà thời thượng! Một chút đậm đà hơn so với Latte, Cappuccino của chúng tôi bắt đầu với cà phê espresso, sau đó thêm một lượng tương đương giữa sữa tươi và bọt sữa cho thật hấp dẫn. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.',65000,'images/products/HLC_New_logo_5.1_Products__CAPPUCINO.jpg',1,'2024-12-02 15:05:43.066442'),
 (5,'AMERICANO','Americano tại Highlands Coffee là sự kết hợp giữa cà phê espresso thêm vào nước đun sôi. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.',45000,'images/products/HLC_New_logo_5.1_Products__AMERICANO_NONG.jpg',1,'2024-12-02 15:05:43.066442'),
 (6,'ESPRESSO','Đích thực là ly cà phê espresso ngon đậm đà! Được chiết xuất một cách hoàn hảo từ loại cà phê rang được phối trộn độc đáo từ những hạt cà phê Robusta và Arabica chất lượng hảo hạng.',45000,'images/products/HLC_New_logo_5.1_Products__EXPRESSO.jpg',1,'2024-12-02 15:05:43.066442'),
 (7,'PHIN SỮA ĐÁ','Hương vị cà phê Việt Nam đích thực! Từng hạt cà phê hảo hạng được chọn bằng tay, phối trộn độc đáo giữa hạt Robusta từ cao nguyên Việt Nam, thêm Arabica thơm lừng. Cà phê được pha từ Phin truyền thống, hoà cùng sữa đặc sánh và thêm vào chút đá tạo nên ly Phin Sữa Đá – Đậm Đà Chất Phin.',29000,'images/products/HLC_New_logo_5.1_Products__PHIN_SUADA.jpg',1,'2024-12-02 15:05:43.066442'),
 (8,'PHIN ĐEN NÓNG','Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha từ Phin, cho thêm 1 thìa đường, mang đến vị cà phê đậm đà chất Phin.',29000,'images/products/HLC_PHIN_DEN_NONG.jpg',1,'2024-12-02 15:05:43.066442'),
 (9,'PHIN SỮA NÓNG','Hương vị cà phê Việt Nam đích thực! Từng hạt cà phê hảo hạng được chọn bằng tay, phối trộn độc đáo giữa hạt Robusta từ cao nguyên Việt Nam, thêm Arabica thơm lừng. Kết hợp với nước sôi từng giọt cà phê được chiết xuất từ Phin truyền thống, hoà cùng sữa đặc sánh tạo nên ly Phin Sữa Nóng – Đậm đà chất Phin.',29000,'images/products/HLC__PHIN_SUA_NONG.jpg',1,'2024-12-02 15:05:43.066442'),
 (10,'PHINDI CASSIA','Với chất phin êm ái, hương vị cà phê Việt Nam hiện đại kết hợp cùng hương quế nhẹ nhàng và thạch cà phê hấp dẫn.',55000,'images/products/Phindi_Cassia_Highlands_products_Image1.jpg',1,'2024-12-02 15:05:43.066442'),
 (11,'PHINDI CHOCO','PhinDi Choco - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Choco ngọt tan mang đến hương vị mới lạ, không thể hấp dẫn hơn!',45000,'images/products/HLC_New_logo_5.1_Products__PHINDI_CHOCO.jpg',1,'2024-12-02 15:05:43.066442'),
 (12,'PHINDI HẠNH NHÂN','PhinDi Hạnh Nhân - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Hạnh nhân thơm bùi mang đến hương vị mới lạ, không thể hấp dẫn hơn!',45000,'images/products/HLC_New_logo_5.1_Products__PHINDI_HANH_NHAN.jpg',1,'2024-12-02 15:05:43.066442'),
 (13,'PHINDI KEM SỮA','PhinDi Kem Sữa - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Kem Sữa béo ngậy mang đến hương vị mới lạ, không thể hấp dẫn hơn!',45000,'images/products/HLC_New_logo_5.1_Products__PHINDI_KEM_SUA.jpg',1,'2024-12-02 15:05:43.066442'),
 (14,'BẠC XỈU ĐÁ','Nếu Phin Sữa Đá dành cho các bạn đam mê vị đậm đà, thì Bạc Xỉu Đá là một sự lựa chọn nhẹ “đô" cà phê nhưng vẫn thơm ngon, chất lừ không kém!',29000,'images/products/HLC_New_logo_5.1_Products__BAC_XIU.jpg',1,'2024-12-02 15:05:43.066442'),
 (15,'CARAMEL MACCHIATO','Thỏa mãn cơn thèm ngọt! Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào. Thông qua bàn tay điêu luyện của các chuyên gia pha chế, mọi thứ hoàn toàn được nâng tầm thành nghệ thuật! Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.',69000,'images/products/HLC_New_logo_5.1_Products__CARAMEL_MACCHIATTO.jpg',1,'2024-12-02 15:05:43.066442'),
 (16,'COLD BREW ĐÀO',NULL,79000,'images/products/Cold_Brew_Peach.jpg',1,'2024-12-02 15:05:43.066442'),
 (17,'COLD BREW',NULL,69000,'images/products/Cold_Brew.jpg',1,'2024-12-02 15:05:43.066442'),
 (18,'PHINDI CASSIA',NULL,69000,'images/products/PhinDi_Cassia.jpg',1,'2024-12-02 15:05:43.066442'),
 (19,'BẠC XỈU CULI',NULL,55000,'images/products/Bac_Xiu.jpg',1,'2024-12-02 15:05:43.066442'),
 (20,'PHIN CULI SỮA ĐÁ',NULL,55000,'images/products/Phin_Sua_Da.jpg',1,'2024-12-02 15:05:43.066442'),
 (21,'PHIN CULI ĐEN ĐÁ',NULL,49000,'images/products/Phin_Den_Da.jpg',1,'2024-12-02 15:05:43.066442'),
 (22,'CITRUS COFFEE DETONIC',NULL,89000,'images/products/Citrus_Cafe_De_Tonic.jpg',1,'2024-12-02 15:05:43.066442'),
 (23,'COLD BREW MILK FOAM',NULL,79000,'images/products/Cold_Brew_Milk_Foam.jpg',1,'2024-12-02 15:05:43.066442'),
 (24,'FREEZE SÔ-CÔ-LA','Thiên đường đá xay sô cô la! Từ những thanh sô cô la Việt Nam chất lượng được đem xay với đá cho đến khi mềm mịn, sau đó thêm vào thạch sô cô la dai giòn, ở trên được phủ một lớp kem whip beo béo và sốt sô cô la ngọt ngào. Tạo thành Freeze Sô-cô-la ngon mê mẩn chinh phục bất kì ai!',55000,'images/products/HLC_New_logo_5.1_Products__FREEZE_CHOCO.jpg',2,'2024-12-02 15:05:43.066442'),
 (25,'COOKIES & CREAM','Một thức uống ngon lạ miệng bởi sự kết hợp hoàn hảo giữa cookies sô cô la giòn xốp cùng hỗn hợp sữa tươi cùng sữa đặc đem say với đá viên, và cuối cùng không thể thiếu được chính là lớp kem whip mềm mịn cùng cookies sô cô la say nhuyễn.',55000,'images/products/HLC_New_logo_5.1_Products__COOKIES_FREEZE.jpg',2,'2024-12-02 15:05:43.066442'),
 (26,'CARAMEL PHIN FREEZE','Thơm ngon khó cưỡng! Được kết hợp từ cà phê truyền thống chỉ có tại Highlands Coffee, cùng với caramel, thạch cà phê và đá xay mát lạnh. Trên cùng là lớp kem tươi thơm béo và caramel ngọt ngào. Món nước phù hợp trong những cuộc gặp gỡ bạn bè, bởi sự ngọt ngào thường mang mọi người xích lại gần nhau.',55000,'images/products/HLC_New_logo_5.1_Products__CARAMEL_FREEZE_PHINDI.jpg',2,'2024-12-02 15:05:43.066442'),
 (27,'CLASSIC PHIN FREEZE','Thơm ngon đậm đà! Được kết hợp từ cà phê pha Phin truyền thống chỉ có tại Highlands Coffee, cùng với thạch cà phê và đá xay mát lạnh. Trên cùng là lớp kem tươi thơm béo và bột ca cao đậm đà. Món nước hoàn hảo để khởi đầu câu chuyện cùng bạn bè.',55000,'images/products/HLC_New_logo_5.1_Products__CLASSIC_FREEZE_PHINDI.jpg',2,'2024-12-02 15:05:43.066442'),
 (28,'FREEZE TRÀ XANH','Thức uống rất được ưa chuộng! Trà xanh thượng hạng từ cao nguyên Việt Nam, kết hợp cùng đá xay, thạch trà dai dai, thơm ngon và một lớp kem dày phủ lên trên vô cùng hấp dẫn. Freeze Trà Xanh thơm ngon, mát lạnh, chinh phục bất cứ ai!',55000,'images/products/HLC_New_logo_5.1_Products__FREEZE_TRA_XANH.jpg',2,'2024-12-02 15:05:43.066442'),
 (29,'TRÀ THẠCH VẢI','Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch giòn khó cưỡng, mang đến thức uống tuyệt hảo!',45000,'images/products/HLC_New_logo_5.1_Products__TRA_TACH_VAI.jpg',3,'2024-12-02 15:05:43.066442'),
 (30,'TRÀ SEN VÀNG (CỦ NĂNG)','Thức uống chinh phục những thực khách khó tính! Sự kết hợp độc đáo giữa trà Ô long, hạt sen thơm bùi và củ năng giòn tan. Thêm vào chút sữa sẽ để vị thêm ngọt ngào.',45000,'images/products/HLC_New_logo_5.1_Products__TRA_SEN_VANG_CU_NANG.jpg',3,'2024-12-02 15:05:43.066442'),
 (31,'TRÀ SEN VÀNG (SEN)',NULL,45000,'images/products/HLC_New_logo_5.1_Products__TSV.jpg',3,'2024-12-02 15:05:43.066442'),
 (32,'TRÀ XANH ĐẬU ĐỎ',NULL,45000,'images/products/HLC_New_logo_5.1_Products__TRA_XANH_DAU_DO.jpg',3,'2024-12-02 15:05:43.066442'),
 (33,'TRÀ THẠCH ĐÀO','Vị trà đậm đà kết hợp cùng những miếng đào thơm ngon mọng nước cùng thạch đào giòn dai. Thêm vào ít sữa để gia tăng vị béo.',45000,'images/products/HLC_New_logo_5.1_Products__TRA_THANH_DAO-09.jpg',3,'2024-12-02 15:05:43.066442'),
 (34,'TRÀ THANH ĐÀO','Một trải nghiệm thú vị khác! Sự hài hòa giữa vị trà cao cấp, vị sả thanh mát và những miếng đào thơm ngon mọng nước sẽ mang đến cho bạn một thức uống tuyệt vời.',45000,'images/products/HLC_New_logo_5.1_Products__TRA_THANH_DAO-08.jpg',3,'2024-12-02 15:05:43.066442'),
 (35,'SET TRÀ CAO CẤP (TÙY CHỌN TRÀ)',NULL,159000,'images/products/Hot_Tea_Set.jpg',3,'2024-12-02 15:05:43.066442'),
 (36,'TRÀ QUẢ MỌNG ANH ĐÀO',NULL,79000,'images/products/Tra_Qua_Mong_Anh_Dao.jpg',3,'2024-12-02 15:05:43.066442'),
 (37,'TRÀ ỔI HỒNG',NULL,79000,'images/products/Tra_Oi_Hong.jpg',3,'2024-12-02 15:05:43.066442'),
 (38,'BÁNH CARAMEL PHÔ MAI','Ngon khó cưỡng! Bánh phô mai thơm béo được phủ bằng lớp caramel ngọt ngào.',35000,'images/products/CARAMELPHOMAI.jpg',4,'2024-12-02 15:05:43.066442'),
 (39,'BÁNH TIRAMISU','Tiramisu thơm béo, làm từ ca-cao Việt Nam đậm đà, kết hợp với phô mai ít béo, vani và chút rum nhẹ nhàng.',35000,'images/products/TIRAMISU.jpg',4,'2024-12-02 15:05:43.066442'),
 (40,'BÁNH CHUỐI','Bánh chuối truyền thống, sự kết hợp của 100% chuối tươi và nước cốt dừa Việt Nam.',29000,'images/products/BANHCHUOI.jpg',4,'2024-12-02 15:05:43.066442'),
 (41,'BÁNH MOUSSE CACAO','Bánh Mousse Ca Cao, là sự kết hợp giữa ca-cao Việt Nam đậm đà cùng kem tươi.',35000,'images/products/MOUSSECACAO.png',4,'2024-12-02 15:05:43.066442'),
 (42,'BÁNH MOUSSE ĐÀO','Một sự kết hợp khéo léo giữa kem và lớp bánh mềm, được phủ lên trên vài lát đào ngon tuyệt.',35000,'images/products/MOUSSEDAO.png',4,'2024-12-02 15:05:43.066442'),
 (43,'BÁNH SÔ-CÔ-LA HIGHLANDS','Một chiếc bánh độc đáo! Sô cô la ngọt ngào và kem tươi béo ngậy, được phủ thêm một lớp sô cô la mỏng bên trên cho thêm phần hấp dẫn.',35000,'images/products/SOCOLAHL.png',4,'2024-12-02 15:05:43.066442'),
 (44,'BÁNH PHÔ MAI CÀ PHÊ','Làm từ cà phê truyền thống của Highlands, kết hợp với phô mai thơm ngon! Chiếc bánh phù hợp đi cùng với bất cứ món cà phê nào!',29000,'images/products/PHOMAICAPHE.jpg',4,'2024-12-02 15:05:43.066442'),
 (45,'BÁNH PHÔ MAI CHANH DÂY','Vị béo của phô mai cùng với vị chua của chanh dây, tạo nên chiếc bánh thơm ngon hấp dẫn!',29000,'images/products/PHOMAICHANHDAY.jpg',4,'2024-12-02 15:05:43.066442'),
 (46,'BÁNH PHÔ MAI TRÀ XANH','Một sự sáng tạo mới mẻ, kết hợp giữa trà xanh đậm đà và phô mai ít béo.',35000,'images/products/PHOMAITRAXANH.jpg',4,'2024-12-02 15:05:43.066442');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_category','Can add category'),
 (26,7,'change_category','Can change category'),
 (27,7,'delete_category','Can delete category'),
 (28,7,'view_category','Can view category'),
 (29,8,'add_contact','Can add contact'),
 (30,8,'change_contact','Can change contact'),
 (31,8,'delete_contact','Can delete contact'),
 (32,8,'view_contact','Can view contact'),
 (33,9,'add_member','Can add member'),
 (34,9,'change_member','Can change member'),
 (35,9,'delete_member','Can delete member'),
 (36,9,'view_member','Can view member'),
 (37,10,'add_product','Can add product'),
 (38,10,'change_product','Can change product'),
 (39,10,'delete_product','Can delete product'),
 (40,10,'view_product','Can view product');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'app_shop','category'),
 (8,'app_shop','contact'),
 (9,'app_shop','member'),
 (10,'app_shop','product');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2025-08-30 11:47:28.395222'),
 (2,'auth','0001_initial','2025-08-30 11:47:28.427811'),
 (3,'admin','0001_initial','2025-08-30 11:47:28.456827'),
 (4,'admin','0002_logentry_remove_auto_add','2025-08-30 11:47:28.476296'),
 (5,'admin','0003_logentry_add_action_flag_choices','2025-08-30 11:47:28.487640'),
 (6,'app_shop','0001_initial','2025-08-30 11:47:28.518946'),
 (7,'contenttypes','0002_remove_content_type_name','2025-08-30 11:47:28.534383'),
 (8,'auth','0002_alter_permission_name_max_length','2025-08-30 11:47:28.560008'),
 (9,'auth','0003_alter_user_email_max_length','2025-08-30 11:47:28.577431'),
 (10,'auth','0004_alter_user_username_opts','2025-08-30 11:47:28.593061'),
 (11,'auth','0005_alter_user_last_login_null','2025-08-30 11:47:28.609702'),
 (12,'auth','0006_require_contenttypes_0002','2025-08-30 11:47:28.617961'),
 (13,'auth','0007_alter_validators_add_error_messages','2025-08-30 11:47:28.632284'),
 (14,'auth','0008_alter_user_username_max_length','2025-08-30 11:47:28.646390'),
 (15,'auth','0009_alter_user_last_name_max_length','2025-08-30 11:47:28.666041'),
 (16,'auth','0010_alter_group_name_max_length','2025-08-30 11:47:28.681804'),
 (17,'auth','0011_update_proxy_permissions','2025-08-30 11:47:28.697238'),
 (18,'auth','0012_alter_user_first_name_max_length','2025-08-30 11:47:28.711070'),
 (19,'sessions','0001_initial','2025-08-30 11:47:28.721010');
CREATE INDEX IF NOT EXISTS "app_shop_product_category_id_335910d0" ON "app_shop_product" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
