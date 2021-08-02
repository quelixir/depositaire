<img src="depositaire/static/logo.png" alt="Depositaire Logo" width="350" />

[![Made with Python](https://img.shields.io/badge/made%20with-Python-red?style=flat-square)](https://www.python.org/) [![GPL-3.0](https://img.shields.io/github/license/quelixir/depositaire?style=flat-square)](https://github.com/quelixir/depositaire/blob/main/LICENSE) [![codecov](https://img.shields.io/codecov/c/gh/quelixir/depositaire?style=flat-square)](https://codecov.io/gh/quelixir/depositaire)

_A share registrar solution for the 21st century._

## Getting started

### Bare metal

```bash
$ git clone https://github.com/quelixir/depositaire
$ cd depositaire
$ poetry install
$ poetry run python -m flask run
```

### Docker

```bash
$ docker run --detach \
  --env DEPOSITAIRE_DB_HOST="<mariadb_server_ip>" \
  --env DEPOSITAIRE_DB_PORT="3306" \
  --env DEPOSITAIRE_DB_USER="root" \
  --env DEPOSITAIRE_DB_PASS="" \
  --env DEPOSITAIRE_DB_NAME="depositaire" \
  --name depositaire \
  --publish 80:5000 \
  --restart=unless-stopped \
  quelixir/depositaire:latest

# Alternatively, use ghcr.io:
  ghcr.io/quelixir/depositaire:latest
```

## Creating a SQLite database file

```bash
grep -Ev "START TRANSACTION;|COMMIT;" depositaire.sql | sqlite3 depositaire.sqlite
```

## License

This project is licensed under the GNU General Public License v3.0. For more details, see the [LICENSE](LICENSE) file.

Made with :heart: by <a href="https://github.com/quelixir" target="_blank">Nick Schlobohm</a>
