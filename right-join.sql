-- adalah mekanisme join seperti inner join, namun semua data di tabel kedua akan diambil juga
-- jika ada yang tidak memiliki di tabel pertama, maka hasilnya akan null

SELECT * FROM categories
RIGHT JOIN products ON (products.id_category = categories.id);