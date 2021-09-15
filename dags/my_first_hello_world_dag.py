from airflow import DAG
from datetime import datetime, timedelta
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator

from airflow.utils.dates import days_ago

def add(x1, x2):
    return(x1+x2)

def print_hello():
    print("Hello world from python")
    

default_args = {
    'start_date': days_ago(1),
}
str_bash_print = datetime.today().strftime("%Y-%m-%d")



dag = DAG(
    "my_first_hello_world_dag",
    default_args=default_args,
    schedule_interval="@once"
)

t1 = BashOperator(
    task_id='bash',
    bash_command=f'echo "{str_bash_print} Hello world"',   
    dag=dag
)

t2 = PythonOperator(
    task_id='python',
    python_callable=print_hello,
    dag = dag   
)
t3 = BashOperator(
    task_id='bash',
    bash_command='echo "today I will make simple add function example"',
    dag=dag
)

t4 = PythonOperator(
    task_id='python',
    python_callable=add,
    op_kwargs={"x1":10, "x2":20},
    dag=dag
)

t1 >> t2 >> t3 >> t4