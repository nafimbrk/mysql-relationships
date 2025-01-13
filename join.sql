SELECT * FROM wishlist
JOIN products ON (wishlist.id_product = products.id);

SELECT wishlist.id, products.id, products.name, wishlist.description
FROM wishlist
JOIN products ON (wishlist.id_product = products.id);

-- pakai alias
SELECT w.id, p.id, p.name, w.description
FROM wishlist AS w
JOIN products AS p ON (w.id_product = p.id);

-- alias untuk kolom
SELECT w.id AS id_wishlist,
       p.id AS id_product,
       p.name AS product_name,
       w.description AS wishlist_description
FROM wishlist AS w
JOIN products AS p ON (w.id_product = p.id);

-- membuat relasi ke tabel customers
-- anggap punya tabel customers dan punya beberapa data
Field          Type                 Null          Key          Default        Extra

id             int                  NO            PRI                         auto_increment
email          varchar(100)         NO            UNI               
first_name     varchar(100)         NO                                                                                                       
last_name      varchar(100)         YES

ALTER TABLE wishlist
ADD COLUMN id_customer INT;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer
FOREIGN KEY (id_customer) REFERENCES customers(id);

UPDATE wishlist
SET id_customer = 1
WHERE id = 1;

-- melakukan join multiple table
SELECT customers.email, products.id, products.name, wishlist.description
FROM wishlist
JOIN products ON (products.id = wishlist.id_product)
JOIN customers ON (customers.id = wishlist.id_customer);
-- WHERE ...  kalo mau menambahkan kondisi where dsb tinggal tambahkan di sini