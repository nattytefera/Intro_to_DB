-- task_4.sql
-- This script retrieves the full description of the 'Books' table
-- from the 'alx_book_store' database

SELECT 
    COLUMN_NAME, 
    COLUMN_TYPE, 
    IS_NULLABLE, 
    COLUMN_DEFAULT, 
    CHARACTER_MAXIMUM_LENGTH, 
    NUMERIC_PRECISION, 
    NUMERIC_SCALE, 
    DATETIME_PRECISION, 
    COLUMN_KEY, 
    EXTRA
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'alx_book_store'
    AND TABLE_NAME = 'Books';

mysql -u your_username -p alx_book_store < task_4.sql
