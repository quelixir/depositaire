FROM python:3.9.6-buster

ENV POETRY_VERSION="1.1.6"

ENV DEPOSITAIRE_DB_TYPE="SQLITE"
ENV DEPOSITAIRE_DB_FILE="depositaire.sqlite"

EXPOSE 5000/tcp

WORKDIR /usr/src/app

COPY . .

RUN grep -Ev "START TRANSACTION;|COMMIT;" depositaire.sql | sqlite3 depositaire.sqlite

RUN pip install --ignore-installed "poetry==${POETRY_VERSION}"

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

CMD ["poetry", "run", "flask", "run", "--host", "0.0.0.0"]
