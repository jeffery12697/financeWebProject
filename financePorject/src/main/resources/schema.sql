CREATE TABLE IF NOT EXISTS product (
    sn integer GENERATED ALWAYS AS IDENTITY,
    product_id VARCHAR(100) UNIQUE NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL NOT NULL,
    fee_rate DECIMAL NOT NULL,
    PRIMARY KEY (sn)
);;

CREATE TABLE IF NOT EXISTS myUser (
    user_id VARCHAR(100) NOT NULL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    account VARCHAR(100) NOT NULL
);;
CREATE TABLE If NOT EXISTS likeList (
    sn integer GENERATED ALWAYS AS IDENTITY,
    user_id VARCHAR(100) NOT NULL,
    product_id VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    account VARCHAR(100) NOT NULL,
    total_fee DECIMAL NOT NULL,
    total_amount DECIMAL NOT NULL,
    PRIMARY KEY (sn),
    FOREIGN KEY (user_id) REFERENCES myUser(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);;