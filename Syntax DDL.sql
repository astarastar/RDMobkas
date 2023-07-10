CREATE TABLE cities(
	city_id integer PRIMARY KEY,
	city_name varchar(255) NOT NULL UNIQUE,
	coordinate POINT
);

CREATE TABLE cars(
	product_id SERIAL PRIMARY KEY,
	brand varchar(255) NOT NULL,
	model varchar(255) NOT NULL,
	body_type varchar(20) NOT NULL,
	car_type varchar(10) NOT NULL,
	year varchar(4) NOT NULL,
	price int NOT NULL
);

CREATE TABLE sellers(
	seller_id SERIAL PRIMARY KEY,
	seller_name varchar(255) NOT NULL,
	email varchar(255) NOT NULL UNIQUE,
	phone_number varchar(20) NOT NULL,
	city_id int NOT NULL,
	CONSTRAINT fk_seller_city
		FOREIGN KEY(city_id)
		REFERENCES cities(city_id)
);

CREATE TABLE buyers(
	buyer_id SERIAL PRIMARY KEY,
	buyer_name varchar(255) NOT NULL,
	email varchar(255) NOT NULL UNIQUE,
	phone_number varchar(20) NOT NULL,
	city_id int NOT NULL,
	CONSTRAINT fk_buyer_city
		FOREIGN KEY(city_id)
		REFERENCES cities(city_id)
);

CREATE TABLE ads(
	ads_id SERIAL PRIMARY KEY,
	seller_id int NOT NULL,
	product_id int NOT NULL,
	ads_title text NOT NULL,
	date_post timestamp NOT NULL,
	CONSTRAINT fk_ads_seller
		FOREIGN KEY(seller_id)
		REFERENCES sellers(seller_id),
	CONSTRAINT fk_ads_product
		FOREIGN KEY(product_id)
		REFERENCES cars(product_id)
);

CREATE TABLE bids(
	bid_id SERIAL PRIMARY KEY,
	ads_id int NOT NULL,
	buyer_id int NOT NULL,
	bid_price int NOT NULL CHECK(bid_price > 0),
	bid_status varchar(20) NOT NULL,
	date_bid timestamp NOT NULL,
	CONSTRAINT fk_bid_ads
		FOREIGN KEY(ads_id)
		REFERENCES ads(ads_id),
	CONSTRAINT fk_bid_buyer
		FOREIGN KEY(buyer_id)
		REFERENCES buyers(buyer_id)
);
