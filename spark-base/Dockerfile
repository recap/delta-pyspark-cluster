FROM cluster-base

# -- Layer: Apache Spark

ARG spark_version=3.0.0
ARG hadoop_version=2.7
ARG scala_version=2.12
ARG deltacore_version=2.1.1
ARG spark_home=/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}

RUN apt-get update -y && \
    apt-get install -y curl && \
    curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz

RUN echo 'spark.jars.packages io.delta:delta-core_'${scala_version}:${deltacore_version} > ${spark_home}/conf/spark-defaults.conf
RUN echo 'spark.sql.extensions io.delta.sql.DeltaSparkSessionExtension' >> ${spark_home}/conf/spark-defaults.conf
RUN echo 'spark.sql.catalog.spark_catalog org.apache.spark.sql.delta.catalog.DeltaCatalog' >> ${spark_home}/conf/spark-defaults.conf

ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

# -- Runtime

WORKDIR ${SPARK_HOME}
