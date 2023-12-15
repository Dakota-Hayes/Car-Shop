create table CARS (
	CAR_ID SERIAL primary key,
	MAKE VARCHAR(100),
	MODEL VARCHAR(100),
	YEAR_ INT,
	COLOR VARCHAR(100),
	MILES INT
);

insert into CARS(CAR_ID,MAKE,MODEL,YEAR_,COLOR,MILES) values (0,'MAKE_0','MODEL_0','0000','COLOR_0','000');
insert into CARS(CAR_ID,MAKE,MODEL,YEAR_,COLOR,MILES) values (1,'MAKE_1','MODEL_1','1111','COLOR_1','111');
insert into CARS(CAR_ID,MAKE,MODEL,YEAR_,COLOR,MILES) values (2,'MAKE_2','MODEL_2','2222','COLOR_2','222');
insert into CARS(CAR_ID,MAKE,MODEL,YEAR_,COLOR,MILES) values (3,'MAKE_3','MODEL_3','3333','COLOR_3','333');
insert into CARS(CAR_ID,MAKE,MODEL,YEAR_,COLOR,MILES) values (4,'MAKE_4','MODEL_4','4444','COLOR_4','444');

create table USED_CARS (
	USED_CAR_ID SERIAL primary key,
	CAR_ID INT,
	foreign key (CAR_ID) references CARS(CAR_ID)
);

insert into USED_CARS (USED_CAR_ID,CAR_ID) values (0,0);
insert into USED_CARS (USED_CAR_ID,CAR_ID) values (1,1);
insert into USED_CARS (USED_CAR_ID,CAR_ID) values (2,2);
insert into USED_CARS (USED_CAR_ID,CAR_ID) values (3,3);
insert into USED_CARS (USED_CAR_ID,CAR_ID) values (4,4);

create table NEW_CARS (
	NEW_CAR_ID SERIAL primary key,
	CAR_ID INT,
	foreign key (CAR_ID) references CARS(CAR_ID)
);

insert into NEW_CARS (NEW_CAR_ID,CAR_ID) values (0,0);
insert into NEW_CARS (NEW_CAR_ID,CAR_ID) values (1,1);
insert into NEW_CARS (NEW_CAR_ID,CAR_ID) values (2,2);
insert into NEW_CARS (NEW_CAR_ID,CAR_ID) values (3,3);
insert into NEW_CARS (NEW_CAR_ID,CAR_ID) values (4,4);

create table INVENTORY (
	ITEM_ID SERIAL primary key,
	USED_CAR_ID INT,
	NEW_CAR_ID INT,
	foreign key (USED_CAR_ID) references USED_CARS(USED_CAR_ID),
	foreign key (NEW_CAR_ID) references NEW_CARS(NEW_CAR_ID)
);

insert into INVENTORY (ITEM_ID,USED_CAR_ID,NEW_CAR_ID) values (0,0,0);
insert into INVENTORY (ITEM_ID,USED_CAR_ID,NEW_CAR_ID) values (1,1,1);
insert into INVENTORY (ITEM_ID,USED_CAR_ID,NEW_CAR_ID) values (2,2,2);
insert into INVENTORY (ITEM_ID,USED_CAR_ID,NEW_CAR_ID) values (3,3,3);
insert into INVENTORY (ITEM_ID,USED_CAR_ID,NEW_CAR_ID) values (4,4,4);

create table SALESPERSONS (
	SALESPERSON_ID SERIAL primary key,
	NAME_ VARCHAR(100)
);

insert into SALESPERSONS (SALESPERSON_ID,NAME_) values (0,'NAME_0');
insert into SALESPERSONS (SALESPERSON_ID,NAME_) values (1,'NAME_1');
insert into SALESPERSONS (SALESPERSON_ID,NAME_) values (2,'NAME_2');
insert into SALESPERSONS (SALESPERSON_ID,NAME_) values (3,'NAME_3');
insert into SALESPERSONS (SALESPERSON_ID,NAME_) values (4,'NAME_4');

