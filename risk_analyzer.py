from flask import Flask, render_template
import pymysql
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

app = Flask(__name__)

# DB connection
def get_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        db=os.getenv("DB_NAME"),
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/alerts')
def alerts():
    connection = get_connection()
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM return_risk_alerts")
        rows = cursor.fetchall()
    connection.close()
    return render_template("alerts.html", orders=rows)

@app.route('/high_freight')
def freight():
    connection = get_connection()
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM orders WHERE freight_value > 150")
        rows = cursor.fetchall()
    connection.close()
    return render_template("freight.html", orders=rows)

if __name__ == '__main__':
    app.run(debug=True)


