# Dimensional modelling with Postgres, dbt and DuckDB


## Description

This is my personal project for practice of my skillset. Specifically, I want to start getting some experience with dimensional modelling for datawarehouses, [data build tool](https://docs.getdbt.com/) for transformation in SQL, as well as using [DuckDB](https://duckdb.org/) for the first time. It doesn't hurt to get more experieced in using git, GitHub, SQL, Python and other basic tools at the same time.   

My source is a Postgres DB running on localhost, where I have restored a version of the [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/). To "extract" data into DuckDB I used the [DuckDB PostgreSQL Scanner Extension](https://duckdb.org/2022/09/30/postgres-scanner). 

### Sources

I've modelled my workflow after [this dbt blog post](https://docs.getdbt.com/blog/kimball-dimensional-model) by Jonathan Neo, only I used a different dataset and a different source. I am also using the original ["Data Warehouse Toolkit"](https://www.goodreads.com/book/show/748203.The_Data_Warehouse_Toolkit) book, by Kimball and Ross. 

### Current status:

I have a working workflow that transform oltp source tables in local postgres server into dimensional models. I have quite a few improvements I want to make, see the to do section below. 

#### Bugs / workarounds
I resolved some error messages that were due to a malconfiguration in profiles.yml, described in a comment [here](https://github.com/duckdb/dbt-duckdb/issues/179) Also, I did a workaround by copy into table in duckdb from one of the views it creates from the scanner, it complained about inconsistency in the view. Will research this one more as well. 

#### To Do

- [ ] Generate date dimension
- [ ] Do something with actors, add them to film dimension?
- [X] Fix error message that blocks the use of ref macro on the staging models
- [ ] Include dim_address of customer as customer_address in fct_rental
- [ ] Add more tests
- [ ] Add more meaningful documentation
- [ ] How to handle changes in data - CDC, CRUDs, what does one do... in dbt.



### How to: TBD
