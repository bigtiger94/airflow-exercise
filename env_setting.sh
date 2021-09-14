CONDA_ENV_NAME=airflow-exercise
PYTHON_VER=3.6.10
AIRFLOW_VER=2.1.0
echo "conda acrivate" ~/.bash_profile


conda create -n "${CONDA_ENV_NAME}" python=="${PYTHON_VER}" -y

source ~/anaconda3/etc/profile.d/conda.sh
conda activate "${CONDA_ENV_NAME}"

# CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VER}/constraints-${PYTHON_VER}.txt"

pip install -r requirements.txt

pip install "apache-airflow==${AIRFLOW_VER}" # --constraint "${CONSTRAINT_URL}"

pip install apache-airflow['cncf.kubernetes']