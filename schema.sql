

-- Orders table
CREATE TABLE orders (
  order_id VARCHAR(20) PRIMARY KEY,
  customer_id VARCHAR(20),
  order_date DATE,
  product_id VARCHAR(20),
  category VARCHAR(50),
  price DECIMAL(10,2),
  freight_value DECIMAL(10,2),
  review_score TINYINT,
  delivery_duration INT -- days from order to delivery
);

INSERT INTO orders VALUES
('O001','C001','2024-05-01','P001','Electronics',500.00,50.00,1,20),
('O002','C002','2024-05-03','P002','Fashion',100.00,15.00,5,5),
('O003','C001','2024-05-05','P003','Electronics',1500.00,200.00,2,25),
('O004','C003','2024-05-07','P004','Household',90.00,20.00,4,7),
('O005','C004','2024-05-10','P005','Groceries',200.00,10.00,2,12),
('O006','C005','2024-05-12','P006','Electronics',2500.00,500.00,3,30), -- trigger: high discount & profit
('O007','C006','2024-05-15','P007','Fashion',120.00,12.00,1,8),
('O008','C007','2024-05-17','P008','Books',60.00,5.00,2,10),
('O009','C008','2024-05-18','P009','Toys',95.00,10.00,1,6),
('O010','C009','2024-05-20','P010','Fashion',180.00,20.00,4,10),
('O011','C010','2024-05-22','P011','Electronics',900.00,100.00,2,25),
('O012','C011','2024-05-24','P012','Household',75.00,15.00,3,5),
('O013','C012','2024-05-26','P013','Books',45.00,5.00,6,4),
('O014','C013','2024-05-27','P014','Groceries',300.00,20.00,2,14),
('O015','C014','2024-05-28','P015','Electronics',1000.00,150.00,1,22),
('O016','C015','2024-05-29','P016','Fashion',160.00,25.00,5,6),
('O017','C016','2024-05-30','P017','Household',95.00,18.00,3,5),
('O018','C017','2024-06-01','P018','Groceries',220.00,15.00,3,13),
('O019','C018','2024-06-03','P019','Toys',110.00,10.00,1,7),
('O020','C019','2024-06-05','P020','Books',70.00,8.00,2,6),
('O021','C020','2024-06-06','P021','Fashion',140.00,20.00,4,10),
('O022','C021','2024-06-07','P022','Electronics',2800.00,450.00,2,40), -- trigger: high price + profit
('O023','C022','2024-06-08','P023','Fashion',95.00,10.00,1,4),
('O024','C023','2024-06-09','P024','Household',130.00,10.00,3,5),
('O025','C024','2024-06-10','P025','Books',85.00,8.00,5,6),
('O026','C025','2024-06-11','P026','Groceries',180.00,9.00,2,12),
('O027','C026','2024-06-12','P027','Electronics',1200.00,100.00,1,22),
('O028','C027','2024-06-13','P028','Fashion',105.00,12.00,2,5),
('O029','C028','2024-06-14','P029','Household',115.00,20.00,3,6),
('O030','C029','2024-06-15','P030','Books',55.00,5.00,4,5),
('O031','C030','2024-06-16','P031','Groceries',210.00,10.00,2,11),
('O032','C031','2024-06-17','P032','Electronics',1800.00,300.00,1,35), -- trigger: profit
('O033','C032','2024-06-18','P033','Fashion',175.00,15.00,3,6),
('O034','C033','2024-06-19','P034','Toys',90.00,6.00,2,5),
('O035','C034','2024-06-20','P035','Books',65.00,5.00,2,4),
('O036','C035','2024-06-21','P036','Household',80.00,8.00,3,5),
('O037','C036','2024-06-22','P037','Electronics',950.00,120.00,2,20),
('O038','C037','2024-06-23','P038','Fashion',185.00,25.00,5,6),
('O039','C038','2024-06-24','P039','Groceries',205.00,18.00,3,13),
('O040','C039','2024-06-25','P040','Books',95.00,10.00,4,7),
('O041','C040','2024-06-26','P041','Household',105.00,15.00,2,5),
('O042','C041','2024-06-27','P042','Fashion',115.00,12.00,3,6),
('O043','C042','2024-06-28','P043','Toys',130.00,15.00,2,8),
('O044','C043','2024-06-29','P044','Electronics',1400.00,200.00,2,24),
('O045','C044','2024-06-30','P045','Fashion',165.00,18.00,4,6),
('O046','C045','2024-07-01','P046','Household',125.00,10.00,3,5),
('O047','C046','2024-07-02','P047','Books',75.00,7.00,4,5),
('O048','C047','2024-07-03','P048','Groceries',240.00,12.00,2,14),
('O049','C048','2024-07-04','P049','Electronics',2650.00,600.00,1,42), -- trigger: high-value outlier
('O050','C049','2024-07-05','P050','Toys',125.00,10.00,3,6);


CREATE TABLE return_risk_alerts (
  alert_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id VARCHAR(20),
  risk_score INT,
  alert_message VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_return_risk 
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
  DECLARE score INT DEFAULT 0;
  DECLARE note VARCHAR(255) DEFAULT '';

  -- Rule: Low review
  IF NEW.review_score <= 2 THEN
    SET score = score + 3;
    SET note = CONCAT(note, 'Low review; ');
  END IF;

  -- Rule: High delivery duration
  IF NEW.delivery_duration > 15 THEN
    SET score = score + 2;
    SET note = CONCAT(note, 'Late delivery; ');
  END IF;

  -- Rule: High freight suggests valuable product
  IF NEW.freight_value > 100 THEN
    SET score = score + 2;
    SET note = CONCAT(note, 'High freight; ');
  END IF;

  -- Insert alert if risk score ≥ 3
  IF score >= 3 THEN
    INSERT INTO return_risk_alerts(order_id, risk_score, alert_message)
      VALUES (NEW.order_id, score, note);
  END IF;
END;
//

DELIMITER ;


-- Insert a risk-triggering order
INSERT INTO orders 
(order_id, customer_id, order_date, product_id, category, price, freight_value, review_score, delivery_duration)
VALUES
('O0051','C004','2024-05-10','P005','Electronics',2500.00,150.00,1,30);

-- Check alerts
SELECT * FROM return_risk_alerts;


INSERT INTO orders 
VALUES ('O0051','C036','2024-05-03','P003','Furniture',1200.00,180.00,1,90);

INSERT INTO orders 
VALUES('O0053', 'C052', '2024-05-03', 'P006', 'Furniture', 1000.00, 120.00, 5,5);

INSERT INTO orders VALUES
('O0054', 'C053', '2024-05-04', 'P007', 'Appliances', 800.00, 180.00, 1, 5);


