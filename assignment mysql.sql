create database edyoda;

use edyoda;

create table SalesPeople (
	SNum int not null primary key,
	SName varchar(255) unique,
	city varchar(255),
	Comm int
);

insert into SalesPeople(SNum,SName,city,Comm)
values
	(1001,'peel','london',12),
	(1002,'serrese','sanjose',13),
	(1004,'motika','london',11),
	(1007,'rifkin','barcelona',15),
	(1003,'axelrod','newyork',10);

create table Customers (
	Cnum int not null primary key,
	Cname varchar(255),
	city varchar(255) not null,
	SNum int foreign key references SalesPeople(SNum)
);

insert into Customers
(Cnum,Cname,city,SNum)
values
	(2001,'Hoffman','london',1001),
	(2002,'giovanni','rome',1003),
	(2003,'liu','sanjose',1002),
	(2004,'grass','berlin',1002),
	(2006,'clemens','london',1001),
	(2008,'cisneros','sanjose',1007),
	(2007,'pereira','rome',1004);


create table orders(
	Onum int not null primary key,
	amt dec,
	Odate date,
	Cnum int foreign key references Customers(Cnum),
	SNum int foreign key references SalesPeople(SNum)
);

insert into orders(Onum,amt,Odate,Cnum,SNum)
values
	(3001 , 18.69 , '1990-10-3' ,2008 ,1007),
	(3003 , 767.19 , '1990-10-3' ,2001 ,1001),
	(3002 , 1900.10 , '1990-10-3' ,2007 ,1004),
	(3005 , 5160.45 , '1990-10-3' ,2003 ,1002),
	(3006 , 1098.16 , '1990-10-3' ,2008 ,1007),
	(3009 , 1713.23 , '1990-10-4' ,2002 ,1003),
	(3007 , 75.75 , '1990-10-4' ,2004 ,1002),
	(3008 , 4273.00 , '1990-10-5' ,2006 ,1001),
	(3010 , 1309.95 , '1990-10-6' ,2004 ,1002),
	(3011 , 9891.88 , '1990-10-6' ,2006 ,1001);


--display all the salesperson whose all order worth is more than rs.2000--
select SName from SalesPeople S
join orders O
on s.SNum = O.SNum
group by S.SNum, S.SName
having max(O.amt) > 2000 ;


--count the number of salesperson belonging to newyork--
select count(*) as num_of_salesperson from SalesPeople
where city = 'Newyork';


--display the number of salespeople belonging to london and belonging to paris--
select COUNT(*) as num_salesperson from SalesPeople
where city in ('london' , 'paris' )
group by city;


--display the number of orders taken by each salesperson and their date of orders--
select SName, count(*) as num_of_orders from SalesPeople S
left join orders O on s.SNum = O.SNum
group by S.SName, O.Odate
order by O.odate, s.sname ;