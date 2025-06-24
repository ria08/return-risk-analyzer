
# 🛡️ Return Risk Analyzer (SQL + Flask)

This is a mini data app that identifies potentially risky ecommerce orders using SQL logic and displays alerts through a Flask-based web interface.

## 🚀 Project Overview

Ecommerce platforms deal with massive return volumes. To minimize profit loss, this project helps **detect risky orders early** based on factors like:

- High product quantities
- Low review scores
- High freight charges

## 🔧 Tech Stack

- **MySQL** for relational database and logic
- **Flask** for web app
- **Pandas + SQLAlchemy** for data handling
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
├── app.py                     # Flask backend
├── templates/
│   ├── base.html              # Shared layout
│   ├── index.html             # Homepage
│   ├── alerts.html            # Risky orders based on quantity/reviews
│   └── freight.html           # High freight value orders
├── schema.sql                 # (Optional) MySQL table structure
```

💻 How to Run Locally

Clone the repo
git clone https://github.com/yourusername/return-risk-analyzer.git
cd return-risk-analyzer

Install dependencies
pip install -r requirements.txt

Run the app
python app.py

Visit in browser
Open http://127.0.0.1:5000 to use the dashboard.



