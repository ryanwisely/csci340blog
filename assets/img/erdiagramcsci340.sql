-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-10-04 04:03:33.943

-- tables
-- Table: customers
CREATE TABLE customers (
    name varchar(30) NOT NULL,
    bidnum integer NOT NULL,
    numid_ofcustomers integer NOT NULL,
    user_numid_ofuser integer NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY (bidnum,numid_ofcustomers,user_numid_ofuser),
    CONSTRAINT customers_user FOREIGN KEY (user_numid_ofuser)
    REFERENCES user (numid_ofuser)
);

-- Table: items
CREATE TABLE items (
    name varchar(30) NOT NULL,
    opening_price float NOT NULL,
    description varchar(30) NOT NULL,
    ending_time integer NOT NULL,
    numid_ofitems integer NOT NULL,
    CONSTRAINT items_pk PRIMARY KEY (ending_time,numid_ofitems)
);

-- Table: sell
CREATE TABLE sell (
    sellers_finalbidnumwtax float NOT NULL,
    sellers_numid_ofsellers integer NOT NULL,
    items_ending_time integer NOT NULL,
    items_numid_ofitems integer NOT NULL,
    CONSTRAINT sell_pk PRIMARY KEY (sellers_finalbidnumwtax,sellers_numid_ofsellers),
    CONSTRAINT sell_sellers FOREIGN KEY (sellers_finalbidnumwtax,sellers_numid_ofsellers)
    REFERENCES sellers (finalbidnumwtax,numid_ofsellers),
    CONSTRAINT sell_items FOREIGN KEY (items_ending_time,items_numid_ofitems)
    REFERENCES items (ending_time,numid_ofitems)
);

-- Table: sellers
CREATE TABLE sellers (
    name varchar(30) NOT NULL,
    finalbidnumwtax float NOT NULL,
    numid_ofsellers integer NOT NULL,
    CONSTRAINT sellers_pk PRIMARY KEY (finalbidnumwtax,numid_ofsellers)
);

-- Table: submits
CREATE TABLE submits (
    sellers_finalbidnumwtax float NOT NULL,
    sellers_numid_ofsellers integer NOT NULL,
    date datetime NOT NULL,
    customers_bidnum integer NOT NULL,
    customers_numid_ofcustomers integer NOT NULL,
    customers_user_numid_ofuser integer NOT NULL,
    CONSTRAINT submits_pk PRIMARY KEY (sellers_finalbidnumwtax,sellers_numid_ofsellers,date,customers_bidnum,customers_numid_ofcustomers,customers_user_numid_ofuser),
    CONSTRAINT submits_ak_1 UNIQUE (sellers_finalbidnumwtax),
    CONSTRAINT submits_sellers FOREIGN KEY (sellers_finalbidnumwtax,sellers_numid_ofsellers)
    REFERENCES sellers (finalbidnumwtax,numid_ofsellers),
    CONSTRAINT submits_customers FOREIGN KEY (customers_bidnum,customers_numid_ofcustomers,customers_user_numid_ofuser)
    REFERENCES customers (bidnum,numid_ofcustomers,user_numid_ofuser)
);

-- Table: user
CREATE TABLE user (
    numid_ofuser integer NOT NULL CONSTRAINT user_pk PRIMARY KEY
);

-- End of file.

