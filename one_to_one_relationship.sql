-- tiap data disebuah tabel hanya boleh berelasi ke maksimal 1 data di tabel lainnya
-- gk boleh ada relasi lebih dari 1 data
-- contoh apk toko online yg terdata fitur e wallet, dan 1 customer cuma boleh punya 1 wallet
-- cara buat one to one relationship kita bisa membuat kolom foreign key lalu set kolom tersebut menggunakan unique key, hal ini dapat mencegah terjadi data di kolom tersebut agar tidak duplikat

-- penjelasan diagram: misal kita bikin wallet dengan id_customernya 1 jangan sampe ada lagi yg bikin wallet dengan id_customer 1, kalo gk di tambahin unique hal tersebut bisa terjadi tapi kalo di kasih unique maka hal tersebut gk akan bisa, jika fk(customer_id) unique jadi nanti cuma ada 1 customer doang di tabel wallet jadi gk boleh ada 1 customer punya 2 wallet

-- membuat table wallet
CREATE TABLE wallet (
    id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_customer),
    CONSTRAINT fk_wallet_customer
    FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;

INSERT INTO wallet(id_customer) VALUES (1), (3); -- ini kalo dieksekusi lagi maka akan error karena duplikat dan gk boleh menambahkan wallet baru dengan id customer yang sudah ada

SELECT * FROM wallet;

SELECT customers.email, wallet.balance
FROM wallet JOIN customers ON (wallet.id_customer = customers.id);