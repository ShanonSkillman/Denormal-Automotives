DROP DATABASE IF EXISTS normal_cars;
DROP USER IF EXISTS normal_user;
CREATE USER normal_user;
CREATE DATABASE normal_cars WITH OWNER normal_user;
DROP TABLE IF EXISTS make;
DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS yearTable;

\i scripts/denormal_data.sql;
\c normal_cars; 

CREATE TABLE make (
    ID SERIAL PRIMARY KEY,
    make_code VARCHAR(25) NOT NULL,
    make_title VARCHAR(25) NOT NULL
);

INSERT INTO make (make_code, make_title)
    SELECT DISTINCT make_code, make_title
    FROM car_models
    ORDER BY make_code;

 -- SELECT * FROM make;
    -- makes a table model with model_code and model_title from car_models and makes alphabetically organized

CREATE TABLE model (
    ID SERIAL PRIMARY KEY,
    model_code VARCHAR(125) NOT NULL,
    model_title VARCHAR(125) NOT NULL
);

INSERT INTO model (model_code, model_title)
    SELECT DISTINCT model_code, model_title
    FROM car_models
    ORDER BY model_code;

CREATE TABLE yearTable (
    ID SERIAL PRIMARY KEY,
    year INTEGER NOT NULL
);

INSERT INTO yearTable (year)
    SELECT DISTINCT year
    FROM car_models
    ORDER BY year;


SELECT DISTINCT make_code, model_title
    FROM car_models
    WHERE make_code = 'VOLKS';

SELECT DISTINCT make_code, model_code, model_title, year
    FROM car_models
    WHERE make_code = 'LAM';

SELECT DISTINCT COUNT(*) 
    FROM car_models
    WHERE year
    BETWEEN 2010 AND 2015;

-- -- \i scripts/denormal_data.sql;