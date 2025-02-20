-- cara buat one to one relationship dengan membuat kolom foreign key lalu set menggunakan unique key, hal dapat ini mencegah terjadi data di kolom tersebut agar tidak duplikat
-- atau cara lainnya bisa membuat tabel dengan pk yang sama, sehingga tidak butuh lagi kolom untuk fk

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
FROM wishlist JOIN customers ON (wallet.id_customer = customers.id);

