-- adalah mekanisme join seperti inner join, namun semua data di tabel kedua akan diambil juga
-- jika ada yang tidak memiliki di tabel pertama, maka hasilnya akan null

-- penjelasan diagram: ini kebalikannya left join, kalo left join itu tabel yang kiri dan tengah yang di ambil, sedangkan right join itu tabel yg kanan dan tengah yang akan diambil

-- maka tabel kategorinya tidak akan di ambil ya yg tidak punya relasi tapi product yg tidak punya relasi itu akan dikeluarkan
-- maka hasilnya maka C0004 dan C0005 gk ada ya tapi product yg X0001, X0002, X0003 nya muncul
SELECT * FROM categories
RIGHT JOIN products ON (products.id_category = categories.id);