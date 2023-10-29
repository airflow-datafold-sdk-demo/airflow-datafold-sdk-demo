from airflow import DAG
from airflow.models.baseoperator import chain
from airflow.operators.empty import EmptyOperator
from airflow.providers.common.sql.operators.sql import (
    SQLColumnCheckOperator,
    SQLTableCheckOperator,
)
from airflow.providers.snowflake.operators.snowflake import SnowflakeOperator
from pendulum import datetime
from airflow.utils.task_group import TaskGroup

PROD_DAG_SCHEDULE="*/35 * * * *"
CREATE_PR_SCHEMA = """
    CREATE SCHEMA IF NOT EXISTS DATAFOLD_AIRFLOW{{ params.schema_name_postfix }};
"""

SNOWFLAKE_CONN_ID = "snowflake_default"

with DAG(
    "datafold_mwaa",
    description="""
        Example DAG showcasing loading, transforming, 
        and data quality checking with multiple datasets in Snowflake.
    """,
    doc_md=__doc__,
    start_date=datetime(2022, 12, 1),
   # schedule_interval=PROD_DAG_SCHEDULE,
    catchup=False,
) as dag:
    
    """
    #### Snowflake schema creation
    Create the PR schema to store data specific to this PR.
    """
    create_pr_schema = SnowflakeOperator(
        task_id="create_pr_schema",
        sql=CREATE_PR_SCHEMA,
        params={
            "schema_name_postfix":"" # The postfix is added to the production schema name
            },
    )

    """
    #### Snowflake tables creation
    Create the tables to store sample data.
    """
    create_forestfires_table = SnowflakeOperator(
        task_id="create_forestfires_table",
        sql='forestfires.sql',
        params={
            "table_name": "forestfires", # Eventually, this should be replaced by some non-value.
            "schema_name_postfix":"" # The postfix is added to the production schema name
            }, 
    )
    create_bears_table = SnowflakeOperator(
        task_id="create_bears_table",
        sql='bears.sql',
        params={
            "table_name": "bears", 
            "schema_name_postfix":"" # The postfix is added to the production schema name
            }, 
    )
    create_squirrels_table = SnowflakeOperator(
        task_id="create_squirrels_table",
        sql='squirrels.sql',
        params={
            "table_name": "squirrels", 
            "schema_name_postfix":"" # The postfix is added to the production schema name
            }, 
    )
    create_top_squirrels_table = SnowflakeOperator(
        task_id="create_top_squirrels_table",
        sql='top_squirrels.sql',
        params={
            "table_name": "top_squirrels", 
            "schema_name_postfix":"" # The postfix is added to the production schema name
            }, 
    )
    begin = EmptyOperator(task_id="begin")
    end = EmptyOperator(task_id="end")

    chain(
        begin,
        create_pr_schema,
        [create_forestfires_table,create_bears_table,create_squirrels_table],
        create_top_squirrels_table,
        end,
    )
    