SELECT *
FROM customer;


INSERT INTO customer(
	first_name,
	last_name,
	email,
	address,
	city,
	state
) VALUES (
	'Ricky',
	'Bobby',
	'alwaysfirst@racing.com',
	'123 Fake St.',
	'Dallas',
	'Texas'
),(
	'Cal',
	'Naughton',
	'alwayssecond@racing.com',
	'456 Fake St.',
	'Dallas',
	'Texas'
);

INSERT INTO salesperson(
	first_name,
	last_name,
	employee_number
) VALUES (
	'Michael',
	'Jordan',
	'000023'
),(
	'Scottie',
	'Pippen',
	'000033'
);


INSERT INTO mechanic(
	first_name,
	last_name,
	employee_number
) VALUES (
	'John',
	'Smith'
),(
	'Jane',
	'Doe'
);



CREATE OR REPLACE PROCEDURE add_new_car(
	make VARCHAR(50), 
	model VARCHAR(50),
	year INTEGER,
	color VARCHAR(20),
	mileage INTEGER,
	salesperson_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO new_car(
	make, 
	model,
	year,
	color,
	mileage,
	salesperson_id
	)
	VALUES(
	make, 
	model,
	year,
	color,
	mileage,
	salesperson_id
	);
END;
$$;

CALL add_new_car('Audi', 'A8', 2016, 'Black', 120000, 1);
CALL add_new_car('Toyota', 'Camry', 2014, 'Silver', 100000, 2);

CREATE OR REPLACE PROCEDURE add_used_car(
	make VARCHAR(50), 
	model VARCHAR(50),
	year INTEGER,
	color VARCHAR(20),
	mileage INTEGER,
	customer_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO used_car(
	make, 
	model,
	year,
	color,
	mileage,
	customer_id
	)
	VALUES(
	make, 
	model,
	year,
	color,
	mileage,
	customer_id
	);
END;
$$;

CALL add_used_car('Tesla', 'Model 3', 2020, 'Black', 120000, 1);
CALL add_used_car('Honda', 'Accord', 2014, 'Silver', 120000, 2);

SELECT *
FROM salesperson;

DROP PROCEDURE IF EXISTS add_new_car;