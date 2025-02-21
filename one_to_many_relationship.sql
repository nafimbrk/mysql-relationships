-- ini adalah relasi antar tabel dimana satu data bisa digunakan lebih dari satu kali di tabel relasinya
-- berbeda dengan one to one yang cuma bisa digunakan maksimal satu kali di tabel relasinya, one to many gk ada batasan berapa banyak data digunakan
-- contoh relasi antar tabel categories dan products, dimana satu category bisa digunakan oleh lebih dari satu products, yang artinya relasinya one category to many products
-- pembuatannnya sebenernya sama dengan one to one, yg membedakan adalah kita tidak perlu menggunakan unique key, karena datannya memang bisa berkali-kali ditambahkan di tabel relasinya

-- membuat tabel category
CREATE TABLE categories
(
id VARCHAR(10) NOT NULL,
name VARCHAR(160) NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

-- mengubah tabel product
ALTER TABLE products
DROP column category;
ALTER TABLE products
ADD COLUMN id_category VARCHAR(10);
ALTER TABLE products
ADD CONSTRAINT fk_product_categories
FOREIGN KEY (id_category) REFERENCES categories (id);

INSERT INTO categories(id, name)
VALUES ('C0001', 'Makanan'),
('C0002', 'Minuman'),
('C0003', 'Lain-Lain');

UPDATE products
SET id_category = 'C0001'
WHERE id IN ('P0001', 'P0002', 'P0003', 'P0005', 'P0006', 'P0007', );

UPDATE products
SET id_category = 'C0002'
WHERE id IN ('P0004', 'P0008', 'P0009');

UPDATE products
SET id_category = 'C0003'
WHERE id IN ('P0010', 'P0011', 'P0012');

SELECT products.id, products.name, categories.name
FROM products
JOIN categories ON (categories.id = products.id_category);