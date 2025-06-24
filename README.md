
# 🛡️ Return Risk Analyzer (SQL + Flask)

This is a mini data app that identifies potentially risky ecommerce orders using SQL logic and displays alerts through a Flask-based web interface.

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
- 🔄 **Auto-refresh enabled** – New risky orders added in MySQL will reflect every 10 seconds  
- 💡 **Expandable** – Add dashboard, filters, or charts with Streamlit/Plotly later

## 📁 Folder Structure

```
return-risk-analyzer/
│
├── risk_analyzer.py          # Flask backend with DB logic
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

### 1. Clone this repo

```bash
git clone https://github.com/your-username/return-risk-analyzer.git
cd return-risk-analyzer
```


### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure DB

Update your MySQL credentials in `app.py`:

```python
connection = pymysql.connect(
    host='localhost',
    user='your_user',
    password='your_password',
    db='your_db_name',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)
```

### 5. Run the Flask app

```bash
python app.py
```

Visit [http://127.0.0.1:5000/](http://127.0.0.1:5000/) in your browser.




