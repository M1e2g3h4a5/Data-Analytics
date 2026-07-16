-- Having overview about the database about the structure of tables

-- 1) Explore all OBJECTS in the database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- 2) Explore all COLUMNS in the database
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = "eda_project";
