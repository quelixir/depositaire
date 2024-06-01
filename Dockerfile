FROM alpine:latest

ENV POETRY_VERSION="1.8.0"

ENV DEPOSITAIRE_DB_TYPE="SQLITE"
ENV DEPOSITAIRE_DB_FILE="depositaire.sqlite"

EXPOSE 5000/tcp

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache --update \
        bash \
        python3 \
        py3-pip \
        sqlite \
    && rm -rf ~/.cache/* /usr/local/share/man /tmp/*  

RUN grep -Ev "START TRANSACTION;|COMMIT;" depositaire.sql | sqlite3 depositaire.sqlite

RUN python3 -m pip install --user pipx \
    && pipx install --ignore-installed "poetry==${POETRY_VERSION}"

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

CMD ["poetry", "run", "flask", "run", "--host", "0.0.0.0"]
