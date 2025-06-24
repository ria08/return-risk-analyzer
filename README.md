🚨 Return Risk Analyzer — SQL + Flask Mini Project
A lightweight web-based monitoring tool that simulates risk analysis in ecommerce logistics. Built using MySQL, Flask, SQLAlchemy, and HTML/CSS, the app flags high-risk orders and freight-heavy transactions, helping operational teams take quick, data-driven actions.

📌 Project Objective
This project simulates a real-world scenario where ecommerce platforms need to identify risky orders before shipment. The tool flags orders with:

High product quantity (e.g., bulk orders prone to returns)

High freight charges (e.g., potential shipping inefficiencies)

⚙️ Real-time Flask interface allows teams to:

View latest flagged orders

Detect abnormal freight cost

Expand rules for future fraud or return risk alerts

🧠 Business Value
✔️ Prevention of costly returns by catching suspicious patterns early
✔️ Improved fulfillment accuracy via real-time dashboards
✔️ Operational efficiency by reducing manual order review
✔️ Easily extendable for fraud, churn, or refund tracking logic

🛠 Tech Stack
Component	Description
🐬 MySQL	Relational database to store and query orders
🐍 Flask	Python web framework for lightweight dashboards
🔗 SQLAlchemy	ORM to connect MySQL with Python
📊 Pandas	Data processing and logic filtering
💻 HTML/CSS	UI display of order tables

🚀 Features
Feature	Description
⚠️ Show Risky Orders	Based on order quantity or predefined rules
📦 Show High Freight Orders	Freight cost > ₹150 flagged as optimization needed
🔄 Auto Refresh	Updates dashboards every 10s to simulate real-time
🧩 Modular Logic	Easily update or add more risk detection criteria

🧪 Sample Rules Used
-- Risky if quantity >= 5 or review score <= 2
SELECT * FROM orders WHERE quantity >= 5 OR review_score <= 2;

-- Freight-heavy if freight value > 150
SELECT * FROM orders WHERE freight_value > 150;

📂 Folder Structure
/return-risk-analyzer
│
├── app.py                    # Flask application
├── requirements.txt          # Dependencies
├── /templates
│   ├── index.html            # Homepage with buttons
│   ├── alerts.html           # Risky orders table
│   └── freight.html          # High freight orders table
└── /static                   # CSS or JS (optional)

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



