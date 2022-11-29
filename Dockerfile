FROM gcr.io/kaggle-gpu-images/python:v122

WORKDIR /ml-docker/working
RUN mkdir -p /ml-docker/input
COPY ./artifact/jupyter_lab_config.py /ml-docker/.

RUN pip install -U pip && pip install \
    fastprogress \
    japanize-matplotlib \
    nb-black \
    jupyterlab_materialdarker

