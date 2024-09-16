FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    curl \
    vim \
    git

WORKDIR /app

COPY . /app

CMD ["bash", "conda activate superlists"]
