DROP DATABASE if EXISTS passwords;
CREATE DATABASE passwords;
SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('privatekey', 512));
SET @init_vector = RANDOM_BYTES(16);

USE passwords; 

CREATE TABLE user_info(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    website_name varchar(255)
    website_URL TEXT DEFAULT NULL,
    f_name varchar(50),
    l_name varchar(50),
    username varchar(50),
    email_address varchar(255),
    pwd BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comment TEXT,

);

    



