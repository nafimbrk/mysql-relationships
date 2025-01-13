-- membuat relasi ke tabel products
-- anggap ada table products dan ada beberapa data

Field          Type                                        Null          Key          Default              Extra

id             varchar(10)                                 NO            PRI          
name           varchar(100)                                NO            MUL          
category       enum('Makanan', 'Minuman', 'Lain-Lain')     YES                        
description    text                                        YES                        
price          int unsigned                                NO                         
quantity       int unsigned                                NO                         0
created_at     timestamp                                   NO                         CURRENT_TIMESTAMP    DEFAULT_GENERATED

-- saat buat kolom foreign key tipe datanya harus sama dengan kolom primary key yg di tabel reference nya
CREATE TABLE wishlist (
    id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product
    FOREIGN KEY (id_product) REFERENCES products(id)
) ENGINE = InnoDB;

-- menambah / menghapus foreign key
ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id);

-- keuntungan menggunakan foreign key bahwa data yg kita masukkan ke kolom tersebut harus tersedia di tabel reference nya
-- selain itu saat kita menghapus data di tabel reference nya, mysql akan mengecek apakah id nya di gunakan di foreign key di tabel lain, jika digunakan mysql akan menolak proses delete data di tabel reference tersebut
-- kita bisa merubahnya jika kita mau, defaultnya akan ditolak (RESTRICT)
INSERT INTO wishlist(id_product, description)
VALUES ('P0001', 'Makanan Kesukaan');

-- coba kalo masukkan yg id_product nya tidak ada di tabel products maka akan ditolak
INSERT INTO wishlist(id_product, description)
VALUES ('SALAH', 'Makanan Kesukaan');   

-- ketika mencoba menghapus data products nya mysql akan mengecek apakah ada tabel yg reference ke record tersebut lalu di cek apakah ada yg pakai product_id ini otomatis ketika kita hapus si products nya mysql akan mereject, simple nya karena datanya dipake sama tabel lain
DELETE FROM products
WHERE id = 'P0001';

-- behavior foreign key
behavior      on delete            on update(bukan update barisnya tapi update pk reference nya contoh 'P0001' jadi 'Pxxxx')

RESTRICT      ditolak              ditolak
CASCADE       data akan dihapus    data akan ikut diubah
NO ACTION     data dibiarkan       data dibiarkan  -- kalo di delete yaudah di delete tapi di tabel reference nya yaudah dibiarin aja jadi reference tersebut putus
SET NULL      diubah jadi null     diubah jadi null  -- kalo misal kita hapus products nya maka yg reference ke dia id nya akan di set menjadi null, atau kalo kita update tadinya products nya 'P0001' jadi 'Pxxxx' maka yg di reference nya di jadikan null juga (kalo null berarti kolom nya itu harus nullable)

-- mengubah behavior menghapus relasi
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES prodl
ucts (id)
    ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO wishlist(id_product, description)
VALUES ('P0002', 'Makanan Enak');   

DELETE FROM products
WHERE id = 'P0002';                                                     