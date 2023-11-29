# DimModWithDBT
Dimensional modelling with DBT

## Description

A project implementing dimensional modelling with DBT and DuckDB. 
Source: Postgres dvdrental sample db.

## How to:

### If doing from the first time 

- Download [dvdrental zip file](https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip) 
- install postgres
- create database dvdrental in postgres
- use PGAdmin to restore unpacked dvdrental zipfile (now .tar) into database (if you need instructions, find them [here](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/))
- install duck db
- install dbt adaptor for duckdb:
If no virtual environment:
python -m pip install dbt-duckdb 
(The -m flag makes sure that you are using the pip that's tied to the active Python executable.)
If virtual environment:
pip install dbt-duckdb
- run dbt init from terminal/cmd and folder where you want to create your project (in my case, the folder where my git repo was cloned to), answer prompts with name of project, database adapter and whatever info dbt needs to connect to the db (read more [here](https://docs.getdbt.com/reference/commands/init)). 
- what to do with dates? With duckdb.

### If doing by downloading this repository:



