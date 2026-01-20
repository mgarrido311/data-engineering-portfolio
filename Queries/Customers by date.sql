/*
 Task: Calculate the percentage of customers by province who made purchases.

 By: MGarrido311
 Date: 20260112
 */

-- Calculate total customers and customers who purchased by province
SELECT 
    c.provincia,
    COUNT(DISTINCT c.id) AS TotalCustomers,  -- Total customers per province
    COUNT(DISTINCT v."IdCliente") AS CustomersPurchased,  -- Customers who made at least one purchase
    ROUND(
        COUNT(DISTINCT v."IdCliente") * 100.0 / COUNT(DISTINCT c.id), 
        2
    ) AS PurchasePercentage  -- Percentage of customers who purchased
FROM clientes c
LEFT JOIN venta v ON c.id = v."IdCliente"  -- LEFT JOIN to include all customers
GROUP BY c.provincia
ORDER BY c.provincia;