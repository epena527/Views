
--create a view in the Exam database using the select below called V1
use SAMPLE;


CREATE VIEW V1
as
select
	s.productkey,
	(select p.productname
	from ContosoRetailDW.dbo.dimproduct p
	where p.productkey = s.productkey) as pname,
	s.saleskey,
	s.salesquantity,
	s.unitprice,
	s.discountamount,
	s.salesamount,
	s.salesquantity * s.unitprice as ticketamount,
	(select p.unitprice * s.salesquantity
	from ContosoRetailDW.dbo.dimproduct p
	where p.productkey = s.productkey) as actamount
from ContosoRetailDW.dbo.FactSales s
where s.discountamount > 0
group by s.productkey,s.saleskey, s.SalesQuantity, s.SalesAmount,
		 s.UnitPrice, s.DiscountAmount, s.SalesAmount