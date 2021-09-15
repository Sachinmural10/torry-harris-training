select * from employee;
alter table employee add Mgr varchar(40) ;
alter table employee modify column Mgr varchar(50);
desc employee;
alter table employee drop column Mgr;
update employee set emp_name="Rohit" where emp_id=1;
insert into employee values(2,"Rishav",1234,"CSE","B'lore","Employee",25000);
insert into employee values(3,"Shabaz",1224,"ISE","B'lore","Employee",4000);
insert into employee values(4,"Sagar",1254,"ECE","B'lore","Employee",20000);
insert into employee values(5,"Shashank",1254,"CIV","B'lore","Employee",3400);

select * from employee order by emp_id desc;
select max(salary) from employee;
select max(salary) from employee where location="B'lore";

select count(emp_id),location from employee group by location;
select count(emp_name),location from employee group by location having count(emp_name)>1;

create table regions(region_id int unsigned not null primary key, region_name varchar(30));
desc regions;
insert into regions values(1,"Europe");
insert into regions values(2,"Mexico");
insert into regions values(3,"Australia");
insert into regions values(4,"America");
insert into regions values(5,"California");
select * from regions;

create table countries(country_id char not null primary key, country_name varchar(40), region_id int unsigned not null);
desc countries;
insert into countries values('I',"India",1);
insert into countries values('S',"Srilanka",2);
insert into countries values('Z',"Zimbabwe",3);
insert into countries values('G',"Greenland",4);
insert into countries values('N',"Netherland",5);
select * from countries;

create table locations(location_id int unsigned not null primary key, stree_address varchar(60), postal_code varchar(6), city varchar(10) not null, state_province varchar(10), country_id char not null);
desc locations;
insert into locations values(1200,"2015 shashank","560045","Hydrabad","AP",'I');
insert into locations values(1201,"2016 Vijay","560046","Chennai","Tamilnadu",'S');
insert into locations values(1202,"2017 Jay","560047","Bangalore","Karnataka",'Z');
insert into locations values(1203,"2018 Charan","560048","Bhopal","MP",'G');
insert into locations values(1204,"2019 Vishal","560049","Dispur","Assam",'N');
select * from locations;

create table departments(department_id int unsigned not null primary key,department_name varchar(30) not null, manager_id int unsigned, location_id int unsigned);
desc departments; 
alter table departments add unique key(manager_id);

insert into departments values(10,"Administrations",200,1700);
update departments set location_id=1200 where department_id=10;
insert into departments values(11,"Management",201,1701);
update departments set location_id=1201 where department_id=11;
insert into departments values(12,"Sports",202,1702);
update departments set location_id=1202 where department_id=12;
insert into departments values(14,"Library",204,1704);
update departments set location_id=1203 where department_id=13;
insert into departments values(15,"Cultural",203,1204);
delete from departments where department_id=14;
delete from departments where department_id=15;
insert into departments values(14,"Library",204,1204);




select * from departments;

create table jobs(job_id varchar(20) not null primary key, job_title varchar(20) not null, min_salary decimal unsigned, max_salary decimal unsigned);
desc jobs;
insert into jobs values("AD_VP","Administration VP",15000,20000);
insert into jobs values("MG_HD","Management head",16000,21000);
insert into jobs values("SP_HD","Sports HD",14000,18000);
insert into jobs values("LB_HD","Library HD",14000,18000);
select * from jobs;

create table employees1(employee_id int unsigned not null, first_name varchar(20), last_name varchar(20) not null, email varchar(20) not null, phone_number varchar(10), hire_date date not null, job_id varchar(20) not null, salary decimal not null, commission_pct decimal, manager_id int unsigned, department_id int unsigned);
desc employees1;
alter table employees1 add unique key(employee_id);

insert into employees1 values(100,"Steven","King","SKING","9846352845",str_to_date("17-jun-1987","%d-%M-%Y"),"AD_VP",20000,null,null,10);
insert into employees1 values(101,"Stefan","hawk","Stking","9846862845",str_to_date("27-jul-1985","%d-%M-%Y"),"MG_HD",25000,null,null,11);
insert into employees1 values(102,"James","Wan","JWAN","9846319845",str_to_date("13-aug-1887","%d-%M-%Y"),"SP_HD",21000,null,null,12);
insert into employees1 values(103,"Dolf","Ziggler","Dolzig","6346352845",str_to_date("08-feb-1915","%d-%M-%Y"),"LB_HD",23000,null,null,13);
select * from employees1;

create table job_history(employee_id int unsigned not null, start_date date not null, end_date date not null, job_id varchar(10) not null, department_id int unsigned not null);
drop table job_history;
alter table job_history add unique key(employee_id,start_date);
insert into job_history values(100, str_to_date("17-jun-1987","%d-%M-%Y"),str_to_date("17-jun-1988","%d-%M-%Y"),"AD_VP",10);
insert into job_history values(101, str_to_date("17-aug-1987","%d-%M-%Y"),str_to_date("17-aug-1988","%d-%M-%Y"),"AD_VP",11);
update job_history set job_id="MG_HD" where employee_id=101;
insert into job_history values(102, str_to_date("10-feb-1987","%d-%M-%Y"),str_to_date("10-feb-1988","%d-%M-%Y"),"SP_HD",12);
insert into job_history values(103, str_to_date("11-mar-1985","%d-%M-%Y"),str_to_date("10-feb-1988","%d-%M-%Y"),"LB_HD",13);
select * from job_history;
desc job_history;
commit;

alter table countries add foreign key (region_id) references regions(region_id);
desc countries;
alter table locations add foreign key (country_id) references countries(country_id);
desc locations;
alter table departments add foreign key (location_id) references locations(location_id);
desc departments;
alter table employees1 add foreign key (job_id) references jobs(job_id);
alter table employees1 add foreign key(department_id) references departments(department_id);
desc employees1;
alter table employees1 add foreign key(manager_id) references departments(manager_id);
desc employees1;
alter table job_history add foreign key(employee_id) references employees1(employee_id);
alter table job_history add foreign key(job_id) references jobs(job_id);
alter table job_history add foreign key(department_id) references departments(department_id);
desc job_history;
