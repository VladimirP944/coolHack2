ALTER TABLE IF EXISTS ONLY services DROP CONSTRAINT IF EXISTS fk_user_id CASCADE;
ALTER TABLE IF EXISTS ONLY locations DROP CONSTRAINT IF EXISTS fk_user_id CASCADE;

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    id serial NOT NULL,
    username VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    photo_id VARCHAR,
    name VARCHAR ,
    extra_persons INTEGER DEFAULT 0,
    phone_number INTEGER,
    type VARCHAR,
    identity_card VARCHAR,
    applied_for_home boolean DEFAULT false,
    home_id INTEGER,
    PRIMARY KEY (id)
);


CREATE TABLE locations (
   id serial NOT NULL,
   name VARCHAR,
   description VARCHAR,
   user_id INTEGER NOT NULL,
   address VARCHAR NOT NULL,
   available_space INTEGER NOT NULL,
   total_space INTEGER NOT NULL,
   photo VARCHAR,
   start_date DATE DEFAULT NOW() NOT NULL,
   end_date DATE,
   PRIMARY KEY (id)
);


CREATE TABLE services (
  id serial NOT NULL,
  user_id INTEGER NOT NULL,
  applicant_id INTEGER,
  education boolean,
  pets boolean,
  medical_assistance boolean,
  disability_access boolean,
  creator boolean,
  PRIMARY KEY (id)
);


ALTER TABLE ONLY services
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE ONLY locations
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id);
