# Depositaire

[![Made with Python](https://img.shields.io/badge/made%20with-Python-red?style=flat-square)](https://www.python.org/) [![MIT License](https://img.shields.io/github/license/quelixir/depositaire?style=flat-square)](https://github.com/quelixir/depositaire/blob/main/LICENSE)

_A share registrar solution for the 21st century._

## Getting started

```bash
$ git clone https://github.com/quelixir/depositaire
$ cd depositaire
$ poetry install
$ poetry run python -m flask run
```

## Useful commands for local development
```bash
$ docker run --name mysql -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -d mysql:8.0.1
$ docker run --name phpmyadmin -d --link mysql:db -p 8081:80 phpmyadmin/phpmyadmin
```

## License

This project is licensed under the GNU General Public License v3.0. For more details, see the [LICENSE](LICENSE) file.

Made with :heart: by <a href="https://github.com/quelixir" target="_blank">Nick Schlobohm</a>
