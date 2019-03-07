CREATE USER denormal_user;
CREATE DATABASE denormal_cars;
OWNER denormal_user;
\i scripts/denormal_data.sql;

SELECT DISTINCT make_title from car_models;
SELECT DISTINCT model_title from car_models WHERE make_code='VOLKS';
SELECT DISTINCT make_code='LAM';
SELECT COUNT (*) FROM car_models WHERE YEAR >= 2010 AND YEAR <=2015;