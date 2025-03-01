-- adalah mekanisme join, dimana terdapat relasi antara tabel pertama dan tabel kedua
-- jika ada data di tabel pertama yang tidak memiliki relasi di tabel kedua ataupun sebaliknya, maka hasil inner join tidak akan ditampilkan
-- ini adalah default join mysql
-- JOIN = INNER JOIN

SELECT * FROM product; -- anggap aja id_category nya ada semua
SELECT * FROM categories; -- anggap aja id nya kepake semua di product

INSERT INTO categories(id, name)
VALUES ('C0004', 'Oleh-Oleh')
('C0005', 'Gadget');

INSERT INTO products(id, name, price, quantity)
VALUES ('X0001', 'X Satu', 25000, 200),
('X0002', 'X Dua', 10000, 300),
('X0003', 'X Tiga', 15000, 500);

SELECT * FROM categories
INNER JOIN products ON (products.id_category = categories.id);

SELECT * FROM categories
JOIN products ON (products.id_category = categories.id); -- hasilnya sama aja

