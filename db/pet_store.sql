DROP TABLE pets;
DROP TABLE pet_shops;

CREATE TABLE pet_shops (
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255) not null,
  stock_type VARCHAR(255) not null
);

CREATE TABLE pets (
  name VARCHAR(255),
  type VARCHAR(255)
);
