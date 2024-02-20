PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "test"
       (id INTEGER PRIMARY KEY,
        value TEXT);
INSERT INTO test VALUES(1,'Ms. Jane Robinson');
INSERT INTO test VALUES(2,'Mr. Carl Robinson');
INSERT INTO test VALUES(3,'Mr. Edward Jones');
CREATE INDEX test_idx ON test (value);
CREATE VIEW value_view AS SELECT value FROM test;
COMMIT;
