create table user (
     id int,
     id varchar(20),
     password varchar(500),
     username varchar(20),
     accountNonExpired boolean,
     accountNonLocked boolean,
     credentialsNonExpired boolean,
     enabled boolean
);

create table authority (
    user_id  varchar(20),
    authority_name varchar(20)
);
