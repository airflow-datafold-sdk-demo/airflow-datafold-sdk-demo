CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            id INT, 
        ); 

TRUNCATE table DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }};

SELECT id FROM DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.SQUIRRELS
ORDER BY id DESC
LIMIT 5;