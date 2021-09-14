airflow db init

airflow user create \
    --username admin \
    --firstname dh \
    --lastname kim \
    --role Admin \
    --email bigtiger.tech@gmail.com


# airflow webserver --port 8080
# airflow webserver -D # daemon option
# airflow scheduler -D # daemon option

# find airflow.cfg -> check dags directory
# change dag directory to ./dags 
