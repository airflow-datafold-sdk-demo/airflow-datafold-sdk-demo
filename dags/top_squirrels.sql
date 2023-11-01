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

-- TRUNCATE table DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }};

INSERT INTO DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }} (id, name, species, weight, length, favorite_nut, leap_distance, hobby)
SELECT 
    id,
    name, 
    species, 
    weight, 
    length, 
    favorite_nut, 
    case when favorite_nut = 'Macadamia' then leap_distance + 0.15 else leap_distance end as leap_distance,
    hobby
FROM DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.SQUIRRELS
ORDER BY weight DESC
LIMIT 8;