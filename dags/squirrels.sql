CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            id INT, 
            name VARCHAR(25),
            species VARCHAR(25),
            weight INT,
            length FLOAT,
            favorite_nut VARCHAR(25),
            leap_distance NUMERIC,
            hobby VARCHAR(25),
            PRIMARY KEY (id) 
        );

TRUNCATE table DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }};

INSERT INTO DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
(id, name, species, weight, length, favorite_nut, leap_distance, hobby)
VALUES
(1, 'Charlie', 'Eastern Gray Squirrel', 300, 10.5, 'Acorn', 2.5, 'Tree Climbing'),
(2, 'Samantha', 'Fox Squirrel', 400, 12.2, 'Pecan', 3.0, 'Burrowing'),
(3, 'Rusty', 'Red Squirrel', 250, 9.8, 'Pine Nut', 2.2, 'Nut Hoarding'),
(4, 'Sandy', 'Ground Squirrel', 350, 11.0, 'Hazelnut', 2.8, 'Digging Tunnels'),
(5, 'Glider', 'Flying Squirrel', 150, 8.5, 'Walnut', 4.2, 'Glider'),
(6, 'Snowy', 'Arctic Ground Squirrel', 450, 14.7, 'Almond', 3.5, 'Hibernating'),
(7, 'Basker', 'Marmot', 600, 18.0, 'Sunflower Seed', 6.0, 'Basking'),
(8, 'Cheeks', 'Chipmunk', 200, 7.5, 'Cashew', 1.8, 'Cheek Pouches'),
(9, 'Digger', 'Prairie Dog', 350, 12.0, 'Pistachio', 2.9, 'Social Burrows'),
(10, 'Rocky', 'Rock Squirrel', 300, 10.8, 'Macadamia', 2.7, 'Rock Climbing');
