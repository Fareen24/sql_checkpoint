# SQL Checkpoint

## Description

This repository contains the files and SQL queries for a school assignment focused on databases and SQL. The assignment was completed using PostgreSQL as the database management system. The repository includes the following:

- **Instructions**: Guidelines and requirements for completing the assignment.
- **Questions**: The database-related questions that needed to be answered using SQL queries.
- **Database Setup**: SQL scripts to set up the required databases for the assignment.
- **SQL Queries**: The SQL query syntax used to answer each of the questions.

## Repository Structure

- `instructions/`: Contains the instructions for the assignment.
- `questions/`: Includes the questions that were provided for the assignment.
- `databases/`: Contains SQL scripts for creating and populating the databases needed for the queries.
- `queries/`: Holds the SQL queries that were written to answer the questions.

## Getting Started

### Prerequisites

- **PostgreSQL**: Ensure that PostgreSQL is installed on your machine. The queries and scripts were tested using PostgreSQL, so compatibility with other database management systems is not guaranteed.

### Setting Up the Database

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    ```

2. Navigate to the `databases/` directory and run the SQL scripts to set up the databases:

    ```bash
    psql -U your-username -d your-database-name -f databases/setup.sql
    ```

    Replace `your-username` and `your-database-name` with your PostgreSQL username and desired database name.

### Running the Queries

1. After setting up the databases, navigate to the `queries/` directory.
2. Execute the SQL queries to answer the questions:

    ```bash
    psql -U your-username -d your-database-name -f queries/query1.sql
    ```

    Repeat this step for each query file in the `queries/` directory.

## Usage

The SQL queries provided in this repository is for learning purposes only and learning how to manipulate data using SQL in PostgreSQL.

## Contributing

Contributions to this repository are welcome. If you find any issues or have suggestions for improvement, feel free to open a pull request or create an issue.

## Disclaimer
This was an assignment or checkpoint for my data science course.


