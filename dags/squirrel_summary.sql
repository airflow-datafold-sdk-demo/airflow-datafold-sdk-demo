CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            favorite_nut VARCHAR(25),
            average_leap_distance NUMERIC,
            PRIMARY KEY (favorite_nut)
        ); 

-- TRUNCATE table DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }};

INSERT INTO DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }} (favorite_nut, average_leap_distance)
SELECT 
    favorite_nut, 
    AVG(leap_distance) as average_leap_distance 
FROM DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.TOP_SQUIRRELS
GROUP BY favorite_nut;