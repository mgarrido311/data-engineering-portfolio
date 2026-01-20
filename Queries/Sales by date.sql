/*
 Task: Calculate the total sales amount by date and identify which date had the sales record.
 
 By: MGarrido311 
 Date: 20260101
 */

-- Calculate the total sales amount by date order by total sales desc
select v."Fecha" as date ,
sum(v."Precio" * v."Cantidad" ) as total_sales -- precio = price and cantidad = amount
from venta v 
group by v."Fecha" --
order by sum(v."Precio" * v."Cantidad" ) desc

-- identify which date had the sales record.
select v."Fecha" as date ,
sum(v."Precio" * v."Cantidad" ) as total_sales 
from venta v 
group by v."Fecha" 
order by sum(v."Precio" * v."Cantidad" ) desc
limit 1
