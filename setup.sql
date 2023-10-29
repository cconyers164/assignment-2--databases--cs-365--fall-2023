CREATE DATABASE passwords;
USE passwords; 

CREATE TABLE user(
    id INT AUTO_INCREMENT,
    first_name varchar(50),
    last_name varchar(50),
    username varchar(50),
    email_address varchar(255),
    pwd BLOB NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    website_URL TEXT DEFAULT NULL,
    PRIMARY KEY (id)
);

    



