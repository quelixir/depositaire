FROM python:alpine3.13

ENV POETRY_VERSION="1.1.6"

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache --update cargo gcc g++ libffi-dev make openssl-dev python3-dev rust

RUN pip install --ignore-installed "poetry==${POETRY_VERSION}"

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

CMD [ "poetry", "run", "python -m flask run" ]
