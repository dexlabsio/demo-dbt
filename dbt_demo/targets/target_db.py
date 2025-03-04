import pandas
import logging
from sqlalchemy import engine

from dbt_demo.adapter.adapter import TargetDB


class Target(TargetDB):
    """Target a database and writes a pandas dataframe to it.

    Args:
        engine (engine): SQL Alchemy Engine provided by the user.
    """

    def __init__(self, engine: engine) -> None:
        self.engine = engine

    def write(self, dataframe: pandas.DataFrame, table_name: str) -> None:
        """Write a pandas dataframe to a postgresql database.

        Args:
            dataframe (pandas.DataFrame): Pandas Dataframe to be written.
            table_name (str): Name of the table in postgres database.
        """
        try:
            dataframe.to_sql(table_name, self.engine, if_exists="replace", index=False)
        except:
            logging.exception("Error occurred")
        finally:
            self.engine.dispose()