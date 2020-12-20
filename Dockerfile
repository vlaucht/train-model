FROM nvidia/cuda

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.8 python3-pip python3-setuptools python3-dev

WORKDIR /src

COPY requirements.txt ./requirements.txt

RUN python3.8 -m pip install --no-cache-dir -r requirements.txt

COPY . /src

CMD ["main.py"]
ENTRYPOINT ["python3"]