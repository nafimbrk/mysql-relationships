-- adalah relasi dimana ada relasi antara 2 tabel dimana table pertama bisa punya banyak relasi di tabel kedua, dan tabel kedua pun punya banyak relasi di tabel pertama
-- contoh relasi many to many adalah relasi antara produk dan pernjualan, dimana setiap produk bisa dijual berkali kali, dan setiap pernjualan bisa untuk lebih dari satu produk
-- solusi yang biasa dilakukan jika terjadi relasi many to many adalah, biasanya kita akan menambah 1 tabel ditengahnya
-- tabel ini bertugas sebagai jembatan untuk menggabungkan relasi many to many
-- isi tabel ini akan ada id dari tabel pertama dan tabel kedua, dalam kasus ini adalah id_product dan id_order
-- denga demikian kita bisa menambahkan beberapa data ke dalam tabel relasi ini, sehingga berarti satu product bisa dijual beberapa kali di dalam tabel order, dan satu order bisa membeli lebih dari satu product

CREATE TABLE orders
(
id INT NOT NULL AUTO_INCREMENT,
total INT NOT NULL,
order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE orders_detail
(
id_product VARCHAR(10) NOT NULL,
id_order INT NOT NULL,
price INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (id_product, id_order)
) ENGINE = InnoDB;

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_product
FOREIGN KEY (id_product) REFERENCES products (id);

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_order
FOREIGN KEY (id_order) REFERENCES orders (id);

INSERT INTO orders(total) VALUES (50000);  -- eksekusi 3x

INSERT INTO orders_detail(id_product, id_order, price, quantity)
VALUES ('P0001', 1, 25000, 1),
('P0002', 1, 25000, 1);

INSERT INTO orders_detail(id_product, id_order, price, quantity)
VALUES ('P0003', 2, 25000, 1),
('P0004', 3, 25000, 1);

INSERT INTO orders_detail(id_product, id_order, price, quantity)
VALUES ('P0001', 2, 25000, 1),
('P0003', 3, 25000, 1);

SELECT * FROM orders_detail;

-- melihat data order, detail dan product nya
SELECT * FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);

-- atau kalo mau lebih enak tinggal kita pilih
SELECT orders.id, products.id, orders_detail.quantity, orders_detail.price FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);