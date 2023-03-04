import pandas as pd
from typing import List, Union, Dict

from dbt_demo.adapter.adapter import Source


class CSVSource(Source):
    """Reads the source csv files.

    Args:
        source_files (Union[List[str], str]): Source file for reading. Can be a list
            of files or simply one file path.
        base_path (str, optional): Base path of the file list. Defaults
            to None.
    """

    def __init__(
        self, source_files: Union[List[str], str], base_path: str = None
    ) -> None:
        self.source_files = source_files
        self.base_path = base_path

    def read(self) -> Dict[str, pd.DataFrame]:
        """Reads a set of csv files into dataframes

        Returns:
            List[pd.DataFrame]: List of Dataframes.
        """
        dataframes_dict = {}
        for source_file in self.source_files:
            if self.base_path:
                print(f"{self.base_path}/{source_file}")
                df = pd.read_csv(f"{self.base_path}/{source_file}")
            else:
                df = pd.read_csv(f"{source_file}")
            dataframes_dict[source_file] = df
        return dataframes_dict