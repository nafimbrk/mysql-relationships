-- adalah relasi dimana ada relasi antara 2 tabel dimana table pertama bisa punya banyak relasi di tabel kedua, dan tabel kedua pun punya banyak relasi di tabel pertama
-- contoh relasi many to many adalah relasi antara produk dan pernjualan, dimana setiap produk bisa dijual berkali kali, dan setiap pernjualan bisa untuk lebih dari satu produk

-- penjelasan yang berhasil
-- solusi yang biasa dilakukan jika terjadi relasi many to many adalah, biasanya kita akan menambah 1 tabel ditengahnya
-- tabel ini bertugas sebagai jembatan untuk menggabungkan relasi many to many
-- isi tabel ini akan ada id dari tabel pertama dan tabel kedua, dalam kasus ini adalah id_product dan id_order
-- dengan demikian kita bisa menambahkan beberapa data ke dalam tabel relasi ini, sehingga berarti satu product bisa dijual beberapa kali di dalam tabel order, dan satu order bisa membeli lebih dari satu product


-- penjelasan yang gagal
-- id_product di tabel order
-- Jika kita menambahkan id_product di table orders, artinya sekarang sudah benar, bahwa 1 product
-- bisa dijual berkali-kali
-- Namun masalahnya adalah, berarti 1 order hanya bisa membeli 1 product, karena cuma ada 1
-- kolom untuk id_product
-- Oke kalo gitu kita tambahkan id_product1, id_product2, dan seterusnya. Solusi ini bisa dilakukan,
-- tapi tidak baik, artinya akan selalu ada maksimal barang yang bisa kita beli dalam satu order

-- id_order di tabel product
-- Jika kita tambahkan id_order di table products, artinya sekarang 1 order bisa membeli lebih dari 1
-- product, oke sudah benar
-- Tapi sayangnya masalahnya terbalik sekarang, 1 product cuma bisa dijual satu kali, tidak bisa dijual
-- berkali-kali, karena kolom id_order nya cuma 1
-- Kalupun kita tambah id_order1, id_order2 dan seterusnya di table product, tetap ada batasan
-- maksimal nya
-- Lantas bagaimana solusinya untuk relasi many to many?

-- penjelasan diagram yang gagal: kalo di tabel order kita masukan id_product gk bisa ya, jadinya kan cuma bisa satu product di jualnya, jadi salah. kalo di tabel product kita masukan id_penjualan gk bisa juga, berarti satu product cuma bisa dijual sekali, jadi salah juga

-- penjelasan diagram yang berhasil: kalo di tabel order_detail pgn tambahkan kolom lain bebas gk masalah, contohnya saya tambahkan quantity jadi berapa banyak barang yang dibeli dan price kenapa saya masukan price di tabel order_detail? karena biar jaga" kalo price di tabel product di rubah jangan sampe penjualannya(di tabel order) berubah juga harganya, jadi value price di tabel product akan saya copas ke value price di tabel order_detail
-- jadi relasinya satu order bisa dimiliki sama banyak order detail dan satu product bisa dimiliki sama banyak order detail
-- relasi product ke order_detail one to many, order ke order_detail one to many tapi product ke order itu many to many jadi sebenernya many to many itu gabungan dua buah one to many, jadi kalo kalian menghadapi relasi many to many kalian siapkan satu tabel di tengahnya

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

-- note sendiri
-- kalo ini praktek ambil data/join nya pake tabel orders, mungkin karna many to many ya