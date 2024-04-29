# SQL Challenge: E-commerce data analysis

The 11 .sql files contain the queries from a Kaggle notebook I wrote to showcase the capabilities of SQL for data analysis. To run these queries, download the SQLite database file from:

[E-commerce dataset by Olist (SQLite)](https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database)

For more information on how to use the database and some context on the SQL queries on each file, have a look at the notebook:

[SQL Challenge: E-commerce data analysis](https://www.kaggle.com/code/terencicp/sql-challenge-e-commerce-data-analysis)

Each SQL statement in the .sql files is preceded by a comment that indicates the name of the python variable that contains the query in the notebook. For example, the following SQL query preceded by the comment "orders_per_day":

```sql
-- orders_per_day
SELECT
    DATE(order_purchase_timestamp) AS day,
    COUNT(*) AS order_count
FROM orders
GROUP BY day;
```

Is stored in the following string in the Kaggle notebook, named "orders_per_day":

```python
orders_per_day = """
    SELECT
        DATE(order_purchase_timestamp) AS day,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY day;
```
