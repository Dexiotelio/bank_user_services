-- gender enum
create type gender as enum ('male', 'female', 'other');

--client table
create table client {
    id bigint primary key generated always as identity,
    firstname varchar(200) not null,
    lastname varchar(200) not null,
    email text unique not null,
    phone text[],
    age int check(age >= 18) not null,
    gender gender,
    password text not null,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
}
-- index client
create index idx_firstname on client using btree (firstname);
create index idx_lastname on client using btree (lastname);
create index idx_age in client (age);
create index idx_created_at on client using brin (created_at);

-- accounts enum
create type type as enums (
    'checking account',
    'saving account',
    'certificate of deposit',
    'investment account',
    'credit account',
    'business account',
    'payroll account',
    'retirement account',
    'foreign currency account'
);

-- table accounts
create table accounts {
    id bigint primary key generated always as identity,
    client_id bigint references client (id),
    type type
    balance numeric(15, 2) check(balance >= 0),
    currency char(3) references currencies (code),
    created_at timestamp with time zone default now(),
    update_at timestamp with time zone default now(),
};
