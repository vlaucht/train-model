FROM nvidia/cuda

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.8 python3-pip gcc libpq-dev python3-setuptools python3-dev



COPY ./requirements.txt /code/requirements.txt
WORKDIR /code
COPY ./logs/ /code/logs
COPY ./model_fine/ /code/model_fine
COPY ./main.py /code/main.py

RUN python3.8 -m pip install --no-cache-dir -r requirements.txt

CMD ["main.py"]
ENTRYPOINT ["python3"]