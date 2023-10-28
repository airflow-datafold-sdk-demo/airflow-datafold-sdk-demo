CREATE OR REPLACE TRANSIENT TABLE DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
        (
            id INT,  
            name VARCHAR(25),
            species VARCHAR(25),
            weight INT,
            length FLOAT,
            hobby VARCHAR(25),
            PRIMARY KEY (id, hobby) 
        );

TRUNCATE table DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }};

INSERT INTO DATAFOLD_AIRFLOW{{ params.schema_name_postfix }}.{{ params.table_name }}
(id, name, species, weight, length, hobby)
VALUES
(1, 'Bruno', 'American Black Bear', 299, 6.5, 'Fishing'),
(2, 'Honey', 'Grizzly Bear', 900, 8.2, 'Hiking'),
(3, 'Teddy', 'Polar Bear', 1100, 9.5, 'Swimming'),
(4, 'Cubby', 'Brown Bear', 700, 7.9, 'Berry Picking'),
(5, 'Munch', 'Kodiak Bear', 1500, 9.0, 'Salmon Fishing'),
(6, 'BamBam', 'Panda Bear', 300, 5.5, 'Bamboo Eating'),
(7, 'Smokey', 'Sloth Bear', 250, 6.2, 'Ant Eating'),
(8, 'Sunny', 'Sun Bear', 100, 4.3, 'Tree Climbing'),
(10, 'Specs', 'Spectacled Bear', 200, 5.7, 'Plant Eating');