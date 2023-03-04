from os import listdir
from os.path import isfile, join
from sqlalchemy import create_engine
import click
import re

from dbt_demo.source.csv_source import CSVSource
from dbt_demo.targets.target_db import Target


@click.command()
@click.option("--database", help="database flavour")
def create_tables(database: str):
    """Command line to read csv files and write then os a sql database.

    Args:
        database (str): Databse flavour.
    """
    files = [f for f in listdir("data") if isfile(join("data", f))]
    csv = CSVSource(base_path="data", source_files=files)
    dict = csv.read()
    engine = create_engine(
        f"{database}+psycopg2://username:password@localhost:5432/movie_database"
    )
    postgres = Target(engine=engine)
    for file_name, df in dict.items():
        m = re.search(r"(\w+)_202211251432.csv", file_name)
        postgres.write(dataframe=df, table_name=m.group(1))


if __name__ == "__main__":
    create_tables()