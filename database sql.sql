create table manager (
    managerID integer not null auto_increment,
    email varchar(200) not null unique,
    forename varchar(50) not null,
    verificationCode varchar(50) default NULL,
    password varchar(64) not null,
    primary key (managerID)
);

create table staff (
    staffID integer not null auto_increment,
    email varchar(200) not null,
    name varchar(100) not null,
    password varchar(64) not null,
    city varchar(64) not null,
    country ENUM('AL','DZ','AD','AO','AG','AR','AM','AU','AT','AZ','BS','BH','BD','BB','BE','BZ','BM','BO','BA','BR','BG','CA','KY','CL','CN','CO','CR','HR','CY','CZ','DK','DO','EC','EG','SV','EE','ET','FI','FR','GE','DE','GH','GI','GR','GD','GT','GY','HN','HK','HU','IS','IN','ID','IR','IE','IL','IT','JM','JP','JO','KZ','KE','XK','KW','KG','LV','LB','LR','LY','LI','LT','LU','MY','MV','MT','MU','MX','MC','ME','MA','MZ','NA','AN','NL','NZ','NI','NG','NO','OM','PK','PA','PY','PE','PH','PL','PT','PR','QA','RO','RU','SA','RS','SC','SL','SG','SK','SI','ZA','KR','ES','LK','KN','LC','SD','SR','SE','CH','SY','TW','TZ','TH','TT','TN','TR','TC','UG','UA','AE','GB','US','UY','VA','VE','VN','ZM','ZW') not null default 'GB',
    verificationCode varchar(50) default NULL,
    manager integer,
    foreign key (manager) references manager(managerID),
    unique(managerID, email),
    primary key (staffID)
)