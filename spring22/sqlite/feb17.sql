PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE customer (id INT, name TEXT);
INSERT INTO customer VALUES(1,'Jimmy Jones');
INSERT INTO customer VALUES(2,'Jane Jackson');
INSERT INTO customer VALUES(3,'Arabela Ant');
INSERT INTO customer VALUES(4,'Peter Piper');
INSERT INTO customer VALUES(4,'Peter Piper');
CREATE TABLE customer1 (id INT, name TEXT);
INSERT INTO customer1 VALUES(1,'Norbert North');
INSERT INTO customer1 VALUES(1,'Norbert North');
INSERT INTO customer1 VALUES(1,'Norbert North');
INSERT INTO customer1 VALUES(1,'Norbert North');
INSERT INTO customer1 VALUES(1,'Norbert North');
INSERT INTO customer1 VALUES(1,'Norbert North');
INSERT INTO customer1 VALUES(1,'Norbert North');
COMMIT;