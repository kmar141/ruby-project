DROP TABLE eateries;
DROP TABLE burgers;
DROP TABLE deals;

CREATE TABLE burgers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)

  )

CREATE TABLE eateries (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  burger_id REFERENCES burgers(id),
  deal_id REFERENCES deals(id)

)

CREATE TABLE deals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  day VARCHAR(255)

)