# ecommerce_dataset

## Introduction

This project focuses on the analysis of ecommerce shipping data through SQL queries. The goal is to extract and manipulate structured data from a database to derive insights regarding shipping expenses, order statuses, and customer details.

## Tools Utilized

- **Database Management System**: MySQL
- **Development Environment**: MySQL Workbench

## Dataset Description

The analysis is based on a simulated dataset of ecommerce shipping data, which consists of the following tables:

1. **shipping_data**
   - `order_id`: INT (Primary Key)
   - `customer_id`: INT
   - `shipping_cost`: DECIMAL
   - `order_date`: DATE
   - `delivery_date`: DATE
   - `status`: VARCHAR

2. **customers**
   - `customer_id`: INT (Primary Key)
   - `customer_name`: VARCHAR

## Executed SQL Queries

The following SQL queries were performed to analyze the dataset:

1. **Retrieve All Records**
   ```sql
   SELECT * FROM shipping_data;
   ```

2. **Filter Records by Order Status**
   ```sql
   SELECT * FROM shipping_data WHERE status = 'Delivered';
   ```

3. **Sort Records by Shipping Cost**
   ```sql
   SELECT * FROM shipping_data ORDER BY shipping_cost DESC;
   ```

4. **Calculate Total Shipping Costs by Status**
   ```sql
   SELECT status, SUM(shipping_cost) AS total_shipping_cost
   FROM shipping_data
   GROUP BY status;
   ```

5. **Join Query to Integrate Shipping and Customer Information**
   ```sql
   SELECT s.order_id, c.customer_name, s.shipping_cost
   FROM shipping_data s
   INNER JOIN customers c ON s.customer_id = c.customer_id;
   ```

6. **Subquery to Identify Orders with Above-Average Shipping Costs**
   ```sql
   SELECT * FROM shipping_data
   WHERE shipping_cost > (SELECT AVG(shipping_cost) FROM shipping_data);
   ```

7. **Create a View for Orders that Have Been Delivered**
   ```sql
   CREATE VIEW delivered_orders AS
   SELECT * FROM shipping_data WHERE status = 'Delivered';
   ```

8. **Enhance Query Performance with Indexes**
   ```sql
   CREATE INDEX idx_customer_id ON shipping_data(customer_id);
   ```

## Visual Outputs

Screenshots showcasing the results of each query are included in this repository to illustrate the findings from the analysis.
![Screenshot 2025-04-10 160746](https://github.com/user-attachments/assets/ebe882b2-9668-4810-83ff-5fd76ca753ce)
![Screenshot 2025-04-10 160836](https://github.com/user-attachments/assets/b0b2a928-f23a-4be5-842f-006f0a966db5)
![Screenshot 2025-04-10 160909](https://github.com/user-attachments/assets/40f1a842-7456-4125-998d-f01616d5b6c1)
![Screenshot 2025-04-10 160939](https://github.com/user-attachments/assets/14115bb2-1383-409a-bec9-2747288e2c6c)
![Screenshot 2025-04-10 161034](https://github.com/user-attachments/assets/a6260c70-8224-4b72-a260-35794612e474)
![Screenshot 2025-04-10 161115](https://github.com/user-attachments/assets/cd316e82-2412-45ea-bfe1-8aa5964a8b0a)
![Screenshot 2025-04-10 161235](https://github.com/user-attachments/assets/d07c235a-83a1-421e-b044-8a2b8e8b0854)

## Summary

This project offered practical experience in utilizing SQL for data analysis, encompassing data extraction, manipulation, and optimization strategies. The insights obtained can assist in understanding shipping costs and customer behavior within the ecommerce sector.

