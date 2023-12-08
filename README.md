# Dimensional modelling with Postgres, dbt and DuckDB


## Description

This is my personal project for practice of my skillset. Specifically, I want to start getting some experience with dimensional modelling for datawarehouses, [data build tool](https://docs.getdbt.com/) for transformation in SQL, as well as using [DuckDB](https://duckdb.org/) for the first time. It doesn't hurt to get more experieced in using git, GitHub, SQL, Python and other basic tools at the same time.   

My source is a Postgres DB running on localhost, where I have restored a version of the [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/). To "extract" data into DuckDB I used the [DuckDB PostgreSQL Scanner Extension](https://duckdb.org/2022/09/30/postgres-scanner). 

### Sources

I've modelled my workflow after [this dbt blog post](https://docs.getdbt.com/blog/kimball-dimensional-model) by Jonathan Neo, only I used a different dataset and a different source. I am also using the original ["Data Warehouse Toolkit"](https://www.goodreads.com/book/show/748203.The_Data_Warehouse_Toolkit) book, by Kimball and Ross. 

### Current status:

#### Bugs / workarounds
I've merged in my first DEV branch, with a complete set of code and docs. There are tasks to be done and improvements to be made, but my first goal was to get a complete sample up and running. 
Specifically I have struggled with the Scanner Extension in DuckDB, it throws a Runtime Error about loading the extension when it was already loaded. Possibly already reported [here](https://github.com/duckdb/dbt-duckdb/issues/179). It seems to not affect the models in any other way that the dbt run command is a bit unstable in creating the models. It needs to be ran a couple of times before the views/tables for all models are persisted in the duckdb file. Also, I suspect it causes the ref-macro to not find the staging models in marts models code. I'll see what I can do to fix this, it was supposed to be fixed in more recent versions according to the issue thread. Also, I did a workaround by copy into table in duckdb from one of the views it creates from the scanner, it complained about inconsistency in the view. Will research this one more as well.  

#### To Do

- [ ] Generate date dimension
- [ ] Do something with actors, add them to film dimension
- [ ] Fix error message that blocks the use of ref macro on the staging models
- [ ] Include dim_address of customer as customer_address in fct_rental?
- [ ] Check schema.yml in marts for inconsistencies (I suspect at least some)
- [ ] Add more tests
- [ ] Add more meaningful documentation
- [ ] How to handle changes in data - CDC, CRUDs, what does one do... in dbt.



### How to: TBD