create table CUSTOMERS (
	CUSTOMER_ID SERIAL primary key,
	NAME_ VARCHAR(100)
);

insert into CUSTOMERS (CUSTOMER_ID,NAME_) values (0,'NAME_0');
insert into CUSTOMERS (CUSTOMER_ID,NAME_) values (1,'NAME_1');
insert into CUSTOMERS (CUSTOMER_ID,NAME_) values (2,'NAME_2');
insert into CUSTOMERS (CUSTOMER_ID,NAME_) values (3,'NAME_3');
insert into CUSTOMERS (CUSTOMER_ID,NAME_) values (4,'NAME_4');

create table PAYMENTS (
	PAYMENT_ID SERIAL primary key,
	AMOUNT NUMERIC(10,2),
	CUSTOMER_ID INT,
	foreign key (CUSTOMER_ID) references CUSTOMERS(CUSTOMER_ID)
);

insert into PAYMENTS (PAYMENT_ID,AMOUNT,CUSTOMER_ID) values (0,00.00,0);
insert into PAYMENTS (PAYMENT_ID,AMOUNT,CUSTOMER_ID) values (1,11.11,1);
insert into PAYMENTS (PAYMENT_ID,AMOUNT,CUSTOMER_ID) values (2,22.22,2);
insert into PAYMENTS (PAYMENT_ID,AMOUNT,CUSTOMER_ID) values (3,33.33,3);
insert into PAYMENTS (PAYMENT_ID,AMOUNT,CUSTOMER_ID) values (4,44.44,4);

create table INVOICES (
	INVOICE_ID SERIAL primary key,
	CUSTOMER_ID INT,
	SALESPERSON_ID INT,
	ITEM_ID INT,
	PAYMENT_ID INT,
	DATE_ DATE,
	foreign key (CUSTOMER_ID) references CUSTOMERS(CUSTOMER_ID),
	foreign key (SALESPERSON_ID) references SALESPERSONS(SALESPERSON_ID),
	foreign key (ITEM_ID) references INVENTORY(ITEM_ID),
	foreign key (PAYMENT_ID) references PAYMENTS(PAYMENT_ID)
);

insert into INVOICES (INVOICE_ID,CUSTOMER_ID,SALESPERSON_ID,ITEM_ID,PAYMENT_ID,DATE_) values (0,0,0,0,0,NOW());
insert into INVOICES (INVOICE_ID,CUSTOMER_ID,SALESPERSON_ID,ITEM_ID,PAYMENT_ID,DATE_) values (1,1,1,1,1,NOW());
insert into INVOICES (INVOICE_ID,CUSTOMER_ID,SALESPERSON_ID,ITEM_ID,PAYMENT_ID,DATE_) values (2,2,2,2,2,NOW());
insert into INVOICES (INVOICE_ID,CUSTOMER_ID,SALESPERSON_ID,ITEM_ID,PAYMENT_ID,DATE_) values (3,3,3,3,3,NOW());
insert into INVOICES (INVOICE_ID,CUSTOMER_ID,SALESPERSON_ID,ITEM_ID,PAYMENT_ID,DATE_) values (4,4,4,4,4,NOW());

create table MECHANICS (
	MECHANIC_ID SERIAL primary key,
	NAME_ VARCHAR(100)
);

insert into MECHANICS (MECHANIC_ID,NAME_) values (0,'NAME_0');
insert into MECHANICS (MECHANIC_ID,NAME_) values (1,'NAME_1');
insert into MECHANICS (MECHANIC_ID,NAME_) values (2,'NAME_2');
insert into MECHANICS (MECHANIC_ID,NAME_) values (3,'NAME_3');
insert into MECHANICS (MECHANIC_ID,NAME_) values (4,'NAME_4');

create table SERVICES (
	SERVICE_ID SERIAL primary key,
	PRICE NUMERIC(10,2),
	CAR_ID INT,
	foreign key (CAR_ID) references CARS(CAR_ID)
);

