-- Este comando conecta ao banco de dados chamado "practice_db"
\c practice_db


DROP VIEW IF EXISTS customers_sumary;
CREATE OR REPLACE VIEW customers_sumary AS 
    SELECT 
     customer_id AS "customerId",
     COUNT(*)::INT AS "totalOrders",
     SUM(amount)::FLOAT AS "totalRevenue",
     MAX(amount)::FLOAT AS "maxOrder",
     MIN(amount)::FLOAT AS "minOrder",
     ROUND(AVG(amount),2)::FLOAT AS "averageTicket"
      FROM orders
      GROUP BY customer_id
      ORDER BY customer_id;



SELECT * FROM customers_sumary ;





