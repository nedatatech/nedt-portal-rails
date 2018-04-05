BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `invoice_numbers` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`value`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `invoice_numbers` VALUES (1,6,'','');
CREATE TABLE IF NOT EXISTS `invoice_items` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`invoice_id`	integer,
	`inventory_item_id`	integer,
	`quantity`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_18eb1b46c2` FOREIGN KEY(`inventory_item_id`) REFERENCES `inventory_items`(`id`),
	CONSTRAINT `fk_rails_25bf3d2c5e` FOREIGN KEY(`invoice_id`) REFERENCES `invoices`(`id`)
);
INSERT INTO `invoice_items` VALUES (5,6,3,3,'2018-04-04 23:29:55.613713','2018-04-04 23:29:55.613713');
INSERT INTO `invoice_items` VALUES (7,6,3,3,'2018-04-04 23:47:03.633163','2018-04-04 23:47:03.633163');
INSERT INTO `invoice_items` VALUES (8,6,1,4,'2018-04-04 23:49:44.865856','2018-04-05 10:16:33.938867');
INSERT INTO `invoice_items` VALUES (13,6,2,2,'2018-04-05 10:16:41.595731','2018-04-05 10:16:41.595731');
CREATE TABLE IF NOT EXISTS `invoices` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`number`	varchar,
	`date`	date,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `invoices` VALUES (6,'NEDT5','2018-04-04','2018-04-04 23:27:08.367736','2018-04-04 23:27:08.393232');
CREATE TABLE IF NOT EXISTS `order_statuses` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `order_statuses` VALUES (1,'Pending','Order has not been placed.','2018-04-04 20:27:06.696146','2018-04-04 20:27:06.696146');
INSERT INTO `order_statuses` VALUES (2,'Received','Order has been received and is in stock.','2018-04-04 20:27:06.777870','2018-04-04 20:27:06.777870');
CREATE TABLE IF NOT EXISTS `order_items` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`order_id`	integer,
	`inventory_item_id`	integer,
	`quantity`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_e3cb28f071` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`),
	CONSTRAINT `fk_rails_0c20f2d941` FOREIGN KEY(`inventory_item_id`) REFERENCES `inventory_items`(`id`)
);
INSERT INTO `order_items` VALUES (1,2,2,2,'2018-04-04 20:27:07.990605','2018-04-04 20:27:07.990605');
INSERT INTO `order_items` VALUES (2,2,1,1,'2018-04-04 20:27:08.071368','2018-04-04 20:27:08.071368');
INSERT INTO `order_items` VALUES (3,3,3,2,'2018-04-04 20:27:08.162699','2018-04-04 22:17:21.548155');
INSERT INTO `order_items` VALUES (4,3,1,1,'2018-04-04 20:27:08.255153','2018-04-04 22:16:27.136633');
INSERT INTO `order_items` VALUES (5,3,3,1,'2018-04-04 20:27:08.346464','2018-04-04 20:27:08.346464');
CREATE TABLE IF NOT EXISTS `in_stock_items` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`inventory_item_id`	integer,
	`item_location_id`	integer,
	`item_quantity`	integer,
	`notes`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_8fed9eb2da` FOREIGN KEY(`inventory_item_id`) REFERENCES `inventory_items`(`id`)
);
INSERT INTO `in_stock_items` VALUES (1,2,3,2,'Received from order','2018-04-04 20:27:08.455654','2018-04-04 20:27:08.455654');
INSERT INTO `in_stock_items` VALUES (2,1,3,1,'Received from order','2018-04-04 20:27:08.546213','2018-04-04 20:27:08.546213');
INSERT INTO `in_stock_items` VALUES (3,3,3,3,'Received from order','2018-04-04 20:27:08.638286','2018-04-04 20:27:08.638286');
CREATE TABLE IF NOT EXISTS `sold_items` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`inventory_item_id`	integer,
	`invoice_id`	integer,
	`price`	varchar,
	`money`	varchar,
	`notes`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_8f118f4e50` FOREIGN KEY(`inventory_item_id`) REFERENCES `inventory_items`(`id`),
	CONSTRAINT `fk_rails_a94c132b8a` FOREIGN KEY(`invoice_id`) REFERENCES `invoices`(`id`)
);
CREATE TABLE IF NOT EXISTS `reserved_items` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`job_id`	integer,
	`inventory_item_id`	integer,
	`quantity`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_8f3606cb91` FOREIGN KEY(`job_id`) REFERENCES `jobs`(`id`),
	CONSTRAINT `fk_rails_2591a40c82` FOREIGN KEY(`inventory_item_id`) REFERENCES `inventory_items`(`id`)
);
CREATE TABLE IF NOT EXISTS `vendors` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `vendors` VALUES (1,'Snap Av','Main Vendor.','2018-04-04 20:27:07.059222','2018-04-04 20:27:07.059222');
CREATE TABLE IF NOT EXISTS `orders` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date`	date,
	`vendor_id`	integer,
	`order_status_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_7a22cf8b0e` FOREIGN KEY(`order_status_id`) REFERENCES `order_statuses`(`id`),
	CONSTRAINT `fk_rails_f6acf748cd` FOREIGN KEY(`vendor_id`) REFERENCES `vendors`(`id`)
);
INSERT INTO `orders` VALUES (1,'2018-03-30',1,2,'2018-04-04 20:27:07.704856','2018-04-04 20:27:07.704856');
INSERT INTO `orders` VALUES (2,'2018-04-01',1,2,'2018-04-04 20:27:07.795209','2018-04-04 20:27:07.795209');
INSERT INTO `orders` VALUES (3,'2018-04-01',1,1,'2018-04-04 20:27:07.888470','2018-04-04 20:27:07.888470');
CREATE TABLE IF NOT EXISTS `item_locations` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`truck_id`	integer,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_64cb503109` FOREIGN KEY(`truck_id`) REFERENCES `trucks`(`id`)
);
INSERT INTO `item_locations` VALUES (1,1,'HDMI Bin','It''s where the HDMIs go.','2018-04-04 20:27:07.151022','2018-04-04 20:27:07.151022');
INSERT INTO `item_locations` VALUES (2,1,'Misc. Cable Bin','Bin for misc cables that are less commonly used.','2018-04-04 20:27:07.219346','2018-04-04 20:27:07.219346');
INSERT INTO `item_locations` VALUES (3,2,'Warehouse','Item is in stock but not located on a truck.','2018-04-04 20:27:07.318183','2018-04-04 20:27:07.318183');
CREATE TABLE IF NOT EXISTS `trucks` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `trucks` VALUES (1,'Box Truck','Shed with wheels.','2018-04-04 20:27:06.874132','2018-04-04 20:27:06.874132');
INSERT INTO `trucks` VALUES (2,'No Truck','Placeholder for no truck. ','2018-04-04 20:27:06.977314','2018-04-04 20:27:06.977314');
CREATE TABLE IF NOT EXISTS `inventory_items` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`item_brand_id`	integer,
	`item_type_id`	integer,
	`item_size_id`	integer,
	`item_notes`	text,
	`cost`	decimal,
	`retail`	decimal,
	`markup`	decimal,
	`price`	decimal,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_ce462f34e8` FOREIGN KEY(`item_type_id`) REFERENCES `item_types`(`id`),
	CONSTRAINT `fk_rails_2cb09e600a` FOREIGN KEY(`item_size_id`) REFERENCES `item_sizes`(`id`),
	CONSTRAINT `fk_rails_0c2722f0f4` FOREIGN KEY(`item_brand_id`) REFERENCES `item_brands`(`id`)
);
INSERT INTO `inventory_items` VALUES (1,1,2,2,NULL,15.16,35.95,50,22.74,'2018-04-04 20:27:07.420767','2018-04-04 20:27:07.420767');
INSERT INTO `inventory_items` VALUES (2,1,1,1,NULL,18.42,64.99,50,27.63,'2018-04-04 20:27:07.513054','2018-04-04 20:27:07.513054');
INSERT INTO `inventory_items` VALUES (3,2,3,3,'',43.42,249,50,65.13,'2018-04-04 20:27:07.596435','2018-04-04 20:27:07.596435');
CREATE TABLE IF NOT EXISTS `item_sizes` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `item_sizes` VALUES (1,'10 ft.','10 feet','2018-04-04 20:27:06.187427','2018-04-04 20:27:06.187427');
INSERT INTO `item_sizes` VALUES (2,'13.1 Ft.','13.1 feet.','2018-04-04 20:27:06.267985','2018-04-04 20:27:06.267985');
INSERT INTO `item_sizes` VALUES (3,'37" - 70"','37 to 70 inches','2018-04-04 20:27:06.341939','2018-04-04 20:27:06.341939');
CREATE TABLE IF NOT EXISTS `item_brands` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `item_brands` VALUES (1,'Binary','Binary Brand.','2018-04-04 20:27:06.024926','2018-04-04 20:27:06.024926');
INSERT INTO `item_brands` VALUES (2,'Strong','Snap AV brand.','2018-04-04 20:27:06.093696','2018-04-04 20:27:06.093696');
CREATE TABLE IF NOT EXISTS `item_types` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `item_types` VALUES (1,'HDMI Cable','Cables that are HDMI.','2018-04-04 20:27:06.433095','2018-04-04 20:27:06.433095');
INSERT INTO `item_types` VALUES (2,'Toslink Cable','Optical audio cable.','2018-04-04 20:27:06.519037','2018-04-04 20:27:06.519037');
INSERT INTO `item_types` VALUES (3,'Tilt Mount','Tilting Wall Mount','2018-04-04 20:27:06.610132','2018-04-04 20:27:06.610132');
CREATE TABLE IF NOT EXISTS `expenses` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`owner_id`	integer,
	`recurring`	boolean,
	`due`	date,
	`pay_to_id`	integer,
	`pay_from_id`	integer,
	`amount`	decimal,
	`status_id`	integer,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_6fbaedda09` FOREIGN KEY(`owner_id`) REFERENCES `owners`(`id`),
	CONSTRAINT `fk_rails_a07aaad691` FOREIGN KEY(`status_id`) REFERENCES `statuses`(`id`),
	CONSTRAINT `fk_rails_7684e57cbb` FOREIGN KEY(`pay_from_id`) REFERENCES `pay_froms`(`id`),
	CONSTRAINT `fk_rails_a682018cf1` FOREIGN KEY(`pay_to_id`) REFERENCES `pay_tos`(`id`)
);
CREATE TABLE IF NOT EXISTS `companies` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`description`	text,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS `customers` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`first_name`	varchar,
	`last_name`	varchar,
	`email`	varchar,
	`phone`	varchar,
	`street`	varchar,
	`city`	varchar,
	`state`	varchar,
	`zip`	varchar,
	`invoices_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_55702cc54c` FOREIGN KEY(`invoices_id`) REFERENCES `invoices`(`id`)
);
CREATE TABLE IF NOT EXISTS `jobs` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`invoice_id`	integer,
	`date`	date,
	`status_id`	integer,
	`scheduled_for`	datetime,
	`completed_on`	datetime,
	`customer_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_7629e6466c` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`),
	CONSTRAINT `fk_rails_b2395a9943` FOREIGN KEY(`invoice_id`) REFERENCES `invoices`(`id`)
);
CREATE TABLE IF NOT EXISTS `payments` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`pay_date`	date,
	`paid_to_id`	integer,
	`payment_type`	varchar,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_57e57770d7` FOREIGN KEY(`paid_to_id`) REFERENCES `paid_tos`(`id`)
);
CREATE TABLE IF NOT EXISTS `employees` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`first_name`	varchar,
	`last_name`	varchar,
	`username`	varchar,
	`password_digest`	varchar,
	`salt`	varchar,
	`email`	varchar,
	`phone`	varchar,
	`street`	varchar,
	`city`	varchar,
	`state`	varchar,
	`zip`	varchar,
	`invoices_id`	integer,
	`owed`	integer,
	`payments_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_19013213c0` FOREIGN KEY(`payments_id`) REFERENCES `payments`(`id`),
	CONSTRAINT `fk_rails_b4f412be45` FOREIGN KEY(`invoices_id`) REFERENCES `invoices`(`id`)
);
INSERT INTO `employees` VALUES (1,'Tim','Monks','poad27x','$2a$10$P2I54gXLS54lf8lKPgVc7O9Je.WaKhm3b2zpXAOJ3UCHJbrg7GdBy','$2a$10$P2I54gXLS54lf8lKPgVc7O','Poad27xx@gmail.com','978-433-6242','10 Boynton st.','Pepperell','MA','01463',NULL,NULL,NULL,'2018-04-04 20:27:05.852062','2018-04-04 20:27:05.852062');
INSERT INTO `employees` VALUES (2,'Shawn','Henrikson','subarex84','$2a$10$uZEJ00UaxD.1BOiApm.M6e8CxnBBCSEAPvCAGjwGMFfyr95pret6y','$2a$10$uZEJ00UaxD.1BOiApm.M6e','shawnhenrikson1@gmail.com','978-302-2556','17 Plainfield Rd.','Pepperell','MA','01463',NULL,NULL,NULL,'2018-04-04 20:27:05.933029','2018-04-04 20:27:05.933029');
CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
	`key`	varchar NOT NULL,
	`value`	varchar,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	PRIMARY KEY(`key`)
);
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-04-04 20:27:02.829267','2018-04-04 20:27:02.829267');
CREATE TABLE IF NOT EXISTS `schema_migrations` (
	`version`	varchar NOT NULL,
	PRIMARY KEY(`version`)
);
INSERT INTO `schema_migrations` VALUES ('20180217224923');
INSERT INTO `schema_migrations` VALUES ('20180218000134');
INSERT INTO `schema_migrations` VALUES ('20180219002418');
INSERT INTO `schema_migrations` VALUES ('20180219002758');
INSERT INTO `schema_migrations` VALUES ('20180219190721');
INSERT INTO `schema_migrations` VALUES ('20180219191006');
INSERT INTO `schema_migrations` VALUES ('20180314144822');
INSERT INTO `schema_migrations` VALUES ('20180319234609');
INSERT INTO `schema_migrations` VALUES ('20180320004538');
INSERT INTO `schema_migrations` VALUES ('20180320020852');
INSERT INTO `schema_migrations` VALUES ('20180320020954');
INSERT INTO `schema_migrations` VALUES ('20180321155348');
INSERT INTO `schema_migrations` VALUES ('20180326184407');
INSERT INTO `schema_migrations` VALUES ('20180326184421');
INSERT INTO `schema_migrations` VALUES ('20180326184601');
INSERT INTO `schema_migrations` VALUES ('20180326184620');
INSERT INTO `schema_migrations` VALUES ('20180326184658');
INSERT INTO `schema_migrations` VALUES ('20180327181129');
INSERT INTO `schema_migrations` VALUES ('20180330224308');
INSERT INTO `schema_migrations` VALUES ('20180404234043');
INSERT INTO `schema_migrations` VALUES ('20180404234105');
INSERT INTO `schema_migrations` VALUES ('20180405002203');
CREATE INDEX IF NOT EXISTS `index_invoice_items_on_inventory_item_id` ON `invoice_items` (
	`inventory_item_id`
);
CREATE INDEX IF NOT EXISTS `index_invoice_items_on_invoice_id` ON `invoice_items` (
	`invoice_id`
);
CREATE INDEX IF NOT EXISTS `index_order_items_on_inventory_item_id` ON `order_items` (
	`inventory_item_id`
);
CREATE INDEX IF NOT EXISTS `index_order_items_on_order_id` ON `order_items` (
	`order_id`
);
CREATE INDEX IF NOT EXISTS `index_in_stock_items_on_item_location_id` ON `in_stock_items` (
	`item_location_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `index_in_stock_items_on_inventory_item_id` ON `in_stock_items` (
	`inventory_item_id`
);
CREATE INDEX IF NOT EXISTS `index_sold_items_on_invoice_id` ON `sold_items` (
	`invoice_id`
);
CREATE INDEX IF NOT EXISTS `index_sold_items_on_inventory_item_id` ON `sold_items` (
	`inventory_item_id`
);
CREATE INDEX IF NOT EXISTS `index_reserved_items_on_inventory_item_id` ON `reserved_items` (
	`inventory_item_id`
);
CREATE INDEX IF NOT EXISTS `index_reserved_items_on_job_id` ON `reserved_items` (
	`job_id`
);
CREATE INDEX IF NOT EXISTS `index_orders_on_order_status_id` ON `orders` (
	`order_status_id`
);
CREATE INDEX IF NOT EXISTS `index_orders_on_vendor_id` ON `orders` (
	`vendor_id`
);
CREATE INDEX IF NOT EXISTS `index_item_locations_on_truck_id` ON `item_locations` (
	`truck_id`
);
CREATE INDEX IF NOT EXISTS `index_inventory_items_on_item_size_id` ON `inventory_items` (
	`item_size_id`
);
CREATE INDEX IF NOT EXISTS `index_inventory_items_on_item_type_id` ON `inventory_items` (
	`item_type_id`
);
CREATE INDEX IF NOT EXISTS `index_inventory_items_on_item_brand_id` ON `inventory_items` (
	`item_brand_id`
);
CREATE INDEX IF NOT EXISTS `index_expenses_on_status_id` ON `expenses` (
	`status_id`
);
CREATE INDEX IF NOT EXISTS `index_expenses_on_pay_from_id` ON `expenses` (
	`pay_from_id`
);
CREATE INDEX IF NOT EXISTS `index_expenses_on_pay_to_id` ON `expenses` (
	`pay_to_id`
);
CREATE INDEX IF NOT EXISTS `index_expenses_on_owner_id` ON `expenses` (
	`owner_id`
);
CREATE INDEX IF NOT EXISTS `index_customers_on_invoices_id` ON `customers` (
	`invoices_id`
);
CREATE INDEX IF NOT EXISTS `index_jobs_on_customer_id` ON `jobs` (
	`customer_id`
);
CREATE INDEX IF NOT EXISTS `index_jobs_on_status_id` ON `jobs` (
	`status_id`
);
CREATE INDEX IF NOT EXISTS `index_jobs_on_invoice_id` ON `jobs` (
	`invoice_id`
);
CREATE INDEX IF NOT EXISTS `index_payments_on_paid_to_id` ON `payments` (
	`paid_to_id`
);
CREATE INDEX IF NOT EXISTS `index_employees_on_payments_id` ON `employees` (
	`payments_id`
);
CREATE INDEX IF NOT EXISTS `index_employees_on_invoices_id` ON `employees` (
	`invoices_id`
);
COMMIT;
