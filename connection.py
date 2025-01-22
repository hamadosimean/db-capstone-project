import mysql.connector as connector


class Connection:
    def __init__(self):
        pass

    """Class for mysql connection"""

    def mysql_connect(self, database="little_lemon"):
        """
        Mysql custom connection

        Parameters
        --------------

        database: database to use
        """
        try:
            self.con = connector.connect(
                password="FATIHAM68860", user="root", database=database
            )
            print("Connection establissed !!")
        except Exception as e:
            print(f"Error is occured: {e}")

        return self.con

    def query(self, query):
        """Execution Mysql query
        Parameters
        ---------------
        query: MySQL query in string format
        """
        connection = self.mysql_connect()
        cursor = connection.cursor(buffered=True)
        results = cursor.execute(query)
        return results

    def show(self):
        """Show execution results"""
        for result in self.query:
            print(result)
