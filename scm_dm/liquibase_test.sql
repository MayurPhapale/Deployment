--liquibase formatted sql

--changeset author:create_test_table
CREATE TABLE test_table (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    created_date TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);
--rollback DROP TABLE test_table;

--changeset author:insert_test_data_1
INSERT INTO test_table (id, name) VALUES (1, 'Test Record 1');
--rollback DELETE FROM test_table WHERE id = 1;

--changeset author:insert_test_data_2
INSERT INTO test_table (id, name) VALUES (2, 'Test Record 2');
--rollback DELETE FROM test_table WHERE id = 2;

--changeset author:intentional_error
-- This statement will succeed
INSERT INTO test_table (id, name) VALUES (3, 'Test Record 3');
-- This statement will fail (duplicate primary key)
INSERT INTO test_table (id, name) VALUES (3, 'This Will Fail');
--rollback DELETE FROM test_table WHERE id = 3;
