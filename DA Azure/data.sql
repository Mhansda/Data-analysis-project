USE AdventureWorksDW2020


select *
from SYS.all_columns

select SalesOrderNumber,OrderDate,SalesAmount,OrderQuantity,SalesAmount/OrderQuantity as U_price
from FactResellerSales
where year (OrderDate)=2019 
and SalesAmount > 6000
order by SalesAmount desc


select OrderDate,SalesAmount,
case 
when SalesAmount<1000 then 'C1'
when SalesAmount<5000 then 'C2'
when SalesAmount<10000 then 'C3'
else 'C4'
end as 'amt_cat'

from FactResellerSales


select ResellerKey ,count(*) as orders, sum(SalesAmount) as 'total sales',AVG (SalesAmount) as 'avarage_sales'
from FactResellerSales
group by ResellerKey
having sum(SalesAmount) >=200
order by 'avarage_sales' desc


select
month(orderdate) as Month,
year(orderdate) as year,
sum(SalesAmount) as Total 
from FactResellerSales
group by Month(orderdate), year(orderdate) 
order by Month



select Top 10 D.ResellerName,count(*) as orders, sum(SalesAmount) as 'total sales',AVG (SalesAmount) as 'avarage_sales'
from FactResellerSales F
join DimReseller D on F.ResellerKey=D.ResellerKey
group by D.ResellerName
having sum(SalesAmount) >=200
order by 'avarage_sales' asc