SELECT * FROM ecommerce_data LIMIT 10;

SELECT * FROM ecommerce_data
WHERE Country = 'United Kingdom';

SELECT Description, Quantity
FROM ecommerce_data
ORDER BY Quantity DESC
LIMIT 10;

SELECT Description, SUM(Quantity) AS total_sold
FROM ecommerce_data
GROUP BY Description
ORDER BY total_sold DESC
LIMIT 10;

SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM ecommerce_data;

SELECT AVG(UnitPrice) AS avg_price
FROM ecommerce_data;

SELECT AVG(invoice_total) AS avg_revenue_per_invoice
FROM (
    SELECT InvoiceNo, SUM(Quantity * UnitPrice) AS invoice_total
    FROM ecommerce_data
    GROUP BY InvoiceNo
) AS t;

SELECT CustomerID, SUM(Quantity * UnitPrice) AS total_spent
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS month,
       SUM(Quantity * UnitPrice) AS revenue
FROM ecommerce_data
GROUP BY month
ORDER BY month;

SELECT *
FROM ecommerce_data
WHERE CustomerID IN (
    SELECT CustomerID
    FROM ecommerce_data
    GROUP BY CustomerID
    HAVING SUM(Quantity * UnitPrice) > 1000
);

CREATE VIEW top_products AS
SELECT Description, SUM(Quantity) AS total_sold
FROM ecommerce_data
GROUP BY Description
ORDER BY total_sold DESC
LIMIT 50;

CREATE INDEX idx_invoice ON ecommerce_data(InvoiceNo);
CREATE INDEX idx_customer ON ecommerce_data(CustomerID);
SELECT * FROM ecommerce_data LIMIT 20;
