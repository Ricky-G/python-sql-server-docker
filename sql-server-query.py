import pyodbc

server = '<your-db-server-name>.database.windows.net'
database = 'your-db-name'
driver = '{ODBC Driver 18 for SQL Server}'

# Replace with your own SQL Server username and password
username = ''
password = ''

try:
    # Establish a connection to the database
    cnxn = pyodbc.connect(f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}')

    # Create a cursor object to execute queries
    cursor = cnxn.cursor()

    # Execute the query and fetch the results from any table in the DB (this is just an example)
    query = 'SELECT TOP 100 * FROM dbo.account'
    cursor.execute(query)
    rows = cursor.fetchall()

    # Print the columns of each row to the console
    for row in rows:
        print(f"{row.AccountID}\t{row.Type}

except Exception as e:
    # Handle exceptions here
    print(f"An error occurred: {str(e)}")

finally:
    # Close the connection in the finally block to ensure proper cleanup
    if 'cnxn' in locals():
        cnxn.close()
