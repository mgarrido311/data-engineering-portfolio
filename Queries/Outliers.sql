WITH totalsales AS (
    SELECT 
        p."Tipo" as ProductType,
        v."Precio"  * v."Cantidad"  as Total
    FROM venta v -- sales
    JOIN productos p ON v."IdProducto"  = p."ID_PRODUCTO" 
),
limits AS (
    SELECT 
       t.producttype  ,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY t.total) as Q1, -- lower limit
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY t.Total) as Q3 -- higher limit
    FROM totalsales t
    GROUP BY t.producttype   
)
SELECT 
    v.producttype,
    AVG(v.Total) as AveragewithOutliers,
    AVG(CASE 
        WHEN v.Total BETWEEN (l.Q1 - 1.5 * (l.Q3 - l.Q1)) AND (l.Q3 + 1.5 * (l.Q3 - l.Q1)) -- remove out of range values
        THEN v.Total 
    END) as AveragewithoutOutliers
FROM totalsales  v
JOIN limits l ON v.producttype    = l.producttype    
GROUP BY v.producttype ;