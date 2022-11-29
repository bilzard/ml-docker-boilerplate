FROM gcr.io/kaggle-gpu-images/python:v122

WORKDIR /ml-docker/working
COPY ./artifact/jupyter_lab_config.py /ml-docker/.

RUN pip install -U pip && pip install \
    fastprogress \
    japanize-matplotlib \
    nb-black \
    jupyterlab_materialdarker

RUN pip freeze >| /ml-docker/working/requirements.lock