insert into SERVICES (SERVICE_ID,PRICE,CAR_ID) values (0,00.00,0);
insert into SERVICES (SERVICE_ID,PRICE,CAR_ID) values (1,11.11,1);
insert into SERVICES (SERVICE_ID,PRICE,CAR_ID) values (2,22.22,2);
insert into SERVICES (SERVICE_ID,PRICE,CAR_ID) values (3,33.33,3);
insert into SERVICES (SERVICE_ID,PRICE,CAR_ID) values (4,44.44,4);

create table PARTS (
	PART_ID SERIAL primary key,
	PRICE NUMERIC(10,2),
	CAR_ID INT,
	foreign key (CAR_ID) references CARS(CAR_ID)
);

create or replace function ADD_PART(PART_ID_,PRICE_,CAR_ID_)
returns void
as $MAIN$
begin
	insert into PARTS (PART_ID,PRICE,CAR_ID) values (PART_ID_,PRICE_,CAR_ID_);
end;
$MAIN$
language plpgsql;

select ADD_PART(0,00.00,0);

insert into PARTS (PART_ID,PRICE,CAR_ID) values (1,11.11,1);
insert into PARTS (PART_ID,PRICE,CAR_ID) values (2,22.22,2);
insert into PARTS (PART_ID,PRICE,CAR_ID) values (3,33.33,3);
insert into PARTS (PART_ID,PRICE,CAR_ID) values (4,44.44,4);

create table SERVICE_TICKETS (
	SERVICE_TICKET_ID SERIAL primary key,
	DATE_ DATE,
	MECHANIC_ID INT,
	CUSTOMER_ID INT,
	PART_ID INT,
	SERVICE_ID INT,
	PAYMENT_ID INT,
	CAR_ID INT,
	foreign key (MECHANIC_ID) references MECHANICS(MECHANIC_ID),
	foreign key (CUSTOMER_ID) references CUSTOMERS(CUSTOMER_ID),
	foreign key (PART_ID) references PARTS(PART_ID),
	foreign key (SERVICE_ID) references SERVICES(SERVICE_ID),
	foreign key (PAYMENT_ID) references PAYMENTS(PAYMENT_ID),
	foreign key (CAR_ID) references CARS(CAR_ID)
);

create or replace function ADD_SERVICE_TICKET(SERVICE_TICKET_ID_,DATE__,MECHANIC_ID_,CUSTOMER_ID_,PART_ID_,SERVICE_ID_,PAYMENT_ID_,CAR_ID_)
returns void
as $MAIN$
begin
	insert into SERVICE_TICKETS (SERVICE_TICKET_ID,DATE_,MECHANIC_ID,CUSTOMER_ID,PART_ID,SERVICE_ID,PAYMENT_ID,CAR_ID) values (SERVICE_TICKET_ID_,DATE__,MECHANIC_ID_,CUSTOMER_ID_,PART_ID_,SERVICE_ID_,PAYMENT_ID_,CAR_ID_);
end;
$MAIN$
language plpgsql;

select ADD_SERVICE_TICKET(0,NOW(),0,0,0,0,0,0);


insert into SERVICE_TICKETS (SERVICE_TICKET_ID,DATE_,MECHANIC_ID,CUSTOMER_ID,PART_ID,SERVICE_ID,PAYMENT_ID,CAR_ID) values (1,NOW(),1,1,1,1,1,1);
insert into SERVICE_TICKETS (SERVICE_TICKET_ID,DATE_,MECHANIC_ID,CUSTOMER_ID,PART_ID,SERVICE_ID,PAYMENT_ID,CAR_ID) values (2,NOW(),2,2,2,2,2,2);
insert into SERVICE_TICKETS (SERVICE_TICKET_ID,DATE_,MECHANIC_ID,CUSTOMER_ID,PART_ID,SERVICE_ID,PAYMENT_ID,CAR_ID) values (3,NOW(),3,3,3,3,3,3);
insert into SERVICE_TICKETS (SERVICE_TICKET_ID,DATE_,MECHANIC_ID,CUSTOMER_ID,PART_ID,SERVICE_ID,PAYMENT_ID,CAR_ID) values (4,NOW(),4,4,4,4,4,4);