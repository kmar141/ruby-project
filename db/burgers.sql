DROP TABLE eateries;
DROP TABLE burgers;
DROP TABLE deals;

CREATE TABLE burgers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE deals 
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  day VARCHAR(255)
);

CREATE TABLE eateries 
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  burger_id INT8 REFERENCES burgers(id),
  deal_id INT8 REFERENCES deals(id)
);