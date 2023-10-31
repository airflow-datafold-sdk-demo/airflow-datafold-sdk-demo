CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            nut INT,
            average_leap_distance NUMERIC,
            PRIMARY KEY (id)
        ); 

TRUNCATE table DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }};

INSERT INTO DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }} (nut, average_leap_distance)
SELECT nut, AVG(leap_distance) FROM DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.TOP_SQUIRRELS
ORDER BY id DESC
LIMIT 8;