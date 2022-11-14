FROM spark-base

# -- Runtime

ARG spark_master_web_ui=8080

ENV PATH=$PATH:$SPARK_HOME/bin
EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out
