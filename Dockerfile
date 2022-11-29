FROM gcr.io/kaggle-gpu-images/python:v122

WORKDIR /ml-docker/working
COPY ./artifact/jupyter_lab_config.py /ml-docker/.

RUN mkdir -p /ml-docker
COPY ./artifact/requirements.txt /ml-docker/.
RUN pip install -U pip && pip install -r /ml-docker/requirements.txt
RUN pip freeze >| /ml-docker/requirements.lock
