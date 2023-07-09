### Домашнее задание к занятию 4. «PostgreSQL»

# Задание 1

```
 docker run --name postgres13 -e POSTGRES_HOST_AUTH_METHOD=trust -v /psql:/var/lib/postgresql/data -v /bkp:/data/backup/postgres -d postgres
```
 
Вывод списка БД

```
 postgres=# \l
                                                List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+------------+------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
(3 rows)

```
Подключения к БД

```
postgres=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=#
```

Вывод списка таблиц

```
postgres=# \dt
Did not find any relations.
postgres=#
```

Вывод описания содержимого таблиц

```
postgres=# \d pg_database
               Table "pg_catalog.pg_database"
     Column     |   Type    | Collation | Nullable | Default
----------------+-----------+-----------+----------+---------
 oid            | oid       |           | not null |
 datname        | name      |           | not null |
 datdba         | oid       |           | not null |
 encoding       | integer   |           | not null |
 datlocprovider | "char"    |           | not null |
 datistemplate  | boolean   |           | not null |
 datallowconn   | boolean   |           | not null |
 datconnlimit   | integer   |           | not null |
 datfrozenxid   | xid       |           | not null |
 datminmxid     | xid       |           | not null |
 dattablespace  | oid       |           | not null |
 datcollate     | text      | C         | not null |
 datctype       | text      | C         | not null |
 daticulocale   | text      | C         |          |
 datcollversion | text      | C         |          |
 datacl         | aclitem[] |           |          |
Indexes:
    "pg_database_oid_index" PRIMARY KEY, btree (oid), tablespace "pg_global"
    "pg_database_datname_index" UNIQUE CONSTRAINT, btree (datname), tablespace "pg_global"
Tablespace: "pg_global"

postgres=#
```

Выход из psql

```
postgres=# \q
```

# Задание 2

```
postgres=# CREATE DATABASE test_database;
CREATE DATABASE
postgres=# \c test_database
You are now connected to database "test_database" as user "postgres".
test_database=# \i /data/backup/postgres/test_dump.sql
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
COPY 8
 setval
--------
      8
(1 row)

ALTER TABLE
test_database=#

```

```
test_database=# ANALYZE VERBOSE public.orders;
INFO:  analyzing "public.orders"
INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
ANALYZE
test_database=#
```

### Задание 3

```
BEGIN;
ALTER TABLE orders RENAME TO orders_old;

CREATE TABLE orders AS table orders_old WITH NO DATA;

CREATE TABLE orders_1 (
    CHECK (price > 499)
) INHERITS (orders);

CREATE TABLE orders_2 (
    CHECK (price <= 499)
) INHERITS (orders);

CREATE RULE orders_1_insert AS
ON INSERT TO orders WHERE
    (price > 499)
DO INSTEAD
    INSERT INTO orders_1 VALUES (NEW.*);
       
CREATE RULE orders_2_insert AS
ON INSERT TO orders WHERE
    (price <= 499)
DO INSTEAD
    INSERT INTO orders_2 VALUES (NEW.*);
    
INSERT INTO orders
SELECT * FROM orders_old;
COMMIT;
```

Можно ли было изначально исключить "ручное" разбиение при проектировании таблицы orders?

```
CREATE TABLE orders (
    id integer NOT NULL,
    title character varying(80) NOT NULL,
    price integer DEFAULT 0
) PARTITION BY RANGE (price);

CREATE TABLE orders_1 PARTITION OF orders
    FOR VALUES GREATER THAN ('499');

CREATE TABLE orders_2 PARTITION OF orders
    FOR VALUES FROM ('0') TO ('499');
```

### Задание 4

Добавить слово   UNIQUE.

```
CREATE TABLE public.orders (
    id integer NOT NULL,
    title character varying(80) UNIQUE NOT NULL,
    price integer DEFAULT 0
);
```