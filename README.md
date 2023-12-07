# DimModWithDBT
Dimensional modelling with DBT

## Description

A project implementing dimensional modelling with DBT and DuckDB. 
Source: Postgres dvdrental sample db.

## How to:

### If doing for the first time 

- create git repo and clone to local directory, create local branch and check it out. Remember git adding continuously, and committing when appropriate. 
- Download [dvdrental zip file](https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip) 
- install postgres
- create database dvdrental in postgres
- use PGAdmin to restore  dvdrental tar file into database (if you need instructions, find them [here](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/))
- install duck db
- install dbt adaptor for duckdb:
If no virtual environment:
python -m pip install dbt-duckdb 
(The -m flag makes sure that you are using the pip that's tied to the active Python executable.)
If virtual environment:
pip install dbt-duckdb
- run dbt init from terminal/cmd and folder where you want to create your project (in my case, the folder where my git repo was cloned to), answer prompts with name of project & choose duckdb as adaptor. 

- create folder integration in dbt project, create subdirs 'source' and 'destination'. In source folder add the dvdrental zip file, in destination a sqlscript that loads the tables from postgres to duckdb? Or maybe just skip doing this in dbt, and copy the tables from postgres to duckdb with the PostgreSQL Scanner Extension:

Start duckdb with path parameter, like so:
C:\Users\cecil\source>duckdb.exe ./duckdbs/dvdrental.db

install postgres;
load postgres; 
call postgres_attach('user=postgres password=Joh4nne!23 host=localhost port=5432 dbname=dvdrental');
pragma show_tables;

To dump as parquet:
COPY(SELECT * FROM actor) TO 'actor.parquet' (FORMAT PARQUET);






