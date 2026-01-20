/*
 Task: Obtain the total sales for the first and last day for which records are available.
 
 By: MGarrido311
 Date: 20260112
 */

-- Calculate total sales for first and last recorded day using FILTER clause
SELECT
    SUM(v."Precio" * v."Cantidad")  -- precio = price, cantidad = quantity
        FILTER (WHERE v."Fecha" = (SELECT MIN("Fecha") FROM venta))  -- fecha = date, get earliest date
        AS TotalSalesDay1,  -- Total sales on first day

    SUM(v."Precio" * v."Cantidad")  -- precio = price, cantidad = quantity
        FILTER (WHERE v."Fecha" = (SELECT MAX("Fecha") FROM venta))  -- fecha = date, get latest date
        AS TotalSalesLastDay  -- Total sales on last day
FROM venta v;  -- venta = sales table