# SQL Bootcamp

<span>
	<img src="https://img.shields.io/badge/SQL-white?style=for-the-badge&logo=databricks">
</span>
<span>
	<img src="https://img.shields.io/badge/postgresql-white?style=for-the-badge&logo=postgresql">
</span>


## 📝 Description
SQL Bootcamp at School21 is an introduction to SQL language and databases in the intensive format: you need to complete exercises and present your solutions to other students every day to succeed at the Bootcamp.
Each module (day) in Bootcamp contains tasks dedicated to implementation of SQL statements to retrieve needed data from given database.

Database Management System used in Bootcamp is <code>PostgreSQL</code>.

IDE I used: ***DataGRIP*** from JetBrains.

## 🔃 Schemas

### Main database schema

<img style="width: 580px" src="info/DB_schema.png">

### Database schema for Team01 Project

<img style="width: 580px" src="info/DB_schema2.png">

## 💻 Exercises

***SQLB1_SQLB4***

Basic SQL syntax: use of SELECT, JOIN, UNION etc.

***SQLB5***

Task is dedicated to virtual views and physical snapshots of data.

***SQLB7-SQLB9***

 Data Governance Policies, Database indexes, Database Sequences.

***SQLB6_Team***

DWH, ETL process, data with anomalies.

ex00

```
This is a team project. Take a look at the Graph.
There are 4 cities (a, b, c and d) and arcs between them with costs (or taxes). Actually, the cost is (a,b) = (b,a).
Please create a table with named nodes using structure {point1, point2, cost} and fill data based on a picture (remember there are direct and reverse paths between 2 nodes).
Please write a SQL statement that returns all tours (aka paths) with minimum travel cost if we start from city "a".
Remember, you need to find the cheapest way to visit all cities and return to your starting point. For example, the tour looks like a -> b -> c -> d -> a.
Below is an example of the output data. Please sort the data by total_cost and then by tour.
```

ex01

```
Please add a way to see additional rows with the most expensive cost to the SQL from the previous exercise. Take a look at the sample data below. Please sort the data by total_cost and then by tour.
```
