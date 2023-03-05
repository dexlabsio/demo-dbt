# dbt-demo
A repository for DBT demonstration running against a Postgres database

## Instructions

Commands to utilize and help the developing process:

1. **Requirements:**
  - `make requirements`: installs all packages from all requirements files
  - `make requirements-dev`: installs all packages from `requirements.dev.txt` file
  - `make requirements-minimum`: installs all packages from `requirements.txt` file


2. **Setup:**

 First, install the basic requirements:
  ```bash
  make requirements
  ```

  Create docker containers using 
  ```bash
  make up
  ```

  This will create a Postgres database, acting as our analytical database

  Then, run the following command line to create the tables from csv files into the database:
  ```bash
  python -m dbt-demo.etl_cli --database postgresql
  ```

  After that, we will use DBT to generate the models 

First of all we must run dbt deps to install and update project dependencies
 ```bash
  dbt deps 
  ```

  Then run all of our models

 ```bash
  dbt run 
  ```

3. **useful Commands:**

Here are some other useful commands that can help you while using DBT:

- `dbt test`: Runs all the tests defined in the YAML files.
- `dbt deps`: Installs and updates all DBT dependencies.
- You can specify the models and all of their child and parent models by running:

  ```bash
  dbt run [your model name]     # For only the specified model.
  dbt run [your model name]+   # For the specified model and all its child models.
  dbt run +[your model name]   # For the specified model and all its parent models.
  dbt run +[your model name]+ # For the specified model and all its child and parent models.
