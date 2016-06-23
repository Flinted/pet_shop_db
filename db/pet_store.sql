DROP TABLE pets;
DROP TABLE pet_shops;

CREATE TABLE pet_shops (
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255) not null,
  stock_type VARCHAR(255) not null
);

CREATE TABLE pets (
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255) not null,
  store_id INT4 references pet_shops(id)
);
