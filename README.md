# Dimensional modelling with Postgres, dbt and DuckDB


## Description

This is my personal project for practice of my skillset. Specifically, I want to start getting some experience with dimensional modelling for datawarehouses, [data build tool](https://docs.getdbt.com/) for transformation in SQL, as well as using [DuckDB](https://duckdb.org/) for the first time. It doesn't hurt to get more experieced in using git, GitHub, SQL, Python and other basic tools at the same time.   

My data source is a Postgres DB running on localhost, where I have restored a version of the [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/). To "extract" data into DuckDB I used the [DuckDB PostgreSQL Scanner Extension](https://duckdb.org/2022/09/30/postgres-scanner). 

### Sources

I've modelled my workflow after [this dbt blog post](https://docs.getdbt.com/blog/kimball-dimensional-model) by Jonathan Neo, only I used a different dataset and a different source. I am also using the original ["Data Warehouse Toolkit"](https://www.goodreads.com/book/show/748203.The_Data_Warehouse_Toolkit) book, by Kimball and Ross, as a reference work.  

### Current status:

I have a working workflow that transform oltp source tables in local postgres server into dimensional models in duckdb. I have more dbt stuff I want to explore, see the to do section below. 

I recently added a date dimension, but I am unsure if it should only be used in views, or if I should implement role playing dimension through creating different surrogate keys in the fact table to the date table for the different date fields. Will leave it as-is for now, I need to understand this better. 

Also, I briefly looked into how to handle changes and created one snapshot file of the rental staging table. Snapshots in dbt implements Slowly Changing Dimensions Type 2 strategy. Supposedly hard deletes can also be handled with snapshot configuration.

Project DAG:

![current DAG for the project](/docs/dbt-dag.png)

#### Bugs / workarounds
I resolved some error messages that were due to a malconfiguration in profiles.yml, described in a comment in dbt-duckdb repo, issue 179. Also, I did a workaround by copy into table in duckdb from one of the views it creates from the scanner, it complained about inconsistency in the view. Will research this one more as well. 

#### To Do

- [X] Add date dimension
- [X] Fix error message that blocks the use of ref macro on the staging models
- [ ] Add more tests, singular and generic
- [ ] Add more documentation
- [ ] Add hooks
- [X] How to handle changes in data - CDC, CRUDs, what does one do... in dbt (snapshots aso).
- [ ] Research error message about inconsistent views



### How to: 

You need to have dbt-duckdb and dbt installed, as well as Postgres with the sample database restored to it. I also used DBeaver to explore my databases and to generate ERD of the source. When I wanted to create an ER diagram of the dimensional model in Dbeaver, I found that Dbeaver is not able to render neither views nor tables from duckdb (described in duckdb repo issue 6485), so I used dbdiagram.io instead. 

#### Steps

- Clone this repo
- Create a profile.yml to connect to DuckDB. I have created mine outside of the repo, in the .dbt directory. 
This is what it looks like:

![contents of my profiles.yml file](/docs/profiles_yml.png)

My duckdb database file also is outside of the repo. I have opened it and run the attach command once before I started running dbt, it is then stored in the file every time the file is opened. But it is also possible to have the attach command configured in profiles.yml.

- Run dbt debug to verify you can connect to duckdb
- Run dbt deps to install dependencies
- Run dbt run && dbt test to create and test models
- Run dbt clean if you want to delete target folder and try running again from scratch (remember run dbt deps afterwards)
- Run dbt docs generate and dbt docs serve to generate your documenation and view it afterwards. For instance, this is where you can view your DAGs with the lineage information.

Tip! Avoid this noob error when running dbt commands: issue the command from a different folder than dim_mod_dvdrentals. That won't work. 

2nd Tip! Make sure the duckdb database file is not opened somewhere else when you run the dbt commands that need to use it. Duckdb [supports concurrency but only one process](https://duckdb.org/faq.html#how-does-duckdb-handle-concurrency). The error message is not self explanatory:

` Encountered an error:
Runtime Error
  'utf-8' codec can't decode byte 0xe5 in position 76: invalid continuation byte`.


