
# Return Risk Analyzer (SQL + Flask)

A lightweight data app that flags potentially risky ecommerce orders using SQL-based logic and presents alerts in a Flask UI.

**Project walkthrough:**  
https://medium.com/@singhria.0829/building-a-real-time-order-return-risk-analyzer-with-mysql-and-flask-2fc72e948adf

## Overview

Ecommerce platforms face large return volumes. This project helps detect risky orders early based on:

- Delivery duration
- Low review scores
- High freight charges

## Features

- **Risk alerts** for high-return-risk orders
- **High freight orders** view
- **Auto-refresh** every 10 seconds (new risky orders appear quickly)
- **Extensible** foundation for dashboards, filters, or charts

## Tech Stack

- **MySQL** for relational storage and query logic
- **Flask** for the web app
- **Pandas + PyMySQL** for data access
- **HTML/CSS (Jinja2)** for templating

## Project Structure

```
return-risk-analyzer/
├── risk_analyzer.py          # Flask backend with DB logic
├── requirements.txt          # Dependencies
├── .env                      # Environment variables (local only)
├── .gitignore                # Ignore .env, __pycache__, etc.
├── schema.sql                # Optional MySQL schema
└── templates/                # HTML templates
    ├── base.html             # Shared layout and styles
    ├── index.html            # Dashboard homepage
    ├── alerts.html           # Risky orders
    └── freight.html          # High freight orders
```

## Setup

### 1) Create the database

Use the schema file if you have one:

```bash
mysql -u root -p return_risk_analyzer < schema.sql
```

Replace `return_risk_analyzer` with your database name if needed.

### 2) Configure environment variables

Create a `.env` file at the repo root:

```env
DB_HOST=localhost
DB_USER=your_mysql_username
DB_PASSWORD=your_mysql_password
DB_NAME=return_risk_analyzer
```

### 3) Install dependencies

```bash
pip install -r requirements.txt
```

### 4) Run the app

```bash
python risk_analyzer.py
```

Visit http://127.0.0.1:5000/ in your browser.

## Routes

| Route | Description |
| --- | --- |
| `/` | Home dashboard |
| `/alerts` | Return risk alerts |
| `/high_freight` | Orders with high freight values |




