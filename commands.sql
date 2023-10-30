--Use this command to display all of the info related to the table
SELECT * FROM user_info;

--Use this command to create a new entry into the database
INSERT INTO user_info (website_name, website_URL, f_name, l_name, username, email_address, pwd, comment)
    VALUES 
        ('Reddit', 'https://www.reddit.com', 'Chris', 'Conyers', 'kmoneychris', 'kmoney@gmail.com',('brokecollegestudent', @key_str, @init_vector), 'This is an example');

-- Use this command to change the password of an existing entry. The name can be from any entry in the database. 
UPDATE user_info SET pwd = AES_ENCRYPT('pwdisupdated', @key_str, @init_vector) WHERE website_name = 'Ebay';

-- Use this command to remove a password from an existing entry. THe url can be from any entry in the database.
UPDATE user_info SET pwd = NUll WHERE website_url = 'https://www.nike.com';

--Use this command to remove a URL from an existing entry. The url can be from any entry in the database.
DELETE FROM user_info WHERE website_url = 'https://www.facebook.com';

-- Use this command to change a URL associated with one of the passwords in the 10 entries
UPDATE user_info SET website_url = 'https://www.gamestop.com/' WHERE website_url = 'https://www.target.com';

--Use this command to get all the password-related data, including the password, associated with URLs that have `https`in two of the 10 entries
SELECT *, CAST(AES_DECRYPT(pwd, @key_str, @init_vector) AS CHAR) AS decrypted_password FROM user_info WHERE website_url LIKE 'https://%';
