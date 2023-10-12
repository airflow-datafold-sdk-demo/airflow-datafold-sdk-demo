CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            id INT, 
            ruth INT,
            month VARCHAR(25),
            day VARCHAR(25), 
            ffmc FLOAT,
            dmc FLOAT,
            dc FLOAT,
            isi FLOAT,
            temp FLOAT,
            rh FLOAT,
            wind FLOAT,
            rain FLOAT,
            area FLOAT,
            PRIMARY KEY (id)
        );