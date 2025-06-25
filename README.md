
# 🛡️ Return Risk Analyzer (SQL + Flask)

This is a mini data app that identifies potentially risky ecommerce orders using SQL logic and displays alerts through a Flask-based web interface.

Check out the project walkthrough here: 

https://medium.com/@singhria.0829/building-a-real-time-order-return-risk-analyzer-with-mysql-and-flask-2fc72e948adf

## 🚀 Project Overview

Ecommerce platforms deal with massive return volumes. To minimize profit loss, this project helps **detect risky orders early** based on factors like:

- Delivery duration
- Low review scores
- High freight charges

## 🔧 Tech Stack

- **MySQL** for relational database and logic
- **Flask** for web app
- **Pandas + PyMySQL** for data handling
- **HTML/CSS (Jinja2)** for frontend rendering

## 📦 Features

- ⚠️ **Risk Alerts Page** – View flagged high-return-risk orders from the database  
- 📦 **High Freight Orders** – View orders with freight cost over a threshold  
- 🔄 **Auto-refresh enabled** – New risky orders added in database will reflect every 10 seconds  
- 💡 **Expandable** – Add dashboard, filters, or charts with Streamlit/Plotly later

## 📁 Folder Structure

```
return-risk-analyzer/
│
├── risk_analyzer.py          # Flask backend with DB logic
├── requirements.txt          # Dependencies used
├── .env                      # Environment variables (DB creds, secret keys)
├── .gitignore                # Ignore .env, __pycache__, etc.
├── schema.sql                # (Optional) MySQL table structure
│
├── templates/                # HTML templates using Jinja2
│   ├── base.html             # Shared layout and styles
│   ├── index.html            # Dashboard homepage
│   ├── alerts.html           # Risky orders (e.g., low reviews, high quantity)
│   └── freight.html          # Orders with high freight value

```

## 🖥️ Running Locally

If you want to run this app in your system, follow these steps: 

### ⚙️ Step 1: Create the MySQL Database

This app connects to a MySQL database using environment variables stored in a `.env` file. Set up your MySQL database with the required tables. 
If you have a `schema.sql` file, you can use:

```bash
mysql -u root -p return_risk_analyzer < schema.sql
```

Replace `return_risk_analyzer` with your actual database name if it's different.

---

### 🔐 Step 2: Create a `.env` File

In the root folder of your project, create a file named `.env` with the following content:

```env
DB_HOST=localhost
DB_USER=your_mysql_username
DB_PASSWORD=your_mysql_password
DB_NAME=return_risk_analyzer
```

✅ Make sure `.env` is included in your `.gitignore` file to prevent pushing sensitive info to GitHub.

---

### 🔗 Step 3: How the App Connects to the Database

The following function is already set up in the code to use environment variables securely:

```python
def get_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        db=os.getenv("DB_NAME"),
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )
```

No need to hardcode credentials as the app reads them directly from `.env`.

---

### 📦 Step 4: Install Required Python Packages

Use `requirements.txt` to install all dependencies:

```bash
pip install -r requirements.txt
```

### 5. Run the Flask app

```bash
python app.py
```

Visit (http://127.0.0.1:5000/) in your browser.




