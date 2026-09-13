CREATE TABLE "locations" (
  "UniqueID" bigserial PRIMARY KEY,
  "address" string
);

CREATE TABLE "staff" (
  "UniqueID" bigserial PRIMARY KEY,
  "role" string
);

CREATE TABLE "basic_inventory" (
  "UniqueID" bigserial PRIMARY KEY,
  "count" int
);

CREATE TABLE "menu_items" (
  "UniqueID" bigserial PRIMARY KEY,
  "name" string,
  "category" string,
  "price" decimal
);

CREATE TABLE "orders" (
  "UniqueID" bigserial PRIMARY KEY,
  "type" string,
  "status" string
);

CREATE TABLE "reservations" (
  "UniqueID" bigserial PRIMARY KEY,
  "date_time" datetime,
  "table_number" int
);

CREATE TABLE "staff_orders" (
  "staff_id" bigserial,
  "order_id" bigserial,
  PRIMARY KEY ("staff_id", "order_id")
);

CREATE TABLE "menu_items_orders" (
  "menu_item_id" bigserial,
  "order_id" bigserial,
  PRIMARY KEY ("menu_item_id", "order_id")
);

CREATE TABLE "menu_items_ingredients" (
  "menu_item_id" bigserial,
  "ingredient_id" bigserial,
  PRIMARY KEY ("menu_item_id", "ingredient_id")
);

CREATE TABLE "shift_schedules" (
  "UniqueID" bigserial PRIMARY KEY,
  "shift_details" string
);

CREATE TABLE "suppliers" (
  "UniqueID" bigserial PRIMARY KEY,
  "details" string
);

CREATE TABLE "ingredients" (
  "UniqueID" bigserial PRIMARY KEY,
  "name" string,
  "quantity" int
);

CREATE TABLE "customer_feedback" (
  "UniqueID" bigserial PRIMARY KEY,
  "rating" int,
  "comment" string,
  "customer_info" string
);

ALTER TABLE "staff" ADD FOREIGN KEY ("UniqueID") REFERENCES "locations" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "basic_inventory" ADD FOREIGN KEY ("UniqueID") REFERENCES "locations" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "menu_items" ADD FOREIGN KEY ("UniqueID") REFERENCES "locations" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "orders" ADD FOREIGN KEY ("UniqueID") REFERENCES "locations" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "reservations" ADD FOREIGN KEY ("UniqueID") REFERENCES "locations" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "shift_schedules" ADD FOREIGN KEY ("UniqueID") REFERENCES "staff" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "staff_orders" ADD FOREIGN KEY ("staff_id") REFERENCES "staff" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "staff_orders" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "ingredients" ADD FOREIGN KEY ("UniqueID") REFERENCES "basic_inventory" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "menu_items_ingredients" ADD FOREIGN KEY ("menu_item_id") REFERENCES "menu_items" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "menu_items_orders" ADD FOREIGN KEY ("menu_item_id") REFERENCES "menu_items" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "menu_items_ingredients" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "menu_items_orders" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "customer_feedback" ADD FOREIGN KEY ("UniqueID") REFERENCES "orders" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "customer_feedback" ADD FOREIGN KEY ("UniqueID") REFERENCES "reservations" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "suppliers" ADD FOREIGN KEY ("UniqueID") REFERENCES "ingredients" ("UniqueID") DEFERRABLE INITIALLY IMMEDIATE;
