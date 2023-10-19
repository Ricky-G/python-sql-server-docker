# Use a Python image as a base
FROM python:3.10

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    wkhtmltopdf \
    build-essential \
    g++ \
    gcc \
    flex \
    bison \
    gperf \
    ruby \
    perl \
    libfontconfig1-dev \
    libicu-dev \
    libfreetype6 \
    libssl-dev \
    python3-dev \
    vim \
    libsasl2-dev \
    curl \
    unixodbc-dev \ 
 && rm -rf /var/lib/apt/lists/*

# Add Microsoft GPG key for package verification
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Choose the appropriate repository for your Debian version (e.g., Debian 10)
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Update package manager information
RUN apt-get update

# Install Microsoft ODBC driver for SQL Server
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18

# https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=debian18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline

# Set environment variables to include SQL Server tools in the PATH
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PATH="$PATH:/opt/mssql-tools18/bin"

# Copy and install Python dependencies
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

# Copy your application code into the container
COPY . /app

# Set the entry point for your application
CMD ["python", "sql-server-query.py"]
