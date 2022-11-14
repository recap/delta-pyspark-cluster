# -- Software Stack Version

SPARK_VERSION="3.2.0"
HADOOP_VERSION="3.2"
JUPYTERLAB_VERSION="2.1.5"
DELTACORE_VERSION="2.0.0"
SCALA_VERSION="2.12"

# -- Building the Images

docker build \
  -f cluster-base/Dockerfile \
  -t cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  --build-arg deltacore_version="${DELTACORE_VERSION}" \
  --build-arg scala_version="${SCALA_VERSION}" \
  -f spark-base/Dockerfile \
  -t spark-base .

docker build \
  -f spark-master/Dockerfile \
  -t spark-master .

docker build \
  -f spark-worker/Dockerfile \
  -t spark-worker .

docker build \
  -f spark-standalone/Dockerfile \
  -t spark-standalone .

#docker build \
#  --build-arg spark_version="${SPARK_VERSION}" \
#  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
#  -f jupyterlab/Dockerfile \
#  -t jupyterlab .
