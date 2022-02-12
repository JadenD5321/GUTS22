create table manager (
    managerID integer not null auto_increment,
    email varchar(200) not null,
    forename varchar(50) not null,
    verificationCode varchar(50) default NULL,
    password varchar(64) not null,
    primary key (managerID)
)

create table staff (
    staffID integer not null auto_increment,
    email varchar(200) not null,
    name varchar(100) not null,
    password varchar(64) not null,
    city varchar(64) not null,
    country varchar(2) not null,
    verificationCode varchar(50) default NULL,
    manager integer,
    foreign key manager references manager(managerID),
    primary key (staffID)
)