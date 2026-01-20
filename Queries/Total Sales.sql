SELECT
    SUM(v."Precio" * v."Cantidad") -- precio = price and cantidad = amount
        FILTER (WHERE v."Fecha" = (SELECT MIN("Fecha") FROM venta)) -- fecha = date
        AS TotalSalesDay1,

    SUM(v."Precio" * v."Cantidad") -- precio = price and cantidad = amount
        FILTER (WHERE v."Fecha" = (SELECT MAX("Fecha") FROM venta)) -- fecha = date and venta = sales
        AS TotalSalesLastDay
FROM venta v; -- venta = sales
