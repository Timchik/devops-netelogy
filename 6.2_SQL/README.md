# Домашнее задание к занятию 2. «SQL»

# Задача 1
```
docker run --name postgres -d --restart unless-stopped -p 5432:5432 -e POSTGRES_PASSWORD=1346 -v ${PWD}/data:/var/lib/postgresql/data -v ${PWD}/data/backup:/var/lib/postgresql/backup postgres:12.2
```

# Задача 2

![image](https://user-images.githubusercontent.com/42189764/224113645-af8e6329-f2f6-490f-a264-304e6ed3de6b.png)


![image](https://user-images.githubusercontent.com/42189764/224113836-367516c3-c97a-40f5-ad2c-58e83da8f44d.png)

![image](https://user-images.githubusercontent.com/42189764/224114700-4e97816a-372e-4c73-a5d4-5c9973fa5a50.png)


# Задача 3


![image](https://user-images.githubusercontent.com/42189764/224116316-faf087a4-7c53-4981-ab3a-c2b5d27a8eae.png)

![image](https://user-images.githubusercontent.com/42189764/224118258-446a8dea-9fa6-463e-9425-ae1109e64d77.png)


![image](https://user-images.githubusercontent.com/42189764/224118489-f3a2ec78-8de9-4916-90b5-abb6899d959d.png)

![image](https://user-images.githubusercontent.com/42189764/224121774-a19fc43d-157a-4fca-8e31-9878a9d0c961.png)


# Задача 5 


Seq Scan — используется последовательное чтение данных таблицы clients
Cost -  виртуальная величина призванная оценить затратность операции. Первое значение 0.00 — затраты на получение первой строки. Второе — 18.10 — затраты на получение всех строк.

rows — приблизительное количество возвращаемых строк при выполнении операции Seq Scan. 

width - это оценка PostgreSQL того, сколько, в среднем, байт содержится в одной строке, возвращенной в рамках данной операции


# Задача 6

```
docker exec -it postgres pg_dumpall  -U postgres >  data/backup/db-backup.sql


docker exec -it postgre2 pg_restore -U postgres  -d test_db /var/lib/postgresql/backup/db-backup.sql
```
