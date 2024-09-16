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

-- index accounts
create index idx_type on accounts using btree (type);
create index idx_balance on accounts using btree (balance);
create index idx_created_at on accounts using brin (created_at);

-- table currencies
create table currencies {
    id bigint primary key generated always as identity,
    code char(3) unique not null,
    name varchar(150) not null
    symbol varchar(150),
    exchange_rate numeric(15, 6) default 1.0
    decimal_places int not null,
    active boolean default true,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
};

-- index currencies
create index idx_name on currencies on using btree (name);
create index idx_symbol on currencies on using btree (symbol);
create index idx_exchange_rate on currencies on using btree (active, exchange_rate);
create index idx_active on currencies using btree (active);