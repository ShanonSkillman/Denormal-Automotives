DROP USER IF EXISTS normal_user;
DROP DATABASE IF EXISTS normal_cars;
DROP TABLE IF EXISTS make;
DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS year_TABLE;
CREATE USER normal_user;
CREATE DATABASE normal_cars WITH OWNER normal_user;

\i scripts/denormal_data.sql;

CREATE TABLE make (
    ID SERIAL NOT NULL PRIMARY KEY,
    make_code character varying(125) NOT NULL,
    make_title character varying(125) NOT NULL
);

INSERT INTO make(make_code, make_title)
    SELECT DISTINCT make_code, make_title
        FROM car_models
        ORDER BY make_code;

CREATE TABLE model (
    ID SERIAL NOT NULL PRIMARY KEY,
    model_code character varying(125) NOT NULL;
    model_title character varying(125) NOT NULL
);

INSERT INTO model(model_code, model_title)
    SELECT DISTINCT model_code, model_title
    FROM car_models
    ORDER BY model_code;

CREATE TABLE year_TABLE(
    ID SERIAL NOT NULL PRIMARY KEY,
    year INTEGER NOT NULL
);

INSERT INTO year_TABLE(year)
    SELECT DISTINCT year
    FROM car_models
    ORDER BY year;

SELECT COUNT(*) FROM car_models
WHERE year
BETWEEN 2010 AND 2015;