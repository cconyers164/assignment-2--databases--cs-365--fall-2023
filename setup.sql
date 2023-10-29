DROP DATABASE if EXISTS passwords;

CREATE DATABASE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('privatekey', 512));
SET @init_vector = RANDOM_BYTES(16);

USE passwords; 

CREATE TABLE user_info(
    user_id INT AUTO_INCREMENT,
    website_name varchar(255) NOT NULL,
    website_URL varchar(255) NOT NULL,
    f_name varchar(50) NOT NULL,
    l_name varchar(50) NOT NULL,
    username varchar(50) NOT NULL,
    email_address varchar(255) NOT NULL,
    pwd BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comment TEXT,
    PRIMARY KEY(user_id)
);

INSERT INTO user_info (website_name, website_URL, f_name, l_name, username, email_address, pwd, comment)
    VALUES 
        ('Amazon', 'https://www.amazon.com', 'Miles', 'Morales', 'ULTSpiderman', 'milesmorales@gmail.com', AES_ENCRYPT('myuncleistheprowler23!', @key_str, @init_vector), 'This is my amazon account'),
        ('Ebay', 'https://www.ebay.com', 'Peter', 'Parker', 'AMZSpiderman', 'peter11@outlook.com', AES_ENCRYPT('Normanstinks98$', @key_str, @init_vector), 'This is my ebay'),
        ('Facebook','https://www.facebook.com', 'Eddie', 'Brock', 'WeAreVenom64&', 'ebrock@gmail.com', AES_ENCRYPT('IhateSpidey11!', @key_str, @init_vector), 'I hate facebook'),
        ('Linkedin', 'https://www.linkedin.com', 'Otto', 'Octavius', 'DocOck12', 'octavius@outlook.com', AES_ENCRYPT('IamSuperiorhaha12', @key_str, @init_vector), 'Someone hire me please'),
        ('Target', 'https://www.target.com', 'Ben', 'Reily', 'Chasm66', 'Beyondcorp@gmail.com', AES_ENCRYPT('clonesagasucks11', @key_str, @init_vector), 'Black Friday sales are coming up'),
        ('Walmart', 'https://www.walmart.com', 'Cletus', 'Cassadiy', 'Carnage009', 'carnage@gmail.com', AES_ENCRYPT('maximumcarnage###', @key_str, @init_vector), 'Walmart got good sales too'),
        ('Taco Bell', 'https://www.tacobell.com', 'Aaron', 'Davis', 'prowler678', 'prowler@gmail.com', AES_ENCRYPT('moneyBAGheist22', @key_str, @init_vector), 'Good food'),
        ('Best Buy', 'https://www.bestbuy.com', 'Mac', 'Gargan', 'Electro24' 'electro@outlook.com', AES_ENCRYPT('EnterElectro!!', @key_str, @init_vector), 'Christmas deals will be good'),    
        ('Microcenter', 'https://www.microcenter.com', 'Felica', 'Hardy', 'BlackCat88', 'fhardy@gmail.com', AES_ENCRYPT('catburglar23!', @key_str, @init_vector), 'Need a new computer'),
        ('Nike', 'https://www.nike.com', 'Gwen', 'Stacy', 'msstacy', 'spicystacy@gmail.com', AES_ENCRYPT('captainstacy', @key_str, @init_vector), 'I need new jordans');

