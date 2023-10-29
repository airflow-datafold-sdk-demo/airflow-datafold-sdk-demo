CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            id INT, 
            name VARCHAR(25),
            mon VARCHAR(25), 
            date VARCHAR(25),
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

TRUNCATE table DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }};

INSERT INTO DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
(id, name, mon, date, ffmc, dmc, dc, isi, temp, rh, wind, rain, area)
VALUES
(1, 'Cedar Fire', 'Jan', '2023-10-01', 70.5, 100.2, 200.1, 10.3, 25.5, 40.0, 12.3, 0.1, 5.7),
(2, 'Black Forest Fire', 'Feb', '2023-10-02', 65.2, 95.0, 210.3, 9.8, 26.2, 38.5, 11.7, 0.0, 7.2),
(3, 'Rim Fire', 'Mar', '2023-10-03', 72.1, 110.4, 220.5, 11.1, 24.7, 42.8, 14.5, 0.2, 3.8),
(4, 'Thomas Fire', 'Apr', '2023-10-04', 68.7, 105.8, 230.0, 10.6, 27.8, 36.3, 13.0, 0.3, 6.1),
(5, 'Camp Fire', 'May', '2023-10-05', 75.3, 120.1, 240.2, 12.9, 23.0, 44.6, 15.2, 0.0, 4.5),
(6, 'Carr Fire', 'Jun', '2023-10-06', 63.4, 98.7, 250.7, 9.2, 29.4, 34.2, 12.8, 0.4, 8.3),
(7, 'Woolsey Fire', 'Jul', '2023-10-07', 67.8, 103.3, 260.9, 10.0, 28.1, 37.7, 11.4, 0.0, 2.9),
(8, 'Hayman Fire', 'Aug', '2023-10-08', 71.2, 108.9, 270.4, 11.5, 26.6, 41.2, 14.0, 0.1, 5.2),
(9, 'Saddle Fire', 'Sep', '2023-10-09', 76.6, 125.5, 280.6, 13.2, 22.3, 46.8, 16.6, 0.2, 7.6),
(10, 'Station Fire', 'Oct', '2023-10-10', 69.4, 102.0, 290.8, 10.8, 30.0, 33.1, 12.1, 0.0, 3.2);
