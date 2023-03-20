CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	address VARCHAR(100),
	city VARCHAR(50),
	state VARCHAR(50)
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	employee_number VARCHAR(50) NOT NULL
);

CREATE TABLE new_car(
	car_id SERIAL PRIMARY KEY, 
	make VARCHAR(50) NOT NULL, 
	model VARCHAR(50) NOT NULL,
	year INTEGER NOT NULL,
	color VARCHAR(20),
	mileage INTEGER,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);

CREATE TABLE used_car(
	serial_id SERIAL PRIMARY KEY, 
	make VARCHAR(50) NOT NULL, 
	model VARCHAR(50) NOT NULL,
	year INTEGER NOT NULL,
	color VARCHAR(20),
	mileage INTEGER,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY, 
	service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	customer_id INTEGER NOT NULL,
	serial_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(serial_id) REFERENCES used_car(serial_id)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL
);

CREATE TABLE service_department(
	service_department_id SERIAL PRIMARY KEY, 
	customer_id INTEGER NOT NULL,
	serial_id INTEGER NOT NULL,
	service_ticket_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(serial_id) REFERENCES used_car(serial_id),
	FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY, 
	invoice_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	customer_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(car_id) REFERENCES new_car(car_id),
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);




