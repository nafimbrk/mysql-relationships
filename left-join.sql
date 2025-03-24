-- adalah mekanisme join seperti inner join, namun semua data di tabel pertama akan diambil juga
-- jika ada yang tidak memiliki di tabel kedua, maka hasilnya akan null

-- penjelasan diagram: nb:kiri tabel kategori kanan product, jika kita join antara tabel kategori dan product maka semua kategori ini yg tidak punya relasi product(yg kiri) pun akan muncul, jadi yang tidak punya relasi product(kiri) atau yg punya relasi product(tengah) dia keluar semua

-- maka C0004 dan C0005 nya pun muncul walaupun dia tidak punya product nanti di product.id dan sebagainya(kolom product yg lain) akan null
-- jadi ini kalo kita pgn ngeliat semua kategori + product yg ada di kategori tersebut, jadi walaupun kategorinya tidak punya product dia akan tetep muncul
SELECT * FROM categories
LEFT JOIN products ON (products.id_category = categories.id);

-- note sendiri
-- kiri kanannya tabel itu ditentukan berdasarkan saat dia join
-- misal from wallet join customer, maka wallet kiri dan customer kanan