-- adalah mekanisme join seperti inner join, namun semua data di tabel pertama akan diambil juga
-- jika ada yang tidak memiliki di tabel kedua, maka hasilnya akan null

SELECT * FROM categories
LEFT JOIN products ON (products.id_category = categories.id);