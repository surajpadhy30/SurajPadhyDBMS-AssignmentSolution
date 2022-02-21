create schema TravelOntheGO;

-- Question 1
create table `PASSENGER`(
`Passenger_name` varchar(20), 
`Category` varchar(6),
`Gender` char,
`Boarding_City` varchar(15),
`Destination_City` varchar(15),
`Distance` int not null,
`Bus_Type` varchar(10) not null,
foreign key(`Bus_type`,`Distance`) REFERENCES `PRICE`(`Bus_type`,`Distance`));


create table `PRICE`(
 `Bus_Type` varchar(10) Not null,
 `Distance` int Not null,
 `Price` int not null,
 primary key(`Bus_type`,`Distance`));
 
 -- Question 2
insert into `PRICE` values("Sleeper",350,770);
insert into `PRICE` values("Sleeper",500,1100);
insert into `PRICE` values("Sleeper",600,1320);
insert into `PRICE` values("Sleeper",700,1540);
insert into `PRICE` values("Sleeper",1000,2200);
insert into `PRICE` values("Sleeper",1200,2640);
insert into `PRICE` values("Sleeper",1500,2700);
insert into `PRICE` values("Sitting",500,620);
insert into `PRICE` values("Sitting",600,744);
insert into `PRICE` values("Sitting",700,868);
insert into `PRICE` values("Sitting",1000,1240);
insert into `PRICE` values("Sitting",1200,1488);
insert into `PRICE` values("Sitting",1500,1860);

insert into `PASSENGER` values("Sejal","AC",'F',"Bengaluru","Chennai",350,"Sleeper");
insert into `PASSENGER` values("Anmol","Non-AC",'M',"Mumbai","Hyderabad",700,"Sitting");
insert into `PASSENGER` values("Pallavi","AC",'F',"Panaji","Bengaluru",600,"Sleeper");
insert into `PASSENGER` values("Khusboo","AC",'F',"Chennai","Mumbai",1500,"Sleeper");
insert into `PASSENGER` values("Udit","Non-AC",'M',"Trivandrum","panaji",1000,"Sleeper");
insert into `PASSENGER` values("Ankur","AC",'M',"Nagpur","Hyderabad",500,"Sitting");
insert into `PASSENGER` values("Hemant","Non-AC",'M',"panaji","Mumbai",700,"Sleeper");
insert into `PASSENGER` values("Manish","Non-AC",'M',"Hyderabad","Bengaluru",500,"Sitting");
insert into `PASSENGER` values("Piyush","AC",'M',"Pune","Nagpur",700,"Sitting");

 -- Question 3
select Gender,count(*) as Number_Of_Passengers from `PASSENGER` where Distance>=600 group by Gender;

-- Question 4
select min(price) as 'minimum ticket price' from `PRICE` where Bus_type="Sleeper";

-- Question 5
select Passenger_name from `PASSENGER` where Passenger_name like 'S%';

-- Question 6
select PA.Passenger_name, PA.Boarding_City, PA.Destination_City, PA.Bus_Type, PR.Price 
from `PASSENGER` as PA inner join `PRICE` as PR 
on PA.Bus_Type = PR.Bus_Type AND PA.Distance = PR.Distance;

-- Question 7

-- if exact 1000 distance traveled is asked then below query
select PA.Passenger_name,PR.Price 
from `PASSENGER` as PA inner join `PRICE` as PR 
on PA.Bus_Type = PR.Bus_Type AND PA.Distance = PR.Distance where PA.Distance=1000 AND PA.Bus_Type="Sitting" ;

-- Question 8
select Bus_Type, Price from `PRICE` 
where Distance=(Select Distance from `PASSENGER` where Passenger_name="Pallavi");

-- Question 9
Select distinct Distance from `PASSENGER` Order by Distance desc;


-- Question 10
select Passenger_name ,(Distance/(select sum(Distance) from `PASSENGER`))*100 as Percentage_Distance_Traveled
from `PASSENGER`;

-- Question 11
select Distance, Price,
Case 
	when Price>1000 then 'Expensive'
    when Price>500 then 'Average Cost'
    Else 'Cheaper'
End as Price_Package from Price;


