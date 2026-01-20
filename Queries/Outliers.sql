/*
 Task: Compare average sales by product type, visualizing with and without outliers.
 
 Method: IQR (Interquartile Range) - Values outside Q1-1.5*IQR to Q3+1.5*IQR are considered outliers
 
 By: MGarrido311
 Date: 20260110
 */

-- Step 1: Calculate total sales for each transaction by product type
WITH totalsales AS (
    SELECT
        p."Tipo" as ProductType,
        v."Precio" * v."Cantidad" as Total  -- Total = Price * Quantity
    FROM venta v  -- venta = sales
    JOIN productos p ON v."IdProducto" = p."ID_PRODUCTO"
),
-- Step 2: Calculate Q1 and Q3 (25th and 75th percentiles) for each product type
limits AS (
    SELECT
        t.producttype,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY t.total) as Q1,  -- First quartile (25th percentile)
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY t.Total) as Q3   -- Third quartile (75th percentile)
    FROM totalsales t
    GROUP BY t.producttype
)
-- Step 3: Calculate averages with and without outliers
SELECT
    v.producttype,
    AVG(v.Total) as AveragewithOutliers,  -- Average including all data points
    AVG(CASE
        WHEN v.Total BETWEEN (l.Q1 - 1.5 * (l.Q3 - l.Q1))  -- Lower bound: Q1 - 1.5*IQR
                         AND (l.Q3 + 1.5 * (l.Q3 - l.Q1))  -- Upper bound: Q3 + 1.5*IQR
        THEN v.Total  -- Only include values within bounds
    END) as AveragewithoutOutliers  -- Average excluding outliers
FROM totalsales v
JOIN limits l ON v.producttype = l.producttype
GROUP BY v.producttype;