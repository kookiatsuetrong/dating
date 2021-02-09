create database dating default charset 'utf8';
create user john identified with mysql_native_password by 'walker';
grant all on dating.* to john;

use dating;

create table type(
  code  int unique not null auto_increment,
  name  varchar(200) not null
);
alter table type add primary key (code);

insert into type(name) values('ไม่ระบุ');
insert into type(name) values('ราชการ');
insert into type(name) values('รัฐวิสาหกิจ');
insert into type(name) values('ธนาคาร');
insert into type(name) values('โรงพยาบาล');

create table member(
    code        int unique not null auto_increment,
    email       varchar(200) unique not null,
    password    varchar(200) not null,
    first_name  varchar(200) not null,
    last_name   varchar(200) not null,
    dob         date,
    salary      float,
    type        int default 1,
    photo       varchar(200)
);
alter table member add primary key (code);
alter table member add foreign key (type) references type(code);

insert into member(email,first_name,last_name,password,photo,salary) 
  values('alice@email.com', 'Alice', 'Family', sha2('alice123',512),
            'member-aaaa.png', 40000); 

insert into member(email,first_name,last_name,password,photo,salary) 
  values('bob@email.com', 'Bob', 'Family', sha2('bob123',512),
            'member-bbbb.png', 50000); 

insert into member(email,first_name,last_name,password,photo,salary) 
  values('claire@email.com', 'Claire', 'Family', sha2('claire123',512),
            'member-cccc.png', 60000); 

insert into member(email,first_name,last_name,password,photo,salary) 
  values('dan@email.com', 'Dan', 'Family', sha2('dan123',512),
            'member-dddd.png', 70000); 

create table follow(
  source int,
  target int
);
alter table follow add foreign key(source) references member(code);
alter table follow add foreign key(source) references member(code);

