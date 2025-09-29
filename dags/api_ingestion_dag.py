
from __future__ import annotations

import pendulum

from airflow.models.dag import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator

def process_data():
    import json

    with open('/tmp/users.json', 'r') as f:
        users = json.load(f)
        print(f"Successfully processed {len(users)} users.")

    with open('/tmp/posts.json', 'r') as f:
        posts = json.load(f)
        print(f"Successfully processed {len(posts)} posts.")

with DAG(
    dag_id="api_ingestion_dag",
    start_date=pendulum.datetime(2023, 1, 1, tz="UTC"),
    catchup=False,
    schedule=None,
    tags=["example"],
) as dag:
    fetch_users_task = BashOperator(
        task_id="fetch_users",
        bash_command="curl -o /tmp/users.json https://jsonplaceholder.typicode.com/users",
    )

    fetch_posts_task = BashOperator(
        task_id="fetch_posts",
        bash_command="curl -o /tmp/posts.json https://jsonplaceholder.typicode.com/posts",
    )

    process_data_task = PythonOperator(
        task_id="process_data",
        python_callable=process_data,
    )

    [fetch_users_task, fetch_posts_task] >> process_data_task
