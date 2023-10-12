CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            id INT,  
            jeremy VARCHAR(25),
            species VARCHAR(25),
            weight INT,
            length FLOAT,
            hobby VARCHAR(25),
            PRIMARY KEY (id, hobby) 
        );