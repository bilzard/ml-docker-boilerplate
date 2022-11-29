FROM gcr.io/kaggle-gpu-images/python:v122

WORKDIR /ml-docker/working
COPY ./artifact/jupyter_lab_config.py /ml-docker/.

RUN pip install -U pip && pip install \
    fastprogress \
    japanize-matplotlib \
    nb-black \
    jupyterlab_materialdarker

RUN mkdir -p /ml-docker
RUN pip freeze >| /ml-docker/requirements.lock
