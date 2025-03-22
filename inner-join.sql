-- adalah mekanisme join, dimana terdapat relasi antara tabel pertama dan tabel kedua
-- jika ada data di tabel pertama yang tidak memiliki relasi di tabel kedua ataupun sebaliknya, maka hasil inner join tidak akan ditampilkan
-- ini adalah default join mysql
-- JOIN = INNER JOIN

-- penjelasan diagram: lingkaran pertama adalah tabel pertamanya dan lingkaran kedua adalah tabel keduanya, dan yg tengah" adl irisannya jadi data yang ada di tabel pertama dan tabel kedua yang join ada relasinya
-- saat menggunakan inner join yang di hasilkan cuma data" yang berelasi atara tabel pertama dan tabel kedua, jadi kalo tabel pertamanya tidak pernah ada relasi di tabel keduanya dia tidak akan pernah di tampilkan
-- contoh: misal saja lingkaran pertama tabel product dan yang kedua tabel kategori, kalo kita select product yg ternyata di dalam tabel productnya itu tidak ada id_kategori maka dia akan masuk ke lingkaran pertama dan lingkaran yg kedua adl kategori yg tidak pernah dipakai sama si product, dan lingkaran pertama adl product yg tidak punya kategori, jadi yg tengah" adl product yg memiliki kategori jadi artinya ia berelasi dari product dan kategori, jadi pokoknya yg punya relasi dia akan di tengah, yg tidak berelasi yg product nya ada di lingkaran pertama dan yang kategori nya ada di lingkaran kedua, dan ketika kita melakukan inner join yg akan tampil cuma data yg punya relasi(yg di tengah)

SELECT * FROM product; -- anggap aja id_category nya ada semua
SELECT * FROM categories; -- anggap aja id nya kepake semua di product
 
-- sebelumnya saya bikin product dan kategori nya semuanya punya kategori
-- sekarang coba tambahkan beberapa kategori yg tidak punya product dan juga beberapa product yg tidak punya kategori
INSERT INTO categories(id, name)
VALUES ('C0004', 'Oleh-Oleh')
('C0005', 'Gadget');

INSERT INTO products(id, name, price, quantity)
VALUES ('X0001', 'X Satu', 25000, 200),
('X0002', 'X Dua', 10000, 300),
('X0003', 'X Tiga', 15000, 500);

-- jadi yang tidak punya relasi(C0004, C0005) dia tidak muncul, termasuk product yang X0001, X0002, X0003 dia gk akan muncul.
-- inner join itu mengambil data yg hanya berelasi
SELECT * FROM categories
INNER JOIN products ON (products.id_category = categories.id);

SELECT * FROM categories
JOIN products ON (products.id_category = categories.id); -- hasilnya sama aja

