# Brokerage Rate Management System

## Project Overview

The **Brokerage Rate Management System** is an Oracle SQL and PL/SQL database project designed to manage insurance brokers, customers, insurance products, brokerage rates, policies, and brokerage transactions.

The project demonstrates practical database development concepts such as relational database design, SQL joins, views, aggregate reporting, PL/SQL functions, stored procedures, triggers, and rate-change history tracking.

---

## Technologies

* Oracle Database
* Oracle SQL
* PL/SQL
* Relational Database Management System (RDBMS)
* GitHub

---

## Database Architecture

The project contains the following main tables:

1. **BROKERS** – Stores broker information.
2. **CUSTOMERS** – Stores customer information.
3. **PRODUCTS** – Stores insurance product details.
4. **BROKERAGE_RATES** – Stores brokerage rates assigned to brokers and products.
5. **POLICIES** – Stores insurance policy information.
6. **BROKERAGE_TRANSACTIONS** – Stores calculated brokerage transactions.
7. **BROKERAGE_RATE_HISTORY** – Maintains the history of brokerage rate changes.

---

## Key Features

### Broker Management

* Store broker details
* Maintain broker status
* Manage broker information

### Customer Management

* Store customer details
* Maintain customer contact information
* Track customer status

### Insurance Product Management

* Manage insurance products
* Categorize products by type
* Maintain product status

### Brokerage Rate Management

* Store brokerage rates
* Define effective dates
* Track rate changes
* Maintain brokerage rate history

### Policy Management

* Store policy details
* Link customers, brokers, and products
* Track premium amounts and policy dates

### Brokerage Calculation

* Calculate brokerage amount using premium and brokerage rate
* Store calculated brokerage transactions

---

## SQL Components

The project demonstrates:

* SELECT queries
* INNER JOIN
* LEFT JOIN
* GROUP BY
* Aggregate functions
* ORDER BY
* Filtering with WHERE
* Date functions
* Views
* Business reporting queries

---

## PL/SQL Components

### Function

`calculate_brokerage`

Calculates brokerage amount based on:

**Premium Amount × Brokerage Rate / 100**

### Procedure

`create_brokerage_transaction`

The procedure:

1. Retrieves the policy premium.
2. Calculates brokerage amount.
3. Creates a brokerage transaction.
4. Stores the transaction in the database.

### Trigger

`trg_brokerage_rate_history`

Automatically records brokerage rate changes in the `BROKERAGE_RATE_HISTORY` table.

---

## Database Views

The project contains three reporting views:

* `VW_POLICY_DETAILS`
* `VW_BROKERAGE_REPORT`
* `VW_BROKERAGE_RATES`

These views simplify access to commonly required business information.

---

## Business Reports

The project includes reports for:

* Broker-wise brokerage
* Product-wise premium
* Monthly brokerage
* Active policies
* Brokerage rate history

---

## Project Execution Flow

```text
Create Tables
     ↓
Insert Sample Data
     ↓
Run SQL Queries
     ↓
Create Views
     ↓
Create PL/SQL Function
     ↓
Create PL/SQL Procedure
     ↓
Create Trigger
     ↓
Generate Business Reports
     ↓
Verify Database
```

---

## Repository Structure

```text
Brokerage-rate-management-system/
│
├── database/
│   ├── 01_create_tables.sql
│   ├── 02_insert_sample_data.sql
│   ├── 03_queries.sql
│   ├── 04_views.sql
│   ├── 05_functions.sql
│   ├── 06_procedures.sql
│   ├── 07_triggers.sql
│   └── 08_reports.sql
│
└── README.md
```

---

## Learning Outcomes

Through this project, the following practical database concepts are demonstrated:

* Relational database design
* Primary and foreign keys
* Data integrity constraints
* SQL joins
* Aggregation and reporting
* Database views
* PL/SQL functions
* PL/SQL procedures
* Database triggers
* Audit/history tracking
* Business-oriented SQL reporting

---

## How to Run

The SQL scripts can be executed sequentially in an Oracle Database environment.

### Execution Order

1. `01_create_tables.sql` – Create database tables and constraints
2. `02_insert_sample_data.sql` – Insert sample data
3. `03_queries.sql` – Execute SQL queries and reports
4. `04_views.sql` – Create database views
5. `05_functions.sql` – Create PL/SQL functions
6. `06_procedures.sql` – Create PL/SQL procedures
7. `07_triggers.sql` – Create database triggers
8. `08_reports.sql` – Execute business reports

### Oracle Environment

The project was developed and tested using an Oracle Database environment.

> Note: Execute the scripts in the above order because later components depend on tables and objects created by earlier scripts.


## Project Status

**Completed**

The database structure, sample data, SQL queries, views, PL/SQL components, trigger-based history tracking, and business reports have been implemented and tested using Oracle Database.
