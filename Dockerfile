FROM alpine:3.13.5

ENV POETRY_VERSION="1.1.6"

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache --update python3 python3-dev py3-pip \
    cargo gcc g++ libffi-dev make openssl-dev rust

RUN pip install --ignore-installed "poetry==${POETRY_VERSION}"

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

CMD [ "poetry", "run", "flask run" ]
