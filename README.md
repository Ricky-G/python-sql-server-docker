# SQL Server Query Docker Container

This repository provides a Docker container for running SQL Server queries using Python with the pyodbc library. It includes the necessary setup to connect to a Microsoft SQL Server database.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Docker](https://docs.docker.com/get-docker/) installed on your system.
- Access to a Microsoft SQL Server database.
- Docker image contains the required ODBC driver and tools.

## Getting Started

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/sql-server-query-docker.git

2. Navigate to the repository directory:

   ```bash
   cd sql-server-query-docker
   ```

3. Update the connection details in 'sql-server-query.py' to match your database.
    
   ```bash
    server = 'your-server-name.database.windows.net'
    database = 'your-database-name'
    driver = '{ODBC Driver 18 for SQL Server}'  # Update to match your driver version
    username = 'your-username'
    password = 'your-password'

   ```
4. Build the Docker image:

   ```bash
   docker build -t sql-server-query .
   ```

5. Run the Docker container and the script will execute and print the query results to the console.

   ```bash
   docker run sql-server-query
   ```