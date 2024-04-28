--Project: Querying a Large Relational Database--

Use AdventureWorks2012

--Q.a. Get all the details from the person table including email ID, phone number and phone number type
Solution:

select*from person.EmailAddress, person.PersonPhone, person.PhoneNumberType 

--Q.b. Get the details of the sales header order made in May 2011
Solution:

select * from sales.salesorderheader where YEAR(OrderDate)=2011 and MONTH(OrderDate)=5 

--Q.c. Get the details of the sales details order made in the month of May 2011
Solution:

select * from sales.SalesOrderDetail inner join sales.salesorderheader 
on sales.SalesOrderDetail.SalesOrderID=sales.salesorderheader.SalesOrderID
where month(OrderDate)=5 and year(OrderDate)=2011

--Q.d. Get the total sales made in May 2011
Solution:

select month(orderdate) as ordermonth, year(OrderDate) as orderyear, SUM(OrderQty*UnitPrice) as total_sales from sales.SalesOrderDetail 
inner join sales.salesorderheader on sales.SalesOrderDetail.SalesOrderID=sales.salesorderheader.SalesOrderID
where month(OrderDate)=5 and year(OrderDate)=2011
group by  month(orderdate), year(OrderDate)order by total_sales

--Q.e. Get the total sales made in the year 2011 by month order by increasing sales
Solution:

select month(orderdate) as ordermonth, year(OrderDate) as orderyear, SUM(OrderQty*UnitPrice) as total_sales from sales.SalesOrderDetail 
inner join sales.salesorderheader on sales.SalesOrderDetail.SalesOrderID=sales.salesorderheader.SalesOrderID
where year(OrderDate)=2011
group by  month(orderdate), year(OrderDate)order by total_sales

--Q.f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'
Solutuon:

select*from sales.SalesPerson
select*from person.Person
select count(SalesYTD) as total_sales from sales.SalesPerson inner join person.Person on sales.SalesPerson.BusinessEntityID = person.Person.BusinessEntityID
where  FirstName='Gustavo' and LastName ='Achong'

