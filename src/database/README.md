# Oracle 11 Database Setup

This directory contains scripts and documentation for managing the Oracle 11 database used in this project.

## Requirements

- Oracle Database 11g installed and running
- SQL*Plus or compatible SQL client

## Setup Instructions

1. **Create the Database Schema**

    Run the provided SQL scripts to create tables, indexes, and other database objects:

    ```bash
    sqlplus username/password@localhost/XE @schema.sql
    ```

2. **Insert Initial Data**

    Populate tables with initial data if needed:

    ```bash
    sqlplus username/password@localhost/XE @data.sql
    ```

3. **Configuration**

    Update connection strings in your application to match your Oracle instance settings.

## Useful Commands

- Connect to Oracle:

  ```bash
  sqlplus username/password@localhost/XE
  ```

- Check database status:

  ```sql
  SELECT status FROM v$instance;
  ```

## Notes

- Ensure your Oracle listener is running.
- Modify scripts as needed for your environment.

## Troubleshooting

- Check Oracle logs for errors.
- Verify user permissions and tablespace availability.
